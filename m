Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAD8CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 16:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhfgeWKTTFehUL5ME9QvRLQsevmzrNA8iD7btwmAz3g=; b=NWQ2RxN2v41ReDcJZk4hjm7iMs
	LhLASGAdKh88tj6GyjOvcMKmWPRrODeId+uvLMhyjflheNesw89fJ5ECNQcN3MAnKnWIIyGse50I+
	3Lal0Mpu4rNoMyOkP7KpAcEsgoQ4hsh3Vc81Pm1Ktov21N8eP1ZUdwV2F4hFuuxsEREoln6ZQTmFN
	x+qLBD3YOfxrsu+gv7N2BzYLTH7oF6wAIFoH+PCDXUFFc9UdO7RUKUcB841nD7hm3GwLJr/A53tjw
	bvzG4NQ+5C5/HIlx6FsRUDGzU5FXOMytyg07nPVlQwA6XIlOkEHnl7lpDOYYgopBbq+naGrJkpJZh
	6AmmoM4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1olB-0000000B52h-0yAA;
	Thu, 25 Sep 2025 16:23:57 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ol2-0000000B4sB-2ySn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 16:23:50 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-46e34052bb7so9736855e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 09:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758817427; x=1759422227; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bhfgeWKTTFehUL5ME9QvRLQsevmzrNA8iD7btwmAz3g=;
        b=GfJJV4AM9i15EMus4foLVJT9wYxvdiXwtJNE2AgEgnxnujb3HaXlFBaTqAdQzSVGof
         BigzZXG1VXQJ1qHreOXtc1Lj7Omjo7NJ3+tmXOy7j46mgwaydnd2+8hb8Ej5qwZAAO5n
         V2+lAfGChVlHHcri2wnzl2UkemrIrmucx2fCzCdTuPQVEbmOe4IT3VDwEtLGP3yZ+PaZ
         jZM9VZOTEnAYvC8iPLpZvHzQWPSB18gXFUbDwERWo5B5A+54C+ciL19SI5xpnVbog81D
         7lVrar/+B5K7PHySvpENF5gv44PRFTrk0FOQjqjd5M7GPZpKZdoRhUHgf3ZlAGeQ1+TC
         hw/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758817427; x=1759422227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhfgeWKTTFehUL5ME9QvRLQsevmzrNA8iD7btwmAz3g=;
        b=qedNUbdiwYZlqIwcX9QSPlT4lc0MzsCvY3sgLB6Ok25ZgiktK6LW/xtV/JdGQfXAfr
         hK7UnORROYHKxpRlYSjNVRFAtMe1UmUXTVDR1jmF2hjkFLK/AniquFbu7am2OAAvbupK
         Y6HFKHidLoTo815EWj5tcVSJzupLjZWKl0mxLOx3SDBDMOME22JiHz9Keoi7kEd6CazT
         m48sbNRpQN6f6jqU1NU4NzwB40NoX+58d6c4qH7iVy/fU5G51y3HIwqpf5dkbsSWP/PS
         9LhnET3Q2y7kVggIyUUDfFcVrMasMu01y/CF5LwX/NhjVwBGCtm/f6jqyof+06A9afwW
         7yiA==
X-Forwarded-Encrypted: i=1; AJvYcCWYKuWDqUIquO6xpIHnA7DY6kw9Ex8HlBtLioMlWB6mXQJbgICyjBx7gMpEMqbgkS3pdJ8Ui/9gEkISNr2Zm0WM@lists.infradead.org
X-Gm-Message-State: AOJu0Yya8Wyyu2F8DUoMbYcjIU8GzARSuqbMzh9Qe7ayXm0huZyZ+eQ3
	KAGVctApCmUC0ckG5k5WHJXmYJpyqtYQZ2qkiCWXHdhDB7iWiYTi01Mi
X-Gm-Gg: ASbGnct8Hj3WxI8uv7XsrgNmSbFaygKvHfGyPRyfyvVtDG+BoxbICVJPkk/gcSEVNC0
	Ykh2H8EUVLbFOgp8yQjTAI6pkDDHCrRORf7R5s7sQCM40WzS+ezm+e88/BL/xdkM8oK9cPp6ptR
	46V/I3l9kZ6W/S8IItsU82q4v1Pvew1Ykip/+LG0Jp/KnUFAVNa1w12B+Yebkz3x7oqz7YRzP9J
	+RALisiTCW6mzHP8j94GkdaFBZhuFavZcNO6MWvyebcMnpEA6vUgb7TGaURfam9QKnO/Gkth8Am
	50W0RS3HwHiITw7iYjI/CpYaPRbz54lzJQJFwaZUY/givITVBht48jEftfYbhm7hXj9T5G3AlDx
	SQbOriuDfBtWme/hLT+HKxfskGuC9HTQdpUUPcDwKgxB3CJrKfcVedi26vFjtENzDqzMqrFw=
X-Google-Smtp-Source: AGHT+IE30qlsw+LGQbGsOMA9cwguph9rKHkg04I434dGAXsnLJ3Ub8ZjYMz0XZC+8/ecQZtZP2gmGQ==
X-Received: by 2002:adf:f10e:0:b0:413:46a6:6a51 with SMTP id ffacd0b85a97d-41346a66a66mr555231f8f.38.1758817426788;
        Thu, 25 Sep 2025 09:23:46 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fb985e080sm3534819f8f.24.2025.09.25.09.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:23:46 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Subject: [PATCH v3 1/4] ARM: dts: mediatek: drop wrong syscon hifsys compatible for MT2701/7623
Date: Thu, 25 Sep 2025 18:23:15 +0200
Message-ID: <20250925162332.9794-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250925162332.9794-1-ansuelsmth@gmail.com>
References: <20250925162332.9794-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_092348_760334_9D6D0AB7 
X-CRM114-Status: GOOD (  15.72  )
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

The syscon compatible for the hifsys node for Mediatek MT2701/MT7623 SoC
was wrongly added following the pattern of other clock node but it's
actually not needed as the register are not used by other device on the
SoC.

On top of this it does against the schema for hifsys amnd cause
dtbs_check warning.

Drop the "syscon" compatible to mute the warning and reflect the
compatible property described in the mediatek,mt2701-hifsys.yaml schema.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt2701.dtsi | 2 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt2701.dtsi b/arch/arm/boot/dts/mediatek/mt2701.dtsi
index ce6a4015fed5..128b87229f3d 100644
--- a/arch/arm/boot/dts/mediatek/mt2701.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt2701.dtsi
@@ -597,7 +597,7 @@ larb1: larb@16010000 {
 	};
 
 	hifsys: syscon@1a000000 {
-		compatible = "mediatek,mt2701-hifsys", "syscon";
+		compatible = "mediatek,mt2701-hifsys";
 		reg = <0 0x1a000000 0 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index fd7a89cc337d..4b1685b93989 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -744,8 +744,7 @@ vdecsys: syscon@16000000 {
 
 	hifsys: syscon@1a000000 {
 		compatible = "mediatek,mt7623-hifsys",
-			     "mediatek,mt2701-hifsys",
-			     "syscon";
+			     "mediatek,mt2701-hifsys";
 		reg = <0 0x1a000000 0 0x1000>;
 		#clock-cells = <1>;
 		#reset-cells = <1>;
-- 
2.51.0


