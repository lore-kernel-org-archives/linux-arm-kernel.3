Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC28EC1112
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 17:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4tprEZO19LVPoDO66HWFcNuv9Wp3nvVBibsZ70DTJ4o=; b=i0TFmKjRogM53zByx83weiuXHz
	M0cIjk//CaznQc1Ly4fFUXWwbhfiY4el6dIG01z+RdtNSoWWgiuQG+XOfULFUkI8UnPamyrRKS1MJ
	l750XyBbWF34AJqK46381SKs+vP2SmqMrwLIX+fBvtswZQfskK+DCAn2ndnm85I4OMCq8Lb2o8SNP
	O83Rn04V9IjBMyvNFRgIFw96FGym18vqnrrofITAS6l7AhXxzHRisB+v7IlAYS064IKW3YhBPVp52
	fSbMfU/BlL2n9Q8DL3XZd9A4XvxnT7y2WVbn0jtBIw+3Luh9W8UC2194RsEreqYOG9/442Y9Svj1F
	aFVJAWpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZZq-00000000kRg-0dDc;
	Mon, 23 Feb 2026 17:18:34 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuZZo-00000000kOq-0PHp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 17:18:33 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4362c635319so4053459f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 09:18:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771867110; x=1772471910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4tprEZO19LVPoDO66HWFcNuv9Wp3nvVBibsZ70DTJ4o=;
        b=b4sstQiuUnVtDWwAVcE0pq8eY1xv13BLeakpnUxvzxF4n8dsDxteEY88NwR0RpcNXO
         TEp3zz0Bktpk9xX/HDHfJEKIw0ZVdj3+8rNmkMN3oc7RclLkfAMxeZg1HjiXKamdGqGw
         RicnZWEamrVUGrfvL+n+Ab+AmAykut2KUsbtqzDjYjkzZuvF9jvJo1uELitJBuqFQr3a
         neW2a4QUiPNQ7un+LW8jlykKKjD7KW6SQ25g0IpIw4bsbLBY4e1VVZDaaJJvk3hfXnRz
         xXrZ20vLjx52nm+ITBsQIEwR10IPLHoO5j3lBenNKuFqPuEdTgqyGMUdPH6IAELY2U59
         gCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771867110; x=1772471910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4tprEZO19LVPoDO66HWFcNuv9Wp3nvVBibsZ70DTJ4o=;
        b=Su5eniX5FQNgBQYR9jH1NYy9IXkjgla1pt2yH27MN186xZb1mnQ10D35fKRDLXfiDk
         rMdDTguhKwRuhyF3IjyhedTnJTa4+ftsf27uj/ComEOzqVbGOo+MGCHHAJjHWdnb4UPA
         sumuv5ZTgFUhprsMn7Az6eURHoykkdclmSMSg004R4vId+GPKSCwVzfKPpXj/X7ydKB8
         +JaNe8J79lHSDlRFZm7xeyksMqiSE2AFRybMt9Z866/ai5z+jXqbimWL/PTeXn3NvW/o
         G1zAdrkaeP4EOYyWW3WRyeCeExg7BSJ5sBUW5IhfmsRSB9LGLoFjIZCa4LciooNgBIg4
         7opQ==
X-Forwarded-Encrypted: i=1; AJvYcCWncogjdHb0ECTDN0c+NKIsFJrI81QeEev8Abydrh0CURirQ1YRYYVl3Cl3rhP6gwqTXRlZVWtl+wT+mZgQEM/9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3Q2An9kIbRymibwjuN69vEC6NZuxJLmK34Rg8eU2z5xP60HVW
	NZFhAP7X4+guqbaDdz0kkirNBUEIyRLOtmmtXNC512/YxXOVoW2VrkRm
X-Gm-Gg: ATEYQzw0H57B84keKlZUzgqJ4OZv7wJ83shDF86e7CBNKsuSzkpp8Hais4eGp+mopPm
	v2vxToAZGTj9c+BuMz0gGVtTdctf2TelsdV5mv1y215ntLk6MZP/lA1DipqSiWKEsy+/jlfbw59
	j7WehzOK3HPCCsqHVRe3Q1gdWmYAfIfOjA/6rxsiDKn1yU1RMp/pVPNp7k4aHcl1xB95VFxh7tg
	yjbMJt4SUsNStpsJVpFhmF48Dki54EJXu142GSc4ZgjWjv1fTNMc4tP85tBNwWiyGk9KSWQNEat
	Gj1foGRzGAUaadj6zF711+BuTkZWsMKTWXpbI54wN5MBYZaEXRZ2Gx2fB7uohKAl560jzwM4Kq3
	P5wn2/T1HetEC40nWAO33gGCbjm6ruf4ZPrce5b3LcY+2IKQRRB6rThMb9LxrtJzE20ryH6+wcP
	EVBvjXCmFcXVjO6wTtU78=
X-Received: by 2002:a05:6000:2486:b0:437:81a2:46eb with SMTP id ffacd0b85a97d-4396f17b1b8mr18714978f8f.41.1771867110323;
        Mon, 23 Feb 2026 09:18:30 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c982sm20871454f8f.31.2026.02.23.09.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:18:29 -0800 (PST)
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
Subject: [PATCH 8/9] rtc: mt6397: add compatible for MT6392 PMIC
Date: Mon, 23 Feb 2026 17:12:47 +0000
Message-ID: <1d7d0048eb2d51c7b5551deb765951d33dacfec6.1771865015.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771865014.git.l.scorcia@gmail.com>
References: <cover.1771865014.git.l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_091832_152548_D7E78761 
X-CRM114-Status: GOOD (  12.51  )
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

Add a compatible, using the same data as the MT6397.

Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 drivers/rtc/rtc-mt6397.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 692c00ff544b..6b67d917f8d5 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -334,6 +334,7 @@ static const struct of_device_id mt6397_rtc_of_match[] = {
 	{ .compatible = "mediatek,mt6323-rtc", .data = &mt6397_rtc_data },
 	{ .compatible = "mediatek,mt6357-rtc", .data = &mt6358_rtc_data },
 	{ .compatible = "mediatek,mt6358-rtc", .data = &mt6358_rtc_data },
+	{ .compatible = "mediatek,mt6392-rtc", .data = &mt6397_rtc_data },
 	{ .compatible = "mediatek,mt6397-rtc", .data = &mt6397_rtc_data },
 	{ }
 };
-- 
2.43.0


