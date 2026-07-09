Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A199C44503
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 00:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O/CQ58f2X+E1rLJHgMnpMlJRaoK+MsOQXmqFnkKcVtQ=; b=dH22yz63iQ0peCxH4swhEN3eUp
	p7/sL85TxDmVgL4/eYh8CYFLAokPG+MQXBnyBtKQLaXC6b1NazMCDLKBdtZmfR16ac/1kCLvkxqdc
	Ic7+XWcWXprWC+QWX6d3mBVm21j0PFH3O1rMTiMYSx3aqJsqf8+dIE17x32nKL0xSQcCgyy5EcUbT
	h0D6IjgO5y7FQuU3MXJOWMjsR61/sdGUl/frT4Y6Q4w89ix4ukxCGf1jghgNUjHOH3LVbD+jXxTBS
	VDNGsrR6Mjz7sXqw1kXsfF0uKeM6K+HrkylyMoiYS3LwrUulb3QfKXuFfVkhAhv3H15QpfvzwVUxk
	Z0oVdcyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whcxy-00000000flV-35co;
	Thu, 09 Jul 2026 00:50:14 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whcxu-00000000fjD-1bJD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 00:50:11 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2cace7da66eso13825355ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jul 2026 17:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783558209; x=1784163009; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/CQ58f2X+E1rLJHgMnpMlJRaoK+MsOQXmqFnkKcVtQ=;
        b=BohfINu/VC+SvklLJVjJbAPeD7Un2ZAwEiEZ67DCSaQwtnv/FSqC9bBt7Z1R49SDgd
         6G14RpPjrLep0goK0WQAK0eCQ0mjTkvGl+2A/O7+LVjVwGP4CnxLSCFIEnn1oaFqy9zo
         L+h1hss2J4xJwmz3f8YVNpt1wW4aegpkPM2dK9I+U66bOYsUBXdUjwLDsctOI4ekIb0i
         LjxE0uEbQSNdKjsq8fu7ZmUmXpDNYbL+JkkuhGRaCSiZMMh8TAdbv6DR3yhWEyYPPavY
         96PV4EqSVyS/bvguCYQDmqDgggloiSSxChPkZrmfDLIRKj3VfZfvH5ZyiXid3oxLF9nA
         KHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783558209; x=1784163009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O/CQ58f2X+E1rLJHgMnpMlJRaoK+MsOQXmqFnkKcVtQ=;
        b=cQVbXrJ+5+7W4hZK3CXLNd629oo2AL7SGZIaE/g1KVPpqtdOCv598HZ2uMMHyp3ABm
         7MhqR7wSa8DdQhVb8wfq1Pf3T7sHCeq1s49pIiZOIB6072GkiaJL7ZyrAGmrN1KA3888
         +ll6ri2lviTET5jP1zwPrh+XsWM5JY+iwYXWp05IzMYIxTYpuHTLgnmZLWGJs2fUsyIP
         UP0ffsBPtHvkpiMfFfCiJyEF1UutL+GDHijFtp+Sxoe62z0+OmrMSOcK5f83tKxzIqOw
         2d+ZqysfvB0d2w/vobhTOMSDafNTwqd+uK/wrjAtgTJvQL12lyNf6k1C8/QH8c4jVzgd
         IMYA==
X-Forwarded-Encrypted: i=1; AHgh+RpKfkmrVdDFaLliP0y+TGKT8YiC9KqIbEvBQss2n68MSxigyk6ypa+jXwivBeV/JN1dJeSg7t5H72LJwRPlJ+KH@lists.infradead.org
X-Gm-Message-State: AOJu0YzYuJBb10peahTTDtxhI7DfCZLMkysaQltmwHHrK1sqqIOuq2KI
	X2wwT5x/pfdQZ23VlyUYFfF/faI7bYeLFsGOYJ5UtZomHwiG8JlUqQ92
X-Gm-Gg: AfdE7cl8zUoXE7PTRiV+N6U2+/KiZ9OmkLvsSUkAROFPzmFpL+/T0IhFKk4XboZb1IU
	eQ+w9UnLmODIZI9dDo/vOgkLMpZO1f4wnt61wLKZ+GJh6bdl/92rIx5U67bszWA8rfCpspEavwK
	TIo+tUOt4ZuMQ4MQaLKLM3m8at51y4WQn/ATdOvjWnn2CRNDaYoJm11lDtPn4ehSA26UKndYZBN
	ckjbdqzcbMTpnfdhui3NXdex0bDcOW65Mh/kd/fK90Mgxn8oFkwo6yIuoD2qfMeIOmJAqd0mz1A
	cLyqxY56+N0k6bDJUpJXWT3NccID0s1AxmyId8gKArqFe6BW5JpsRNid6u7P5iDkWAxnkvjm+wy
	Iv2urf0CRdag/By+zyhhjnLTjZ685ErcoNsqyYujTxxcEekBxKAjmgsPznylewbJN75O7W16c0A
	NQ/5hsLAst1iH8lfHlrKbn+T84ErUmdCZC6iviPVfF16bqRuEuEOqySrQL+4ZsXIoH+S3ETyXDN
	HgmQNtpK6YpU0lqoVMl255Xqav8nTapOLA6ML9WetXgmjjP8htxDK8ZUOl6l6IMyg==
X-Received: by 2002:a17:903:1b23:b0:2cc:d6de:d597 with SMTP id d9443c01a7336-2ccea36a539mr52045675ad.7.1783558209417;
        Wed, 08 Jul 2026 17:50:09 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d59e51sm35604605ad.76.2026.07.08.17.50.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 17:50:08 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: devicetree@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dennis Gilmore <dennis@ausil.us>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Marvell Kirkwood and Armada 370, 375, 38x,...),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 1/3] ARM: dts: helios4: add vcc-supply to EEPROM
Date: Wed,  8 Jul 2026 17:50:03 -0700
Message-ID: <20260709005005.1587852-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709005005.1587852-1-rosenp@gmail.com>
References: <20260709005005.1587852-1-rosenp@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_175010_424152_C58FADFC 
X-CRM114-Status: GOOD (  11.98  )
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

The at24 driver requests a 'vcc' supply for the EEPROM, producing
'supply vcc not found, using dummy regulator' at boot when the
property is missing.

The EEPROM sits on the Helios 4 and is powered by the
same always-on 3.3V rail used by other on-board I2C devices.
Add vcc-supply = <&reg_3p3v> to silence the warning.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 390e98df49c9..05540b8012c2 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -201,6 +201,10 @@ temp_sensor: temp@4c {
 					reg = <0x4c>;
 					vcc-supply = <&reg_3p3v>;
 				};
+
+				eeprom@53 {
+					vcc-supply = <&reg_3p3v>;
+				};
 			};
 
 			i2c@11100 {
-- 
2.55.0


