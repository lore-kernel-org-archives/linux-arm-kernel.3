Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12194C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 09:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=D5vVXw+LoXYmvFQxN+y9Jtu16e9jAjGmsO29XS/9U5o=; b=ofR08UkCrINU0q9Php+hWpJWuf
	sQkXsRBi4m2pD/ooHIOCYyNpydhWavXHf3gMykxW89jaW6pczRK4cUbHX0LgGEvKUIX86NsaHExyH
	LDKzUq3cde6ix+CmqJeaE+Nq3KdOfhpoB+Tr7b/YQX//3gcXHpm4odCClwU8jbwPLgFBVMCFAH5VX
	/EMo0L3KHbaLswJOZchJRk6uOFk6xqxp14EFC1DGwyxAn9ElE0XoqjxaSbVwUILKA1minfRX9X9WE
	5lJbDfuXAM21BVlQm2oQ4FFUpXQ2BTJajBqGs41EUMlNsGPbUbpQ5AzBWXVPmcg/5am0kes5aITxx
	mGDEO5sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubyiD-00000007K21-3fmP;
	Wed, 16 Jul 2025 09:46:05 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubyfn-00000007JhA-0J6Q
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 09:43:36 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso6814268a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 02:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752659014; x=1753263814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=D5vVXw+LoXYmvFQxN+y9Jtu16e9jAjGmsO29XS/9U5o=;
        b=VSwnw14D4suPxI3o6LMaw2gwK9+r2kH2Rv6JzNkn0ACKz5zFrh3pmVgbnrp69L8u/k
         Tz3uq1J0cQVN8VrLA95xNhQYbGhYqKRfwzrv2N7d5iaKrFoHFP1XR4NEjNsyXW1F6dLG
         6PPCND+fCFRzwJwTvCJ2IkEBssXam5dpraKAkihmSN5HlOlvo86pWgnxJOXIC772t7SD
         NBkxiSP6OYg+lDlsvwDk9RTFLZM9SD2Cvpys1NedJUCvsd9skCIw5Je/9eSlmmgc197S
         vc1SEGPkiAh7NiyiJblzEOfN5sHOllqqaOaToHPjw5oBcCefPR9t46YoxVWjNLQrmW/o
         6eoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752659014; x=1753263814;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5vVXw+LoXYmvFQxN+y9Jtu16e9jAjGmsO29XS/9U5o=;
        b=AGPbOLgrOjti/SFj8vGXIxY6Fj2/bRXz6XaqrgcCZTuSBxYw1PuSNO1RFhk2xSvTpB
         /FZGfoF6VUA2p5hTna6LpUsZWkdLwW7QunBRi23xTzyYnxYie1kHtj3yLCTl6BGz2xCZ
         /NH0gPI5XjPoCFLy40rI4gkMkdY8/EcemsRspmLV9ey5WgsL7va1BgZfG8gGmQeAQiJx
         7BPwJ69mUdeCnXOQpC2vZpHmgjyAPH5MA3QHnGksxOqWZeZ8rg0gyjDBljoPXINOdUhz
         4jQh0Iq22nwXizrs+ixO7lvK7QKL9QENHAf5gXwoN2gT7MAxeZvMpopynQ8iSr0Z0hXB
         vUrA==
X-Forwarded-Encrypted: i=1; AJvYcCXHUcfdaDKtbCy+FktC6AqYgC8iP6pVpOO2Eh0SsywEPdeAHXf54a/m5f80Hb4481mWVBCdXJAiGHVHb1z2eqtF@lists.infradead.org
X-Gm-Message-State: AOJu0YwwrzBznenbN3Qxx+W/tb3FCDKi+0Hht0FVzCGPNX90B8Q6aowW
	T14zPmCakSdWpG6JHSJiPXQ16BLzhHdoeadlSuTjD9067oamyVhCiHSO
X-Gm-Gg: ASbGncuMUwHwVkACSFtemjpBNpIT/w8z0qdmuOBO5utK9adcOXMh6q/jwXHMriro9ew
	yB6KF1Vs2ahxvv7awfSvtaHbAIs7/DfjLhA0wm5821oyK6VWJQ6Tg0pL5KFR3iNnEyFbhw88hom
	q/Wgo0JXFsJCOjIaGltsNNwa7Dw4DsrU4CqKp2JSKHTy9F4lW3+c1Rwhr/mGKObofGfvk+e9Has
	SlVP348hYO1rmLH4E6p+xO+4cHWjfm3F4SZ2hvXyXm2mevr3T9xSxWVVWSBoTWIt4IbIsXG5LR4
	ivxxpeo44NhVQFEtG8RhCp2QvKfHI1V675M+IVqlpO4v/oIPYujBNPiIfCdNXJ1Cg+LGS92QvbS
	E+dt4tNGZjII44yqUlxfOWkBVEXdw9UlhCoITThnBj/MoYVufge7wP/J5QebPDM85tiSPLW5dEp
	LGaMNbwFoU
X-Google-Smtp-Source: AGHT+IEQ8TA8a/Tp8JVUJ4l4ZbjYlDYN0wAMilYaPQ7xEw3y9Z5/A8bzzrn/UjeSnv2yhj0GESvLrA==
X-Received: by 2002:a17:902:d547:b0:23d:f499:79fd with SMTP id d9443c01a7336-23e257647e5mr37218635ad.40.1752659013872;
        Wed, 16 Jul 2025 02:43:33 -0700 (PDT)
Received: from pk-pc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f2350acsm1039503a91.45.2025.07.16.02.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 02:43:33 -0700 (PDT)
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
Subject: [PATCH v9 0/2] Add Meta (Facebook) Ventura BMC (AST2600)
Date: Wed, 16 Jul 2025 17:43:27 +0800
Message-ID: <20250716094329.1069203-1-pkleequanta@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_024335_109605_DA4E156C 
X-CRM114-Status: GOOD (  13.08  )
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
P.K. Lee (2):
  dt-bindings: arm: aspeed: add Meta Ventura board
  ARM: dts: aspeed: ventura: add Meta Ventura BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-ventura.dts    | 1553 +++++++++++++++++
 3 files changed, 1555 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts

-- 
2.43.0


