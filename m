Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5283CA0FE1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 05:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Et9oPv2leaDcJBdZKdxROMHYIIJ1YIz1mtADASkQL7U=; b=nKTMZJh2JJFwnU
	skp7wxIK+8sgsxOi2E1ln/BEpJyzLGYxL5PdVO91U5+/0Fam6pw8ob435xGYo0bo+YBtGYOLN6Vgy
	yNDXB5cIM6w3te6Gtem9QPUMzjrxaH0p0QyAgOz6+zAdQVxr+aW1pl2Y3RB7fOcYah48o+DyNFpbM
	+ILFpbZ8W5yiWWmSEpwxupzuqC5CsyN0aD47DhXQtiRs5YCTAyXOyS5Dcww9q79ebmMpmLc61PL3q
	jNxFsHuSPiMhYPTlKiIbHZwWhwRviQtG0GfRxC6MCN9e7WuW16tGiGz+0W/siP/WVKC79ZUD2fSZ3
	VYdHjFbPLsZ1TqVETivQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqQ9Y-00000006zl9-3l3S;
	Mon, 25 Aug 2025 05:54:00 +0000
Received: from mail-qv1-xf2f.google.com ([2607:f8b0:4864:20::f2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqQ6w-00000006zNm-3iiw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Aug 2025 05:51:20 +0000
Received: by mail-qv1-xf2f.google.com with SMTP id 6a1803df08f44-70d9a65c373so35293616d6.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 Aug 2025 22:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756101077; x=1756705877; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Et9oPv2leaDcJBdZKdxROMHYIIJ1YIz1mtADASkQL7U=;
        b=gTisQNBjYGT5qVfoXMBsZ+SWIPS74hoj/0o6bLQEX0brlhggsf+EfQtkn/kiISuopM
         DVokG4kwGAxAH/8uDSqhpTWjIx7CihzZS0w5m07ACAfU8BBAX3kprtfm+bL+ObRT9UWp
         p460R7plTw3Pp6bOJS8BZutzhuWdEe6YT+RihTUpATbYzfSEZPfjtfxsPVTC5JE9+AEP
         h1gvBGgZp3nr7UAiiQWM9GxZk1ulT6r038Yuf1C3hJcdhr3bjdH+5NgEVF3Oz44T234b
         pXPPfa65mr1bkbj8I4Gz2+QZSyvp4h+XXZmJIgYi7bkzBP5swQ6Su5AJxCexbvNpSA5g
         Sv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756101077; x=1756705877;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Et9oPv2leaDcJBdZKdxROMHYIIJ1YIz1mtADASkQL7U=;
        b=Vj07+sVTpZZqJmB8O9MC+qKbkMobaGRcR0W+LG/y+F5u1xDkdZHiicgN6qdyeqG0ou
         Cr5BntjXQZStgH+UXOzq8slXPQW+b0URLHpig2WvnWnoL5sjBG8asg/17KGDN+zQcyKd
         uv0ah5FtpNQsWgJX839Lm0ydECq0PxFTLRkY28IV05naYLPQJG3i0pqw6n5Cg63Ykakq
         4XGFexdmbwnin0EKKItEQ451m/0qxgD8sYr7KEl+6bSSdFV5wtwhSceP+9qXHWhJydon
         oLzK2858TLLjkNdTX4ak316r2UBeUCdU+2uXufUgLaWhLK870g6qPy7Ii1P9VTKUQgjj
         vAqQ==
X-Forwarded-Encrypted: i=1; AJvYcCXbRgMc5FAq3QKOmDiEC+jXDIIYKa5yuHTvhemC2xMvYPKiiJCmo7WY3N2LxkWmAt9S9DnAeW/1EmG//xYvXH0V@lists.infradead.org
X-Gm-Message-State: AOJu0YxtWtRxJYKCc8eeA0rC3yWdhxxT03rtbtIncLu5UyXCgjslWY9V
	k0ZedtryBQKKqfGQxeFtfHQ7KEZhc8xHYX7r1krFBrcrvjRgmZLZ3WOlxZghy06s
X-Gm-Gg: ASbGncsKWPhGJ3uO2UXAHVHxalveVzCGBNXhyevrKRUpPgb3t113IUpUUAA/ofYwhb8
	98597TMH0Xk2rIiRKw4lOfrX/9PlMAC9ijCltuyz4jqKrpZvtegcgLEszNU0GUf959h58rRo9UF
	ZiJKEk16ZXsJaMuoJWcYiPB9EDIja4r1J+mlN8BnyGp1T46OJT6AFQlOTOzzFEtJSv5rbYvPBMV
	0arPu21qVSVB7mG0npyvMqnQcpRXVEkbCACah1zVkQgTftpmtPymoar7qK3zNL/DyJAlaT7qmWY
	E49kUOkbxB9d971vz4/tx8hDW92IanEbrmm+XygysJ62yEzjBb9sLRhYDOCFRqyy+hxom5sJLYO
	2qPE3E+pBHi35X/W8tgPldJOfyU9hNQ==
X-Google-Smtp-Source: AGHT+IHApFZ6b9KTo1IQNvy0nr6YRtViA0vjePuNSrQoLr4sy+9IqoBf4NfsRrLOizyuxtEE12Wkog==
X-Received: by 2002:a05:6214:1d05:b0:709:538c:9ecf with SMTP id 6a1803df08f44-70d972015c2mr119503076d6.42.1756101077407;
        Sun, 24 Aug 2025 22:51:17 -0700 (PDT)
Received: from [127.0.0.1] ([172.191.151.49])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70da72da3fdsm39639156d6.73.2025.08.24.22.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Aug 2025 22:51:16 -0700 (PDT)
From: Denzeel Oliva <wachiturroxd150@gmail.com>
Subject: [PATCH v4 0/4] clk: samsung: exynos990: CMU_TOP fixes (mux regs,
 widths, factors)
Date: Mon, 25 Aug 2025 05:51:14 +0000
Message-Id: <20250825-cmu-top-v4-0-71d783680529@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANP5q2gC/2XMSw7CIBSF4a00dyyG8rDYkfswHTQXbG8ipYFKN
 A17Fzt1+J+cfDskF8kl6JsdosuUKCw11KkBnMdlcoxsbRBcaG6EZuhfbAsr09jxK7aWdyigvtf
 oHvQ+pPtQe6a0hfg54Cx/67+RJePMGGkuqlVSWLxNfqTnGYOHoZTyBWvV2ameAAAA
X-Change-ID: 20250825-cmu-top-5c709c1d07c2
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Denzeel Oliva <wachiturroxd150@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756101076; l=1348;
 i=wachiturroxd150@gmail.com; s=20250825; h=from:subject:message-id;
 bh=Off9QtbvNGtxDKOftWIy/912T6OQA9KxOMWtFI7CnDw=;
 b=8t7UXCstu0Vg6HrVZJ1vdzt5YI8EibOWHS+GFK+sWMAsfJfYGpwbCHweH3K7RctcepDYz88kU
 +Yadd3QmyG9DWIpWN/8/EaFWWAOXu6AXoEQHfKY94X5aUkKv6s3D6u3
X-Developer-Key: i=wachiturroxd150@gmail.com; a=ed25519;
 pk=qZrip2idhSTNQABELWG6WKCrg9xOKep//pV9JGKmW5k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250824_225118_926362_327862F6 
X-CRM114-Status: GOOD (  10.12  )
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

Two small fixes for Exynos990 CMU_TOP:

Correct PLL mux register selection (use PLL_CON0), add DPU_BUS and
CMUREF mux/div, and update clock IDs.
Fix mux/div bit widths and replace a few bogus divs with fixed-factor
clocks (HSI1/2 PCIe, USBDP debug); also fix OTP rate.

Changes in v2:

- In the first commit the divratio of
  PLL_SHARED0_DIV3 should not be changed.

Changes in v3:

- There is no ABI massive break, the new ID clocks are
  in the last define CMU_TOP block.

Changes in v4:

- Fix compilation for define CLK_DOUT_CMU_CMUREF to
  CLK_DOUT_CMU_CLK_CMUREF

Please review.

Denzeel Oliva

Signed-off-by: Denzeel Oliva <wachiturroxd150@gmail.com>
---
Denzeel Oliva (4):
      clk: samsung: exynos990: Fix CMU TOP mux/div widths and add fixed-factors
      dt-bindings: clock: exynos990: Extend clocks IDs
      clk: samsung: exynos990: update CLK_NR_TOP for new IDs clocks
      clk: samsung: exynos990: Fix PLL mux regs, add DPU/CMUREF

 drivers/clk/samsung/clk-exynos990.c           | 136 ++++++++++++++++----------
 include/dt-bindings/clock/samsung,exynos990.h |   4 +
 2 files changed, 89 insertions(+), 51 deletions(-)
---
base-commit: 0f4c93f7eb861acab537dbe94441817a270537bf
change-id: 20250825-cmu-top-5c709c1d07c2

Best regards,
--  
Denzeel Oliva <wachiturroxd150@gmail.com>


