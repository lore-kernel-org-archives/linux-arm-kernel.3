Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B0F1CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 10:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zZ72N87Qaim5aMPVYiT+iILb4wfsMlQ62gUTdmY8nk=; b=JaRf95pQRazWqxe6wB5vnvBJ5O
	5PHLfZLwt+wpjx+rDOAM0vXdg6lG5WH/skIyC8G1/pzQ1LU6VVKAqiCd2h1Lg5wO4wlylaFOYKAey
	i+BeD4psPKqDkpHdgoHjsxxpnvZORH+SvVJ+VfJkjw47vM6xo4tNmOruYx3MvPR3tLPR8dMFin/bI
	YTMPvl/Ge7OzVzAFLkJN5cx3sqMB75PrPucD2G66cD69s2jias5gDr4tu+QDO/CiUj2zXEowHWVo/
	HUpXJ4cOzlNVPOYwv5dtXTRQWv8kcsXoF7FhK3+DLQLDWFTtsyLaJ7Zo880cbHGoWU+wb1O6xNqNB
	wgykTZxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypFT-0000000Ax3T-1o6H;
	Wed, 17 Sep 2025 10:18:51 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uypFL-0000000Awz2-2fiR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 10:18:45 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-25e5e1cd552so32458195ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 03:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758104323; x=1758709123; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zZ72N87Qaim5aMPVYiT+iILb4wfsMlQ62gUTdmY8nk=;
        b=cwhfprl+Gp9TFgi8beDrvs6S2tZJBt7H5t+BmNK1ueGyMpdS/7uhySflJmCNfD/8ZK
         K6/i65qe32NSxQCknekeHLrFXC0cpO5ISSTxygB+q82ACUl/7B2EnNiXQqznmrGuGb31
         XScleN4KrOeMJbjuCaSUPx/HP85xxCT2dAFSgirdndKplBw9vNOb0BhFFBVSzPy5imrn
         cTZMQoY1ZRAAPWJPnzbKqG95KzXWSoxOKROWjGKYI3IEodoQG55VtQ6yMiIKaZhOym7S
         6geupDAGQ6gXa4XTDk9mRIqSdU6r6fULQzh456DGZ1dzZoWDIeoahDxBa4VEFHEGIe4i
         n0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758104323; x=1758709123;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5zZ72N87Qaim5aMPVYiT+iILb4wfsMlQ62gUTdmY8nk=;
        b=oBBizev4pPD6h6zNjigjDdyx/Aq4BtKh8Bjq9Vh6e5zAn04caRD7h2BCSuhczowaLA
         kCpCn8hg4LnUnrxJ8GPuKbBapt0YxZ9daVj5lsoDELV/rmHXsAOdmZcWaUidYDMJZwEx
         NdmJHx1TbYStVnouIDJsycWVRcDge0r+GAH0lwc8g0sMnf+rZqFosl1R/vb8W3z0XS0d
         VQtRd1/eoR/eqOIdfSOVQEbnIh1LK42hBcVsy/AsashaJuN3jwTzYSDr3umGRe3nRmqM
         qPT6piA8Y8rZMvyXUMN2lZ7Wxy7lEoTStoP9kBwnG1Yqu+TkfIOGSb7BXc8W6qrPi/xO
         DBPg==
X-Forwarded-Encrypted: i=1; AJvYcCViJbQbncTZWy7QzEMMvu8UzwJMNIA9r6GT031aJgMlIpWt08xHiZSvRJYlhmHY3f041p7SdEE1UNXIp/feUBDu@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8vIP4bz7XO8uCRd6C+s71fUo4XL8eT9va1mKNpjq6RMrf7Kpa
	Q2ZufS/ToiJZlNwOf67KuffSazaawWeTcv30x+HqnoHoMhI7LpKxxio0
X-Gm-Gg: ASbGncuyt39TirDunNSYXaB2cVAtFxQUzWRgeNXa/54RDbhVrJ4ncYu6wlen8ku7CAw
	OqsA8q+hMJByTp0NcINX9ICY4NHzKU7z7HFDAQiIR40ilfx2uo9L7fEJT6d0MDukUXPBQYLppqA
	viaA4AlB8g82SAACJ4spzIP8q8UHUmkofnwA+UEY92eZjvpmbt38l7J/tNO3xQvQeWnA2+ezxYp
	33W1nNjH0NxT642i3F2QwbhV9li6uwfnNQYPzgGyJTwrkjELWJFnzgmuWsuqtviTdTkqQGvom3O
	3w+DfXDk/hQoo4t91GSIHihg87rA/V8hj1RXcdKjGKTSu/kRdTnSP6JDq80sku34TbjhaZD0gBE
	etWFFg3O4C5fqP+Hg9f8SyXiti9XY2qkMlhgtI15xaNHjflfL0ePTVmxNwXt0SHnRmYKpk8JK/Y
	4+f6tZuk76Jk+8kkmp1Vhs0ielWA==
X-Google-Smtp-Source: AGHT+IGJbBv49X8Fm3/hWIcTvxvlFS2nF6Nm7mbCdXfD2nMXpiK58GybyZRf/sFMYFcCCU2A4mYHkw==
X-Received: by 2002:a17:903:11cc:b0:262:661d:eb1d with SMTP id d9443c01a7336-268118b9516mr20803485ad.1.1758104322723;
        Wed, 17 Sep 2025 03:18:42 -0700 (PDT)
Received: from eric-eric0420.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-267f4d286aesm28588755ad.63.2025.09.17.03.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 03:18:42 -0700 (PDT)
From: Peter Yin <peteryin.openbmc@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: peteryin.openbmc@gmail.com
Subject: [PATCH v1 4/4] ARM: dts: aspeed: harma: add retimer sgpio
Date: Wed, 17 Sep 2025 18:18:25 +0800
Message-ID: <20250917101828.2589069-5-peteryin.openbmc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250917101828.2589069-1-peteryin.openbmc@gmail.com>
References: <20250917101828.2589069-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_031843_678380_B5210923 
X-CRM114-Status: GOOD (  10.75  )
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

Add irq-retimer0-0v9-alert and irq-retimer1-0v9-alert
for power fail monitor.

Signed-off-by: Peter Yin <peteryin.openbmc@gmail.com>
---
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
index fe72d47a7632..37b5e2614a9a 100644
--- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
+++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
@@ -828,9 +828,10 @@ &sgpiom0 {
 	"","",
 	"irq-pvddcore0-ocp-alert","",
 	"irq-pvddcore1-ocp-alert","",
-	"","",
+	"irq-retimer0-0v9-alert","",
 	/*O4-O7 line 232-239*/
-	"","","","","","","","",
+	"irq-retimer1-0v9-alert","",
+	"","","","","","",
 	/*P0-P3 line 240-247*/
 	"","","","","","","","",
 	/*P4-P7 line 248-255*/
-- 
2.43.0


