Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22C6FD5F98
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 09:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BVQ9lyGxSeMxPWxy7ZZTOBzpLHNklj5caAwwtl+7bEs=; b=j217fpPpMbj51Ng1jOTrvt8UWT
	WdhWUqwX7mU+yozPD17topiC/Jws3nzxGf4jCcolHNStv6Kmm/k88H5+c4BRPSfXSO18Cq+4GFaQp
	ZYV84DeYP1aId2fiHMens0RDVANz3h1YPtOyxQv8X2y8jq0wRCYTvt6u2td86Slsuhr3mP4LNLiQa
	G+HtFXfi4lh4al75Ysh5NN4sJXgONLwLvLrPxRXOrulIMkHBJ2/mfEZC6/XnRbyFfXtM6Gtx1wnMl
	7Kd5EbRI1B/JFTQX8cWdQ45ZGmepudvv9Gl3gBPAFDSu7/Kbm3FOrVBdBnSKUBwbzRX6GfrofwZwP
	8mmsBFaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOv9-00000008ZYB-2ApN;
	Wed, 08 Apr 2026 09:09:59 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAOv6-00000008ZXA-2trb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 09:09:58 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43b95e5b3afso3340053f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 02:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1775639393; x=1776244193; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BVQ9lyGxSeMxPWxy7ZZTOBzpLHNklj5caAwwtl+7bEs=;
        b=jj6PWvrSmhq/xvDcMX/fNnjtPb6JGcTDSed/VJXvflWcTBWbS0IGQa9pHmq0tmriQc
         5a1EIA0P/RNaynBWG96oAAsdpJwO4RNC4ZNOEokBQdPHZOBnuiQ9hjAoVICOY2tMg6GL
         FlWWOfEECLO7Ypc9jRpr+dhxz6Q1k+w/nERw2Lm1ZBDwsRgv2qwhPz64M1CdCw7f3k1E
         Yjkkfz52NpipkQkl8Rk2ArE59MOvDek3XeuhD0kvySJXvFv/6I044bd6p0Y/oGSQIVtf
         w1GvlmumOL5BpGoep0fxkPefHrtzW1HdaR9j+P5r7uuwzXdWc4ry10f3STXCyhOrvAAQ
         80nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775639393; x=1776244193;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BVQ9lyGxSeMxPWxy7ZZTOBzpLHNklj5caAwwtl+7bEs=;
        b=BNjXs0JQ1tQHWsZf1/QMwh7jvWOMjInQCNAMT7yfYniVWLJOvYI9wKeCaA7z0Icjgn
         jTl9VUGeZfy2BizPGHsDv8pVEC3I8haoCAu73Xsnb2u6D1/sUh8Lzw4svPwx51p84L98
         O0eQsW7/kg1VF3buZhWdx2356nBB0dEhcat6ZYx2SAiMaH0kKOulXEAato75KjrAQOQB
         XS5eRKQGcnSC/BngtKEwhjZs9wv65CQ2XaQy89nuuHFuvNjcfuXRiKBIe2zuMxYHGyD1
         2k7V1TgLNXfH0A+v7h7jrY4LH7176eHDdP6WliKiJ5PoUOKpe054dMnybW4mvjnG2Stq
         cfAw==
X-Forwarded-Encrypted: i=1; AJvYcCWlIjn8qVPnf3LnMc6GAsK2/X+C3pfmJNgL6x/NQIQZXG37/FsDAi7rvuOtDIIN9+B6HzCEi9c91q1erZOak+dY@lists.infradead.org
X-Gm-Message-State: AOJu0YzhqKgQj/9u9g5VOYyXoJc5/aZIY3aIbKttGHQm2IhZD1yjzeoQ
	onA3CSPId7IlzAlUlhjipuQFHnWWZV0unV11fVyG/7CCydV3wGDGlctPex3CJBd1+dM=
X-Gm-Gg: AeBDieuaxP+0DnaYr55du+PkMcDhW0GBca2BU6DZ072/JWWe2200wCIxu6jC5S8kOGS
	br7IQ7swD1sAKjzgtR5lIEaWNDIsji94cT72rYerYbu1k6T+Ij3zQqSVJDmM2kb6M4vJPIJkfIo
	mY7K66drNvDfiWIeZdkc1COM6KwukMOJVXmJv1cFIZkP/0jxw5wPrcdsaHAC2VRMfFm6tX4gTWM
	nnxcnhrSJ9cmmEpQA2YUCN7XdAmfQ/xN6BB/PY9sSqKFJiZRGki0dhUaueb0Zhvo69W4tQO7j6y
	5YR3rA5pq4ZADkZp1gMYhFFU1M4+Ngu9tdMPbir1rbJBSZWt3xiuhLsW5mLoijhexiQOE/QzuF0
	yUK6v/d4MdhRvk6/RNK5x49qUfC70xH/YRkcCtXMosM4oT5QF46iAY70fix0TPXYQME/nT7qMzU
	cZppBxIZ1TwwPWPMcuMxsuC5u4Z33n/JAEY97V8Aj/2A91
X-Received: by 2002:a05:6000:1a8d:b0:43b:3be3:9a16 with SMTP id ffacd0b85a97d-43d292e4215mr28461338f8f.38.1775639393127;
        Wed, 08 Apr 2026 02:09:53 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e1c27sm54424005f8f.26.2026.04.08.02.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 02:09:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, robh+dt <robh+dt@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jian Hu <jian.hu@amlogic.com>
Cc: devicetree <devicetree@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, 
 linux-amlogic <linux-amlogic@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>, 
 Ferass El Hafidi <funderscore@postmarketos.org>
In-Reply-To: <20260326092645.1053261-1-jian.hu@amlogic.com>
References: <20260326092645.1053261-1-jian.hu@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/3] Add the missing mpll3 clock and clock
 controller nodes
Message-Id: <177563939235.3407812.2098744320811836636.b4-ty@linaro.org>
Date: Wed, 08 Apr 2026 11:09:52 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_020956_735276_8A103527 
X-CRM114-Status: GOOD (  13.04  )
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

Hi,

On Thu, 26 Mar 2026 17:26:42 +0800, Jian Hu wrote:
> This series adds the missing mpll3 parent clock and completes the
> Amlogic T7 SoC clock controller DT support.
> 
> - Fix redundant hyphen in for gp1 pll
> - Add the missing mpll3 parent clock definition to t7-peripherals-clkc.yaml
> - Add Amlogic T7 SoC clock controller nodes
> 
> [...]

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.1/arm64-dt)

[3/3] arm64: dts: amlogic: t7: Add clock controller nodes
      https://git.kernel.org/amlogic/c/5f727a999f80a72dae7326577e0d832799ddeaa3

These changes has been applied on the intermediate git tree [1].

The v7.1/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


