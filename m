Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F32C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 10:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+uhJcJDTeJCAUeixIicqUqHNPuuMmXwRPR3UP1fAmM=; b=FKM41ra9AtP4JfeYWd4CCpNhu3
	UQUBaUkxX6tXZH0BcEVZ3Fk9MR4uRgIPWpKqDBFnPL8GUabynyatYWPdoLt62iR5RzQeryQWaLAAG
	S3SMedOuU9qVAlOxPTA69+mVXXllqxZI5t9tm34dPuj4HlrM1+n3O2DnSsLZVFuy3iRnZsQJNCx+a
	LCHql45GGY/3b3m1sjCWnVAJvlMgTrAS6h2wbyG+xRSAF5sJ0YTD/tH/RXrYdiAELGa37GcFM1rgn
	jhg+VKVMzHR1mgVDcD8ro5zpBLIRBOb7A/Wz5LjoyigRAntYirFB9EDnOV22m4KvwTtAlgfYOji/S
	na7JOSuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYjT7-00000002Crs-0joh;
	Mon, 07 Jul 2025 10:53:05 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYisE-000000027DK-0LoV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 10:14:59 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5676FZb1022788;
	Mon, 7 Jul 2025 12:14:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	M+uhJcJDTeJCAUeixIicqUqHNPuuMmXwRPR3UP1fAmM=; b=qa/jqMjNzLnoNdla
	J8gS5RL+QKKO2XkLCjN1Dd1OFZalOvLdthzFGzbzKNCrkE5b+Ck8ShWM9wT3Hcgk
	fyKnJggAL2QWHo/tQpb4DWqE+1O6KxhnJZJPllEqH/KtQ54t6G7qdb3HinT2xvYK
	7cm/3L2Dhe84flz9gvspRWEVXDcz5AJLAVa4it5nqaU1zsjuk9FoC+WN47Pzt8H/
	q76kIXGyHHPxiBYBSbCQvnl2aXetkDNUnMcp/K6iqGshBxLlfgAMIZxxEP1fWexI
	rTOlSIEGxIUVt1DhjqJLUUbVPbjejAuyPa+egSUHsCKJVyHQGleIjiG5qTqBXGr9
	4dKz0g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47psfm84re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Jul 2025 12:14:36 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E636440056;
	Mon,  7 Jul 2025 12:13:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6C7BEAC4AF2;
	Mon,  7 Jul 2025 12:12:18 +0200 (CEST)
Received: from gnbcxd0016.gnb.st.com (10.130.77.119) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Jul
 2025 12:12:17 +0200
Date: Mon, 7 Jul 2025 12:12:11 +0200
From: Alain Volmat <alain.volmat@foss.st.com>
To: =?iso-8859-1?Q?Cl=E9ment?= Le Goffic <clement.legoffic@foss.st.com>
CC: Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
        Andi Shyti
	<andi.shyti@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Sumit Semwal
	<sumit.semwal@linaro.org>,
        Christian =?iso-8859-1?Q?K=F6nig?=
	<christian.koenig@amd.com>,
        M'boumba Cedric Madianga
	<cedric.madianga@gmail.com>,
        Wolfram Sang <wsa@kernel.org>,
        "Pierre-Yves
 MORDRET" <pierre-yves.mordret@st.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>
Subject: Re: [PATCH v4 0/3] Fix STM32 I2C dma operations
Message-ID: <20250707101211.GA984919@gnbcxd0016.gnb.st.com>
References: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250704-i2c-upstream-v4-0-84a095a2c728@foss.st.com>
X-Disclaimer: ce message est personnel / this message is private
X-Originating-IP: [10.130.77.119]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-07_02,2025-07-07_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_031458_410898_297B60E9 
X-CRM114-Status: GOOD (  18.38  )
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

Hi Clément,

On Fri, Jul 04, 2025 at 10:39:13AM +0200, Clément Le Goffic wrote:
> This patch series aims to fix some issues inside the driver's DMA
> handling.
> It also uses newer I2C DMA API.
> 
> Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
> ---
> Changes in v4:
> - Patch[1]: Remove all `chan_dev` variable occurrencies
> - Patch[2]:
>     - Refine commit message
>     - Use the dma_callback to factorize the code
> - Patch[3]: Refine commit message
> - Link to v3: https://lore.kernel.org/r/20250630-i2c-upstream-v3-0-7a23ab26683a@foss.st.com
> 
> Changes in v3:
> - Add Alain Volmat's "Acked-by" on patch 1 and 2
> - Link to v2: https://lore.kernel.org/r/20250627-i2c-upstream-v2-0-8c14523481dc@foss.st.com
> 
> Changes in v2:
> - Fix the dev used in dma_unmap also in the error path of
>   `stm32_i2c_prep_dma_xfer`
> - Add a dma_unmap_single also in the ITs error handler
> - Add Alain Volmat's "Acked-by" on patch 3
> - Link to v1: https://lore.kernel.org/r/20250616-i2c-upstream-v1-0-42d3d5374e65@foss.st.com
> 
> ---
> Clément Le Goffic (3):
>       i2c: stm32: fix the device used for the DMA map
>       i2c: stm32f7: unmap DMA mapped buffer
>       i2c: stm32f7: support i2c_*_dma_safe_msg_buf APIs
> 
>  drivers/i2c/busses/i2c-stm32.c   |  8 +++---
>  drivers/i2c/busses/i2c-stm32f7.c | 56 +++++++++++++++++++++-------------------
>  2 files changed, 33 insertions(+), 31 deletions(-)
> ---

Thanks for this new version of the serie.
This all looks good to me. My Acked-by are already set since v3 so
nothing more from me.

Regards,
Alain

> base-commit: d0b3b7b22dfa1f4b515fd3a295b3fd958f9e81af
> change-id: 20250527-i2c-upstream-e5b69501359a
> 
> Best regards,
> --  
> Clément Le Goffic <clement.legoffic@foss.st.com>
> 

