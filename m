Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE85EC110E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZL3Fp+qjeYQN997X5TZmi0Oj1feAEcYEmK2ad84vbQ=; b=rPonsI18SkqYvfrNgfKPFkCuDX
	EluWcIlF5MLW9XokHYiKVC9aloShj6TTpMrhQxvQwkL5N237uI+V+tLuuTM4Vq5iOlgLkyT5cLm8b
	rGymi2cohvyKl3KAunPeFG/HZOT6JxF2huxYDT2ojJOlWxNR0PHyw85OdEsLe2KkUV/1bup87Q/iu
	A0s2eNvwrl0ODQEXKg5gPxKziIcU7+1Pn7wE6PzXYfZUg+6LpUmMKPZBlaf8PKAWHksz1Zs0Kcu51
	dLJULvh4h5zLzsK7O9YvPJKiMvgU7dA3dxomZU0hEl42yTFiTGFMSB7f25HPCGfLqvTQGxi+4MBCV
	6sYBdqPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZZM-00000000k8H-3w8j;
	Mon, 23 Feb 2026 17:18:04 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZZK-00000000k5I-18Nd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:18:03 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-4359a302794so3421206f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:18:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867080; x=1772471880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZL3Fp+qjeYQN997X5TZmi0Oj1feAEcYEmK2ad84vbQ=;
        b=LqPiZ0YI124SfcokWvuJoJ4+Yr/9ImCJtKERcK/Ri53Py3lyI1mMxt1avfp49689Os
         8Giv7VP/7laTOBmwnPErk2qR75T4+vqi4VeAy6AqZyHpkU8mC+xg4J8EJeHb+UIuYMWQ
         XJauiX4uQYFfHHVICFjjZTnL7cHFkAuiBGSeYsXufyGbEV3TpWPiUtQyWFrbLfRnRyb6
         ieSVg628e9n1kmGtmRQGSRzLvPhgBynEdx/K/vKeDjPxwWFbeGK5biKEgy0z8JO6cCXz
         z3DkGEDbp70dcorluYMve79rhoSiWzU4RwOHGGA4ND+v2tKXSAWND80aR+HRTO4gLpoO
         LIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867080; x=1772471880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GZL3Fp+qjeYQN997X5TZmi0Oj1feAEcYEmK2ad84vbQ=;
        b=fBev/NeyD8A/BY8QswcLZfiM1XYldpmbMNUNo4v9asSrCuObCRR+oCG0Dm8x4mmSM9
         kv+usEe2O94O+TOWXBaUoO4r0E6bCkcMCc9nTWdesohlSoi7hu5SsI0HurVpykMjsdCG
         Tsrty75Y4fI+fTXkmwDdDQViPR7rqnEfhGFEbKeqzKVp0YN8feDyf55Cm6Vr6bjEhsPS
         jnyx+j4TwHh3Pk6KuAYdraMJP8AX86h9uGZojLCi1sO0yjr/azVGUcqRUThicz+Wt0EV
         NyifYJjMbWcyOvMpiU0mZbapfzq2Kh3TicIYdLVJ5N+f6i8gcWuvNlUhKt4VzQxqBm++
         yPow==
X-Forwarded-Encrypted: i=1; AJvYcCUakWcLcKs8XiXWiD8xfOUU9mr1r+ML7RiHFiK6CP6o6CeAwYczjwOG9Ff5kHyTpaal1V4Do8varwzikzdPrCcY@lists.infradead.org
X-Gm-Message-State: AOJu0YzjmGjgXnBDQiLA+Nlsq6qMi7INteWfa4k9mhAFYDMziNt+aFcK
	6Gc5Z03+eDyVZ0N/g0PgStDAJkGyiRTmGUGKaqdpj6IRqP3Mp4QNwPc0
X-Gm-Gg: ATEYQzzRPfNCnSZZ9NLE9L0oDhQpbUqQ5QsXi6jCKT4Zqlump4S+PulB8gffIuM6XzM
	Fwo5Lv27oh0dMhqGQxkQEoNQ8hjfb8nMiK2v8FEkrozhE4vz9f90UIND4CJAUJ1N66rTS/eYKbY
	6CdKZMA9XQGhP6B9aY349JkJl97QO8NOWCiFKxA6njnTriIM8Ldv7oR4TSsHZfR2vuVfgPHi7Kz
	RVlunXLl7Xo27oCJp8F/ToAUf2vKw+4Q5WIbnPgBPW6bDZqghklSAx6qLbIhsdw8hW2HG2uSxwp
	JDgW0Pey4t646Dt+JAtIp3tVONxQmzQImIy9lZlW5RYeyZm25pXhTezRAy/uRzDgFiLISxMRTKx
	D/8RK4ZxhDkiVCKM6SXXH/yrLrItzIXK8iKa/qkA39CQ/aL/ad1Sc+/xHJBfadFMwU3DLO7YCnm
	hnaG/3p2uQO0UcpxYsHI0=
X-Received: by 2002:a05:6000:2583:b0:436:145a:e54f with SMTP id ffacd0b85a97d-4396f169c6amr15272283f8f.24.1771867080189;
        Mon, 23 Feb 2026 09:18:00 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:17:59 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Eddie Huang <eddie.huang@mediatek.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Fabien Parent <parent.f@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org
Subject: [PATCH 5/9] soc: mediatek: mtk-pmic-wrap: add compatible for MT6392 PMIC
Date: Mon, 23 Feb 2026 17:12:44 +0000
Message-ID: <06b45142f4e6a30f9f53aa561a99b936ff72c035.1771865015.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771865014.git.l.scorcia@gmail.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_091802_344967_460C5E90 
X-CRM114-Status: GOOD (  11.98  )
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

From: Val Packett <val@packett.cool>

The MT6392 PMIC is equivalent to the MT6323 in terms of pwrap.
Add the compatible to use the same configuration.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 0bcd85826375..4b8d49c6f34c 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2249,6 +2249,7 @@ static const struct pwrap_slv_type pmic_mt6397 = {
 
 static const struct of_device_id of_slave_match_tbl[] = {
 	{ .compatible = "mediatek,mt6323", .data = &pmic_mt6323 },
+	{ .compatible = "mediatek,mt6392", .data = &pmic_mt6323 },
 	{ .compatible = "mediatek,mt6331", .data = &pmic_mt6331 },
 	{ .compatible = "mediatek,mt6351", .data = &pmic_mt6351 },
 	{ .compatible = "mediatek,mt6357", .data = &pmic_mt6357 },
-- 
2.43.0


