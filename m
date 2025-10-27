Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 760C1CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 16:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kT3v2aN8EQq8AgHMNf1v3TkZG4Dh+2CDgf66x9dYHZg=; b=dR8uwHPBLLyBnp7Ai0oZ+uBYtw
	XXPp8qOvX7CutFKKs36Jon5mbIo/NA7yRvZ6GW/9bqevsG34yTLv1YqYlS9V+xij0pfjGyKeLGbLS
	HhrpzeTLxQ2iG+Qj74ENwXuToCHE1xCCFZOlP5QMk5aFwkAj0seOOTm5ppRjqnnUaczFywhSGgOWz
	UTeCuGg/iL8FmJeX6agpVF9lcyAPjGACS9QvobR0uecFAU7PsJ6XezivQyAgkyYb/c9uaWawM3qdt
	9V/PRqIPM1cbANQZgBGjUrCztysVrYXwl3rZj5PJpvtoN7T5lty/UQSDN0pk+7p1N0i4y85MJJ6/v
	5xQubJuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPoA-0000000EHul-1cVy;
	Mon, 27 Oct 2025 16:10:58 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDPo4-0000000EHsL-0taZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 16:10:53 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-b3b27b50090so861752466b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 09:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1761581450; x=1762186250; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kT3v2aN8EQq8AgHMNf1v3TkZG4Dh+2CDgf66x9dYHZg=;
        b=O6KijahszNkJUD722jM9FMi7XkIec52OKPWK22Jxten5ExIXVwEWAfaZQdGx5pbnvh
         OnVruSmzwce3QWEHpe5eOpC9awLsiiBoDObtxWOeIz3RzA8JEQ5zazHvwCevMtlxVC6X
         jodAjeV4kjwYsapuNKLYbuptxWLvbdoT6EEBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761581450; x=1762186250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kT3v2aN8EQq8AgHMNf1v3TkZG4Dh+2CDgf66x9dYHZg=;
        b=KXIZCXxJ5/xvnGSVxSyNeANoK5RS3nU3gZCmyh1+2xLikF4zd4ywFNV18OfMD7qy2b
         jYfOGK5uLhacMqC5RkrXE5nwOajmAjyp/4/5pXPfkYjZa8QkhiLXQiP8D+P4SpYaBcTS
         dAcpZVdiHrIgrO6fF29qMZM+WEJizy69d1nkIfTZzf1LoIxHbwGOFX8uHfM4V0H7aXG7
         IiLHQlhWlqD/zVxiebDMtQ0cqlMYy9U/Ht4BHW2wHzy6XzNYkXLx+Z+S5AiFjU5gQICV
         DiL8TgF0c6iVaeN/L+U65uZUFeRlTlw025hWx0/rUBG5L+a/G4KCNpHxXLhA5CbXvWkr
         JnZA==
X-Forwarded-Encrypted: i=1; AJvYcCWsEWJh+YH/eIUj1pvm2U4yCpgpLtvlcXxWObkTgv1+rKCcTzNa/WKT90Zn+NjtavzGTwRTCcXEW38Yr6OQ4CJm@lists.infradead.org
X-Gm-Message-State: AOJu0Yyyuz9Dwmvxc8r1NR8/LemrDAZNLD8QokZnaUFfN898uMhGqX45
	4aeU19HNT2u9GhEPL1x7XOzIwas5JEPwkFAkE9smwyAj7GqIvIwGT+ee1M70EICIiHE=
X-Gm-Gg: ASbGncuHH+p0M+wO13a1w4+BgYWJYab4X0NSYoisI69tsm8+h5SfNSTOCq4oB9zbWZP
	TQzay3WwHSs+Itk1uhuA4IUW7FqExkEL8ed61DSXTNTGzhs32MZZ1M53VeQz4tf49VqM8tY97fx
	cdCt9H99oLfwHPLOtSxNRPwV05Ix8XYKZEfMH4i4BgvStAZUP6bMWegrPEtEJ8a0cPK4YVEBRBi
	VICxmSc04KdeDqeebLWhoNySQrAwSDXfaB1cfh3JfQ6N31iYA53clTB9wsEC2NEXsszcvr2AS+4
	Yg4smkG1G2zo2RdcwUEQrLqBJ+7LWXWlUpfzbA+eQRHAPvvNeHyqoz2w1JRjs6JkLyyi8+8399j
	qGQrZe7XkA4ueZXrv28yM406wo/9Tb0S0v0DafzS+btGaN8QP+J64XAICdYhgH2ltvK3nV5FkXH
	ucbYhbzt88ZTLUYrCy5h1ZZUfVYRMS1AS9cx1Ejb+zoj/ldaQRU+n7H4b3/hQKcxuPS5FwtSirG
	K84zm1tpZvT61vfmrMXe8p+7lAClZUOfVnllLQ9naJGZpPMilawxKY=
X-Google-Smtp-Source: AGHT+IGpgYAzuEZ5slMssED+lqV263t1SAtoTQLAQnIGqZGLNwmT1wHA5r73stv598+NcofTsL2dCA==
X-Received: by 2002:a17:906:4787:b0:afe:cbee:7660 with SMTP id a640c23a62f3a-b6dba487ad0mr49506766b.21.1761581450341;
        Mon, 27 Oct 2025 09:10:50 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-82-50-34-170.retail.telecomitalia.it. [82.50.34.170])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8ceeaffasm742437466b.45.2025.10.27.09.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 09:10:49 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Eric Biggers <ebiggers@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] ARM: mxs_defconfig: enable sound drivers for imx28-amarula-rmm
Date: Mon, 27 Oct 2025 17:10:24 +0100
Message-ID: <20251027161040.2020623-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251027161040.2020623-1-dario.binacchi@amarulasolutions.com>
References: <20251027161040.2020623-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_091052_256171_C635C11C 
X-CRM114-Status: GOOD (  10.31  )
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

base-commit: dcb6fa37fd7bc9c3d2b066329b0d27dedf8becaa
branch: imx28-amarula-rmm-audio

