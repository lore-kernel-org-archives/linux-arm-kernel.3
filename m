Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDC41C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 20:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KLgjpNYs0v7y/M6BplhBL8vKBHGRufOgWeRkV8k6M4=; b=oxT7zdF7UQLw0uMbrJ811+wcjX
	PWUgQQZ6/aAP4Ryq7JxuaLNqpS6cnDBXk/vqktgUe0Wv4z2v/tzo+Kta/DSgvksmmHYjjX3ajJXIR
	SQ+CtL7tfbS5T75kQn92Vg96cm0s3aXx/50xC4lLSiLnarfc4S86d6x1Jr5SELwngCNiID7n8gi63
	Py69Y+mrTxsBfuhM3wIvD2aNB6/RiEuybu+ppFYz2piyas4uVh23lT/p0XMK+VBWpXarYW8jW08NA
	wTRr1OW9j3nExoKm9uFK/YgWgTBY+kxJvCs4A43mVoVn2AYUaqgEvDZAfXrBpHik4lCmjM+7b2+O+
	GGtgckyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHYN-00000005eME-0miX;
	Fri, 10 Jul 2026 20:10:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiHYK-00000005eLr-0QtO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 20:10:29 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AK3FYV1621016
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 20:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8KLgjpNYs0v7y/M6BplhBL8vKBHGRufOgWeRkV8k6M4=; b=L0F1RjaQTs/zf29U
	20xWEckVJRTAOFZ95UYBN/j9z+RYiL4WMjs5DBR847fbcmUaVxH9XsVWgwXrYGZe
	gu/h9sc+t11fl2bNBF1k3DAzmbH/9BDCArix5phmA8r7RIEwp1D6YqkqKoNb5UZ3
	nO0YIllFmoFdYfcU49sKAGtekEb/hsUNJUYml9dLB2wRLTD/tHju5wcpvGqPNBtG
	3FVWIyXlL0ZnMc7emB+0vA4CazPLI8NrqrIT7RMUwhjW1ncfr34VN7Xy57ihbKWD
	dnq7Am8GtHDT34Muq77qw/zUKJ/FnZIINjDq8AmzvlRZ7Jv1K/57DPOhzaYcE+IQ
	6w13bQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fb4rm8m9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 20:10:27 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c889d1eedcdso1970331a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 13:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783714226; x=1784319026; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=8KLgjpNYs0v7y/M6BplhBL8vKBHGRufOgWeRkV8k6M4=;
        b=DMqHL+YnH1ea433rjfPdBBsTk6RyEzGGuw0Xn1BgiGnDP2ob8mK8AHbpuOiAgDJrO/
         jJkhbNMETucNsCneETQdYtZgx6x4b3lSMF4RjMbijDpVfHDyciHKpHq6ew3S98HHTyGa
         sj8lN60UAuYwTWTDYKnmTA9H9DlTLnHHKvqXn2/jqz6srM4kwWoT45Z8lw1u5BFVW6g4
         7cn5QQ7OHEm9WYS0JQ/u4ZLzkjDK5bvNRkOp88K/oQXYyQYZsSWGGypgBXJNcq1Ht5NO
         Pi9SZlfK3CTrQENEQlluKnWe5CE4WKlkSuaHWFkncZz95Kg+UG38hP5XQGh6QUOCucOX
         6GmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783714226; x=1784319026;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KLgjpNYs0v7y/M6BplhBL8vKBHGRufOgWeRkV8k6M4=;
        b=WjKxcyEPktQuDCB0bcuIuOce+bNetXwJ32yZ2AjdP8Wg+2flh9AYCJPBEpqOd8/VMS
         2DI4C0RADBsO67RNBSgQlcoeX/Bamght3urf3hLXRIICsh65DzwnMu+bPAa8ZqPg5T7R
         IBFI6JTa1YvJYfHlnN+XqH8HNaJeUlk9zLBXui2HRSahGfUQodmymgB6dXtR8OQl0W7J
         cvfmV3dtuOWUb8U0dZlKynVzTPf6ivZBzw/hlN8EWmOpJJZ/BfrCeiSY3YEPwn2n9Mcf
         nxqU0uAfwD+hCNO4LTrFpMOhiPWYV+8V4fe1spwKGGlpagtcE2AGBqJjPrYFvBYpNtBA
         KW8A==
X-Forwarded-Encrypted: i=1; AHgh+Ro7m/5gB0Dy9vVdwp/MUwYP15ZWLff3qDAWxQodopeWjzmPOMdDK3wzCW8HnS6Hdey5SyzufCrP9ibZFTIYC2G4@lists.infradead.org
X-Gm-Message-State: AOJu0YyON9DczMrb0S2Qdh4AvU2WGcxIYMaQ+4V4Qfjn7KsFj8mpbLfa
	ajEZNZfLyTL5NlYi0Xf3ydhwgSOrsVIS7Fgat9lheL5hD6sslj0iiZEXhDSuBJaarsV817WcCvx
	2Hs5+TiWBDFSsKa6MJ9KHUq6qzm2eSX7/B65zyt5DrY5NA+yEGSl318clbXTnJgYTO6O49aoQfH
	LeVg==
X-Gm-Gg: AfdE7ckw6oILVGkSgrS3BJN479MvgUuhAFOnt69ZoNNroMQcTyGRvnpP/dZPizYA9hh
	KEN6IdPPLAHKrn5FN4CssvvOLMFHTEOvp+wWTsQaWwy7dyzoVHV2/Xfh9aYjlYGkFK92QuRORF3
	i2k6CAHJLtyi/SsYKb7x7ZkfISTASlXCJAkG2sS5ad10/xJyYrqKITSOQQTfCBF0sKpwhZDDrig
	iMDlQut2niRAe02c9DPXhidncyCFoHkeahSzMMruhflXvSd+3cpPaJPbm12FtRkRh5olqTEZI20
	HjNR9Nu85wWakXYUBsuCHJb5vouD+v/v9bFS5zaEXd9W+ng4VxL2wT+h0kQilfaZuIiWkacEncm
	m619kVda/jyHJlLPq4A8sSEhkwi1xLISPC7oz
X-Received: by 2002:a05:6a20:9190:b0:3bf:e2f1:1b12 with SMTP id adf61e73a8af0-3c110bdfb14mr484461637.41.1783714226273;
        Fri, 10 Jul 2026 13:10:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:9190:b0:3bf:e2f1:1b12 with SMTP id adf61e73a8af0-3c110bdfb14mr484429637.41.1783714225814;
        Fri, 10 Jul 2026 13:10:25 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm50867465c88.7.2026.07.10.13.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 13:10:25 -0700 (PDT)
Date: Fri, 10 Jul 2026 13:10:21 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Hanjun Guo
 <guohanjun@huawei.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Catalin
 Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        "Rafael J
 . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        James Morse
 <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Reinette Chatre
 <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan
 Cameron <jic23@kernel.org>,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Ganapatrao Kulkarni
 <ganapatrao.kulkarni@oss.qualcomm.com>,
        Trilok Soni <tsoni@quicinc.com>,
        Srinivas Ramana <sramana@qti.qualcomm.com>,
        Niyas Sait
 <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 16/16] arm_mpam: detect and enable MPAM-Fb PCC
 support
Message-ID: <20260710131021.0000361d@oss.qualcomm.com>
In-Reply-To: <20260710144520.917375-17-andre.przywara@arm.com>
References: <20260710144520.917375-1-andre.przywara@arm.com>
	<20260710144520.917375-17-andre.przywara@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4fhx9G0YQnObOGIP_dqHsPkIfPIJsysl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDIwMiBTYWx0ZWRfX9H5a18oJWK3L
 MjhSHDo7FmOeFOJ44zbDKqo09CT4jaSguTp/Wm27WHScwFp8wVJQjzSB3ynCmoctQu3vTQgHbur
 3Ii53iK1IQgJmT14uDuPjj2hiUCJqw/2/cEmr21RKUE6V8Fp/ArqdKMulbvbIUJEoIruXR9CW55
 c+8jHUsuPE6cMGooqLYjdnaRovenB56jsqRNumq/FnNWw534ZWGBMuLUDq6gaH4vsRlhQ/O+L9P
 zsh8L2EPEIOaLcVKxLgDB2/qrZpqTWNxy4mfQJ3Aq1zd6q3+IO2MeIWHD8ejZCIYR7/UOVWgT7g
 /HWnNsuJLVRG57sR2rRKPjQLKmSSlv0/I9iSZIECPIk16VcS8KsQLFj+J6reZ52bXjDPK1T7oVa
 tSvnRB99f5Ypi/x9oWHOYYiPKKEZeRsujsjRw0NcwQJ6feTnAXteKo3tUP/hXUvhb1pq1Xd6VRO
 JgV9c5PXI67by+mg7Gg==
X-Authority-Analysis: v=2.4 cv=JIYLdcKb c=1 sm=1 tr=0 ts=6a5151b3 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=Pap8kj84UmTLi3EEo9EA:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: 4fhx9G0YQnObOGIP_dqHsPkIfPIJsysl
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDIwMiBTYWx0ZWRfX4VTAM0XmH20m
 da2I6rINQXTh4HrVXikx3jSOI/3cMIkDVVN0xdDqkszdo/nCmc+tlmcU4SGfaTljJF7Vn4S76Up
 UTqOZMuc4kbIi7xy58s8ZXrPACeuL6Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_131028_178507_6067AFAE 
X-CRM114-Status: GOOD (  37.23  )
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

On Fri, 10 Jul 2026 16:45:20 +0200
Andre Przywara <andre.przywara@arm.com> wrote:

> The Arm MPAM-Fb specification [1] describes a protocol to access MSC
> registers through a firmware interface. This requires a shared memory
> region to hold the message, and a mailbox to trigger the access.
> For ACPI this is wrapped as a PCC channel, described using existing
> ACPI abstractions.
> 
> Add code to parse those PCC table descriptions associated with an MSC,
> and store the parsed information in the MSC struct.
> There can be multiple PCC channels, and each channel can serve multiple
> MSCs, so we need to keep track of the channel usage, using a list and
> a refcount.
> This will be used by the MPAM-Fb access wrapper code.
> 
> [1] https://developer.arm.com/documentation/den0144/latest
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Hi Andre,

A few things inline.

Thanks,

Jonathan

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 220b4a06e739..7be98f13dd63 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -19,6 +19,7 @@
>  #include <linux/irqdesc.h>
>  #include <linux/list.h>
>  #include <linux/lockdep.h>
> +#include <linux/mailbox_client.h>
>  #include <linux/mutex.h>
>  #include <linux/platform_device.h>
>  #include <linux/printk.h>
> @@ -27,6 +28,9 @@
>  #include <linux/types.h>
>  #include <linux/workqueue.h>
>  
> +#include <acpi/pcc.h>
> +#include <acpi/acpi_io.h>
> +
>  #include "mpam_internal.h"
>  
>  /* Values for the T241 errata workaround */
> @@ -49,6 +53,88 @@ static LIST_HEAD(mpam_all_msc);
>  
>  struct srcu_struct mpam_srcu;
>  
> +/* PCC channels might be serving multiple MSCs, so keep a refcounted list. */
> +static DEFINE_MUTEX(pcc_chan_list_lock);
> +static LIST_HEAD(pcc_chan_list);
> +
> +static void mpam_pcc_rx_callback(struct mbox_client *cl, void *msg)
> +{
> +	/* TODO: wake up tasks blocked on this MSC's PCC channel */

That sounds like as significant todo. Does it matter for now?

> +}
> +
> +static struct mpam_pcc_chan *mpam_pcc_chan_get(struct device *dev,
> +					       int subspace_id)
> +{
> +	struct mpam_pcc_chan *cur;
> +
> +	mutex_lock(&pcc_chan_list_lock);

guard()

> +
> +	list_for_each_entry(cur, &pcc_chan_list, pcc_chans) {
> +		if (cur->subspace_id == subspace_id) {
> +			cur->refcount++;
> +			mutex_unlock(&pcc_chan_list_lock);
> +
> +			return cur;
> +		}
> +	}
> +
> +	cur = kzalloc_obj(*cur);
> +	if (!cur) {
> +		mutex_unlock(&pcc_chan_list_lock);
> +		return ERR_PTR(-ENOMEM);
> +	}
> +
> +	cur->pcc_cl.dev = dev;
> +	cur->pcc_cl.rx_callback = mpam_pcc_rx_callback;
> +	cur->pcc_cl.tx_block = true;
> +	cur->pcc_cl.tx_tout = 1000; /* 1s */
> +
> +	cur->pcc_chan = pcc_mbox_request_channel(&cur->pcc_cl, subspace_id);
> +	if (IS_ERR(cur->pcc_chan)) {
> +		long err = PTR_ERR(cur->pcc_chan);
> +
> +		kfree(cur);
> +		mutex_unlock(&pcc_chan_list_lock);
> +		return ERR_PTR(err);
> +	}
> +
> +	mutex_init(&cur->pcc_chan_lock);
> +	cur->subspace_id = subspace_id;
> +	cur->refcount = 1;
> +
> +	list_add_tail(&cur->pcc_chans, &pcc_chan_list);
> +
> +	mutex_unlock(&pcc_chan_list_lock);
> +
> +	return cur;
> +}
> +
> +static int mpam_pcc_chan_put(struct mpam_pcc_chan *pcc_chan)
> +{
> +	struct mpam_pcc_chan *cur, *tmp;
> +
> +	if (!pcc_chan)
> +		return 0;
> +
> +	mutex_lock(&pcc_chan_list_lock);

guard()

> +
> +	list_for_each_entry_safe(cur, tmp, &pcc_chan_list, pcc_chans) {
> +		if (cur == pcc_chan) {
> +			if (!--cur->refcount) {

Maybe embed a kref_t? Then release. As much as anything acts as documentation
that this is reference counting.

> +				pcc_mbox_free_channel(cur->pcc_chan);
> +				list_del(&pcc_chan->pcc_chans);
> +				kfree(cur);
> +			}
> +			mutex_unlock(&pcc_chan_list_lock);
> +			return 0;
> +		}
> +	}
> +
> +	mutex_unlock(&pcc_chan_list_lock);
> +
> +	return -ENOENT;
> +}
> +
>  /*
>   * Number of MSCs that have been probed. Once all MSCs have been probed MPAM
>   * can be enabled.
> @@ -2208,6 +2294,8 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
>  {
>  	struct mpam_msc *msc = platform_get_drvdata(pdev);
>  
> +	mpam_pcc_chan_put(msc->pcc_chan);
> +
>  	mutex_lock(&mpam_list_lock);
>  	mpam_msc_destroy(msc);
>  	mutex_unlock(&mpam_list_lock);
> @@ -2218,7 +2306,7 @@ static void mpam_msc_drv_remove(struct platform_device *pdev)
>  static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>  {
>  	int err;
> -	u32 tmp;
> +	u32 pcc_subspace_id;
>  	struct mpam_msc *msc;
>  	struct resource *msc_res;
>  	struct device *dev = &pdev->dev;
> @@ -2263,7 +2351,8 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>  	if (err)
>  		return ERR_PTR(err);
>  
> -	if (device_property_read_u32(&pdev->dev, "pcc-channel", &tmp))
> +	if (device_property_read_u32(&pdev->dev, "pcc-channel",
> +				     &pcc_subspace_id))
>  		msc->iface = MPAM_IFACE_MMIO;
>  	else
>  		msc->iface = MPAM_IFACE_PCC;
> @@ -2279,6 +2368,39 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>  		}
>  		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
>  		mcc->mapped_hwpage = io;
> +	} else if (msc->iface == MPAM_IFACE_PCC) {
> +		u32 msc_id;
> +		int ret;
> +
> +		if (device_property_read_u32(&pdev->dev, "msc-id", &msc_id)) {

earlier patch included of.h, should have been property.h given quite correctly
you are using the generic firmware accessors.

> +			pr_err("missing MPAM-Fb MSC identifier\n");
> +			return ERR_PTR(-EINVAL);
> +		}
> +		msc->mpam_fb_msc_id = msc_id;
> +
> +		msc->pcc_chan = mpam_pcc_chan_get(&pdev->dev, pcc_subspace_id);
> +		if (IS_ERR(msc->pcc_chan)) {
> +			pr_err("Failed to request MSC PCC channel\n");
> +			return (void *)msc->pcc_chan;

ERR_CAST()

> +		}
> +
> +		if (msc->pcc_chan->pcc_chan->shmem_size < MPAM_FB_MAX_MSG_SIZE) {
> +			pr_err("MPAM-Fb PCC channel size too small.\n");
> +			mpam_pcc_chan_put(msc->pcc_chan);
> +			return ERR_PTR(-ENOMEM);
> +		}

Blank line here as next bit is unrelated to the bit above.

> +		ret = mpam_fb_get_protocol_version(msc);
> +		if (ret < 0) {
> +			pr_err("Cannot query MPAM-Fb protocol version.\n");
> +			mpam_pcc_chan_put(msc->pcc_chan);
> +			return ERR_PTR(-EIO);
If there is a good reason to eat the error code, then add a comment. If not.
			return ERR_PTR(ret);

> +		}
> +		if ((ret >> 16) != 1) {
> +			pr_err("Incompatible MPAM-Fb protocol version %d.%d\n",
> +			       ret >> 16, ret & 0xffff);
> +			mpam_pcc_chan_put(msc->pcc_chan);
> +			return ERR_PTR(-EINVAL);
> +		}
>  	} else {
>  		return ERR_PTR(-EINVAL);
>  	}


