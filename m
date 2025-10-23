Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CF4ACCD1BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 13:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=id+wIYbTFy4GJ5sovEHifiUi3WKFfS9SlpVUAwl/jlY=; b=LJwWgibjguU2uNYgI5wZlVN8fm
	RLIue9NX1u0wksIO719UeyJVrLMiayzQmMsuZ2pELy87eX9JzFZtRdWtkTmMcIr5aqolj65kiv74E
	/SqSUQMSlYJ8WjTNRvt6+W2dmjlF27sqjQRw4ptq+iGNb6njuniEDH6MEFoHXK9gvJznaqAhY6Zom
	IUxeb1P9CKjzIbq7eDwqSHw6Ly6x3dryqjNf6c40e66e9TRq6FzXOYYXM5GXocSSJYGMqkIbe7Uky
	6JRO8tfIOyf4NF6zabQJ/lxt82TAYRXRRfthYBWDsBeSW2jn6PIBqph46lJEVdbM20SDTgYi7IuHr
	NSTcgBgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBuzu-00000006JCJ-3NC1;
	Thu, 23 Oct 2025 13:04:54 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBuzr-00000006JBd-33g1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 13:04:53 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-7833765433cso1040914b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Oct 2025 06:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761224691; x=1761829491; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=id+wIYbTFy4GJ5sovEHifiUi3WKFfS9SlpVUAwl/jlY=;
        b=nAdw2DFPg6E3GmYq5ZGd9608zy+AUwmK7wTkeAT/44lVlxVvLBH1PfQ8UyLtszZV3m
         4mB9N59LnSJO9izKr6WLRitk92gl3A4ujtj2I7pNq7LYwODT6Mwxei8X1O8AecptypDD
         kg6phqBigE8RYvz2OH9X57gaiZ5IgIOQzF5L9Qw2b/YXM+N/yWxeMhzdxOTLU2dDaA06
         LOl1xJqkjgCmzUk9oJzDQ2qSzFWYWBSoI14S83Z0pFMroOzF5Tm1QO/U1XX0Dy19jj9N
         aO4hvw7W4KtiasA0vtBjuMJytetK+6ZMiCvifJBqRFoVtj57uvxV0jFBdVLQMzMdIwq7
         sECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761224691; x=1761829491;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=id+wIYbTFy4GJ5sovEHifiUi3WKFfS9SlpVUAwl/jlY=;
        b=m2vdYJtT1rnXU+meB+eLyFE/w1xWSapQJ4Bf4Lg6n1m1b0Mq9TmCGLM/y9DMLmeu2V
         sZJmZF7OolvC138/61BKnUCclXnE1L665rXK5fp1e7eoDDzxxdukWBo4H18CmpaIh1Sc
         l3jaWDcE37Coyi7liTNeL6RE/hnz9mG/vvSbTLtz92DMwnRbVgdaCJfcWaxvSjiZElhj
         g6ebEn57oAU4WkclT8FfW242IO57OF1xYqAHKxrPVQvbF1uEF2rfODNFQMDZKbxnatPY
         0sFPbN3+Xp3Q4DhBdPKK236mwVwoPjKmZD58du8mQzPCr2X9Dp84Ne6V2kayXAxCG+OY
         1THA==
X-Forwarded-Encrypted: i=1; AJvYcCVaYTdc2aDx2RyQb/pw13onYqKZzQhZ6J5Xk1IxO4a2tcz3ByeT9DssH3l1TYAXEvagfCZJxJa5Mih4Fu2gPCej@lists.infradead.org
X-Gm-Message-State: AOJu0YzQcgjGdab/SGm4AN1iQL3F+NV9kZHsxwdtXVfiI3WAA1KrRTvg
	2EvtciIeZMb/Z/Ztf2otvvPm6Mo8ByEWk6F4mh10xsd9fbk6UIIVKWIV
X-Gm-Gg: ASbGncupsf6E6RG5iRU6Mwks4tkPrU0LJZle3X8U91Gr32d1f90c8DpJPZw1lXAyGxl
	Ayq6gGZH5XHtEVhavqWHSXAvW3iKxeTkzF1Xe51awo5UnI+nRrU1mJVwzlxXj+2OADhoizuEijY
	Br9M8NDaZoNUNLCVTKqysw/dT6QdyasUd9QyrCuZDaMf/1Ubp5F4k/U1Z/02ocq05C6tjWsR+n9
	t02+93PI1s9vNb2cfI8zh+7kdgcIVZd98x6G60KAl8mE7+nRvuUn2E7syFJwZJneb7ARc6VzgDD
	NlAHU3TMknE0PRj5O1C/NleLpinoyuV6ujTnsKSPG8JDZKfhNEaTtidnPX0779J+dZNNUlUxNpM
	FwJ9J3H33u/rY43RcTPlEPIoVBsgYhP0lBkJIc/jqv7TZF9RQ1SDR1j2PmwBmdrwZ01ci/Taxh8
	lqaHJgaCI6
X-Google-Smtp-Source: AGHT+IEcdM7hV7nizE7lspbXruEQ0gaeKJxvv0wIeUknnaa/wTQkABYZuABFdsJHbIclfJ2CGnpjFQ==
X-Received: by 2002:a05:6a00:4f81:b0:7a1:373f:c216 with SMTP id d2e1a72fcca58-7a220a9ded3mr30485012b3a.14.1761224674688;
        Thu, 23 Oct 2025 06:04:34 -0700 (PDT)
Received: from [10.248.7.103] ([2409:40f4:2040:16ed:f15f:ed0a:f0b7:34d2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a274b8b291sm2509346b3a.42.2025.10.23.06.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 06:04:34 -0700 (PDT)
From: Rakuram Eswaran <rakuram.e96@gmail.com>
Date: Thu, 23 Oct 2025 18:34:13 +0530
Subject: [PATCH] wifi: mt76: mt7996: remove redundant NULL check in
 mt7996_msdu_page_get_from_cache()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251023-mt7996_mac_c-v1-1-580a3cbb2678@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMwn+mgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyMj3dwSc0tLs/jcxOT4ZN1UQwMLS5Mki6SkJBMloJaCotS0zAqwcdG
 xtbUA48HPY14AAAA=
X-Change-ID: 20251022-mt7996_mac_c-e10894b8bbb4
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rex Lu <rex.lu@mediatek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 david.hunter.linux@gmail.com, khalid@kernel.org, skhan@linuxfoundation.org, 
 linux-kernel-mentees@lists.linux.dev, kernel test robot <lkp@intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, 
 Rakuram Eswaran <rakuram.e96@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761224666; l=1686;
 i=rakuram.e96@gmail.com; s=20251022; h=from:subject:message-id;
 bh=MZntrYzYxpIKR4lTEuQ8vg90cnWJfjxVo3eqGMp0mdI=;
 b=jgYbQsrBeTw7tVtVJy36z0p2uDhIq4lvHZ86UI3xTp4Zr4APqXvIxFrHqF4MZMKViKRawY9Ky
 POX/j+CfAclAH0ZtDNhHsqHPK1379DlAhezZtod7if6PDUPry4Wh5CG
X-Developer-Key: i=rakuram.e96@gmail.com; a=ed25519;
 pk=swrXGNLB3jH+d6pqdVOCwq0slsYH5rn9IkMak1fIfgA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_060451_776577_8758FFCB 
X-CRM114-Status: GOOD (  11.15  )
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

Smatch reported a warning that the NULL check on `p` in
`mt7996_msdu_page_get_from_cache()` is redundant:

  drivers/net/wireless/mediatek/mt76/mt7996/mac.c:1651
  mt7996_msdu_page_get_from_cache() warn: can 'p' even be NULL?

The function first checks `list_empty(&dev->wed_rro.page_cache)` before
calling `list_first_entry()`. When the list is not empty,
`list_first_entry()` always returns a valid pointer and can never be NULL.

Hence, the `if (p)` condition is unnecessary. Removing it cleans up the
code.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202510100155.MS0IXhzm-lkp@intel.com/
Signed-off-by: Rakuram Eswaran <rakuram.e96@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7996/mac.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
index 9501def3e0e3e20132fdbcfe0b1f489694afdc5f..284f2eea71e5bf0a34c7fe84084d998164a31a05 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7996/mac.c
@@ -1681,8 +1681,7 @@ mt7996_msdu_page_get_from_cache(struct mt7996_dev *dev)
 	if (!list_empty(&dev->wed_rro.page_cache)) {
 		p = list_first_entry(&dev->wed_rro.page_cache,
 				     struct mt7996_msdu_page, list);
-		if (p)
-			list_del(&p->list);
+		list_del(&p->list);
 	}
 
 	spin_unlock(&dev->wed_rro.lock);

---
base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
change-id: 20251022-mt7996_mac_c-e10894b8bbb4

Best regards,
-- 
Rakuram Eswaran <rakuram.e96@gmail.com>


