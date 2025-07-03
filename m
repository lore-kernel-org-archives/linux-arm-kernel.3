Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB50CC83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 23:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wgwhd4uxfgsiFGznM9R+p5/1NcCXs+lUXw56p7CBPbs=; b=f7aPq1yRjPZqY4JaM448UPd5q6
	FdOgJx/r4glZbefcyosjuXPgTGhTx2Gqp64qCJ0ijPYTZdkjLd1M1vboBqUh6hOG/gXhY49jEOUyp
	f4uNarNLxTp95hVQscGcrQdqXlBcT5NqnrVps1I4UhkPM2ngVchqwkWOSGu46V5lwuvmvW2Rq5JwJ
	EpVKonivFRb+/QXkWECcIWgfgP9fjc1bs+bZGbYpSPeRB7liEOvTy9fzS/45ba/XJ4Kda6HDfGJYQ
	Js8nBsuZlgYIqDYiJh8cW8cxqR/XuYtdmlqRvRdyKClI510oiiydJvFc/Xzs69t43j22lSsPe7kLH
	F/etsl1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXTXl-0000000CqiY-15jl;
	Thu, 03 Jul 2025 23:40:41 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXRrv-0000000Cer2-45qY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 21:53:25 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-236377f00a1so4203645ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 14:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1751579603; x=1752184403; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Wgwhd4uxfgsiFGznM9R+p5/1NcCXs+lUXw56p7CBPbs=;
        b=P+isT013S41GxLEdm0aga77S0FJahDHraIu5Nw5dEExExxtN8OsERQF8zeIoexbGMI
         bccfHyosqnVPjLk9ys5ZNS5JF7m7IOAaCg59Rc7rStpnNdTYbIvrdVQ5p+ssHP5KWxYr
         SgqWWS3zdEPiOU/Fiay1Ei7ZWX5aBAlNXnnYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751579603; x=1752184403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wgwhd4uxfgsiFGznM9R+p5/1NcCXs+lUXw56p7CBPbs=;
        b=NhB/2vUbmNhd6ZncY1koOztZESWOqyjac1BCap0sASQ5+N+O/3BsH1iXprogOhVYGR
         5UxOZhcCgBMZMLAuaJogYB+ONnU+2yr8dD4vpS/Dm1K8dh9dzq3Zm8CVLWR53cHyax9Y
         ahhzCncS0hETTBbixJcZKgi0ZoLB9Cghr+Kuwhg3zI9Yd3YEiGrcd8FCgq6gPhREvHRJ
         oOUm9MYXNt37xtHX/QmtAAwombTt35I5k2Ar140kvcjKg9dnam7/iu7FqjPrVmdXLDfQ
         /x30KVJellomKRorNUPtTy2wIqrBGe2Jnlo4a27CpWDaS9psHB1vT24g/1P2frJpsCCu
         3IxA==
X-Forwarded-Encrypted: i=1; AJvYcCU67gWczG7eds2IdRwYsnujhVcMnTt5MmghbZsdY4E1K96esQhH/1HXco7kesSUFmi94dzt/jPpW0lw5tqK5u7N@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0xkbT5hx2Rfe5VdoRSJ3uhFqM58F/OaFm0hcB0Wad9H4s0dGN
	NefzLlMWvdCyjkUv4aC5bNhyNnY67IHczbiAcx3Z45omOaxxJERNBdymLd7r1CX/jg==
X-Gm-Gg: ASbGncvF6QxoP/06Qzp+9663ZFhrS/aTuhBjW40W5DqafhkvLQxR2LLIoa9Mp4q4kBI
	v4c6EXaVoRZZRvmuODOxWDloAJoVY6LE4vBGniC4OCruY+DMTF8qdJKLCgkGeFB/SsSIQT5SIO/
	r9iVb1vwhY4sUFwEDHkdBrA5HaiDxx2dI+cXpCaDEyf5ReW4NAt2nWmG9+kjcnhkjJisKVpHBJG
	p6d6B9GEDOsjY3LXx1bScx20E2gi7eTDDG2MOeCGJhPKLbzAeQuy9OHxPzUJVrmQHjCohCPqbJi
	2TLdPYFy3xRZGpzBwUNBUdaaBmj4Ez+hLk8XG7o0xjM7dmlfSr4XHeUee7awj940c9nKd6lZ8Xh
	LdgyGK2t884c0YSoJyYFvQSusrxcNkfhCokSUqXMdjQ==
X-Google-Smtp-Source: AGHT+IHxUkT3T1XrdvXj6lsZasXIIR1QuejltuaVBvB0AUtVnJ6flgqLggHU2VFll3S8pZy4clu9dA==
X-Received: by 2002:a17:903:2d2:b0:235:2e0:ab8 with SMTP id d9443c01a7336-23c8606721cmr3661665ad.6.1751579603171;
        Thu, 03 Jul 2025 14:53:23 -0700 (PDT)
Received: from stband-bld-1.and.broadcom.net ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8459b3a0sm4249645ad.219.2025.07.03.14.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 14:53:22 -0700 (PDT)
From: Jim Quinlan <james.quinlan@broadcom.com>
To: linux-pci@vger.kernel.org,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Cyril Brulebois <kibi@debian.org>,
	bcm-kernel-feedback-list@broadcom.com,
	jim2101024@gmail.com,
	james.quinlan@broadcom.com
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE),
	linux-rpi-kernel@lists.infradead.org (moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/3] dt-bindings: PCI: brcm,stb-pcie: Add 74110 SoC
Date: Thu,  3 Jul 2025 17:53:11 -0400
Message-Id: <20250703215314.3971473-2-james.quinlan@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250703215314.3971473-1-james.quinlan@broadcom.com>
References: <20250703215314.3971473-1-james.quinlan@broadcom.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_145324_006720_C1A66D2E 
X-CRM114-Status: UNSURE (   9.05  )
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

Adds BCM74110, a Broadcom SetTop box ARM64 based SoC.  Its
inbound window may be set to any size, unlike previous STB
SoCs whose inbound window size must be a power of two.

Signed-off-by: Jim Quinlan <james.quinlan@broadcom.com>
---
 Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
index 5a7b0ed9464d..36bebc290b42 100644
--- a/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/brcm,stb-pcie.yaml
@@ -27,6 +27,7 @@ properties:
           - brcm,bcm7445-pcie # Broadcom 7445 Arm
           - brcm,bcm7712-pcie # Broadcom STB sibling of Rpi 5
           - brcm,bcm33940-pcie # Broadcom DOCSIS 4.0 CM w/ 64b ARM
+          - brcm,bcm74110-pcie # Broadcom STB, Arm64
 
   reg:
     maxItems: 1
-- 
2.34.1


