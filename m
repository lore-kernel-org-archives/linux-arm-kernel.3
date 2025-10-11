Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61ADCCD185
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 00:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lIlfbEXPKt6sFk0wdJ6sW30Wwfmnzd3I5ezJv51ZMpc=; b=AakVr6gLy/Rf5CYjSovbOvQJIh
	i0o/jBoanPn2w5iQfdIJZ1PqLMk4WrMdHEjN5KiBjSwiVbmDTusEK7n61WEIn9MU1DeR3FlPhvbAQ
	/45Gjw1htXTzXz8sXc/fb1T9bYR8Z8bN5RmgdD4SISbmLnqj/fmcaAV/p2TX4hu5rHtEAh06iOCQh
	0HrGVdUZemhIvRrVf9gBzHemXk1fE1crSn0zlggyioPKDEcHguT17+HdgzY8L1BuH8LFqxMer2W2z
	BU6kEhaviZxgfz6S8LVWQ5wxANTRLHBfjj0VrJFa8sTx07QViWCRjF0CnhVH0ET2eUryRipVr7HwA
	P5DpamCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7NZi-00000009anG-0QdZ;
	Sat, 11 Oct 2025 00:35:06 +0000
Received: from fllvem-ot04.ext.ti.com ([198.47.19.246])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7NZf-00000009amc-0ZwU
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 00:35:04 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59B0YtIi794953;
	Fri, 10 Oct 2025 19:34:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760142895;
	bh=lIlfbEXPKt6sFk0wdJ6sW30Wwfmnzd3I5ezJv51ZMpc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Vc0kXCQ5Rz1TVfpOAJpHmtbvKNWhQUlguWbHupq5Bxjf95E5vmI/dP6zXPfDQ6JNV
	 or5C1Q/6jEX3QlvnzVb7tvEx4CTWvieGCqa6CUuwBunGQ6v2ZQkZq7+/vhcZhrXhZa
	 cNPgLEC2HQeBhiLz9V1+Mo7EYFPuzHPPlpRCqwlU=
Received: from DLEE213.ent.ti.com (dlee213.ent.ti.com [157.170.170.116])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59B0Ytwi2048387
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Oct 2025 19:34:55 -0500
Received: from lewvowa02.ent.ti.com (10.180.75.80) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.20; Fri, 10 Oct
 2025 19:34:54 -0500
Received: from DLEE203.ent.ti.com (157.170.170.78) by lewvowa02.ent.ti.com
 (10.180.75.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.55; Fri, 10 Oct
 2025 19:34:54 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 19:34:54 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59B0Ysdu2442119;
	Fri, 10 Oct 2025 19:34:54 -0500
Message-ID: <8161147a-532c-403c-bc29-05ce39987c8d@ti.com>
Date: Fri, 10 Oct 2025 19:34:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] remoteproc: core: Remove unused export of
 rproc_va_to_pa
To: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "Maxime Coquelin" <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
 <20251010-remoteproc-cleanup-v2-5-7cecf1bfd81c@nxp.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251010-remoteproc-cleanup-v2-5-7cecf1bfd81c@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_173503_272718_1AE6B479 
X-CRM114-Status: GOOD (  14.67  )
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

On 10/10/25 7:24 AM, Peng Fan wrote:
> commit 086d08725d34 ("remoteproc: create vdev subdevice with specific dma
> memory pool") added an export for rproc_va_to_pa. However, since its
> introduction, this symbol has not been used by any loadable modules. It
> remains only referenced within remoteproc_virtio.c, which is always built
> together with remoteproc_core.c.
> 
> As such, exporting rproc_va_to_pa is unnecessary, so remove the export.
> 
> No functional changes.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

>   drivers/remoteproc/remoteproc_core.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index dd859378f6ff6dec2728980cc82d31687aa7a3dc..383479d624c89da1c481adc956a169c03b793bcc 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -156,7 +156,6 @@ phys_addr_t rproc_va_to_pa(void *cpu_addr)
>   	WARN_ON(!virt_addr_valid(cpu_addr));
>   	return virt_to_phys(cpu_addr);
>   }
> -EXPORT_SYMBOL(rproc_va_to_pa);
>   
>   /**
>    * rproc_da_to_va() - lookup the kernel virtual address for a remoteproc address
> 


