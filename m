Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38391CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 May 2026 16:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1LQUsVu/FsRAKce9MkHX/nXfxhg+YMTdjR29j70GgRM=; b=oEX53SAsTnLaQijTjM4vaZmiTp
	ymUJRTPSs7be2ChhVj68HgSxREBw52GgU/a0mxUbmDk9z0fWm9gRPR6bEhKISgbh/VcSdxOwxySsR
	u+7G51OmTidI2QH7QF8DXnlp2SGZWWIqxp5D4XNUsgC+BzTFdxT3ncGTne9219tM+llU7Zt+T3kGU
	cH9980mTo8Ag8xzJPqIWfG78BdjUu7kBL/6eMX/yCXM46ChjiVONHhevBTofnZIADkc9w0Lua1Xdt
	xvTpUNUBOmYrWZEzlhlr+7xga2Ee65ymW/y+pemymeBM+//c+7FmeMUqVk+LpMOb1NTcZkASJwugs
	n+l/W8Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTixD-00000009kLu-0KhF;
	Sun, 31 May 2026 16:23:59 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTixA-00000009kKy-3AZw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 May 2026 16:23:57 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-68b482888c3so4470253a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 May 2026 09:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780244635; x=1780849435; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1LQUsVu/FsRAKce9MkHX/nXfxhg+YMTdjR29j70GgRM=;
        b=Q3OJ9gAb9QzOhCs/vKhPs3NKM5hkU0bUw2u3Y90jQO83T76F5WcnmT+GsJYj/g5p4Z
         Fk/myYWBqUFleGZrjDP/rOLS9R05PPfFilwVocgRw8/XrbpJHk9rLP/lAz7Vwdfxq5+h
         7OtMKtg4RiR1RcHNwNGTiW9uLv5eQwNwCDro450YAf3bDURUeUVuu0xuNs0Amm3SastV
         izOJIgdeeXYgtMsnqgvbO/AkJRpCmL2VUsCbAbogKEF4ENSeo+SbXaYZ0DMWmnrJ3kvI
         zEeLrgAC4NsNZHfTX9uHjl/KBh8SR7DoDEArOIpZ/4FOMuuA8CKEBQtKGbfNLhJT3IWn
         +feg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780244635; x=1780849435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LQUsVu/FsRAKce9MkHX/nXfxhg+YMTdjR29j70GgRM=;
        b=OKMU1YK5wiN+55/D4w+fejvgMG+LLrGeLEBEYhvoZFGhb0Bh7d8asqIB1SoIl9k9td
         suwSGQgQK5pLRZI95mz471CKAS0jp1K76fOI53/8AVrs8rOM7/8qdVZbjZD3T4Prwsul
         WxFmrFLDgmLUvozRzxTZ8AXgt5crGgVbOt+/Ccs8Ew7XzDIH8lKUHRy7zI7LglyPQbHn
         OdindV0Dfu7EFM8PUQ/jUmXWT+BHcAXejDj/p9OHOo1a1cntluY0CGTD5Eek+2gshuFS
         ZMtifnnWCmCGhaPk+KJxCI6R+c8LNbERFclY8ayGU37DdqxStLp4iqPYt6S5F4bmWRHN
         y/Sw==
X-Forwarded-Encrypted: i=1; AFNElJ9PtD5XMKCAet1adov1/NLvgI2c4DEc/wiXU0L1ffpTVNZ//79n2S6QhchQVvCEs7Lq7y3htTqw2N+vvh7sY4i+@lists.infradead.org
X-Gm-Message-State: AOJu0YzfWsHwh9WypV98LpXJvnTBRPc8xR1d9ZeQWaT1hgFyAA/frOiS
	jSEtqQqel07g/ZgNuKAL38SIK7VbENbK323PSjPELoedqqAOtcydiXPK
X-Gm-Gg: Acq92OF+o6XNcVIDJ0W9aTINt4mFaA0HUJCkceYLx9ssn6YtULg8gxWODThn6kRhKTz
	QJiKGtT5EjYYKu3jbisqBFScHTIoAmL8GHwRDCWpzpAp5MvL0RY3BTlG1Sg2VEUoIDOr6yRpZ8s
	eCaSq6V9A7/FG8UgXqC389s3RFC43Xoy5Ka1RG3cFRzh1z3iTVnPAabWG3xbyUWQLmRRvaQ71F3
	+vvZoAYqJGqo+lKsj/vj3jRhqdcWfzETvvIC5Z+PtxK7AT9rgyUBzJkC/TNN6LWqipLfgtTyDGv
	0t1oR8vG6btjjJvvyqDiSWkuT4+AwkW7xMP7lT7qyHCthUkjU6PKcg5BD2HPXMx9PU/LJenclL8
	O0h1AAeOiDIoeip9RrZfHjnGXMG40s+f+q6gKlZm9AFgWAfimNUccw9hgQ2T21NpH7b6AAmpQLd
	NrnVNyc97XcGKgdNh+9Nir2TJYiYHR07ncWnEycyj7u7QHvcBv9C8VOvBate73CVyxfnf/
X-Received: by 2002:a17:907:d1e:b0:bc5:2352:555c with SMTP id a640c23a62f3a-beab2372384mr305413266b.14.1780244634733;
        Sun, 31 May 2026 09:23:54 -0700 (PDT)
Received: from localhost.localdomain ([77.241.232.0])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-be9d2de536dsm239985766b.15.2026.05.31.09.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 09:23:54 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Fabien Parent <fparent@baylibre.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: mediatek: mt8167: Fix Schmitt trigger register offset of pins 34-39
Date: Sun, 31 May 2026 17:23:32 +0100
Message-ID: <20260531162340.5326-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260531_092356_796257_E8CBBE50 
X-CRM114-Status: GOOD (  11.51  )
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

The correct Schmitt trigger register offset for pins 34-39 is 0xA00. Value
was verified with SoC data sheet.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Fixes: 82d70627e94a ("pinctrl: mediatek: Add MT8167 Pinctrl driver")
---
 drivers/pinctrl/mediatek/pinctrl-mt8167.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8167.c b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
index 143c26622272..c812d614e9d4 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt8167.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
@@ -244,7 +244,7 @@ static const struct mtk_pin_ies_smt_set mt8167_smt_set[] = {
 	MTK_PIN_IES_SMT_SPEC(24, 25, 0xA00, 12),
 	MTK_PIN_IES_SMT_SPEC(26, 30, 0xA00, 0),
 	MTK_PIN_IES_SMT_SPEC(31, 33, 0xA00, 1),
-	MTK_PIN_IES_SMT_SPEC(34, 39, 0xA900, 2),
+	MTK_PIN_IES_SMT_SPEC(34, 39, 0xA00, 2),
 	MTK_PIN_IES_SMT_SPEC(40, 40, 0xA10, 11),
 	MTK_PIN_IES_SMT_SPEC(41, 43, 0xA00, 10),
 	MTK_PIN_IES_SMT_SPEC(44, 47, 0xA00, 11),
-- 
2.43.0


