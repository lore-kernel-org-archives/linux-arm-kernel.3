Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF61CCA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Oct 2026 11:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SH0Znh1ZN4Qa2aqMJURXlEwFyEPWYynPhvibLKZzQZk=; b=KSVFHhG1ag29mfRbxDvHQ/IpA1
	7JmMj/zvinbLdq6HSHwtuLw7vnuzftnRsaVKprnZul+TmCCk5BOaDvsYuxnf7H6xnDrQzaaGtm46H
	iFRhHW7j/Mew5ak7CzDwdFlSabXG+u6nNidTZifKrTJze7IZRnsxOh8xhe6ponQovYqbHmLPI3ov8
	2eEz7iXodNG/h0yICa56D4Eskkx3zAUpNkDbBrr8v4Gvs1nAGrWqMv988j2rjXkHi+o95jjXFhb4e
	FB9008Gu60ESf4IB6m9lluloSZa//GLuDd4ipR5bpfI8Doksd1ee+3exrFXn+1Vq75UG3WAFph4yu
	nND3SQcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTV-0000000GGlJ-3KcZ;
	Mon, 05 Oct 2026 11:03:17 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDgTS-0000000GGjq-3V35
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Oct 2026 11:03:16 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cc147d86bebso231432a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Oct 2026 04:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791198194; x=1791802994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SH0Znh1ZN4Qa2aqMJURXlEwFyEPWYynPhvibLKZzQZk=;
        b=fxoxE8pWnW0MAKkNRF+uO3JB3/s0WLgFikfKH1xBWE6ekmYqfi7cwrpVn/E+LQDAJE
         EViEFcg0LwYWIHbD8ty+V0TesTnMQeifg7RYUngz1eP5hAMb3ZtFSvEAnrroLtvfwqiP
         TqQWfocOCvjsnz5cHr4Ar113MAg2eouz+arzXDnTSH/pFnHK5UD/gQ4x1oWLMXuimIjn
         HJEsGbvmOlDOIsIXvTiKxteFx3ki7FJX8ptAmhJQ1AAEx56G8ShqlqAWcMkaDyLUfUuU
         uo+am64q1p9rtDzup6zbxx3Stxik1IWT8zrweRzfIhlidDXsVAJi+mh+fAtYvm17WTfL
         NHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791198194; x=1791802994;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SH0Znh1ZN4Qa2aqMJURXlEwFyEPWYynPhvibLKZzQZk=;
        b=FgHa/Smucpv8Ii0AGeHybnxJrqy+Fo1WyZ1bOjxIAPPIPlhBEgcvPCebsAOd3PciNx
         bUTT6xUOKZJQVe+oMvGTNYfQLLiyTy8QOBlU1eOoqXYgAfZOF8EnS7+6gvrtYJM8EdLm
         aXXMx+pfnFyggx/FuUy7cdkCkAWa8yMRAYj//AtW2Aq+0169Tyg1Iy1YAovhg+WfBwlM
         6c7Xtbv+sZIJNqEpM1w70OCMmWpVDZ9Ei4ege1zyVRKrsyqkXTqdqnUmupNteouFkKWM
         6LFbab7DHMQVUV/OawPaH5wdu2v4Y6AwuaT06MRd66SrJHzlvtaTgxnQVV5Kn1BMtgzX
         X+MQ==
X-Forwarded-Encrypted: i=1; AKwUvByRZDMQ7+fzwNVF3oGh+WHS1cjWw5/h39P8c8ZSEH2SOm8+OBLaWboXlNpBPlplw5nHhHXpL91v8fq0vXbzsHeg@lists.infradead.org
X-Gm-Message-State: AFuF++nIW++te3Jatn9UlWc5M6xOw0KeaIUgqV68YbwNfQmkIDgric/p
	0m2WK0qGFCwEkKmBGQW2jw+MszWZsSiRK9YqG7jh27/B1iCsI+SVcy4z
X-Gm-Gg: AYBFou0/n1oJW+7vElmhsMpwQGa8CHHr7ehtG1aZuwK3Tv5fOU9ZwGlJ4ZJeltA6Ajg
	EIavA2tgMitOKR812ZzOUMLn0gUlTTu6QHufFFIVCgHdEnauuapGKIEalqtfngp04e93xnU+Zcl
	qL+KL4cEJwkuqbuQ9EY4VYJ+NVb7xCnysjtZ1kecXwjq8GhcQ/139UezQvFRW3cGW1TysDD9BnX
	WDlEI082k9GXqafquNf0vu5UkrUOCSRsD4OAndidt3FoRz2OyUre92y8dCF6lIBJUKk8rK/uf1n
	VRO3Wl/oR6uQLLDdkddAIDEI0ETe4Mx32zwpuPT2JXZhCapgrcLnP7l2AYCXT4wyQJkMyn5rH7j
	ao4z4uyJTw07yv4W0vp+wRxfLAnRcaUSulPMzeoPe4uCeyudgp6Ou83NaNJn+IKZswpRQ8PG+vq
	0AdzX5ShdXAQe5vL4NLMc0g+bs5ZRsImaAF8tJAy3jbStK1KNkTjBdQK/FiKb+eQvJLsN1HvdjY
	GwfTT5Za7JRPK3IxPFArsUWe7uzBuLYgYspEp6mFZNSjWXqt/UrmhPcYGBC9v1ixICn1yi8WAEF
	r3X4VdTrEwDeYg==
X-Received: by 2002:a05:6a21:70cb:b0:3dd:a9a9:3967 with SMTP id adf61e73a8af0-3deacd7c65emr12182287637.43.1791198193691;
        Mon, 05 Oct 2026 04:03:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cce6d334de5sm626498a12.11.2026.10.05.04.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 04:03:13 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	cassiogabrielcontato@gmail.com,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Haotian Zhang <vulab@iscas.ac.cn>,
	HariKrishna Sagala <hariconscious@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 00/14] ASoC: mediatek: mt8195: Fix clock error handling
Date: Mon,  5 Oct 2026 18:02:43 +0700
Message-ID: <20261005110257.50145-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_040314_881579_6C1F1918 
X-CRM114-Status: UNSURE (   7.97  )
X-CRM114-Notice: Please train this message.
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

Hi all, 

This series improves error handling in the MT8195 ASoC driver,
mainly by checking and propagating errors from clock operations.

Changes in v2:
 - Check for negative return from mtk_afe_fe_startup().

Compile-tested only.

Best regards,
Phuc

bui duc phuc (14):
  ASoC: mediatek: mt8195: Fix tuner clock error handling
  ASoC: mediatek: mt8195: Use dev_err_probe() in mt8195_afe_init_clock()
  ASoC: mediatek: mt8195: Fix register access clock error handling
  ASoC: mediatek: mt8195: Fix timing system clock error handling
  ASoC: mediatek: mt8195: Fix paired memif clock error handling
  ASoC: mediatek: mt8195: Fix FE startup error handling
  ASoC: mediatek: mt8195: Fix runtime resume error handling
  ASoC: mediatek: mt8195: Remove redundant error message
  ASoC: mediatek: mt8195: Propagate IRQ lookup errors
  ASoC: mediatek: mt8195: Fix ETDM MCLK error handling
  ASoC: mediatek: mt8195: Fix ETDM startup error handling
  ASoC: mediatek: mt8195: Fix HDMI TX startup error handling
  ASoC: mediatek: mt8195: Fix ETDM probe error handling
  ASoC: mediatek: mt8195: Fix clock parent error handling

 sound/soc/mediatek/mt8195/mt8195-afe-clk.c  |  69 +++++++++----
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c  | 102 ++++++++++++++------
 sound/soc/mediatek/mt8195/mt8195-dai-adda.c |   3 +-
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c |  99 ++++++++++++++-----
 4 files changed, 198 insertions(+), 75 deletions(-)

-- 
2.43.0


