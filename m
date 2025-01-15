Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83DA1C02185
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 10:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BwBSIk74OQkD8K05wGC9E85ouIOUoZbue+TY8sE50NU=; b=3PWIm15XB8rICuOA6PzsvE0BLO
	D90oD97jb2/Rdb8i0y8vY5+TSr9Q4M0vJejH1QW7orH2VRnCz3/4/qKwd2bubGMOD3M8IIR3uv9h4
	djC9ospCNj6IeEm3vlPlw6WNVD3t3/7jK9N0tdXD2tR2Lx1S9nLvf/ooWLu/e8+ZTOZcXs7qqmLvn
	CpYdiEGcu673lwP/R3ArZ5CI3vZXl44VvM30mxXlglCMCQDUiGZWVhSMG8+5BZuhwx23uqlTp4iDV
	EKfk+dGs13ifLFwzDrGXvFK12+CfbV3UoCvL6mtswVTKjznHHwNgFH+Nxa/GVA5xnHE1Rr9/N8LyW
	5ZBIRAfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0e5-0000000BUSj-31RV;
	Wed, 15 Jan 2025 10:29:09 +0000
Received: from mx0a-001ae601.pphosted.com ([67.231.149.25] helo=mx0b-001ae601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY0aY-0000000BTcm-2I8Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 10:25:31 +0000
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50F10new023378;
	Wed, 15 Jan 2025 04:25:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=BwBSIk74OQkD8K05wG
	C9E85ouIOUoZbue+TY8sE50NU=; b=OTC7Rn79ZlLG9B6zXwTbutpaqqWA5IYAZn
	xXOLqPfR3tldRuqMPbOI7fq7BjmpnwPaU+s0XEHdzBs7Poy/5JcAplJ2HK4VoQD/
	lawzjifOmRqHrqi4CPSCnC9YOSGzjsL6YxcwgPMs3x58LugwlRY2vP7KAckUXpbh
	XnBwWsihA3xhZKWygMp4HX18UA7J7mNqFdDPLQTgaD3l5gp2DFVTETQh1a1GX7AJ
	ObbVJYVR7akDB55uE9ZQXxegH6MJqRzPxgp6+S5HUZqATiElf7Zcr3FqIrABeUkX
	TzDWisNVbYg+bNwoDgaisDzutYegcuwfXoAVNprXbZkckt5OU3Wg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 443px4mfaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Jan 2025 04:25:19 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.13; Wed, 15 Jan
 2025 10:25:17 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.13 via Frontend Transport; Wed, 15 Jan 2025 10:25:17 +0000
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id E85FA82026C;
	Wed, 15 Jan 2025 10:25:16 +0000 (UTC)
Date: Wed, 15 Jan 2025 10:25:15 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
CC: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Hans Ulli Kroll
	<ulli.kroll@googlemail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        "Sylwester
 Nawrocki" <s.nawrocki@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        <linux-sound@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: Use str_enable_disable-like helpers
Message-ID: <Z4eNC/wWsW5mxkmN@opensource.cirrus.com>
References: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250114203602.1013275-1-krzysztof.kozlowski@linaro.org>
X-Proofpoint-ORIG-GUID: JgCM6RfomLyrgsV5M_Ad-wIhmpzVbKEd
X-Proofpoint-GUID: JgCM6RfomLyrgsV5M_Ad-wIhmpzVbKEd
X-Authority-Analysis: v=2.4 cv=XdhzzJ55 c=1 sm=1 tr=0 ts=67878d0f cx=c_pps a=uGhh+3tQvKmCLpEUO+DX4w==:117 a=uGhh+3tQvKmCLpEUO+DX4w==:17 a=kj9zAlcOel0A:10 a=VdSt8ZQiCzkA:10 a=KKAkSRfTAAAA:8 a=w1d2syhTAAAA:8 a=4kLLQdw-iMVuSiU5jB4A:9 a=CjuIK1q_8ugA:10
 a=cvBusfyB2V15izCimMoJ:22 a=YXXWInSmI4Sqt1AkVdoW:22
X-Proofpoint-Spam-Reason: safe
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_022530_587517_4D270402 
X-CRM114-Status: GOOD (  11.14  )
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

On Tue, Jan 14, 2025 at 09:36:02PM +0100, Krzysztof Kozlowski wrote:
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
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

For the Lochnagar bits:

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

