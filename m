Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5013BD10C03
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 20:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cNNg7zzXFJSGsARqfxEpGo4FAbXgJfDgVsYkeL3nKao=; b=YLGtgQBlt+0Gl2
	zLbln0OaEMki0CTO34WbS0mXv8pRGBFEmLNB1awmZiIbFVscO8q9x7qrtFNcK0YQpU+MM7FCq0zXK
	3cWTzEQE8rm3jsWLVOomPh4Qg2NmqR6zDPCfg1tmAxEdsAm3QPkc44q74x3XVRKQ0R52fcRS5YeOx
	mDspFrqByRIowLOwsxOCfVovZCaLOIJXhAax3ahdNNpFC4vn3hJC/o66cwF3OVEk7Mn2ffErjp7SE
	dXY0AOI1QDMcbMKLYmWnVPSbWrA3Dat35JNivPXxFStgAhrps4KFJpyr3uyTZPBgvzzqebg5C5KRo
	TsaJXm41PUQThdauVmGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nRG-00000007ByX-0OB0;
	Sat, 26 Oct 2024 20:31:10 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4nOi-00000007BfG-1GmI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 20:28:33 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2f7657f9f62so28538251fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Oct 2024 13:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729974509; x=1730579309; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cNNg7zzXFJSGsARqfxEpGo4FAbXgJfDgVsYkeL3nKao=;
        b=aUz+B8vG+ZAtamc6xWApQgRZBgYGDEnQHFIbGdynE28pzR/zxwzOWUXUM4Rs++1I85
         F4APyZOnrhY761z8aBfvAiZbZSFHX8GTVOl6f5hCaRixPrbhQIXYJf3pOO6Z39Jz03Bo
         Xwnoj2/6laZKqEwtPoi/pfizntRFRm2GlNmfWMausohjbFiC4Qrdvo14oQQdbnGH08Ah
         WPk6lBkV7rYnIzVATQhpEWlZeHgBAMzesetEhQte4XdBALB8i3ajglfHca8l84P5kGbe
         yvHt39FHcpVouRBfi96+tt5ZrAwhFKGA0NsWhgwMbPJbyLe/u2Va4pGFUKgEJTEAScA0
         rg4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729974509; x=1730579309;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNNg7zzXFJSGsARqfxEpGo4FAbXgJfDgVsYkeL3nKao=;
        b=fx8p9+3NSZgBz7lZcBp+bVSIBNVTXFy83kDjG05o0fMnRFRLVPVNlrG8hwHPtiCaCt
         Yr9mgKhdGHAP9NNkCNSeM5UYOqc2LqJqzzRBPOSf5/xVuz8ZyBbawI+zjozp51syBioJ
         myEFxu6JiQ5RXGx2DFr3o3rVCz1gCkKUgSwZQaYRvwZShVaYsKclx/vDzojlgqJI1Euh
         33K2xdUmKinrhdQSSaY3IBujyi0vPxB9y5MiMQOv1Q0ZF0tyGN7awnJEKRR8Ef4aipdw
         ua55kg7URWlDJhGiV9YNCaWnwUwNlRvKjsVJnFi/lUgBXHcXvfVng+zqZa7z4sESTOOE
         GzJg==
X-Gm-Message-State: AOJu0YxoGlyb4wCf5daD5hDyTgFf9G/jGuktDGe7U5VqpYDagEmdqASG
	3gRq+aMQ5ynAfJEMOQtztOVv8FDxyw1N/4OoOy0ImzyrFNrz3BCQ
X-Google-Smtp-Source: AGHT+IESiuS1iKzvuE8ZzZM3tstDBPTHvi4LpV62cM6BsC9Kiz7nGmLch+PHppJzR77qJwttX7SpNQ==
X-Received: by 2002:a05:651c:4ca:b0:2fa:cc86:f217 with SMTP id 38308e7fff4ca-2fcc940c73cmr351921fa.35.1729974509067;
        Sat, 26 Oct 2024 13:28:29 -0700 (PDT)
Received: from [192.168.1.105] ([178.136.36.129])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb451a494sm6370421fa.39.2024.10.26.13.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 13:28:28 -0700 (PDT)
From: Markuss Broks <markuss.broks@gmail.com>
Subject: [PATCH 0/2] arm_pmuv3: Add support for Samsung Mongoose PMU
Date: Sat, 26 Oct 2024 23:28:07 +0300
Message-Id: <20241026-mongoose-pmu-v1-0-f1a7448054be@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANdQHWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDAyMz3dz8vPT8/OJU3YLcUl1TIyMTg9QUY0OD5BQloJaCotS0zAqwcdG
 xtbUAi74RGF4AAAA=
X-Change-ID: 20241026-mongoose-pmu-52240ed310cd
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Maksym Holovach <nergzd@nergzd723.xyz>, 
 Markuss Broks <markuss.broks@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729974508; l=905;
 i=markuss.broks@gmail.com; s=20241024; h=from:subject:message-id;
 bh=Ctuv+X/u4Q3Y6JaiCMyXRkwH6JLPkazQ4p5Gw8ErVTs=;
 b=oALoBWszqZ6dy47IJH8/aQnv86LTjr2f8ij5r5Ykxk6QX21A4nGEyqhUcqrf7qHphoKCrU9fu
 AOx5ZzTBuslCdM9DDf04cbscGyCksv8DAbrc2uU4IDI2XP5PGKZN/bR
X-Developer-Key: i=markuss.broks@gmail.com; a=ed25519;
 pk=p3Bh4oPpeCrTpffJvGch5WsWNikteWHJ+4LBICPbZg0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_132832_381924_8C484919 
X-CRM114-Status: GOOD (  10.47  )
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

Hello,

This series adds support to performance monitoring unit of
the Samsung Mongoose CPU cores. They were released between
2016 and 2020, and they were used in Samsung Exynos SoCs,
such as Exynos 8890, 8895, 9810, 9820 and 990 (9830).
They implement ARMv8.2-A ISA and they are used as a fast
cluster (big in the big.little scheme).

This series consists of a patch adding the support and
a patch for the dt-bindings.

---
Markuss Broks (2):
      dt-bindings: arm: pmu: Add Samsung Mongoose core compatible
      perf: arm_pmuv3: Add support for Samsung Mongoose PMU

 Documentation/devicetree/bindings/arm/pmu.yaml | 1 +
 drivers/perf/arm_pmuv3.c                       | 3 +++
 2 files changed, 4 insertions(+)
---
base-commit: f2493655d2d3d5c6958ed996b043c821c23ae8d3
change-id: 20241026-mongoose-pmu-52240ed310cd

Best regards,
-- 
Markuss Broks <markuss.broks@gmail.com>


