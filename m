Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC16C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 12:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=efDDw2XG4FjgOIVMZFXJuQt8TiVVi2gSSR997D2blzk=; b=iV54SYcOxFwW18gtdGAWw/qIgu
	oSXC6b9cVt44JiYlbcSbzJ3EgP1Qv6KV8gNKgdmzV8+B8SHYsBsFuXzLOh6iLGamgxrciJGaLa03e
	6Z4Kv+g7Z5g/8/aU6CiJCI2+toVjj2Z4ATDZyjYqu4jPXoC332cTFY3nfUInTsWuOVarzhb7j/CcS
	j3u+BgmvXHgntgc7z2YZG7MnlJWBQoK3QB34UZc5mrfZaVxobj87A8oBFpq55e3m9qtuAPiEi5gJD
	vkvFYiyKWxNTk+L3uLHFciAzqouTLRaFMiWbC4WIA6ewgYDO53kj7y4d4oZgJwkfGrbRFnx7y1zLU
	QXbNDwZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwwI-00000005jBz-04wi;
	Thu, 06 Aug 2026 12:11:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrwwE-00000005j8i-31v8
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 06 Aug 2026 12:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=efDDw2XG4FjgOIVMZFXJuQt8TiVVi2gSSR997D2blzk=; b=p7+Qt0tY1p3csAXvOkkLrWEja/
	gj+UsRJTFkFbWaBI+pJ92imq7zaDmDrr9Fs6pyoS3uaMCsHFcpXG4+5GE7/LGEIyHqUt6QFiwr6Sb
	NCT2hru4kTdI8hbTHWfcIiI7N6x13U21nukUDHzCaGJ3YwqSZVcCvPJOPBZZgAgGNWqusxjJQlW/G
	YqwPDBPnJ5J4A0NkvUZ4uoXX/w0fmCUnCS4tk4fjiALqK/vDjxow0SiOnOZEh6dBfxXEPaKK1pQV9
	fAGkF3uV7gj/6u2pdYCESZDXmAEwcgo5eTEkOC/EH0zgftHHrvIlGeNF9blFYU0eWrqrCDEJNIr/p
	lYT/Y5Ew==;
Received: from mail-pg1-f176.google.com ([209.85.215.176])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wrww6-0000000BTje-2iMM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 12:11:05 +0000
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9b373d5af0so1713756a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 05:10:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786018256; x=1786623056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=efDDw2XG4FjgOIVMZFXJuQt8TiVVi2gSSR997D2blzk=;
        b=MJGsJ0TSy56i77gtYzgPNA4tY6ESjSHvWGBrTK+A7b3bZv0laBt4VR/7dG+FEhS6rj
         Rm+SCZxRbYzHz/NKo85BXUMHaLO+KfNkyODcMM8A1Gt3TIVJ39/LD/Z664AvlgrpakoE
         Zj71VMK75vp6zwEQ8n9YIJ4hIXbG0CILn+NEf37AOPSK/I4uJO9fMA8bAcB1R6eVoMFS
         CTn4ddQW+amj2FrM0Ojc/Nbifu0oiX4fcNrAlxCiy9nx9vPJNYXXxnKlyU92A0Lh3/mb
         iWzYJDKNylKtTW1UVeoOXuZ72/M21vDCbx2rkjQF00h9VsMJxboCn5uj8RtnorzTCNoM
         HXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786018256; x=1786623056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=efDDw2XG4FjgOIVMZFXJuQt8TiVVi2gSSR997D2blzk=;
        b=JLfiroYfCncicFTz8SEKZMfuHmHHvAPc9tvfooKzzFdKCObvYLHb1/UYEw24kHJoxz
         ZwTnZih1VJ/qVxN5F+G8snC/Yl29CsqtwW/GLz5943IqVPjrlY545jKnBCJz4r5YIzc2
         xYt9FBtKJgi75v0pjOv1TrY95wbiLs5Tzot+0w/lIHiWEhLz6iNieJg5wgcbzV+sWbfn
         IbHvUwWIzDNIvY0syGtLNvJ2o9zxoPabq5f91XG8MS5CZzxczfJS39JVCKQSg4VkCLBU
         /v+RJ36GO3NZ27Tmn0C5FFoJnDQ11udvwp4mHH7EDrJ7s7XygsZFHeA2Y+xgTR5jyBWL
         IrhA==
X-Forwarded-Encrypted: i=1; AHgh+RrH0Mnxrlp7BRcrO9y1MIqicLBuYjhTFTupP/iBfqRW7qpQ1H9UFbwfQSvlq3oX1+cnlKUEzAJMyc0WkEcgpt3V@lists.infradead.org
X-Gm-Message-State: AOJu0YyUTviWon4+xxSmzvM6KS5+8E76eq3vgXiHtDQ6STSHVqDbQTwS
	gWHnMZffjhGYhWuDfASEb+b5YKcjSsUG68v3Cabw4CG3bCL272bJBNCo
X-Gm-Gg: AR+sD12HB6KYOdJK3Q/MCyq9s11axEWHQj7aK+FYojmGMavySmuVklHnjCzyu7v8ns/
	E27BNQuJvXeJO4Gj4s2Y6NgXwp3tcwvhVtmrjATrbGvSGqa69eQACeexKZ1j1F6zwEEsXtqwxlS
	otrdC2rGZDuTX5aF8JBjDnQQ6KfTs61Aa9Q1rrPDqyb63TuQpBL7qwBZ/zrOUJbDSeCu2bvSbsl
	OMkG8IqxJDKmnmmFk6yJTSngINTgOeY74yZoiJ7sPsMOOAvsfOStycxdZZ/BE4ljhy53URYmiUA
	hmeRTdP+WBK3D1PuBQkiB1ZaCXw7dwnSY7k/wnlAM8gvMop9i9wsTsNMkoPowiDFwIAUuZiEbrH
	RSEKjJNoX4FHNnihS82rASrB7mGwOOx0otWr0sntOCLhiZkqLM2pAS6EkJx7zrhXpe05xVdHu8P
	33lSLhRzqV1iejclQELqdAI6Kq6TYVwK5EB61hAAP5hLjQOdFrVHYMsQiUCNeb1L3QXJAS8IpcI
	iHrGsO3VRhUZUhyR4FG7MR6irlDiaLvHp0tuQ==
X-Received: by 2002:a05:6a20:2443:b0:3c3:7fa2:9618 with SMTP id adf61e73a8af0-3cb85f4a647mr15543534637.37.1786018255930;
        Thu, 06 Aug 2026 05:10:55 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:e1cd:daf4:8fac:b7e6:4f37])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158673b7b2sm28406824eec.19.2026.08.06.05.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 05:10:55 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH 2/2] arm64: dts: rockchip: Fix the BT clock-names on rk3399-leez-p710
Date: Thu,  6 Aug 2026 09:10:39 -0300
Message-ID: <20260806121039.16967-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806121039.16967-1-festevam@gmail.com>
References: <20260806121039.16967-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_131058_702149_4B70344C 
X-CRM114-Status: GOOD (  12.87  )
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

According to brcm,bluetooth.yaml, the correct clock-names to describe
an external reference clock is "txco".

Change it accordingly to fix the following dt-schema warning:

clock-names: 'oneOf' conditional failed, one must be fixed:
        ['ext_clock'] is too short
        'extclk' was expected
        'txco' was expected
        'lpo' was expected

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts b/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
index 2cdc2013c320..c449eaa84edc 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dts
@@ -588,7 +588,7 @@ &uart0 {
 	bluetooth {
 		compatible = "brcm,bcm43438-bt";
 		clocks = <&rk808 1>;
-		clock-names = "ext_clock";
+		clock-names = "txco";
 		device-wakeup-gpios = <&gpio2 RK_PD2 GPIO_ACTIVE_HIGH>;
 		host-wakeup-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_HIGH>;
 		shutdown-gpios = <&gpio0 RK_PB1 GPIO_ACTIVE_HIGH>;
-- 
2.43.0


