Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4C22CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 14:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lsr8NoDBS2RQArrp1EpyLZ8skAK+yEiuZh8RDSmxYGs=; b=FH378KdXoq1d9rtDGS7X6EMqrr
	K/nheDgJGZT1FePB81GuMkHPOy2LtdVYxZy0u/OnN8DRyE9FQBryG748h4zlDNbFIVR2eUOPErQ16
	ECloaNM907VoLh7feqDVjUmjLAVpPR3ApD5MPJKIyRaXrp0gx5Rib2mcU4uhhi9PgnaoBUhCjN1tq
	lPG7df0XGusp9GHBe0e0AYZgZk1P8qZhDCkMXpK5CPHRqmAMA5OFGHf09TFzVPHaBTiXzEbkLCM+/
	d/Kz+Qrazu4/unW9RT1r378Pd7gn4A9WZYbwk7AyLM3yxocVxJVr9nSo0hWz5MVc1OgN/ADIgjMrh
	IiVr4MZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umYeF-0000000HAnx-2brK;
	Thu, 14 Aug 2025 14:09:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXpi-0000000H1PK-1bde
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Aug 2025 13:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
	Content-Type:Content-ID:Content-Description;
	bh=Lsr8NoDBS2RQArrp1EpyLZ8skAK+yEiuZh8RDSmxYGs=; b=aIOY9tWBAjVneuF1T5gPQMK8wV
	tm+yvMnmMhgtZTUntB5IJuo4B9852MvQBqIJprIWXVSIyUN4zP7EeKeuzrd2TvvGiLsDN61BN3Tky
	0yyLoPJERsrpWlTvLubobTLfFE44+KEN04h4Sk6JDwpNL77rFNfqMreuLPLD3yIVb19fl4tmx/XKq
	3di+6ItFRw8jr7SWCmHOesJHz3gGwp0TTGKCVBEkFdeAMDvuDgrVXnautc+qnAOQ5VeITsP1CQhXt
	BsjVTvcHa9PDNkVxS2pJInWZQ4K8Fjnq9mPZfXz6XCbriJKkFjVGaq+KPO+oay+BTzpZpHMMVGxSE
	h4gveSVQ==;
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXpf-0000000GOF9-0p2T
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 13:17:29 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-323266d38c2so1190540a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 06:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755177444; x=1755782244; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lsr8NoDBS2RQArrp1EpyLZ8skAK+yEiuZh8RDSmxYGs=;
        b=WpY6GAPCg9pttY6EiTe0CfCe+MDN349flX8ck1Psh30qvq9O0CJzc7YaSBaO5HWwjS
         BGNoSpieNLys++XN+fHu/XRIyTXiOFaLGd2Xe4adTNiovk4DYtRGxRa0OdZJji2HdpOc
         9DpJJdwShy00KAcDQEY5jnS+ZC4TaPIwNUGoZSR+3NeMVS2/O6rWrwsqrmmHVlulVxOK
         ogw1IfDHSuG7NLs8RYUca+syoxMoYHQOwCSecI8jNyXpmIWIpLbonXx6tt9Mr87iDekm
         Ook0L77rj5qsZjf1Ne9MTo6Qg3QkaZ7Sv5y/hSYc/fEemRn3Q6MFTRtSx/3ZsRjCu4yB
         yaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755177444; x=1755782244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lsr8NoDBS2RQArrp1EpyLZ8skAK+yEiuZh8RDSmxYGs=;
        b=To2Add8QKLiLbGZRItXluHjsba6EnAklL3YET1wEDNAanu0pzxH5N/WEMeC4rqCNuo
         hjvceHgalc3bV5b7nPYr+e8lVFclUXznyGpSF3WxSQfN1PTXTMKhjeAcHR60p4DCrrkN
         6dHd/Gy0YIa2XfAU1zdDZH5WLjkgjxxHbQljSbBo7dcP/HHxHgcEhK/x80mjuBlwzqEB
         axsppMGNcujv7dLECA1s4ydeLYnu03H65fhHQP/M7EFBkIfqlFxAeMx8UVpu4nLEomIF
         mGF0IdY1sTbaNMF79GQrGkgd5AMFXuoVodmDQb4/eWgOV+XCV0m/05+MhTHF+jeCzW9x
         bvGw==
X-Forwarded-Encrypted: i=1; AJvYcCVouU56WMaytZ0YAu4GPeSP3UuDZlWFWAGWPnh9tliAe8NEzIj81TCIwUYdxXoKinpjxgAqedqSozqVMrA0bL7l@lists.infradead.org
X-Gm-Message-State: AOJu0YyTAZoFT6BE4h5NWEnvu1ncfiKDldmlFC5k+AupDM52aHi/i3Wc
	09fGpSfywuqPJL3GqdJfsHPUh9q7L4toLAHhDOpg4PJPER1xCbN2CM2v
X-Gm-Gg: ASbGncsuRjICyaVMsrFBxGXPZ8ldWno/rBx2TUERAhqTw+Z+0wUEKUNdv8DfWvHN1i/
	0N0wdE7ICj65ps3kPN4fqVd/GoacO1D9eN8/q53PocSbxlxbRjUUe0aSfte4yctJvTMDlpXZjtI
	Gds094kRTHuRv3W4BRudAC3OA/M+pHeee6on7cJg1J2Txa75LLH5n4fbhRJCAnSb6Wi7OeKyPI9
	SkcsOfotaqtNN4OHXigcJd9N1K/Ij9oKFASlR3ZUWakRXS4MSchu35iblwhrf7zVIafpBy9NY7L
	xSrkxxLmK+aEO8RaoFx/hvFVKX0/KoLLWRCvBlWd/WTghXm2bCjl2pE4SD3GiW8C+Dw1pUsGxdT
	oDc52yC0zfbFxRSzSNckY01ZJ/IH3HJVO4eKO0PZzIbDyfHppOMy6iQvbQSOXH/idu8n6+KEpmX
	0v98g+zCW8DIo=
X-Google-Smtp-Source: AGHT+IE2z0Mn4IzOfVrP5fVEkPK/wTu7L7FYQyC/LTk08Q1390PeBweG1bRkM0f2xG6YdF4ltPjpOA==
X-Received: by 2002:a17:903:1b50:b0:240:14f9:cf13 with SMTP id d9443c01a7336-244586f6e7amr44650985ad.51.1755177443544;
        Thu, 14 Aug 2025 06:17:23 -0700 (PDT)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24218d8413asm335652995ad.63.2025.08.14.06.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 06:17:23 -0700 (PDT)
From: Fred Chen <fredchen.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] ARM: dts: aspeed: santabarbara: add sgpio line name for leak detection
Date: Thu, 14 Aug 2025 21:17:00 +0800
Message-ID: <20250814131706.1567067-5-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814131706.1567067-1-fredchen.openbmc@gmail.com>
References: <20250814131706.1567067-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_141727_349392_944073C2 
X-CRM114-Status: GOOD (  10.00  )
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

Add leak-related line names for the SGPIO inputs that report chassis
leaks, so userspace can detect and handle leak events

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../dts/aspeed/aspeed-bmc-facebook-santabarbara.dts  | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index ed2432f37609..6af8b22f72e1 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -1767,11 +1767,17 @@ &sgpiom0 {
 	"PRSNT_LEAK_CABLE_1_R_N","",
 	"PRSNT_LEAK_CABLE_2_R_N","",
 	"PRSNT_HDT_N","",
-	"","",
+	"LEAK_SWB_COLDPLATE","",
 	/*P0-P3 line 240-247*/
-	"","","","","","","","",
+	"LEAK_R3_COLDPLATE","",
+	"LEAK_R2_COLDPLATE","",
+	"LEAK_R1_COLDPLATE","",
+	"LEAK_R0_COLDPLATE","",
 	/*P4-P7 line 248-255*/
-	"","","","","","","","";
+	"LEAK_MB_COLDPLATE","",
+	"LEAK_PDB1_RIGHT_MANIFOLD","",
+	"LEAK_PDB1_LEFT_MANIFOLD","",
+	"LEAK_MB_MANIFOLD","";
 	status = "okay";
 };
 
-- 
2.49.0


