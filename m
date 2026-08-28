Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD217C61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 05:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4ksl9SsTnU1qraDN3sQ8M70vtHGdDPB0HKfqeC0tuc=; b=T4kP9mswqiVVEAjy+jw7Tx349J
	AHCWMVmF0DdnUst7KvVPILS6h8IWZnNx89APit8ktQ0JGsFs1968gbvbPDGiOCcaBJd64q77fSXc/
	wRpPnWkgNWrej7gkmfqq77sjThhUpQWHV6grrPRbTIGvPzHeaLs9Kw6fgLAJlAd67XWsna3u34grw
	UacBiJ5Ny8vCd5czt1cCCnUCQCqonrFwjHprwGTBcQ/WyCZ/FvQaIALc2mVD1ebj/XXrDNZksT9GH
	lt8JaXqkPiHVfUYuFeaCaPPOH4OnsbKk9DWLeXX3OftL2IvdI4Wejc8hTYuUcfzuIHm+2j6oOUuS/
	fuMiS+OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzonF-0000000586L-103b;
	Fri, 28 Aug 2026 05:06:21 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzon6-000000057yg-1qzL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 05:06:14 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cacb8416a1so5973865ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 22:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787893571; x=1788498371; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a4ksl9SsTnU1qraDN3sQ8M70vtHGdDPB0HKfqeC0tuc=;
        b=bt01dJ2fPLiRmSznVDS/O3p6Qbj03RWTnCaubcjj1oWLIc++ozTTq+mfjKTo/UzdjZ
         zV8C2FJClvzW69aPO6GlFdYoPIdH3ONJv5JESXfzT5b2YFzn8rpcwGo55rzZmNJiW6MV
         g+rBZ7brOB3M/yehXey+Tm/sN16XV6g4OFJFJLgBRwov4nC8CB5i0gSrTOW8NJprQmfT
         WFVgS93mUbNYcZNynWVka+Hllii4ybVGjYozwht44BP9tMLxHobpEq6TMUEPad415Xkw
         rdrhqj++fXMWCn17yYPHCKCKwHRh2DzybgHTZQeh16d2M/p0uH6nYbDG1CnbRHyd15uJ
         D7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787893571; x=1788498371;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a4ksl9SsTnU1qraDN3sQ8M70vtHGdDPB0HKfqeC0tuc=;
        b=CXXQcNlnJz2kciC0Ot4lV9hAlsSfS/HI9+C3Tjt/+SL2/B4ntLfr/4lLU1/FxXLEbC
         LzfC/AvS35ZrAGDwIo2lfGEd8yC7uLBpC/LqLtV6sEfI1EONLXYaSdXUVIiqorUEJ18V
         wTglt4f9p/HtSKq1nrDAOgJSp1CaX/TAK2nQrm2en+mx1ASjM7BM8T5XP1oqe5EJQ5Vn
         lLtUjjRdlihrHOUH1z/phkMFM3U8wAGP1b5sz6Emop5u/9FAkRU0RdYvxTlRP4YWgaxI
         TkV5Dc+tl7kuF+JrwwXna3LgjtjN4VJNFZW/r3f3nHd4hZPmL+PfQ7aa1mNG3ROWl6Gk
         wAnA==
X-Forwarded-Encrypted: i=1; AHgh+RocJxIO4quinu4x+woSh5FVMbpH4f3vRUiB2qvWqwcn58yUMET5ltyDY7OQ7ef4Ps3ImdKckneYd3xdvZmeNm0t@lists.infradead.org
X-Gm-Message-State: AFuF++nJrdZz1xoe9ceZNO0aykvsf8jnF7pabIUUEOpcaYjT6hy2vGAW
	HGl0EXf2XC6GWvK04aOaWnXQ76xckvVKHW0i2kOte9SGFn17Zr2C5V16
X-Gm-Gg: AR+sD10KwJEwyMSA/ri1RmkhFEFiuRXX5lfPExCRRsYs/KzBGBSMEkbpdy9QwIMn8EQ
	DzVtSpBf5kJlTYlRDtGoURIq6XSxba7SYECKMiaoa4SdmSYqLnc/QiTzEjUdJehGKME9N89Ye0/
	I2OZ+diPuJT+dlL+YGa/Jrex2eKkziv+8jIPAjRJ8gENFBvRR0EXyMNQi2FerQ1aEo/eLrIo6aT
	6QpVtzqpa1rFAebwAFwiOfNjIs5Y1t2HKHYNXavCdRXuKh6CM6xRSOHFt+72KPOFE6DRr0eD8tb
	oEtqpHApSdMyxt+iIoBW25aHTihTjFk4ltpsjWA0zCF6GUd3Nnobd4N6umOUvMScv4cDF292FPD
	rLJB0VxSkVC4LN4CkfvXTtEhNBZYvAQlJwt/9GUrgDdlHIO8QeafCepn/UcCOOmiXq1Nc6gVmvP
	+6mnRZOEW3exgNfQymfuJYi1RvBoNWr/m5C0QXSvdP46kDpUPiEkSeVL3kAf51+L8qK9KvUNC88
	9bkA+oDR1OPD4fvPpVEJKH77d+mSz+BTs+1aJM/GsXycQ1OdMSLqeJSBdvY6ZNkyTo164hJOPX5
	Sq5z
X-Received: by 2002:a17:90b:2cc6:b0:381:1f51:1ff0 with SMTP id 98e67ed59e1d1-396d0d92cffmr9327276a91.2.1787893571476;
        Thu, 27 Aug 2026 22:06:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7c922sm986549a91.7.2026.08.27.22.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 22:06:11 -0700 (PDT)
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
Subject: [PATCH v3 5/5] ASoC: mediatek: mt8183: Drop redundant probe error messages
Date: Fri, 28 Aug 2026 12:05:26 +0700
Message-ID: <20260828050526.590761-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828050526.590761-1-phucduc.bui@gmail.com>
References: <20260828050526.590761-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_220612_494043_79ADBBC4 
X-CRM114-Status: GOOD (  13.23  )
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

The errors handled here are already reported by the called functions,
either directly or deeper in the call chain. Therefore, the additional
dev_err() calls are redundant and can be removed.

Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v3:
 - Add a Reviewed-by tag.

 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 2634699534db..46b7a2bb6aaa 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -809,10 +809,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	/* initial audio related clock */
 	ret = mt8183_init_clock(afe);
-	if (ret) {
-		dev_err(dev, "init clock error\n");
+	if (ret)
 		return ret;
-	}
 
 	pm_runtime_enable(dev);
 
@@ -903,10 +901,8 @@ static int mt8183_afe_pcm_dev_probe(struct platform_device *pdev)
 
 	ret = devm_request_irq(dev, irq_id, mt8183_afe_irq_handler,
 			       IRQF_TRIGGER_NONE, "asys-isr", (void *)afe);
-	if (ret) {
-		dev_err(dev, "could not request_irq for asys-isr\n");
+	if (ret)
 		goto err_pm_disable;
-	}
 
 	/* init sub_dais */
 	INIT_LIST_HEAD(&afe->sub_dais);
-- 
2.43.0


