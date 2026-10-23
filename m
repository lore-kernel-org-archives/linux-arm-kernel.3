Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7031A606A322
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 12:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qElQFBKW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n1SKiTB+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=I/jsmKBkJGbIrBQf+3BPreEkWXD+Jv1M7QJlYJiZSu0=; b=qElQFBKWuOrKCSNl91xCiASHlE
	mxjCYJEMURMDZZR4mta/HeqjNEc53e00QKnR6hMDts6uwiKyFpj6b74tfF+Y+ReyIPuHxZ/gGx33Z
	OTVZL4hIgRsXUxDrn9zIyQorn//gQhGDTKSacyX/qfudrJiJBy2CrevgewsUgNAJ0BAa+F4xl8aO0
	irJXk1MdFexZm1Yo79MoHMKzgUS9WGoJkqA1dXq/VftoOHFfHJMt6OzksCnR8VlsNe+6q7ie2pR5Q
	8RbrRwdOVrjZtDTl11e8EvuIKnW3z+RKWBlMy4LJlR1NIpyTJDU4YNqfZI+64dgfxSl7SZYSAjMaT
	OXhEwyWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKEnc-0000000GKBB-2YEa;
	Fri, 23 Oct 2026 12:55:08 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKEnb-0000000GKAD-05zv;
	Fri, 23 Oct 2026 12:55:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 100B860230;
	Fri, 23 Oct 2026 12:55:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792760105;
	b=uUleyBB4dDgRenUCm8N99p37N5s+RN1R5oBfmIM2lLZ22x5OyRc+pMzdFmblsupT3Ymv
	 c8Bnvmi7X50LhOMDWYbbyXo0+N37d3IiSZBnFXMEzihOqGekfUwET3eVLMmCHnv64CTvf
	 YMGClasTH5Cyobb2dK2e51iygPWcbaSs6KH7GAomZLtfQQmBD3ytmZWs7AU+gtqFIl/Ku
	 EmmwgXxNqaVf6Qg1p0Q96dM+TpABnTNF51V1DCqCko/aK8g6brFiq5EildVPMxzNtqqoj
	 QB/LC2Hp3x4RGg7ODV7fiSZGoP+uQb9TmGahFHx+VkeNtDIwq+o0dWDPnpw9T9eFQ1g==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792760105;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=I/jsmKBkJGbIrBQf+3BPreEkWXD+Jv1M7QJlYJiZSu0=;
	b=asXR6nlBarKA+WIsQ+swPku9FTanXdqRcJGxOLs2iejsiATgImc0RRvZt1At80bg8M/C
	 pz6IX8aiFquI7l5Nwuz6weUGbKZcfNIrn6eTWFEz1cUcI0KYJ3N/lgGM/y+8CZm96HCBp
	 Ftvhnq24EncsoYvCEKS0bji1NKW3MiqbKbwMdqFzVc509AUfRxEEawpu2bOOlYWPu0KlQ
	 gc2wFWSP8xjI8EjI8lg21hRciLPxRhK2VlaiGAlmJvPz04CDSoEPWBRadp3nPdqYLY8wP
	 zurrylr23DM/ApjL0OkBBLE8iR5+7OmVx8YqmqMOno2krSTswePihKzt5wFwCWZk9TQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EEB9E1F031E1;
	Fri, 23 Oct 2026 12:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792760105;
	bh=I/jsmKBkJGbIrBQf+3BPreEkWXD+Jv1M7QJlYJiZSu0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=n1SKiTB+PUZxA6OgPTo2M9OYyJpGMedkYdoD+kte+7GQ/EDiTq8GfgChXF7nwXgWI
	 81m8iJRNnY681DpQXy9h5PUiavFW1am88sjw9VmdPRWXgdyCqpWCwrN7hquEd78Rf5
	 GtTWpOxRGn1uC1SYRjQA5ufS1q4NTq5Qf3GdIAlvCQllAc05mdxG2Cj1jHvj9LaBsN
	 Hrwcq0eUmnd4VCypCQmPv6fEYdn2CTnrQASrK042dE7EJPiAFtqaKYAwszFSvncR9F
	 Pnc0qpyk3yaepeKvAHf7z5yxSkPbOqCEB73tGHRhPLdjQWerGImxFQe7vuZoMQgfcN
	 kI/rCq6XaWUpw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6477E4452D;
	Fri, 23 Oct 2026 12:55:04 +0000 (UTC)
From: Ronald Claveau via B4 Relay <devnull+linux-kernel-dev.aliel.fr@kernel.org>
Date: Fri, 23 Oct 2026 14:53:53 +0200
Subject: [PATCH v2 3/3] clk: meson: g12a: fix swapped VID_PLL and
 VID_PLL_DIV clock ids for sm1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261023-fix-g12a-clk-v2-3-0b0b9b86d437@aliel.fr>
References: <20261023-fix-g12a-clk-v2-0-0b0b9b86d437@aliel.fr>
In-Reply-To: <20261023-fix-g12a-clk-v2-0-0b0b9b86d437@aliel.fr>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ronald Claveau <linux-kernel-dev@aliel.fr>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1156;
 i=linux-kernel-dev@aliel.fr; h=from:subject:message-id;
 bh=t0FIKzJfxpaKxPA7dyb99aPBQLhdoQUw5gOCwl7UOKQ=;
 b=owGbwMvMwCWm1SvKXP3cUInxtFoSQ9btSDX2pNs2x5n53oqo/7iSN/fk7M4w0as72oSulETNM
 d6rNu91RykLgxgXg6yYIkv/XMsT7y4fPfN1j3oKzBxWJpAhDFycAjCRZ1YM/z3T9+1o3bXNuF4w
 quPQhPN3FSbe/uWgGGYg4mvEWvJXkJ/hf96e4/Lsr3dIV4py6Grz+tzt2uCl4yVy9HLUYSbFPyw
 neQA=
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ronald Claveau <linux-kernel-dev@aliel.fr>

In sm1 onecell data table CLKID_VID_PLL points to g12a_vid_pll_div
and CLKID_VID_PLL_DIV points to g12a_vid_pll. So the ids are swapped.

Swap the ids back to their right entries.

Fixes: 3dd02b7334ec ("clk: meson: g12a: add support for SM1 GP1 PLL")
Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 drivers/clk/meson/g12a.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
index 0f8cca4a4caf..baa03d24e4cf 100644
--- a/drivers/clk/meson/g12a.c
+++ b/drivers/clk/meson/g12a.c
@@ -5117,9 +5117,9 @@ static struct clk_hw *sm1_hw_clks[] = {
 	[CLKID_HDMI_PLL_OD]		= &g12a_hdmi_pll_od.hw,
 	[CLKID_HDMI_PLL_OD2]		= &g12a_hdmi_pll_od2.hw,
 	[CLKID_HDMI_PLL]		= &g12a_hdmi_pll.hw,
-	[CLKID_VID_PLL]			= &g12a_vid_pll_div.hw,
+	[CLKID_VID_PLL]			= &g12a_vid_pll.hw,
 	[CLKID_VID_PLL_SEL]		= &g12a_vid_pll_sel.hw,
-	[CLKID_VID_PLL_DIV]		= &g12a_vid_pll.hw,
+	[CLKID_VID_PLL_DIV]		= &g12a_vid_pll_div.hw,
 	[CLKID_VCLK_SEL]		= &g12a_vclk_sel.hw,
 	[CLKID_VCLK2_SEL]		= &g12a_vclk2_sel.hw,
 	[CLKID_VCLK_INPUT]		= &g12a_vclk_input.hw,

-- 
2.43.0



