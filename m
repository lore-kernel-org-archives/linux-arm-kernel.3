Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5768C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sX9XI6O6qjCjlu3Bv7EdsrhNGWhNvzRT2+KyAOXZhAk=; b=cpW2wStDje2fi+526qSUWPXuLv
	TYO8kl8Xuk9xu4sn0kk2PdUUxxlkHMzmUr6MyqzSkf4ToBtCPfPniLmnDAwjUSCySUSyELYmM9RBU
	tX9mcgMDSFHA+IbGJnHFlEXk2BegMX+BzCxbWPxPURMVco+8Pl9bTgbtRj54f7rS9E1aEnolA+7tH
	wVfq0ByhqCqSGlRJ3VSkNu8kBcbqo/qmUZzkzGGFHwaQcHbCWndQJMMwzDsLVvNSvcMFXomNdGCHS
	FELm7KCnsZ9BlL5fHPUk3DIZ4+38YrnQorc8qioE4/JrKEI6TR74Vxq6vBE910dQ4xT4yz38B//Xf
	w6XaJmyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRBA-00000000DTx-1XcD;
	Thu, 13 Aug 2026 08:52:48 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuRB8-00000000DSH-0AHz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:52:47 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso25096045ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 01:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786611165; x=1787215965; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sX9XI6O6qjCjlu3Bv7EdsrhNGWhNvzRT2+KyAOXZhAk=;
        b=iEMQDUay7066I1/4kJtI+K0Kh0cFzPtdi3TgX2KDcZMxrofsBbFK9TfqFqh52nXdZf
         zbJoD17B+fA50MiS366PDP1x0y3NUoYVri9WjtwKr26AN/MJq/oiwwar12AnD41XbHsA
         HVsM7hRjvsifouqkF6dd2y2rSvC+HlSADQmG/dBJ6Y9U5yN9IHStzPLZC/Ct36F/cDWi
         H4GF998pQv98WypHkgIY0/ZyvygSP9MGB/JdsyyfAMMxjkQr2zzqw6FaoSFR1qIyPpws
         rZe9Opxke452sFwsBGmRBT8bb0O4Mf1fb1DnBkIb6dgRKI3ddXYUfaOQ5/F2cat0XWnn
         /F+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786611165; x=1787215965;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sX9XI6O6qjCjlu3Bv7EdsrhNGWhNvzRT2+KyAOXZhAk=;
        b=K3AjQnHkQ+6vCc4ABKM4yn0ppvafDz5BKpfGQK+JVsuCRR55JCi2ENSF3vl2GRS8GH
         OKNANkYSu7DO0ngeMY89yQMCZcVsMbfXsoabUdWbE7U/MCu3qQU7UomeIk6A/t2HeAYL
         G+KukNy2SqGsJNph1wK535usu7a2WbUStzEaxjZepU7rM+1rgbRNdNK3TD/A9tV1Qx1u
         yjr2j6zlnEQZUKrB3C0OMgZyPTGX0gvnFEr9cy2CB9wsJ+dguPbRrs+odrKjYQDabFEC
         2FvfAEUiPJJGd/iYKzN1bBfXwwkE7iGAdb7v2LxGhlFX3I2xpOCaP4No01IvWLcgFvCz
         XtjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGZ0Wo5MJJnBv4zOmu8LglZD00fBRZrlWssKwA92oJL2T4ww5a03D3gSWOver6E50fDBQFUpCjz0xCXGrCfR4/@lists.infradead.org
X-Gm-Message-State: AOJu0Yws8OUqisNsmtwrYxsL96tMAM/FpW7bBfveWHbaSSFK8RuN0KyO
	s2/FsbD8H9V5U+FeotkI82+xwk5kX+pfB25L6NrtUb/lhmFP2uwwqFax
X-Gm-Gg: AR+sD12VABanH1UO3MOWmuVTSSuj3eJGpj5F4mc7pDxOT02gJn/ZFqoTewFjB+tb0GT
	+tEjhExZa1nE+e+sN/mpc2oXFMC1y2jaKNY3L1HLFLLHcaILt8durH5LULdTgG6cD1VSlCmcX93
	8l7mTvh+y3jabJFzq4VmPU20g2oIai/x2jr7fZvXxuCPvh0BAcHVeX2smbwoxNqPoUN9OebXUQT
	ARBJg5UKxjcRVNRDaeg8mrcFw6w7esTdFUfzbbu1FK9URl8qzAkrIzSNQ9PKOb2K1JFxFqB57ZR
	4aSMrD1zQmZDIuue4ozN27/HJXMbWNszAVZufZn2RsTj2FD8UjZ0Go1X2UIYyQ0c5Ao25ABD7qI
	k17PepcOXe6iahLTFqsEY3DUo8nrVURtmiwIUmSuhl3OLEmuBtJrBJhuOT5iCpK7bji5kQMFtJ/
	XAyheTytQAndKHnr8X3mhfg/YDalWDD39E/VYH3Ryk7HxUYd8ZqGKtg48KWOIrMNxkc9ATl+mFc
	0EjnjeHkk8xF0lfJNoupVg4ZS3XQJ5ug8or1dOtWdEGmGEB9lTtRwSinvutpDsb9/gnIp18G0Mh
	1dsZM1rrwuvOHzo=
X-Received: by 2002:a17:90b:278e:b0:381:25ce:bcc2 with SMTP id 98e67ed59e1d1-3931e0242f8mr5395506a91.6.1786611165058;
        Thu, 13 Aug 2026 01:52:45 -0700 (PDT)
Received: from phuc-desktop.. ([14.160.25.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ec0223e31sm5465372eec.25.2026.08.13.01.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:52:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa@kernel.org>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] i2c: brcmstb: Correct optional IRQ handling
Date: Thu, 13 Aug 2026 15:52:13 +0700
Message-ID: <20260813085213.44001-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260813085213.44001-1-phucduc.bui@gmail.com>
References: <20260813085213.44001-1-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_015246_081316_0D6FFBF1 
X-CRM114-Status: GOOD (  15.12  )
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

dev->irq is assigned from platform_get_irq_optional(), which returns a
non-zero interrupt number on success or a negative error number on
failure. Therefore, 0 is not a valid IRQ number.

Check for a positive IRQ number before requesting the IRQ instead of
treating 0 as a valid IRQ.

Also use a positive IRQ number when reporting the operating mode. The
driver sets dev->irq to -1 when devm_request_irq() fails, so the mode
check should only consider positive IRQ numbers as interrupt mode.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/i2c/busses/i2c-brcmstb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-brcmstb.c b/drivers/i2c/busses/i2c-brcmstb.c
index 91525a36e575..3adc73f3d608 100644
--- a/drivers/i2c/busses/i2c-brcmstb.c
+++ b/drivers/i2c/busses/i2c-brcmstb.c
@@ -655,7 +655,7 @@ static int brcmstb_i2c_probe(struct platform_device *pdev)
 	brcmstb_i2c_enable_disable_irq(dev, INT_DISABLE);
 
 	/* register the ISR handler */
-	if (dev->irq >= 0) {
+	if (dev->irq > 0) {
 		rc = devm_request_irq(&pdev->dev, dev->irq, brcmstb_i2c_isr,
 				      IRQF_SHARED,
 				      int_name ? int_name : pdev->name,
@@ -697,7 +697,7 @@ static int brcmstb_i2c_probe(struct platform_device *pdev)
 
 	dev_info(dev->device, "%s@%dhz registered in %s mode\n",
 		 int_name ? int_name : " ", dev->clk_freq_hz,
-		 (dev->irq >= 0) ? "interrupt" : "polling");
+		 (dev->irq > 0) ? "interrupt" : "polling");
 
 	return 0;
 }
-- 
2.43.0


