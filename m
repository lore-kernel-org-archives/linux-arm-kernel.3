Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19102CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 21:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6y/eRSxQiwoKH2ttdAfQIDdA/0Ls/cq+YnfjCvj2Xo=; b=fWXmbNSHUlZvoedJenLDJzs+hK
	LJSWqQ5Ylv9eFcx9qzZHhLZgjC+KIhlrQTYQzlB1Ud1dw8hGU5beXacyD8F8nnILNA1woMkrzn+cO
	USyU/pwBKabZwFMrLUwxVee3G5rZnMxWl5wvG0wpkkpQZOqaGA43UYmV4tWSfOSS/UNf6LlzWay7f
	j0axLhsnmlMMLdzekDCs+LiHrt0+0TL8vTNbVC9p0pW3UWiNpaEqD9U/n08zNqiYmE1CkiD/CVcTf
	kJRxj6C7zlblxW2KWuARvDbSPADHnhn/RZL62R0jXreZquLEu0BPDGIyDV7MWLWYSCHvFLiTjv/6j
	xC9axTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL750-0000000Gu0m-49Ao;
	Mon, 17 Nov 2025 21:48:10 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL74y-0000000Gtyl-1i9G
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 21:48:09 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-656b0bd47b8so874297eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 13:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763416086; x=1764020886; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x6y/eRSxQiwoKH2ttdAfQIDdA/0Ls/cq+YnfjCvj2Xo=;
        b=M4zjAoLInC7lmE9605TAxZQaJnOphuIqq+3AWHv7w9DJ9EQ1mDt6c4nC31JeHi9MBL
         viqTIJSUeyFU3ukVumgSJtW6G+JvDhpbIBw2qrTp90GUpHXGDqBGUP8b/3xZ2P0L22gE
         vdUlr0r6GpDLu73DEtpnRwp+HZbQ6caXRssTzSmNPwsRpSIMTC9mA7m/PKNFccaZjwix
         mg54CqblruDXKqdpTlkt1P7E3F3yf0H5U+jqWrE1LdZu4GQhHGjGEM61DwV5pG2TTZ4U
         QVEdPfpVEHuxyxxMI2nnZrA6umJ5My91j5q9zm1lsAB7lyV7WKViuqI32iuqsxWcye6A
         AU+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763416086; x=1764020886;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6y/eRSxQiwoKH2ttdAfQIDdA/0Ls/cq+YnfjCvj2Xo=;
        b=QfRqCLJYUtJfh0H7aNEC9uvMJSTk4cg061WLTGoEI009U7f3b2goDtZ4IbFRLi6yK1
         Gw4ceahvINIFCNP41XB2qkosptAxEYTqEAtNs/6f0jlzhbvpJBGYL5Y2kTeoPLMN2O0+
         rM1+DcstCzoDmgBmiL4uEY+TuHM2X7EnCY4O7kn4WjndF6kEID38kN+aP0EQR7eeX2ye
         T56J4Fwx61J2nf9bQvqo9bbaXRZxtpEuyFicapouq+baEk7sDV7hE0Va4/cDKIWEXauz
         QegjsmOX/Inl1Kz8tMvp0ox/Bkkyjjw58yaq+I8CxMKLkxGCYISWAdL8dyAKgugNICB3
         5xBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnKO0fNOKmRD4A4z9zpicKPrNKfYLk7TBMNo5w+dFkM8MrXBwuEjwPm7PCK8CyVPtJ3uEtAAXeTwF4HcX9kVvn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4INfEH1hqITolDsDiOww5LuKRwL8UT87QUnwt7tT1rnAbTU9Z
	TEq7pAqmh3caXs+WSUHEQS/9GB3Ih3Xe4kJejUYSUdovxZ56fUjtKC12
X-Gm-Gg: ASbGncv7B4iua2eBXHYThpY7XGQnMNyFcfPhGmH6lcOolrL8KZ68pMFfbDZSGit+mua
	yWOVPkNLbFlvIw6dc3wJscUeLJUs5CX+egfE8o4LPlBRt74tCUN6yM6ka46soEz8+IyMWwh/G90
	o7AI4OfvgLzbelgzRIs93l9yngaSMdgSj+ztCXa+eXiwtBAXuoo8qD+P0WH4BkT2pvlFRPUYOg0
	52PHBcbHdca7hdeUfZx5R2mgxKaPTM/SuifavIGhCRbR6KovPjsfSz4u67S6G6W0b3gulBk7c4v
	fv0FomIpMat/wNZRUqvnDuS3+v4MtXaxYMOKp60GCZ9DRkrBfUq5eN9lH4QZElCY9us/qkMowtE
	0Om4DAfwQ6p9/rTXPshGkRyYHypzFe388+TCcEeI36NPbA8TqnrPKqPe31Ai+wJaINOfy7adlsQ
	==
X-Google-Smtp-Source: AGHT+IHrk3F7EjTrY16q42KIOsJoZ7DxS7LCW9UgjNx+oGF51fraAPigETXdAfIQtidOQRWCmx4LQA==
X-Received: by 2002:a05:6808:80ac:b0:450:d1e8:6f5d with SMTP id 5614622812f47-450d1e881a4mr2055837b6e.5.1763416086240;
        Mon, 17 Nov 2025 13:48:06 -0800 (PST)
Received: from geday ([2804:7f2:800b:a807::dead:c001])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7c73a283b3asm5938805a34.4.2025.11.17.13.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 13:48:05 -0800 (PST)
Date: Mon, 17 Nov 2025 18:47:59 -0300
From: Geraldo Nascimento <geraldogabriel@gmail.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Johan Jonker <jbx6244@gmail.com>,
	Geraldo Nascimento <geraldogabriel@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>
Cc: linux-rockchip@lists.infradead.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: rockchip: remove redundant max-link-speed
 from nanopi-r4s
Message-ID: <6694456a735844177c897581f785cc00c064c7d1.1763415706.git.geraldogabriel@gmail.com>
References: <cover.1763415705.git.geraldogabriel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1763415705.git.geraldogabriel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_134808_445362_EFBDC7C8 
X-CRM114-Status: GOOD (  12.33  )
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

This is already the default in rk3399-base.dtsi, remove redundant
declaration from rk3399-nanopi-r4s.dtsi.

Fixes: db792e9adbf8 ("rockchip: rk3399: Add support for FriendlyARM NanoPi R4S")
Cc: stable@vger.kernel.org
Reported-by: Dragan Simic <dsimic@manjaro.org>
Reviewed-by: Dragan Simic <dsimic@manjaro.org>
Signed-off-by: Geraldo Nascimento <geraldogabriel@gmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
index 8d94d9f91a5c..3a9a10f531bd 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
@@ -71,7 +71,6 @@ &i2c4 {
 };
 
 &pcie0 {
-	max-link-speed = <1>;
 	num-lanes = <1>;
 	vpcie3v3-supply = <&vcc3v3_sys>;
 };
-- 
2.49.0


