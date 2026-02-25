Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C4AAFD376A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 16:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ddQboShUAU4xr9xh3nmF5l6YT/z5QDVdd1na5dDuboI=; b=giMeVu2rbSj3IFo9/Ewkw4CHZJ
	6Z6N70ga723KdU05kioZ9IetBErVKilKa4hBJb5i5VBe7q5XR451wMZeXX3MBFf2YaHjkEQztDiZC
	VLN/oWDKjLIu6IUxCHgP2lMflgicLZ1xuyr9xPqG3doG0MVj+XbPDST9Y5D+cyW3tSMY9hhyv0nQ8
	14ClpX1SyXo+d1YZ39p5g4mIDxS8o9DTgLaGKtomPOkl7U549znbleuoZh6On9lykVUkr9LpLmmGt
	8wpXbfnRy2t+OHv588um9KkpIqgfQZD77w0Qk52PZZHJYn3Rbq97Xuq0tVImmTD9Go60LWUqsVSoI
	sbDwwk4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHpN-00000004Wuh-0lXm;
	Wed, 25 Feb 2026 16:33:33 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHpK-00000004Wu0-3rc0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 16:33:32 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-358ed90bcefso1138091a91.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 08:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772037210; x=1772642010; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ddQboShUAU4xr9xh3nmF5l6YT/z5QDVdd1na5dDuboI=;
        b=m7abO92IbhnFxgFzeaOdozz8Bv4OLQbHFJ/Z9Ke0GuSHCId3o1/NRn8gnEJJZC8OkK
         +JCRRfs4bp+raxpN8YY8FjhwTyvLjAnMoqxLCa8LqZKwAK3oeMFzlVFDbec+A7//OruB
         R0TRLnzsH/V1dCI/rEnhevREeYbWdeTjUMNxpOOjx0rGnp9skFtsRQ51vltLwU4fF4up
         0vj1iYFV+VbEmEHVsuwRDi0LaemXkn25LvzS0rLSTplMPVdmdGAj4OLljS64VH2iA+9B
         jE/KIaEX/MWZpml4a1VWcLtOYW4g3XdFZQA0JDH5rgcm6DDJghiRIx8u86BaAbpJCU6Q
         +TcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772037210; x=1772642010;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ddQboShUAU4xr9xh3nmF5l6YT/z5QDVdd1na5dDuboI=;
        b=McjIzI6DmO+HnPJ9hVUfR5aNAZGxFz7zgPD4PND9wAtNysDVdqUORZbKTUEq/w/oOB
         tyPuOkkO7OF/V+ysV8wRS8Xp0vz6+Yi8H0iO8OJmXS1627sA5XqVyJK//iaujO4rUhns
         30NOz7OW6MyGKA4jUZgyc66EGbjoWEt03cVut5Z14Ia16PBspKyE+DAdvIfkiK/gkHzG
         7/Gvy6D6XiLXfSHP6sZmDMT6Rhx1AixIb1IHtpEa+v+ruyxXn03FpwJiCs6dcv1dqDff
         dsLDdy9Tollpg2zfJbn9CSdjvGdYd9UkENT81lkBPdikL64h/v8jNUAhMeF9ojFf2AMI
         s3Tw==
X-Forwarded-Encrypted: i=1; AJvYcCX1gtXLoqrT+AJ5hj/D90ZGKRZMqkHMUJXIQLYQFWv1Jg6yp7s7gCGD7ciGYrQTZ4VcF5bRUJ4oTyF/6qubgAq9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6nEZR9jG60vVspQzGrJCJ/cVfArZrvG/KLsfsQxZXFAbd+k5h
	7JWJGKa6KbatNkyyz6IUvT/IKYbE+bTEmsntoiZ+/qYRqoBwXZeulhJcczg9GA01
X-Gm-Gg: ATEYQzyzZwXEeG3ChBrinXzbTfmOhMF9rAhskW4NW+US0JbpouFxsOBKuByLMCHNqFq
	oArVYcaU4IvvjDOBsBWqe04rW0T+5649qRUBf6nx7Q+ZhCDHCKndND689ky2vxpYCWPoYlewaE5
	ehZy0FNOMeAvJEMaC12iR19Fje2SyvebjJEdIdHAyLwxMJFyIbseBK27q68PTATIY1cXW7qKHZO
	zdMPX/3WoXcudOcxyTD4T+Dlr7l9RjVvQjjVT3xozWqoC5ZzGxjQgCa74XYKpnkUlEuNFK+LfGs
	EQuNOaLCPjdsY2nN59oLBl6jPVaubqp0IuXIv8RoRc3UiLr9CvMyxVPXteDYshbBT5equ2O2wjF
	YbCb/x1n2D/G4W3cO+DKJWhOdlNxtaxRO7/ih2pxsn/48dt0PmIPNO3EDkWHwAes1GORCaxxHXj
	OdzV/91NbmI9/ZvNARZF+SKJ2qYlnUi6WU8z3f
X-Received: by 2002:a17:90b:4987:b0:339:ec9c:b275 with SMTP id 98e67ed59e1d1-358ae7e86a8mr15320596a91.6.1772037209583;
        Wed, 25 Feb 2026 08:33:29 -0800 (PST)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:55d9:d867:54ea:d951])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359037af167sm3335665a91.15.2026.02.25.08.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 08:33:29 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 26 Feb 2026 00:33:24 +0800
Subject: [PATCH] mailbox: mtk-vcp-mailbox: Fix the return value in
 mtk_vcp_mbox_xlate()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-vcp-v1-1-766c5877017d@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFMkn2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDIyNT3bLkAl3jRAtTYxMTc6BgqhJQZUFRalpmBdiU6NjaWgDxwXc+VQA
 AAA==
X-Change-ID: 20260225-vcp-3a853447202e
To: Jassi Brar <jassisinghbrar@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jjian Zhou <jjian.zhou@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772037206; l=961;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=W+jP3zwPXvbN6VQlSiaHn6aD2hpSIbT32Oq/GSFkHGI=;
 b=A/kPlRCS6V2E+kcdMjDircq5UF5u5qvwoxlGCWmLXVI6bOhw4nyn1gIgaR/jjArtEVtu/mn28
 cAgO0P9PlqYDVFsfrrdx5LSusYs0BjvWhrCnLB3brTGMgo5KtRrD2WK
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_083330_967574_0CCB5F98 
X-CRM114-Status: GOOD (  12.24  )
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

The return value of mtk_vcp_mbox_xlate() is checked by IS_ERR(), so
return NULL is incorrect and could lead to a NULL pointer dereference.

Fixes: b562abd95672 ("mailbox: mediatek: Add mtk-vcp-mailbox driver")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/mailbox/mtk-vcp-mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mtk-vcp-mailbox.c b/drivers/mailbox/mtk-vcp-mailbox.c
index cedad575528f..1b291b8ea15a 100644
--- a/drivers/mailbox/mtk-vcp-mailbox.c
+++ b/drivers/mailbox/mtk-vcp-mailbox.c
@@ -50,7 +50,7 @@ static struct mbox_chan *mtk_vcp_mbox_xlate(struct mbox_controller *mbox,
 					    const struct of_phandle_args *sp)
 {
 	if (sp->args_count)
-		return NULL;
+		return ERR_PTR(-EINVAL);
 
 	return &mbox->chans[0];
 }

---
base-commit: 3ef088b0c5772a6f75634e54aa34f5fc0a2c041c
change-id: 20260225-vcp-3a853447202e

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>


