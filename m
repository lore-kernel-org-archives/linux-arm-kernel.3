Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30BE2CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZnPPw1yHb/kgpk5HVTCc5i/nPN6HTsBrippheu6Yfk=; b=LbYdlruyywGZxjjkplt0N6qvg7
	GJuz2dNT6uk+EO6ymd4XAhwVtnlsLW9Qf9UDwUn2ea3wIUcnAW64SySuC+8fAO5W/PkENDx8bTRS3
	mpIP+OL5nR9TXDVutz+bxCJXRQlxqu1FeHl4wRp+yI68tm9zAwDuf1pqJkEBjeSm6mQt3DTYDUyJf
	o5pxn8aMYFIeMkwsgmnQF2QxwXuxgZP2lwKfF0WMtXl4N3KkpNiYevBUtk7yL0NOaUdLsXg+JR5eb
	8yGBaBd5WfZAFd1DL2NNnU8ET9hRyhLAtrWN1Qn2331Tw6I7TwjUHgIW11ymJdYsHPLsaaV6YUuaL
	k2poGMJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92fD-00000001vez-2nLf;
	Wed, 15 Oct 2025 14:39:39 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92f9-00000001vb0-1rSz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:39:37 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b63148d25c3so755100a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 07:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760539174; x=1761143974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZnPPw1yHb/kgpk5HVTCc5i/nPN6HTsBrippheu6Yfk=;
        b=N9CEPnOdFLYbAaR8+SBBwuWqSrvWrYcBWYUccJw2IxEEvjRRWnsRtc6ir8XdCr50/U
         2MUPAJLsDiX+lDLHhWo6I49G0uDM7DvbUvfDvANbOD6mFWTJZodc9hgsciupENVYq8+u
         KWfQ2d/hFLT0xQHjXN6OH/4eDzrbLadEKYzvFO4lUNLnmgRjwYiNc4SiqAAaqoXZsHeS
         bBK03WYRZ+4x7HiznPsD79QR6PXU6yWGdKUnKaU1SuiH0IcV5PR+tjPW4OVH96WBZTWb
         3H2sXUenGHtbVZbhOJ6QKto+6wfdD2E2LJYePTuhRjurKSWVnoCYTGQ+7MAvzgwK5XMs
         yZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539174; x=1761143974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cZnPPw1yHb/kgpk5HVTCc5i/nPN6HTsBrippheu6Yfk=;
        b=ePTtOh1TC/LxdCeN/HTtude6m+AHVANfLP6vcM+QILJ/jixqpcEP/sYO7LTiVFzGIG
         NzVgqlp2QRtw9E0QAkcvqBU4ceF1L6JFGwPM9LNtCkBtk8f+imuS7G3eFsdM6hXm+1e6
         1pTDUSvmqEOSMiTPUSQZoRAPx9ilmkjWzTA8CEDtLZo91mlnzGXIKAyliIywn2mM3fzG
         osE3X5xHNaGo1JAYnFLqFHMBTHU2MvowAd4LkceVP5OgYzrHADX4rmI5SJz5haEio3Jz
         JsVzKSq3+ZZXsJrKRP3nmA6pHmQHzmWK2cc3Gz7+wyiMJzWfAPmZ+bHR+S5ck4cHdPQ9
         5YQg==
X-Forwarded-Encrypted: i=1; AJvYcCVjeYFdQTxvOGyiCdAmw/8dgBFCgq8Bi0eNUFT9sZ/i6tEPphUnqYrX4+/lBJsMbVjb8a3I0HQ2hHyjt2z+t6TH@lists.infradead.org
X-Gm-Message-State: AOJu0YwJxbMUdvMj6KHglxGchMNwcBfO5GjxPYTj5dQVx4pMsvrc9byl
	YHwAR1ad72qI8Lp4cg6WVdMct1GnQkWe+lrAp03jTNvEdS0uj2Lm1AoF
X-Gm-Gg: ASbGncs6Bp4vK4MiZbwKyu2BFGIoPAQf2B9TCLOPXvt79X+UhdBaTPQ8FYMXOSXL8Pg
	sA5dc75fsFfpEeG9jkSPwqeP3WSWpmJ1cgDxXYtZ6MfVq4XPKwTRdpuhhPszOGMz0OrDO1YSof1
	lggQa5KHZX+xtRXPZiNisKmQaHKObHoGZpXZEvinQnBbsfhjUsXi7paGXJ9w2Z11uXjH7RS1Or1
	uFyxJ4jVpgIwRfuQM0lqAM3bNr+lY5xb3By7wfoU2cGrbaxrO0q853kaEc03QTpWr+0XstdTUOZ
	8w4bTuUHmnc1oQXEePWDnIzKf/irOtWb+IsrRUlJQ47rlaoQDof3wm3+Pr4vcNK4MmbwiQvfyza
	vA2+SXfujAMMjxAVRrhz/0xUMPBZrcZJ53W+IBttjKl9bUKM64a7Fhf4tdTRmW4Wa7/QtEx9DDS
	ubGb6x0LcS+ovyCdxZB9yLemMoOBzoRw==
X-Google-Smtp-Source: AGHT+IEwVX/ElMrVL/1slVqgh0aEHLkum2PuLtXRVZK0Ha5cnSjmuPAFvQSxCr9PtIb+PIE7Zha0ow==
X-Received: by 2002:a17:902:c951:b0:25c:43f7:7e40 with SMTP id d9443c01a7336-29091ae4cdbmr4400655ad.10.1760539174469;
        Wed, 15 Oct 2025 07:39:34 -0700 (PDT)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36738sm199853455ad.87.2025.10.15.07.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 07:39:34 -0700 (PDT)
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
Subject: [PATCH v4 4/7] ARM: dts: aspeed: santabarbara: Add bmc_ready_noled Led
Date: Wed, 15 Oct 2025 22:39:00 +0800
Message-ID: <20251015143916.1850450-5-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251015143916.1850450-1-fredchen.openbmc@gmail.com>
References: <20251015143916.1850450-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_073935_504694_148B83E2 
X-CRM114-Status: GOOD (  10.17  )
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

Add a 'bmc_ready_noled' LED on GPIOB3 with GPIO_TRANSITORY to ensure its
state resets on BMC reboot.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index b190ab344aa7..c0334abf9cda 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -104,6 +104,11 @@ led-2 {
 			default-state = "off";
 			gpios = <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
 		};
+
+		led-3 {
+			label = "bmc_ready_noled";
+			gpios = <&gpio0 ASPEED_GPIO(B, 3) (GPIO_ACTIVE_HIGH|GPIO_TRANSITORY)>;
+		};
 	};
 
 	memory@80000000 {
-- 
2.49.0


