Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E518C5DF97
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 00:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PnAW/+M2N3uaW3xnWGqAHnUdUrdmX0tYWAkQfErLz7w=; b=C0o4I9DVa4N/8eapinisdYIGW8
	0mJt4msuOkZHf9t5UEzJTB/PIQG1LwB9k6ss5hv15cosL/3n8rLRfXbY+/mCqg5oXYkq6t0rMhDaG
	6edU4YTOZdA+H7tlK/zl2yRHiflsJvf1lm3nF8up892O+qJeeMjUUxlbzajmsFFZQQFq/LeWCyDQ5
	LbYizjhdeuCXipaUWxvKVo3KkUuGDrbOr0vR0i9UVO9Qtl73kr92Oz97cFAZpJXLTvLVfNq0wjRWF
	EW9S7PuuuDdo5WwKpmSz8twPRRkmVdPzfDB+gG3JkMIqXCdRIriJWYydLMdUhXJp92pUZoQYynuW6
	U6WVTDqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyIBr-0000000Fhcn-4A3D;
	Mon, 24 Aug 2026 00:05:28 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyIBp-0000000FhcT-2xaY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 00:05:26 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-3900e39d935so2838027a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 17:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787529925; x=1788134725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PnAW/+M2N3uaW3xnWGqAHnUdUrdmX0tYWAkQfErLz7w=;
        b=a6VnxRMlJ44EOUzTTV7D1/NVIb8nQFfAIJzneVxqU7iRp+aJMYQhX2nbse/JYGOeCw
         Vu2uXtFsul0mxZPx+f+MJ9TzMIIk6Fk9nbEuEU0XutdYf+9KM5lpCG3f0HofCetNfVs8
         DGV9f1iN6AjsMFV8oJWXPoZ69YaskRK0Oer0ZCs0GdMUT8aJY3Fn5C7YzWaJNe4v5Nlo
         FTIUqu5aANEvEZ3Vngbf9JO99nweHqrQVVDCWoZotgztlrA1DxDaGxXsZXPG6BeeRGsQ
         i4hn5jqTmtN9O8XC/k3qyOgv02Z0xm+3+KXXBNaHOXcSMER0CofzRsdzRSKmf4D91rck
         FyNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787529925; x=1788134725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PnAW/+M2N3uaW3xnWGqAHnUdUrdmX0tYWAkQfErLz7w=;
        b=Gv3QI4Nk21y7F9N/Y3wHzjDeqwyPaa1xlVrYeuqhGOzV3TMGFsWUkquzULqedKpbd7
         mmUn+16UW2sBkGnTPHRqGLkR7LeJD9uh1djZuYTNGZSb1MAJD1hhx2lV5OMIja1Sn/br
         wyYDFL4JcQAOEhb4OQXxy7ODgSAbFsLMHqRg+c966qnRME/Qy9njt2/w/6yqEsoDlXgj
         efxQQ4o+C+fmnYQOEDnS9zeqSaJ8g1HMAj1RvzLFrhadvTKZ61IOV8Qrs2b9ALSwWo57
         xXSY22vGWTI+kq0lvnV4bsaJKONJZqcr0MgSxV2D+WhTXKbfpyt578lHxpN1PVdDnBmq
         dI7A==
X-Forwarded-Encrypted: i=1; AHgh+RrBVQwg7pddb0btqJzx4qjT04C9nCBUZ0xLLi0hon2l+glLFSK8V3LvRYx1bqIizvrNJDcK12Dtcg3hmDlvAs79@lists.infradead.org
X-Gm-Message-State: AFuF++n/Oy5W82YUEPYJHdZjxbhSOwI/2UcFGtNH7tfhhy4HhzybkGae
	nB6K717c1JfJ0um2Hanjy2uGYJwzw70KEtwxgockeaOpBc8l6+wp++vg
X-Gm-Gg: AR+sD10DqWGpRbyaY3eFILbwaiwulTzex9JrhzPK0UwpYWr3oHYl9INNv6YB6pIYkWv
	YSXgwYJHAko9IFHIiMPVRB4/1B7vanl6SmiE3kufE6noUN6rclj6rzXR5iF+kk5ZNbBkRHHTUwL
	33i0RHUiUsy952ylqzaXUddchKJ7Weui9NKAC2lK0MLjh1lG8iKGvwUuuMknBZJ1SiL2pEW66d7
	xCBb3AQ9qU1rJO4g7kQJZWNPNkrKoh+l30ixhsBo5INYrqFpXYpvAsVul+s+bRc4Qup9aT4Yzi1
	ntJJr1Bt2Tgu4igPTigALkFZNdPaIi4+7cxZ1SWle5iOB7SuxTUP9CFi3AZvT42KMvZ9v+B7B4N
	0SLrH0bYMxdbrUD4FO6uNbi/dFk3Wd+JnCqoHHBnoth5KpbZG2Mbya00vyE/XH48XjfKiNMU6VJ
	35WoVeqStHTLOPI6b2upniXgMUFCeGXy/Q2K9xxQZ2EcwzLe8uzz9Yel8+bJamn4jiSfJw8nlZm
	WvOXXEzSoHautGb29PDzAMKD/LuWSMZ+0JzcRgCAOjlldhgLwOvFII7frNM1XNhYuwdyBLu0FwM
	UCtmyqN2zZC7TuQaXOFCi6JeI59wcwYxJWm5rlZSpGA=
X-Received: by 2002:a17:90a:d605:b0:38e:5964:97a8 with SMTP id 98e67ed59e1d1-395df5e8fefmr26414134a91.16.1787529924655;
        Sun, 23 Aug 2026 17:05:24 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e49d7eb9sm7672228a91.9.2026.08.23.17.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 17:05:24 -0700 (PDT)
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
Subject: [PATCH] ARM: dts: armada-388-helios4: fix vmmc property name
Date: Sun, 23 Aug 2026 17:05:21 -0700
Message-ID: <20260824000521.80492-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_170525_758389_457E370E 
X-CRM114-Status: GOOD (  12.43  )
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

The sdhci@d8000 node references the 3.3V regulator through a bare
"vmmc" property, which is not part of the mmc controller DT
binding. The binding requires supply properties in the form
"vmmc-supply", so the current entry is ignored by the driver.

Rename the property to "vmmc-supply" so the fixed regulator is
correctly wired up as the card power supply.

Fixes: ced8025b569e ("ARM: dts: armada388-helios4")
Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 arch/arm/boot/dts/marvell/armada-388-helios4.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/marvell/armada-388-helios4.dts b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
index 0b23d4da8276..092290da1f4a 100644
--- a/arch/arm/boot/dts/marvell/armada-388-helios4.dts
+++ b/arch/arm/boot/dts/marvell/armada-388-helios4.dts
@@ -304,7 +304,7 @@ mmc@d8000 {
 					     &helios_sdhci_cd_pins>;
 				pinctrl-names = "default";
 				status = "okay";
-				vmmc = <&reg_3p3v>;
+				vmmc-supply = <&reg_3p3v>;
 				wp-inverted;
 			};
 
-- 
2.55.0


