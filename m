Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C5EDC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=UiZDU+zwqlhCb8NClI+UcJBF+04owitay8cguXiw8Ww=; b=HfRpzTdVrX+RKer95ZQ4t99B8E
	0ROLa6755aIvtAr40w31/z8oSeSRp4LasW/dwBDn7HbwFifDBweyHvuo2jDVqNHjgdcZsfSXbaIu4
	EZeqZ/eBfgkSvx8+aQnaWCLmZEs/bkzzWIE4OcUbKiKSL2yKurm9NTYYx8X4TaMEzuAc92LxPK/hn
	zk6n9Mecn4qDjcMyEvRi98p1blEuKgEzZxwvsqI+1r/WlCJjM4DgthM/SNVKF1VgLP775FWFrVZnf
	iKcF2CtqktkIJcC5kVROWFDZJ4+NzqwmQnSjPmtRLMnayLBYnVBnSdqHBAwMB9g+XUo1sDV+zOs2G
	8G3i7Kpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wls1r-00000007ZRQ-2u70;
	Mon, 20 Jul 2026 17:43:47 +0000
Received: from m101-out-mua-6.websupport.se ([109.235.175.106])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wls1o-00000007ZQl-2hX6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=palvencia.se;
	s=mail; t=1784569422;
	bh=UiZDU+zwqlhCb8NClI+UcJBF+04owitay8cguXiw8Ww=;
	h=From:To:Cc:Subject:Date:From;
	b=Fx7y2FWXp9wedQG4Uc+Xp2zzHVj26clK2A+1nFgTlvacoscXIAAYiyHkSB00ofO71
	 4DxVq2gpAR9/G25wasUWTp1iDSufTZ2FFJLA5dTNEt12aEEVtUWdTNYRCKRo9y7kjM
	 z6buMjLsRYRqKqg9hzVs0h91bR9LVqjO+fRbjOn1+fdGBz0rc2hynLsy0VZDeGslC3
	 IOiMsr91ClFBdED0HlDp1FPNGQY03AeH3Yn+HuR2PIrNtt47YwctclKXNHZHrgq6Ft
	 c7QtnDr6oFT49IJzvtrZhdo6zIv8V366Y09KpjX6HYJEh9P3IzX74WztkbsDAnwmwp
	 eJGngRYH8vKmw==
Received: from m101-u5-ing.websupport.se (unknown [10.30.5.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by m101-out-mua-6.websupport.se (Postfix) with ESMTPS id 4h3ntj6hkszSqf;
	Mon, 20 Jul 2026 19:43:41 +0200 (CEST)
X-Authenticated-Sender: per@palvencia.se
Authentication-Results: m101-u5-ing.websupport.se;
	auth=pass smtp.auth=per@palvencia.se smtp.mailfrom=per@palvencia.se
Received: from palvencia.se (unknown [193.180.91.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: per@palvencia.se)
	by m101-u5-ing.websupport.se (Postfix) with ESMTPSA id 4h3nth2pbwz2wjk;
	Mon, 20 Jul 2026 19:43:40 +0200 (CEST)
From: Per Larsson <per@palvencia.se>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC support),
	linux-sunxi@lists.linux.dev (open list:ARM/Allwinner sunXi SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Per Larsson <per@palvencia.se>
Subject: [PATCH 1/2] arm64: dts: allwinner: a523: Add missing SPDIF pin
Date: Mon, 20 Jul 2026 19:42:42 +0200
Message-ID: <20260720174253.7686-1-per@palvencia.se>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Out-Spamd-Result: default: False [2.90 / 1000.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:35790, ipnet:193.180.91.0/24, country:SE];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_X_AS(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	LOCAL_OUTBOUND(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Out-Rspamd-Queue-Id: 4h3nth2pbwz2wjk
X-Out-Rspamd-Server: m101-rspamd-out-4
X-purgate-type: clean
X-purgate-Ad: Categorized by eleven eXpurgate (R) https://www.eleven.de
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-purgate-size: 1154
X-purgate-ID: 155908::1784569421-3D7071C6-B1A24F28/0/0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_104344_997650_62625B55 
X-CRM114-Status: UNSURE (   9.64  )
X-CRM114-Notice: Please train this message.
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

When spdif support was added for the Allwinner A523 family of SoCs, only
two of the three possible pins were added to the dtsi, since the third
would clash with the first ethernet port (emac0)
However, some devices don't use emac0 and instead use emac1 for the only
available ethernet port, leaving the pin free to use for spdif.

Add the missing pin to the dtsi so such devices can (later) use it

Signed-off-by: Per Larsson <per@palvencia.se>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index ca6a16807049..7370e8ed24ec 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -216,6 +216,13 @@ spdif_out_pb_pin: spdif-pb-pin {
 				allwinner,pinmux = <2>;
 			};
 
+			/omit-if-no-ref/
+			spdif_out_ph_pin: spdif-ph-pin {
+				pins = "PH7";
+				function = "spdif";
+				allwinner,pinmux = <4>;
+			};
+
 			/omit-if-no-ref/
 			spdif_out_pi_pin: spdif-pi-pin {
 				pins = "PI10";
-- 
2.48.1


