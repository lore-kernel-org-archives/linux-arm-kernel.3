Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FB55D59F65
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 19:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpTHncWMkMv9zIRpY4TqK3oFCmm5xn64bcnWELKNPJE=; b=UGX0nhKmu0OGexS4t4vy7DoRLc
	2QEDb+mm4G6PTg6ssC5wihyhvHMLRUVPDZoiZllWk87rq1dNk38TKutR0/lm+GZV8bJzDqR6biXpz
	XKRJI+LAuEn8dteBYTFGVFSR9eJBtjiKNcB2cl4BD7h+om63ZkEiGB/p3FIt9ACSgy7A67dsdOHOw
	5ph+5wmIFBlLNLQlNt5IXPsC327uaZA7OkThvoPtFTRlDL00qhV1ipdR0G1tKWWZraD7RKnHypHvu
	/czMyGu3ybTZZRuwunV2hOo8cuG8uEC7H6gaqPEJf3xggBOCs4RTNRkDkh4k7KS3APOwnoFddl2lE
	0tEMp41Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lOl-00000004SOQ-1YGD;
	Wed, 06 Nov 2024 19:08:59 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8lLS-00000004Rlc-024m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 19:05:35 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-539e63c8678so74077e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Nov 2024 11:05:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730919932; x=1731524732; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YpTHncWMkMv9zIRpY4TqK3oFCmm5xn64bcnWELKNPJE=;
        b=NypL6H0cUe93AetHOzOpjV6Ug6RyFP6feDLcyfpWeWuGXNWHCT2feWq/RiHME46EDB
         pH0LJrh6aaUB8soXjF7qdmRBsLiIfyorYr73hBM3DGleze0dsQ3/r6M0dhSpGXsUnc7W
         h7jlH/GrHBA8oz4xCE06dgz4OVIU2QSJNQI6E2l7OmJINZCNyTNI1aZGUG+ehzA/eXuO
         grrlcHQ3iPX1skNiMs8kOovNRETEzRBPlUOmEsavTwQ5W0M+WjJdkHI3h5SJ7n/Js9UR
         qHjcpf/BJsP/mt/EAPK+8QT96nn9gAV2YAzApRo11vXR6/AlcOpcY7EuQhRgu8bEXFxj
         zU0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730919932; x=1731524732;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpTHncWMkMv9zIRpY4TqK3oFCmm5xn64bcnWELKNPJE=;
        b=h/rF0WE+OreH8HSCypW6sVixzxApUzdEtPu41Zcoen+6YvjfsXgYIFRKHrRT//IP3C
         PEqXQz/EnfRYtULBsKGRr1UPca0mZ9Dn4cv4UDxBGSAVAgJZ/Ly3EgzDEVNZyFZl6TR5
         DY6XUjQCe10tMMy9sNVqTGSW0f70Pisw2KlfMWSH+nSXyxYfSrgSNisefQaXTq/uoskG
         k46zmjxT//Npb39C8qdmByYNj/Rwko64qXJ8EhMM8AFmWIT7ALuUEAR5lstyVS+T1msA
         Sqb3xS/l6DJ3E99g6b74+gZ76uH3WPgm8eV7ms0V19Mv6kxvhY+5zsPlK7VdYJlyW/Df
         A5mA==
X-Forwarded-Encrypted: i=1; AJvYcCU3fvF5potI4cSxqF+Yw0TrA0W8LTv+wTRFBrgfqmfd/eVSBbYv+iEDwRzW22HKcgif050iKMFbWa5R9ATML7cC@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+pessnhf39i+MTr52fM5kjbmT6CViErs0QkQNPdcQc9+VC2Qz
	4y/qg9fbUwHK3pZcS1YluXFMXeTmmnWTFS6oRNt1qvTCaCcTpR2P
X-Google-Smtp-Source: AGHT+IGEor+7zD+u330H557Suhcp5eKkaVdt5wNtOe/FNk3O42MzAo0FSC1LeXPo8y3gu3hireahAQ==
X-Received: by 2002:a05:6512:39d1:b0:539:8b02:8f1d with SMTP id 2adb3069b0e04-53d65df2a2fmr10829214e87.30.1730919931330;
        Wed, 06 Nov 2024 11:05:31 -0800 (PST)
Received: from standask-GA-A55M-S2HP (lu-nat-113-247.ehs.sk. [188.123.113.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cee6b102casm3106827a12.87.2024.11.06.11.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 11:05:31 -0800 (PST)
Date: Wed, 6 Nov 2024 20:05:29 +0100
From: Stanislav Jakubek <stano.jakubek@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] arm64: dts: sprd: sp9860g-1h10: fix
 constant-charge-voltage-max-microvolt property
Message-ID: <aa557091d9494fdaa3eda75803f9ea97014c8832.1730918663.git.stano.jakubek@gmail.com>
References: <cover.1730918663.git.stano.jakubek@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1730918663.git.stano.jakubek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_110534_070229_0E8EA74C 
X-CRM114-Status: GOOD (  13.42  )
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

This property has hyphens/dashes, not underscores.

Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Signed-off-by: Stanislav Jakubek <stano.jakubek@gmail.com>
---
Changes in V2:
- collect Baolin's R-b

 arch/arm64/boot/dts/sprd/sp9860g-1h10.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
index 095b24a31313..cd8b1069e387 100644
--- a/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
+++ b/arch/arm64/boot/dts/sprd/sp9860g-1h10.dts
@@ -71,7 +71,7 @@ bat: battery {
 		compatible = "simple-battery";
 		charge-full-design-microamp-hours = <1900000>;
 		charge-term-current-microamp = <120000>;
-		constant_charge_voltage_max_microvolt = <4350000>;
+		constant-charge-voltage-max-microvolt = <4350000>;
 		internal-resistance-micro-ohms = <250000>;
 		ocv-capacity-celsius = <20>;
 		ocv-capacity-table-0 = <4185000 100>, <4113000 95>, <4066000 90>,
-- 
2.43.0


