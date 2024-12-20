Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A870E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fPnFnnIbk1GG60/+MNJYGRtUv6D7I7cGesD5TPc/BLc=; b=UAjXG2X5GZEOmP
	Xuks6LVo6wp9gp4XhqIPxP+CafUNvyoD6zhp/CSOJr9Vd8q0LFQ+VCHwLZ68mdL97fGi4xukjzxon
	CPqof/ylfynVjCNtcX9/xuJfzfYh/RsqLDGXCr0FoDocsgPXyPZHMHgu9ACXKZvhSsz/bv36x7+gn
	TQGeejd23V1JhlxqsjpjCiey/dI3L/fswmZhExfJ01oapRFjByMbLU9d9LixwLgZcI1AaIR7Plzih
	wasFZ4NA6f8S92wOyaUFV3JXon+OY1HwrLOXT/E9Q0K6MSysL5Iw8HoymLOC+fgC7Kvb/4Avj/LyI
	FC6OWyaveDGDdOE9la3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tObCH-00000004lzx-12dF;
	Fri, 20 Dec 2024 11:29:33 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tObAl-00000004lfj-3Sib
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 11:28:01 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so2621251a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 03:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734694078; x=1735298878; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fPnFnnIbk1GG60/+MNJYGRtUv6D7I7cGesD5TPc/BLc=;
        b=HuQUD4Nd+6Fg/uelIA+0yA+j0soOzRpc3S+g6KvpzSDIvpx8GOUGEW5obiiRdolKa3
         ALl0U3/GUQ2JBduXvLuhxHWQ9VudMT1v05PZvw4XWiGomI+vJA70YjZj3ZYm9gSrEamJ
         v11QH+ii4YQ2n5+Q3iSOfbcpQ9a4fUfyrXwY60qo60BxErrefAFezJ3BpQsKzKVYmogu
         cbkUvxdriRX7/8hZdx9TfyQhlcR9/6JdehHLrLCuYTS+TT+sr//Dhhp9dr0bLXcPXU56
         sEvikNBu0el9RJXWttl0b+xENFgbodTz5mokM6mct7Sta9qY3unZOr0AXt5bVx0bWaJj
         vHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734694078; x=1735298878;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fPnFnnIbk1GG60/+MNJYGRtUv6D7I7cGesD5TPc/BLc=;
        b=Xk+qb2zmEYRSNQN8y3RVn8VZOp/n0f8fRDN/AE8l7+N1X/ykGFnBv48xhDiqeQMlUv
         hmtDMllbXQLKPKtMb6ywDGkz2NBU1b3E7tVFVZp3Dg/yKX80LjddTKgHjqf7GQB1Itrd
         fdFbj/u/m+Saa6ISrI+qGd5Eg35j6yM9otyOqx7IWMXwbC6+ulX+1flKcpcHYC8Rt2az
         10QDMjEtZ745eNa1M6hCJoQg06zggXC0LMEedP8inohANGaKCK+ozKoAct7bepZtMsTv
         zS5vQfzI0K4qONVoe0xPKzgGeTTbPlIBnyqAxkHBssSzIQcNF4T9gV+uvxw90uxB0i9E
         EYcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkNmMGhRwY2QTtE+Xom0eJ4RDsRHpqlqLvuzOah+qHbglE97d8f7be6NRPp927T8/IcQzSEtj00VTzPy2+GS5p@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+qRNcgCUZtgQA0WyQBxbwHtf8WfKaJRAuO8yVB3wk/rCk5ftm
	DV7iPer7moo0/AK9EhCPCnIlbvFCN0TE2d8d92TSyLpOYIAye9iY6M+5jvU0e2jTyj4KjwoIBdf
	VVHSg5Q==
X-Gm-Gg: ASbGncu0DMEMrcrqfztJQ157j+sqcBLVagD/f4bhkOlHG9eTeLY+Ko30M1Yz98Ktdv1
	gXNoNBROQi2U8Yj1iQdzEEZpSy4bwV0OhHyPUf51itOWJWC7Fydil5T5U2zJ5rt6XYOvqR0NLqy
	3ovZh4eVZruF3dONxYNS81D8R0sidNpKHHpNTIejMv9O/lP3dQWkZ9sUDrX8QjaAC/u1HiStujm
	J4YH/NsvXi/YnDGofQov1b4xgFpJwdjMffPRZn4DyrqXTlCox06Mb7XQeF7chAsZ+tOMxTWFTR8
	3agGrGJqGMYIRxeRfWAD2bYpTieuWWHQoTZsx6i9
X-Google-Smtp-Source: AGHT+IFCw5/PULuUVcI3llc0y1a6yuLGG1HzrWtHK+9OOBjslUtrFHMO2qLGPE6HaWlamqpm+rB8Qg==
X-Received: by 2002:a05:6402:501b:b0:5d0:efaf:fb73 with SMTP id 4fb4d7f45d1cf-5d81ddc3ca4mr1883854a12.15.1734694077983;
        Fri, 20 Dec 2024 03:27:57 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701abd1sm1632634a12.76.2024.12.20.03.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 03:27:57 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH v2 0/3] Google Pixel 6 Pro support
Date: Fri, 20 Dec 2024 11:27:23 +0000
Message-Id: <20241220-gs101-simplefb-v2-0-c10a8f9e490b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJtUZWcC/3XMQQrCMBCF4auUWRvJRLHBlfeQLmIyTQdqUzISl
 JK7G7t3+T943wZCmUng2m2QqbBwWlqYQwd+ckskxaE1GG3OaPCioqBGJfxcZxofyjpHVpveUui
 hndZMI7938D60nlheKX92v+Bv/UsVVFpZ711Ae9LG4m3mxeV0TDnCUGv9AlSb5nWtAAAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_032759_866623_10F4DA84 
X-CRM114-Status: GOOD (  17.28  )
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

This series enables support for Google Pixel 6 Pro.

Since Pixel 6 and Pixel 6 Pro use a different resolution display, we
now need to add explicit support for it, we can not piggyback on the
non-Pro version anymore. This means having to separate them into their
respective DTs, and provide one for each of them.
There are other differences between the two of course, like battery
design capacity, etc., but they don't matter at this stage due to
incomplete upstream support.

* dependency note *

Due to the renaming of the gs101-oriole.dts, this series will conflict
with any pending patches touching the same file. I have therefore based
this series on top of my USB series from
https://lore.kernel.org/r/20241203-gs101-phy-lanes-orientation-dts-v2-0-1412783a6b01@linaro.org
and the patch enabling framebuffer support for Pixel 6 from
https://lore.kernel.org/r/20241220-gs101-simplefb-oriole-v2-1-df60e566932a@linaro.org

* dependency note end *

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
Changes in v2:
- We now have a generic gs101-based Pixel board DT, which can work on
  any Pixel 6 / 6 Pro / 6a
- Pixel 6 (Pro) are overlays onto that one.
  This has the advantage that all boards can be supported without
  having to have a full copy of the DT for each of them. We still
  instruct kbuild to create merged DTBs (in addition to the DTBOs) so
  that existing scripts can keep working while giving the option to
  just apply the overlay before boot (e.g. by the bootloader).
- The binding has been updated according to the above points
- I've changed the simple-framebuffer node to specify the memory via
  memory-region instead of reg, as that avoids unnecessary duplication
  (of the size), and it avoids having to specify #address-cells
  and #size-cells in the chosen node (and duplicating this in the
  DTSO), which is otherwise necessary to keep dt_binding_check happy
  and DT validation working in general.
- sort overriding/extending nodes ordered by label name (Krzysztof)
- format patches with diff.renames=copies (Krzysztof)
- dependencies have been updated, see below
- Link to v1: https://lore.kernel.org/r/20241216-gs101-simplefb-v1-0-8ccad1830281@linaro.org

---
André Draszik (3):
      dt-bindings: arm: google: add gs101-raven and generic gs101-pixel
      arm64: dts: exynos: gs101-pixel: add generic gs101-based Pixel support
      arm64: dts: exynos: gs101-raven: add new board file

 Documentation/devicetree/bindings/arm/google.yaml  | 18 +++++++++---
 arch/arm64/boot/dts/exynos/google/Makefile         |  9 ++++--
 .../arm64/boot/dts/exynos/google/gs101-oriole.dtso | 33 ++++++++++++++++++++++
 .../{gs101-oriole.dts => gs101-pixel-generic.dts}  | 24 +++++++---------
 arch/arm64/boot/dts/exynos/google/gs101-raven.dtso | 33 ++++++++++++++++++++++
 5 files changed, 97 insertions(+), 20 deletions(-)
---
base-commit: f70ddfc479f2fac1d0b744148743c25ce1778f01
change-id: 20241216-gs101-simplefb-8aae80278ed7

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


