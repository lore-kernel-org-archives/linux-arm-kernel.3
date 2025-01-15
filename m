Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F48C02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 13:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FL7ZkhQdK78qVjJ8hh9m+jIEQAe9pT1DEJ5hOyp5o9I=; b=pvW+o6HBBPcytKxEBW9UgOR2xl
	GJxbK+EBH4R1L0c+osb2tqlbc8Fi3j2iIIbm9SBITqIPS0PBsUmNcHT9WCjN8Kj1fPpx5TAoiSlOF
	rbYtz1DYeTn0MiyElyOLqIRqRTBTzbcwjsQKrjGuV/Ey9gzk/jWG5ipTaqG6wOVTo7O0f3fdBKtGp
	/Y+D5UQWAl6ju2+eAZjb+D91DGOtZkkdci8g4AGUAT9Jg6FiirOsmAPkF5ZW7mP+bLpX6Nfvkhy5m
	DxJB6rB1N5zD0LVCJ7P6l4CjejOCDOEn+MLBWrTIckQiWtLSx6OfE0bcvMc27LGuaaWE06nnTJx0n
	l8uuge0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3ja-0000000C2QY-0GM4;
	Wed, 15 Jan 2025 13:47:02 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY3fx-0000000C1Td-3ekF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 13:43:18 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436a03197b2so47877725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 05:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736948596; x=1737553396; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FL7ZkhQdK78qVjJ8hh9m+jIEQAe9pT1DEJ5hOyp5o9I=;
        b=lpsAaCdIEg+uaBqnb0H3tebH+BGP2rLhXPfmYpR9Js4Bx+ZwuJPkNBGSMNKm4eHPF2
         9kxR8o3Lh8g75RHZPgKuLUH9l8X1M4Ib+PhY5SWoX+62bjNX3iWYF42j+o+9Jm3Lh/zy
         eRrcNv6GUCY8/7NpnZboNukCXzfmnJVgaFXFmhKHcW3qrI06AXiq/E1LsrKfziP3J13l
         ktmA3nIBXX+l9/sHU0nW/Zef9aVcvtrkW2WdwqXjzFc26v7T5wmSp57Z7TERlL+VGni5
         b37f+eIZRVTIBsncrJMkAyXV5pkQW6k5yKZS98ob3BBQx5NZJqASzADQqGlJ6qAtEzpr
         aBcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736948596; x=1737553396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FL7ZkhQdK78qVjJ8hh9m+jIEQAe9pT1DEJ5hOyp5o9I=;
        b=fAmJLnpUeCOTf5Rpfvov/s/Tyo2/YiBxoyw+N9clMkKANpuekkwYOYbJ+ra+ZjlSeR
         xh+GOgknxtCA8NaomQlF/VcZbHdzdy9WoiDXEZaOgIGnxDNxii/RYgiKFzlopRxdUFRO
         Ypjaz+nwut1KdI0wzLy5v3Df9osF/L8oAk+PNkRTXj1R9NuOcQhmTZVgKkRNCP8dZd/G
         J1/njGumOFvYJo1sJCKCvCpv2aW28/G4TL2smRpv++/3c3JtvfYwwLPHb0OR3wgs8ybB
         4EONWWDfc7pisrBjB+OMhKvDMT3mqAy+JTg++f1iGiZM/fXc+hhZKl87dcr7jmEDiRJ2
         zWSg==
X-Gm-Message-State: AOJu0YzmTIFtEfTeaMROb5/UMWs6AmiKSqMBcAUVM4TmVsHXj+seN5o0
	Re+Rvj2DNdwhYUb28iLMjvjl5QmIgaL8H6id8gxQsjP9Yk2YgHDpJkmZpkMFJcj5yga0IpszJLR
	I
X-Gm-Gg: ASbGncsTdLFyl4T6Y6Q0q3ZR1mhMMUGF+h0GI7tStnlckRsgVU4aaEIwPBYj1V+uzbR
	CJ7aaLjMnTSKpWWmwYmzJAleANUifdwvnztm+VgEgphkAznGpDWyTrkUpETajHHXmG08nwlX89R
	AAyVvw0tBTQfU1I7ssTtgG1eciTC5yy/KhlxfSqfBIQ4ahSTH6ROggSkSLb1u/gyJIUI11V0p5y
	0yo08qDPt4y4cZQlVXWFopafFjHCW7ilgiNjuKSk9/eTCrPGGpQzPs=
X-Google-Smtp-Source: AGHT+IHirEWQcVqlGkFPsz3lXJkoAgAhrYtf95Ok2YyQSwvsam/EPZ1NxQT2nmM6wK31QGxnvLzt+g==
X-Received: by 2002:a05:6000:1f89:b0:38a:9ffb:fe2f with SMTP id ffacd0b85a97d-38a9ffc0071mr14458706f8f.0.1736948596597;
        Wed, 15 Jan 2025 05:43:16 -0800 (PST)
Received: from pop-os.. ([145.224.90.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c7499bbasm24853825e9.3.2025.01.15.05.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 05:43:16 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	robh@kernel.org,
	broonie@kernel.org,
	maz@kernel.org
Cc: James Clark <james.clark@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	James Morse <james.morse@arm.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] arm64/sysreg: Enforce whole line match for closing blocks
Date: Wed, 15 Jan 2025 13:42:54 +0000
Message-Id: <20250115134259.1864060-3-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250115134259.1864060-1-james.clark@linaro.org>
References: <20250115134259.1864060-1-james.clark@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_054317_905831_5F6288DC 
X-CRM114-Status: GOOD (  12.09  )
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

Match on the whole line to prevent matching on prefixes like "Endsysreg"
vs "EndsysregFields". This could potentially make the script go wrong
in weird ways so make it fall through to the fatal unhandled statement
catcher if it doesn't fully match the current block.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/tools/gen-sysreg.awk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
index 1a2afc9fdd42..7c7412adf90e 100755
--- a/arch/arm64/tools/gen-sysreg.awk
+++ b/arch/arm64/tools/gen-sysreg.awk
@@ -127,7 +127,7 @@ END {
 	next
 }
 
-/^EndSysregFields/ && block_current() == "SysregFields" {
+/^EndSysregFields$/ && block_current() == "SysregFields" {
 	if (next_bit > 0)
 		fatal("Unspecified bits in " reg)
 
@@ -177,7 +177,7 @@ END {
 	next
 }
 
-/^EndSysreg/ && block_current() == "Sysreg" {
+/^EndSysreg$/ && block_current() == "Sysreg" {
 	if (next_bit > 0)
 		fatal("Unspecified bits in " reg)
 
@@ -310,7 +310,7 @@ END {
 	next
 }
 
-/^EndEnum/ && block_current() == "Enum" {
+/^EndEnum$/ && block_current() == "Enum" {
 
 	field = null
 	msb = null
-- 
2.34.1


