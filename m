Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27591CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 12:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j5iEAlc4MoMtFJUAvR6dtjmQqf3jvqvKGSuRvb2CExE=; b=pwlHSzrSXQ8O3YDzACMEuHO8FV
	9SEvljGibRmezgftGEm3bLD3vpQ3XQ7xbIW87JQ4sHAknD25yHPGJnHxwqjy+Ilaq53om8JUFeiQS
	8SwrNUNLHjDpcolGZhC3EE6GFZ+MlLdgMI2YV9XEP+j6j2i1YFxhbCe9jy6yAOxLoYmpvHSvQLcj4
	dUMmhVqCLijj6ujtrNEMabahMZDbuqc/FThuL9yfIihCYxwKuUAowUkVFiQR6sSaPYUqYb7DfgAIj
	UKSAg/UUK/vCZuZ9J6ALyZw89hddCB2KrJKdnvo9UivJUPV3JhrGp0TMx4YqCuhHj9SiPTFmj1DEI
	tUrG6Qbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmzD-00000006TNM-1VBH;
	Wed, 03 Sep 2025 12:53:15 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmFa-00000006KcG-1McF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 12:06:07 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2445826fd9dso76352955ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Sep 2025 05:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756901165; x=1757505965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j5iEAlc4MoMtFJUAvR6dtjmQqf3jvqvKGSuRvb2CExE=;
        b=GHHoJN4IHmzgz1UkZ7y6CUu18F3EVdsE7t8dHpNTZPZn0dj8ZayUvZg19xoMbENaya
         V+jHMyVKQU7JXz/cpnBYnq9ctJb6n8zI4D7Id2Jf3EEP3tkQGLwbHp1lBgOOS3vkuvmj
         qzJEXzVlSrGMIuALnndeErK2AiG7b/ydaPCOKgo04CVQMad33RdY5mhHcE5pRYYOFFZZ
         HFB2Q31qqfw7D1miINq+TnhDtmktgLTS4r9Dx5D7wWi6rjgCpRqP5gyGnjVdpGrutLov
         1/IP15VzuSr7DrvZCtCGK+hqgTFFBTxoeJkWpc9Gza/N/3Ca1fKpnlKAazjnhcmB8hD4
         sKAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756901165; x=1757505965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5iEAlc4MoMtFJUAvR6dtjmQqf3jvqvKGSuRvb2CExE=;
        b=EofjPnhXdfcgJkjOHd7KokzSTq3h6NPRrs00YCMFvatcbcR4IvXGegRTYYJ5Nt4AeE
         l5yT18NeLxAwu/fEAQ6xc5OJIluzoliizaN99y3W5HvHocTqbVSwTI602Vd+xI/XfUyv
         GUzkX6cOfZCp7+xq8jD2Kt7XXcCqIgdtQGCvreTfsjRiBB3nZYoMPgJktMUixMOx4T9S
         RHUSy/HpW5p/rHc6+cH7n81qNThVa2Bvss7EBtVKVkO5UZlEEuo8j2oePblna//lJttn
         25ko4A87KCwZoEvycI643zB7F8/mXYQy9bS+/8ZtVApgHA6G+HDsSOhENk3sPPOD92qb
         vIqg==
X-Forwarded-Encrypted: i=1; AJvYcCXfjC3ovT834THhrJTt+WhV2wXqn2N1E5kPn74/sL80uo9SlErRg3TIIqONp89lKw3cTUjUP1JR5ZTw+edqd+vf@lists.infradead.org
X-Gm-Message-State: AOJu0YyLSRsjKXia3wWn+B9kXZC8pd/ASEZcuvh9CBNYWCIoZ6T/5PH/
	tQgH5NSlh4hb5eR9+2x4N1K5GRRAGNO/nC4+eLmUhfxRC5VAGeM/MPmU
X-Gm-Gg: ASbGncsCSgWl82EuNjaYWwvCSWFBt3ebyhYOYfUEqmQGhq5D8H1gEYuxyrgiyzVmeps
	1G+7EPuSjYSBDaZ5YOsWhMrvkIlzCDxOoYuju1kw1jgKj4x0Nnvxd6D8vmtbtDaSdRIxbC6QOIR
	Lg83Gsx8B4dHC0ZK0CSh+hmdlXZx/fp0Ue+Q+dafupTpX1EvSS0zdnxTTRQhFcV/cDiWC1w1f9A
	PDdDc9wSaZGA5IdjXR24BVPx0RJM2CBUaHe820FtEhHk0OrzKA3aPWNdUrhsTEYGURMFFQPWwJR
	7IsBCM2g+p8LXZ0FNhg9Tu1ilGtdYzH13Kd/PsSMbXlVcZ97AFTEHi4041KR7RreKjyv2ed8F0H
	nkGJ4NJkVwITSLbWOabRO4wTmqEiEYwRspE94DwPOZC0mAatHQjG/XAaV/4kaGsxHVlyK3bZrsR
	kQxiaYm0Ng5p+krAYhrgzTbyCRIrUOvQ==
X-Google-Smtp-Source: AGHT+IGmOK+zU4uhlF8L1/G5THkM81+gGkxdGDOsluSdhqpOhIUayM/TmHmVlI5g8VrEuAb6A/4e9g==
X-Received: by 2002:a17:903:2383:b0:246:570:2d9a with SMTP id d9443c01a7336-24944b1fc6emr204959945ad.59.1756901165063;
        Wed, 03 Sep 2025 05:06:05 -0700 (PDT)
Received: from pk-pc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2490648c89bsm160905185ad.109.2025.09.03.05.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 05:06:04 -0700 (PDT)
From: "P.K. Lee" <pkleequanta@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	patrick@stwcx.xyz
Cc: Jerry.Lin@quantatw.com,
	Jason-Hsu@quantatw.com,
	yang.chen@quantatw.com,
	p.k.lee@quantatw.com
Subject: [PATCH v11 0/2] Add Meta (Facebook) Ventura BMC (AST2600)
Date: Wed,  3 Sep 2025 20:05:58 +0800
Message-ID: <20250903120600.632041-1-pkleequanta@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_050606_366459_0739C818 
X-CRM114-Status: GOOD (  13.91  )
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

P.K. Lee (2):
  dt-bindings: arm:aspeed add Meta Ventura board
  ARM: dts: aspeed: ventura: add Meta Ventura BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-ventura.dts    | 1578 +++++++++++++++++
 3 files changed, 1580 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts

base-commit: 533cec246f7f0ccadd7d9fb4e664d38418633c6 
branch: dev-6.6
-- 
2.43.0


