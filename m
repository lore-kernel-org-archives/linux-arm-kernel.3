Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B70CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IOlleqlCU9UASt9sEqw41R4UllxELkSYjKqivDR96C8=; b=ID7n/4RArEhppO3cEYSCygTycV
	GuVsLzyPPNQYEaF/267jPPdKn6mxPEI/NZsh+XtsHZADQ5d9e+iCxw4FN2KvGhf9saRTq+Dw7uytF
	iNnmN8TKN1BPoHS1DmZG/BVSD0gZVxC6tbpPRbkAD+NuIjecrfYxKv4b/HwZb1xJqXZvAd18QLkMa
	fKTLA3cZYseuHeHYG7lwEUKiB3bzpa8FwtxpzSivLMk6qbm7q/Zl9BuZ9M7Xw7TT68w+LF0xKnFh5
	NI+Nx02U508LqnWAI88chD8s18KhC7lzr2fBXg+TO2vsDTaWqlCS9yhx+bVO+EkmSIJXB745q1Frm
	FO2GMOwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1uc-0000000Ay06-4Ak8;
	Fri, 12 Jun 2026 13:27:06 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1ua-0000000AxzR-3fnH
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:27:06 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-30749947917so2923261eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 06:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270824; x=1781875624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IOlleqlCU9UASt9sEqw41R4UllxELkSYjKqivDR96C8=;
        b=LNdZ3kzpd/XXFNGSXDJOlzMIz4czHWmi2/UuMDBWoDjdOxs0e94XB+PTgMXa8Sxcpt
         SnGWupw+5TIUNVeHEz/9/aJI+E+63KMN4u5goPeKyc//bi/lKJIbK+kGjcCW0J1V+UDu
         R2gJRLce/atl6rMmYeN2QMfZUSOPz8wU30q2d9kSgtdWgU39dT3iSCklfwmmQmboa9az
         f5xWcOlsE8bpnbjC130Rh7s9SfKK63reiZQZRZljQkdaoDUCfIJrVHwy2fMOSeJk+d51
         po1LjH8N7+tALfKwHX2Icn/RCVA+zvKlwLhHTQ0xjFJsNNLAWDglo7Oib/heL9QmXqfN
         iJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270824; x=1781875624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IOlleqlCU9UASt9sEqw41R4UllxELkSYjKqivDR96C8=;
        b=jQv5Ep5g3LEq2WhpgHpwM/U2ThiOw616U7/JTdR07tfHfiCcEJaODutLnBgnwfgDHP
         FB/bpyuawvmO/RdkozXRs8ERCUSIS85Akx7SN9jQhdmATHLHF6HS0iJLT53UODjClOFS
         JzR4eO0GcSF/xTg8VUcJAaCTTHuZQg8fibR/9JoI7oe8u/fONKXKzATxRmN4LHQXcRln
         3W6bPj/riNX4J7mFgXwMK01lL9chOrW4Vt3CyWWY2rGolckptRC0wSw08HNdzAZh04ps
         n5SCzVvCncGYRxglmhwmc6u6fVRSSQWq+YjQzw093ZwcVdac9yDcqpr6FEpF/8x9sKz6
         RPzA==
X-Forwarded-Encrypted: i=1; AFNElJ8SPJUa1N13qYtHcbsmwkySMpz2IcNirI9aUgFwJq0b7AvRLAvY9/YZ5oUJVSU4UZN6IPozBxazChlW+xcPw8HS@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ5KsR8HLnftm2leV+YkwmitdAfd+IktXu0kwZK/Z/pafiEY+d
	9kUmwnnzuHov/drjotYTLAqSX2gc5A+MVYsFKTXKS31ceOxncl+RyZDK
X-Gm-Gg: Acq92OFWYSVmNhbnhFsyg1IZLUU2+GxThXwfP2H009OoQGwOM3+GnmdNxpI3PlaKOaf
	JmV1HpVSMSnHGsR66bRbMyGj/1q0AYPggFvSTAqjzdX1EccFbLFl7+m8fq4lpEISSC6r/y7v8GR
	zYIEYJ4OJT0u3rxizJGnDS3TbuYU5xc+IrCgJVD91e6lrN9OVF4DHQnkBeVDxYUw54C9Z8g1Foq
	ETLWDkW7d1g8S2kPMq3QS1zVgXpceyLHox2Zjorwvs5EJp6IMXGFRuTlnwCjhaWCl2REpDwg/rb
	2Err3qYLFlp84ZkhKfRm2P2Foyim9KLwYfQMgc3cn9cW5wznNjHMJ3R7JJnjb7YklIoaViFMpKY
	/Ay/HSFGJuG9QMEl90W6Sa6CZ8GsCSFG5TkXPBI33yU3sHvUxUVSEH+T0jrCe0fDl0KeVVcH+a3
	e4ga/K8Z3bu6YY9fG4aTy4RGO70teI50fOfktEFDn3FlnZORxZqiBAUXZBCA==
X-Received: by 2002:a05:7300:3c1e:b0:307:91f5:9377 with SMTP id 5a478bee46e88-3081ff945bcmr1832507eec.9.1781270823971;
        Fri, 12 Jun 2026 06:27:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:27:03 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 01/11] ASoC: fsl_asrc: Use guard() for spin locks
Date: Fri, 12 Jun 2026 20:26:29 +0700
Message-ID: <20260612132639.78086-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260612132639.78086-1-phucduc.bui@gmail.com>
References: <20260612132639.78086-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062704_921043_1DA5DA98 
X-CRM114-Status: GOOD (  13.35  )
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

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/fsl/fsl_asrc.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 5fda9b647c70..0b28bcfa47fe 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -222,10 +222,9 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 	enum asrc_pair_index index = ASRC_INVALID_PAIR;
 	struct fsl_asrc *asrc = pair->asrc;
 	struct device *dev = &asrc->pdev->dev;
-	unsigned long lock_flags;
 	int i, ret = 0;
 
-	spin_lock_irqsave(&asrc->lock, lock_flags);
+	guard(spinlock_irqsave)(&asrc->lock);
 
 	for (i = ASRC_PAIR_A; i < ASRC_PAIR_MAX_NUM; i++) {
 		if (asrc->pair[i] != NULL)
@@ -250,8 +249,6 @@ static int fsl_asrc_request_pair(int channels, struct fsl_asrc_pair *pair)
 		pair->index = index;
 	}
 
-	spin_unlock_irqrestore(&asrc->lock, lock_flags);
-
 	return ret;
 }
 
@@ -265,19 +262,16 @@ static void fsl_asrc_release_pair(struct fsl_asrc_pair *pair)
 {
 	struct fsl_asrc *asrc = pair->asrc;
 	enum asrc_pair_index index = pair->index;
-	unsigned long lock_flags;
 
 	/* Make sure the pair is disabled */
 	regmap_update_bits(asrc->regmap, REG_ASRCTR,
 			   ASRCTR_ASRCEi_MASK(index), 0);
 
-	spin_lock_irqsave(&asrc->lock, lock_flags);
+	guard(spinlock_irqsave)(&asrc->lock);
 
 	asrc->channel_avail += pair->channels;
 	asrc->pair[index] = NULL;
 	pair->error = 0;
-
-	spin_unlock_irqrestore(&asrc->lock, lock_flags);
 }
 
 /**
-- 
2.43.0


