Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F203CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 06:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yiOQQUNxogiUQyW9juq/yIUpauLJuI5yeb0AGzYfhSw=; b=K8jSsWr/TGY8DWEdO9vAx4DF29
	9HuRe5w7ml9R3VN0TMotW77mhwZkRisewllOFHP7/X/27yzvVY3hAZ3q2TYAopzPVbcUWH5oGYjn7
	KXYYx/V6HpzdKAsiBdvaUMABlNR4VOk2sRMX0ifRMtKS1D0IIr9utbgy4sHr+Fbe26Ky8VTyFjWit
	qVPnkCz3RcT+O4xBEnsZMH8AVWO7pTKHguJqMvSAMjBflLXsxCk6XEVmBLZ06n/OcTyNlkKwoV0mK
	wqA85twjYQf+Ob8KuRfQSOdBryDujOxcq/+92U7xFdYNn83wEKNHNfPFer8szflMfEiMV+C+aB7by
	fKMrupeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4p-00000002Pxc-0jJD;
	Tue, 29 Sep 2026 06:12:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBR4j-00000002Ptc-4A05
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 06:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yiOQQUNxogiUQyW9juq/yIUpauLJuI5yeb0AGzYfhSw=; b=flPeehEVGUsRvpqATOuBEJFrH7
	2/XvVnPlBwdyAetjg/yXkP4bLfdn4amFPD/59OZnxXUw9aaINeUbNcO6/6yDAJtbowHzGFjk8A9jE
	fbZJ4+hu21dhe+ynu97Pd0+dvA5Cf2ZPK5nVQQAL/k765DHh+zsGyg8RdKzWpXLa4CITTZqXUBbGu
	DoTX+NKA4pdTUbPi/5nNQsgGzHYjgj3rTQz3bJubpDt6HpqUyNyKerxqVQ/Q9Au2YdZdrsuPzcNCF
	iDSgxSpbq7LGkAFIkRD+VAuBRwqrydBz1FJFDbdZxGeOeVOoqXpM09/SjcLyKEWmNq/MtfD1huHIV
	KIB1RqaQ==;
Received: from mail-pj2-x0f.google.com ([2607:f8b0:4864:39::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBR4g-00000002EY4-1x9I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 06:12:24 +0000
Received: by mail-pj2-x0f.google.com with SMTP id 98e67ed59e1d1-3a48e359e0fso620075a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 23:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790662340; x=1791267140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yiOQQUNxogiUQyW9juq/yIUpauLJuI5yeb0AGzYfhSw=;
        b=IVmxgLvRcHErDL58JPJPo0SQ0ghykrl7ZOBkWrb42PDK3FFj3/l6tex2HvZYpwLgmt
         kp8lIssrrt/EIyflmVLDHY7VEsILhKBnu7tYXHk8aiGIMVKmgDi6PWxhx/ATXnyBHiRz
         6gclm95gnaqcRUgIvqNJSIfvzd+bD0XBv2AXjXv35lcXOJ6rL6jkRkCrL8HVSM6jn8TB
         NM3aFjzgU84MxWumAY1dIPLoJ2ev9MOJ3Q4Ksm1BGYJOu5IQKulIZlm5x64O0sHbtkYE
         BJwoKfbVDlt80ewe2KElgRmvV8nfM2IupESgnCwYyiPxGfJK6MV1dwIlUxRbDrMSmM6U
         A3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662340; x=1791267140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yiOQQUNxogiUQyW9juq/yIUpauLJuI5yeb0AGzYfhSw=;
        b=RJo6GhbPcAec6kBSgHUu203of5nzgY80qpwRRoa9eP3nnzoDYgKWThVDby/WYOuYqI
         6QRAjk2mJcyzIRxBDbgKW/PpmWxFiBIQBr/GshtGYiBtlN4OJbLxFfo0QS6cABT1d6YO
         80AkNDjdGVNkiev6s63BPwVnzRQO0jA+Yx0tQ0sYWtKfqDC+hyMHDYI6P9c+UAzHVucy
         xWsdC/cCnUlJ1D94uCmouMPQZeYRyH0ZqIcLpx8v6zrWQpbi+McjuZnXMH+k6PdDTkSh
         FbxoVT6jxwJ0wuAa8/XdHA8m5tmRUKl5brPcJM0hV91b/M/LTKohjy9JXGJAdsMuA+Cq
         5eIw==
X-Forwarded-Encrypted: i=1; AKwUvBxhmYAwSXaTkeLY7UvLCsJHRfK5X4MdxSK8g7KN5WtEQWtstUttZqZSIvH1cnLhVM4d9F/AciAalqaGcnJQI4vM@lists.infradead.org
X-Gm-Message-State: AFq9FYJIu65XS9tY0610AFdPKZ9ltFHRnhBYq7J3ZclUFQ+n8kAIu+ja
	MdkgJ06g95NYkMiLJRRv2JwHfCatVLl5iaxtjo3mrqHnBQIjzxb/9H3q
X-Gm-Gg: AYBFou1oulksZhfm4fCO62GcS466hGyqaFpuRhCmx5Qkyc+tudLMJTOQ0hTr15fXyen
	C2iXwDZHljZ8ueG1+6tYPSWgezUn+EyWpXkWSe7gK1PZHh8RR312ZV34OggvOQjp/9ugyzbDQX2
	7IMzNZ2M5+tZWbZHgXyzajIwXHaqnZFXdsdXrfYCauWbExyzTuM1JqzXdqNKjrmK8jGBl6dK1sh
	0PLfaFwaxmB/XL8luXhM98rPsnuIrx/i5DWR4LDS5DLDDkh9YyKp/RRBeGT4WqpQaH/0gdZ5LJZ
	QK9T1WfpdPG+akHcn2m3cQUcL0pIsqJ+9pBxxqrLw+OUZ+G1A4oW4RdHkd6Y84rHXQvVM5TH85K
	CXzYkAcHBYdMCHfGAq3zHeFNGXwVnuzX9fiRCufZH+41SkZjkE6dJX4+aj1IbFmMTQHyo1/XAik
	Vh/5u06V34ti9w071NszANk6YT5md6aosM1DdLYc6tVpF9JoA+khE9me8fAqLd70szhSD3tnZ4s
	okRfxkvHqZ3aqzrXmEbTP/ssEWjnlGpsVz2AF38d9MImGb6hswdUVKkaxbTDDyvd1MRBOZioPwj
	exLu4u2iNtDSFg==
X-Received: by 2002:a17:90b:4a82:b0:3a0:cb48:df6b with SMTP id 98e67ed59e1d1-3a0cb48e2fcmr9490197a91.34.1790662340222;
        Mon, 28 Sep 2026 23:12:20 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498726d63sm3280965a91.17.2026.09.28.23.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 23:12:19 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Darren Ye <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 05/10] ASoC: mediatek: mt8196: propagate main clock errors
Date: Tue, 29 Sep 2026 13:11:16 +0700
Message-ID: <20260929061121.124001-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260929061121.124001-1-phucduc.bui@gmail.com>
References: <20260929061121.124001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_071223_141617_8C5CEC53 
X-CRM114-Status: GOOD (  12.17  )
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

From: bui duc phuc <phucduc.bui@gmail.com>

Propagate errors from the main clock enable and disable operations
instead of always returning success.

Fixes: 7384ecab34eb ("ASoC: mediatek: mt8196: support audio clock control")
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
index 6198711e01b5..dbfd02d20338 100644
--- a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -598,14 +598,12 @@ int mt8196_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
 
 int mt8196_afe_enable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
-	return 0;
+	return mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
 }
 
 int mt8196_afe_disable_main_clock(struct mtk_base_afe *afe)
 {
-	mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
-	return 0;
+	return mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
 }
 
 int mt8196_init_clock(struct mtk_base_afe *afe)
-- 
2.43.0


