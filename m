Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57577CA9ED0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 18:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AyANQsh/NuLrShgUzGL88ky2h7L2MDCXmZx5EOLv9g=; b=QzTcNYcFCgpvf0UOoI0vyrk7KE
	oeUcZ0PqZ+8gZq15zy0wt0Cc3l27AJfUo04Sebe9zDhhUHGIs8wxyzjHvvlmHLDuG7C/BDeJt0Gyo
	IacNl3jCI+qW2sOmhQKPlVEX9qg6fsiPbg4YhJJCWhF1IVWO847CGzAr8L/QXzO0NKhnsnDYw+brN
	vLPzh/uqLjTgeLqO/zp9QoWd1LfAuTcVL6gAyGow2Ai4DijJvLiswztbwJcdj8E4nGiN4W5RhIUN2
	loq2czyXePq1qe4deyE/53dxK/H8lF3K8rdGACbbe4r1ql5z3B8Sm8g5eCEKj0TMBqY77/fzgstvB
	sWXkQ1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKyI-0000000BGel-0cU5;
	Mon, 12 Oct 2026 18:42:02 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKyF-0000000BGdV-3dQZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 18:42:00 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-5e67a6b3633so737718e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 11:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791830518; x=1792435318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1AyANQsh/NuLrShgUzGL88ky2h7L2MDCXmZx5EOLv9g=;
        b=AeYlp6Fndb4G7YlOTH4YbqRA+jdnuevd3kVY4VS+5iX2hR9l5TunBr2vXb+dKjOVj4
         q2F2OmwTbfl2rjDYmV2b28Nk0KrsBsBiudYfYPHM4RfJu5q4P9IUOyf5me+c61uV7x7B
         iGZAM2+woBC2Wn4gX9bI9J0l9mGk852H6oKXxAZcKPZ5b6wrHJxdF0FlKgIXbTSV2yxQ
         +X+wsjYrmDgGl0J9KoEPQJSpL/WhTllsL+z3ECztdM03YWqVDGqGNgDCxXSfmhP39h4u
         p/mVMf454bn+nAOBKrvqUC1qQ5z+NmaHyg0F/RRLbqbYSnJJUaHbR8rpWzfP+Wp3FFlP
         h7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791830518; x=1792435318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1AyANQsh/NuLrShgUzGL88ky2h7L2MDCXmZx5EOLv9g=;
        b=VAWT3ebCL3f3vt/Qw+Qf8H9IBvrPJHdmeweZ6k7YlPPItCFpZHRLOTrR39cLdtZWmz
         af2HJ+KcgiXgYYmkET+vyQXpVzbcXKCp05bkf5fido7AwZzGLsocfA/y7n2gcwlB61GB
         fTMCHyObdUhBryTysH4OwYBVvatJEg+iJTyl+eYq25tADE3DRzqrkyiErC+qiiDe4xHZ
         S8FUuHR0QNmGS7PGRLDWcal7l3TGP2leshFvi1mosnENErup8Vmh7Q2c34KLM+hYYd37
         rL5RUyWuxzGZZEzvCJz4DNySBtJ7WIMyFk84lwfhIhSsl+sTtNZL+uvpoKTgOAxraPr0
         nVbQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0s5lDoOp/NjG+PUFSA7v3Q/hmGZaX/z9IxggusgjWVuC+EwpC/2/0Y6JnDjXEI6FrxNrfLVv5UL3BIUybDvYI@lists.infradead.org
X-Gm-Message-State: AFq9FYKFt0/J+780Eke2rCdtRNBGaTPlURC2Y9zgSfhRUBt8ZFAFkfGl
	AC1RyCaZEyu9txGYeVJJSWgtS+bUwaMgshDuDGz9sFR1JmD+f9jtNZft
X-Gm-Gg: AYBFou3pCt3YQGS57Mif28KqsNrWcCEUx+tPAzef1a3EARw2q2zr0q1LBF2jtkI8QdJ
	JAFYgwtNq18JRVaXhDFSJ2LRP/A5vsBwCx73/1vKrCC4JrgaQO5ryW7J+g+QQYXuSVXOcCxRIp/
	yZ6YH/NT/TKTHWxdylHvrLTIg+2xBI/uENCCb2a3PuYxYKXiLJ/1fwiOiRvEMSnVn/KEQwWSwAy
	T8WVgzQaaPkGy2pPc+BE91iYSIcDXwCVtfJ4AGfnuglX6Q4j5f54M/dmiX+pdWZ3cwu94JhsaS2
	shL8Nf07LnDIFH+w/sYSDKCrghqtxmKt/xXha8Opr0LipKKBq9wgpuYD8dYiYDVskLE1rr3Obz1
	97R+7l7ZfZwNwfsgskoU96jGzl43gI8Dj5+viqH8CbxTsBDiOId9hq6nsoldNSQvSE+RkW8/Lvd
	dPHX3qR/X1Jg+KrteoQ+9ZXPfXoLptAGyh+35v/hgQi/Wf0j59aBJ0NNtb7/oIcCWsEce0OzzOm
	7uhOgDCAIkW22HVM7JIQHMpWjlMLqm+IPZq1Toa5NiAgn3DcCWoa1OsIh/TpPd7Cz18KksZWCZf
	3KOY9p7ZE7qZ58wtXQ==
X-Received: by 2002:a05:6102:26c2:b0:7a7:195a:1b2a with SMTP id ada2fe7eead31-7cb377f59d3mr2545886137.36.1791830518290;
        Mon, 12 Oct 2026 11:41:58 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.244.163])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-99003f230b8sm6830180241.8.2026.10.12.11.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 11:41:57 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: linusw@kernel.org
Cc: wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	andre.przywara@arm.com,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: sunxi: a733-r: use the A733 I/O voltage fields
Date: Mon, 12 Oct 2026 15:41:29 -0300
Message-ID: <20261012184130.548261-3-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261012184130.548261-1-vinicius.eduardo.pedrosa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_114159_921520_A291C58F 
X-CRM114-Status: GOOD (  14.31  )
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

The A733 R-PIO shares the A523-R descriptor, and with it the A523
inverted one-bit encoding and the access to PIO_POW_MOD_CTL. Its
SGPIO_POW_MOD_SEL has two-bit fields instead, and the manual documents
no control register at offset 0x344. With PL in fixed 3.3 V mode, as
read on a Radxa Cubie A7Z (0x000aaaaa), running the old helper on the
host with a 3.3 V request for PL gives 0x000aaaab, which is fixed
1.8 V. This was not run on the board.

Give the A733-R its own descriptor with the PL and PM fields, and
leave the A523-R as it is.

Fixes: 31d68e10381c ("pinctrl: sunxi: a523-r: add a733-r compatible string")
Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c | 26 +++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
index cffc1e53eef1..1aa7f32035e1 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sun55i-a523-r.c
@@ -30,11 +30,33 @@ static struct sunxi_pinctrl_desc a523_r_pinctrl_data = {
 	.pin_base = PL_BASE,
 };
 
+/*
+ * The A733 R-PIO has the A523 one's layout, but its SGPIO_POW_MOD_SEL uses
+ * two-bit fields, and the manual documents no control register at offset 0x344.
+ */
+static const u32 a733_r_io_bias_masks[SUNXI_PINCTRL_MAX_BANKS] = {
+	[0] = GENMASK(1, 0),	/* PL */
+	[1] = GENMASK(3, 2),	/* PM */
+};
+
+static struct sunxi_pinctrl_desc a733_r_pinctrl_data = {
+	.irq_banks = ARRAY_SIZE(a523_r_irq_bank_map),
+	.irq_bank_map = a523_r_irq_bank_map,
+	.io_bias_cfg_variant = BIAS_VOLTAGE_PIO_POW_MODE_SEL_2BIT,
+	.io_bias_masks = a733_r_io_bias_masks,
+	.pin_base = PL_BASE,
+};
+
 static int a523_r_pinctrl_probe(struct platform_device *pdev)
 {
+	struct sunxi_pinctrl_desc *desc = &a523_r_pinctrl_data;
+
+	if (of_device_is_compatible(pdev->dev.of_node,
+				    "allwinner,sun60i-a733-r-pinctrl"))
+		desc = &a733_r_pinctrl_data;
+
 	return sunxi_pinctrl_dt_table_init(pdev, a523_r_nr_bank_pins,
-					   a523_r_irq_bank_muxes,
-					   &a523_r_pinctrl_data,
+					   a523_r_irq_bank_muxes, desc,
 					   SUNXI_PINCTRL_NCAT2_REG_LAYOUT);
 }
 
-- 
2.43.0


