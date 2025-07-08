Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22028C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 20:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FKAwUXOLwMRO+DlBAOVwR1oRm93Guv88/PxNLjpkT9I=; b=aWHhkI9IOayt8bg+MaBNaM9nH+
	OOPZN3AY/69PSMizYvFbf8OIvKj64g3xFl9dQ9LvM+IVnM7aht0V+218LRbHaRasgozEoygV2SD7E
	y6w17etzSkTr2Gll2d9Z9/1deEEFDC79P/bu8W3CPMabEFrdhZ2weAn0Qwav8w3Y8dyHTLqz9qL/D
	Wkh2Ai6l4LIvZRxDlPsrnwhz+a+G1IbDgd90J8SpTi2Ymyo8ipSFYuEXWsslLt2MC8kRjfQxae3qd
	+Upe5o/KHUT7YauicsEFNFsI0Ekg68S0CFwU3SHMDtQiHqwTUHi1gKt5OPiK9jmKKyVzrS1LGN+/s
	9t2ictlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFAx-00000006Y5Y-3EQZ;
	Tue, 08 Jul 2025 20:44:27 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZElC-00000006U4g-3vz1;
	Tue, 08 Jul 2025 20:17:52 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7490702fc7cso2956417b3a.1;
        Tue, 08 Jul 2025 13:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752005870; x=1752610670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKAwUXOLwMRO+DlBAOVwR1oRm93Guv88/PxNLjpkT9I=;
        b=GyVNgLWdbJFlTMBLdvk+w1pGnuB0uMMgszV2PIMNFLKd+0l1pSYpnnyjJxUSDhKUw6
         BiTvtzIcEwPvGVMKXQpsx0K0aoD22Fby0sC1lVHj2c0iZGU0pCOVNht28NYMH/MObNd0
         GEs1cRt6ubzZYfJPKHIj+fEgpupEVECvdrO5Hsj6vl/oUmG1gue5EhxKpJtHxU5LdAm1
         fki4gPsA6T6Vngh9V1/rBOvzB08OaIiXUnx2Pn1tvD7GCN+kyh6TaUPwiXut/DYDmkgV
         7pp7CSnT90PoVm1Lvw8W4G5nZHX7wn1re6bnTuqRUJC0SWoUzid+Dd+lMNWQXENx2T3B
         MQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752005870; x=1752610670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKAwUXOLwMRO+DlBAOVwR1oRm93Guv88/PxNLjpkT9I=;
        b=vq8i9LbLr/4wYolyFpv8Q0k8mW4Kd3TU56Bwq1VoTqIDNsAvOXFjirIODo0e491BO3
         UFzINBJeLAdQpU9ey3zJka5EmSNcp0fkktYrJ4MeTXvRQ9nGGyrPOxS9KMfBuynh4irn
         uTHobegP0Nt9s7mx5S62ZXXFdfhhL/LCstrdSNmHJ9D89tFMJE1uy4tlA3+1+Kf2lZY0
         XMZPMAP1hQdanfxRNEC73iW2gEVZUGOlmBFolv6jsvApPNdZGiY+UG6dojdP0HTwCmb5
         W5DlCq84gUQ1tZuf/XmJyq4P9F+KvlDuiq2V5kNLMDcMu63MOEyLjNHPvBZcl8hRbOQi
         rlSg==
X-Forwarded-Encrypted: i=1; AJvYcCWG5OIg9j4hoO0KmrB0T83Kc2rwdlam7PLThWWDDXPeHwGTEmW9+P5QaxA6748TcDmrg0zyh80BZZDTuWtcFft8@lists.infradead.org, AJvYcCXV7OUJ+uK/d1dX+tK1/r0iOIB8Bn/lLtZPC/RgSfbWChihEtt5HLgZCTUGGw3gf5GTEajH2LNaXm7xrxbaVeE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxonOwX6gVPc0g10a2KvUNaHp/K9A0MWzvlJcVakWygPpzcIgbE
	VWZCDr6JTX0acav8nqH/nldyRYEUhZI/pWXhDIyVsWbxaOeVNAnkiOg5
X-Gm-Gg: ASbGncuZPWqHcq5ricXp+9jnhsD3euttfIs5tl5i89835DFFRIWj/vFqwepP2Y13Rkq
	DVMPPwxYUtV5wbEUl+7NWZXsaBBPPt0pyEhNp0MV5V2/5z0ds/+72fxE/BWQ7WL2peKHOKl++Hs
	64zJzaueKVlil6kqsxjHplCuwsvkxa0iP4YSGfI2kUgPRTBtmV6Y3RtqJAGTm3Qsp16UxzX0ZK5
	hviZGi67TC79eem78wVVmZoFz4uIePuLGtCEQA53lLMBC4K6YBgZ5loCX5ss6QwS+whuESnUeWU
	CNb5BcZzGaGkoqjqp7ub6B7nRKcHKvc+tnv5wukrLok=
X-Google-Smtp-Source: AGHT+IGhYZvUIjBIxwlODZkl6zsUOB58jiXQGVodXCDwRucgR+wkS29RzQC5R5fPb2KJH/9J6nMNUQ==
X-Received: by 2002:a05:6a21:998b:b0:21f:becf:5f4d with SMTP id adf61e73a8af0-22b4504428dmr6840682637.20.1752005870125;
        Tue, 08 Jul 2025 13:17:50 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee5f5d8csm12289625a12.39.2025.07.08.13.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 13:17:49 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv2 wireless-next 2/7] wifi: rt2x00: remove mod_name from platform_driver
Date: Tue,  8 Jul 2025 13:17:40 -0700
Message-ID: <20250708201745.5900-3-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250708201745.5900-1-rosenp@gmail.com>
References: <20250708201745.5900-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_131750_974580_A433A98A 
X-CRM114-Status: GOOD (  11.69  )
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

mod_name is a legacy debugging feature with no real modern use. An
analysis of the underlying MIPS setup code reveals it to also be unused.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
index 701ba54bf3e5..e73394cf6ea6 100644
--- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
+++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
@@ -246,7 +246,6 @@ static int rt2800soc_probe(struct platform_device *pdev)
 static struct platform_driver rt2800soc_driver = {
 	.driver		= {
 		.name		= "rt2800_wmac",
-		.mod_name	= KBUILD_MODNAME,
 	},
 	.probe		= rt2800soc_probe,
 	.remove		= rt2x00soc_remove,
-- 
2.50.0


