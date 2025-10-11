Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305F6CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 00:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eKb9jUwwbVlUbudwbqKG+Yy11LCDL3Kf+uy2j4nmRg8=; b=xL8SkG0PXne0ceI/1ia0mYDIPw
	s0wfzGGAK+GN1OrqN/ks56pXSwx+aGF10COhXTgMdIWoZkcmXtVlUycLrVpZ3Y8PePsJo9apdB7aG
	L75PGWCEFLc+WVdAD9ov9ADP7aCBFFvYqJy9z3zuYzErIG8Fw6GPysxSwGo6Q/dDSscxHvza5f3RT
	OHAGSgjnpV7/wb4njN91dRnVsRJoxRUjxQYfbSDRf/KS8D5D0YOYzCWwhXhAH3nh6KeNrl1JXXsIH
	Mfa8mhZlGISboZ9C77iC+X6eHAOR9eJ3dQEQQfaDJzSJPppmatKnCSHjLV3EMV99PF4pveR/j26NV
	HWpKhtfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7NNT-00000009a1q-3jvE;
	Sat, 11 Oct 2025 00:22:27 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7NNR-00000009a1V-3IS7
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 00:22:27 +0000
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59B0MFRB424348;
	Fri, 10 Oct 2025 19:22:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1760142135;
	bh=eKb9jUwwbVlUbudwbqKG+Yy11LCDL3Kf+uy2j4nmRg8=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Prfsbbn1eKgqMa1qzk0SRZswF7vxW3iXYPk6YV+XjWjzIEVx9WZKdVoX+V5BRBiUX
	 xRC7GjSDv8/EZGFmpxUqMe8UzfPbIlHY83R1TxW0gRvm+ZYxqhfdgDZX+CoNQ7XHZO
	 1PZYT//uru6IQTTexfY/HW5AZuUsATQVry2zbrTU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59B0MFro2042203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 10 Oct 2025 19:22:15 -0500
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 10
 Oct 2025 19:22:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 10 Oct 2025 19:22:15 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59B0MFVE2428990;
	Fri, 10 Oct 2025 19:22:15 -0500
Message-ID: <d02fb70a-205a-48c8-a972-0d8a43b61d64@ti.com>
Date: Fri, 10 Oct 2025 19:22:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] remoteproc: core: Drop redundant initialization of
 'ret' in rproc_shutdown()
To: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Arnaud Pouliquen
	<arnaud.pouliquen@foss.st.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
References: <20251010-remoteproc-cleanup-v2-0-7cecf1bfd81c@nxp.com>
 <20251010-remoteproc-cleanup-v2-1-7cecf1bfd81c@nxp.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20251010-remoteproc-cleanup-v2-1-7cecf1bfd81c@nxp.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_172225_967667_6352B924 
X-CRM114-Status: GOOD (  14.56  )
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
> The variable ret is immediately assigned the return value of
> mutex_lock_interruptible(), making its prior initialization to zero
> unnecessary. Remove the redundant assignment
> 
> No functional changes.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Acked-by: Andrew Davis <afd@ti.com>

>   drivers/remoteproc/remoteproc_core.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
> index 82567210052893a501e7591204af1feb07befb22..29bbaa349e340eedd122fb553004f7e6a5c46e55 100644
> --- a/drivers/remoteproc/remoteproc_core.c
> +++ b/drivers/remoteproc/remoteproc_core.c
> @@ -1989,7 +1989,7 @@ EXPORT_SYMBOL(rproc_boot);
>   int rproc_shutdown(struct rproc *rproc)
>   {
>   	struct device *dev = &rproc->dev;
> -	int ret = 0;
> +	int ret;
>   
>   	ret = mutex_lock_interruptible(&rproc->lock);
>   	if (ret) {
> 


