Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D72CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/TUqvK1nMqxWyA0LRFmuiAwqCHrTHKTi4X6rqOEVERE=; b=Qmu4mIYGBCoS+e
	UAzMxkQTU/C1d+o6szcZ11Jx/HM6sLMCCd3QneSSbfX1nl+uehslyHtOHRPys3g02fSKsOv4IFdA3
	U7LmZITWh+Z9xjirtW9FjcZba3/aMsVW/JXW5Xn4Wf6/P5I+hp15CegGvEbA4yNsLjp4fr688B3W8
	05e/062m7dXpoo6QjGoMx/BCAQuF7sUPiysMSFaP/AVIPVDoYiwucNiNl9LC2CsC9Q6x2y9DaaR33
	SCNHr2A97HspzU4vMrJR7Bc/gJFIMk+iXlVhIeDTKgCc5IDet/xaahqXpTYF2WAimsmElW8geFIwu
	h+P3C4S1Hsw3Djrprieg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphwl-00000004DnA-1wUs;
	Sat, 23 Aug 2025 06:41:51 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upVzu-00000003H1c-1QOB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 17:56:19 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55ce520caf9so2749492e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 10:56:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755885376; x=1756490176; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/TUqvK1nMqxWyA0LRFmuiAwqCHrTHKTi4X6rqOEVERE=;
        b=NTeDGjORTWu5QjJGPkhPsveM/Q2bFnGoGYPNC+2+uLvdFspwuz/fhdZJKl97cnsL7F
         1Aru5yLeEziKWJD5IZZDMfAD7+41L8NSyTB2vZ44/iSL2uOaDbR6pUPgeFwCTSOTzxHX
         d3gaD65RfwaOgpqK1tbIzYp18gLNjnTaeXsJa9uWBgkhkdHkGSQeEI5okWCO6Oq3X8HN
         uTlrUUMHKCx5OwQNcwnjeKlxSx+IfTox5ab/9XVhYpnrgR3uGusrMSD/57dJQMkrq1u9
         KVrMVP9CNp9n9lfmvzdLmwjpWhggrDodKH0qIBsn6+yUBewHco3ehxvOSuKPyntHUEhz
         WOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755885376; x=1756490176;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/TUqvK1nMqxWyA0LRFmuiAwqCHrTHKTi4X6rqOEVERE=;
        b=p6JDQpnAhPlD0GLsnPpEiwBjKSSkoJ1KDjVTxw80n8JSzIUmEX8PsHR8uC5prNzUyM
         b0SX/5qMKPbGBeuV7kPV8zymeaADg/5QVfr5KpExrMeVVvJBGUFH+/e+vDm1k3I0TeYg
         EB4UX0G4pZ+wBO7uTZnUIIVHuzG+T0/DiltVR1ClnUcmwjI3wmMl6vUQwp4mgiY3WPfU
         PRcArdvanrNY/EAqOhVFrU9IgTdXE9MzaK9XAdP9hhDvin3J0aiEJH54XuhdZNAU8/nC
         tkEziQ/LlY6iC11hh402DMPMGr3KZV7Z5eeq7uYFcRhyy++dLrLgGgG2XejZ7NF9NQt2
         7sow==
X-Forwarded-Encrypted: i=1; AJvYcCVqmHx+7l97D+kQBmVo0cYByHxndDBT9HIbFzWICqd0LG3iOYXFEQngb/siYeu+GzXVqgeeBQBeRxxgGt4uNVG3@lists.infradead.org
X-Gm-Message-State: AOJu0YyLxZ64oCVxzVuI0bi3pq9uJenJ/JH+R4KtjyXN0c2lCsikLywq
	AdJJ7JhRo4fpfEzM+YTLHkBLhWX+r9OJ9hO87DJb/qGncm4C5iuq4jqLSrWAfKewlxA=
X-Gm-Gg: ASbGncv/eO0dIzDPLGCOBNM6uK1JkjZQD/e6GOl2SdUlpYhdjNHTuTAOu0a7RUgfzim
	X5kM7UYIxE4/SBTXi3EX2e2eDa7zOVkltqBfxJM7R7xgo36tTwoL2tin48ncPQ7UfIyoPWqDGFW
	pbvgr3Odv1KKOT8ZMFq9A17QGeU4Dk/+6WS+1FzDxKl9Ovi+jYi0xwCSUMmaI9pFvXG26An3vN5
	BZ3va+x7zvWeYf2NwtjU7NA66piWX5eMwQ6FZ15vvEjFU+iy3JMIf32QEwv7WHteW1cispTR+TF
	dnWwCFId0MFFKjVY7+EILqOTbdqpwLuny0d961HzNtANzFy4zBYjlct/SMnJj4X/fnrOgX7b8yN
	62iwbgN2O1xxjlVdkhsQ1l/X0LRjZrFkj
X-Google-Smtp-Source: AGHT+IEGVok/1yO+9VU8KCrNRX03SOhV/8cVPhiDqRVEs5tM3GGx3ezrydTHI+IAn29DeKHuTkAYuw==
X-Received: by 2002:a05:651c:2147:b0:332:3a1c:beca with SMTP id 38308e7fff4ca-33650e28028mr8185451fa.7.1755885376260;
        Fri, 22 Aug 2025 10:56:16 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e20d2e1sm605121fa.1.2025.08.22.10.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 10:56:15 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/3] ARM: dts: ixp4xx: Add device trees for MI424WR
Date: Fri, 22 Aug 2025 19:56:13 +0200
Message-Id: <20250822-ixp4xx-mi424wr-dts-v2-0-cc804884474d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAD2vqGgC/32NTQ6CMBBGr0Jm7Zi2FEVX3sOwqP2BSZSSKcEaw
 t2tHMDle8n3vhWSZ/IJrtUK7BdKFMcC6lCBHczYeyRXGJRQjWilRsqTzhlfpJV+M7o5oQk+NFY
 Id2odlOHEPlDeo/eu8EBpjvzZPxb5s39zi0SBj7OVItRWy0t9e9JoOB4j99Bt2/YFf+gIVLUAA
 AA=
X-Change-ID: 20250814-ixp4xx-mi424wr-dts-afef5c00d68d
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_105618_398557_7F82D443 
X-CRM114-Status: GOOD (  11.65  )
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

This patch series adds device trees for Actiontec MI424WR
versions A, C and D.

These routers are quite common in the Americas and uses
the IXP4xx SoC.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Fix some wording in the compatible boards patch.
- Split off a series to add proper compatible and schema
  for the ixp4xx expansion bus MMIO GPIO and use the
  compatible from that series, iterated that series as
  well.
- Link to v1: https://lore.kernel.org/r/20250814-ixp4xx-mi424wr-dts-v1-0-b7c10f3c4193@linaro.org

---
Linus Walleij (3):
      dt-bindings: Add Actiontec vendor prefix
      dt-bindings: arm: ixp4xx: List actiontec devices
      ARM: dts: Add ixp4xx Actiontec MI424WR device trees

 .../devicetree/bindings/arm/intel-ixp4xx.yaml      |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm/boot/dts/intel/ixp/Makefile               |   2 +
 .../ixp/intel-ixp42x-actiontec-mi424wr-ac.dts      |  37 +++
 .../intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dts |  38 +++
 .../intel/ixp/intel-ixp42x-actiontec-mi424wr.dtsi  | 272 +++++++++++++++++++++
 6 files changed, 353 insertions(+)
---
base-commit: ddf87238d4535eefe858b642ee54f6740018b487
change-id: 20250814-ixp4xx-mi424wr-dts-afef5c00d68d

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


