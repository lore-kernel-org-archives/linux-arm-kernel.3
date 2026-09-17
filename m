Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24234C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 20:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQei+xFrWR/8tHZU0Qo/Qb7KMibEAMjL/DUhroeeXK4=; b=BOSOKCTgClm07r6ZuEOKtcG+sN
	HIDW6Af17TyCfeNukMTCMzasPdwSWnSoUs7/7WJRYDLavg0bCbWJlLS1iuGaedKLXhs0OjqKsS7Rn
	ZSdEVA8E99k0P8ezBGutU7ba3ifV2+9uREnPAjc1UMmYXbj5qQMYDGmCRj5AY1NVAQrhmWBEB3caP
	q6P2zMAA6T0k5wYDHkhYGnD07N4jNxoDfjWz+wmHi82D5vOOnULEDd+qsBQx5uHTxZXO7/C50ba5O
	q7BFBHucwZMmLz6sSQUoYKku9HeYoZwmGJJw5Qy5ooc/fUU7pRb2WJ+UkL+5FU/0SkwyxqVgcSyJG
	TqgEKK3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7J2E-0000000CTui-3r6y;
	Thu, 17 Sep 2026 20:48:46 +0000
Received: from mail-pj2-x08.google.com ([2607:f8b0:4864:39::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7J2A-0000000CTpC-1mZb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 20:48:44 +0000
Received: by mail-pj2-x08.google.com with SMTP id 98e67ed59e1d1-398b9f722abso39754a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 13:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789678122; x=1790282922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rQei+xFrWR/8tHZU0Qo/Qb7KMibEAMjL/DUhroeeXK4=;
        b=Y15GQ6VzrD0ggjDrRPwiUzE0ctJhFohOVCaawQ3zJOpULxqQMIuP9Fizb1Gyia53BL
         0P6JY9myOFN3oE2RXpGjyuR1Ck3lx1MAELry28xoVPnwfSkZRouMuwq63nDtxddUJJO+
         MRZxFrrt06RJI3Sg86OKn6ijS3hjFrMBB53gVIZ5iN7SzRQtitgwuAzccKUZicz76oV9
         MjiBM0KZFn7n5llpQ/uIPi57gKaHEmcs5Pq/yTlHNuvACeot6GbbYAx3cOwZ+anTDrjN
         2eleoL5/G6jap+OrM8/U4mz2GPeL67tnH/1vfiTFOCeaQkJxMaV4LDyq0tJq+ti2jmcY
         1RjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789678122; x=1790282922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rQei+xFrWR/8tHZU0Qo/Qb7KMibEAMjL/DUhroeeXK4=;
        b=xisEudaEzLE09O/LdELb8ID34lO/MQirXo3Fmv09faxoiscD9CUu991/lEZxeIaRc8
         cxFGv23ENv4qKDh1wsDnb6gG7ldxme5E2C/N3Xwq2NtjnsoJjFGxEI91ECFdKAmtcYQH
         NRdYPgFyutMwrvMVdiMmXA4vDPP+8fJ7HIS2WiqFCOLu9mh6Mv/9fwobdQWLbh3ExuqQ
         eBYvoD2ho1wNehf6/pjq2RV5mKns4xVoIg3OpMuzcMh+HS56cw5HdM8Rh5xuwFqstZvQ
         rCBCfMD6Q0s8m4tl/91dR6wxQhXmt2Lw7T4rvD6jTMY88D1+tl6WCJOqEPps9UYdTyph
         CjQg==
X-Forwarded-Encrypted: i=1; AKwUvBwNf2wC76Uy90tax9KSahGY4gQYYvXd3Z/uZxMHNRpEzIloa0W4flK1y6owvGwuehQJm3TmlfjnDHpXD78HqtJo@lists.infradead.org
X-Gm-Message-State: AFuF++meat/1yFMK4fAlumybiP7+AV2f2qW+sI1zqarmckVI8zT/cCSY
	XlF2nbcoNv106siMY7U8MaFI/0J0XbsEvBU3gPs0Lbbb2Qpvd7yH5Jvl
X-Gm-Gg: AYBFou342A909zgo8IOb6GsZCkWKyFrWFNdKPwpCCP0xgml79rKUe7Ygwo2QlIhUknP
	CX3uZ8ci8EZf0staCVJB2pUC4P44Hg4w8b8Qdvs3CcxiG6ZLn/qXefMrXrr1syiHQvwo43UBsiV
	TQaoimGZ/3waa3vdZ4p/P64yzL0+tW1sG6P80QoBBlydVBUh/XdiXyR7Tiy4sUhVfhg4UxZEjhq
	Xum3m8FnWG+rz/mHMhAdiZW5OhDeLNRwlscBb+dx768EYlV196fRYdD+eI8XUI11TC+4x3iBjfv
	x0NPZ2Pcibsa3iWuUriuUVDXqV0SjfhFsgpC2dNOPIVjLQQ6VE5nknPsBOmG3w4ufSGI/111m6s
	jkATPul64KUOvMFanSF9kfPwQJm4PIF4O1t0zVIm0kQeueeOnXEeGCyeVYFvoGRjo/4NsoaqjM4
	okvzn8FGC3i6FDB3ZR0ji9Qyi4MOpIopX9CNMox5eev5OzUCSLtV4srE3RFMNeFePvnd2cRg==
X-Received: by 2002:a17:90b:1cc4:b0:39d:f351:8f0c with SMTP id 98e67ed59e1d1-39e54dcb193mr699171a91.13.1789678121557;
        Thu, 17 Sep 2026 13:48:41 -0700 (PDT)
Received: from server.lan ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e50a4bc22sm1232196a91.17.2026.09.17.13.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:48:40 -0700 (PDT)
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
Subject: [PATCH net-next v7 11/11] MAINTAINERS: add entry for Rockchip XPCS driver
Date: Fri, 18 Sep 2026 04:46:22 +0800
Message-ID: <20260917204624.2427486-12-coiaprant@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917204624.2427486-1-coiaprant@gmail.com>
References: <20260917204624.2427486-1-coiaprant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_134842_496282_BFDB9AE2 
X-CRM114-Status: GOOD (  10.87  )
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


