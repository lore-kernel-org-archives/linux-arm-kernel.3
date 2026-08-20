Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C11D5C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/fA2Qh6VZccXsUY57cmXDESi+CqIM725cXDSiwO02/c=; b=F2cdv+ygCdDFZekYslyt83XsMU
	+9Kpj7qDG1ftDGLu1Xh0iXq3l+bhvAi2+Y8q52gYhj4pInPav3jF76+XbFS7ZZ0loFpwGmSPvSHiR
	M1+Aw+akGFo6TBym5O6jsCliMQwlLxQwlmeWlN64AbqY2GL3wQosMFgHfmpTfR00yIeXX58l/brFb
	tNfVEqDxGpEy8w3J2sVURuWWTOkhdKRc/meS6yF2wwokuvrSnMDvFKKzgwrmZV4/I4SVtNtLkAY/5
	+zjx1HChEjZybLecVYIzrNlH+tSUZbBhjV9hEi/mkLOGGa0NNFzh3MNOTt8on3vA2ABtLOKahWE0n
	/tW5IhfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0hz-0000000BQ1Z-1W0l;
	Thu, 20 Aug 2026 11:13:19 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0hx-0000000BQ0V-0pDv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 11:13:18 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-84e3007a2b7so1631382b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 04:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224396; x=1787829196; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/fA2Qh6VZccXsUY57cmXDESi+CqIM725cXDSiwO02/c=;
        b=GApBNBrpleNz90QfJVX7jMfLz/grFiBDu33brQEIz7CHDHzRpxd2oSWb5bqRi4Aff6
         4/aq1qCXDxfx503xuLOI506HiG8UeFchE0+xLamlahR9NGboNlaugZwyien0CQHsfF5j
         COSalcIyGPJsD1oHQq9QGcyd47Uirckm9p9bPHv64wr3GVXvJs1vRIbo2UWz2jPAlKTR
         8rkQO0Q4Bk8qFU+Cx1AaowcQF2MN5XIgyZVrF92NoyNjRUruKcYcLHiSCFaz9RxevQ11
         IriatwpYOUigO82IiGxHo84y1ru/KmXJPCfZ62wnTZId5mBKqLY20ZSAQ+bHKP6ZJ/UX
         8dWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224396; x=1787829196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/fA2Qh6VZccXsUY57cmXDESi+CqIM725cXDSiwO02/c=;
        b=npxbqw6VdYseTWRLGQVDT7vk/qKG3NOIuRX3r9LoSJfqRplRd1XlA720rctArNgH9M
         k8VD+X83oyWqPsJpYHxY0pk/KlbegUZLhQU2oH7B59InXnzGvbSL43kNQjkYAuTpDagI
         qh/w4qAJ7tcCR86nvMGlt0uyV++0bIDBIVCrVKOXsj+px6XIRS9PDrTI2/OqMX9Vb15U
         e/n7016lwn6nqEgKwqblPQLEnlvdQuWWx67ZRWBXxSvin8Ej0MTL8pd6Hyysz+JLLuZI
         Q0bTt9DP99hHTXdZ3VnEHjVXPSv9212UbmhGh9rxyjSitRohfIsyO2nap9FlgC2UG2mJ
         /QXA==
X-Forwarded-Encrypted: i=1; AHgh+Ro4bTKpQraW/CllAjGxXt7gSHoQrbdns8hg/y31OLa6dRK0UpjIdJ6LMiUYcLT7Q+zqZEYer1/Tib00WFJDDQvH@lists.infradead.org
X-Gm-Message-State: AOJu0YxBfLzGWz5Ko5cvBaqo0FG6WYtA7+ZpaovyLHV/MGXeE/LjsG1t
	DTDLXJ59U4DPnaVy2VbXHePmH90OVS+du1B4ko0JkdIbMfaQYeBZehw3
X-Gm-Gg: AR+sD13g3MH4NbuEmmDFQHcYcF9fWXbfcjs1VfXnLjkdoQjdrtJE7EMH1AW1+y9xrwl
	dBg4HL9NrOVRWBXhfr6ZsRtU3dm7ItPDBiPHw3jszeD62DpIc3IJUPiS4rOj0N8EmlPUCf+RBvH
	ldzYEMTUTw5vqM8vytKbslIwMioeX40A/Mft+LgWNbWm+fR8rwVcVsc8xxH1DrZLk0hoLzTMZJW
	uLnansmbz1EpAqBXpiLZ/PN9Rx/aNH8OPvVKCiRP1dniu9ZtrVxQh9VUaFYP9UbDQ69p4ffceXK
	I20sleqd+7qzY2WU8xqQBkgC7MnaLoKUqWoZT6fNiSZ3EWfgA/l9M/s6HtQFYuHKqtwbaFNR+RX
	VUaVbXMrDaKQoTHSpwoyuaF9XSBL1cL8GcOGwJQTjhoZpN+6TRUmPr1J4TM16NtPMt2zbe7W3Cv
	1qMMdfmHTUnS1jjkbkHUvXLCZj7EuVu6d35cdq5PDUs9Q3x7w0i1Ub+WZ0mNjJMyCh/YdKubimY
	jrvs2isyj4MmLfRDsZ/BZ5ciIDlODG7Bd29CwIkZxtQHmwryrT9Ro0gE/YxMnYL2f1bTeIWa5bN
	PojVuVvQ15H1P8E=
X-Received: by 2002:a05:6a00:a20b:b0:84f:d7e4:3404 with SMTP id d2e1a72fcca58-851d3911ffamr20072394b3a.11.1787224396048;
        Thu, 20 Aug 2026 04:13:16 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d36185c8sm1515460b3a.38.2026.08.20.04.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:13:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/5] ASoC: mediatek: mt8186: Fix clock error handling
Date: Thu, 20 Aug 2026 18:12:48 +0700
Message-ID: <20260820111253.97866-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_041317_237526_FC43A515 
X-CRM114-Status: GOOD (  11.48  )
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

This series fixes error handling in the MT8186 AFE clock code.

The current code can return from clock operations without cleaning up
clocks that were already enabled, and can ignore clock lookup errors
while later using the affected clock pointers.

This series keeps devm_clk_get() and propagates clock lookup errors
instead of silently continuing with a NULL clock.

The changes therefore assume that the clocks used by the driver are
required. If these clocks are intended to be optional and
devm_clk_get_optional() is preferred, the clock users would also need
to check for missing clocks before calling clock APIs such as
clk_prepare_enable(), clk_disable_unprepare(), and clk_set_parent().

If that is the preferred approach, I can rework the series accordingly.

The changes were found by manual code inspection and compile-tested
only.

Best regards,
Phuc


bui duc phuc (5):
  ASoC: mediatek: mt8186: fix APLL mux setting error handling
  ASoC: mediatek: mt8186: Fix AFE clock error handling
  ASoC: mediatek: mt8186: Fix APLL enable error handling
  ASoC: mediatek: mt8186: Fix MCK error handling
  ASoC: mediatek: mt8186: Propagate clock lookup errors

 sound/soc/mediatek/mt8186/mt8186-afe-clk.c | 112 ++++++++++++++-------
 1 file changed, 74 insertions(+), 38 deletions(-)

-- 
2.43.0


