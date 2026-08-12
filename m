Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7351FC5B56A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 10:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=evJV0/nQ/VH9qOcSVjxhTqp7hA3DXx2pjYS05+4XIY0=; b=NFFNVxdx1irZ8o497ptvgk3xRa
	NcHopHwD5qu9f371Rgw6BXB7OMLYtnJSWUnpv/B/Z+taXpSPNbTBMp2Oz1Y6zuv+K8Mjot7q7yIaS
	cE0O4aEc/y4+mAipyydWSJZAWtvxLFivBT/Qgk8h3lLWaq10+aFH7WlukS3JX0ibReebsX5vwp/g8
	FFZc+/g/2J2TVlrVRz/nxAyVbPhbhNlnA6xnPOQ6aDXAKaUTeh+fzrUgGGYovR2hI32db9WfYIJSP
	VmjkY1V3f9yi0lxef7JBzvDYHr10JxW2SyZLUo6GOxc0gQCPZ2dOvKCYfA4wNYiUv4BjIM/fQtT3s
	myctSJ0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5zF-0000000FrI0-2HHW;
	Wed, 12 Aug 2026 10:15:06 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu5zD-0000000FrGI-213f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 10:15:04 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cf52d15d88so7986655ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 03:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786529702; x=1787134502; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=evJV0/nQ/VH9qOcSVjxhTqp7hA3DXx2pjYS05+4XIY0=;
        b=YojtwfUlvtip3q1sGmsaU23qDcBf6hhFaHgXPz/3v/OoY9/MQb1dU9cK1O8Rn5OL16
         qkhNaGf/wskhWAWvfpIF7uzDVuWvcu0WUnQFH36Eym6EB2ZT/nQ4txR3Aqj2dcRQm569
         5CKc69XcncVoQKsc/sYzFsk9Ql4O1F8ZCQTqOBjJZ2mWiiJqrFjJkeDfuAkf7G+2X+B7
         nVVqLeK/j8V/qOY0D7Rss9bE4i58djrVtNLVWuksSAxzbx9HelvOoTIa4u0vryMmT66f
         O6bSTgXe8AyUFJuIk3d5fq3nhQ9Y4vxIPTIrBHT9EYQI7oFQTc8sjEqSB1i+GY+A2ef8
         P+Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786529702; x=1787134502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=evJV0/nQ/VH9qOcSVjxhTqp7hA3DXx2pjYS05+4XIY0=;
        b=GK6lzT3u2T3q7jsTEM+ORfL/yi7hyjas7AtX2Sla4pMWlzI04m6bXTf9OiGWcAW5JH
         aE4n8eWjKT8WZwBA6Lq6Yk5mIYpYhpZNH2CIgYIbPo7YRJ0ZSHdxu5ubRNfSk2ySRe2D
         YOJahMKzw3ncF8oFpWUdSt1bEm6A2/BnnpwHYtW7KJG40MtUNyKl4vH4nltOxc/72UIu
         gpNyYGztTIsVc5nromZMBMUOXPdGc3vGa5EB4hhpuyzfAsDnSuZyuhfKUACYNtEqJB7+
         wXNz1xhqgwphz57a5slTqxv2PQ3OEkAnaY1Sri2S01/C2SAcqHLElbWYhjtIiSWDnI3c
         LxUg==
X-Forwarded-Encrypted: i=1; AHgh+Ro/p8fWu+i1AoDWU1KqkWoDCi1JAs1yQk3DuxninBqkAEKLa8bddJOAZir3jQ+kca7bhE7QMF/s7pxFxZILUcwy@lists.infradead.org
X-Gm-Message-State: AOJu0YxRuuDJrR3eilIUpacfGRBYai1Pwhb//3IPG5Q3mRImXk03Y02Y
	4DJJ+HtfWk8C28vMoc9yLS9rrsA5naJ3MbddYEtnsVBymN80QTc4LWyD
X-Gm-Gg: AR+sD11UiP3nD4wqA+j4WQ08XDOC70c9hJP7OCupLAPRWEheH5fMjYWcSIP63SYO+yM
	Aq84LXzqEjCsNHJZR0GNf1JPZKkjxkXzCZhmApJWk44MPbf2+ehfSc92WFB4rW0c1N+FCzQ9QBB
	DaUxwvhL1KPF03YmYu5dIKlPpIXemCK0US/xCkPFMtCWxkkTQLpCFMuBIELI8a0kJNuC2wQezAi
	l6Z2RJtslRK0nVJSeO1W2BQoXrVgTN+wIvxgiu/BJBFtPEiqW7k96Yh0GPaJwepzjVPEgK7IQ9r
	MS44Dfd+LHzYOkUjDrwoiZ5mgL5ofoSKPNkdXHhQgdkjNi2qy4Xyvf4Qvg61AAVIz2Dt1vnN+RT
	zAfAqrab1oxlRLWe9pKALzYxvm4/5Xc1ny1+4ie/DFPaNbVEzItGpKaDz6vN6LYi26ASvfXc4ef
	XIApiWbdUxPTWiWKFJu7Q1iOkrfeqIAgwR6NB2/vlhlLYB1wF1+xBOCaNqcLvp0dsyjNyUALiGi
	6kwQPScgO18WNdWjY1KxFP5Y4ilxP15Ans7qOQYowvktYBstoIoq0TnsFTQ1gybL1ddiFpCun+M
	8WMAdp7SSsigCXw=
X-Received: by 2002:a17:903:191:b0:2cc:d69a:354a with SMTP id d9443c01a7336-2d3457202f4mr40437445ad.22.1786529702440;
        Wed, 12 Aug 2026 03:15:02 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d35219d91dsm4159645ad.51.2026.08.12.03.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 03:15:02 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Frank Li <Frank.Li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] ASoC: mxs-sgtl5000: Drop redundant probe error messages
Date: Wed, 12 Aug 2026 17:14:18 +0700
Message-ID: <20260812101418.37966-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260812101418.37966-1-phucduc.bui@gmail.com>
References: <20260812101418.37966-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_031503_552160_57880F29 
X-CRM114-Status: GOOD (  12.12  )
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

Remove the probe error messages to avoid duplicate error reporting,
since the error is already reported by the called functions.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/mxs/mxs-sgtl5000.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
index f1c0e612313d..a253a48ca59c 100644
--- a/sound/soc/mxs/mxs-sgtl5000.c
+++ b/sound/soc/mxs/mxs-sgtl5000.c
@@ -155,8 +155,6 @@ static int mxs_sgtl5000_probe(struct platform_device *pdev)
 
 		ret = snd_soc_of_parse_audio_routing(card, "audio-routing");
 		if (ret) {
-			dev_err(&pdev->dev, "failed to parse audio-routing (%d)\n",
-				ret);
 			mxs_saif_put_mclk(0);
 			return ret;
 		}
-- 
2.43.0


