Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC525CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 21:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+9bRzHx5EoiydheNT5Yf/8MPbvT1DEWaavIvj84zoZs=; b=OvNWqji6sd0SxEdA/fhb5wsBN8
	T0p4bBGU7oIBrBA0yd3/MqZcD4qr+x/FQ6V1IBzzAPNpMcvNyB92Xs3B5yhPjppTC3XUSkfrqpvYS
	468RNqxE2ka6OEkBOCJmLrGRbYWu0TpYo9f2TW8j2CX0rdOTYUp5L1nzMbREAVKx2pEJBAhZKumeX
	qERqh4f2cjZYrDuIVmB3iiZxYD6XrjTIjR08Z+u4Ha2UckAg5lJiGE94QDUTpMFdV2Awk6iqMcMsS
	UPo1Hidvtcq7hIZ+oO6TjcZRRpMO+C3yfeHW5M89B3CX+UBoYr8XNrjzA6prEVKsqh58IVgylVOj0
	nSLeWCuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw62S-0000000ARJv-2DfS;
	Tue, 09 Sep 2025 21:38:08 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw62Q-0000000ARIX-0DaA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 21:38:07 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3d3ff4a4d6fso3825954f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Sep 2025 14:38:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757453884; x=1758058684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+9bRzHx5EoiydheNT5Yf/8MPbvT1DEWaavIvj84zoZs=;
        b=Wk5ngFIriY0CsB0P262KY/E5cJzcMC45oztjRIxbLQeFwXFsk2ZnDl8F5Ov9BgOraB
         IsrLLGxLv2Avh/efPzpoxfkqMzp5ZmJDx9o5qRXr7zKaJLwM5vLi/ZEWrO2oz4pnguqf
         qe6XiyeQ9zUFI33vV6vosdiZLvKEjtwYXf/R3ECLUHh4lIje/JrG8ep2a9onv0Ga4j82
         f+J0Q6bnLkbQsExJBwiS2l3uOpRAvbbkr029N07vRC0iejdZJc+gFbyqQ6iSLUusLNb6
         t6pIKtZ3SWH99Vra5kiiHp44rsESfOb7+u+KiJaRWEJMQmVnPhUqdAhC2XcXFfe4hNth
         usdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757453884; x=1758058684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+9bRzHx5EoiydheNT5Yf/8MPbvT1DEWaavIvj84zoZs=;
        b=KJ22tRlQ0rZ56joHn3vsQccJNclZkrRZXKG2Y+1P2n1gxtrEUlg3NwhjVb8umAMrpz
         sIdLdtaqIRHjdUnQrD2+Da5orOnz+itgdV9EF/AbcvQDtdxE1Psyt9m0gdES64l2GRNz
         a0V/kSwHJGUec42V2qlzRHmlDAUbDUhj+4an7okfd9S3nFwutPvfoMAVOZDPyiX9Urn5
         BuyJBbjjyU3h3oBmnom9eXnQ4ug6JeH4mW1XDvRlkkM7RD0bVR8alOhZjf0Tu6rCENQB
         Ldj5YmQMmLmK2bBcDPZrer+9CF3RHR5zIa9yx5UL55gPXpFbJA2tCOORyrOus3aujMHM
         xeHA==
X-Forwarded-Encrypted: i=1; AJvYcCXNi6E1fYAkF8d7B5t2bMtP910ZVYzYCoKSfiBBtIQ0G/udaG+Dcbsuu84eXJAdTtBisHxxdJHMI+LPyjPICoIs@lists.infradead.org
X-Gm-Message-State: AOJu0YyGP2VDn9Bb1bbqYQpE3FDo4Z8CNcWd0B1NUSRwvqmqor3W8uQd
	BbM4aiJ8lOjArq6xPd5aaKRR3plsokvndr1U8FVjj6cLhv2UP2J6QG1XoyJ+J+pU
X-Gm-Gg: ASbGncvnl9kQQCp3CcL3VjgPJH1YkC8L1/jpEKSSfCKQ9rHZdp7P88zGz8NBKzzNfi+
	2aNVJikUm0QwqA+ikkOCuDbg6dr6QSy3YwF5R9UMG9Zf7drXYrMTwMSQkJA25sF4UOmH5566MMb
	PSCg8GFY6Ur2ukAlSC8p6ifdCcYSQm5LbUibS1h9WTkhVlEzbC8n+G7Mr1lpk9BPU3hLd12DlfU
	q8PKcia+/WdZ4zzeoULug7RmOXovCSfi/H8bp1VS6kShL8fIw9NdCQQDv3xc9j/j6jMctfaUxcY
	6gKgQ7lYfZMqn3gVPMb4swi4VY9rUvmYOJpSy5lF4NlSIv9Zq23KHCXYJGtNPU1TQTNeq/tquY0
	4QGHtL2Vv3tTC5T+kmrSx42Ro2pADhSPLHaiXQarXLxwxC+w=
X-Google-Smtp-Source: AGHT+IEaYCcYmIThqF41pmILuOuIJ2YZka3UAOBXQPT8N14he2DWgi46sPZw0th9YjJQIKcRzA/Tag==
X-Received: by 2002:a5d:64e6:0:b0:3cb:a937:a35f with SMTP id ffacd0b85a97d-3e641969f7dmr11109760f8f.23.1757453883833;
        Tue, 09 Sep 2025 14:38:03 -0700 (PDT)
Received: from localhost.localdomain ([151.84.244.111])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45df81cbb08sm2315165e9.2.2025.09.09.14.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 14:38:03 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 0/3] Add support for Variscite VAR-SOM-AM62P5 and Symphony board
Date: Tue,  9 Sep 2025 23:37:38 +0200
Message-ID: <20250909213749.28098-1-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_143806_106677_D3673F4D 
X-CRM114-Status: GOOD (  14.25  )
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

This patch series adds support for the Variscite VAR-SOM-AM62P system on module
and the Symphony carrier board.

The VAR-SOM-AM62P is a compact SOM based on the TI AM62P Sitara processor,
featuring up to 8GB DDR4 memory, eMMC storage, Gigabit Ethernet, and various
peripheral interfaces. The Symphony board is a feature-rich carrier board that
showcases the SOM capabilities.

The series includes:
- Device tree bindings documentation
- SOM device tree with common peripherals
- Symphony carrier board device tree with board-specific features

The implementation follows the standard SOM + carrier board pattern where the
SOM dtsi contains only peripherals mounted on the module, while carrier-specific
interfaces are enabled in the board dts.

Tested on VAR-SOM-AM62P with Symphony carrier board.

Stefano Radaelli (3):
  dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62P
  arm64: dts: ti: Add support for Variscite VAR-SOM-AM62P
  arm64: dts: ti: var-som-am62p: Add support for Variscite Symphony
    Board

 .../devicetree/bindings/arm/ti/k3.yaml        |   6 +
 arch/arm64/boot/dts/ti/Makefile               |   1 +
 .../dts/ti/k3-am62p5-var-som-symphony.dts     | 500 ++++++++++++++++++
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 387 ++++++++++++++
 4 files changed, 894 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi


base-commit: 07d9df80082b8d1f37e05658371b087cb6738770
-- 
2.47.3


