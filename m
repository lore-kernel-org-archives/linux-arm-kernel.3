Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEB8C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 19:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nSm85WrOXXd0xYU8c9OOo0pnjRflgeYS11s36aD5s1U=; b=z+Q7BxpjiyzNAxvtn8kHCqQg5s
	j5tCo2QC+gDPSFO97IktWvPURhTq7l3yNOtrV5++iUs6I6CYSzJdcUq3VjwRk3RN7WIOS3Bo+98gs
	czSoqFxe7eXy60oIO9b74A7/syG7gYBG6+7JvCs2rGSdrr8rmGuHBM6WGN999xZ1+6+pVkINgLrdc
	5lyjt6DZwfwGaVLwf4M18P9Lo/aieJU39dwHCtyF/GiosNl+HQOOOs/es88VSrbvvb4TZmrLtOzjI
	WNfm15C9Om030JDNcRvVL827O3Sw/eBLTW48kvuG0RWyYNQp2T9BiMfRoL953oxPWWApKVtP5UiVy
	i65GSUqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81zj-0000000F8Pz-2oiD;
	Thu, 24 Apr 2025 19:12:23 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u81gm-0000000F5GB-0lHR;
	Thu, 24 Apr 2025 18:52:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745520755; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=NCamvSjAd1TPlup5KpNJxV8L6yt2XPpYm5bOijTs3biV1cZ5KQ5X8gKkBZkEZmiT7Mzbvp3Kx99eawUPTeSH7ySrWkULwNtcTVPlA6ZLibQ4/xFF+oPtL13/l4mvB5fUNO21+1IFYHlKb+OtfMVDN05CUCX61MKVpXkqBP5SIAI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745520755; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=nSm85WrOXXd0xYU8c9OOo0pnjRflgeYS11s36aD5s1U=; 
	b=SP6u549Lk0DjrwCyDxdRdS9/fq3dcb2jM53xq5Ww0HB0ACnjwJwG5X/frK8EkoRUTbSY1K9MdrwHTntLPh6sJtrzb0kVFb4biT66vkg01ozAEGOgq+kkKNjVaEe+etb9oftG202XdsbJ07l7bIdTXElzmbPqUxEJkMKgGrDT2IE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745520755;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=nSm85WrOXXd0xYU8c9OOo0pnjRflgeYS11s36aD5s1U=;
	b=PrHLdNKRkF34UzA3HCrdw+tWQGyujwnbX2l+zKOurm+FTHamBoK7V/xKh95oUDwq
	PWCqW++EPaXaSFsDhGoibTNJmezCPWlF9wfyVElc3U+o5PdPBUSlXiQe4iDLNrUUDSj
	3aFmKHDoTBMxtteG1sCw2E1KczTDxEU42V8N7DZY=
Received: by mx.zohomail.com with SMTPS id 1745520753589285.7033388625773;
	Thu, 24 Apr 2025 11:52:33 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 24 Apr 2025 20:52:22 +0200
Subject: [PATCH 1/2] dt-bindings: ata: rockchip-dwc-ahci: add RK3576
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-rk3576-sata-v1-1-23ee89c939fe@collabora.com>
References: <20250424-rk3576-sata-v1-0-23ee89c939fe@collabora.com>
In-Reply-To: <20250424-rk3576-sata-v1-0-23ee89c939fe@collabora.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Serge Semin <fancer.lancer@gmail.com>
Cc: kernel@collabora.com, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-ide@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_115248_285005_87BC7E57 
X-CRM114-Status: UNSURE (   7.91  )
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

The Rockchip RK3576 has two SATA controllers. They work the same as the
RK3568 SATA controllers, having the same number of clocks and ports.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml b/Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml
index 13eaa8d9a16e5a4bd43b3e184f9277494acf27a1..b5ecaabfe2e2537afe6093558fb0ab975dcf6058 100644
--- a/Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml
+++ b/Documentation/devicetree/bindings/ata/rockchip,dwc-ahci.yaml
@@ -20,6 +20,7 @@ select:
       contains:
         enum:
           - rockchip,rk3568-dwc-ahci
+          - rockchip,rk3576-dwc-ahci
           - rockchip,rk3588-dwc-ahci
   required:
     - compatible
@@ -29,6 +30,7 @@ properties:
     items:
       - enum:
           - rockchip,rk3568-dwc-ahci
+          - rockchip,rk3576-dwc-ahci
           - rockchip,rk3588-dwc-ahci
       - const: snps,dwc-ahci
 
@@ -83,6 +85,7 @@ allOf:
           contains:
             enum:
               - rockchip,rk3568-dwc-ahci
+              - rockchip,rk3576-dwc-ahci
     then:
       properties:
         clocks:

-- 
2.49.0


