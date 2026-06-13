Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6826ECD98CF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 00:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Date:From:
	Message-ID:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9jZZatEXd/JafvuiFH5stqy7hRhy8giY4fPvDzpd45o=; b=kFHaZUFH5kDS1hh4keXzWBkzoq
	o34ej7pxKVJTE5xOVj+gDq8ZxzNdZQb+nrHwvCTKGR/8cu8+EmhqPVM3WMMRZ8235zMkMB2ttl4AE
	YEuBJrziTBtZJi8hvT0Mu8OKir6i1brokNxF4dgrbrjhV4UOWtZITWG8Goii78rLhBd6KpSjL6MhF
	+8ThD0hN3PvUSxI6V8fapV5wyXNPr1n3WvoMTneo9qmcumwhcxun6OxIbdIeUCoaYOfQSjq+Eoy7W
	AjX+tuJiGjOMECmwdRpjliaGsKV25P+vevbZJNg/XjbqGkkq8bGMPA35xLmKUB4+GE6nLEO0H55YU
	ab/TL1Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCDO-0000000Bpfo-0VjB;
	Sat, 13 Jun 2026 00:27:10 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYCDL-0000000Bpeu-1Khl
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 00:27:08 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-36b9b15af73so1498336a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 17:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781310426; x=1781915226; darn=lists.infradead.org;
        h=cc:to:subject:date:from:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9jZZatEXd/JafvuiFH5stqy7hRhy8giY4fPvDzpd45o=;
        b=WM7a0JNxXaE28nw/TPCdJyXnK2Ykcz7B8sDoppXzpbn/JDK9GjWOoaXrAt/efv5lhD
         Vy5tVZGBejRbCqDNcBbK2A5AJryOn+91cC7gyb0grVj5oZjDb9mmibjFUJ/yBFsNg3XR
         pNMsRTYetoTyEa9aLPmOlvayzkL6A2VnLvXhe9BsrEX47lzOvWm2Hs3oBFWfUd+bAb2N
         LpHNnS0RTEi68kGn26XmMh0T4556l1KXXWj06x9KqxAaTB6WSnsPPfF7AVvBJltiLUKn
         XlciNXw8LwWcZA9N67GO9dnMYzFr7/mkf9Z0FsTFWcReWufc+W5S0PmG2YUnb58dBzCJ
         b+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781310426; x=1781915226;
        h=cc:to:subject:date:from:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9jZZatEXd/JafvuiFH5stqy7hRhy8giY4fPvDzpd45o=;
        b=brLKWtZVUwzP8VKaRxfaMZjuFmVdtV8NKOSy1kCtZz8T9IGNOZ1pIKt94podPS+jqK
         WA2Al9H3ggndJ/HS3z9TNPA3/vyVaz8dXsM2xDRjHsNYoRqZ76cPk5N/aj0qmOF6aNAO
         0aorIspL8BATOLdS0Uuy80wHg2e3n6Caj9Kh/WhifXvKRLCrDmbQA4Fs0UWHBW5sTIsg
         4FvgoyRbmdkNsVErOaEQMTpqvupxmAQptNFu6B76DWh6sc+MlXJZlK41OCwyJ/Ih/cvn
         hSx+Zsb6p2j6n0Vy+JeDTzelKMyXVo+mUk9nFbv3XRYU6A9AQDp584Mwy+2IOVVOW9DA
         TVog==
X-Forwarded-Encrypted: i=1; AFNElJ/vPMx5yjnK2TYjI2kQHkQ6a5YIuG+FxrXFoJrRmg7y7Shmm4mLAjfjsAm5FxoV8IZTYQYdB77tbq1UkVUOigup@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1570s+dg06NNccOvQdKUGUDiW7WvDsfNthEu3e5Ud0p8FzKJ6
	p/ZM7BaIkTCWHZRt9WoBmTlmAhlCvbSeTUEFeBJiidfR+KOdSxJKmuCeWehN0Yhk70Y=
X-Gm-Gg: Acq92OEphP+Jz9GfirtRfE7rO3n0EZgmRw580NZejBrbQDEMxl4dA1vXt5GiwqFYhpJ
	hOmizsID95FRCnPNhXdtEQBIjsOdjA36g/7C2dWzVuYv6xJvGUBiae6tFkk51Ko4D1rkFem8/Vt
	e4Z6KvwPTPNGoKoi7NGyFmqT7g+BZmC/UXPBpLSzHSf7dnlofgT8Ap/34q0L90dkgPe2EhlW0Id
	3XEfzu/NUGxLQb/3HYMYzJuS3B4KViP/Ql2VSk2l4eqjuJsDFfgZYGnsYLNtjVGLSepGHL1+B18
	gcLotil2HI4doG/W1PB8WMZIc4mUkB4JhHx3BKoet7O/GeV8k2efU5TmXHTaIZQAbHljv2XKOvp
	6sKAmKsWYVY2dUqYu4npgP0gURN5GDbDcsmdIYrRwctycAb7kTG+ZNQxtnAe3PE/ubl1bSnqkR6
	XRxwwEpNJ7Mcbj39h/8d1D98YWaZE=
X-Received: by 2002:a17:90b:3d01:b0:377:23bb:9b88 with SMTP id 98e67ed59e1d1-37a033e024dmr5562386a91.12.1781310425834;
        Fri, 12 Jun 2026 17:27:05 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37a1eba8ea7sm3441412a91.1.2026.06.12.17.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 17:27:05 -0700 (PDT)
Message-ID: <6a2ca3d9.ad59c0a6.147df9.2a62@mx.google.com>
From: "Wayen.Yan" <win847@gmail.com>
Date: Sat, 13 Jun 2026 08:22:31 +0800
Subject: [PATCH] net: airoha: Fix non-standard return value in
 airoha_ppe_get_wdma_info()
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_172707_353271_AA896AD5 
X-CRM114-Status: GOOD (  11.41  )
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

airoha_ppe_get_wdma_info() returns -1 when the last path in the
forwarding path stack is not of type DEV_PATH_MTK_WDMA. This is not
a standard kernel error code. Replace it with -EINVAL since the
input path type is invalid from the caller's perspective.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Signed-off-by: Wayen.Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 5c9dff6..7260177 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -264,7 +264,7 @@ static int airoha_ppe_get_wdma_info(struct net_device *dev, const u8 *addr,
 
 	path = &stack.path[stack.num_paths - 1];
 	if (path->type != DEV_PATH_MTK_WDMA)
-		return -1;
+		return -EINVAL;
 
 	info->idx = path->mtk_wdma.wdma_idx;
 	info->bss = path->mtk_wdma.bss;
-- 
2.51.0



