Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E22C5DF67
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Aug 2026 22:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UcQAFNMp0s8CtBgoNyZRn65WXgc7JFZ2TpQaiFv/yM=; b=K4ihq78n75wqR8ZtLvHRKwZ9kA
	v307rcMqQVXWarrw+iFHjXZ1NjjElDcmg0EFWi+mT0TYhiH8ToFUGFKV2mwtChyJClU8h8txy/LeH
	PizD2PueIkd63EZZiBFgY0NsnfBanKPGtnzYyjQyH7UdVMgbqUqkLuo1Yyh9njr5wVgYmzinrc2ND
	gdcsPJklWww4DUPcUuJSWdxBpyreE1WybMJcRUVWtYGRxzPHqAqtUHE/0RwtPCRXG8ehV/qS5SLcV
	sjSCEiqaXxfnQoIpqqac6o8w/0XiRUj+VKqTAB60fALcVo54DtQxcYleT/hiVBotBJ3aNivCIwBGg
	/jt8akOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvMn5-00000004F4m-2oCz;
	Sat, 15 Aug 2026 22:23:47 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvMn2-00000004F41-0a2D
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Aug 2026 22:23:46 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2d30c22b1eeso4481705ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 15:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786832623; x=1787437423; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6UcQAFNMp0s8CtBgoNyZRn65WXgc7JFZ2TpQaiFv/yM=;
        b=kVb0LFy7p6cCixQuNgmW0mp/ccdYddA4DzDOLGbmO7ryG0MO9Yy6xFpOtKlF2q5XxD
         KhsvIbSN9N8Jayrclck8080uIR1o5XwTxr8QWlidkAFvRTbkBW0Z9RVGT24EikCKa8vn
         ZXLmTHt0Oj5wPFOJRUJSMYYviK5aTWuToXdSU3lZEAPw/nWxQ7h6k0GedPNJ5PAc5rSj
         9wNofYysgJealp/itgLTqvpStIvawue3TL2pqdIYS3isllUggq2IqSChkNkwx7/TB88z
         CO14rb5c+E4+MpXNLkkK+F1dSW4AEVDtmPC/+2Mt3M0ZwdmYcI1baiZJgZ1LH03YRW42
         mmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786832623; x=1787437423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6UcQAFNMp0s8CtBgoNyZRn65WXgc7JFZ2TpQaiFv/yM=;
        b=tIdc3F3uExzHyhWNd4NomjGSNwFZSsLA4h3/xwIWgvzDQAkUySqTZ6fFIXMKUCUc6N
         kRYo8W4buOe2kS7LZJaa8DEf8dqecNAt2pRY/LFM/prwZHvFDtr41l82xsm8aIMT7sRY
         ilD3I1i6UTTW86YtN6/UdyFmzwlBxIojU2+vd+YfAjTGeJeuDlfvj1JfAH4RgX+V9zle
         Uq9U1wBAleIM4ubf+fH+S/t34+R0RsPMuLpQ9xTjMffTnsNuR35qpyeTHwSb+ydnpJ1p
         v5sgaTfCPenwwJnrivOLOQFyyNbBCl+U1cUhp+LHJsqa7Db8kdgcdNXtd1tgmuz4OJsa
         d7tA==
X-Forwarded-Encrypted: i=1; AHgh+RpYwCDd0r6y5woswBdGw15yHNmFTKhtP5p2eNWehc8k4UkuKL/qMsrawVR3RaBLjl6WAXgt5R2qLuST4HaCtgzM@lists.infradead.org
X-Gm-Message-State: AOJu0YyWmvashk+FImk5rWe9flM4WVIu8ehz0YVUmTbsZuwA2FpAfCrd
	qJ21dS8EK58oNu8d7XBYGMfPm4KTl9VgpOT04Irq+MXvgHj6Q/91TLrzIA+A9g==
X-Gm-Gg: AR+sD102YzgrTuAuAuLg4WikYarxsPtQlojZGheBh95RUI7guRIB9Nn09AguVlFlQ1b
	uwe6O4KyqXc+++/6pvAEwN9iiVA5Ixz++fBT+o/ydR9VorXcGznv4KpCG8B+O+jI2X9lko15L3g
	FbBaCAORClENAN9/0JjmLXMjpJZOHMXZHIEqBdOneO0y5MMFsf7kjQmwL6XPunNgdJZLgflS+2O
	UeewlMU3P5CfL0sDIldEWa4gDgdbrXAW9MYGB/FJvbwEPzJ4Trfmh77xvvg2B0p4Ji76AeJEOuc
	4IMQB9kjQv//E6qm3V6OMuX4NxZOADJRRTYibmWFfberXG8QBUFaFaDpAFxSblShczZlZcY5ouv
	ldwsCG1W4lSB+WtX9OiHyVB1O+56QbElj2CkZL81Qv7AY3jUg2z58DTpqKW4+xDEUZ36lfexmEL
	emTD7jRUoNAJ9pk9dudPxNX4UueVbN7E6ToiPrOEuwbBamhHO015jg7ejRuONASJSVLenhhHAH
X-Received: by 2002:a17:90b:164b:b0:38e:76f8:fcbb with SMTP id 98e67ed59e1d1-3933b95a6b0mr12111918a91.4.1786832623309;
        Sat, 15 Aug 2026 15:23:43 -0700 (PDT)
Received: from [10.112.173.252] ([2409:40c2:505d:7e1:7f19:edf4:38f3:dccf])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1413887ee70sm23418743c88.11.2026.08.15.15.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 15:23:42 -0700 (PDT)
From: Bhargav Joshi <j.bhargav.u@gmail.com>
Date: Sun, 16 Aug 2026 03:53:06 +0530
Subject: [PATCH v2 1/2] ARM: dts: ti: keystone-k2l: Rename
 ti,davinci-spi-num-cs to num-cs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-ti-davinci-spi-v2-1-6c6f5171422b@gmail.com>
References: <20260816-ti-davinci-spi-v2-0-6c6f5171422b@gmail.com>
In-Reply-To: <20260816-ti-davinci-spi-v2-0-6c6f5171422b@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, j.bhargav.u@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786832597; l=1081;
 i=j.bhargav.u@gmail.com; h=from:subject:message-id;
 bh=YnPAhvKumj4atfxnTtYZIxnxE4cgoSSko47sbyyrNKo=;
 b=eUJRkOmM9J44+BfxeeQjWmUSj8QETnGffAkkYLH7eU1JaLePYeFUhG++B8x/TItTPVrbJlEGW
 T8gQz6jKExcA89Im/+SqtjNeqgU5QHhQ9J4N7XodfT1Ch/7uUzpmf4D
X-Developer-Key: i=j.bhargav.u@gmail.com; a=ed25519;
 pk=IqNDwUZKECEA+n8wXctFLBbYL9NhFstZNbOznm/nX1k=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_152344_190027_1BF3186D 
X-CRM114-Status: GOOD (  12.66  )
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

Property ti,davinci-spi-num-cs is present in the SPI
nodes of keystone-k2l.dtsi, but it has never been documented in the
bindings or matched by driver. Driver relies on standard num-cs
property instead. Use standard property num-cs instad of
davinci-spi-num-cs.

Signed-off-by: Bhargav Joshi <j.bhargav.u@gmail.com>
---
 arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
index 330b437b667f..39a846d7f8a4 100644
--- a/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
+++ b/arch/arm/boot/dts/ti/keystone/keystone-k2l.dtsi
@@ -401,15 +401,15 @@ mdio: mdio@26200f00 {
 };
 
 &spi0 {
-       ti,davinci-spi-num-cs = <5>;
+	num-cs = <5>;
 };
 
 &spi1 {
-       ti,davinci-spi-num-cs = <3>;
+	num-cs = <3>;
 };
 
 &spi2 {
-       ti,davinci-spi-num-cs = <5>;
+	num-cs = <5>;
        /* Pin muxed. Enabled and configured by Bootloader */
        status = "disabled";
 };

-- 
2.55.0


