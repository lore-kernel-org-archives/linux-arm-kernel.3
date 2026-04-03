Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D642E8536F
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 15:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSt3DWga4UatOAssQ037A7XWYU/YQTy3XJfFt55lzyE=; b=uzu1Q95DqpUBFdQEUG2478npVp
	67FWt3zYmcmI2TSjPvdBupbqAzom/cnlH6xLvj/V64htEYg4EtMPP5a10C1OxKnB9Q8S21HAliP/e
	k/SKvyJjEkM+WON2M94H7jGMUdLCfZiuuVvWUcKD/33U+UWMFndM3ISgwLUK6IR8JZmj4tp1gSbO6
	T2wXs71KfeURzdWhAtCk2UISVefeWJ/V8L+VQol68XsjxJM6m23rIVMalXHJ1OAW+QuXUMSdgLNpn
	CAFA4G3QXsHOKM/ccVYUHDkZYAxMHNsRMW3MGAz6ppIVMcZN2Hr+b0OMX5mAsYvBRJfHd1NOar6vR
	kN9h/lsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gAp-00000002C0o-2fDq;
	Fri, 03 Apr 2026 15:11:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gAm-00000002C0A-0eWU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 15:11:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775229058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eSt3DWga4UatOAssQ037A7XWYU/YQTy3XJfFt55lzyE=;
	b=N0ZectZJhoUu+P35J7SiPhC3kEUMOxofbMpyQ+epCQ9B8fI0hekzhPoZTi3dBmFVudfw5E
	IbPlWwi1J/Ocz514QtztXthUecwDy2QwWrOrZf+/1vNAOGaElfkdscbu9/dSQue7/XrQYW
	HcM4SoNnT0+b6sOv/39JD8D65IYX7KE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-PRKuO43JNoCwvu4b2fgYog-1; Fri, 03 Apr 2026 11:10:57 -0400
X-MC-Unique: PRKuO43JNoCwvu4b2fgYog-1
X-Mimecast-MFC-AGG-ID: PRKuO43JNoCwvu4b2fgYog_1775229057
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b3544bc7bso27377081cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 08:10:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775229057; x=1775833857;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSt3DWga4UatOAssQ037A7XWYU/YQTy3XJfFt55lzyE=;
        b=pOkf36S3Sbfo1celqwrA+Hvr+oZjypfc7SoDc8UysLDlYuaA5wdTw+iy6oCYK6CQEA
         p5vPS8uRLzOn4nrbZIi79CvPvTbfZPe6Q9xSliFBxecDS2XUKD1yFJ+Gi+JLti1amSNg
         qrWxhzulKxV819HVU/qCKrDRK6upivuW+GGq0iB2btBSpJzhFbihfIniER8QsTxjMdsS
         zQA2+fVhn2bVW8zvtmnvkfRrlH3DLyJezGNPq54qfu/CP8HljBmJk/Ksc7wm3d5wN4S/
         wSJB3ey+NfB2r6klLOvGaluTmmvZmpgtvVuzSsoeR2jzYnudjnJdSENlOvGuEIhNdisZ
         PjuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWG3JUnR51xmzIVm2RlXtoqmfXhwfoFhJpPuVzz2W3cxJ461nwB3KNJPLFSgH0A4mVGS15LLf0MT8r/yIBPz2Ic@lists.infradead.org
X-Gm-Message-State: AOJu0YxtjlyKVkXA4PUThRJFr+SjWrX9zUCtG/i+gF6ZqdOmJXJrl4kI
	xYn7a/fsIai0c8pJF/K9XWifkEvdK/L6ge0hMDXq4qjT7VnJEdMsku2D8mV2V9l8uuOYrt8Rbs6
	ohn7Bm3TZf1u3pzvydWG88/cpiAdFjroymFoaBLwSS4u3wL8NdJmsdUKJlTV5Wo95quH1tfLG4D
	Us
X-Gm-Gg: ATEYQzyRN+AlcsdItu/DGI2Ijwggj4Od25PI1oBL3rC2CIqt2loWYdGn2+143eZZwWV
	1JT65A5pwuf1MncmpvK0SKweZ67jrl7GC6mIksikbiHxYyYPGC45DJSApzQqHrkYD7velk4a7G4
	F6lQr6uvtxjzDQHXRfjeoYjWr6KynHSe/NhA4dzT82naINswht811G3g+OxkoYfImH3BTj137h3
	3c367uH+8TIHZ6mXf0Dgs/YT3FpD9q2k1sYHLiPZvZZe4jSp/yiyDb0DcGnqalSbPxgOFtz9hrZ
	XfVRv2A/W46rnVsxRDjwLAwcL42NOnNSyVPX487oxJNLP31k4xJmEZWUCtq/UwAIZPW0yQjDjG5
	rnWjHqUXBJAI3EOaxyv5NpEBH0u/Q+S2HcruXzt7QfoJyPDeJG4JGli6w
X-Received: by 2002:a05:620a:44ce:b0:8cb:3870:5c1e with SMTP id af79cd13be357-8d419284f7fmr493257285a.25.1775229056587;
        Fri, 03 Apr 2026 08:10:56 -0700 (PDT)
X-Received: by 2002:a05:620a:44ce:b0:8cb:3870:5c1e with SMTP id af79cd13be357-8d419284f7fmr493247485a.25.1775229056024;
        Fri, 03 Apr 2026 08:10:56 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a596a0a655sm49296476d6.29.2026.04.03.08.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 08:10:55 -0700 (PDT)
Date: Fri, 3 Apr 2026 11:10:52 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 07/10] clk: realtek: Add support for MMC-tuned PLL
 clocks
Message-ID: <ac_YfHe0dscb3MPw@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-8-eleanor.lin@realtek.com>
MIME-Version: 1.0
In-Reply-To: <20260402073957.2742459-8-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LICKvVDdm7JIHr_2OkazW6JefZs2CBT-Y8QFIGXMjTI_1775229057
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_081100_283889_5D106569 
X-CRM114-Status: GOOD (  16.28  )
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

Hi Yu-Chun,

I should have finished going through Sashiko while manually reviewing
your patches.

On Thu, Apr 02, 2026 at 03:39:54PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add clk_pll_mmc_ops for enable/disable, prepare, rate control, and status
> operations on MMC PLL clocks.
> 
> Also add clk_pll_mmc_phase_ops to support phase get/set operations.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Jyan Chou <jyanchou@realtek.com>
> Signed-off-by: Jyan Chou <jyanchou@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> +static int clk_pll_mmc_set_rate(struct clk_hw *hw, unsigned long rate, unsigned long parent_rate)
> +{
> +	struct clk_pll_mmc *clkm = to_clk_pll_mmc(hw);
> +	u32 val = PLL_MMC_SSC_DIV_N_VAL;
> +	int ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC1_OFFSET,
> +				 PLL_FLAG_INITAL_EMMC_MASK, 0x0 << PLL_FLAG_INITAL_EMMC_SHIFT);
> +	if (ret)
> +		return ret;
> +
> +	ret = set_ssc_div_n(clkm, val);
> +	if (ret)
> +		return ret;
> +
> +	ret = set_ssc_div_ext_f(clkm, 1517);
> +	if (ret)
> +		return ret;
> +
> +	switch (val) {
> +	case 31 ... 46:
> +		ret |= set_pi_ibselh(clkm, 3);
> +		ret |= set_sscpll_rs(clkm, 3);
> +		ret |= set_sscpll_icp(clkm, 2);

Sashiko reports:
https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com

    Is it intended to use bitwise OR to accumulate these return values? Because
    these hardware operations return standard negative error codes on failure,
    performing a bitwise OR on multiple negative integers will merge their bit
    patterns and create a corrupted error code.

> +		break;
> +
> +	case 20 ... 30:
> +		ret |= set_pi_ibselh(clkm, 2);
> +		ret |= set_sscpll_rs(clkm, 3);
> +		ret |= set_sscpll_icp(clkm, 1);
> +		break;
> +
> +	case 10 ... 19:
> +		ret |= set_pi_ibselh(clkm, 1);
> +		ret |= set_sscpll_rs(clkm, 2);
> +		ret |= set_sscpll_icp(clkm, 1);
> +		break;
> +
> +	case 5 ... 9:
> +		ret |= set_pi_ibselh(clkm, 0);
> +		ret |= set_sscpll_rs(clkm, 2);
> +		ret |= set_sscpll_icp(clkm, 0);
> +		break;
> +	}
> +	if (ret)
> +		return ret;
> +
> +	ret = regmap_update_bits(clkm->clkr.regmap,
> +				 clkm->ssc_dig_ofs + PLL_SSC_DIG_EMMC3_OFFSET,
> +				 PLL_NCODE_SSC_EMMC_MASK,
> +				 27 << PLL_NCODE_SSC_EMMC_SHIFT);

Sashiko reports:
https://sashiko.dev/#/patchset/20260402073957.2742459-1-eleanor.lin%40realtek.com

    Are the mask and shift values mismatched here? PLL_FLAG_INITAL_EMMC_MASK is
    defined as BIT(1) (0x02), but PLL_FLAG_INITAL_EMMC_SHIFT is 8.

    When regmap_update_bits() applies the 0x02 mask to a value shifted by 8,
    won't it evaluate to 0 and fail to set the intended initialization flag?

Brian


