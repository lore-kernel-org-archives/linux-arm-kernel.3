Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB75606A319
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 21:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cIbCgTT7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Eslpcj0l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Zw34kWORgWFq6vXFZfY+U0jN89QpDk8t2E+8VK33EpE=; b=cIbCgTT7IyYqQQJEaE1E6+WGus
	qHWncfomRtNTQDCvhI33ZNZUfsdor7YTc7AGbPQQ/gZ14dl2zsFwRd6FAHO1gu0eFRqzhD96Pgtli
	DoaBAqYJBV8sN8nwm32fDDDitH4okUUvR06PHVZq36oWwGvlRB0oZfPBX3R6+SjNVVtFSxpGSurPu
	ogP1rwx89C7lMxXt2I5YyQ5NC3+c/6UvHDi5Y2jYspu5j2j/IpZkOiEbhj5nuycSnpjiy4eP6bmzt
	+HVwjGL8mjEESanPC+ISNpT0g7iVrZkF1RpbBjPJMJQZbCL0h7FKrdKJUCsABttP3aX7fwqbQSzCm
	wwRMoXFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0it-0000000F2IP-1WAS;
	Thu, 22 Oct 2026 21:53:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK0ij-0000000F29Z-0TzK;
	Thu, 22 Oct 2026 21:53:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8CB81602C5;
	Thu, 22 Oct 2026 21:53:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792705988;
	b=luxNm4dR5zgCo43s67G9HLQfzDMF3bhO/ZQv45q1UVAkjI10Uk7kgFY8Rv6sFenTvgL3
	 qTeR0BO8T3quJyQfRfCJp2fm2PNIfjbCPa5l+mrnkwco8728bxAigv5QikOMgVnNYr+Cw
	 MJZtOAH0Dh/niKq7jerVz4GqLe+dxKRKzG49QBM3lXo4dvZbDi8kJ6LvHT/pBxpBHLmMI
	 q60T29qF5v6+RWBXJaTXZP01ShtD6x1uzhYlNEB8HSJ3QzKxaSGd0Oxo/KhJ7zmplTJp/
	 ZKaDW7JGj26RLAV0KO00BeHvofiwAm9ILgVYIGZW7wN/p9F0kGCd9y3ixJPp4TRvuXQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792705988;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Zw34kWORgWFq6vXFZfY+U0jN89QpDk8t2E+8VK33EpE=;
	b=O+rWwLSKbuh3S4gfxgpxJD8EtKqLRB6zOGTKGpoS2I0+OPl3cdIdF3SBAImVZUlXD9DT
	 DJMxXcioFBl9QxYzNKgyndK4dpuLB/+eF94FNKfS5zwDE9fvlgg2QulH8c1K0sNfZB5KG
	 8EjZwdNw/Au0pDPda6nC+IcV5pWwqJdCSZzdr4AKSjrwf6qTqwxshjCiDAThhA00WU63K
	 p++ZhU9UvNO4dsCBAX0E9fhRonHe6OnId3gUSCaEbkl+I2GuPanZWBFZzV0vhqW4OChWc
	 DHm7o27UkTeQ3uyNQG6yb9Tp0R1u/WyZy4/aLZrApBmG+v61MUCqwoU2A9FsxjtOm/A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A7A21F031E3;
	Thu, 22 Oct 2026 21:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792705988;
	bh=Zw34kWORgWFq6vXFZfY+U0jN89QpDk8t2E+8VK33EpE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Eslpcj0lxqu+DaCjkV958EkpE77J/GAvbhOgutODDBNjvNavEXrTbIIgqPOHcmDg2
	 JLMzocmnWm2lG6U9L6F0R49IZpbeX3+S0T67vRfGfcTDFGf1CvUFSwqssn8Cplpqtm
	 0UuftOCCZ7RIIslwAfh06Q33Mn5PqqNKgvhQTjkfr5wsAO04KjH6FOmV+MQZ9qNoMv
	 GQM5Ul3VVB+zKrcJLlYj+wRGRhjrmuN58nTCLx7pKLxmt6i3kRgvsYaIWuA1RLrowp
	 ggsJhcjD7zp+IK4+xA3uXDXu42oXl6TUOOumgf7wuwUxWZ9v5l7CxJT0zDKhhW/N95
	 nxugMuqSR47nQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BF2DE41F5E;
	Thu, 22 Oct 2026 21:53:05 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Thu, 22 Oct 2026 23:52:39 +0200
Subject: [PATCH 1/4] clk: meson: g12a: fix fclk_div2p5 multiplier
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261022-fix-g12a-clk-v1-1-e2bd8f3f1afa@aliel.fr>
References: <20261022-fix-g12a-clk-v1-0-e2bd8f3f1afa@aliel.fr>
In-Reply-To: <20261022-fix-g12a-clk-v1-0-e2bd8f3f1afa@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=828;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=kmf21z98rptos6YhBfPRKtB/DG5G/xeS94e38Rd7M00=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9at1j062/vqpNvFbynuv/zmVmqp9x1xU44b11/OfiLw+
 CbTTtWzHaUsDGJcDLJiiiz9cy1PvLt89MzXPeopMHNYmUCGMHBxCsBE7qUz/M9oLN/5IiL8XZ3i
 OlWejYrcvW5rM91kn39Km6B3RHPPAT9GhsnzL94waohu3Fz6avurlIffpgUoyup8Wfkk7P5h9pU
 lE7kA
X-Developer-Key: i=linux-kernel-dev@aliel.fr; a=openpgp;
 fpr=DFD863F61375BF917F0012173953305EF1D0EC3E
X-Endpoint-Received: by B4 Relay for linux-kernel-dev@aliel.fr/default with
 auth_id=744
X-Original-From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: linux-kernel-dev@aliel.fr
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

g12a_fclk_div2p5 should be fclk divided by 2.5.
The mult has been declared as 1 which results
as fclk/5 instead of fclk/2.5.

Set mult=2 to get the correct div 2.5 rate.

Fixes: 085a4ea93d54 ("clk: meson: g12a: add peripheral clock controller")
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/clk/meson/g12a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index d0d4c7b6dc82..4ec5f15daf98 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -995,7 +995,7 @@ static struct clk_regmap g12a_fclk_div7 = {
 };
 
 static struct clk_fixed_factor g12a_fclk_div2p5_div = {
-	.mult = 1,
+	.mult = 2,
 	.div = 5,
 	.hw.init = &(struct clk_init_data){
 		.name = "fclk_div2p5_div",

-- 
2.43.0



