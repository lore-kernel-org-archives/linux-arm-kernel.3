Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6319C982C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 21:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:From:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g1isH0tUnm2oT2WHcWd/StM+CJam3RvoJ3PEdManM9k=; b=K7ItQps5qSlmLvfoVeTSRl69KS
	hdYLGkCeGGA91VEQ60R7WjDVsb4bI4GTHMS7sWB6s34BTH7TVv8tmkYsjqLq9Urn1rJ6IdvcRSr0H
	Oi8Mtb9kI8FMuo3Tf2ePMJbQ/K2EXAlAAo9PQqcVB+pLw/4IdtxtcnJm0sHFA0x+hL39HFkPqDKQB
	TwbhCQTAvh/eu0q0Pqmmykp6TVICZIGV1vey062R5bLFnq3E92oXbpoWuGBEnJ0a+pXuAnOEK6C7e
	6UdU+ep3AF2RKppYa1PQmlvzOKA+HETlQEApFQaqNgoYWNp7VTB6qjLggcX8n8GVsB4WNXayGyV5w
	9i2/WxPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgr0e-0000000EqLT-0msA;
	Fri, 16 Jan 2026 21:05:32 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgr0a-0000000EqKJ-2piP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 21:05:30 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b873a14bb99so41338166b.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 13:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768597526; x=1769202326; darn=lists.infradead.org;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1isH0tUnm2oT2WHcWd/StM+CJam3RvoJ3PEdManM9k=;
        b=GUb2GyAd07lMvfbPkgV6Mk8Z+PfN9HXW/gbuQrZhYEFNrE2jNBNHCzXfcBXmvBQ3Jz
         z3i7GmLpt3bArjrZ3TdB7XvxFLGaf8CJf3sgPPGG4p1CU7tBbNQbyq3Xn/TT/jT2QEwN
         TzaavOxCphRbBj0xxHAtAdWktrNy0sY6Vhn9thtvbOWKe5wekB+2trv0iWXfcS8F3J9o
         1TxcF6L1+yuWIW06vtzveipHUX+wXy4k/MLY/kd/WuSXFJu0JKuFZr9TtvCwxdSy03pW
         3q3lJ/DS8hXqyMBP1EObPKgOZ2ZyYN4MyC/OuGR8CPziEbSJ3l2qnEoXKf5EHHXvVyu6
         Xy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768597526; x=1769202326;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g1isH0tUnm2oT2WHcWd/StM+CJam3RvoJ3PEdManM9k=;
        b=gmTqQEepL4/90G66/4NDUSq3zqpKaDIOc1z+uJC2IpLhkuE5zf5JLAS1Wew0NZZ+UY
         oEpYSP6ttq6W9ZxT5xtpsuxnLc9/Yqn2A5rMts+MeAzEipjfcnoX7g2xhFHq3dk4QkAq
         bvM//T1JXaVZVl3TjbvNgLI0Esxr4uYzZDkGCxqQ9j90Yf41hBPN50agCLEnulmWUnnU
         MWQpkHwkYby2lQoBIC+mRR/j1Vr2nMquA0xQWyFjgEpiJGNy9ts7aasX3rCnpX/GSw3s
         8AvRfp/9BHaVJ7ZH4UKmtxBF6ARdndy35d5PudPHTWOd325dXF8oMjqQZnAWOJDVvNiE
         FTFg==
X-Forwarded-Encrypted: i=1; AJvYcCVrSYmk12ArV3sKtG1pD4VWp481etDceGfWUAYQzV+1WpWNJdqGaumcH4G5BdvO/BCnzS11qdaJoCIyY3gf6s4m@lists.infradead.org
X-Gm-Message-State: AOJu0Yxd866Farhk3u9bLTwVSxa1DelGFWIxO025rOFt8N2xO4hvdCfp
	K/SJkXNEIkUMSekAjs4Fu8fiJ82P5/Ol6fISSWsTmExtdy7wqsymhRmo
X-Gm-Gg: AY/fxX65WV3U+45MdSzbaFMqEjjubYvxqNRzxleq9fQZ17cuq5ePSqmVWVJbn0bcEhq
	PM2ckG4hWO/vaIFFGRdAPxtTagudOpUgNdWfzPP3PPzlFvpZpwktpOpsIuL5orRfJ3p0qU7qPhi
	cqTmFNvV6gOm+u9zAOiGKeY9jNMozOZwzYyG5qQIaMX0rMvZmFI2YSoGT3qVVpM5/zBYiJE3uaO
	99mi+bKHS+P0kMnISBRT7vrHUKeL8HFSKYbCFo1M2XNWdE4xwJLRawc5FEWSTilNirJsOLikeWD
	Ky2Zu6V0yYickNZkALV+dLFWCigh+Z8zaYlWtI6us51YLYZuYRS0bh5HXShP9fJX5I6N0wlsSzl
	YU/s+LPLQBCtnKZ4XOgeLcBnFgV/Yh7g8KoSFq4jn6wmk4WoeNAHVK+i1cd8fYvABE/1fBg7K4E
	K8zFw9A5frODvXTFBqANzDq6IFTiaNEaXUBh4fKcYmfuu4zfd4NQ==
X-Received: by 2002:a17:907:db02:b0:b83:95ca:22e1 with SMTP id a640c23a62f3a-b8792e0edbemr223364666b.1.1768597526191;
        Fri, 16 Jan 2026 13:05:26 -0800 (PST)
Received: from ?IPV6:2a02:a449:4071:0:32d0:42ff:fe10:6983? ([2a02:a449:4071:0:32d0:42ff:fe10:6983])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b87959fbefdsm328674466b.55.2026.01.16.13.05.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jan 2026 13:05:25 -0800 (PST)
Message-ID: <c6feab79-5b73-413b-a94f-9d1b2fa6df43@gmail.com>
Date: Fri, 16 Jan 2026 22:05:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Johan Jonker <jbx6244@gmail.com>
Subject: [PATCH v1] ARM: dts: rockchip: rk3036: remove mshc aliases
To: heiko@sntech.de
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_130528_728180_2A669783 
X-CRM114-Status: UNSURE (   8.30  )
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
so remove them from the rk3036.dtsi file.

Signed-off-by: Johan Jonker <jbx6244@gmail.com>
---
 arch/arm/boot/dts/rockchip/rk3036.dtsi | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/rockchip/rk3036.dtsi b/arch/arm/boot/dts/rockchip/rk3036.dtsi
index fca21ebb224b..78afae42f8b2 100644
--- a/arch/arm/boot/dts/rockchip/rk3036.dtsi
+++ b/arch/arm/boot/dts/rockchip/rk3036.dtsi
@@ -23,9 +23,6 @@ aliases {
 		i2c0 = &i2c0;
 		i2c1 = &i2c1;
 		i2c2 = &i2c2;
-		mshc0 = &emmc;
-		mshc1 = &sdmmc;
-		mshc2 = &sdio;
 		serial0 = &uart0;
 		serial1 = &uart1;
 		serial2 = &uart2;
--
2.39.5


