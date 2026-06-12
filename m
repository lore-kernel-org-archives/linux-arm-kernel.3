Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE7BCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cVG10nqGoE52+XgCg6Cv77s0dTJbAfaitc0NFuAsjtg=; b=IbDZJnguf2q9+LHEbTn1+NG2iO
	tmio+Gt+cod5EPAQkbdZgZTpKZEXLAJUqEYe0EgKY32cRJ0GJlz05xqXA1fdsENrGH87rzTaHTC/a
	+sf77HCa1Ec0kwRWurK8c9cUMBQvPjyBjtgiVZUVp2VNCKKtm+tNBmWi7gO3B2nTbNOqAxsdTZzNl
	+IUu6sc1gRrps+CkVtfwKF795pBuPvw1PuQz3txcJ1C8fBk6ukOl2domfFICnySwx9W4g7Cmec1gP
	cd7O7I/KCLG86sDa3fA5zntYVAQ2xJs7XCikDWnvEBtINa4HIMOGFzHAM6onSE0EceeIIr03mbJnf
	iBtCzXWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1uV-0000000AxyB-3hwZ;
	Fri, 12 Jun 2026 13:26:59 +0000
Received: from mail-dy1-x132f.google.com ([2607:f8b0:4864:20::132f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1uU-0000000Axxs-1HFl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:26:59 +0000
Received: by mail-dy1-x132f.google.com with SMTP id 5a478bee46e88-3075ce9c05aso2129604eec.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 06:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781270817; x=1781875617; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cVG10nqGoE52+XgCg6Cv77s0dTJbAfaitc0NFuAsjtg=;
        b=Ieb/Je3yBLPwV3pxogt7MHB5AGPVyRYpT62eJtXVeQhl8SBDHRq3ue2Y51TK6RP9Yv
         tV1Ztbzk73cs66jt5a3pRkF5TST6iM9dgmsq4F1mxiipc+Slq/84fceVuE0lz1YQYipt
         6eoX4rroe+456Zn963/dSPK8iJDTBXXzgV0QCwcqYYI8J36H+I37uAQtnsw3xYu9BgpF
         7BL9JnGI5yaXzcdhFbO0Mw3L4wwu3jJaLQqH+avmtzSpq2axiX196Pt7Ngt5HO2JklrC
         8seqAImOLa3/ZBnkCXfyffxrxEAvQtU4j7ekHqimceOyUZ5AGUgbH83bhVAwhS86TmiW
         hyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781270817; x=1781875617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVG10nqGoE52+XgCg6Cv77s0dTJbAfaitc0NFuAsjtg=;
        b=Q+BxAJrk32osT4pTGjEY0euiUkBwZ4FJBSQlIqGlBRvmsYmc3gh01XGnjFvpYypO8E
         IyyFCJF5Z0CvGCCWgOz3NmYzvfk2xUmkaKSbXjGsAM38+2ho4u1C3bHZWCrS2R4nX/GC
         ivjy0jlVYSyNkeauqD2dU3hsLbPLbO84TGuQ3ELFCrpLjRJpDmZyN83Pvz6d/D6KxXyL
         yqITkjpkI6Rvtc/MwK3Q6MBTEhAtgd3EUPqHQuRoBowRtgDWNkPXymZu0g2C/EnoBxyX
         jlnuCAJBfAOxSjxlEbVLzjWuTDYQK2WheKTRKZXf6EU09VXQb43fMpbFHzHgqte37sw/
         zcJA==
X-Forwarded-Encrypted: i=1; AFNElJ9R6fLQZByVK8qqMiWMz2toToMwQ9dH6Dnx2jhkGgYu0Oo9kJdEFTmsjuw/qTQUq0cUdQFohrmYKtoGu7otcpLU@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9d22Coyj63mbANHh/zTRDcsCnB8WUaXjmaocu5nfAtL9iCWMU
	sx8ujIRrfXYGWOGeA23kCYeZx76lQFkgYFE+xjS+2PkJcI8uELj2KrAv
X-Gm-Gg: Acq92OF5xDpRYkIrorpV1o6B8zwqbDqrREqIHrif9O9aY3tkMlkhIph9XtLU26D4le0
	D+JBjPgg7HGHG3NqXpw+8DF3DQKGDmtHDZ6/hiVq2J1x+92KZNiqAAW2wKUMj1gcLJRRmyOSNVv
	GQWpM0U9vlFOElpTGnPQ2IpB5KtUbLO+bBGc6YJckBVPNpIoRVEY5srILCkzqeoSOEDhIevvToX
	pkv9LrkqAF+QnwnMBakKNKcctl6qKzdvLzbhP0Z+RomRFM2Eq65WNZczc9VokelGJZQMjydH96J
	fOXZcDhi3rpbP4qncUQO7YnN8BqwvcLKnNnd0m+HLbyR0s7ZT9WmhAieJa7qjMMkMzn5jgF6lL1
	1ml597mO/bEWwFowOWmd0JnWZmHWvGzyH6nixOUtkf/Vj7scNqhyBih/r+8JLygmW44+l0Ld1Ht
	VlUt0tg09XStt1WdkrA7CaAPgF5LTRQ4paOv6VPnNXmUm5iTmKoImJZiM6JA==
X-Received: by 2002:a05:7300:8b84:b0:2d9:ad46:4a92 with SMTP id 5a478bee46e88-3081ff8525bmr1726924eec.13.1781270817309;
        Fri, 12 Jun 2026 06:26:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e91f8b5sm3302343eec.19.2026.06.12.06.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:26:56 -0700 (PDT)
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
Subject: [PATCH 00/11] ASoC: fsl: Use guard() for mutex & spin locks
Date: Fri, 12 Jun 2026 20:26:28 +0700
Message-ID: <20260612132639.78086-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_062658_347099_40762BFC 
X-CRM114-Status: UNSURE (   9.07  )
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

This series converts mutex & spinlock handling in the FSL sound drivers
to use guard() helpers.
The changes are code cleanup only and should have no functional impact.

I have compile-tested all affected files except `mpc5200_dma` and 
`mpc5200_psc_ac97`, as I have not yet found the correct configuration 
needed to enable those drivers.

Best regards,
Phuc

bui duc phuc (11):
  ASoC: fsl_asrc: Use guard() for spin locks
  ASoC: fsl_audmix: Use guard() for spin locks
  ASoC: fsl_easrc: Use guard() for spin locks
  ASoC: fsl_esai: Use guard() for spin locks
  ASoC: fsl_spdif: Use guard() for spin locks
  ASoC: fsl_ssi: Use guard() for mutex locks
  ASoC: fsl_xcvr: Use guard() for spin locks
  ASoC: imx-audio-rpmsg: Use guard() for spin locks
  ASoC: fsl_rpmsg: Use guard() for mutex & spin locks
  ASoC: fsl: mpc5200_dma: Use guard() for spin locks
  ASoC: fsl: mpc5200_psc_ac97: Use guard() for mutex locks

 sound/soc/fsl/fsl_asrc.c         | 10 +----
 sound/soc/fsl/fsl_audmix.c       | 11 ++---
 sound/soc/fsl/fsl_easrc.c        | 36 +++++------------
 sound/soc/fsl/fsl_esai.c         | 16 +++-----
 sound/soc/fsl/fsl_spdif.c        |  8 +---
 sound/soc/fsl/fsl_ssi.c          | 13 ++----
 sound/soc/fsl/fsl_xcvr.c         | 29 ++++++--------
 sound/soc/fsl/imx-audio-rpmsg.c  | 25 ++++++------
 sound/soc/fsl/imx-pcm-rpmsg.c    | 69 ++++++++++++++------------------
 sound/soc/fsl/mpc5200_dma.c      | 56 +++++++++++++-------------
 sound/soc/fsl/mpc5200_psc_ac97.c | 34 ++++++----------
 11 files changed, 121 insertions(+), 186 deletions(-)

-- 
2.43.0


