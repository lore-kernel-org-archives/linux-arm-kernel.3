Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 677FDC5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 15:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IV2p6wUgg/pLAnK1RX7ylplX4lrcxkWiWpyVXvQRXC0=; b=sbbmpCYy9pEgfop/DpyJaCGhj0
	a9bXvwORbxPLjjYVu2IinWAl+06BDkc48vAjP/j2ZaO4Btiu0dYI3BCguWaRdsFeC805En+o8dwZk
	Ib8h4000ir9s3Tzc2W0HTzA5i4s7h8sexzi9Wz4AINMNR9gPbMSb73+W0lN/CIbmDg++wyvI/X0G+
	qBTYGj+NSqv2vaDlUglbrwqZhsKPq/peN10YM3v08u+WbMjYU2WbE51bBo7ALTGUqoehTgNJFSdXT
	b0rkfAPcqSM9/qwDLqA+hMeQUzoQIG7c0EghhBHO66ghkc8ICVDJO8+XYSd+exYcgXdqIVb6yXUw5
	87stTPtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0yI-00000007KLi-0pBj;
	Tue, 10 Jun 2025 15:33:06 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyhb-00000006tsL-2PMp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:07:44 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLM1Q028341;
	Tue, 10 Jun 2025 15:07:33 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	IV2p6wUgg/pLAnK1RX7ylplX4lrcxkWiWpyVXvQRXC0=; b=T6MHPqownLgkZwo7
	hkjCKxBPPOrBOd6SumbfnYQe+xplL13NkQIzdRNeKPR9R0i52KNTArd7wFdMdN69
	NI/07A1Onm3rZSlA9D9xq9XRiPrxtYC0+6RcRYCbQNqRkhtj7CRxAPftYTJYoDHE
	U4oWjYr/+5Rp+SFD0YPaaR1z9ByfVToFKu5sBWCsETVQKt+PhZrl+gMu+pdjNmq8
	z2BLKrBIntJyumusZK1LFcap2rly9+Kaqxj0hVURRUfwm8KRGkg8EDbpvG8c7gga
	/u5EZdVUnrxvjiJAOnK5NkqU0bghN9aREzQV32Xg2sKYjjQ3mc7uemkI5CCE00TJ
	3xaVQg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2n23t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 15:07:33 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E561E40058;
	Tue, 10 Jun 2025 15:06:25 +0200 (CEST)
Received: from Webmail-eu.st.com (eqndag1node5.st.com [10.75.129.134])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3EC63AC1530;
	Tue, 10 Jun 2025 15:05:38 +0200 (CEST)
Received: from SAFDAG1NODE1.st.com (10.75.90.17) by EQNDAG1NODE5.st.com
 (10.75.129.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 15:05:38 +0200
Received: from [10.48.86.222] (10.48.86.222) by SAFDAG1NODE1.st.com
 (10.75.90.17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 15:05:37 +0200
Message-ID: <f8b1adef-10f3-4cff-9e11-10c1a16f6ec5@foss.st.com>
Date: Tue, 10 Jun 2025 15:05:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] iio: trigger: stm32-timer: Fix build warnings about
 export.h
To: Antonio Borneo <antonio.borneo@foss.st.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Andy Shevchenko <andy@kernel.org>,
        "David
 Lechner" <dlechner@baylibre.com>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Jonathan Cameron <jic23@kernel.org>, "Lee
 Jones" <lee@kernel.org>,
        <linux-iio@vger.kernel.org>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Olivier Moysan
	<olivier.moysan@foss.st.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>
References: <20250610124855.269158-1-antonio.borneo@foss.st.com>
 <20250610124855.269158-4-antonio.borneo@foss.st.com>
Content-Language: en-US
From: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
In-Reply-To: <20250610124855.269158-4-antonio.borneo@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.86.222]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SAFDAG1NODE1.st.com
 (10.75.90.17)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_05,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_060743_906064_1A2D3C03 
X-CRM114-Status: GOOD (  12.13  )
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

On 6/10/25 14:48, Antonio Borneo wrote:
> After commit a934a57a42f6 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1") and commit 7d95680d64ac ("scripts/misc-check:
> check unnecessary #include <linux/export.h> when W=1") we get the build
> warning with W=1:
> 
> drivers/iio/trigger/stm32-timer-trigger.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> 
> Fix it.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>

Hi Antonio,

You can add my:
Acked-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

Thanks,
Fabrice

> ---
>  drivers/iio/trigger/stm32-timer-trigger.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/iio/trigger/stm32-timer-trigger.c b/drivers/iio/trigger/stm32-timer-trigger.c
> index 925b864facca1..3b9a3a6cbb25c 100644
> --- a/drivers/iio/trigger/stm32-timer-trigger.c
> +++ b/drivers/iio/trigger/stm32-timer-trigger.c
> @@ -6,6 +6,7 @@
>   *
>   */
>  
> +#include <linux/export.h>
>  #include <linux/iio/iio.h>
>  #include <linux/iio/sysfs.h>
>  #include <linux/iio/timer/stm32-timer-trigger.h>

