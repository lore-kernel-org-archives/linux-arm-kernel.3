Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05D8DCEB2C7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 09:11:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xq3fPnKASXQtpwph9wF/EfbRc92D/a+itaxLGojV4Lk=; b=CDR5r1QXjDU79ZfzzozL84ZyPQ
	3rbVUzf8GC8Dc0XZwCeuJ2wq/+t00qRscqbkvtOSk5NDpmsoMnpBHCqOs9BK9eEY+mmH6o0Rn9vuz
	wfWDa7S+iiUqRy84hF6f7Jrc/BxjEH6/8p49NOZsXAncvn+0lQ7UmAsnA55MXztbdQb8uY4z5bZTh
	riuIDFHfJM/xwTsB5V6+M2u95+Mq2O9iClw2baOeLr5VJ8n2QfSdKFLsTkNBOh/xTpAwMkp593aCv
	GNBBQOP0Tk2s5V7kk5aiMLQfF9rb3yUdaHRMKKAaWqIyoJ3rixOi595m5G4skwaFdvmZ6egPHqmgV
	44kIN3wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCJL-0000000DdSE-3aE8;
	Sat, 15 Nov 2025 09:11:11 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKCJG-0000000DdQJ-1yHT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 09:11:07 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-34372216275so3155466a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Nov 2025 01:11:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763197866; x=1763802666; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xq3fPnKASXQtpwph9wF/EfbRc92D/a+itaxLGojV4Lk=;
        b=eSy6iKAWgrLa2NaYjWf2LOGKbJusMnldvCdbwZrVEt9S4OuTTJ2++FsUzdptgAr3a9
         ysSCojQs+ulEODJUYoJKCc4LXE4CHArDeRZZqC4XCWPvzUNptMfNr2CPPl/WphUMONHB
         sB3a2VJU3vzlfRLfo5EqMo2vuMrwwe4hyspSwpKJE5P/JAKGQOniccI1EcfTO2mrf8b8
         rfmRLzuyGUnPJHOQV0osvL9t/AHHCluyMIlxHvECAf2TtQ1O6Gb1JB8kKXMgBw+Iejlg
         GDEVaik/m/Ulq9CA+k5VPRIIdvY6vdcj2KbaonUyywUL6KTaehcE4kt349v5GaSj71my
         nZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763197866; x=1763802666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xq3fPnKASXQtpwph9wF/EfbRc92D/a+itaxLGojV4Lk=;
        b=daRKO3gOiMjq0wVFMUtKQpfrGCs3E75lAmxENwqq5PKYoSNKpCFwSSOsYquJBn+skm
         NWuMfIS/g/mXsklkTAh4S4/adowKpY9PHTU2ihD0LB3BcSBuzWCTY4Wu57AVDbCMtJfL
         WagtarAW3uf+I0V4lwUuUMH/QmjJjFMfEV/aFl03dun09K5q20OsCj9M11T5jT95Kf+q
         LwFUwOpI3VCWnwCLtn9AS2jicR/UQjmZAV4mQXilbFz7JM13RKqk1kNL4jrG9f6+1HZJ
         boaizOgkv5Q4vN6spWHPuFr/XT//KFNoxH2fo+2dtYIFjAZ/arXAOmOPr72hk4+RPknv
         aC9A==
X-Forwarded-Encrypted: i=1; AJvYcCVkF5o7Vcb3ewZYeMo2QMmPidQSPC/LwAeHHy6tNt4AguSBauYKoiFP0bEFb0ppxu82IyEBeSvFe93Yuq5Pf0Gk@lists.infradead.org
X-Gm-Message-State: AOJu0YyxAfhBTWUxKNu6D1liUaCrVaWvKwenFOeHhQYnDVyO4r1P2d7l
	OXDO8t52zDioQdv2bWsXEDhyftVitve1TVihV34jwuhCmLWwOr26SvwB
X-Gm-Gg: ASbGncsP+1yet31X6XNYcoNb5guGkR4iTxLbyMwOOWKwkH4Mx6CTljZ483fZa7FWrwL
	MbBk3oiWdwttAYJ+wv4jgMiMDdtQhJEFsjx3LdAt6EmGoHnXmpAe7TCUBnL9lL+D1AGmguYAhaF
	B1mgZQ9nUi/ZCNPq75aBywp7nMxL0BauN7h/cS0Ei5LohqTQfnJs4o6yhlrjhhtc9pVI23HK/7C
	90n7nTinMmRsRbwgDaNQkfX85w37IxfRtWmqqIv3p0a3K3lvbEImK41YwslEhiaSnD9nsOgL4hy
	vxF3jzd4QZvj52QsIMsx54GWCfnmYZiYS3qGdOyN/BF0ElPKvhs/zUuZqC4Gdo9pPPOaNo/iK/O
	uwrz+pJcWs1IwsFHQ1G9rT854r3Saqf6Q4Nsxg4drLajyTQp7kPcBX9DG9N0MyOYbZHQyl172ei
	iAism4/Kyj
X-Google-Smtp-Source: AGHT+IH9/crdAL/odtABr+5A97CdQPw4u3wDAvn6Sjfb7QYJpDPxj2xNfdzG8PUpaUTw8aHQvHD0Zg==
X-Received: by 2002:a05:7022:69a5:b0:11a:26dc:eb61 with SMTP id a92af1059eb24-11b40e7b696mr2640354c88.7.1763197865521;
        Sat, 15 Nov 2025 01:11:05 -0800 (PST)
Received: from geday ([2804:7f2:800b:a07a::dead:c001])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49d695821sm22799663eec.0.2025.11.15.01.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 01:11:04 -0800 (PST)
Date: Sat, 15 Nov 2025 06:10:58 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Geraldo Nascimento <geraldogabriel@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>
Subject: [PATCH 3/3] arm64: dts: rockchip: drop max-link-speed = <2> in
 helios64 PCIe
Message-ID: <53332edec449b84d8a962f2b5995667766359772.1763197368.git.geraldogabriel@gmail.com>
References: <cover.1763197368.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1763197368.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251115_011106_518573_036FD8FF 
X-CRM114-Status: GOOD (  12.62  )
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

Shawn Lin from Rockchip strongly discourages attempts to use their
RK3399 PCIe core at 5.0 GT/s speed, citing concerns about catastrophic
failures that may happen. Even if the odds are low, drop from last user
of this property for the RK3399 platform, helios64.

Fixes: 755fff528b1b ("arm64: dts: rockchip: add variables for pcie completion to helios64")
Link: https://lore.kernel.org/all/ffd05070-9879-4468-94e3-b88968b4c21b@rock-chips.com/
Reported-by: Shawn Lin <shawn.lin@rock-chips.com>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index e7d4a2f9a95e..78a7775c3b22 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -424,7 +424,6 @@ &pcie_phy {
 
 &pcie0 {
 	ep-gpios = <&gpio2 RK_PD4 GPIO_ACTIVE_HIGH>;
-	max-link-speed = <2>;
 	num-lanes = <2>;
 	pinctrl-names = "default";
 	status = "okay";
-- 
2.49.0


