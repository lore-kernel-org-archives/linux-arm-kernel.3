Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37432CCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 16:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tP+Yk8vpAFXW9U6o/r9+ksJDWbbYd+rG3XMJ0zpQT18=; b=WwLkM+xgniZVyThT3eQHI8As2a
	74d+mBtLk2i+GUpRIL0zxoTeddde34gpxMmhoiXkb1TU4I1SdVaL3vCODfIzxYj0q0OSU403x7cZ1
	Q7IebadjguadJNp5Rme8155828Ikcn59RU9mrAHRHEnLTTYgED+mLL6z+/w7cQxcHmTe6pIz+orpj
	/zvslYBFmndpSuMmM1IQpBogfD5nYDozpTVwqdEBFFP1TbjhN+gR2Z5R5JWorL6AEkImBx7jwhy6J
	Q1iCw39mWoy8KsCcWOY9STlGwD4ZNwMQm1swXdUM/UoXl+/5YoUapYvV5UpfT35zb0fv8xrQkXMzn
	YHMh6cLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsmT-0000000EJfi-1mit;
	Mon, 20 Oct 2025 16:30:45 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAsmR-0000000EJf9-33TN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 16:30:45 +0000
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cr16n6Yjrz6L5Xx;
	Tue, 21 Oct 2025 00:27:29 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 4EA82140275;
	Tue, 21 Oct 2025 00:30:37 +0800 (CST)
Received: from localhost (10.48.157.75) by dubpeml100005.china.huawei.com
 (7.214.146.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 20 Oct
 2025 17:30:36 +0100
Date: Mon, 20 Oct 2025 17:30:34 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Cristian Marussi <cristian.marussi@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<arm-scmi@vger.kernel.org>, <sudeep.holla@arm.com>,
	<james.quinlan@broadcom.com>, <f.fainelli@gmail.com>,
	<vincent.guittot@linaro.org>, <etienne.carriere@st.com>,
	<peng.fan@oss.nxp.com>, <michal.simek@amd.com>, <quic_sibis@quicinc.com>,
	<dan.carpenter@linaro.org>, <d-gole@ti.com>, <souvik.chakravarty@arm.com>
Subject: Re: [PATCH 07/10] firmware: arm_scmi: Add System Telemetry ioctls
 support
Message-ID: <20251020173034.00005c15@huawei.com>
In-Reply-To: <20250925203554.482371-8-cristian.marussi@arm.com>
References: <20250925203554.482371-1-cristian.marussi@arm.com>
	<20250925203554.482371-8-cristian.marussi@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.157.75]
X-ClientProxiedBy: lhrpeml500011.china.huawei.com (7.191.174.215) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_093044_076204_54E7F61E 
X-CRM114-Status: GOOD (  16.29  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, 25 Sep 2025 21:35:51 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Extend the filesystem based interface with special 'control' file that can
> be used to configure and retrieve SCMI Telemetry data in binary form using
> the alternative ioctls-based ABI described in uapi/linux/scmi.h.
Why you say alternative.  Why do you need both?

That's in the cover letter but I'd put something here as well.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> ---
>  .../firmware/arm_scmi/scmi_system_telemetry.c | 402 ++++++++++++++++++
>  1 file changed, 402 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/scmi_system_telemetry.c b/drivers/firmware/arm_scmi/scmi_system_telemetry.c
> index 2fec465b0f33..f591aad10302 100644
> --- a/drivers/firmware/arm_scmi/scmi_system_telemetry.c
> +++ b/drivers/firmware/arm_scmi/scmi_system_telemetry.c

> +static long scmi_tlm_des_read_ioctl(const struct scmi_tlm_inode *tlmi,
> +				    unsigned long arg, bool single,
> +				    bool is_group)
> +{
> +	const struct scmi_tlm_setup *tsp = tlmi->tsp;
> +	void * __user uptr = (void * __user)arg;
> +	struct scmi_tlm_data_read bulk, *bulk_ptr;
> +	int ret, grp_id = SCMI_TLM_GRP_INVALID;
> +
> +	if (copy_from_user(&bulk, uptr, sizeof(bulk)))
> +		return -EFAULT;
> +
> +	bulk_ptr = kzalloc(struct_size(bulk_ptr, samples, bulk.num_samples),

__free() would help here.

> +			   GFP_KERNEL);
> +	if (!bulk_ptr)
> +		return -ENOMEM;
> +
> +	if (is_group) {
> +		const struct scmi_telemetry_group *grp = tlmi->priv;
> +
> +		grp_id = grp->info->id;
> +	}
> +
> +	bulk_ptr->num_samples = bulk.num_samples;
> +	if (!single)
> +		ret = tsp->ops->des_bulk_read(tsp->ph, grp_id,
> +					      &bulk_ptr->num_samples,
> +			  (struct scmi_telemetry_de_sample *)bulk_ptr->samples);
> +	else
> +		ret = tsp->ops->des_sample_get(tsp->ph, grp_id,
> +					       &bulk_ptr->num_samples,
> +			  (struct scmi_telemetry_de_sample *)bulk_ptr->samples);

That is very unusual code alignment.  Drag 2 lines above left to match one line above.

> +	if (ret)
> +		goto out;
> +
> +	if (copy_to_user(uptr, bulk_ptr, sizeof(*bulk_ptr) +
> +			 bulk_ptr->num_samples * sizeof(bulk_ptr->samples[0])))
> +		ret = -EFAULT;
> +
> +out:
> +	kfree(bulk_ptr);
> +
> +	return ret;
> +}


