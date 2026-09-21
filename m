Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 674B2C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hvjZHOpLzp7pP91442UrHRwP2IoVQT4tZJveO/+uSIQ=; b=u0pZuVrGfD0o7zt/HvpHrOLunS
	BzVDJSNY3HGVnuztr/Xa9rUMC8NZyz+xZfN8vQMz/d+y2ghwSKr3C1NVkCwr4sgz3LgkDr5RMQDzJ
	Nzm2ZzhG73bZkTVK5pYxVNzhyo59schOpYjlsA+aeTMyB5Yj0OlKg5b7U1LEiQ+7PA4sQt2PykdeQ
	dVfNHmEA09CIOmBbPCLYKKDHVZeHg/bKcgism5xqYf2nFKsTIlgEk7qYdWoyqQSs8GUVylLw/2eiF
	VrD6Y+jfyG3O7r2hruR6WrGqAPaWDl+a4jqhNIg3gWUQRMrBTiRIZRfVyB8e2E1BM1q4m7tBIAyjP
	C24sC+Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fzb-00000002cXw-0VUo;
	Mon, 21 Sep 2026 15:31:43 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fzT-00000002cS1-35u7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:31:39 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so2065624f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 08:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790004694; x=1790609494; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hvjZHOpLzp7pP91442UrHRwP2IoVQT4tZJveO/+uSIQ=;
        b=LAcoFIrwudnoGJ8yuFhC6++FGRM41UIkSLg0JWYRyDoKA+7iYwwKt/QPuDdwpQx1Yq
         MSopi4MY+UDa6/IaWESOu74o7LVgkxosFAIrKo6rcV8XGAwUefPUq0h+5eWxgqvyJkHN
         noCrDj4Km5PAKjYVBrrX81XU06rgXYPpVn8+GtXmOF45/Sd3A5lOA1RbTjccL3/G/5Tr
         yWZfdjonzUSm9RTcJcEXObxBi/pcTBBg/SQ6A2TYdZCirtzbKY+6QFYg5nzhIbdb7ndJ
         6A72ZGJQlwpWdPyZpEcr+ojDmUkgPTY8mr3jWEtDlEETCp9A6vwT/tjkQ8EKnJ0hxbqH
         62UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790004694; x=1790609494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hvjZHOpLzp7pP91442UrHRwP2IoVQT4tZJveO/+uSIQ=;
        b=WtFEBnX1PYx1uekuhQLPyKIY0LxZKjZf593yVOMh+3UDxaGtuR7z597QVp+uCnWpbk
         +loGvTewNGqPz/wvnDIEw4bfvYiXexC9JyfkiXcJytBELwO8Pojngt311OUag9XK3DTe
         VGBXFUKBo1jyAfu1k8ccmb5xq/UWZPWWq72XEyxTv7PulKzn6ryK4rq/3f1ghWbXQrOZ
         DkQzGskkm4v9AjIjo8knyn8j5c/g6bVTaZ+xc9VTBRKtPcAj7Vo6U95pVPKMxNU5skh7
         wgGMvrttXtijRhczHbu8dI/AvyorpALuj5xe7eQHCEP6mjEoh7Wh749cZrxXcqicm1Ks
         FF0Q==
X-Forwarded-Encrypted: i=1; AKwUvByqe3QsO7lIJQgtKjYDd41N2mxyF7McXzt5N81398BHLrjzTCkERDB2Hqyi48pAFMs1fSmHOvs3dc0kxxo4V6ZM@lists.infradead.org
X-Gm-Message-State: AFuF++kI446DNdOfyANIYsE0HsEJnLgIkVIj3FsGrfjIqBrJmybjAYCM
	dp3nRL//VX3EAmrDmiPssAUzYIUnrrUiMN8feVe0PZtkXKovC1rm6ao0
X-Gm-Gg: AYBFou1irSn1YW930GOxjdRIWohvcYXflWVYdEwFeqVsV+VSbNJ94RJmhzeXyW8eMzM
	ORBiNjv+Z1SfqoBK+SfhNWexVV+oTJBSkRhqBjOkynsJRa5PizTeUQUrfGkGzbUSgwlbmbwfaK9
	rakmuvTEr7wOF4N7Hosl3v4ee544fUjPHBS6HxJuBAKNZOQ7GRaIChFVTKhBB6of2rxI1dCN1PH
	Enoc2unuCCZEacw1YoDlx3aSrh9K2Gg4KgA9eW8rA/obY6nD4LLCXsSlBcJgYQWp4UwIxMI1ZZS
	LOjZeyZ9MeEzLoHwE1YHiyTe0d79jDPCJj3BWe2tZBDg+/ceYJkNmKCP7YVDm+K+4R6W904BG54
	6FoP82AI4ZbVfcgRkIjTyxkaQelB0rvo5+ms3eQSyYnmiZJ6x/+w5jJRU68MJuhCwBNd71WTiPS
	YpDmLVX+epp3dtSr6YW4De+FvKJaD4kko0w+XqPopOQ6zh/p3fHJQvj6ZU61kUiDVhUg9vMgYeh
	ENqFlq9gzTBvOWA1HeW+oPzQSBiq9Q1z52qtK45Qu4ryQ7kLeTGyEDaCtZbnKEPgHVF
X-Received: by 2002:a05:6000:2407:b0:487:14b6:b1be with SMTP id ffacd0b85a97d-4871e235dedmr14131319f8f.25.1790004693661;
        Mon, 21 Sep 2026 08:31:33 -0700 (PDT)
Received: from [127.0.1.1] (lmontsouris-656-1-83-121.w82-127.abo.wanadoo.fr. [82.127.110.121])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48724562aebsm25313835f8f.14.2026.09.21.08.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:31:32 -0700 (PDT)
From: Amin Gattout <amin.gattout@gmail.com>
Date: Mon, 21 Sep 2026 17:29:58 +0200
Subject: [PATCH v2 2/5] media: rockchip: rkcif: add a register index for
 the MIPI capture size
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-vicap-rk3576-v2-2-0a4582e20c72@gmail.com>
References: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
In-Reply-To: <20260921-vicap-rk3576-v2-0-0a4582e20c72@gmail.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Amin Gattout <amin.gattout@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790004687; l=4689;
 i=amin.gattout@gmail.com; s=20260818; h=from:subject:message-id;
 bh=hmtR3W1Y5TWVJ1bZwbC6Y+hbDXaRcvii2VTH1g9vhD0=;
 b=7eXfGmHs6sqc5ovi2LozeLD8P+//cq3BdzTNILe+jLO+3z6tcXIFTrq2r7PjL5gIQ0U+4GFP/
 bs+JT9H4zhyDhyWgtywsCyvaCrvhVdn3FYixJeafybxnIvdR7YATVT9
X-Developer-Key: i=amin.gattout@gmail.com; a=ed25519;
 pk=MSIqDPkCOkwtyP8Fns1m+KFU9SgqoDl2mpLe18vL+hQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_083135_815223_A7B5790E 
X-CRM114-Status: GOOD (  13.64  )
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

The RK3568 and RK3588 variants configure the MIPI capture size in the
ID_CTRL1 register. The RK3576 has a dedicated ID_SET_SIZE register
instead.

Add a register index for the capture size and write it through that
index, in preparation for the RK3576 support. The RK3568 and RK3588
mark the index as unsupported, so the write is a no operation for them
and their behavior is unchanged.

Signed-off-by: Amin Gattout <amin.gattout@gmail.com>
---
 drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c | 10 ++++++++++
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h         |  1 +
 2 files changed, 11 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index bc9518f8db50..e0acb9049ca1 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -438,6 +438,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x38,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x40,
 			[RKCIF_MIPI_CROP_START] = 0xbc,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 		[RKCIF_ID1] = {
 			[RKCIF_MIPI_CTRL0] = 0x08,
@@ -451,6 +452,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x58,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x60,
 			[RKCIF_MIPI_CROP_START] = 0xc0,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 		[RKCIF_ID2] = {
 			[RKCIF_MIPI_CTRL0] = 0x10,
@@ -464,6 +466,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x78,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x80,
 			[RKCIF_MIPI_CROP_START] = 0xc4,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 		[RKCIF_ID3] = {
 			[RKCIF_MIPI_CTRL0] = 0x18,
@@ -477,6 +480,7 @@ const struct rkcif_mipi_match_data rkcif_rk3568_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x98,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = 0xa0,
 			[RKCIF_MIPI_CROP_START] = 0xc8,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 	},
 	.blocks = {
@@ -549,6 +553,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_CROP_START] = 0x8c,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 		[RKCIF_ID1] = {
 			[RKCIF_MIPI_CTRL0] = 0x08,
@@ -562,6 +567,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_CROP_START] = 0x90,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 		[RKCIF_ID2] = {
 			[RKCIF_MIPI_CTRL0] = 0x10,
@@ -575,6 +581,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_CROP_START] = 0x94,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 		[RKCIF_ID3] = {
 			[RKCIF_MIPI_CTRL0] = 0x18,
@@ -588,6 +595,7 @@ const struct rkcif_mipi_match_data rkcif_rk3588_vicap_mipi_match_data = {
 			[RKCIF_MIPI_FRAME1_VLW_Y] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_FRAME1_VLW_UV] = RKCIF_REGISTER_NOTSUPPORTED,
 			[RKCIF_MIPI_CROP_START] = 0x98,
+			[RKCIF_MIPI_SET_SIZE] = RKCIF_REGISTER_NOTSUPPORTED,
 		},
 	},
 	.blocks = {
@@ -759,6 +767,8 @@ static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME0_VLW_UV, vlw);
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME1_VLW_UV, vlw);
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CROP_START, 0x0);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_SET_SIZE,
+				RKCIF_XY_COORD(width, height));
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
 	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
 
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
index 3cf7ee19de30..0460e963b154 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
@@ -147,6 +147,7 @@ enum rkcif_mipi_id_register_index {
 	RKCIF_MIPI_FRAME1_VLW_Y,
 	RKCIF_MIPI_FRAME1_VLW_UV,
 	RKCIF_MIPI_CROP_START,
+	RKCIF_MIPI_SET_SIZE,
 	RKCIF_MIPI_ID_REGISTER_MAX
 };
 

-- 
2.43.0


