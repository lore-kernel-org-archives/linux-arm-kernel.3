Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E52C79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 13:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wiaJ1NmJWhdrraZpEMlSTMQ/v3zrFTCeXquYFCuY5U=; b=abgBW8Sh11arsmmRRmgVhrbZQC
	xQCLV0xpkJDwtyhQez1b7YgXicaZvoty7/UJwsoBM78Xl2VAnjW/8yoHV/g2OESkIkZlVrIaBQ2Rg
	FADMtnULAiNVv933XZ4eVdLt/oZGaLD32GzlD4axJ2X6UvQq+E5pG+tuyuRdA7j6JqE1PLIcfUNum
	KMCvnBp2fArc2fdD1bKIkG9pmgaJ6aiAZ9x/Ucv5H2bL3ZC//c8Ku7R3SRTN3pZC/DqBreBt9jIkR
	KflFfWTl/gH2RrzS3w5mG7lit/mK1KgBTwlF74+oB60HBv0coCp5ErP5A+fYMZ14ECKj/QIWg34pA
	dlIYJtMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZMw-00000006vin-2RSS;
	Mon, 07 Sep 2026 13:26:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3ZMt-00000006vgp-3TSA
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Sep 2026 13:26:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=3wiaJ1NmJWhdrraZpEMlSTMQ/v3zrFTCeXquYFCuY5U=; b=rDE19QCKN2cPWMf8Cq+g1v0wvv
	5anpK1KEGHsXTsvUixgef7i/L6s+5Alnbx2TKirnep/E0wmqEgiuxG4dm2bcii/Un4/3/AsZcaqsU
	LxTMPDPRCKWuCAIgior5mxw25BPKjbfBOWAct4MTScF9E2DgQeMGyVm4ZDEzpZvv7+qnhWLh3lDqS
	9QkuPzQ7Xjr9uT1fJOn5wv1NEjf5a4q4a5Qfs+wmv/YcjvfN95C2kcWOyj1xp9k8XX2ycQ3ryEqH4
	IUBU5RSgcxUHqjxJ0CZCiKIgiCoZD56autjqRLxrZEpZjp7qNC5gSzMT/mfrM4qayULvEQS0z83k5
	Dqid/Npw==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x3ZMp-0000000GHB6-3wxf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 13:26:38 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-c2533d83e3bso593470966b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 06:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1788787594; x=1789392394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3wiaJ1NmJWhdrraZpEMlSTMQ/v3zrFTCeXquYFCuY5U=;
        b=U8cFEI/dzDS1fvt3r1RpFWxkWXjFDdX406iO3+UhvfnvhE7I+RkZKJscb3cikoE6VF
         OvD3m8FME2f7Tqp17vto/EkLjl7d+e5NT3g2d6KjKlugMmpSHAT0DNmaaC1rVE642Q4k
         R+ozU8TYOTWQ4O2HATTiAHOhPwRXQo38L/eDcR4mEVnEoIACzcGU7l/SXALYXtsgD66S
         TVtjR8F0Xzyi0dD6///u1gXpxyAsLGcddy1l7kATWzsvFFUttxkYlO/g3iwMryuFzpwx
         D5zLlO0H4bdzaETW+JUVhCKd06dYTQepZe/j7zZESQkKiswX11wJ1Rz+VKu1MWoTDi1h
         SZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787594; x=1789392394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3wiaJ1NmJWhdrraZpEMlSTMQ/v3zrFTCeXquYFCuY5U=;
        b=s9D0lLgadKpBN0f/oX0bqxy36UUc8vl7DsgCqBcix7ZGWZbZIJA1arjMGY2cCnweUL
         VziBRK7ZELFNf4eNAuP+DTPvprkKuTUWtTwiVgOv6jrYPK9lbIfM9Y9oj5ef/v1BXUcH
         y+sZ3ADVKRsrZgHjw93w4OIf8k4C6kuvZgvwSj+z76g0WIOtqCv23lYfZcvwiG6XUgdT
         Z/HgHa4Zy7SFuukiPkaixpF8Rr1PUX/5dUgm/sQWW3TFUWeKmGZtvHccgS0a9BzPKnBA
         dys/MqQSpjPRKcTSvTkGU4BjGiW1fMqy+LWy/ZGpnRrDG1VDLjJJ8XS+o5UXFhZpmatw
         NPTQ==
X-Forwarded-Encrypted: i=1; AKwUvByDqyUBz621CsSdcnbnc30udhiOkTs+Ad8rwtcTFMqoTnqpnCL5L3Qufx3agg0cgiPDerfPHA22KLHcSYgDfPio@lists.infradead.org
X-Gm-Message-State: AFuF++ngXSF0Wku6wQByb6SaxOFurp5Z8O+noW/PgI/kFOiXU8qib9Ho
	Nt6HYVkNeWD3ZaLMlNu38c9hQWgqkxQ0sI1936uN4RrdOh/fjXvA876/pAH00SMnIAQ=
X-Gm-Gg: AYBFou1rMJ2gTbg17E1zILhFNcXeFcTumgW2nb+42xHiSwJja/IM9Mi510ueFQbg8Ey
	bqtxbjpk7HuLYITIUdcLcyFfbD4uqQ9dcULm+4CcNkag9m1Fu72Z4KoGuNDYHCHsBrKONiGrKsM
	fImxHUN6F0PBZ5QfFEC5spiF6f1NYcE/ZvEbdIhlZUKI2UGfVFv/DjP9BoAbw3oFyn9Z/oIaMjh
	m3bUtWJWeEVHdRQRrK4XSLGuB1hWhQGh0j/QXxK/HKoMaUB87+w4nQYD006Br+1FZyEpZtnysA9
	XKa0goS2KgGYDpUdGpewgJ8fOYiWlLKNeNqJLAuNWuDItzk02DdZqmZ32g7Y6Na4x2YXzPk95O6
	/8A78SkUEXi6l3c7a+iJr3FSSvdt1CB5DPVwaeZpCoeVJ8s1p/fbvhpSM5D08geEjVZC9ESyRdq
	D5N1+zkdaNhIH7bx0o28hpe4UZtvh3rVgErHTBxbPFtEyjqfua9auWejXadjGwDS3zC++RCd5Jo
	N7gDsUmI40xcL6QXKsWZIQKfsf2tIHSXRx19ushkVYuHNDCB2MXtgK6KfFVqxy0EJA47u/490MT
	VMDaYRYe40/Ox01WTczbVWPIEImV91+L+pQUrZdPKzvGGcr9
X-Received: by 2002:a17:907:d87:b0:c25:504a:1e25 with SMTP id a640c23a62f3a-c260cbd2d02mr1532301766b.13.1788787594351;
        Mon, 07 Sep 2026 06:26:34 -0700 (PDT)
Received: from threadripper-fedora-workstation (cpe-94-253-164-142.zg.cable.xnet.hr. [94.253.164.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2622a7c677sm366362766b.9.2026.09.07.06.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:26:33 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: ulfh@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	adrian.hunter@intel.com,
	aubin.constans@microchip.com,
	ehristev@kernel.org,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 3/6] mmc: sdhci-of-at91: add LAN969x support
Date: Mon,  7 Sep 2026 15:25:31 +0200
Message-ID: <20260907132617.1198548-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907132617.1198548-1-robert.marko@sartura.hr>
References: <20260907132617.1198548-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_142636_074097_0A71958F 
X-CRM114-Status: GOOD (  11.27  )
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

LAN969x uses the same internally generated base clock layout as SAM9X60,
but its SDMMC controller stops responding when runtime PM gates its clocks.
Software resets then fail to complete and the internal SDHCI clock never
stabilises, causing subsequent I/O requests to time out.

Add LAN969x-specific SoC data using the SAM9X60 clock layout and select the
option to leave its clocks enabled across runtime suspend.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>

 drivers/mmc/host/sdhci-of-at91.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-at91.c b/drivers/mmc/host/sdhci-of-at91.c
index b7e2a89da348..e7affca8da25 100644
--- a/drivers/mmc/host/sdhci-of-at91.c
+++ b/drivers/mmc/host/sdhci-of-at91.c
@@ -158,9 +158,17 @@ static const struct sdhci_at91_soc_data soc_data_sam9x60 = {
 	.divider_for_baseclk = 2,
 };
 
+static const struct sdhci_at91_soc_data soc_data_lan969x = {
+	.pdata = &sdhci_sama5d2_pdata,
+	.baseclk_is_generated_internally = true,
+	.keep_clks_on = true,
+	.divider_for_baseclk = 2,
+};
+
 static const struct of_device_id sdhci_at91_dt_match[] = {
 	{ .compatible = "atmel,sama5d2-sdhci", .data = &soc_data_sama5d2 },
 	{ .compatible = "microchip,sam9x60-sdhci", .data = &soc_data_sam9x60 },
+	{ .compatible = "microchip,lan9691-sdhci", .data = &soc_data_lan969x },
 	{}
 };
 MODULE_DEVICE_TABLE(of, sdhci_at91_dt_match);
-- 
2.55.0

