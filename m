Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00A8CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 13:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r+CdAGYIEklPCYPkGTaICLk240mHu6t2xegNP8dRyKY=; b=uvYDHS5Tdqq9aapbKF5d0r1KMk
	IEmob8TKhzSTgRZDbhAacKQBdtcI9kig2HszQ5oPPw5v+jXAd6bqeSUIFxadtWl3MSVHUyg7yExWr
	EBDzkvlpVwik6AFb6YN/QjwQrb5v1zRXLMweclzG9ULUnHoMwlN2owNIG7Nbc/dAgOdL5lFsZGxyr
	bZJbnZa/MVOzzUJgjtDNkjN2x2r8rzp244yAWLO58qB4VZVOs8Q69lNsxgfeAzzisz6uZjXga0Myc
	e+iZmvZUU30P1HPDyLx5QI9P4d6fMEA2gqZ3waxJ0FGxRC3JC8beuk+DVtAMdR63PAx/SSHKsmIYM
	xELCEnzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaCx-00000003dzd-1UdA;
	Mon, 08 Jun 2026 13:40:03 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWaCu-00000003dyI-3d5x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 13:40:01 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-304f590dd91so4579219eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 06:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780926000; x=1781530800; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r+CdAGYIEklPCYPkGTaICLk240mHu6t2xegNP8dRyKY=;
        b=oWMdUJn1OzUlqoHdJILK15xCl0RPpKfBpwuqcMgs2dGnvXPPqZ+qYAnpKEDoVgY/Mb
         DeSwUtobRF1+CnACxhfnIodN5K/B9BqHRsXMZtrDc0vGX7weD0+nSyspklVaBHmzZnx9
         tdfLnsh7HJ67y9bPXBlcFmip0cUXZyEosXU2G4PBZdWfaxWf6nGRA+LnOX4EdFfgRnbT
         ezIbmgtHBuaHYItOgXVlRbPrt89JrgqBKnFWXjrrrjnaxEsqr/t2yvv0/9Qt/VbHu4Fl
         uejOThigo9JeOZI5W4/bhP7X1TrqT6CQ0NQOm0oXY6x89eUuU0sbL4sJe4+GjkZOpJpC
         E5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780926000; x=1781530800;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r+CdAGYIEklPCYPkGTaICLk240mHu6t2xegNP8dRyKY=;
        b=mMF11RRYU2YjLWjHMHzL8YdX6b/dwrXLZluV1wDClJxC8LZCwhh7SyxM4ydt0ANqbb
         1fo8ZbWLIMEUXXR3ssqhJzGIb/P8kmFA1u4KjJ2o7tp9sNWsEYziwMsOV2JHR+aXjHMQ
         K9zCau8Mv5gwKtJw6SIAcLoIF0TOb1IxB5FLJNN94ElQtDft6RIRjhpMJxO4iGMd7nBK
         X0mlWuG943jPJJfxq4Vd3s4EV+lJKAFA7K22/R9yBkv9Or41R7ZiClCk9gZjRDh8rYb/
         ltMPRVLw5+b6c7XB8HVV5qe0m5cyWLdQg7pUJ4ff/KsH0jDa4EmuiFsfAVFrtUreae8J
         bLHw==
X-Forwarded-Encrypted: i=1; AFNElJ97h2eFf4nfzo7Bblap5pXX2Jrp1bO6cbS7Co/RQDA0LviF8UznNYrLDUxd/IH+y0OaH+xRRS1VLm8vXF33Wxuc@lists.infradead.org
X-Gm-Message-State: AOJu0YxutSHZ967YN9EqEiWlViDOn4I3lckRKbkeV3ww/2CFN23js20Z
	pKJixRwuitY/pfevJAfROt9vdRW9JZZ1zuozNdcWnVA+6UZI3FYWKDVjI25p/XyZ
X-Gm-Gg: Acq92OH2ZOFNiOZ7fuszZaGHey67dxb0xx2OJVAjWOWt2KrDRkX0H+azPZ3kej8jPat
	H4+VEvhZqDAFYWA00B3ohD+RmAkg/pHJO2L8SErzXqRWyRfSBSrp74oBCvnp6rIg3dGoL/1OqH5
	mIlUXRbfZCp++mJoqoF8wCit59WcOKy9W4chWeLTBhvWlXIakL6zpmBDK6KztBCyV52j+pg929j
	tDkHxfCNLP5BInKcBCxCjzdRipqmFuDtSXyspnyd48Ga5a/WTTajhajE0WHl2IF7bzXY/Y6HqSX
	+aLzw+oyj2BSRj6LGS7uO0B6fkwjp/dwMuTQy9PWF+mSKVh5HxrAomnM7e07TaCO/LzMtm32sOd
	/dzgj62j13z9u6qB8jJylOtwU86JzP4zRqWzz1lDnbIMxID0xYUvxMiMxoYItugqwewKPvrzz3c
	eg4j+5ziI71ssdiVnozu4bo/uAWfC86O/cWVaFCUA4DQO8fCCTB0azmmq//yMu79Fl/PBUaeen4
	Vw6nNRjDQc5
X-Received: by 2002:a05:693c:65d9:b0:307:91f5:8eee with SMTP id 5a478bee46e88-30791f5af59mr3853798eec.12.1780925999720;
        Mon, 08 Jun 2026 06:39:59 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-23.user3p.v-tal.net.br. [177.4.161.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm23893449eec.5.2026.06.08.06.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:39:59 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Mon, 08 Jun 2026 10:39:13 -0300
Subject: [PATCH 3/3] ASoC: bcm: cygnus: use scoped child node loop
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260608-asoc-of-node-scoped-cleanup-v1-3-9e3ac518dc2e@gmail.com>
References: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
In-Reply-To: <20260608-asoc-of-node-scoped-cleanup-v1-0-9e3ac518dc2e@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Herve Codina <herve.codina@bootlin.com>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arm-kernel@lists.infradead.org, notify@kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1564;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=vyC7w6pskJBgaLu4nRRhMfqupYy0eXGTyLVkdxR3pJI=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDFlqxyRKLkZwS7AE2Tf2p92fUXVnr8gKwS6tnBXNy1btW
 jiJT2laRykLgxgXg6yYIsvqpEWWe7oeXK2PW+EBM4eVCWQIAxenAEzkchYjw/9Qn6uF35RTdtpk
 X+d4MWXhlgeaC3X+Lbn4/qig9NQvKk4M/+tcorM3x6i7Oc46NWO+9mLXuXL6M27kyvu1n9gTu1u
 MnRUA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_064000_910769_7E44FEE1 
X-CRM114-Status: GOOD (  15.06  )
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

cygnus_ssp_probe() manually puts the current child node before returning
from the child parsing loop on error.

Use for_each_available_child_of_node_scoped() so the current child node is
released automatically on early return and normal loop exit.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 sound/soc/bcm/cygnus-ssp.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index e0ce0232eb1e..47706ae0a31f 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -1298,7 +1298,6 @@ static int audio_clk_init(struct platform_device *pdev,
 static int cygnus_ssp_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct device_node *child_node;
 	struct cygnus_audio *cygaud;
 	int err;
 	int node_count;
@@ -1331,16 +1330,15 @@ static int cygnus_ssp_probe(struct platform_device *pdev)
 
 	active_port_count = 0;
 
-	for_each_available_child_of_node(pdev->dev.of_node, child_node) {
+	for_each_available_child_of_node_scoped(pdev->dev.of_node, child_node) {
 		err = parse_ssp_child_node(pdev, child_node, cygaud,
 					&cygnus_ssp_dai[active_port_count]);
 
 		/* negative is err, 0 is active and good, 1 is disabled */
-		if (err < 0) {
-			of_node_put(child_node);
+		if (err < 0)
 			return err;
-		}
-		else if (!err) {
+
+		if (!err) {
 			dev_dbg(dev, "Activating DAI: %s\n",
 				cygnus_ssp_dai[active_port_count].name);
 			active_port_count++;

-- 
2.54.0


