Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B806AC88E53
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 12:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQei+xFrWR/8tHZU0Qo/Qb7KMibEAMjL/DUhroeeXK4=; b=iXCO4XY7sYDTIa+DwP6KIFqSxW
	ebAdngJmuaechtgIOj2w+9bUysWydOH/ap/eM5yoygDM8ZfwNEgxzug+mQiLbtgyB3CH4UL95Ewya
	Yif3oQbieIVW7wQlKirmspg0BQ7xsctwGyfIR6j/86d531RlYp+Mi9SXiCqcPz5k6Zv4mkmG+igoF
	x1ecZIphnQbvnUKmG8b4YBRqD04TJm431fT5v/e+mTDPlbU3RHT11WmFQw8wY9lLSY7RViTB52Mws
	VMG0T0h0qmsYzbnk5hutvXPowBYusqZB+zh+8UkRf1erwxISNqJYJlk1VQiJWUAGyenQAuRuRt4RZ
	0CCh5HnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SSN-00000006ZJU-3L3P;
	Tue, 15 Sep 2026 12:40:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6SSG-00000006Z5Z-3K5y
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 12:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=rQei+xFrWR/8tHZU0Qo/Qb7KMibEAMjL/DUhroeeXK4=; b=SBkh/VQ6bod6bMGssgL/88K9nP
	lE19aSe0KB533GotMdKYFuercD1/dt1+GLhwx2TkVrL23AEx4Ev1vmZ+bbTrjtZ3YI+fst3vSnz8u
	2ZKy3ozVtjvKz4tUPL92rsuIO+L6S+ggWOJaEIKIa4WmJyeTVliUCz28vQImZyf4OQrvD+apzlD5W
	lCUDbLoYIEZlvNaka6AtC3KocBuGSUHKxWQGdkjFCUKHtVpNUmsqTLiXU+4Pbm6jOZEaB4zeyU5Qw
	rY54ghfXgvb69bU6SETeSKnw6nPHI3WXZomGmAbegwR9HCOE0e4FWVW60vqcCYxLpq0qUXam0IBex
	FcLBcK9A==;
Received: from mail-pj2-x03.google.com ([2607:f8b0:4864:39::3])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6SSA-00000006kbG-2GuK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 12:40:06 +0000
Received: by mail-pj2-x03.google.com with SMTP id 98e67ed59e1d1-3859292bb51so247747a91.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 05:40:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789476000; x=1790080800; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rQei+xFrWR/8tHZU0Qo/Qb7KMibEAMjL/DUhroeeXK4=;
        b=k7TTV+We8fMLNu+BfsZX6+rIVnPxSphz+Q4UfFfOWPsjdAgqTBqyMduIoIpRmeHtuA
         I1XJH22TdkSz8HkbqoXWlk8DCOBAiR1qRXX8YhV+AJYUrXKH18tWrpv3HMGBjM0c483M
         S82RrLQ3Bi9ebfVmRTMahyvHyDrvhYGcLXtpLU7JKyFpsu6Mvw2YosMBKdLhvhZALmjg
         Kjsiy2ewErpgbkH1JQ6hpwM9EoGahoBT35vnaZfcTPvXM63ZISPH+vpfvMxM11yL5Ynu
         6S/89pfqc/Kf8rYnA3O82Pzr03ldSkOgemCScsWSmbn52C/kjMBZoaXkdvBoRxw/WTEl
         qUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476000; x=1790080800;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rQei+xFrWR/8tHZU0Qo/Qb7KMibEAMjL/DUhroeeXK4=;
        b=oG2ILjw4USTF1HLJob4OnBkx39cJE0GEq7wG7wdHeM5k7GPEnyn1VrhZnNtygdhwuM
         aKnDevtv+b/9NcoKIm1gGdg1oqFz/T2cL9ER2tsgbSZCA48/z/rTA6PfHIMXKJyGM22J
         FYm64BPGWYRnE6FXq04pPAYgxrSebJWv4iFY1clfwBH4miVLvCV6ToQxBZOnPIAcIQ/W
         gjr4pI7nZ4NMbtd71YPmyqvLIOoqRXXfT0QZANc6obkFeARxzSeMTy8HR25Cvvto+zxG
         ClZk4x6aYOyxK+hw2fjDhj/U1PD7uZSvHWCWJEL7FZ2nwReksClzo+07WqyibPkkSzww
         VXkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzCFfXV4qRJqvZrxEQAuBjIPHg81Atr20x1i26hHNR6jctKQGpPNwO5zb1Jwgs+sgiN4IcIBe3coGvyqeUieOaP@lists.infradead.org
X-Gm-Message-State: AFuF++m6fwJ9Yx9MHFAM7i6y8Ceg2Kzbe5rc1ihf51cAQwgBsyn5t7Pk
	78FD0X486EEBQw8Wt+qnc1M6foPPFsa95JeSs/p363VfoRa3vagg8of0
X-Gm-Gg: AYBFou3m18xQMhURmdoMQP91CynaGNNGryW55VPXSepyHIuoAAWyoMW5c8JhlfDwrlU
	EBqdU59iEY1Qso7UoKoPymaxRZiulM0aI5YR7qY5rRjsIUrmlK2d8mSk5hj55yI2amgeZSFr+/H
	MChOPDrX56Egx+rD5ylOjdl8J+DIGijz5tHRi7H17cYNVSU3gKdNjzPrHpXsBOr3Vix57WHjxnP
	JELJL0fF+WoR43Mnvu+NDSFTkbZsiH85GQkMa4wId2VwcnWQJ3OQuFCk+rIDcah+TCgltOTYXNr
	VrLBUVGXllwP2AyXIR/z3XdzATRZH9v7wHe2NlnWmukIBy2uXUnlz7pcnkVU3RpmIbJjjl1owin
	cKmghBo6XVzE4i6I7fCor4XFj6HPbRLsOR4FCtbl9PUnpWlBDU6ay+mYNRRTSk+QwElJgyMqbbx
	iC8mdWViZgxEpdzfujqQx9BhF2AYeED8DP63f+AAfMNTKxSlliLEDOJN8+r0fHWDK9K07oF4c=
X-Received: by 2002:a17:90b:314c:b0:398:9bd3:d6d6 with SMTP id 98e67ed59e1d1-39dfe1901e4mr3823167a91.16.1789476000343;
        Tue, 15 Sep 2026 05:40:00 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdd28acbsm5307259a91.10.2026.09.15.05.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:39:58 -0700 (PDT)
From: Coia Prant <coiaprant@gmail.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Coia Prant <coiaprant@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	David Heidelberg <david@ixit.cz>,
	netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH net-next v6 11/11] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Tue, 15 Sep 2026 20:38:00 +0800
Message-ID: <20260915123802.1561724-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260915123802.1561724-1-coiaprant@gmail.com>
References: <20260915123802.1561724-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_134002_668590_18545DB3 
X-CRM114-Status: GOOD (  12.30  )
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

Add a MAINTAINERS entry for the Rockchip RK3568 XPCS platform driver
and its device tree binding.

Include the relevant mailing lists (netdev and linux-rockchip) so that
future patches are properly distributed.

Signed-off-by: Coia Prant <coiaprant@gmail.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3b2eb2a7a89a8..f53a519da6298 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23739,6 +23739,15 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/sound/rockchip,rk3576-sai.yaml
 F:	sound/soc/rockchip/rockchip_sai.*
 
+ROCKCHIP XPCS DRIVER
+M:	Coia Prant <coiaprant@gmail.com>
+L:	netdev@vger.kernel.org
+L:	linux-rockchip@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
+F:	drivers/net/pcs/pcs-xpcs-rk.c
+F:	include/linux/pcs/pcs-xpcs-rk.h
+
 ROCKER DRIVER
 M:	Jiri Pirko <jiri@resnulli.us>
 L:	netdev@vger.kernel.org
-- 
2.47.3


