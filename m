Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B43CCD195
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Oct 2025 13:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GQ0yHalzrBek2P6lSI1ROigxcsxBptLn83AyCQzMWkg=; b=oEk2Kc710Nos5+TDR1ydezKMqJ
	zHESHdz0wcp0ocOKVzJHsS3KbGmozHAsyO6yia7v48RjeBjsN/vcnOKlKDmH1mtgYio+xUyXLewQc
	5hy8CDfIhYBbXN1Z3olGSEcPbjbp2rDpPuuIjjpxVPhxtmKApZE5ASGxr2oCvHGla1aQDIVRYdjvb
	OVjN8CO7AtShby+AnDnTtef1cPRQ1ERG18DZCoqBm/L43xziTd/LMVyWKr/YcXhrOl/IF1eqXMnbb
	Py8G7HQ58qcLBJ/dNKQmLYfuP7wWSNCjt7tZ7Lf75GsdZPO8osecfmiUHcxzSvIvHamiE6KCZbEvh
	/tijoIoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA6Zi-00000009wEx-0kjg;
	Sat, 18 Oct 2025 13:02:22 +0000
Received: from mout-p-202.mailbox.org ([80.241.56.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA6Zf-00000009wDK-3For
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Oct 2025 13:02:21 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cphfp5wVgz9tBD;
	Sat, 18 Oct 2025 15:02:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760792530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GQ0yHalzrBek2P6lSI1ROigxcsxBptLn83AyCQzMWkg=;
	b=lZgOdq7qBFl79GAupPAzeVF0yIAF9m0LE4eQ18dGnZRAqJEfOE/7/DVeyXxOCMMqXw+lEn
	88HTHkcqTxXMBQCCw0aylcL8PprCMn85RnGSI7QVIGMR18Oo9KezQIMz+Vh3fXbnmwClvQ
	ljpRVdLjHCeToZ8qrsdOy6wprbJRJENMZsXLb/P7KLE8Z88ToH0l2JWAqiz3mu8T/k7Dqi
	atcefTH3QBSym7h98I3P0VXyvPtt2ZFemOMpdoDGuPUnzu2Y+AcV6l1G7Pc/BEsoplmzqb
	D26D87JuHPM9NorOY0z+MG8jqTaoO+4hGsTsCRojGcrmcMwD7UPVXOWk2m+7WQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=EsOBp9hT;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760792528;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GQ0yHalzrBek2P6lSI1ROigxcsxBptLn83AyCQzMWkg=;
	b=EsOBp9hTgy8bP848oTczxHUj64D47YypanF/t/DQJE1O7jqUv8ktAZa+34PRAw8u/rSGlX
	LegfVw8qHrlppeLZ6DMqjKwTlVdwCvGvcdTBGFsdquySTUqS+thoYkEqYvhaFWCerWg593
	lBIlh0PiyVYaHEwvb+Z9l+xgTF3BoOrsVsiSdEoLxao3sjSJYNkIpCjpLLHE6kGiFnpI+u
	fCEHM+dPQjPQA6AgoPQJlpsO/maPwVcNEjkHqW/Tlfolx/8Ol3s3fkbeAvxgSdg1CQtqP7
	ZwxbH3c2Pwq70jrHNftSmklWM8/a5gjhmW3eikanLVEdI4svYyrV0ire/b4Gxw==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Adam Ford <aford173@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Frank Binns <frank.binns@imgtec.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matt Coster <matt.coster@imgtec.com>,
	Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Drop useless power domains items
Date: Sat, 18 Oct 2025 15:00:58 +0200
Message-ID: <20251018130147.12831-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: f3442694eee9bbceb66
X-MBO-RS-META: 6p44y3cu71pc5fzdrqigyaacqqrgqqoc
X-Rspamd-Queue-Id: 4cphfp5wVgz9tBD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_060219_951335_6D742C56 
X-CRM114-Status: UNSURE (   8.14  )
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

The power-domains items: list is not very informative, replace it
with plain minItems/maxItems instead.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Magnus Damm <magnus.damm@gmail.com>
Cc: Matt Coster <matt.coster@imgtec.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../devicetree/bindings/gpu/img,powervr-rogue.yaml         | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
index c87d7bece0ecd..bee4ab1a1f805 100644
--- a/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
+++ b/Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml
@@ -90,8 +90,7 @@ allOf:
     then:
       properties:
         power-domains:
-          items:
-            - description: Power domain A
+          maxItems: 1
         power-domain-names:
           maxItems: 1
       required:
@@ -125,9 +124,7 @@ allOf:
     then:
       properties:
         power-domains:
-          items:
-            - description: Power domain A
-            - description: Power domain B
+          minItems: 2
         power-domain-names:
           minItems: 2
       required:
-- 
2.51.0


