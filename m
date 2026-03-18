Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5C7103E160
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 11:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0ewtV7e9D9vKhEhfzUdBei0DQY1BrParxSdICW7Jgk=; b=MM8PZhCROY8TR4H3xvPA+GMGYz
	92SCq7mpmOPokXdzyvwLJtsD6J6aKnsIWacdC9sZERBr6sQeTU+3f7kIST4uS7kkmcJBLoqHkS+si
	5plMbdwOCiPsiEObQuwzvlgeqIGvc1gC5drydFLhOCQe7mDVaRCpUNnDNBClzmmXpDNrifOCVhgZi
	PaNofIHYWojRLKERXXKkwtek6PrVhPKuP6j07dH5VFysOFyXGYC78qb8fVjb8llfKFu5YjwNYwGkq
	RjgYxKeIxVspKB5pGv5KgZRwaDl9Ecn8mO733my6+AIN2Z91VFDNmgn6bcfVHqp2dM5UuvUjwVkwD
	JeXpSXJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2oku-00000008HK5-2weV;
	Wed, 18 Mar 2026 11:08:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2okq-00000008HJ6-3mes
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 11:08:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 868D21E2F;
	Wed, 18 Mar 2026 04:07:53 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 44E783F73B;
	Wed, 18 Mar 2026 04:07:57 -0700 (PDT)
Date: Wed, 18 Mar 2026 11:07:46 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: Re: [PATCH v4 5/7] arm_scmi: pinctrl: allow PINCTRL_REQUEST to
 return EOPNOTSUPP
Message-ID: <abqHgv92El36JqnK@pluto>
References: <cover.1773757772.git.dan.carpenter@linaro.org>
 <aee820fd35412fc8679558e7df4a912f1fe27f5f.1773757772.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aee820fd35412fc8679558e7df4a912f1fe27f5f.1773757772.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_040801_825218_5DC3523F 
X-CRM114-Status: GOOD (  14.31  )
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

On Tue, Mar 17, 2026 at 05:40:50PM +0300, Dan Carpenter wrote:
> The SCMI protocol specification says that the PINCTRL_REQUEST and
> PINCTRL_RELEASE commands are optional.  So if the SCMI server returns
> -EOPNOTSUPP, then treat that as success and continue.

Hi

a nitpick, this should be

	firmware: arm_scmi: Allow PINCTRL_REQUEST to return EOPNOTSUPP

Thanks,
Cristian

> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>  drivers/firmware/arm_scmi/pinctrl.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
> index a020e23d7c49..42cb1aef1fe1 100644
> --- a/drivers/firmware/arm_scmi/pinctrl.c
> +++ b/drivers/firmware/arm_scmi/pinctrl.c
> @@ -578,6 +578,8 @@ static int scmi_pinctrl_request_free(const struct scmi_protocol_handle *ph,
>  	tx->flags = cpu_to_le32(type);
>  
>  	ret = ph->xops->do_xfer(ph, t);
> +	if (ret == -EOPNOTSUPP)
> +		ret = 0;
>  	ph->xops->xfer_put(ph, t);
>  
>  	return ret;
> -- 
> 2.51.0
> 

