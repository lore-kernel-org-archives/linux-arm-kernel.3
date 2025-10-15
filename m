Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAAFCCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 14:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/LQNtZoS7OfijYrFt3rjrDuiajb22vvwUPhElheOqs=; b=h/TdEDMdIKNAsS8DrTHiHjc597
	7UpdahHBQuvDGkN95HJNgcdQ5goo9702la8wdkCJ+TNwYil386KRTKsFKyF7XwiUvwQJa3q6uo2zz
	0h6ecQWAm5SxO5HhsY54K5uhlZXAm9LI7YWftuy+Un/2gEbQeaOaioHuoMYGhLYrkeNQybHuuXL7p
	lVVDJLHoiYxWzWyC4Pl8Co29LZaHCEqMqe+AtV5MHqueL5hAyNw0AlGJ6Vxy5Yk3DugQ5ZYp2BOmo
	42+CIsb/XDw7sga4TDIZt8WhRggBxImF+BHb2suNEO36NoD8eyjUCsPUK0jt9grQM8rQcVA47G13W
	ffF0GU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92fO-00000001vpT-2Byq;
	Wed, 15 Oct 2025 14:39:50 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v92fJ-00000001vk8-3AQG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 14:39:47 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-27eceb38eb1so77351345ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Oct 2025 07:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760539185; x=1761143985; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F/LQNtZoS7OfijYrFt3rjrDuiajb22vvwUPhElheOqs=;
        b=LjRQuvfBXpl7TtcVc0Auml3JlBvsjK0FvhwYi2vGqvjXKDXsb5MCi0w1cSZv1ZuTVW
         dJaKq+TTclXsrjDIOOW2unbYvdv9TGLHksanu6sv05iGMLzd0I1r6GqrJ3RJm859AEX4
         JXnDHfWjrwl3/BGnvN/EKaQ8Z2K9uhry6EFUCwV5+8vwgHQKRXIMP0pUAGgHk525j3R+
         9J0Fw6qyhjpEZLa4HwpvXidNKDJp72QAU+bH55jCuAe8EAEP/i6L30G3GZmIpnlFf3SY
         wU1K5TDaa56N66zTGcp4178gA7UCJFDeeuHXNzgHdTsIfoQAJQ/7GAUc+e3/+Gt7TcFU
         s6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760539185; x=1761143985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F/LQNtZoS7OfijYrFt3rjrDuiajb22vvwUPhElheOqs=;
        b=ekLFqmAuEq7xy/ftAEQqVzmBaL17GgDeS75xXXNkuIvCUo7nGYorQVYVMwx5g0Y+nT
         ikbQ/X5pDcQUyJCCdCj61dp+ljHa3D5vHkzwTb9DtSsKnV1o4uaSc6qDYvqKV0RNA2ze
         g88Keid8YcJk/dqk1OrCIo35e41zt68Rn6BGmzn3FlGbxB1PuSk/eVxLKioe5WoWyTLr
         pLHwLAthDdcvO8S3B8GHKOXSE4ax4K/mT2fpElsZBR7F9B4uVw6UeZMxsKuE5GxO7Zxf
         DHWbrX/j4oPm83PjGvwAwe0d41weDAppeQYPS/wRFp5fzZ1ligwjyEkEYr0mMR1HbgPk
         TbnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPmkEaFTzP3WMnFl+x0yu95hLPHwc6MFsuKmwPlVcq+MdyABFJnLmYX9Ug398XVZ5YbBpLn+OL8BbHK8aVgrIb@lists.infradead.org
X-Gm-Message-State: AOJu0YyAHNCod4Z2ADQqeTv51329KMwXWCPR205PNZgWLTapSLJybTYz
	cGxld2Gmknc8ftlIWzejY080QRVpJ94Zr1I1ZnlDX82VFiell6gCRahm
X-Gm-Gg: ASbGncuJlQ06z4G/gwFjrjGqbpumKqi5i3K332BQdn7Or0kUCZ5t7gj7fEgmaBvVISA
	crh2aKXK4tA1jXCn46OZ9zwqMqLiJEHoVWVfJKf38OHnSU+rLvfobp2Dw9QfwLinUglLlaXFl0x
	2VtzcYnU4S8lbuopZwW/nv+qy7ALJ7IlsOM0g6IX9+HFKaw0RacYcWPRv7zzTX9rATvWyMSbvoz
	UmGnSX5clQHKiM1s7T98FJ5/IjyHVfL/AkIYaF3KixYY9rlVnPMD/MiS/WNIExUzlEj5ciabUp4
	JcJ+3JhG1QsI+ipR5GUd9XAAId0NmgKJpXEdMp7wrdutIs5pbpwJPko/Ny45ImKtUKijK7isACO
	aJd4lCgU4/ZKMKnPxlTY93+52IYpkh9WXDSVEbcj3AANLtMzAzGNnqGoY9TeQ5LAyOLHmfUfDPR
	HRjtLdc4NJATouQAek6m5m0i1//Zgfug==
X-Google-Smtp-Source: AGHT+IF2UAqKBEIsjWDU03fhnfdk79hzfXklRzmYJu0XI5WZNyJUsJl9A1TbaofF+An7RpHOubeYSA==
X-Received: by 2002:a17:903:2c10:b0:27e:e96a:4c3 with SMTP id d9443c01a7336-29027374b5amr331259715ad.14.1760539184757;
        Wed, 15 Oct 2025 07:39:44 -0700 (PDT)
Received: from fred-System-Product-Name.. (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36738sm199853455ad.87.2025.10.15.07.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 07:39:44 -0700 (PDT)
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
Subject: [PATCH v4 7/7] ARM: dts: aspeed: santabarbara: Add eeprom device node for PRoT module
Date: Wed, 15 Oct 2025 22:39:03 +0800
Message-ID: <20251015143916.1850450-8-fredchen.openbmc@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251015143916.1850450-1-fredchen.openbmc@gmail.com>
References: <20251015143916.1850450-1-fredchen.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_073945_803382_70C0965B 
X-CRM114-Status: GOOD (  10.44  )
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

Add eeprom device node for PRot module FRU.

Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
---
 .../arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
index 3ca5109af19b..f74f463cc878 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-santabarbara.dts
@@ -1076,6 +1076,11 @@ eeprom@50 {
 		reg = <0x50>;
 	};
 
+	eeprom@51 {
+		compatible = "atmel,24c128";
+		reg = <0x51>;
+	};
+
 	// BSM FRU
 	eeprom@56 {
 		compatible = "atmel,24c64";
-- 
2.49.0


