Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AED6C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 08:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCr1bIjcarrRGLKq6p0An5lU4Quq+4hAEYJWhfURG2U=; b=p92g9S5sZDt6RT0p5USkvpvPdS
	Z5WK6thgyu80sjFEubK6WvpFnJx/JVnrdcyL/svRHcP2KcHm8wulJgRd39IZvBBmNsVNqc/WfBHLe
	UVQwtEMfKjF+I/+JvnVAWmTG42hr/L0Y9wEErVJlPdJLAGV7kU2/W0XFZzU0I+PimkK9HK/zyHva/
	ANdyal70fA5zi9F716e1eStNla3vE6YL3f4wxPB24kQ/gONE/RioKV3AFwGBKydGOcar8qMa8rRoX
	+48ATOMWam6uQKaN3ODXJ/xZ8eVPDo9kqhpwEtgbBedl5rnSlo9/GH/QM1Ie1EdLfKdFDRZg/3to0
	wCzAvM5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfEj8-0000000HaAg-1J5i;
	Tue, 04 Feb 2025 08:56:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfEe4-0000000HZS0-3Anl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 08:51:01 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4361f09be37so6757035e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Feb 2025 00:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738659059; x=1739263859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCr1bIjcarrRGLKq6p0An5lU4Quq+4hAEYJWhfURG2U=;
        b=QleFc4R8UQ35oPejn68bRur1fMuvIljuRzCQ8WC3jil8SIU+cPPSTPXIrVOyqSkkKv
         j0d+zyxHxDlfKNfogefPXA6YyCGLJxBYv76GVVTXG9olyI5ctnt7ZStj8D0vbh1SNxbj
         dOTHjB/J3If+ewZo27ZnMKhrZ75YGm3jEsKO2re9BuyH8jy8BAkEsr7KobxvhmxeXYwK
         OeIfDl6CwCUyt4MPQlcxSnso8Z99pFOjXR05e1NJ+PwY4xfyAKnchBQ3KWb7pVT9GoKn
         AbpQPIhAFUi9X+gUCz/w0V9p8BZ2uIhX3VzrteH03brJ8v70qwzG1nBESNbLNcTA2Bi2
         Au1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738659059; x=1739263859;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCr1bIjcarrRGLKq6p0An5lU4Quq+4hAEYJWhfURG2U=;
        b=ewtQ1UHtJ43mHmFC+o7EzbFl0WKUu10KcA8ZpKncRgCggsXOAr6vTz6Y7LnPZXQOWg
         /+aGNP3KrLsT1QfXUUdxSXWlay2P6WulMVUeoFGCGdMoEpLCv2IqCSO6LRnRPV5MAnQ/
         Xk2BBRuFxwyH8hqkEF0vBzcUSYv25iHvfBoCZOGzpHs8XrMv6l4OO4srIPkLqfikU/N3
         GTMY/brmu/mTYQEsB3KBtOTLZDnUsw2OvW0RCIA2VsxS+nlc6zSzWSEmkgm1vDsMCV72
         WDHWs8RVhezvj6J5UHqyo1uBJfFDPXXzsKsWzX4JueUqaxIoXHszOGabngeaFXMN0PxV
         TbJA==
X-Forwarded-Encrypted: i=1; AJvYcCX9MSIgogWx3AgNTSdBZOv2TbDXQ8aax+Tv2p2Q32ARUo3bKhbM7nEU9z6ZXeUWreOXAs9fOZVI/KCGIWoaO99s@lists.infradead.org
X-Gm-Message-State: AOJu0YyakohLR6Hx+c0Zj2p8wgEvn7cQ70ScAW40b9YMWx/5fjGBbJoH
	PuszdAvnQwPzs242oPcqhlcjneg/vK2Alqi2R67pCoy0V2KYidy/HI0tQ6aXcOs=
X-Gm-Gg: ASbGncvqrlHDW0pCC9ZoBPV5+Oux+d0IJFPwotmTaZCqQ9evoyZeulQIroVRnN7nYLM
	aIl31fQbV1SiuKgIMRQVs47RAP3DHHIFL/mu6O/zj6zzBU2LexAw2s0hAtN6OKZED4RmyTY2qlg
	7CkrCJJsN/gMnE7t7wrBIFA9TJ6tMTJxXOrYa8A4hrReFkkUpALSHXvJRBAhMmfh68oYNI6U0pj
	kxlZe/tnLbfaje0u+oqBphQpY/lnDTuBH8DYoM5b08cS4SJ3P7eZKDSlflYN8+BKvXePXsMy62i
	h6n6qHxAfQxQyXJ8ArnItLtcbDV98hU=
X-Google-Smtp-Source: AGHT+IHYuKkYPbhh9kBPc87DdQpAZ9zcHEHdGkABawo/Qtr0EqGi6f6CTD8BUqoqUJP8UloWPAQavg==
X-Received: by 2002:a05:6000:1848:b0:38d:9e86:2b24 with SMTP id ffacd0b85a97d-38da4e440aemr794591f8f.8.1738659059133;
        Tue, 04 Feb 2025 00:50:59 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38daf27bbf5sm503066f8f.48.2025.02.04.00.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 00:50:58 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250104-exynos990-cmu-v1-0-9f54d69286d6@mentallysanemainliners.org>
References: <20250104-exynos990-cmu-v1-0-9f54d69286d6@mentallysanemainliners.org>
Subject: Re: [PATCH 0/2] Add CMU_PERIS support for Exynos990 SoC
Message-Id: <173865905768.26600.7188664956285706035.b4-ty@linaro.org>
Date: Tue, 04 Feb 2025 09:50:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_005100_796711_B3B619C3 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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


On Sat, 04 Jan 2025 21:05:55 +0100, Igor Belwon wrote:
> This small patchset adds support for CMU_PERIS for the
> Exynos990 SoC.
> 
> Best regards
> Igor
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: clock: exynos990: Add CMU_PERIS block
      https://git.kernel.org/krzk/linux/c/7fa119f5707f12f3ac00726345ea6b7a22977ab6
[2/2] clk: samsung: exynos990: Add CMU_PERIS block
      https://git.kernel.org/krzk/linux/c/3214e7c0cfd29b1f0d80e0a4708145326d759d68

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


