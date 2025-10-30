Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4A5CCF9F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 18:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JjUjRNFP6aJN3yakl4D7gzIFYpfpYZ5LN/0WHYSw/TU=; b=pqYS9BZZarwIXfYBvfuZr4crpD
	Fn40MnAgFrTvrxvXWMYDsjRKpb4/cHY8qedIlkrWxOewXiSX8XMvAPgnQq1EqHkUuA0+2DeGlJ8fp
	yvKjJfnkrgQRoPmvVYxjDIN7H+0cCqgtMQDKGoZDPcXRGHdxGBZeRgtam2XakIwFpXSVqOibzz0s/
	yyTkd8YpioII/LpsEyLLbGEfMxpwHkjGq5O7Fteux/TDnvsbxd/cfSHRND02/U164BX2MIi4nz8Ra
	JF/JI7ZRvzrosSubY3EaW4IlfhzkC06gs3diXJzDxAt6Q2HPdK/qSIhEwBjgYkojiwyu4JC6bjmtk
	JrndjE7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXGR-00000004atN-1wdf;
	Thu, 30 Oct 2025 18:20:47 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEXGP-00000004asS-16IC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 18:20:46 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b6d535e3610so27334166b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Oct 2025 11:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761848443; x=1762453243; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JjUjRNFP6aJN3yakl4D7gzIFYpfpYZ5LN/0WHYSw/TU=;
        b=cJ5oKmv/g8UeLaArSIEkYQ0XLXTQvj0FwpnI/6QCiI0DAH7GNPwwHqnXicJEI0GQBd
         vYuXhFD4BN20LwgiKFrQ55koQGWCuw96oTJKlAuphT+eqCwt1LWb3z0MQpoX99eRf1D6
         SleB/2zDWhr1Oj8AHDEuDspo2LXH6ivIFM4H5IAe/G9+2gbNrynE4d58PzdfGQ48DsR3
         nmYa6aGQyufjnzhW/EdpZYOM5V5sy0WGnhLr52XZH4mELvf+xp+lDVMsv3wdvd1siSh2
         CcmPNwDvzWFerYNXPpT2/lRHBhe2q3ev1/rwBdqyLV+pGdQzjhJHu0Nz+J6M6Ltx+AWH
         OwGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761848443; x=1762453243;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JjUjRNFP6aJN3yakl4D7gzIFYpfpYZ5LN/0WHYSw/TU=;
        b=Wqk2Mw+Z8DP3A21jueT7KvVI85pbQeyrELj08k1RYyaFkC1DL7rdCkWD7KaLJH01dP
         JqEYzo6azMenrSjh9F4M6+7Y09PL6bNdkEb13XwGI9SAKBAdPvypwvK1cLrrFVMhoIJ5
         zQkFNWoC4ym3F+gnHkoqlmRgCN0f7P67M7hfHvzJXNv+r1eAlpkGuFPOUcv4IUVEkgaB
         LKvTeVjQq4Jp2A2oxxbd2ZvpJN7zjdGRCBBk2qIp0Acy+Dgey3I3ssQM1qpY+KQQga3/
         LcjXajxDyzxR59KU9MKe2T0dvHvM9l2n1AV6gZ7TurNuSWuqEi82/NqyS1nWXdUd6247
         YPkg==
X-Forwarded-Encrypted: i=1; AJvYcCVqoTcrUbrWkb4oY31hIk552P+e9mH3sTg1399E03V3PPspo1eo5av/v7oVhvClLpRNW0EVfNL52jLA7rwH2lHH@lists.infradead.org
X-Gm-Message-State: AOJu0YzDdne1Kdl6T3wseA35Z9hspCTiUVoYK2EevZZIgDqBm4K8Y+Ox
	pcqb5mFrvrOB1iZDPvn81MDtrhflQa9gOicisHYJJi2ugQHpU9MzUoXB
X-Gm-Gg: ASbGncvCntga6cLJ75OLhDrewdXkHz6J230I/lJOdq8AI//hx85Y4FJOpVOVNJ/TrBr
	/7VTtvc/JN5n3fo3b9eao/OBz73YBixVMc09IKuCOo7G+kAN/L9JQpEFtyiqB8zEcbPRe51w1oW
	q5zvBf8gOfaj5v1V+w+OpWqoUUGhjUSZ6Fj73HKmoqeY0Av0ha/Rb66veB6Hx5RS6Gx6lbjCA3Q
	KTbXOMHMA34+cC10Kguj1I95MM0c0uPCZ6pth2LnBmQblS3Xhb6SIHSzGOj7Jpn1kIBuCiMXprv
	yO0EhC0NfebQwNfbwnjkJRLoNWnKpwQ2gqBfXgOgj33cQn8DULQzOc4qW0FB3pNx5kMJTt7tShu
	JiCGFmC9hBCvl/829xYgvAZ4QkbJsKBXEug597vwLFmWVyqNpqsXS9V4TiY861vIak/qkLwNWwZ
	tHTblwwuY/ENCJRA1HrZti0CFAcf3vsz6X0l9eDO4me2sqJpl66A==
X-Google-Smtp-Source: AGHT+IGEKU2F7RouDiDAU+O5ZXJF5KXX7hpByUky1BUiO9h2llr9yFPyv+VlCHc50mSyNAzudGyZAA==
X-Received: by 2002:a17:907:2d90:b0:b2e:9926:3901 with SMTP id a640c23a62f3a-b7070627711mr22678366b.6.1761848443115;
        Thu, 30 Oct 2025 11:20:43 -0700 (PDT)
Received: from ?IPV6:2a02:a449:4071:0:32d0:42ff:fe10:6983? ([2a02:a449:4071:0:32d0:42ff:fe10:6983])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d853c549fsm1833865566b.37.2025.10.30.11.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 11:20:42 -0700 (PDT)
Message-ID: <3e461bce-e8e6-48f1-a296-34040447ff25@gmail.com>
Date: Thu, 30 Oct 2025 19:20:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1] arm: dts: rockchip: rk3288: remove mshc aliases
To: heiko@sntech.de
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_112045_337546_EA0F555D 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

The use of mshc aliases is deprecated for some while,
so remove them from the rk3288.dtsi file.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3288.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3288.dtsi b/arch/arm/boot/dts/rockchip/rk3288.dtsi
index 42d705b544ec..7e284b4fecdc 100644
--- a/arch/arm/boot/dts/rockchip/rk3288.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3288.dtsi
@@ -34,10 +34,6 @@ aliases {
 		i2c3 = &i2c3;
 		i2c4 = &i2c4;
 		i2c5 = &i2c5;
-		mshc0 = &emmc;
-		mshc1 = &sdmmc;
-		mshc2 = &sdio0;
-		mshc3 = &sdio1;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
--
2.39.5


