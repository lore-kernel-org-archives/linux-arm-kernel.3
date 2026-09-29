Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8509EC9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 07:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rzcdTpogRZ+AxGuwL3IEbWBoohYfCz3D35l9Eoy+zTU=; b=i2+07lgCi9re1DKX0/QOE86Gt2
	ogNlia6d7wxdlN3TMusssMwgYvclFpE3soDgzOjc6gmkDUcZAiDPEGkoawq6kDo4TYJC9V+Fvexy1
	us+OKqDpfGWi5YAL1xxVy4z/tjapTPrwiwU30qLKLyDLSo9fc6kasS61nscf81qpQRoRqEzoABaHU
	cqmdsbToKEYN55oC7OzqtqIKzPe9AE0mCzSLGKCPHqbVOpIjyLRQcfJeaPmTO58iMPIPmDq9Veo2q
	8yBMXlfVPDghb+Dk1FEPNvZZOu3v0vE5slh1C1P+Ssr+uSSwnc0BdXyX+nzOP0ljEVLgrDmWCzdQo
	BJ+PG04w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBScT-00000002ewr-18SU;
	Tue, 29 Sep 2026 07:51:21 +0000
Received: from mail-pj2-x0a.google.com ([2607:f8b0:4864:39::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBScP-00000002ew7-3TTe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 07:51:19 +0000
Received: by mail-pj2-x0a.google.com with SMTP id 98e67ed59e1d1-3a0aa5e2b20so1231071a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 00:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790668276; x=1791273076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rzcdTpogRZ+AxGuwL3IEbWBoohYfCz3D35l9Eoy+zTU=;
        b=L6jCDC4IuO3Pb7lqtTtHKhjYnBzMK5DwlEyX6/3c0VoS6ongov5vd3KdIEMZx7pCI2
         3t+mehh1ALZXE/Pah8uCF4DcIdqODpkfMEil6WfYsEH4MGG4QWLQW99BKUADktCDZUeL
         bpQqPNAVLjM/RgNPxmCtpoX+hbDrZRUqFPhg5+bM0ntK5m3NCdE3eeGBLGn78HQv+svm
         36CR4JZwxaLwnxQzoS634cMuKdcrdgGdBCc3IabnQ7Xlj/HQ6HOQRth8kywbOAvzovUc
         iGD6cUVYUMixwNY6cTGEL290y58sQLQIkeAfwFWgbTJGhQgat6/MgBsp8ZTA60P825Fy
         4YAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790668276; x=1791273076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzcdTpogRZ+AxGuwL3IEbWBoohYfCz3D35l9Eoy+zTU=;
        b=KqWfGbvMOPIEBxQKBiFo/oUBCImKDw3Q7O0cz1XT7UXLIHUadrdCKSwNYfKIESM9ob
         IqJShJZMranvws4Sokf/6/sp2rMvQUXF4PPSTCyyI7y/UvB3/qDhF9I8SPITEOAOnyar
         92wBGh8HU64cQBGede/IOmNqK3Hb0J8JgJxiPINaCJBLmyPQRYf2Wcv5aaIYQGK2XQ3n
         v5WkUHTB92ruR/7FCUIBXDb06W2OFbhCTOWK2guQxOg/AyEb9uSsnSjwGluSJvVpcE90
         cNyCWE3tc0rZQdAYIHZFR2wE3iFjcU3HxplVdIt7vxr4e6pVm3BgPttbzC256MkYM1hn
         XZfQ==
X-Forwarded-Encrypted: i=1; AKwUvBxQZUbyJfrnmuShz2+w/fGhsUhFs6lLtYHFejNqJTViUCSS38P5zWZzbZLNQHuqX9UlE1s+cMYTzE0HFf+ZCz34@lists.infradead.org
X-Gm-Message-State: AFq9FYIagdaRJ0MwRz8aa+yvfyaZ+hCNkkHfIAnIfjkIU3BpmVHt1N01
	YyjmQHukV1KO7KfGnktyi5CLZAbP2TkTKHxGRkubGrlJzpUeAtMbkfL3
X-Gm-Gg: AYBFou0MkDByWXMtvgG2xP+KuLAhbyAG8OpvPCWoBKY81je1dGMQ6ZzvOnpIaw4hn5v
	IGTK+uCX7q1fxL3ygQMdo0fgwm7lLrvRyC4HKu6p7pZ1edOrvFRh8JEETuEc2CPybHviYJIiDlz
	3wuufonFy4R8L13nzFywCtZEIjY5985YfUQ4STeiL8cxI9AOkApMHd3f2u7k7hEycVqqV8eH2t6
	1wQrgLrXbg3eMLlrUIDiV3+FiLDPLSTLkthhuUFpyA3iBAQaRXpUbg81ag04WTjLe4pyF5cou8Q
	7vVj8Ok+WqpT1eedS17Y6ZrErR4Cx6PPhX7w2eXHePBLCZ/vyWxlW9Q7Is8oBVc/IxkQ8g0h4u+
	IdSMO6sl/Die4iqwEr6g9uw/NPZFIflwkcjRhzfXQsFU2qE7svjQIFGxu7UUDZ+FJ1HP5M0Tb44
	01pFmXR98Rown3Mxl27RNbJ+jPxcqK766SdJbshhranHXqVATmIiyyZTfrSMV8Je8HkzeeerMYE
	ptJ9DWv/5fPo3plEyvxQkgOlvDdrODS7n3AqRVY3C4ZflXx4TqU1oP2NXuNXA6YHV0=
X-Received: by 2002:a17:90b:4c4f:b0:3a0:bf0a:c9da with SMTP id 98e67ed59e1d1-3a0bf0ad1cbmr11593880a91.47.1790668276375;
        Tue, 29 Sep 2026 00:51:16 -0700 (PDT)
Received: from suewang-PC.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497ebc998sm4049236a91.2.2026.09.29.00.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 00:51:15 -0700 (PDT)
From: Sue Wang <suwangquanta@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	patrick@stwcx.xyz
Cc: Steward.Shih@quantatw.com,
	Martin.Peng@quantatw.com,
	Fred.Zhang@quantatw.com,
	p.k.lee@quantatw.com
Subject: [PATCH v14 0/2] Add Meta (Facebook) Ventura BMC (AST2600)
Date: Tue, 29 Sep 2026 15:51:04 +0800
Message-Id: <20260929075106.74731-1-suwangquanta@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_005117_897790_AB28D9DB 
X-CRM114-Status: GOOD (  14.55  )
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
devices connected to the BMC (AST2600) SoC. The purpose of Ventura
is to detect liquid leakage from all compute trays, switch trays
and rack sensors within the rack, log the events, and take necessary
actions accordingly.

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
---
v13:
    1. Add two GPIO expanders (0x16 and 0x17) to i2c10 and assign two SGPIO
       pins as IRQs.
    2. Move the RPU_READY_SPARE_PLD_R and RPU_2_READY_PLD_R pins from
       SGPIO to the GPIO expander (0x10).
    3. Add all tray PWREN pins to the GPIO expanders (0x16, 0x17 and 0x1b).
    4. Add explanatory comments for "unmanaged mode" under &mac3 and
       "intentionally left empty" under &mdio.
---
v14:
    1. Modify "Facebook ventura RMC" to "Facebook Ventura RMC"
    2. Add a description for each bus alias.
    3. Revise commenting style.
    4. Enable mac0
    5. Remove two GPIO expanders (0x16 and 0x17) to i2c10 and two SGPIO
       pins as IRQs.
    6. Move the RPU_READY_SPARE_PLD_R and RPU_2_READY_PLD_R pins from
       the GPIO expander (0x10) to SGPIO.

Sue Wang (2):
  dt-bindings: arm: aspeed: add Meta Ventura board
  arm: dts: aspeed: ventura: add Meta Ventura BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-ventura.dts    | 1607 +++++++++++++++++
 3 files changed, 1609 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts

base-commit: c0538446e769fab620225578d378a0627b883bd5
branch: dev-6.18
-- 
2.34.1


