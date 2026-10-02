Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1966ECA5FC4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 04:39:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=45yc2BneUr60+dVapMzgxfzf6J6enqjBi0ExeJ7Ehk4=; b=Ddc+vu2lIFLhVFo8b2sSK/pvn7
	nzfxrCihckWjaQnO3qIGp+2RB3qzRM6yyCz2viDtxq0dbuoQvOYGYci1I6qkjKMYcuOb3QhrzMNUz
	zvEpFhftG8SRtSLvsXbdY0bZN4kQyI6b8sPaxLfPBbA5fe1ROvCadd6hcii5Px4RN92rY7u2Pxay8
	KQG1gNxTmBcXrEoGPG96kPlDqKLSR3c+5NIZ7D/Ji8z4BxskK2RiW4JfojZJX3yrcvCLTgr+d9ydD
	yEK2La1dEBedeRlhyfRvYInfO/Wh/Is06Q2mNMH5zbC7rNe0s8haeVejGBcQW4KeirLB/+SqKuSwD
	NOIJLIJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCV3N-0000000Ac0T-2NRj;
	Fri, 02 Oct 2026 04:39:25 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCV3K-0000000Ac01-3gLB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 04:39:23 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2d747f0b25dso47380845ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 21:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790915961; x=1791520761; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=45yc2BneUr60+dVapMzgxfzf6J6enqjBi0ExeJ7Ehk4=;
        b=lS03ZpsdBm891IEQsy+8d5E0SNF6sQgvfvCXvczx5E9IT5uHcXX5E3DqaONEPWV6o3
         9r0W3BcHJm8LrYVTuKAuOxqKioADp24PGRrBPt1f5GcC1n3Kb/xhLBoBuYujxrooGPYP
         gDCw2mM7g/Ft5nHz4dp8ew68z0O80RdHg1xujyrCj9/pV6IuV0naz7Y2syISv/8A2vYl
         fJtcP5NvezgmUdEhr8zdFQV4QACsAsKtXnCJXxV2PmJg4+naAMgCBDFPP6yRI5VGfvNA
         xGW4B+Lts5tcwyD4Tl+Cn4Xh4CXWrVnaSU8cDwe9L2aSMcskTAUUC9qjkgOjTAiBdned
         x7Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790915961; x=1791520761;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=45yc2BneUr60+dVapMzgxfzf6J6enqjBi0ExeJ7Ehk4=;
        b=iHGdn9yC9dWzR1pN9R2Sn+x/GFPLVaVTJMdhWe137y0zh/r3NvVCdmFkyd6JAwPFmT
         nMayPyai6ArEKK0FFD3I6G8YgEjYcGxj2kUkiAjCvFbRRhFMwvLk8e78HfJYCHo749Jk
         LRVgCAilLmLrofIVE2RqREyxB95ni9HNXvbbBxMnqIGZO8lEtMjn2KGzM/u2xeoXdy9b
         tYr6hlslTB5Gu/F0TYWyqPJPFoj66IYpswIIMpMZEvcIBkvEl+hYODW5OJ91KXnoJ2pi
         Y557I+d+sDhBHmkcXD2kPSrl5ZmIwxceD6twtA3g9NK3oW/vXSLJTvBctkHy1YfGlIdo
         4VtA==
X-Forwarded-Encrypted: i=1; AKwUvByc5X0uk2NJzZQEujSvlp+oCoqGmj2vt+ht6cVxtEVqQeb2ieOeDHcFFro2WsI0SIoc1M0cSGz2jmCJdznf8K+D@lists.infradead.org
X-Gm-Message-State: AFq9FYIEreqVntVsR04rj8Nml+AQJLEr2GGkBzldWD2YIf/axFgWIOPK
	fHyn4D2FUXDzWZkt6+2ENcYFWWvDbUuY++AWzVLH6+fc7ky1JwKXlnZL
X-Gm-Gg: AYBFou3wI26f+urkbAfZdnHKB+8FM7qeUpBDQBAfqzj6oOABKOVfzNfQRK8594hy0+p
	TJTB/o3f3TQIB04A8+OWSZC8KpFeh4Q/txz/Y8ezFs7EQkMjr5fe2qX1kgsg5Ou/sg40slSl6X7
	EWe3zuzwydDFbQq1lqd1CT5CSEwZDI/rYzJqJUH0IjQWO50X25r8L8NB4zBedulSem/XeSE+g1Q
	p475RRFaZyJBbm+4050528j9caT0NlIG7ycLEmCZHkiWkDzbTW+5KbtVTnJO7gM+CRBlwkpQW7a
	FFPAQ3i88KnPLbhz6t+GbfPCAZMr+gbdUhbCMQ7U85RfY1QhqlrWV2IPon74iTG+zwf6tk0gD/Z
	3fQealEyt++GHm387Vda/e1apJxPilgeE55RU4nkcdKvOMHK7xxVEAPZ8gQYf4FYKmGsavsWezF
	ZOFkUGcNPREPBxT11/m0Eot7srKwk2n3xVDkRZs0i9MT040pEIjkyydghRqzqf/5H2vzWOsJskS
	nM/EI65sz8BkYRUXkSUFKVK91VowCpMAuHcEdLYFolUNbhos6RB2RcVUUJBAInPiVXdigo126SH
	KMUhEtNu0lhb7A==
X-Received: by 2002:a17:902:ef4d:b0:2dd:c054:1983 with SMTP id d9443c01a7336-2e49b675cf5mr13473825ad.40.1790915961351;
        Thu, 01 Oct 2026 21:39:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e49f67c413sm3713985ad.20.2026.10.01.21.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:39:21 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Andrei Simion <andrei.simion@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Cyrille Pitchen <cyrille.pitchen@atmel.com>,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 0/5] ASoC: atmel-i2s: fix clock error handling
Date: Fri,  2 Oct 2026 11:38:51 +0700
Message-ID: <20261002043856.97295-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_213922_919312_5D74B55E 
X-CRM114-Status: UNSURE (   8.41  )
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

This series fixes clock error handling in the Atmel I2S driver by
propagating errors, using optional clock APIs, and simplifying probe
error reporting.

Found by manual code inspection.

Compile-tested only.

Best regards,
Phuc

bui duc phuc (5):
  ASoC: atmel-i2s: fix MCK generator error handling
  ASoC: atmel-i2s: use optional API for muxclk
  ASoC: atmel-i2s: use optional API for gclk
  ASoC: atmel-i2s: use dev_err_probe() for pclk errors
  ASoC: atmel-i2s: remove redundant error message

 sound/soc/atmel/atmel-i2s.c | 54 +++++++++++++++++--------------------
 1 file changed, 25 insertions(+), 29 deletions(-)

-- 
2.43.0


