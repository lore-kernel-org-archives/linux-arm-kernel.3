Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54E85C02185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 10:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8fT8Kv+j/S2D4pOQnUFqbh6MfyYIrUfOk0KiOX87Jc=; b=PSlxz4HUPsVhgZ3FLnB72PTqjW
	K0ZH3OyCL6Q3nON1p0L0jLqjLAF5GdTeW7lhQblFDnFLxrLHKn/I6Xf+6GTcywYVCjZW8S+vTRitY
	gi2ezNIjOxRgVM6B8iD77ZTYnTAmMpMpsSlOOQ/PfAEUU9i2g7u67TCfzp4r237ZZmRPXDj19uVpT
	K+O0rndaZxMk92SY4UOYbhZJZ6q9Haz6olaY1Rqn/d7OukJJxvKEmQDqnGczdMBLEuloNHLv2wIN5
	nyPH/34K77JkFtfNqHW+PLBcs5UgW5uk4uTF7gY/bkuGhkZ2Y0/DJM8g0qKwPh6ZDci+jmR+f5mc2
	lW5RwLfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0cs-0000000BUHF-0kRg;
	Wed, 15 Jan 2025 10:27:54 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0Zi-0000000BTPH-1pPm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 10:24:40 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F7sWRc014640;
	Wed, 15 Jan 2025 04:24:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=F8fT8Kv+j/S2D4pOQn
	UFqbh6MfyYIrUfOk0KiOX87Jc=; b=VW1JPJwireF63R+LkAf1nvgCd4OhgbgcGo
	o9oqRq48//099FlqQg+hrWuLh26NjzJb4IumNFVQH0UApd/L8xoncuZ18dAoyk9e
	trJGUbZqhYvD/HMldUm3uONz+tCg74wGl53NBjMxBJVqLXXTNDNdEx3+BslIHULB
	XQn+wO1wI17r1fGEme0bWM+tIeOWC/j4etAsl2901S62Gq42kFccnhsfuAEUNiNn
	B6tQD0hORaBy/LPaDTgEHFuhvjEuDhiZTumorTk0lhtwEWodOs8UfDBdR5OdbYsd
	wgG+wx4ScyMZkWekMPAtIP0pp8zJnUhRxbRcwhFVeWW7m+uB2VNw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 443px4mf9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 04:24:18 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Wed, 15 Jan
 2025 10:24:16 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Wed, 15 Jan 2025 10:24:16 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 1508882026C;
	Wed, 15 Jan 2025 10:24:16 +0000 (UTC)
Date: Wed, 15 Jan 2025 10:24:15 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Doug Berger <opendmb@gmail.com>,
        Florian Fainelli
	<florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list
	<bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Andy
 Shevchenko" <andy@kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?=
	<ukleinek@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre Torgue" <alexandre.torgue@foss.st.com>,
        Kuppuswamy Sathyanarayanan
	<sathyanarayanan.kuppuswamy@linux.intel.com>,
        Nandor Han <nandor.han@ge.com>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-pwm@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <patches@opensource.cirrus.com>
Subject: Re: [PATCH v2] gpio: Use str_enable_disable-like helpers
Message-ID: <Z4eMz06gm6DPjqsR@opensource.cirrus.com>
References: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250114191438.857656-1-krzysztof.kozlowski@linaro.org>
X-Proofpoint-ORIG-GUID: g_1sQD1C5vLD-t_9ffrlstl7qSLhk8gd
X-Proofpoint-GUID: g_1sQD1C5vLD-t_9ffrlstl7qSLhk8gd
X-Authority-Analysis: v=2.4 cv=XdhzzJ55 c=1 sm=1 tr=0 ts=67878cd2 cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=kj9zAlcOel0A:10 a=VdSt8ZQiCzkA:10 a=Q-fNiiVtAAAA:8 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8 a=4kLLQdw-iMVuSiU5jB4A:9
 a=CjuIK1q_8ugA:10 a=cvBusfyB2V15izCimMoJ:22 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_022438_534657_4BCE89A2 
X-CRM114-Status: GOOD (  11.16  )
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

On Tue, Jan 14, 2025 at 08:14:38PM +0100, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>    operator has three arguments and with wrapping might lead to quite
>    long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>    file.
> 
> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

For the Wolfson bits:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

