Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3D0C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=94AMSNZekvUuyuwr8Kuyjlw1VxKXNwksnk9YRfSczyU=; b=iSs46Lx50N9t5m
	OTG/nmH5H36bjSrFn0URoJhUbpPnUzZjKNcB2E0q70ulLj2VfvTknfW4b6Vcff6KAztKSKQ09qyGr
	7Uf8FvM4e4bRbTVBJrk+JF6NyPDsDmuQyUU+j+GV6boo0TZhdyMRdyLRsOr7zc0kwIebe8w0Eut2K
	Q6a4yl/GsOX9t9Kr+qLIsU7z5DTylKxvBOhT5W94/hf8+1XVKRpOZGxFNV9wabs9xwp+Y3djP7DgG
	geQcRMjLEiq6sEsFEK99P7qezhVXsyddDBSSIg4H+wHDxNawG4qALl6a0OC3Mwq8p7mKTd83XOKv0
	1PQHOR7RPcEGZ285kqOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lG-00000008EjJ-2lTy;
	Tue, 10 Jun 2025 22:48:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP2bW-00000007bKv-2z5C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 17:17:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E6C85629FA;
	Tue, 10 Jun 2025 17:17:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65E24C4AF0C;
	Tue, 10 Jun 2025 17:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749575861;
	bh=fPg8S/rzUTKuex98/cz90LlEdInNu16JQUmeSFP4WQQ=;
	h=From:Subject:Date:To:Cc:From;
	b=HF8VdgdsRREyh6x7u8wIIm9S4csdwObyTpVrnS4h31UNuK2xXExpUVGvr8hnI5cyZ
	 CFV9VdVLJXt3CtZyzRDx4t31uZuG5mJDIUWA2ligbablPoJOIHkNImi8Rc4zUXmP6t
	 5RQqUHer6RR2oAag9Dh0Y54h3zGmJ7MUquK2sGsbBt1KFmZCzLqPy51TOy8PgWX2aE
	 ClEQQQRe2+mtFguqRs80CLkEO6m1qXX7bzaI37p07TwVb14Lyu4Xpl01ckd/DI5hdN
	 rrfF73squxIC78JvbzYjx9GCbJcFsabOxjpkaUcL9jUbtloX4mAJJXi3/3wvTmP5CX
	 mmw7HSVOLZBwA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E3ACC5B552;
	Tue, 10 Jun 2025 17:17:40 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Subject: [PATCH 0/2] Extend nvmem patternProperties and then fix W=1
 warnings in Apple dts
Date: Tue, 10 Jun 2025 17:17:33 +0000
Message-Id: <20250610-nvmem-bit-pattern-v1-0-55ed5c1b369c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK1oSGgC/x3MTQqAIBBA4avErBtQ+6G6SrTInGoWWqhEIN49a
 fkt3ksQyDMFmKoEnh4OfLkCWVewnas7CNkUgxKqE51q0D2WLGqOeK8xkncojd6acae2HySU7va
 08/s/5yXnD5+geepjAAAA
X-Change-ID: 20250523-nvmem-bit-pattern-1dbc39fe4681
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1262; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=fPg8S/rzUTKuex98/cz90LlEdInNu16JQUmeSFP4WQQ=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4ZHxnqnyK9d9eznZB4WMUlWvjKfn3RvUdCspLZfzxXYO
 JKbHl7pKGVhEONgkBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAExEpoeR4UDJjhVa69UPLAk5
 cG3+3Sfacd89/6b+2FCf82FtJe8GRzVGhnmsV2o27b4eGjr/dsKeGo53czUe3Hrbs071pNNmC17
 9O+wA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

Hi,

This brief series fixes a W=1 warning recently introduced with the Apple
Silicon PMIC NVMEM nodes. We have cells that are the same bytes but a
different bit offset and these currently result in the same node name.
The legcy layout already allows to specify the bit offset in the name as
a suffix but this isn't possible in the new fixed-layout.
Thus first adjust the fixed-layout cell patternProperties to the same pattern
as the legacy one and then fix the node names in our device tree files.

Best,

Sven

Signed-off-by: Sven Peter <sven@kernel.org>
---
Sven Peter (2):
      dt-bindings: nvmem: fixed-layout: Allow optional bit positions
      arm64: dts: apple: Add bit offset to PMIC NVMEM node names

 Documentation/devicetree/bindings/nvmem/layouts/fixed-layout.yaml | 2 +-
 arch/arm64/boot/dts/apple/t600x-die0.dtsi                         | 6 +++---
 arch/arm64/boot/dts/apple/t8103.dtsi                              | 6 +++---
 arch/arm64/boot/dts/apple/t8112.dtsi                              | 6 +++---
 4 files changed, 10 insertions(+), 10 deletions(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250523-nvmem-bit-pattern-1dbc39fe4681

Best regards,
-- 
Sven Peter <sven@kernel.org>



