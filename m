Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 790B5CD3429
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 17:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8fFp1zvnznBgN+0T1h+jmPtm8mqRaI84OPEX4IDfRKM=; b=ea2zkcYAa1vUT7BS9lyDuLi2Sf
	WFozW61K5g3jG/QYT8HQe4j3h9/wb02RfWLDwxvhIta6qkyJ2+sKSA+8bTV4V3x0ITQgy+audSgwD
	QK1ERvKGluQhYDBROjunVnY/Qc8rExMQVpzK+2l2A+p6xzOxy06uBg5PFJbL96b6uIe/Rqc6in9eH
	vmzFTTNcBikT5VyHL5Ky5xIj5/C1ZiVa1ljhACAvhYS8BDHCHN1b6L1MZC5wFF/i7SzYbPwofd7XA
	4NokTZCtba43Ufe22ZEX6jc4r9WVov/9knZSHangea+wy/jGnRAhTWfJACyXGhuD7qBsxq1qdkHId
	eUKu5ipA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEUP-00000009ETP-0gOd;
	Wed, 12 Nov 2025 17:18:37 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJEUK-00000009ERU-3KuI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 17:18:33 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-b71397df721so173915166b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 09:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1762967911; x=1763572711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fFp1zvnznBgN+0T1h+jmPtm8mqRaI84OPEX4IDfRKM=;
        b=fnY8l3fI26Ac+ToyFr+8T5yWTtxU3ksUiH8c2S+QJzTfm4hIz79/sIjqnUwP+mvJ5r
         XaefqbOwpyF4rhyaQzFHCLCXvaYuK83Pi8BgNsI4K3WGdiDnvd8L+OrZLE6RBSa6wQhK
         XfIrDu+wyOqY9SuxHrj1NlniVNO1cCCb4mV7k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762967911; x=1763572711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8fFp1zvnznBgN+0T1h+jmPtm8mqRaI84OPEX4IDfRKM=;
        b=q5LlKxT7T0tBGSwphwOxIC8hkR/kvjupJ8MMKlyP2EuCo0Pb38lMLam1FKe1d6gw2j
         zwu/LAFKXgkDrCiPKQLAeWdGktzapWPL3nK4h4TzKEzojuyV8bg2mVtXUgl8UkqhimdC
         kMpa+mQvxjBqfARAbad8kNLM3CcvzGekGygwMmlOZSBBnTbpihAJjAF8zptdtzDBHdRX
         JpLIX3CX9mLvnip8BXCcginIRXTn8u0ksvL8ZbZkH8EEKKH0E4zHPL01E3/U5MKfkKtA
         AEyny0aJ7cWLCrtOGpXLqB5eAGlk5rdbFa8P37F+CA0DNpvxN2YKe52ZEmWTGbuKw0mL
         y0BA==
X-Forwarded-Encrypted: i=1; AJvYcCXKU1ShUwQAniU/4vD1TWbcMA09Rx34RaXHGfu5aNUVL4fBijwWtSewi7qBoyZZXobZ4dy6e9PxLQ8fZt8F8RDV@lists.infradead.org
X-Gm-Message-State: AOJu0YwGgfVG4qNuNAb8iQYZ76y5iXxo8s3afz02JC8KSaGakEDze8iW
	oo2rhMleaTojDJ/v39+3+MFAGwBFmNRqg4DpDg94ltY9daF40RXhPpv2Bdm9ip2/caM=
X-Gm-Gg: ASbGncu7aAWu8Ct+116lWFKSvdgoAWSV97StKpcV0uhKk9HX54uUg92FmBAqBEnBO6E
	Gpvx1AqXIb/m+JccNZ8Jm8DboFcx95gyuQaco1+bfTewT1saQyh+v6fRhTn94oTqqyLoLZETqbO
	dgki/ZjMpXpdaa3NJ+RZxyDMYFok1SPlmcaIFL6W4dzcASx4hCF5q9JuJR1rCWEloFlLSh4LKa3
	b+h7xNjCt6YkCkGybEjDDHFbw8xhNqw7673KGeHzjLrj7oSPahkbCgpaCYYDtAcqYRSyrcoiEqv
	wzbuxVEj71VNWh2UzQJH/EGQ8OOfSqQ+pgNDj5g7WkES++tnWGu/iAnxQZG6f2dKz+7ND2J73aM
	V97PA8xEJx1Rz5sncFZ3aO9ZAlmIpf6bLAbc4yZ4Nq/CcK5u9ZIy4qn3R2W1m/lnFNm02Fbisgn
	7542bwKMMIENK0T4YdTPMHrLqpFP6dyAGy3WgJWGhrJjY+aHRZy1hnXVlYLmdKP+QkCbh5qz/DV
	p/lou84Vbik59Fc+Q/mbx6qiSDeOTwCJyNOA/0B7s3C/V+u7MfEE4s=
X-Google-Smtp-Source: AGHT+IEEV00bHQWd/lidxf8la3g3vKUR8rGrFzsvXovQz2c7aRvWz16PbrAlC12SmBL57s3JHbjEbg==
X-Received: by 2002:a17:907:60d3:b0:b4e:a47f:715d with SMTP id a640c23a62f3a-b733198d584mr376086166b.17.1762967910867;
        Wed, 12 Nov 2025 09:18:30 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-54-71-163.retail.telecomitalia.it. [79.54.71.163])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b73381dd3besm180731866b.43.2025.11.12.09.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 09:18:30 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH v2 2/2] ARM: mxs_defconfig: enable sound drivers for imx28-amarula-rmm
Date: Wed, 12 Nov 2025 18:17:13 +0100
Message-ID: <20251112171820.4046537-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112171820.4046537-1-dario.binacchi@amarulasolutions.com>
References: <20251112171820.4046537-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_091832_851138_BB8C32EB 
X-CRM114-Status: GOOD (  10.26  )
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

Enable TLV320AIC3X I2C codec and simple-card support used on Amarula
rmm board.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v2:
- Drop 1/3 patch "ASoC: mxs-saif: support usage with simple-audio-card"
  because merged in linux-next.

 arch/arm/configs/mxs_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/mxs_defconfig b/arch/arm/configs/mxs_defconfig
index 3b08c63b6de4..603fb003b223 100644
--- a/arch/arm/configs/mxs_defconfig
+++ b/arch/arm/configs/mxs_defconfig
@@ -100,6 +100,8 @@ CONFIG_SND=y
 CONFIG_SND_SOC=y
 CONFIG_SND_MXS_SOC=y
 CONFIG_SND_SOC_MXS_SGTL5000=y
+CONFIG_SND_SOC_TLV320AIC3X_I2C=y
+CONFIG_SND_SIMPLE_CARD=y
 CONFIG_USB=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_STORAGE=y
-- 
2.43.0

base-commit: 24172e0d79900908cf5ebf366600616d29c9b417
branch: imx28-amarula-rmm-audio

