Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9CFCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 06:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGKLj9IuGGzKXJR4eozTFqH7zWJUpUm6z/EiTyDGmsU=; b=jGh4XhugMLQDJr0JbdPvNyBMXv
	72a+RfQWCpaQ1cxcBr07bhESpp4Mckc5vHmEjgyU/KlbOBdjVXRr/2H63jjTfpeD2onDnlnhN/pCX
	vsNdadlOhwF0EYCPHa9jx4fdsIRELIZh/+mHNbKQmAZnFCyDezPFIO/CFDJYEUnhHM/J5+XuB+ekl
	AJi/o0P3Q8o7IyHA8HAmOvBZ9PuoFEZUg4noVwGvrAl/V5VikbbO8O1PUFQIGAQxQ6CqeyQT6q6ma
	vwuf+Bfnzc7OpECTKQtWqo+uu75h+zZPaQWDE7FJeXTmjHL0Uqm3uhTBpD8Gg8X38cPczO5tF3ax7
	xmRsf6GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFo27-00000009IKD-3oow;
	Mon, 03 Nov 2025 06:27:15 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFo25-00000009IIp-0IKk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 06:27:14 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-29586626fbeso8157145ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Nov 2025 22:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762151232; x=1762756032; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZGKLj9IuGGzKXJR4eozTFqH7zWJUpUm6z/EiTyDGmsU=;
        b=VYpEaJ8umNr+UZHKmvDrL7uarfAbNJ50jxrwLjizzhwLHKFOvY2j/BMgl3P5AOI5I0
         EDfMZn7OAzRYh7Aw0xFPL8ilO0Ikm95auOAtmxwL7USYLFsUbUSH7kIVQzs24GBZhSwG
         GrllJluVgBqEtnS47q10HeGDyjwV5RwYhLU4LLJCWskfoySsdlLyyIRJefVgbOrlzVmy
         tfQSSXA6Ojom8EG7hQZo069iopjTBhHz4WppcSFfRAikCFLuTged9I9LuHHy0IZ1y3WC
         G1rbJabm1UrtPnOOXjKCs67qXJE8Q8VNoonn2xYWsA3yByZGI4M9IA6FDVv6777hUNXt
         KO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762151232; x=1762756032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZGKLj9IuGGzKXJR4eozTFqH7zWJUpUm6z/EiTyDGmsU=;
        b=vApUIOnpBrfuuL/lYZJjNWWZVOfJWxsFioRASvMK+6sVVz9fKFJFQM/4Rk/XhfMOTf
         21NzooyV5or6S3rUpH6wMqvuH/ouGMhRIMRwaaqVenet8t47W3Sk/K2D4k4B6OSq9III
         +zwfUY7ObqmORfc4uDlaKvuwrmpXqkjWTXNcmLA8b8aJBQFZHQ4hze51VhC7BjLVgS1C
         ZgYPvuN00b0XCzDuJQ++Ej5GWIbcJHvNNz4yTZ55m09qOcQ4fFcLkh6kEZ8TbJMGgdjH
         h0mWcF75bAqhrSP7n4wdcoeRI759c5pncw1fAU/rLfhzFO3A2eZpqMsiBfz6RMMor1we
         LRUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq0VnphXKOnCqPYcuXOqA27s2I8biSS8570FWlSg4881UKZgyqisja8Pkh0VbF/t7dai9qmN6/AmwKoK5jaWlA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4MkUetlWRhtaoRWo7PWOjFXYDYCXZF/Qx8ok/urTwz7NNFWbN
	7ek5QMdHOfzPbWH6KPhLVdQFYy8AQSBosQT5WRTt7E1BZzVvcF0B32GS
X-Gm-Gg: ASbGnct+T1ABOcw0vvL1MSg3WaTul0vZhx55eDprOLCosbMSMaeq4GKcqZZxPFoagK6
	Bb4iqg7jRpaAN0Zg8he9WAF+dRrfWfafm8EudhEYM47AhUwKOHieStfcxeJEGFpNTQo6w9kHue4
	qNl9KdyOZs05LqBdxSrssQ0XeSk/rJfIqtxQH6oWoVrdvuT63woY7+iFMTKrdq3Wf70wd8Fa/UX
	pF5pdU5uZs9BJbcYdzxX1uZg92A/wvsD9/74f1OhO47/eT/lWMkA8obKospQiq7Rf77+Tt9gMQu
	e0f/xitIlsouMyjkLWSrxG2BfxR1/GffGsYie33ZiOt4l4QLLzaF5w6UyjysBgTcGzTkiAEogCC
	D7l89b+QMjPyZF2aS2tvjZDJRX1la/LllswCicvhjeCklCr8U8iV32YZ6jzAjVeCwLDr6M3HOSQ
	==
X-Google-Smtp-Source: AGHT+IEEHJ5cKAo4s66Rvzv1t4feR0vnrItpNEwvY8alRc3/7dD6RTg/7i7hmvK6LD5XGWQ6H0YDoA==
X-Received: by 2002:a17:902:ce8c:b0:295:9d7f:9294 with SMTP id d9443c01a7336-2959d7f9455mr43290485ad.21.1762151232219;
        Sun, 02 Nov 2025 22:27:12 -0800 (PST)
Received: from geday ([2804:7f2:800b:fff9::dead:c001])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3407ef4c592sm4512294a91.1.2025.11.02.22.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Nov 2025 22:27:11 -0800 (PST)
Date: Mon, 3 Nov 2025 03:27:05 -0300
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
	Geraldo Nascimento <geraldogabriel@gmail.com>
Subject: [RFC PATCH 1/2] arm64: dts: rockchip: drop PCIe 3v3 always-on/boot-on
Message-ID: <1c1cb7f94cf41142c55561ce8f2a2579021d4818.1762150971.git.geraldogabriel@gmail.com>
References: <cover.1762150971.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1762150971.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251102_222713_126388_FA82A305 
X-CRM114-Status: GOOD (  11.60  )
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

Example commit of needed dropping of regulator always-on/boot-on
declarations to make sure quirky devices known to not be working on
RK3399 are able to enumerate on the PCI bus.

One example only, tested on my ROCK PI N10 board, to avoid patch-bomb

Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
index aa70776e898a..ad99a8558bf0 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399pro-vmarc-som.dtsi
@@ -25,8 +25,6 @@ vcc3v3_pcie: regulator-vcc-pcie {
 		pinctrl-names = "default";
 		pinctrl-0 = <&pcie_pwr>;
 		regulator-name = "vcc3v3_pcie";
-		regulator-always-on;
-		regulator-boot-on;
 		vin-supply = <&vcc5v0_sys>;
 	};
 
-- 
2.49.0


