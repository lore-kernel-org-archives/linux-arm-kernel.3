Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049AFCAC5B3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 10:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rr4AHNLZpak0/qwDXluW3tBh9480ZbWvsfmpnJ8cepg=; b=Z8XQGy/EyKbFayWHW0x/Pxs1YW
	E1LwjRXkm6esCNnpFql+GzGASeBOqFDJvplY+FXLqUlnbLJOs+t9AAhL+aQf+45HSvroceYyrWsaZ
	R4FVuek2hFYTyHo1kcsW/xjvugtoIXSwZAtiHfMHvdl7DcBCAD4X6vJ8JV/ZB2vfzuWlEH1OQnHWG
	s9iLL6TSepMl3GOiPOmc4twY3ppbt6/6aN3dkPqy1uvgr5ozxfJCTYwqwXYoOn8jMlbODahNgw+AS
	BKDRhKnngZ8LneY8iRalgnMjFX7qN/BNlEyEtVHMShxPfQ6ZQMUMZy6StYTRszS1wfS+cHeRn969r
	9bV0Y6bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MYT-0000000GQ2a-1dUE;
	Wed, 24 Sep 2025 10:16:57 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MYJ-0000000GPso-2A00
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 10:16:48 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b04b55d5a2cso1151586166b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 03:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1758709006; x=1759313806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rr4AHNLZpak0/qwDXluW3tBh9480ZbWvsfmpnJ8cepg=;
        b=m7oNw2SezvyiAJpsd6iAxPkqoZSfGYqDOICLVtuYhcso0YYQZgyZfbkszfpcBj4yup
         qtbk09cpa1Xxivo2m8YUWz89PM/MOAGxOybbIriqlcPVmhRh2nWEVNlKxwaaer5mpnca
         HEd8xnJXyR4707OyG6HNNPLQGkq+wJNqBfPEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758709006; x=1759313806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rr4AHNLZpak0/qwDXluW3tBh9480ZbWvsfmpnJ8cepg=;
        b=ELJtQTZBhpdFgs0PZN1cffgUnInfYGC5THi695xuexakuQ3jgfb8O9//cVWULKsTup
         NzXZyk1WOmNE8+GefcaVZeqTlkptjCdV/DCS5uhpzqigJtc5wNCQXC7pH17CCTMTmyG/
         EPFgrdm0rwmEo0nRG5NAYE3Rq6ee2R+FESCB5Zc2Axloq/bSljNTdLwddtDwez29dFku
         hyyZ9DrFlOE7WNJIFEPEkDUlmgXtiBST2HTQcnYB/dVC1a6hlXFt7TYBUJ2jV58ov4Li
         zQwS8zMjZIapp6Zf9jTzdmWrdvbapiRZpr/Rtqp8sbdgJnZ0A+aC4haJUBiz60Qbw2r2
         wAnw==
X-Forwarded-Encrypted: i=1; AJvYcCWDaHJXfEHrTxO9llBihDhlhQUk0eNt2occYN73xzup4NOUQ1KK3PfKMqpyufx/diaG5S8yTldIWcH0+PYxUbyF@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/1ImCVzXjJMlKlDgIRWuWG1mDwPxuaCiOzqQi2UY0sUMfHA2p
	lNDqXMcsC1G05WGeVI9K4hVqBUJEen4beYI/ljHyu/xzJmuCds37Quv/eSsaxRP042E=
X-Gm-Gg: ASbGncu6Uus7RaP23jj39CshfZuuNO3HteMaBlWINfhC27BMczd2oWzWDoP68BtGk0s
	dTV6++plocLa+Xs2iuEWesfxMGdhA1PgDnWKej6W/Ki90TFTmDMmZU/8fOg/8AK0V3WqgJ1/qoq
	y/67HN0bTV6UuBtr4lvgK9t6AXV936VvOJ8d2Slp5yKvVUkZsH4Nr+r8cYNF77z+5m+hnXaubaZ
	alqAVyW4/QQqOemVeSHx8pju0kEZZ/vcCmPyjmG7PfMrR1Ypj4ytqZIQvciTt3aqmxHDFoy6zVW
	VDWPAIpT+tyLtgqmiWx6KmMymEoN9JKkHcPF9yMmoLXIaN6WuFgaCTUz07K+8n0axsEZvMZk5aK
	DMbBUKPUsTUZTRstwzBIDu90JbHpiMRV6ypTpO0UoGV3CiVRB554WhEwO9mPtp4JemqTaqaW3zi
	WZ/+R1WZ2Czf3SQbqeFOOcSoJOQyJQNuswpnEGdggVB2MFQLDJt/ohBWX/Lqk=
X-Google-Smtp-Source: AGHT+IE7L5itM2VG+Ck3uzCsPeP/CVsjTWyWIegSsTc3ax7OvaG0j081Z2YX1lAhE+xoVbkexzcJ/g==
X-Received: by 2002:a17:907:3f9d:b0:b2a:7f08:23d5 with SMTP id a640c23a62f3a-b302c2f813amr554123866b.63.1758709005631;
        Wed, 24 Sep 2025 03:16:45 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b28d206bd13sm949712766b.31.2025.09.24.03.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 03:16:45 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] ARM: mxs_defconfig: enable sound drivers for imx28-amarula-rmm
Date: Wed, 24 Sep 2025 12:16:27 +0200
Message-ID: <20250924101640.2942635-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250924101640.2942635-1-dario.binacchi@amarulasolutions.com>
References: <20250924101640.2942635-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_031647_558438_06F59998 
X-CRM114-Status: GOOD (  10.22  )
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

base-commit: cec1e6e5d1ab33403b809f79cd20d6aff124ccfe
branch: microgea-rmm-audio

