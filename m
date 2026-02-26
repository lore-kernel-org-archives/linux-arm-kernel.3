Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DA7FD461F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 05:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zB5OIdRyUZDuHaRXYIxGa9y4I4rBgImD51alFFCj5V0=; b=mLk98509/g2CekxhGs8pldPRgz
	iMkska9bGcxEc+McMJhnIgTmu+ImINLAj3YOGwgE02AlQ3HIMH5GEZ3cxx/m+2P77OSR78ElY92hZ
	qiNSfWvMQWE6QEWUQoRLBSaOFiVwAKDLVm/osshLjFN+S5VO+b7pFxRMJK/L0s6V+YCfuJrMIH38w
	NVfmDa5PpQPt7JADXMxgT3BfZtd1WqEvpyX35gxUmj47zxdzx1RuC3pXFq6/ZwliHg5CV7KdpO0/C
	hWoOVV/G+udA7PYXoJgo2zSMDitM5ANC77vnfDKd7C7V3mc6VEwaxYUhMcQ1oJlA6gu9hiSmL+nzX
	YYWmbhHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUMG-00000005SDV-2vCn;
	Thu, 26 Feb 2026 05:56:20 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvUMB-00000005SBq-1Osa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 05:56:20 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-824ac5d28f9so563240b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 21:56:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772085372; x=1772690172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zB5OIdRyUZDuHaRXYIxGa9y4I4rBgImD51alFFCj5V0=;
        b=mgGHn+r9Uuom438N4UrU90kKnUC1RyNBaZ4lHZ1oWVWdtzqq4MKOhC6lYRlp7SKIRp
         VriQsHp/Fsd/qVAdGkeOfVQ1ud53kJAw+qGb6j4AFH+YTu+8QUvsV/8HsuFWoz0XtZLE
         ZaC2663h4KzZfUxftlHRO0fQcPLeQ9pKAhevpKd8ajUygxwnmmOCsOeoCZmttUZhnlop
         u7mY1jQ+4XsGchdhqrevmQr+ARZwMx//yiOMNeJ4MPGeEJxDskGrOLbwUv47UZj9NddX
         7oN2+M2pKeNgs6461pGmsPutFO0Avsc4S80Yg18LmjpDjy6AAIBur8pgS8o6fPF1XsrN
         MZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772085372; x=1772690172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zB5OIdRyUZDuHaRXYIxGa9y4I4rBgImD51alFFCj5V0=;
        b=rRoqg1SCq+TLw3cK6X9k85tZLUyvATjUyGpqRzsMLJ/BUdO6Ar36DvvpYx0V9ZOzjU
         rPvgj7BF3sWQxh10GdEQyfcv5hoNokpQQ49CZKxKH9pwOL1idrpl/0bBDYFlraYr+abv
         lOYhHKazqXFDqJvQgwpMFe9cAYgkx+PoVdV5kNDd7MWvsbGlC1rEpjehJsvus70PPxC3
         NPlBf8pF/Ww37F2zQtOl3XxGFPqCpLaUnm1d7WaVNKJZrz4Jmh111PE0xFWcUCRhKLc/
         Mb/Q8qWD9QmrqX4HulDo1C5sz7bK0nTvNSuZEzteahuirYfJOhfgkME1E4LTCAnGr+sj
         Y+Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUlSUyfYo5KJjjar5jSeUFDK3c/inO/LhzcpA90lvLKZz918Ettku4b0vAVyYrN3C71WJUMqtVgYuAOpBx8eGOU@lists.infradead.org
X-Gm-Message-State: AOJu0YxRHCuW2ibGZ/2UOVPoi1ZuuIarekazYqudtfQnswHNhnRjhl9S
	ZAcM3M5MHqSwHjjOHXqAA4Pr4/tCELyasMDgY91RnzNWMl1R1hSSvNNC
X-Gm-Gg: ATEYQzxHFL/2LQPPvTvynIK+oEzuZbOFXznwRZ6sf9soy4d3BXUp4/e7DFZfZ9qyDf1
	Cng0HzS2681PznEv1SYctT1SkFQeOLddQRthy26ICw59CcX9M6HBmNDo4A/erKHEORjD23pzx9c
	aFta9VmnoxzalzMw+wzEnweFMm4PDht6ge8QsZuMmPe5HaQKkn4QaPB1dE1qXXSCQVd5WoB7wpl
	Ma73UTfScVpeISK3IqNmit8Ll4qMmd4VarQ5p5LeSSdxElUkYoEfh6+k9kLwawgrBfcbJmy5cX0
	UMLXIuqtraN6yzdJuN7acNDnVJ8qRfhTdLU/qXmoaUe4mab505elzDy2jhZaqz1/WcNnml+Spz5
	38iSkCAmE5kXpqKt/2s1oh9KgL8IFgmcyZrGcGDGdaef29c/VHz8nDIN1fUtf0puf7nqNqxOs9k
	7X28dEucJEH/MvWFLsC4txJ3lloWkZgw10XKarT/HPd84KNs9Y+VncAaVU/YSGGqS6Vel9SM5pz
	Cx/DfezR0gW
X-Received: by 2002:a05:6a20:ae2f:b0:393:73e5:7404 with SMTP id adf61e73a8af0-395ad20d49bmr2808764637.52.1772085372523;
        Wed, 25 Feb 2026 21:56:12 -0800 (PST)
Received: from pk-pc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70fa82c284sm767851a12.23.2026.02.25.21.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 21:56:12 -0800 (PST)
From: "P.K. Lee" <pkleequanta@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Jason-Hsu@quantatw.com,
	p.k.lee@quantatw.com
Subject: [PATCH v12 0/2] Add Meta (Facebook) Ventura BMC (AST2600)
Date: Thu, 26 Feb 2026 13:55:19 +0800
Message-ID: <20260226055521.1655243-1-pkleequanta@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_215615_377835_58CDA1E0 
X-CRM114-Status: GOOD (  13.97  )
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

Add Linux device tree entry related to Meta (Facebook) Ventura specific
devices connected to the BMC (AST2600) SoC. The purpose of Ventura is to
detect liquid leakage from all compute trays, switch trays and rack
sensors within the rack, log the events, and take necessary actions
accordingly.

---
v1:
    1. Create ventura dts file.
    2. Add commit msg.
    3. Use format-patch to generate patch.
    4. Add subject prefixes matching the subsystem.
---
v2:
    1. Modify email content.
---
v3:
    1. Add mail list.
---
v4:
    1. Apply git send-email --thread option.
    2. Sort nodes in the dts alphanumerically.
---
v5:
    1. Run scripts/checkpatch.pl and fix reported warnings.
    2. Remove unnecessary 88E6393X CONFIG FRU.
---
v6:
    1. Add a new stage for the DTS change.
    2. Run scripts/checkpatch.pl and fix reported error.
    3. Fix the issue in a separate patch.
---
v7:
    1. Fix broken indentation in the device tree file.
    2. Sort nodes alphabetically, then by address if equal.
    3. Rename fan sensor nodes from 'hwmon' to 'fan-controller'.
---
v8:
    1. This patch series has significant changes compared to
       previous versions, and quite some time has passed since the last
       submission.Therefore, previously received Acked-by/Reviewed-by/Tested-by
       tags are not included in this version.
       If needed, tags can be added again after review of thisnew version.
---
v9:
    1. Reordered the node sequence under i2c5.
    2. Added a description of the platform's intended use to the commit
       messages.
    3. Added 3 GPIO expanders to i2c10 and defined the necessary GPIO
       line names.
---
v10:
    1. Added IRQ support in GPIO expanders under i2c10 to handle edge-triggered
       events.
    2. Reordered the nodes.
---
v11:
    1. Modified the position for i2c3mux0ch6 and i2c3mux0ch7.
---
v12:
    1. Added a GPIO expander at address 0x11 on i2c10, and assign an SGPIO pin
       as the IRQ for it.
    2. Fixed the "failed to match any schema with compatible" issues.
    3. Reorder the nodes in alphabetically.

P.K. Lee (2):
  dt-bindings: arm: aspeed: add Meta Ventura board
  arm: dts: aspeed: ventura: add Meta Ventura BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-ventura.dts    | 1592 +++++++++++++++++
 3 files changed, 1594 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts

base-commit: e11fa6b1ff6c27c808d17e479bd7d5582e772062 
branch: dev-6.6
-- 
2.43.0


