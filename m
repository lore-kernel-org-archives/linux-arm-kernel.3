Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0639CC44507
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 02:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ufvoepbkxBTccdbf849+Ndmklty3uX56AMakRenyADg=; b=mxL+XcKedF50GBfgsKk0xjwn0m
	D+952Ewjq696VEviZCBUZJ3dz3PJZLuco1S9wTO2FH8j163XmOngqAooFbuwiBrVPkr5EOeByUkEd
	4DwGMZ+lef8mgJV4K6Xp/hguvcQameoxqL7HGY567woTe8FX9RsmWx4EBqJkPPJgMXw+ln9AFRp6N
	Nh8rpWAAl2uzfQWJJBawHEjzEgTKWOLrl/mMx40OAnuei2OVhkFt6YOS5UvhEcuqQWcp5i7o9WEFZ
	G8zvqXI5axWAuGRs4J3EwoSlnl1lpnGTWDiXGhCAR3K5QQEThJyIp092wkCYqzpoGbm5ZRgsN2ex4
	yUmUXNnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkBvF-0000000GHRP-1Z7w;
	Thu, 16 Jul 2026 02:34:01 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkBvC-0000000GHQs-1Qb3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 02:33:59 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ceab75934dso58325855ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 19:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784169237; x=1784774037; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ufvoepbkxBTccdbf849+Ndmklty3uX56AMakRenyADg=;
        b=jTTO1lPnAU8J68dQvRIZCRpbVTIDFGnu+ob0m3DFwRLGx2q4w6pifJOfWZUnjefaGS
         4ULqq4GiGCznNwTaSa/1Beqsd3351+l0nauDxgTRUBYp+BFeZXBY5bfJ1tbBlpJ7LEzC
         B5sN68qaX1G+Qg1+M9/iAPmvMH9bokYf5aDYIpSjtrRdUQAcFLKCyl3KkZdRCOjzdneJ
         Wk7sVo3xjLZQE06gITwMOTqpHkA7p4P2JnQhXRZSn8lwiWZyDmD8YUy+PR6HvYVYCD2O
         U0UESMwOJIKcTcjODk7S2NpWECKcr95u7mq/XyKPtIJ395gfZNlQGAQ/5ogejDqd3OXp
         +VZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784169237; x=1784774037;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ufvoepbkxBTccdbf849+Ndmklty3uX56AMakRenyADg=;
        b=fFLIqaIyuBxaZ7DAf49lgA0lo9I3DyawmWk5uzgSbgR6ew+gzplD/+QgI9Gv/QCBkU
         /YBV6JXbrghP3sfr8rBVwmrh4zT8S8NUAIpfMdzfEOPc+dst2yViSw0/tU9cU/Sysu21
         z4c5qdPI6djt3kGEWgLUQo+gmfzGjrB9AEz/yR3Ftehs2ur9q2BPU15I/IkiXH6hTVuL
         +7JQYFRW/WMZgvQWwe6R2lJKLn+7nz9q6eZfnWx6nbzq1a+8htsJgIUPEcFvcD33Sq9b
         cbi2ozqkmhJp2UXNyCJvM6OZ0jcEPqO7dY44cXMZ+FvfhLVMfH+Bi7TQx6qpyPuUZefr
         EEyQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1McjV6ml3ZoMbfj/Kwb+nbmQ2o1tv8Rg6uZlMX3MuqGyUkrpz0ATYLtx83i8c6AOv3590Dbx6Hn1TNHeOIEB3@lists.infradead.org
X-Gm-Message-State: AOJu0YwF06Mj+QN5LcAzFo48Pb7hjEta6LP58Bb94szpMOVLARcrSl9h
	iL7vfR/a2nHv+vVjqfTKTVDIDWI5FsC6l+eRvqz1TnMulYgd0X3JtBvE
X-Gm-Gg: AfdE7cnuNgWqLBJpVvSP0CzTchasKBQBp6FHcps4DeaCnluuj7ebh40bROVq1oqwPjU
	0eQxJGs+/TcIoOefQHJSu5k6fXx3eoypmBaYEOGsWKSycOFX2l5O45xnQTvOeeBvfn9aFsjX1s6
	LXT6SL8KXgZhvC+WJygk3zq0hPFmt2QD+BhU0K46lXKXgymb/gzjRhcDPOArAbVjjS51p/UehSm
	9ChBzlBpPwUoziFOLzP+DvLwYS8iQmMGSqm/0c43Fc/sJt64D+XX4JyrhKmn6e/fmbeMnfCDKeR
	zvP/7MelkZfo64hHcutZBnRMcxJGnfXOw3eIC3aEdcy39TzGQbGXRznf0Ng54CGB9pwmIa98TgS
	3CUgQMC3ae73S0/vkRhByk3NKG28Pc4gSawREOEwU1P5/WtfN7RsXiTQiW0OKPwX1Nj4IrWPkCb
	s4GToBimUgXKFAs6bNXq0RbD1B/5G1UuzcSLxKJvcgNnIXAV6sudNq6DE=
X-Received: by 2002:a17:902:ef0c:b0:2ce:ed59:7044 with SMTP id d9443c01a7336-2cf03da0b8dmr49619015ad.30.1784169237122;
        Wed, 15 Jul 2026 19:33:57 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf105bc642sm11540255ad.63.2026.07.15.19.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 19:33:56 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Thu, 16 Jul 2026 10:31:17 +0800
Subject: [PATCH] ARM: dts: aspeed: sanmiguel: fix PWRGD_RMC_N active-low
 hog configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-upstream-sanmiguel-fix-pwrgd-rmc-n-v1-1-8287b306e02a@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHRCWGoC/yXNQQrCMBCF4auUWTvQdBGDVxEXSTrGERPDTFOF0
 rsbdfnB438bKAmTwmnYQGhl5WfpMIcB4s2XRMhzN0zjZMejsdiqLkI+o/qSOTV64JXfWF+SZpQ
 csaBxFENwzk5koYeqUJ/8Ts6Xv7WFO8XlW4Z9/wCZYzsfhgAAAA==
X-Change-ID: 20260716-upstream-sanmiguel-fix-pwrgd-rmc-n-18ecbb8862e6
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Patrick Williams <patrick@stwcx.xyz>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
 Mik Lin <Mik.Lin@quantatw.com>, Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784169234; l=1357;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=DcxIBTDfGFMcjuFLqAGUh8B8eNoT1j4rQhiygNTbZAU=;
 b=AQKaX++ClRwxml6UKIVBauBZJ8nnK2N/HuEGZjzFOYDNDs1nhvSfaa7KcbzWT81FNH/I24l0P
 Z/PKYqJgPqvCg8F7vsL5rVg7sxRe2+PIyfIT7ci50DeBG3axZfL98LE
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_193358_386069_DFA37C83 
X-CRM114-Status: GOOD (  12.00  )
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

GPIO 14 on the fio_ioexp (pca9555) controller corresponds to the
PWRGD_RMC_N signal, which is active-low.

The pwrgd-rmc-hog node currently specifies output-low for this GPIO
with GPIO_ACTIVE_LOW flags. Under Linux gpiolib, configuring an
active-low GPIO hog with output-low sets the logical value to inactive
(0), causing the subsystem to drive the physical line high.

Correct the hog configuration to output-high, which sets the logical
value to active (1), driving the physical pin low on boot as intended.

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
index d7ed497d7227..ba71f1f9768a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-sanmiguel.dts
@@ -592,7 +592,7 @@ fio_ioexp: gpio@20 {
 		pwrgd-rmc-hog {
 			gpio-hog;
 			gpios = <14 GPIO_ACTIVE_LOW>;
-			output-low;
+			output-high;
 		};
 	};
 

---
base-commit: bd22661baff3295747e864c8647003e8eba46dd9
change-id: 20260716-upstream-sanmiguel-fix-pwrgd-rmc-n-18ecbb8862e6

Best regards,
--  
Potin Lai <potin.lai.pt@gmail.com>


