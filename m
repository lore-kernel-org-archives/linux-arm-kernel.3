Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527E1C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 13:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t8f5UJCABHvmBw6dzoHdGzw6KbaLnhVEoCCS6jqmRT4=; b=uII+KCYcF31NWZAQVztUmsHAQz
	/BRRht4kHK/CmBSrPuAl3oURFAQIfblCH2tZfO2tsQY9+Y3cGWggSuYE+35fihclXkjYpvy2IdsRb
	8/m/OwXtDlQh/NTXu+iaL1ENYMrjCb8QfB6QVkZD57s5Qpv3S7vm/DS0lIkZyMkp3MIxmLZjKXXUI
	kpWAjBTOMirsiV47WBaSI4o2dHGudsyhbMcewU6NGbtaYJj97bEfl/bBPF0IBbFddJy/ssNmKPJOk
	Zx3f8K468XSnNQn3ziQGrjRP4EiWBJ1zSrWSfn9EuWJkeGWV3dnxyHG0Pv4VEHU7wKMgSDM/aQc8A
	jFDJM+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxqP-00000006Fbr-0fi5;
	Mon, 17 Aug 2026 13:57:41 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvxqM-00000006Fac-1zlh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 13:57:39 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-69848c9462aso554719a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 06:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soundtrack.io; s=google; t=1786975057; x=1787579857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t8f5UJCABHvmBw6dzoHdGzw6KbaLnhVEoCCS6jqmRT4=;
        b=JJm8ampHQt6MXsmme3j1uMuB+MSapsimca7pKiVWRegR3DiZT+ZrFwyx8BQ8QP1oJR
         q+wSm37SQHo9o2rrXw4+iXN2/2y+Adpdo4tsBOMWtYOc75Ee3iAITXEOloyaD1IxNFVt
         HCPtXUTXj1CYvM53/XgjK5SXT2quBs1k2CtOkB0g6DMUjc+EgXpNhTaT7B0DLZbjsdW6
         oHkq9pfcbkPXUdBimBCWq7GCvNcVzbRaiiSoOphK+P7rDFf1y2I4UeUkVq62bTl/U63R
         vlG7KQG/E9npBTSbCJed7qFEfs9gLUIqsHyCDwztES4lKkQmK94lhlhk0EOLwjEQ5Nw6
         +toA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786975057; x=1787579857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t8f5UJCABHvmBw6dzoHdGzw6KbaLnhVEoCCS6jqmRT4=;
        b=qUNhg02qurcDFMMvTJak3PJDABradnmOgy5QdbMR+qrIvMVjDhojGML+XZct3wpeR3
         bd9jMqKgEx7LOsxjm2Z5shCC/y7y0EBkCzLl9lgCr6W+MXVFE4at8m8Zx/lAdWiJih/G
         nhOBtztyQxH2TI+69KQ3MXQtZsEtLqeZDTXN+j7At83ADCkCakNGey7vDE3aymT7vnpm
         N9jNL9R7fNM5VeVKi8oTXT0chXyzroEqIjlI2KQJz8lLtEcyUQ86Y6cpHvz7KOFGszxu
         sjSvDmGF9QA0XtTiNBlrr6Jcc2hUk8JOdW/QSoRr1j2mLFC/3o80/rzUBZaaiaWJ6WGs
         MtCg==
X-Forwarded-Encrypted: i=1; AHgh+RpE7vqbMi+RAJ8KOd1mI6yAq14Hatadp6coHEjLqW0sg54UJCM0XHcX8htj8kfz7DgFlUdsX7KZt1QSxmcqH3oe@lists.infradead.org
X-Gm-Message-State: AOJu0Yya0nHkmBLB1WFr+z9PgGebx13zZBQGiSjbq49NCMGyC221nWhr
	D8D17C23Ey+IdKfBlQBtt2vmVF4dDRbeJLfGZAx6TltrUOOmRVwkwn81i6O1YujZPm8=
X-Gm-Gg: AR+sD13VCCSpIW/7JTiqHD4koSOyCCHhag6NDn+EYb53Yts/859j4WFbkk5e4VvGDoJ
	azEo8Oo3s6mUO1Q3ltuTzykPCOj/te4Mu/NR/Tdzs7W9zJU74YjlhevFFm4okIxCl0rBg/7Ykfg
	xFbc/DIwqkp23j8hBqFkch58OQvrvHMhjOBmxkwibrGCT9W6sJSUADgfrt6rEwexO5WeGE45pmP
	kwwdIXf71BYH7GZevXlPw93m51ng0L3bFmBea5dIf7hcKqudsddCWNOXa+ZZ6W+z5ynFmRLIygY
	Dk40IRL7Nou2rG4FqyEkMF2LpAksW9UeOzqVHVvd6mCfQ+1W419OAi/r8ModTVWnQLVXLYDnwdN
	jdgrNzVYJRTIZMuq5l1OGiBBQ30Oy+fFS+u110Zpis+gl2VcSdS4cY4MIQwb2ASaNzZkQW+1yQb
	/ZyBQYGZozsGpO358tgj1nppylflSiEfCu0tqUVWO4kWkC32TeOkCqkTHElefgEMBXyXg8EWkLR
	sm+7ifNfwPqL0Zjmroxv/4ecxjXWbpmoLy4FNr7uqmDG8MZpGAOP04bm7Y=
X-Received: by 2002:a05:6402:2812:b0:6a3:8446:c56b with SMTP id 4fb4d7f45d1cf-6a38a8bf430mr6474052a12.1.1786975056608;
        Mon, 17 Aug 2026 06:57:36 -0700 (PDT)
Received: from Mac.localdomain (31-209-40-223.cust.bredband2.com. [31.209.40.223])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d85319b1sm810238a12.13.2026.08.17.06.57.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Aug 2026 06:57:36 -0700 (PDT)
From: Christian Lugnberg <christian.lugnberg@soundtrack.io>
To: vkoul@kernel.org
Cc: Frank.Li@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Christian Lugnberg <christian.lugnberg@soundtrack.io>,
	stable@vger.kernel.org
Subject: [PATCH v3 2/2] dmaengine: sun6i: fix undefined behaviour in sun6i_dma_tx_status
Date: Mon, 17 Aug 2026 15:51:23 +0200
Message-ID: <20260817135723.12807-3-christian.lugnberg@soundtrack.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260817135723.12807-1-christian.lugnberg@soundtrack.io>
References: <20260817135723.12807-1-christian.lugnberg@soundtrack.io>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_065738_525760_F5E847CE 
X-CRM114-Status: GOOD (  14.78  )
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

sun6i_dma_tx_status() calls vchan_find_desc() to look up the virtual
descriptor for a given cookie, before checking whether the pointer
vd is NULL:

    vd = vchan_find_desc(&vchan->vc, cookie);
    txd = to_sun6i_desc(&vd->tx);   /* vd may be NULL here */

    if (vd) {
        for (lli = txd->v_lli; ...)

vchan_find_desc() returns NULL when the descriptor has already been
completed or is in-flight on a physical channel and no longer present
in the virtual channel's descriptor list. When vd is NULL,
to_sun6i_desc() is called unconditionally on &vd->tx before the NULL
check, which is undefined behaviour. Move the call inside the if (vd)
guard to ensure it is only reached with a valid pointer.

    vd = vchan_find_desc(&vchan->vc, cookie);
    if (vd) {
        struct sun6i_desc *txd = to_sun6i_desc(&vd->tx);
        for (lli = txd->v_lli; ...)

Fixes: 555859308723 ("dmaengine: sun6i: Add driver for the Allwinner A31 DMA controller")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-sonnet-4-6
Signed-off-by: Christian Lugnberg <christian.lugnberg@soundtrack.io>
---
 drivers/dma/sun6i-dma.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 04fe1f5042e9..7704b016aed8 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -981,7 +981,6 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	struct sun6i_pchan *pchan = vchan->phy;
 	struct sun6i_dma_lli *lli;
 	struct virt_dma_desc *vd;
-	struct sun6i_desc *txd;
 	enum dma_status ret;
 	unsigned long flags;
 	size_t bytes = 0;
@@ -993,9 +992,9 @@ static enum dma_status sun6i_dma_tx_status(struct dma_chan *chan,
 	spin_lock_irqsave(&vchan->vc.lock, flags);
 
 	vd = vchan_find_desc(&vchan->vc, cookie);
-	txd = to_sun6i_desc(&vd->tx);
 
 	if (vd) {
+		struct sun6i_desc *txd = to_sun6i_desc(&vd->tx);
 		for (lli = txd->v_lli; lli != NULL; lli = lli->v_lli_next)
 			bytes += lli->len;
 	} else if (!pchan || !pchan->desc) {
-- 
2.54.0 (Apple Git-156)


