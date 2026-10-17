Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAE7CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 19:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ggIlYqb11US26O5sA+ImWPEli5zTJui5OSrJsvz0LFw=; b=Vp2212fY5dHvhAOOe/oqwK8CpY
	vcNEhFk5rTlJM0YofLVA3rXS8LKvIsL5txhumHxxkCpaItaeuBhGsKkaCgpxDduiBQv03l5Y1Ip6x
	hNRrGlmtBokVwBs6rt0fQLNstqGv4Lu8AbQNizxdY99ugmMKV/aH3lrO+14iPJatrdELKA1o1Tuue
	Aa7X9svYNSlc5V5oA5qC4aEQIfsYG6xuYRq+CcM/QPHgW1CLVGiMzYi0wat92XNoK4G7xixqcongy
	1wiv3nZd5k57E6QB/uQ6q84PMEMGWQjujtB2+cduwmOz/SJNjczQlWAV+dA2kSZBGlpEaLMyf11wf
	f8fzJTiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAN3-000000059sL-2hwV;
	Sat, 17 Oct 2026 19:47:09 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIAMV-000000059A5-3X3B
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 19:46:38 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-6dd7070699eso578748eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 12:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792266395; x=1792871195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ggIlYqb11US26O5sA+ImWPEli5zTJui5OSrJsvz0LFw=;
        b=GV9cga+7FveFgjIBuO4DzdZmu6/jNznVMfRKs/BjBB37IxsUb3kEu8W//ahdEodJb0
         XYS+E9oJegDp8ixHwu/Y3dzGithDv9HzL19HE8rKeaVc2D/HxtG/TwQG5Flm6o3pnkRs
         Npdfq+3nC75Hl0GlQfj+RAyHdQwITEHncieoQ+5XMt6aSv/d5HjNVGLFkWcPp+L5pUAc
         QR6GHcmmstUrkqKR4zvQGDXok8tO2O2RtklOWywUhTUSvQPbxgojG6w11YTH7p2qgqya
         o9dGTT5IkcY6cTq46hyut4bdsqHvo9+P3KiCPM91O3QmlUo9Oj4wG2l1G+R17VdWpNmo
         lQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792266395; x=1792871195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ggIlYqb11US26O5sA+ImWPEli5zTJui5OSrJsvz0LFw=;
        b=DUrwm3m+rPfz3+J1KmVK+nKjvWEM/Jd5twAo1m4dICuxNkfHvBIv+UL+pj2iy3bwse
         VIUGPGOFoYu3fiOCwRl+H7GaJanCcgkHRRHXJVORdonRK1Wk0i61ynisx9RuR3gSeCXa
         TaHSyTBHP1XsXM+wDU5XW1j6HJiToBauEpPCKauZyH7Z3fOXdVkoF7oSNO3gG3h8JQGk
         ZG51Hn4raYq+5Z7Tx1piilPFDkvFZxaYoylo4SP4Or2pEtTilf8up2mL7PmCFMDUcedt
         SJ7sDr75xY3TgRpzzEu0lmp1cdL6EhIji1LOQ0s2WwLq/0TBr9CN5W4K2iTkva9fHho0
         uYcA==
X-Forwarded-Encrypted: i=1; AKwUvBw0QJ9HDowCjA8so3d9lEBz963xK6KaBmBkag0TozxF9hzodDihSuwO/N0HoLNoBWOIL9SZpK6sP/uEKFrXk0it@lists.infradead.org
X-Gm-Message-State: AFq9FYJWtWpR02d08zbZveJRWG8dSvMUaJHXvK69daP3EKcOrNQ1NcBZ
	OG6430yb7rxKjId3hSyt/HdyIBOjDD1luL0IVVXzZB/oWaQkYivqXGTF
X-Gm-Gg: AYBFou1paRkIdrpWWhNyE8ToAk1KXADN12NN1Gc76f8fgrpolqh5BYyeq3UxZpa6mjc
	VdiqrI6G+HXQDO9Hp0tIWCEuH2rA+Py6AGx5j6s6VEv+IQnLG71Ar3U//4IdTo1vJYXQev7iFAX
	QDWL4FoinQIHcCJSBKuehnUX0Aws6hRuViXujRnCbokaKRm3QUztH0n36c51QktoIWJk96GqBjR
	BiiJoBJcCshP7k45ns5p99OKYrdKBslSOf5XG8ajeC+E9hnXTFcQg548XYLyQudwSLiDO4ixF/h
	viUu7wIjLBV4SE+ES3dadBGlzT1LAvZ0zx3Otm5PiMlFxwubrMDEtEk437ks/GPWNBJHY48CtW/
	Co8wsAcJJOlQT3pSPXYdzxLaZuiF9hIzmUtXtsut+3+BD+hFGB0Em8P1D+lrApdRv+UUdO03+Qf
	dWqrALEzaLZutg/9cu0Y2M8/pTF1mmgtiY8AEyf2zL9y2wPWgUF3dV1NhZ4O9NPcZMKzRK08BO3
	vSqB5rB/uwN9B3wP/XedQVPRSaMuKlJ9lyQPe6iUTVAjnjLM/L96Ikva+ZZSrgJWzTFO2Z4Gyqn
	kWfNpSLww9CkyDKBlQvfK8E3V0n7ymNwoy6lhHgfkVa7viKpiz3OXxxVz6tZO7v/Ag2tZ2uK8Id
	smvDZf1m7u6gPe3O/3yqx
X-Received: by 2002:a05:6808:238a:b0:4c3:9892:96c3 with SMTP id 5614622812f47-53ccb300dfamr2614650b6e.22.1792266394712;
        Sat, 17 Oct 2026 12:46:34 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5388dd8b5a2sm4025321b6e.12.2026.10.17.12.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 12:46:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 17 Oct 2026 13:46:05 -0600
Subject: [PATCH v9 10/18] mtd: rawnand: sunxi: avoid a second program
 confirm for OOB writes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-10-b624c09e3ee5@gmail.com>
References: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
In-Reply-To: <20261017-submit-sunxi-nand-vendor-oob-layout-v1-v9-0-b624c09e3ee5@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Clark Williams <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Richard Genoud <richard.genoud@bootlin.com>, 
 Boris Brezillon <bbrezillon@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>, 
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_124636_143094_E9AEF1BA 
X-CRM114-Status: GOOD (  14.40  )
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

The hardware-ECC OOB writer fills the main-data buffer with 0xff and
calls the selected page writer to program it together with the requested
OOB. Both the PIO and DMA page writers already finish with
nand_prog_page_end_op(), which sends PAGEPROG, waits and checks NAND
status. The OOB wrapper then calls that helper again, sending a second
program confirm without another setup or data transfer. A failure of
that extra command is returned even though the actual write has already
succeeded.

Return the page writer's result directly. It remains responsible for the
single program confirm and status check, including on the
bad-block-marker write path. Raw OOB writes use separate callbacks and
are unchanged.

Fixes: 25f815f66a14 ("mtd: nand: force drivers to explicitly send READ/PROG commands")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index b79a20158cd4..f00f9a8ff66b 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -1848,15 +1848,10 @@ static int sunxi_nfc_hw_ecc_write_oob(struct nand_chip *nand, int page)
 {
 	struct mtd_info *mtd = nand_to_mtd(nand);
 	u8 *buf = nand_get_data_buf(nand);
-	int ret;
 
 	memset(buf, 0xff, mtd->writesize);
-	ret = nand->ecc.write_page(nand, buf, 1, page);
-	if (ret)
-		return ret;
 
-	/* Send command to program the OOB data */
-	return nand_prog_page_end_op(nand);
+	return nand->ecc.write_page(nand, buf, 1, page);
 }
 
 static const struct sunxi_nfc_timings sun4i_a10_nfc_timings = {

-- 
2.53.0


