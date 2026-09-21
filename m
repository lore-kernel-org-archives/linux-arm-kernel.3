Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3360C982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zghCP5qddDssD+/Zn2nncsxv0muFxosiwEXR8TK7rAA=; b=L2fR8ND4mC2/rsL/tp8m8V15ko
	WUtNj7gGpP7GPQTxEGBnNBqHvBKmG7n8krkwNXo35ZUmyxS7rM+nwpwnMCnRhjZNt4izaNQpCyFkO
	/gQKBaqQFUk73drwBV5qxjpMGgFDP6K/JE5tlo5NzMVQNW4pURYoulMb1fM0gEP+irJ/gSPaRTDqP
	gq8qqd07duXIJwUBSJsOYHOYu95w1opqul4uqYWbtuc4EJD956STwRNoQrREnuYd5/UxH6CiXrkc6
	1d5ElSdYHKWCdxQtJ13I040RHgdX3n6Mb8rTtZkNtgLEUgrSQlVG6hqk43jpGa6zn7uKRr8TRi0J4
	t39aRJ3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDT-00000001gad-0xfZ;
	Mon, 21 Sep 2026 10:25:43 +0000
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bDL-00000001gWF-1U1A
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 10:25:38 +0000
Received: by mail-pz2-x0c.google.com with SMTP id d2e1a72fcca58-8748f34b1f2so2651612b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 03:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789986334; x=1790591134; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zghCP5qddDssD+/Zn2nncsxv0muFxosiwEXR8TK7rAA=;
        b=MXoVq3rCFSVn6c2+zuOQK+G1iUsofgyLm/DR2JAC3fb8ZTh0eivHBTS3Z5wHdKVfHW
         cvil6FOpmjK6+jAvNu0sbSwpUkYd2pukqXUMCmfn0gofgQ+cfX2E28ppBbxOQh/IGuyE
         8l5veNINRaEo3PPjZwIKYyG1Na4yqlG8ecKu9EfITDKCuMlhaVJypJiWUMu0Ftxstcpx
         p57gL/N+Fo/9t6ej6u99YxCWfpwNW+0kNnj81ZXreelx8nhJn84JDT+isw4WMMDUEexL
         aFEGYJn5b6sX150+WRsLoPioFVoG/KzR4ZYCw0Y6v8gQ13zcL4n81C7IaJgTHiZmd4Na
         GhzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986334; x=1790591134;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zghCP5qddDssD+/Zn2nncsxv0muFxosiwEXR8TK7rAA=;
        b=oqvD0uGSlJJuaHB2C0BTi8cd3bLE0h4IA+LEZrktrIoltpPsAo4lH3nbwTHLQodkVZ
         CHYKNHAGnNKJNfyz9qGtnFgA1cMIoKctl2TVFple/Pp0+oqI7V1ftqw3gTmrZsFrMHcJ
         Pd79uFqQMiHzGcyLc6Q7c//q2Z6rxUF0sWTl0aHhkvz7XDPhU6DC6U0ukw2W+RlQZQZd
         aC8nSZElHqnXrsB0eR8R9/I8mOhTDTKvzQDPW9N5M0uEwjZtQPW0VHQG9sokkNECpW5L
         icnRG7ToYkbYiVFO9/aXbtk8ZNjIIdu9x1gDthGV7w7+uvYVq295wOzHrmdD/AHlCXB8
         DORQ==
X-Forwarded-Encrypted: i=1; AKwUvBxN+Z3/capeUqy4/D8EeM8poCvvW0dCK44ydFV5tvkFtevPgYPQrKCCjZ2Fx+i/4pz+TEhO6TLzSU8LFULGy9vw@lists.infradead.org
X-Gm-Message-State: AFuF++k86XIccv+2quW6MkmuK9VlnWihWD6QwYzs3SnPndhC1+Jo7PsG
	EkKCq+v7upFwDoJ7MxJtATDfVkaDz06DKAbJRxH79uxQS2iPHRiNMrY4
X-Gm-Gg: AYBFou1L7XcU+2diN9aenm4mbZLpINs5deTjUbzYx8xbcJCRaUy1+aNpzVIYLU4zy3v
	engym+LR+4UXsRpTxLiIClS6hMzC27Ygi4EMyeC2B2ykCCzEFcMrfBkhsYFIlLvfkommBNg4CHp
	EKlwFS/PzpUXWgHiHfdx4sqI23iX1umW922KCzMAGC0IM5vujUIujaNp9b/XUkG5oymc9F/6sJG
	vlcLFv+yhJ+m+P6kmf7fvM9O8V8j8EkdzIAUUiZ5MZdxaoxYB6MjRHYrx7l3CQukw5QqFTAOc13
	P0BIqQJEgLiTPabzoA8FFDLRZVmptdLlZabscSbRuELOlbKWS29I/kdBh9dYjHLkOWGg81qH2LY
	AzXdlln9ZqFqKOP/J3xcB3SzSthgIObK8OC52MYfUAKmOF5UmAuoo/gRmFCx3EGW77rHqqpL7wz
	FFKgybG7h2M4eIvztDNcyUjGAtFniKa98+LoFcz1SjODQcW/nNn71As/xGXLuB2D8R5GNWkcfcr
	d66SYbIyZ2FV4Y3NEyA9Acj2SstoA0xM9+bGF0=
X-Received: by 2002:a05:6a00:32cb:b0:874:705d:f655 with SMTP id d2e1a72fcca58-874deafb8cfmr14424938b3a.35.1789986334443;
        Mon, 21 Sep 2026 03:25:34 -0700 (PDT)
Received: from buffalo-ssd.taila54753.ts.net ([240b:253:4760:f400:1ebf:ceff:fe7f:5e0b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f238csm2909174b3a.21.2026.09.21.03.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 03:25:34 -0700 (PDT)
From: Akari Tsuyukusa <akkun11.open@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Laura Nao <laura.nao@collabora.com>,
	Sjoerd Simons <sjoerd@collabora.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH 2/6] clk: mediatek: Fix MT6797 clock onecell IDs
Date: Mon, 21 Sep 2026 19:25:18 +0900
Message-ID: <20260921102522.1640072-3-akkun11.open@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921102522.1640072-1-akkun11.open@gmail.com>
References: <20260921102522.1640072-1-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_032537_012889_56ABD574 
X-CRM114-Status: GOOD (  10.36  )
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

Add the missing dummy clock at ID 0 to the MT6797 image,
multimedia, VDEC and VENC clock providers.

This keeps the descriptor-based onecell allocations consistent
with the binding clock IDs and prevents out-of-bounds accesses.

Assisted-by: GPT-5.6 Luna
Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
---
 drivers/clk/mediatek/clk-mt6797-img.c  | 1 +
 drivers/clk/mediatek/clk-mt6797-mm.c   | 1 +
 drivers/clk/mediatek/clk-mt6797-vdec.c | 1 +
 drivers/clk/mediatek/clk-mt6797-venc.c | 1 +
 4 files changed, 4 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mt6797-img.c b/drivers/clk/mediatek/clk-mt6797-img.c
index 338c69234f24..2a42ec0a4b14 100644
--- a/drivers/clk/mediatek/clk-mt6797-img.c
+++ b/drivers/clk/mediatek/clk-mt6797-img.c
@@ -20,6 +20,7 @@ static const struct mtk_gate_regs img_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &img_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate img_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "img_dummy"),
 	GATE_IMG(CLK_IMG_FDVT, "img_fdvt", "mm_sel", 11),
 	GATE_IMG(CLK_IMG_DPE, "img_dpe", "mm_sel", 10),
 	GATE_IMG(CLK_IMG_DIP, "img_dip", "mm_sel", 6),
diff --git a/drivers/clk/mediatek/clk-mt6797-mm.c b/drivers/clk/mediatek/clk-mt6797-mm.c
index ddb40b8a1a7d..d2349c1d2a55 100644
--- a/drivers/clk/mediatek/clk-mt6797-mm.c
+++ b/drivers/clk/mediatek/clk-mt6797-mm.c
@@ -30,6 +30,7 @@ static const struct mtk_gate_regs mm1_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &mm1_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
 static const struct mtk_gate mm_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "mm_dummy"),
 	GATE_MM0(CLK_MM_SMI_COMMON, "mm_smi_common", "mm_sel", 0),
 	GATE_MM0(CLK_MM_SMI_LARB0, "mm_smi_larb0", "mm_sel", 1),
 	GATE_MM0(CLK_MM_SMI_LARB5, "mm_smi_larb5", "mm_sel", 2),
diff --git a/drivers/clk/mediatek/clk-mt6797-vdec.c b/drivers/clk/mediatek/clk-mt6797-vdec.c
index d832f48123f5..73339310fb51 100644
--- a/drivers/clk/mediatek/clk-mt6797-vdec.c
+++ b/drivers/clk/mediatek/clk-mt6797-vdec.c
@@ -31,6 +31,7 @@ static const struct mtk_gate_regs vdec1_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &vdec1_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
 
 static const struct mtk_gate vdec_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "vdec_dummy"),
 	GATE_VDEC0(CLK_VDEC_CKEN_ENG, "vdec_cken_eng", "vdec_sel", 8),
 	GATE_VDEC0(CLK_VDEC_ACTIVE, "vdec_active", "vdec_sel", 4),
 	GATE_VDEC0(CLK_VDEC_CKEN, "vdec_cken", "vdec_sel", 0),
diff --git a/drivers/clk/mediatek/clk-mt6797-venc.c b/drivers/clk/mediatek/clk-mt6797-venc.c
index fd4446f4a9d7..f616d61a0de4 100644
--- a/drivers/clk/mediatek/clk-mt6797-venc.c
+++ b/drivers/clk/mediatek/clk-mt6797-venc.c
@@ -22,6 +22,7 @@ static const struct mtk_gate_regs venc_cg_regs = {
 	GATE_MTK(_id, _name, _parent, &venc_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
 
 static const struct mtk_gate venc_clks[] = {
+	GATE_DUMMY(CLK_DUMMY, "venc_dummy"),
 	GATE_VENC(CLK_VENC_0, "venc_0", "mm_sel", 0),
 	GATE_VENC(CLK_VENC_1, "venc_1", "venc_sel", 4),
 	GATE_VENC(CLK_VENC_2, "venc_2", "venc_sel", 8),
-- 
2.55.0


