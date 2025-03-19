Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1B0C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 17:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ktd5HnARwuJ13vsAdMCAO/qEm+OczuyUS4W9n3wx7eI=; b=3MD8GGRBf9BK8uJlC4436RIiuO
	GHQGRSExC2l5O3eZH2pIk4ywkM2DGIKMvgjofurDm9XzdUwZNMVVE85IWrx1ZfpBqYegic0nCyQXV
	Nfhroy9Vf6y/CYl7M7iHbcpyRVckcWq2JdekrBEVhmUpp9DWNsNcVR6ecKlqvUDyTcoFxgmvpstTd
	vHqWwU+3v8lrGfMQSgzO+4sigaosBDBM5wPURj7ToBHE6frncLg5gUi4IAgACWTxsOJ38oRX13kk2
	hqFZpG14wi3RhqsQMsenfClciklkqfnDzqAPzkJtYQWKl71OC/uXrWvH70Yc4/Bs7hBb2iclrwgf8
	SjlNbgsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwrB-00000009dMx-2TPY;
	Wed, 19 Mar 2025 17:05:29 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuwcP-00000009avi-0Oxx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 16:50:14 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-301cda78d48so874131a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 09:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742403012; x=1743007812; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ktd5HnARwuJ13vsAdMCAO/qEm+OczuyUS4W9n3wx7eI=;
        b=KDNAKFiHcfXg1fgNOY3rUwu7hlrWAQyynXFKXPF48jT0L23691gWWRE02uu5aUhLtD
         MwTAzlzcBfCYRFfxzaWqHjk5fDeucF1R4FOn7Q9tEXgPBaTkjo/g913vzpWr8PEV+Zhk
         BAOOgpWqdA5bsSmrytbvgtxy3cWTLUMFHJEWv4DMZHaCY867pnJ7mH/hu/tMEbqGayiH
         2thO5wwNsy2XI8eZszZSYeFXcNh2aVKL+HLXD+QBHFHnZR2pWARY2zdinMFefrMxhuBk
         RrI50uIZcktHRLRfd+iC56cJnazzUDe6/Noi3uZScZlb3SKQMg5TWBYgTfF5YbrnuSni
         pMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742403012; x=1743007812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ktd5HnARwuJ13vsAdMCAO/qEm+OczuyUS4W9n3wx7eI=;
        b=cd4vM8FHCHo9D9bY9xxzsnMX3g4sICq105HSGV2tObc/bUy5bPa4Nk7LHI5jkeNhbo
         Mxa1+gNcS14vdEIrpSctNklh7u4Sz5U226cPRm7oVq0F9OXbED/ECUBPUEKE3aL3k/6r
         jPFo+KDgT5GnkOZ+x0bH97R+BThp0lWs0A5qUXfdOlGJJgb0hCEPilIcKn/pOMOZT8RQ
         r77orW0ckS+KJA01TsWORGbHXXPXyzjwUTHWVdEQ1VX5lPSW/ZHk/KDJKF9LnSuSnDpg
         b+MIYly+DrVT66o3hBz+ifusr+KK0BQUjoK1+8f34t/hkrMc4ap4mIOzZ29tLX9anmGe
         g8Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXAOGANQkwyG9uSKebni6RuQVMOkuBYTNe8YcecHyyX0869MGh9XARQcGGBraFElKPJhqjF2Dx9BoZinYfp05DF@lists.infradead.org
X-Gm-Message-State: AOJu0YyaDopIWLrRw76nn3brppPcSEgzPhXhG6oR+xerJKxXIYu+BN3O
	kDvCYPeJxtGYiCiszkvFHW8gfMSyAypXQGd4seVC7yFjMNBq9Pr0
X-Gm-Gg: ASbGncsfAzd0CObg3KoeB2vbTAt6L5Zw9blfCylqznZCTDKyQEEMyk+WCSu6zXgUe6o
	4AvP5PmEyIb+sV8aR4RuS9nI3Yc28MVF/KjUray1m6G6s/N0mYFx13oSIe7uuuyhitRbis8T+46
	7NF/V8Cso56qDV7rhLf2JNb7VsmRnX9SKuJSmAOryWP3wxRjGFYOA0jYIiUBkhF6bwrMx6Che6N
	oxXegDHK0wev8IqGFPF7qF40S9+fb7C5/M8bnAO1sZddAIIkjkbqCb+ZCS1rDdBVkce46Jk07BM
	pjAdW3kU5rwMRxugTdFZmHxOmC9CS2kZ5scdN4QkU1SAILr0/6HhQivcK+TKT1CgigBddI8ybFV
	JKdM1Ve3xl8X9NSroCMK+mw==
X-Google-Smtp-Source: AGHT+IGxXevDtQdSFbDZHtjF2RHmeqCAKr0zaFPCSHEdfmgNst33MgVmH/JXly1hqvsrRFBXTDuyMw==
X-Received: by 2002:a17:90b:2647:b0:2fc:b40:339a with SMTP id 98e67ed59e1d1-301bde60960mr5555739a91.10.1742403012272;
        Wed, 19 Mar 2025 09:50:12 -0700 (PDT)
Received: from localhost.localdomain (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf576bc2sm1863641a91.5.2025.03.19.09.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 09:50:11 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 20 Mar 2025 00:47:29 +0800
Subject: [PATCH v4 8/8] ARM: dts: aspeed: catalina: Enable multi-master on
 additional I2C buses
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-potin-catalina-dts-update-20250102-v4-8-7c34b8139014@gmail.com>
References: <20250320-potin-catalina-dts-update-20250102-v4-0-7c34b8139014@gmail.com>
In-Reply-To: <20250320-potin-catalina-dts-update-20250102-v4-0-7c34b8139014@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742402988; l=1008;
 i=potin.lai.pt@gmail.com; s=20240724; h=from:subject:message-id;
 bh=jtqICxpttL+081MeVsrW0PF8g0r+obZJAZMWsooXIQ0=;
 b=x6Gzmnb1MJYvPzx8ZwKN1PgPtzH5ZXo5LlnNEMXuS0IyPsgHR2WVwVGglPj2osLT16/A3QCp2
 K9s+FG9+ciTAQDpvzrXkOqQ9lzlBFMDWvik3mUz8hcRRxrN+hXsLbaH
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=6Z4H4V4fJwLteH/WzIXSsx6TkuY5FOcBBP+4OflJ5gM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_095013_140966_BD0D3EB6 
X-CRM114-Status: GOOD (  11.41  )
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

Update the device tree to enable `multi-master` mode on I2C buses shared
between the host BMC and the NV module with HMC. This ensures proper bus
arbitration and coordination in multi-master environments, preventing
communication conflicts and improving reliability.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
index 573701bb7fee..c11de5a61912 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dts
@@ -800,6 +800,7 @@ ssif-bmc@10 {
 
 &i2c12 {
 	status = "okay";
+	multi-master;
 
 	// Module 1 FRU EEPROM
 	eeprom@50 {
@@ -810,6 +811,7 @@ eeprom@50 {
 
 &i2c13 {
 	status = "okay";
+	multi-master;
 
 	// Module 0 FRU EEPROM
 	eeprom@50 {

-- 
2.31.1


