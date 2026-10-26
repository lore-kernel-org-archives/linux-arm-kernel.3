Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8052E606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 14:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ih6cfqni
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MGsjF8yAycNX+1w32e1k8A5z+o58fLHJWlgySWZ9AOo=; b=Ih6cfqnit5s6Lo
	Rlok1c8eWvCFjmckPhL7yAktjCMne5t6A7y73YX4GPx+6goNjnLf/NCol6DGV+hX6jueY4K0sNGnW
	6Ze5NStdfPy8z9K6O8fJjmwvGbGW9s+84xRos9t6T8TO9SnIZJF7ju8eEiz1ez5OU79pk0H9SBKQd
	H4duz6NbZqt97ATKXF6F1rZuCWhz4g/M2IJfPklQykAAaxpClWFzY7LMb3SW4QkaDaY8KmqAbwtQO
	PBlDdopgdxYD7r63SROPJPEB2jrfxqEMy5QvLbcz0zGH1yNLbx76mLD3kWpeGIm+vVb/UCKuC62ql
	ipNlbH0xtGK3o5KQ/n6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM6y-00000002iAN-2eVZ;
	Mon, 26 Oct 2026 14:55:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLM6t-00000002i9N-3V5f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 14:55:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 95D70403DF;
	Mon, 26 Oct 2026 14:55:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B670A1F01829;
	Mon, 26 Oct 2026 14:55:35 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ulf Hansson <ulfh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Khanh Le <khanh.le.xr@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 01/11] dt-bindings: pwm: renesas,tpu-pwm: Add support for R-Car X5H
Date: Mon, 26 Oct 2026 15:55:17 +0100
Message-ID: <8b2c7719c301a445891fc6c5309456327ec8a94c.1793026273.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793026273.git.geert+renesas@glider.be>
References: <cover.1793026273.git.geert+renesas@glider.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Khanh Le <khanh.le.xr@renesas.com>

Document support for the 16-Bit Timer Pulse Unit (TPU) in the Renesas
R-Car X5H (R8A78000) SoC.

Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml
index f85ee5d20ccbb3f9..144a88ff53e5633b 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml
@@ -33,6 +33,7 @@ properties:
           - renesas,tpu-r8a779a0  # R-Car V3U
           - renesas,tpu-r8a779g0  # R-Car V4H
           - renesas,tpu-r8a779h0  # R-Car V4M
+          - renesas,tpu-r8a78000  # R-Car X5H
       - const: renesas,tpu
 
   reg:
-- 
2.43.0


