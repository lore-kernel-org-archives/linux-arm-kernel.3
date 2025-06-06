Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA99C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 03:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JqrGZxZfe4s9xgG/EFT6KkjJVPgG2O2ieIG0K5ZMp14=; b=O8Ypx80cKtRGEEFAgp88hylft8
	dXOsg4HOyS0b6qaC0cJO8winmNdURPxhKOQ/HFTy4JVm3DZxPz5HL0sJ0dRbK08ILgIDHmRE9WXn5
	fwbEvdIIktWmpDnJaiNWT1CqQPNC3AyaXrfdVjXKecoMnWNes0u+rRxvQ4P2I+aLq9YA9XTYPgsAb
	lH6/BM2/NuyDho9f2kD7/i5L78Mc5ppJSdJkIorfl/b9y2zB2nu1ihoLR7PIO04a0YH2FAli75WTd
	cppaDLwBorXaKBD+WlMuQK+dUYtAckZqxqKFtqiHSxWr/eAajuuH4KetPMJpas1AwiuKAxb8wsfzq
	VpQzdsFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNNJS-0000000H0SH-1RYb;
	Fri, 06 Jun 2025 03:00:10 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNNES-0000000GzxZ-3Sdd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 02:55:01 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-742c27df0daso1651911b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 19:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749178499; x=1749783299; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JqrGZxZfe4s9xgG/EFT6KkjJVPgG2O2ieIG0K5ZMp14=;
        b=nVlmnk2e3lvRRn0x7wS7BQ2ow0HUrbkOrtTWXt90NkL+X3QpkDn/aRM80ao6C3ap7X
         fjGLxi6yEl5ENPnhstg8V5YTpXtyN53lCTcr/fWfQ+zlSCsG3R42EppgN1lvUzLeNLsy
         0iSDHtMTpEpdtQTk4zAQw8K7DMQO/nH4/Cr71pwqC2x4RBdiHTPVtCXAXSBWEMv4LWzV
         x4ocVVVUOLlLdtUVodA4h3KCDYwFeNy7viTTEtVn1vOrnjgN9zsPZCzcXQvs1qgGw+74
         cGGDe41n+0b1SocoF/818WqwnIq1MYShK61Sge8JgW/Rdm2NqUUBeeXB3iWecKTHzdrs
         kmcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749178499; x=1749783299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JqrGZxZfe4s9xgG/EFT6KkjJVPgG2O2ieIG0K5ZMp14=;
        b=KQ/qcTCnZ3Wzt0YYJecmGJqdjVc8KSOC5GjrvvhzZcIRxEsEO87KinSk1MZlDyNWfm
         b0LNcjfsS/UbC1Lc6hfmx4DG51Q1Td+o7Q1K/mFZvLAQ1tjUd3HwlqrQpr2WgKsKS+jG
         H2pz8SrsjZLGzxgIL3+cuXvabqQLzBZlMXwyayMxn6XCNB8jEdEfbQ9ueJgnMFB8i7JC
         J2slDYkjzLlOCaHAVRoq/NwNYDiAhBhnYbl1oaoPv8J+pOvArTw+WBaV3qfUrGFVnVo3
         POLRGNlIowhQEaqYx00s46ZLIpdzoyAHklqvYDoVWbcdiuhJNaw+KZms0fJU9pMjRMjU
         eOEQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5Xjd5Qo6q9T6HCJ7Dy9Z7XbWhusNhtm4uQKl6KnkB7kPXMznpkk3J6Chpu5inAWCDzD6GmCQ5XWdV52xpRRVe@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa3rvKNUt2whSrIQNas1m8t3K4FQs3aKw97I6XfDAN5ddQYRs6
	HrYJy8gq8BqiZeoXk7E1+MmjPtZk4L/cv6WPLYKS2N/0CSklAVnllbWs/HWES02H
X-Gm-Gg: ASbGncv2oQp/nhYrM73wgCJYcAflq529L9cpufRiJSujLavRFxmM+hK2tpqjMRD0aTd
	Xn3uTh9ErWxPnHMAGYFFMqlqi4HJIx7SDkvbxBoXNbvkOftk7MdClSchTynqCCnPiuWjWUu1Xo0
	e4ZN6WYgnbbc6Q6j7tBupubgKKJhWREJvnispSt/C/B2rFuBUbkTM52tarJdY10wc01TCAbSPGv
	4QZi4xy+hjA8CUyeJNNNBr3Pxp3XaGL26RrdPqKWUUdrN4zgbxT4q/Xjv+WlR+ufxA+0X7DXfMd
	mpDJchfgPRA7OZ+A12AG4/qASEd4H1kZXNfCJwYP6enkLnVYFCtDhq78JYa/NlANPKzH2DQVT6x
	qBqcJq27/K0IEJJ3Q53nQXBnmsbVDKrZTj8mIb3fhc+qvu4INDMuUG/MACwrDHabRzLetxyihIS
	eh7eo8VpXF7g==
X-Google-Smtp-Source: AGHT+IHB3aHU7n0uaEQbmWTSYTIEsb/YABqewfurUM9yqVpjSkQhfmqbYeHsudldolnne0QyhmNdrw==
X-Received: by 2002:a17:903:22c6:b0:234:986c:66bf with SMTP id d9443c01a7336-23601e21e73mr25301895ad.11.1749178499573;
        Thu, 05 Jun 2025 19:54:59 -0700 (PDT)
Received: from jason-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603077eb7sm2942185ad.39.2025.06.05.19.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 19:54:59 -0700 (PDT)
From: Jason Hsu <jasonhell19@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	patrick@stwcx.xyz,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: yang.chen@quantatw.com,
	jerry.lin@quantatw.com,
	Jason Hsu <jasonhell19@gmail.com>
Subject: [PATCH v7 0/2] Add Meta(Facebook) Ventura BMC(AST2600)
Date: Fri,  6 Jun 2025 10:52:49 +0800
Message-Id: <20250606025251.887953-1-jasonhell19@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_195500_862730_69BB8762 
X-CRM114-Status: UNSURE (   9.88  )
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

Add Linux device tree entry related to Meta(Facebook) Ventura specific
devices connected to BMC(AST2600) SoC.

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
Jason Hsu (2):
  ARM: dts: aspeed: ventura: add Meta Ventura BMC
  dt-bindings: arm: aspeed: add Meta Ventura board

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-ventura.dts    | 1481 +++++++++++++++++
 3 files changed, 1483 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts

--
2.34.1


