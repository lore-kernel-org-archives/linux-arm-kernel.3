Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7ADCCA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 12:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gw5w0sz05Swx/D5s5S+tVMdpbV1mbvdjC9hyE4WVYq0=; b=ojYDTaquhDxUwOsZZgaCPWrY6Q
	DYLvhuXrcXwUE1tM/bMWGxEuGGb4Aqm3RgVFW0xJU0316n2Cz4uiS7JQcRRYEVV9wZ4H1vdPt1qoV
	5pBWNWQxr9qRg15L/egUr4TxBEhgrNpkWWXbNPenhp+9ab4d3w8AR1J1IziXXNcvSWi5Xr6jNi5Eu
	FeJTIADS8dniZfm6aPBSABce0gjzWO7wMxn5koOnqZUKhw1noOPAnYPMzw4EQLE1dMmlMc+6Dqm6V
	3x+y78vBCez800M97MXb8B8w9G7WWdReQj6UNJVDB+iwjyQPVAzWV0WIBBibJlfk1slrTFtrtijik
	gGd9etsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uryAq-00000005dkl-1PfL;
	Fri, 29 Aug 2025 12:25:44 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urvlu-00000005Cvi-3prj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 09:51:51 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-61c3f6067b4so1616476a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 Aug 2025 02:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756461109; x=1757065909; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gw5w0sz05Swx/D5s5S+tVMdpbV1mbvdjC9hyE4WVYq0=;
        b=Wyc8Ql5DD5hvpsL7pAmvT8gp2GG4HhSEtfxHr+eZbzSwB8REGUnkIE8x/bnfXioE31
         hiimSavGbcWR9fYAqRMt1e7gVWxliVLr+mQWqHUBPS8CtH6VOWBvVfkqXD/8nsLCRMY6
         1mOZvnDHQdUDu8KT0gyHZ3TlEKZR0VTqX1ws73RzQByGDFr49fzbbcS4JC6+kFt8rrgd
         F0eKZZ3dc69+jBrOR9wDFBC1+AzCDiXVuYr64AxUvtmIXGUPxreET/N66KkJpeypJWjm
         1T0tkGp3TBsOCVaJXKQXOrAvbKNZfNqEgQAs2eWt42b2rE8dnSGqVD/xnVwyZU3y74xn
         XeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756461109; x=1757065909;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Gw5w0sz05Swx/D5s5S+tVMdpbV1mbvdjC9hyE4WVYq0=;
        b=pw/Fqz1eyb8JntI6bp/o2RC1957bolPQcgdzZqrGJkz0lxdGom6Z7DSXiALd76/1gX
         4GBdtUB1zB81hrwxrwWmz0a/VPRIfLZtHQMWGoPMHpHtkXYFajylbdYDSw+iR4wLd5E2
         TS7CTTFsMZE0pCIXbjMbKNreqLPe22nnOBzyDl/qkajY0lfurkxwhr9bALWtBC4+z+MS
         OEcUBXnQyQc2FJHDwAKBQ6A78WbmfX084sC0j1aaJ0zW/O43SChihOVrmbtl+yxvrP1r
         U6Xl6hgTNfEhcnYZxJcXjHnQ38+2JS2dXc4KoqLlDowdnuBRheRg7kNTwpbrHXCN7rhT
         4bkw==
X-Forwarded-Encrypted: i=1; AJvYcCWodDIHg3y+cLGYctMC0dz4tbiu1onZIBCR2ny+CLi7o8EW6tpz9GKrCMIPPeuq8oQ4BcRSZPRuaRPkm5ur/AdB@lists.infradead.org
X-Gm-Message-State: AOJu0YzWXPGe35Tep4OfPNldd/ThV66g5AYmrbtlQaIHb1e9bEh/XKPa
	gcBhVwwkzJ6MUuv+1Yo5Ml/1Y0l4XBvWp747y75snYl10R/JtIpacZzBhFox0HCwVX0LH2npsUR
	HUg==
X-Google-Smtp-Source: AGHT+IF6FutuYKvLC2HNxGQ4PouB2oLcU6dsNYrQeWs2luM5mjJznhreK0ql2EW4HhyCno6WaQzxHWoMCg==
X-Received: from edbio8.prod.google.com ([2002:a05:6402:2188:b0:61c:8a5d:cca4])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:27cf:b0:61c:d606:9ce5
 with SMTP id 4fb4d7f45d1cf-61cd6069f73mr4653161a12.4.1756461108823; Fri, 29
 Aug 2025 02:51:48 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:51:42 +0100
In-Reply-To: <20250829095143.123476-1-tabba@google.com>
Mime-Version: 1.0
References: <20250829095143.123476-1-tabba@google.com>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
Message-ID: <20250829095143.123476-3-tabba@google.com>
Subject: [PATCH v3 2/3] arm64: sysreg: Correct sign definitions for EIESB and DoubleLock
From: Fuad Tabba <tabba@google.com>
To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, vdonnefort@google.com, qperret@google.com, 
	sebastianene@google.com, keirf@google.com, smostafa@google.com, 
	tabba@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_025150_951318_754A1182 
X-CRM114-Status: GOOD (  12.35  )
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

The `ID_AA64MMFR4_EL1.EIESB` field, is an unsigned enumeration, but was
incorrectly defined as a `SignedEnum` when introduced in commit
cfc680bb04c5 ("arm64: sysreg: Add layout for ID_AA64MMFR4_EL1"). This is
corrected to `UnsignedEnum`.

Conversely, the `ID_AA64DFR0_EL1.DoubleLock` field, is a signed
enumeration, but was incorrectly defined as an `UnsignedEnum`. This is
corrected to `SignedEnum`, which wasn't correctly set when annotated as
such in commit ad16d4cf0b4f ("arm64/sysreg: Initial unsigned annotations
for ID registers").

Signed-off-by: Fuad Tabba <tabba@google.com>
---
Note: No active users in the kernel for these two fields yet. pKVM
checks DoubleLock, but only for protected VMs, which aren't enabled
upstream yet. Hence no Fixes tag.
---
 arch/arm64/tools/sysreg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/tools/sysreg b/arch/arm64/tools/sysreg
index f1a012ee0db6..d396fa587ec1 100644
--- a/arch/arm64/tools/sysreg
+++ b/arch/arm64/tools/sysreg
@@ -1693,7 +1693,7 @@ UnsignedEnum	43:40	TraceFilt
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-UnsignedEnum	39:36	DoubleLock
+SignedEnum	39:36	DoubleLock
 	0b0000	IMP
 	0b1111	NI
 EndEnum
@@ -2409,7 +2409,7 @@ UnsignedEnum	11:8	ASID2
 	0b0000	NI
 	0b0001	IMP
 EndEnum
-SignedEnum	7:4	EIESB
+UnsignedEnum	7:4	EIESB
 	0b0000	NI
 	0b0001	ToEL3
 	0b0010	ToELx
-- 
2.51.0.338.gd7d06c2dae-goog


