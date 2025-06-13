Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940C3C71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 13:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hKgIl3vgVIuGNgvQ6bS/U8xNbS7f3z+TnxopluGWSlo=; b=pa9x/WsEAGPQORscarqsaCBViR
	iYNlL9XwEKY7jSEiH4Uau3lurs+AIBUVce7SmdZuMLLO+7PcC4QejwrsgY1ZPji3MFLF0KN8YlpWz
	uMHUo0bEcDOxksqi3ScBeNUArPo89bw9fXVJwfCVnKnbCkXlSOKfFBUDux5MT40PcFPFg7q/uGDDt
	Lj5UpeTPEn8AT7qGBUh0aT3awQQ8thz2UOCnIe0NTQdD8gyvss0cxwTnKLJtAY4DQNEBZBZTQAL8o
	PTogG1G9xnRAaqAF0AdAFj7++FnJ93WZkmJgp6amPFFii5XnTm+KTT8eOXJaCFBCootGS+xjJyaNv
	G7sCiyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4l4-0000000GYYN-2C88;
	Fri, 13 Jun 2025 13:47:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4cu-0000000GVV4-2AHk;
	Fri, 13 Jun 2025 13:39:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Sender:Content-ID:Content-Description:In-Reply-To:References;
	bh=hKgIl3vgVIuGNgvQ6bS/U8xNbS7f3z+TnxopluGWSlo=; b=Ye6ofSHnM/GAGoyBb8x2F5+Z+j
	0dLNiDtrNrN72vYp32ATXoF2PEV5713/lpIDQPcDDgSbB474AdgOMZBJ8xdfMZZws0+HfvTyL97Mo
	0/v+uFnXykj10UvpvQpj+E65P/pWr/GgMJFKlywuaAGGSt8Cv5/vYAbhOxfeieJZHArb4z+oos7hR
	fmx3r8O2g3zw7YpnhyTcSRHCcKl9U7JlJ8R6PjffqTsSAOpM/qIvNQqHhURCmit76J6IwQ31ypQhp
	vqmQOC4bBjjXinKXm+TJuEWht/VxAkEEtETPq2PxCMUiTa8blRAo0RB7hQt43cIxVGD6gUx5hpN9q
	s0A1oF6g==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ4cs-000000030ha-0dvj;
	Fri, 13 Jun 2025 13:39:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A013F49C0F;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 75DD5C4CEE3;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749821957;
	bh=1u10lZ+utTwxzfHAXk4guA8HgqMHAOiC6CKTXRm79YQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=TUGVwajnOOjiDLmdqEmnaNAwAvTZ9sFNr4jWG+i+AQV12yr9SCPBDFOze2o9jJAVT
	 X9gCO/KvfcAuslpctCMpcVp7W+/5PUxGEB8/VlvLLmNMOCbZBNyRaJcQOPjzqm7F99
	 1cPee0ziLQzPgTImlv94CGzf2EPtEMNWMAnsIHrSA9hzDDUiLb+xresJmPdVLaM8gM
	 KAzJc6sxKDJ+vP1pBS0kLaTyiCI6a6U5vtkI5YV9vUuPx0c6QNcB7gAVbVGOkau+o4
	 UfZi3f6k0+9FMNUSgEQxV0UW2NYU7TsYiXpvzd1NISx9Wzb0mMqfViQHJTmFMOjeYj
	 rkX2MZ2wFwAFw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 634D2C71148;
	Fri, 13 Jun 2025 13:39:17 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Subject: [PATCH v3 0/2] arm64: Device Tree for Ugoos AM3 board
Date: Fri, 13 Jun 2025 15:39:12 +0200
Message-Id: <20250613-ugoos-am3-v3-0-f8a43e6bbfdb@posteo.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAqTGgC/1WMwQ6CMBAFf4X0bM122wJy8j+Mh1IX6EFKWmw0h
 H+34AWP8/JmFhYpOIqsKRYWKLno/JhBngpmBzP2xN0jM0NADYjIX733kZun5F1ZKSHrEpRULP+
 nQJ17763bPfPg4uzDZ08nsa2/ioTLoZIEBy5ra1ptVIW6vU4+zuTPI81syyQ8qEIdVcyqQhSgW
 rBk9Z+6rusXqA2RL94AAAA=
X-Change-ID: 20250222-ugoos-am3-f67413860434
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749821956; l=1175;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=1u10lZ+utTwxzfHAXk4guA8HgqMHAOiC6CKTXRm79YQ=;
 b=SxYO8wSB80jUzrAAMi6t4PKUg8Vs2RmSY7vfkjEHbcD44oPU0WnDbBoKTy9Nia6EIglQApBsU
 RAzhx+UYwTsD9W7Tugw9rDB9KnqbqJ+S/TrTRIK6dUcsT0TB8qIFm9B
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_143922_367475_F4F276AD 
X-CRM114-Status: UNSURE (   9.21  )
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patchset adds a device tree for Ugoos AM3, an Android TV box from
2018. Most hardware functionality has been tested, as noted in patch 2/2.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
Changes in v3:
- Rebase on v6.16-rc1
- Add a few Reviewed-by tags
- Link to v2: https://lore.kernel.org/r/20250314-ugoos-am3-v2-0-422104b0cec5@posteo.net

Changes in v2:
- fix vendor name in patch subjects
- fix mistake that made wifi not work
- apply Krzysztof's ACK to patch 1/2
- Link to v1: https://lore.kernel.org/r/20250309-ugoos-am3-v1-0-38cab5a4725b@posteo.net

---
J. Neuschäfer (2):
      dt-bindings: arm: amlogic: Add Ugoos AM3
      arm64: dts: amlogic: Add Ugoos AM3

 Documentation/devicetree/bindings/arm/amlogic.yaml |  1 +
 arch/arm64/boot/dts/amlogic/Makefile               |  1 +
 .../arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi |  2 +-
 .../arm64/boot/dts/amlogic/meson-gxm-ugoos-am3.dts | 91 ++++++++++++++++++++++
 4 files changed, 94 insertions(+), 1 deletion(-)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250222-ugoos-am3-f67413860434

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>



