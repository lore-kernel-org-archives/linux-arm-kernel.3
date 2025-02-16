Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3C5C02198
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Feb 2025 09:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gdu9lz+AtsVFHN67DPZRHLVJE+dZDTAnLETWPEJx46U=; b=rsZvmOd7NxZLbWlSu1P8yA03Fj
	U7Sj1UcgnDPnAX3DsRbxMV0yGKLamYKEYLPK+5orLKYJj/ItsXnJdDWx1GN9g80dXZ3PTd2a83jmQ
	YKyEQLubY/XpNZRXa2g2hEgxprWsfrdpk5lZ3zKUKj2xA2nmVBAT+GVy5tUYiQF7xHut3WKRBDLy9
	2IYzyGFJtq1Ac8PMhWLiQMSSMKHDndmduP4sHxJp3EbFrNYTWTjnAgWuzkT++KBTOQ/bnquV38+zp
	rtXJJNqXYVN9FG/hkqRIy5SlXswdb1fbuHcSDZz09LDk7kqmcrE+YtqGS290S46aVT4IFNh/2vJKq
	TUSJXOqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjbOh-00000001bNg-2wXY;
	Sun, 16 Feb 2025 09:57:11 +0000
Received: from fout-b6-smtp.messagingengine.com ([202.12.124.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjaxo-00000001XZg-2phQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Feb 2025 09:29:25 +0000
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfout.stl.internal (Postfix) with ESMTP id 70E1A11400D3;
	Sun, 16 Feb 2025 04:29:23 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Sun, 16 Feb 2025 04:29:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=testtoast.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1739698163; x=
	1739784563; bh=Gdu9lz+AtsVFHN67DPZRHLVJE+dZDTAnLETWPEJx46U=; b=i
	bdSl4Ek+LkRmCpuTOfb1vix2HkizNQFoYponRmNdkhqLQ5WUcSAhrcUDD5L359ki
	Ee8oRCuql16qNf3j4Ff0J9ZLWiPNRua/MO7xgzz4w1WkiTxJwb+S8g3UAOZwVXVU
	25c8AYzzR1GpNPwgXHJz0a9Ocr8Um7x/XM17eDT2heuqsAA2l/Ouj+C5Cuxd+XQJ
	TNXaOAqcYbJV77ZKK2i0wrRZBPGpTd9dNmHGUAeQPSP9FzW5FTsLtEZ/7/Iz975n
	XmcSSl++fpr++QM0yCMi3RJFCjN7SkKwray2UzL81A5HWGMMLEzHQbaDpYcmwzvr
	hvdk1tmVHnPXwKJib4kMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1739698163; x=1739784563; bh=G
	du9lz+AtsVFHN67DPZRHLVJE+dZDTAnLETWPEJx46U=; b=OSLuwLvlpJl+8Q0f7
	Fofqup/1FdwoiWabTDjXSHdgyKwiwepPnD1zCAZ3UTyi/YErlbmMhHTLNbICwx4N
	Y0AIz+rUES9QgB7ngr/cIfEd3QXQxWyyDVOmBbPKKCGvSSon8LqaJsLS675gRmBc
	bo1vrFw/Lr+tVDW7/crgxn5mMmIEw3tBf+axyayyey7PvEZygGP+fjnrBcZB8Ec/
	qrjawyOh03N8o9M829J6NlqbCyQZ9+HxlSIYl8LTHS3uFWBZsQx6iVucIqMjintX
	DvGIpifgWWllxUyl+1nDDxQ5KxZ2fve3ky2E7fwFdlJQaAbyNYwn08nKkiBLVE/Y
	Cy+GQ==
X-ME-Sender: <xms:86-xZ96Rd7H1Kd_7eiI0kpmrKMb6uVRavBSbzPwA1LZ5Gp6Irkd_Ag>
    <xme:86-xZ66rlEG-04-ZxTmwSDoG5NB2V8jWqkWsaZJaEE1O9Ss7JKvC_e5WI65eQRWGo
    LcXvvJSQ93C8-mW6w>
X-ME-Received: <xmr:86-xZ0fFU54PrySe8-dNZPxbY3_7WNjufgiDm2QweVyLMa_jmPqwONmhuqHQJTcb-RqAxUjIGKeHZHczCJr0Pzl6byM9M0l5lh_wTnJ7FOd3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdehhedutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefthigrnhcuhggrlhhklhhinhcuoehrhigrnhesthgvshhtthhorghsth
    drtghomheqnecuggftrfgrthhtvghrnhepffehieffgedtgfffjeetveegfeekleeileek
    veeuteffteetudffveegieeiheetnecuvehluhhsthgvrhfuihiivgepfeenucfrrghrrg
    hmpehmrghilhhfrhhomheprhihrghnsehtvghsthhtohgrshhtrdgtohhmpdhnsggprhgt
    phhtthhopedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosghhsehkvg
    hrnhgvlhdrohhrghdprhgtphhtthhopehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfi
    gvnhhssegtshhivgdrohhrghdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtges
    ghhmrghilhdrtghomhdprhgtphhtthhopehsrghmuhgvlhesshhhohhllhgrnhgurdhorh
    hgpdhrtghpthhtoheprghnughrvgdrphhriiihfigrrhgrsegrrhhmrdgtohhmpdhrtghp
    thhtohepmhgrtghrohgrlhhphhgrkedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohepkh
    hikhhutghhrghnleeksehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:86-xZ2I1QGHNwdJn31pRmZjOMerMg98GNYPVvhY4YTITzMXze_inIQ>
    <xmx:86-xZxKL6IaiR04yttqvbtPL6SujpT9NKg2hnViPvmjI--UTlTaSfw>
    <xmx:86-xZ_z-c6-9rJ1HPibTJ7HR70DAJXaqNrenB34b4T_gd3Zs_TcUPA>
    <xmx:86-xZ9KKZ_Z_IkG55bPC8AwBafP48bcLsoJL1JjnKgc9Jw4D8i42jg>
    <xmx:86-xZzgnkSBvwd4qgEG_TjRDw05pPVBluLB07cAmkM38lh_mqFO6n998>
Feedback-ID: idc0145fc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Feb 2025 04:29:19 -0500 (EST)
From: Ryan Walklin <ryan@testtoast.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH 8/8] arm64: dts: allwinner: rg35xx: Add GPIO backlight control
Date: Sun, 16 Feb 2025 22:27:15 +1300
Message-ID: <20250216092827.15444-9-ryan@testtoast.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250216092827.15444-1-ryan@testtoast.com>
References: <20250216092827.15444-1-ryan@testtoast.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250216_012924_802872_F91E895E 
X-CRM114-Status: UNSURE (   8.91  )
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

The LCD backlight for this device can be exposed as a simple GPIO-
controlled device. It would be more accurately modelled using PWM to
enable brightness control, however the PWM driver design for the H616 is
not yet upstreamed.

Add a GPIO backlight node to the DTS.

Signed-off-by: Ryan Walklin <ryan@testtoast.com>
---
 .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
index 388487d4720e2..29d1144fc3987 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
@@ -21,6 +21,12 @@ aliases {
 		serial0 = &uart0;
 	};
 
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&pio 3 28 GPIO_ACTIVE_HIGH>; // PD28
+		default-on;
+	};
+	
 	battery: battery {
 		compatible = "simple-battery";
 		constant-charge-current-max-microamp = <1024000>;
-- 
2.48.1


