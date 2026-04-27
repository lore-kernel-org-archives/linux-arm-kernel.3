Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB1A0FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 02:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mF/9AhbFaWy+vBCE+sic1C2hAqKkKmrRtazAAKk6boM=; b=EmwgtUq22KJ6+Pszg0N/T3m38Z
	6K6DSY5Ekmvv41Wmx6TGkx+KX5jqUPK9Ut5a8DGyTQSIQxRevj27L0W8jpHj+Ol3xK6FIkqhwORIW
	VzLaJNO3QW0+oKlYeCrbZxdMvwy8G32YUuwqTz9fMOKK8u1tJ8aSzGJozDIhOKgWxL/Ap9170QpIs
	lSazcDRHFqEttcL4tS23xR9c/MMLm/Pv3OvQYFtzWelYWhLh/wGWi1R33ns9a9DBZqNb/4HLvUFgi
	9J4HoS91XUDr7WgCy834v3atxlxZ+zBtTwCn+GYyEyp51E2qF/XQieTZ8OXOzx+TX249xrseaHacd
	QPySQ5xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBS4-0000000G2WR-2FwN;
	Mon, 27 Apr 2026 02:12:00 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHBS1-0000000G2V9-23Z2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 02:11:58 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c795eacbeb0so4182220a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Apr 2026 19:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777255916; x=1777860716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mF/9AhbFaWy+vBCE+sic1C2hAqKkKmrRtazAAKk6boM=;
        b=X2ndQ6L9qC9pVy9jOqF0gdA4yxKqqg+HaICzLmhcC8Mh9NvVk5PNImzL5xEetK4TTK
         QA6/WBa1tDcUjnIG3rn6vyMWIgg8siwwQTXs9gcPizacFaYUuz+l0OuY8YgYifSrE03e
         30ktRiKmiEbbd5zCQA1wKxvJZ++iD2XZDKWzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777255916; x=1777860716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mF/9AhbFaWy+vBCE+sic1C2hAqKkKmrRtazAAKk6boM=;
        b=isO15SAzCgsRRDz4nRjYhA/suu8TR44l5/oJQHlUfQkMGaCiRVcxDxCve3BEVd9xwK
         lK09ua+0Su7+zGSE5C3D3SrJ4EWjhmWBrABo7fohPcNYFH1X3EN9HYREXA5hGr0/MDrW
         aoYHr+2G3wzcmW/6Cbaoq1tEZc7B8utVEMlveIj59F+K73o1iFBmZB68uZWRmBSfWKPN
         RPB92V99Ed9MPaa7SyBuEk/b1MJlEs9392qJ76N8wvkFdnHCcQAZl9WeMW+JfCFR5LLL
         +BM1SMP+pkRm+H3T/Ng+70Z0IaDJnpRn0dufjl13JNdTRL58596DloJD1K0xZAc1ztyu
         mHQw==
X-Forwarded-Encrypted: i=1; AFNElJ9Wnnfm5n1nqoWcSEgVTCkBB4Aq9tPxN4bWyn2Ku5IjnQ5zAZ+6ehBurHV4OHLC4HwA1LG8Wc0QisP+Px1FnbXa@lists.infradead.org
X-Gm-Message-State: AOJu0YyfFpxB0rsR0akWsfLn5YQf2JOHzXjM4PiveXJrIYV4VWRs26Dw
	aAKRz8rz8kTVPkNMHnzA7NX7L7j8eNc86h57Kj5RM+qBMxEZJxKDfTe3UQIcKiMOaA==
X-Gm-Gg: AeBDiet+qTstBZcTU95g0Y9c8BlYmma7tH0sLjO3JI4apYf5WbZGHXQIleb90mBU1WO
	mAQ50i3fcTCAkCedHUBkfFph85I3ACPqiW142kdJsm+Qvqc1zrUds7Wnv1wFSxlaSOO0hFiDmWL
	RAiicf4fcpP/PSOxMAFMqFxuTLPv2RVvdOJO82VI4qUOmyQcpkhkmuT+vRRLRvHG9zoczQo4BMT
	pBumfP+xNYwLv7ZPIJfonxfKyRWjTAZgc+kEzUkGYAzaKvk4joSOc4ysH31x2VddlX43Gy7mR4L
	2gnRxrvDma1HTsyxR/XGOnBNXqvliSTR3IM9u864EN1IOPGbzBdRA0uFGTESlkb2m8bbxFNOnLy
	H/j4URPzcGDH6EfCVElLa+qKu/yhBgllGA8pszqehe59GjkXe/ChMxLZ+SS/+Zc06SZmZoqWDPw
	EoBZV5VUHDN/E2sRF7PGf8v58zxDXy7zIczIZW7BvEMJ5a58qISarIWML8KBJ6ltX3ElNBUt5DJ
	JKriNSabRb2j7VlfQs=
X-Received: by 2002:a05:6a20:158a:b0:39b:abdc:4215 with SMTP id adf61e73a8af0-3a08d68e0e4mr46011148637.10.1777255916491;
        Sun, 26 Apr 2026 19:11:56 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:8f3b:cb24:e20a:84bd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e9d2fa9sm31234668b3a.16.2026.04.26.19.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 19:11:56 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hao Chang <ot_chhao.chang@mediatek.com>,
	Qingliang Li <qingliang.li@mediatek.com>
Subject: [PATCH] pinctrl: mediatek: eint: Drop base from mtk_eint_chip_write_mask()
Date: Mon, 27 Apr 2026 10:11:46 +0800
Message-ID: <20260427021148.2049555-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_191157_527748_44CBC5DC 
X-CRM114-Status: GOOD (  13.92  )
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

When support for multiple EINT base addresses was added in commit
3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple
addresses"), mtk_eint_chip_write_mask() was changed to write interrupt
masks for all base addresses in one call. However the "base" parameter
was left around and now causes sparse warnings:

    mtk-eint.c:428:44: warning: incorrect type in argument 2 (different address spaces)
    mtk-eint.c:428:44:    expected void [noderef] __iomem *base
    mtk-eint.c:428:44:    got void [noderef] __iomem **base
    mtk-eint.c:436:44: warning: incorrect type in argument 2 (different address spaces)
    mtk-eint.c:436:44:    expected void [noderef] __iomem *base
    mtk-eint.c:436:44:    got void [noderef] __iomem **base

Since the "base" parameter is no longer needed, just drop it.

Fixes: 3ef9f710efcb ("pinctrl: mediatek: Add EINT support for multiple addresses")
Cc: Hao Chang <ot_chhao.chang@mediatek.com>
Cc: Qingliang Li <qingliang.li@mediatek.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Only compile tested.
---
 drivers/pinctrl/mediatek/mtk-eint.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
index 2a3c04eedc5f..47ac92ea98c2 100644
--- a/drivers/pinctrl/mediatek/mtk-eint.c
+++ b/drivers/pinctrl/mediatek/mtk-eint.c
@@ -246,7 +246,7 @@ static int mtk_eint_irq_set_wake(struct irq_data *d, unsigned int on)
 }
 
 static void mtk_eint_chip_write_mask(const struct mtk_eint *eint,
-				     void __iomem *base, unsigned int **buf)
+				     unsigned int **buf)
 {
 	int inst, port, port_num;
 	void __iomem *reg;
@@ -425,7 +425,7 @@ static void mtk_eint_irq_handler(struct irq_desc *desc)
 
 int mtk_eint_do_suspend(struct mtk_eint *eint)
 {
-	mtk_eint_chip_write_mask(eint, eint->base, eint->wake_mask);
+	mtk_eint_chip_write_mask(eint, eint->wake_mask);
 
 	return 0;
 }
@@ -433,7 +433,7 @@ EXPORT_SYMBOL_GPL(mtk_eint_do_suspend);
 
 int mtk_eint_do_resume(struct mtk_eint *eint)
 {
-	mtk_eint_chip_write_mask(eint, eint->base, eint->cur_mask);
+	mtk_eint_chip_write_mask(eint, eint->cur_mask);
 
 	return 0;
 }
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


