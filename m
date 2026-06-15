Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A690CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 22:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A3CN6mz876+/SEyI0OosJ7IJHs+qiuB800Fja+uy4WU=; b=V/KLmSJ2MJ8uw9e7n+CmBIu0d5
	b8sMvzuMvP9ZR2pekh5bg71pOSd+QMNCa9nqUojew9jMVlgqOiO7JlZ4ep3o8WtMf0pDriK7zv3ed
	wPNhOA/qpg7X2uC5OtDap+tXFAGKW/4KxcLrPBKRtaVj00tMP6Kj63Euh+Dbv95E5wjooyIg+8lnE
	xBJVrkAxsDKwWYTmgV68ZrurPSOxcf8fPxlWLb5BHP9JUUu+H9ZS3APYCkvZOYhDmlAfWgllkRUhl
	zk6jMvtjDSWZWQP7Byr5Nq0UToScjkHNVPKm4miEN/Tbr0/otiY8kmqZo1cJchgcZnvpd959lgQhV
	1rhmxH/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGBp-0000000Euuu-2WYW;
	Mon, 15 Jun 2026 22:53:57 +0000
Received: from mail-dy1-x1343.google.com ([2607:f8b0:4864:20::1343])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGBn-0000000Euu3-12jf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 22:53:56 +0000
Received: by mail-dy1-x1343.google.com with SMTP id 5a478bee46e88-307631dbfedso8308489eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 15:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781564034; x=1782168834; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A3CN6mz876+/SEyI0OosJ7IJHs+qiuB800Fja+uy4WU=;
        b=KWGLqB2L+KfWN3DNCZkApIxWTPwKL3pmQLNcSrk3GGc0f+M4JapBy8mnCceud9stpE
         9Z2yvho5BuazxW5Sbi0aHI8vFCGOIRmXTXxle251eGv+b7aMXL0tKZC4XwYs+tZgNmEv
         Z+48BcmiUh3B1ePgX3+GPXprQFMauc+VFwH3D3A4olxx8v4SOipKNF/pT2S7v+oq5bgl
         /IRaqFXIeoqjw02k9SmqslzeDk4g0h2F70CqU0youvgljBiFUwQQkIVIYs1avnlQBzpG
         DT8MnN81zeO8rkoo+Q4/4eq27Y8AFO86oUSsWW3c/uhkE3xbyeD7vzzFnPKojrDn44jH
         Q/Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781564034; x=1782168834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3CN6mz876+/SEyI0OosJ7IJHs+qiuB800Fja+uy4WU=;
        b=eUWdGP6YdCwXMp/4l7h6GfPMzt08yHRGYtTbxgclNE9Y0tScvlbxttni4150bBZEl5
         EEgXjLNC+/s0tNTkPU2ZRZtvmgbGeqol0LaZihsPsE8Ez+oFCetG/R29QJFeur8C0a3x
         omAKeu3sBDFjJnOdrwSYb8a3Dg0iiaE1ikaIlAUDM4V5FhhUwGUOrbFeocq360L6CEZj
         U+w6hk9HmX58rFNHnXNBuG+7Ju8gDSY/Yd66dSD2Taoi4283/JrPCj4BO22JNZvDUAOb
         DMADhNRtYO7YLUPJ3OecT1qFmfRpQAi0eyuHlFr+rJiBEhyjlbnFMEQRD2TgyrVAbR79
         IJPw==
X-Forwarded-Encrypted: i=1; AFNElJ+v9rmf5KlXaHUAwvAu6mlu1X/SZapst23Nl3pmI0UzzA57gAAoJE9EuWUm2F+bXUTaAShYeAn6u3D8rPoWGF70@lists.infradead.org
X-Gm-Message-State: AOJu0YxoeJ01pOrxno1IwIIRgurU0C1Oh73OKup1LQgVKv/zmRMRCXId
	PAvjOWR7MPw56O1ZvNt8paMHOrBuJGHSHFZ6cZiWrDxMHE/q46B02vfU
X-Gm-Gg: Acq92OHUvDTx+PzooHFAmatAs+tOJQy2H5Q3SROlau/9D8aEyIL+8ysRp4nbAa9Flo0
	gTmHxPJVNE3orKxxxLx3IS3RYLjV/ISFS0sEz6UldIR/OOkULWAOensU2MElOcqH/pu8VNqeFEQ
	4pbLkI3g4n8qgRvZ3egPTHfmLl9FsyQksseUyyLc5cNvcUA2EahSEkbH/WMwmqpjR/nNc4rCenn
	8N9Yv/01Jm+w9aBL7qyY16C7YKniG+Pn25xBFGAsm87P+XxXvCkihJc3CyKUvGfk0wL5kOQAmQd
	O0x0U7IPkUKIHkVcIi/RB6ty1haIcKVYVQofD/Ji3yJrGZEo3D39mldvUI5Z75K1if+aUnBmZIM
	x89IeyY6MYLLZXaBUk6bJgMukuSONGjJ4+5zgZFvaFcRZXGFwTGY3NfgtLIj3qzw+NJOitxt4dh
	3r92pG2qDxT9HcGYhCWnc9VNHd8A3byJXzb4VoPMv0Fb4dgje2yjiZyFhn67ry/56xgreIFpIAO
	TfeYBCVQnXJtdinKKMYl498QEZD19tFd8SiuNyGuKweZ0Qpyb+z25PfwsmtbrOuI9qcVrGnQC+M
	KKcuJZ8r3UBRTUxEg5V15IjwLd7A
X-Received: by 2002:a05:7300:8609:b0:304:d8cb:841a with SMTP id 5a478bee46e88-30ba5b28d0emr761709eec.14.1781564033851;
        Mon, 15 Jun 2026 15:53:53 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95342sm16727559eec.29.2026.06.15.15.53.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 15:53:53 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: "GitAuthor: Ethan Nelson-Moore" <enelsonmoore@gmail.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2] media: mt2063: correct CONFIG_MEDIA_TUNER_MT2063 macro name in comment
Date: Mon, 15 Jun 2026 15:53:48 -0700
Message-ID: <20260615225351.22791-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_155355_331318_DE228F6C 
X-CRM114-Status: GOOD (  12.27  )
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

A comment in drivers/media/tuners/mt2063.h incorrectly refers to
CONFIG_DVB_MT2063 instead of CONFIG_MEDIA_TUNER_MT2063. Correct it.

Discovered while searching for CONFIG_* symbols referenced in code but
not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
Changes in v2: Use correct media: commit message prefix

 drivers/media/tuners/mt2063.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/tuners/mt2063.h b/drivers/media/tuners/mt2063.h
index 30d03cd76061..6c4b6c68ec25 100644
--- a/drivers/media/tuners/mt2063.h
+++ b/drivers/media/tuners/mt2063.h
@@ -24,6 +24,6 @@ static inline struct dvb_frontend *mt2063_attach(struct dvb_frontend *fe,
 	return NULL;
 }
 
-#endif /* CONFIG_DVB_MT2063 */
+#endif /* IS_REACHABLE(CONFIG_MEDIA_TUNER_MT2063) */
 
 #endif /* __MT2063_H__ */
-- 
2.43.0


