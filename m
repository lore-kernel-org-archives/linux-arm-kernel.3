Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B58EE67A8D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 07:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SPEh3zztA7YgJb9ba/eJtCr9uFxiaZIfC4av1XaSlvI=; b=Qi6PAeMA3P5752u54WrKZ/6Q8T
	Jv2Ckh1qrBI7ZT/Kszds+AZGpwM0phuNxZ+8u3ohvdUHPj+OdqvLZgs0ORYicd30iUlhAbysYWNB/
	iq915AqgN3xOpSiq3r4qbWev/lnGoikp+SytgHUuL6lx/rtGJ0ZSzVTHz3RY/mLuI9Q1SsfPyrMup
	NBRh3jJ1+sIc3loTlC1/tVIQtIKTa7WlU7W1FzZzdX3P69a/e8Dd3/mgaXc5xXZZoWY8GNd61IJcy
	aQ9iyi0KiZ/PsF8XcJB1f7BwH8r0sYubztQBOmPkcExqOtq15BlIQK5IBXHmuyJoPmc2Uql0V+I7K
	u+H8HJ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKCQ-0000000EfqH-12fX;
	Tue, 03 Mar 2026 07:29:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxKCO-0000000EfpO-0pQ7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 07:29:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7D13044402;
	Tue,  3 Mar 2026 07:29:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EF7EC116C6;
	Tue,  3 Mar 2026 07:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772522983;
	bh=QQUUYYwURbACdUIdjrLHGvnuoEjtWjpzzgCNWpWSbAM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nWAK+a0QSTnekz8cnZL6Vr4QW3lSRxDv/ahB9SSHoveKS5atT2Y2bxISEYHT6slz5
	 7JK64f6tUItpUGrnj+NVGQzyhARLGQTr6XfyjLbM9k1OejZx83YbLKQjnnL2KbiHQp
	 1yhDDPmximlJh/u0X2kaW05uTalzG/8dEOOCI1M5oAp2s4fXQLSZ3LlQcUmZXS+TJm
	 WrWyygsBiD/9TS+6tq+h91BYjNOvkTkDXre7TjWBZCVc+bAJMQ4cYiDUpOdjnZCKpR
	 3qJuBuu9YoQFbdfDkbnr9biS4DFdonne5Hc06jfWPLrgO4i6nGt2t+RM/dxSjp9xVK
	 heK0drwm3saNQ==
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 03 Mar 2026 08:29:33 +0100
Subject: [PATCH v2 1/8] ARM: dts: gemini: iTian SQ201 need to boot from
 mtdblock3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260303-gemini-dts-fixes-v2-1-5b92ced841ce@kernel.org>
References: <20260303-gemini-dts-fixes-v2-0-5b92ced841ce@kernel.org>
In-Reply-To: <20260303-gemini-dts-fixes-v2-0-5b92ced841ce@kernel.org>
To: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_232944_289713_AC786047 
X-CRM114-Status: GOOD (  12.09  )
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

Alter the rootfs partition to the one actually used for the
rootfs.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/gemini/gemini-sq201.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/gemini/gemini-sq201.dts b/arch/arm/boot/dts/gemini/gemini-sq201.dts
index f8c6f6e5cdea..fb6959324658 100644
--- a/arch/arm/boot/dts/gemini/gemini-sq201.dts
+++ b/arch/arm/boot/dts/gemini/gemini-sq201.dts
@@ -20,7 +20,7 @@ memory@0 { /* 128 MB */
 	};
 
 	chosen {
-		bootargs = "console=ttyS0,115200n8 root=/dev/mtdblock2 rw rootfstype=squashfs,jffs2 rootwait";
+		bootargs = "console=ttyS0,115200n8 root=/dev/mtdblock3 rw rootfstype=squashfs,jffs2 rootwait";
 		stdout-path = &uart0;
 	};
 

-- 
2.53.0


