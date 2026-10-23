Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5AA606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 17:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=M8Y9qZg3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cmw0kJvPlogc0Dq5lVT/xEgR88keU7nR4P6aPNL3aqg=; b=M8Y9qZg3AT9ivX
	JwoYKSm/PSJbfeFh+kMRKyL+d91FhJmrdiYf8oqynF6jUUtqInR0IdoynLgzBD1X42sb4stzFmYAN
	SjwYIPyqUUM8ozMz2FgpCPfzN6UAEC0J3KWsK8poHBK/FIedPEmf79Oc3had5XbQwW3lpXGbbH65l
	KtMNQazzpEtybNrvJfiGJcmQcwP3wjtT9WbFBdvr8qPue1wGH3VH72arjMYbt/mX5XQjMMTppE/i6
	btOli8dgwZB5Nb1ZZktIu5/XG9sEmpKTE6C9f/9TBIowb1tZ6vKS2jYEzUvZII4SAZ9LZ6zHvrpgo
	fV+P1iqcBOSM8F72JhBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJS0-0000000Gkxv-0eEB;
	Fri, 23 Oct 2026 17:53:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKJRy-0000000GkxE-1V5N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 17:53:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 85EC26020F;
	Fri, 23 Oct 2026 17:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A3D1F01825;
	Fri, 23 Oct 2026 17:52:50 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/7] dt-bindings: clock: renesas,r8a78000-cpg: Add GPIO clocks
Date: Fri, 23 Oct 2026 19:50:40 +0200
Message-ID: <624a9fb09e4ec74b1995797e5121b86e7206f5f2.1792776697.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1792776697.git.geert+renesas@glider.be>
References: <cover.1792776697.git.geert+renesas@glider.be>
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

Add definitions for the clocks used by the GPIO modules on R-Car X5H:
  - R8A78000_CPG_SCPBUSD16_SCP_MAIN,
  - R8A78000_CPG_S0D24_PERE_MAIN,
  - R8A78000_CPG_SGD32_PERW_BUS,
  - R8A78000_CPG_S0D24_HSCN_OTHER.
Include a few more clocks from the same groups for ordering consistency.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/dt-bindings/clock/renesas,r8a78000-cpg.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/dt-bindings/clock/renesas,r8a78000-cpg.h b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
index 14b3885f2d9933a3..cd7192ccecd4e22c 100644
--- a/include/dt-bindings/clock/renesas,r8a78000-cpg.h
+++ b/include/dt-bindings/clock/renesas,r8a78000-cpg.h
@@ -12,5 +12,21 @@
 #define R8A78000_CPG_SGASYNCD16_PERW_BUS	2
 #define R8A78000_CPG_MSO_SCP_MAIN		3
 #define R8A78000_CPG_MSOCK_PERW_BUS		4
+#define R8A78000_CPG_SCPBUSD1_SCP_MAIN		5
+#define R8A78000_CPG_SCPBUSD2_SCP_MAIN		6
+#define R8A78000_CPG_SCPBUSD4_SCP_MAIN		7
+#define R8A78000_CPG_SCPBUSD6_SCP_MAIN		8
+#define R8A78000_CPG_SCPBUSD8_SCP_MAIN		9
+#define R8A78000_CPG_SCPBUSD16_SCP_MAIN		10
+#define R8A78000_CPG_SCPBUSD32_SCP_MAIN		11
+#define R8A78000_CPG_S0D1_PERE_MAIN		12
+#define R8A78000_CPG_S0D2_PERE_MAIN		13
+#define R8A78000_CPG_S0D3_PERE_MAIN		14
+#define R8A78000_CPG_S0D4_PERE_MAIN		15
+#define R8A78000_CPG_S0D8_PERE_MAIN		16
+#define R8A78000_CPG_S0D24_PERE_MAIN		17
+#define R8A78000_CPG_SGD8_PERW_BUS		18
+#define R8A78000_CPG_SGD32_PERW_BUS		19
+#define R8A78000_CPG_S0D24_HSCN_OTHER		20
 
 #endif /* __DT_BINDINGS_CLOCK_RENESAS_R8A78000_CPG_H__ */
-- 
2.43.0


