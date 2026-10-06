Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70BF9CA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qoB87xt/si/5SQ89z++VwfJlgKEBpZZ8oa5UH367RG0=; b=5DCwyibOU/xadK2xdVRlA0NDJt
	kuDTKECHe9oL+i/Xe8vJuWNyyg19/wDCymf711zhDrDwS+lP2J+Dfg/irOb7FVwYEt2yhaOynUK1m
	QbqW+0j/u1sE5Zm/3ik7bBInWo4nzxqB7rNzYuSWDToTc6aHW56zNuRDkaHVpaktOjehh7vDcnS8P
	CugBmNHMdD0jfQXgPsh2CMfTUKQP8OQVE2VVyBgfChmPB5Z4VwhIJ38H2wKioGWXWG/wQHTOzVoWd
	JWZ/h1+drMe6kr+kGBKZh5Zyk/kJEsYDFb/5ccPOIbms6zDnKuVx46blKZGDtP3KgCH1lLu9Te1vP
	VjAY8g6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Dk-00000000TaL-1tOt;
	Tue, 06 Oct 2026 10:16:28 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2Dh-00000000TZQ-1NhL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:16:27 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-88834d30002so280723b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791281784; x=1791886584; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qoB87xt/si/5SQ89z++VwfJlgKEBpZZ8oa5UH367RG0=;
        b=eANorSAxRI3t9p056K3TxzoAGQgh9Kqzm2yvAzgRf2JHGuugK5isEoCHRUZmEX+6M1
         hNrq522o30llh3QlmHIikUFkYXmHi2FCjlGjODgBE8PmCSAh+fZL1sJQNZnCMTRUI0ng
         w0tKj2dHkIFtGPFJ6VTGWsd5VVzTBZvrd4CKSqjYlUJ8+HLrW6G9+oVEnCEOs+EuIiNn
         bol0vQ1Wt4pD/2KkQ5nGfkBhB1zoZg2NC9xpm/xXVcaHT8qX6d5a6exLzTaUei0vqS0e
         hCEaCqC2HrB7jabX0TfYpvBouGsjYjk6OhcH6lzf0KBwSlVMhZNgFtAInCzHYASWULvR
         dlHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281784; x=1791886584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qoB87xt/si/5SQ89z++VwfJlgKEBpZZ8oa5UH367RG0=;
        b=ikDiqBdlbdFt/XgZi4vvFK6uOEoRifWgZlxPcKibkUVqCGWECHz8MjEpbmynBbp1qR
         B87reJMAbI9W80svetRJRorif7THV+vgiCfd11X/QEj5RIoz7QiA/L9pbKAuGziILQRi
         28qn+dtDiEWKfX0PxUZTNX6Gq6tOdfIFfvszRN9Xq/OFsKagMcpu8x388K/KlQdKnu5b
         DTH99XdE8gkeUK11unrt+YX3TosVmsj15TblVANqoSfX9LmvhAUArsWL1Ne21uJ3yM7l
         XCArzFhF5pb/NHKZQLzLlfjqeIy7vlvVQP8LpUD2mEp0a4j2d8HDgd3jDrpmPNyirFia
         hKUw==
X-Forwarded-Encrypted: i=1; AKwUvBxWx2KLgvOcFuW7mV6KIVUL6b0SiXW20MuyYq0Jp4LfO/LvHPIck4sAfyVl0VyqyjuPcrkgRg/AxtTyf8RQvYhN@lists.infradead.org
X-Gm-Message-State: AFuF++mvzbAreSpEPslG9C/MiPB6BQt1POPoeIV+s9swX8+dq/2mkSUP
	UpQFjlzcgU17IgS6JLjGNzYEDZJBExrkFil6qGUYevaY9fK+n5cxjgbV
X-Gm-Gg: AYBFou2//ESGV36t+vbunrZQef6Ww2b0rQr1dBs+1gIw0zTvSDhDEildsY3Y3G+6fG0
	roPiuTyQZ3mkCCaZnK2hIhKg/ts/rR0lK5IlqKmGc9/LaCpjte5OojkARctufgX2nh49H3sDprJ
	MeDM8WbH7yneZYLA55FxAQGVWhtPEVEbDv+rhGLHCQ/sNdYXnsTwhZ5bf2jM9MXYiDki5Wxu5rQ
	a4D2M7F/DgJuBHIElavr4AFLH4mNIp31EZ4KIivAyN+GBjN86rX1+Qeprthu+AxVHUKX7wHn4K9
	7FFKMESQP+1SFR8Q/er7WgjrZBcvgB7rYbJDLa5Hngq3FGyKrqiz/y0wwxCmb6/e8KVH3esxH0S
	TIQI1dTGjs7CHedWC4N1ymCNZDWeI8MuQG5N1jBOjP1LWD0yTi78Bl4rxPZul+2mCJJN0dRO1cF
	G86OVXAAYLKCdJ556NV9ZCH2pdezly+OP5ImbhAY1ksUE4LvMtDg20p4lEobY7b6wHc+JsguzJ/
	nGHUtNU7W/rW/3UQ53N8ofq5YFkpPg+MAyiZ5qjPk9cqiadf8ARBl5Qj1XRPKN3bumtHkHfNtJZ
	oLxME/8inD8fLFK47vzwLvP8
X-Received: by 2002:a05:6a21:511:b0:3e0:da23:874a with SMTP id adf61e73a8af0-3e1246e1ec9mr796494637.18.1791281784146;
        Tue, 06 Oct 2026 03:16:24 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0d152432sm4547505b3a.53.2026.10.06.03.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:16:23 -0700 (PDT)
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
	Haotian Zhang <vulab@iscas.ac.cn>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>,
	Tuo Li <islituo@gmail.com>,
	Rosen Penev <rosenp@gmail.com>,
	Garlic Tseng <garlic.tseng@mediatek.com>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Dan Carpenter <error27@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/4] ASoC: mediatek: Return 0 from FE startup on success
Date: Tue,  6 Oct 2026 17:16:02 +0700
Message-ID: <20261006101606.54079-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_031625_371600_46E2598D 
X-CRM114-Status: UNSURE (   8.49  )
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

Some FE startup callbacks may return a positive value from constraint 
helpers, but ASoC expects 0 on success. This can cause .shutdown() to be 
skipped during rollback.

Return 0 explicitly on success.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (4):
  ASoC: mediatek: common: return 0 from mtk_afe_fe_startup() on success
  ASoC: mediatek: mt8188: return 0 from mt8188_afe_fe_startup() on
    success
  ASoC: mediatek: mt8189:return 0 from mt8189_fe_startup() on success
  ASoC: mediatek: mt8365: return 0 from mt8365_afe_fe_startup() on
    success

 sound/soc/mediatek/common/mtk-afe-fe-dai.c | 8 +++++---
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c | 5 ++++-
 sound/soc/mediatek/mt8189/mt8189-afe-pcm.c | 8 +++++---
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c | 7 +++++--
 4 files changed, 19 insertions(+), 9 deletions(-)

-- 
2.43.0


