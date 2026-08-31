Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF8E0C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 23:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cRgJyzZMBo3Mlk+3YKkY9AJwPGn5QwuLyWn+ecHzZ5M=; b=TpZrCZHI4EduS/dxwu4iiz4l/d
	RNYd2OeDu89aGD4bbC8CgN27dYh+4YJaAeu5DhQounTVuFfwz6RPzIJ9g6h2u6T7MN+nUZGWf5E4B
	tpKNw3RGzieB9Rpofr2Q/lSz7Y7o1DY7V8nsLgA0QqE3NsCPHLx+McAk7WbrRKXQSNugNYwj2TXUC
	l2esUx0fj7SkmuzvdfH9EXEBPHvJwM7NgtQ/3S0eGtSxnKivXTvs7OLSA+pM2Z6F9o5Ysm9PuBRJT
	zO0f/4r3zedN+22WIxGcAeYXCSxNEhxixyWzW3ORBUWxeQKkC14YaAS4Sjk3E/f2mNSQh47BA4XHm
	Tjfv6KRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BYh-0000000Afom-32f8;
	Mon, 31 Aug 2026 23:36:59 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1BYe-0000000Afno-21ah
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 23:36:57 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-8485b358552so4199400b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 16:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788219415; x=1788824215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cRgJyzZMBo3Mlk+3YKkY9AJwPGn5QwuLyWn+ecHzZ5M=;
        b=XUPyGB7ftbzKSwTn/njrRvGWbC/IDIbY4+JnFman086c4fwKn9iIfGzfp6t/FJ27Nv
         6jWHlnJZG8fM5UvyS6wEh2pSfnL08jgxeG1pz9Bgx0m1OLGIz24FJabIK/yQGgC3lv4o
         EkfaoaMRMsHlxmStj8oY5hQIDjfFN3GJar/Iw86UkC+CRbrrGmyxuMEMDuz7Mnvm/nC+
         nfU1q2jDx/nhurWUOFMpk+44WA4frnZlmTpvUqFGTSyaRiwZ+0TA5LOeqE1gJ6y2km5H
         dWkU/PVW0qhTEPBxZ8kGkzPRT9oLMJWj5EQ/xeEMB74k0+bulnfhorGjAt8mT+1/UkAZ
         w1bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788219415; x=1788824215;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cRgJyzZMBo3Mlk+3YKkY9AJwPGn5QwuLyWn+ecHzZ5M=;
        b=KL110VJOW4WNw/6/cls0RUKxhhUh1fvrF0zfJkr6bbkSS/XilistI2pdn9i5ViNnpW
         MZyXCQ/LUOMtVno6otNGNjzARHs3AGAI1AfKu5suntc2RPZttlvjBfAgyXQDGtZqXJGJ
         0yDJ+e2ECBb7TjwnzLR1fCcyB6QFpFOKgYMUaXNJQg5wbp5PDdRco+BUs63GeeWsPwAq
         aH0SFP6H+bSIIU4PU9ZL/jCBv6UWfS9DMdbRYQzjFBYvXRyN6HSDuVAKbwIYqNJ9wYjp
         1a/sNvxhjCuXmtcgF51wI5X/+s2hl2KkSPud5CB4wWyloly5y4obSoMVWlZd+ngwGfRp
         LTbA==
X-Forwarded-Encrypted: i=1; AHgh+RqXIczdjchG+UekhUQFsBKTt/O8+O0YAkKUDb/viTankm1TPBaxHT0ri1H+2us1qWGzXw8Gzr6/G6vFLH9R5O6W@lists.infradead.org
X-Gm-Message-State: AFuF++nQYCGO1kSE2zxksAgCrS7N8ULaat0s3kAPfOSUceCtSsmk7+i0
	COVu4XVhQbaH21r2sLDpt5dd/yp4D8te/xuiz1BBHT4V1Kuv+YttugKN
X-Gm-Gg: AR+sD13h2K4/6p6htCDr3n/uEAvRxITVnYh0i9iGs1XGv+we8piztu1LChieIpq3sUn
	KfABUYUMIyOQ3c65bx3GygfJOnP1ZI/NDz6lI3Mzxz3bKvGQGctpNBUO8U+OwA3CBxqcnQDoBxf
	EbKE4dxN+VZ72iWzn2GMPllAGWgH55i6SKDuhrjT51DVSRXHyQ0vaNO6B79zI/BQSvWd1FKG4LJ
	o9HQVhBALGoeQpc6iRbJcxmKLvQrjC3K/xsGfqiD0RPC0VF966tx6XatgcFkqhoV/fWDgpbtuXX
	wOUWKSh1MCDDLJbBCuIJszlHCGHBEJFALt6os4mODLlQeZNvMb/kLtW6RDd0eHZ/JXkMBhG/sGX
	CVw8Bo/hcS+8k+VR1wmsPmdfCNKUb4NPdaJyRXKxVyd10rA5qpyQYt0abZPiBTtlWmk/iVM1lt6
	gWIohFuIZqiZQbOI3iqhXjiN669jBZsooZ6EL4VY+AaWe/V64pPa7KdRwyFIi5i/j+6r/HTIhBK
	LAVqezeS3UQhVoKk+FXd4vT8txVqlflNRZmCXfKy721igsbqZHigwUJ7ojkuTxxINDlZmhcx4WB
	dlWbtvqIt1mltFe1s8AZW+lYOCoQr2n4HlSlIYo=
X-Received: by 2002:a05:6a00:8007:b0:848:3f07:c5a2 with SMTP id d2e1a72fcca58-85b59689884mr6282519b3a.4.1788219415445;
        Mon, 31 Aug 2026 16:36:55 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85be8e5e634sm152963b3a.37.2026.08.31.16.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 16:36:54 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] ARM: dts: helios4: drop unused phy0 pin group
Date: Mon, 31 Aug 2026 16:36:53 -0700
Message-ID: <20260831233653.14232-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_163656_523612_5CB9C60C 
X-CRM114-Status: GOOD (  10.63  )
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

The microsom_phy0_int_pins group muxes mpp18 to gpio, but nothing
references it: no PHY interrupt, GPIO user or consumer pins it in,
and the sibling ClearFog board does not define it either. It has
been dead config since the board file was first added, so drop it.

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index ae03d42f92a0..e63b8b5e632d 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -284,10 +284,6 @@ pca0_pins: pca0-pins {
 					marvell,pins = "mpp23";
 					marvell,function = "gpio";
 				};
-				microsom_phy0_int_pins: microsom-phy0-int-pins {
-					marvell,pins = "mpp18";
-					marvell,function = "gpio";
-				};
 				helios_i2c1_pins: i2c1-pins {
 					marvell,pins = "mpp26", "mpp27";
 					marvell,function = "i2c1";
-- 
2.55.0


