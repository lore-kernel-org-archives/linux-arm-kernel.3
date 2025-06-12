Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55396C7114A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 19:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KUIfLwvoP44U5nDfSmqojpW++w9cxu2WaXPKkzeIK40=; b=LqG2dnfv7MQYHL6pbBgNa+nu+B
	SRPxXoqM9GZZPWhNIaqDqFeH/3Xtd1DIOSeTJHNQfBKRkPpPN8XwP0pCzVUn9FGyudHDfZ57N/j0+
	HO0X1bCLyVHLjQbBpfOSDnWh3sNJcCepVoI7rJpxiJXAXZqZYtXjNK9ZflLvYIRcF996ZCsRIAmkO
	zul6HZxuPLbAAUY9s5/0vEd5jSkugUpxK3pAB1Mn5OgaRrDFMeRw5zvML7zw+iaA1WWAQOPMW2Ldf
	ifcM4R9W5yZOxg5Gl5sslsmRFNkhXTS9mziRs8MvvC+Za13QC2z3xLhkiUXLbLeZ2AD8N0JQEsi7M
	ItwiLhdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPnp8-0000000EGsw-11G9;
	Thu, 12 Jun 2025 19:42:54 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPiPw-0000000DXbj-2aOv;
	Thu, 12 Jun 2025 13:56:33 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749736578; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Z9Q6LpwOskFzXu7qFIqDahCinDV85umIMp0V5V90dF7bGYa5NYV89EM6WS0OwHQqd4/Uv2GrLuC17jCqKWGsiS3DgT6YHgWlkx0nVLYDPAGFWkjHJgF1egrIEVsnPr+yAxCQm6AkbkBgWNKa4ARXHPstwsiFDVRpeo62daoIcjA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749736578; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KUIfLwvoP44U5nDfSmqojpW++w9cxu2WaXPKkzeIK40=; 
	b=i68huo5HXEszm0XtLDeI3hap5XBQ0TEjonhcTuFAHwLyctmv+zfAdxJP4AYyOPd8EytdSiiU+3o/mbGHoDKTg5IKe0tEmkpcVlco54i1d6deoZqw1NQjgQnM6VIICB5TrmIq5V89n7yuMrsDQX3jW3TUWT/GhE2Med+bYTb+2/w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749736578;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=KUIfLwvoP44U5nDfSmqojpW++w9cxu2WaXPKkzeIK40=;
	b=cB79ZboY1lFL9af6mnwgT0N6Y0FcjVW7L4hsO0ita2ELplHFr9csDJsspMYpZ+wM
	iXN1J/COAX88HG2r91O8+liDKQ6izRy+6ZX5HT6MKqoixIRZP/0CbfNrk5lnI7DeQbd
	TBdTShZFNU85CZzECc15JWt2HEJ50Peaeil1iaVjkeBp1k8SD5taNTsYM0mU8Wz0QF+
	7hzKXd4o8bVxpr13ffHrBOSFy6Jw4cREKjzEXFUfwM5e9h8BwKqt6gUhnuKsPW1XfbR
	b0bg3k2M5B1ZX0UVvHPM698VsCqcF5tzp4MCl/VVL5Z+bAJsfgNJZ0UHYrKPqwM39nb
	VWTuVDzl5A==
Received: by mx.zohomail.com with SMTPS id 174973657610749.98040995348208;
	Thu, 12 Jun 2025 06:56:16 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 1/2] dt-bindings: arm: mediatek: add mt8173-hana rev2
Date: Thu, 12 Jun 2025 21:55:58 +0800
Message-ID: <20250612135559.2601139-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-ZohoMail-Owner: <20250612135559.2601139-1-uwu@icenowy.me>+zmo_0_
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_065632_693421_7D91A308 
X-CRM114-Status: UNSURE (   9.04  )
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

My Lenovo Flex 11 Chromebook contains a board with revision ID 2.

Add rev2 to the compatible list of base hana DTB to allow depthcharge to
match the DTB.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 108ae5e0185d9..7d13547ff57ba 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -132,6 +132,7 @@ properties:
           - const: google,hana-rev5
           - const: google,hana-rev4
           - const: google,hana-rev3
+          - const: google,hana-rev2
           - const: google,hana
           - const: mediatek,mt8173
       - description: Google Hana rev7 (Poin2 Chromebook 11C)
-- 
2.49.0


