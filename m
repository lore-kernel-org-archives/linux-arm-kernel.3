Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04DF9C71130
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 23:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XPk1root0WuK7dRHLh7WX2PMH42V/Cq4joNrRdgfqU=; b=A5d+MrBfMX4mfecfCOkvbf0bhs
	x/pvDd21TvvQKZewSO4u+/Sy574o8hKc5giQlSHboIOslLUQVZBSfkUE0b0gk7bCiLNAFPx8NtOb5
	qC85V9f7CKVVeAgyFoIKLnKj5nV3Ll3saUfljpNR3HGOBsoiKD0/WIC2eKR9/sFaslO3B/F9VM0o8
	AuVIcmH3wtFOJ/laa02uMPoDZBzzSUNm1vbNunOR9SzGjsE1eIAc5QCoeVaIEfULveJfFjYqG14SY
	ulDkUl9ghUa4BRe2QiCtRsp6105FQyimjnVnfi18StOXNSh5PVvhOYJUOiVIZ0lwp3Wrdh4e9TJYU
	MKj7u46w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYvgt-00000003oc0-0BcT;
	Mon, 07 Jul 2025 23:56:07 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYvXq-00000003nhf-2rr3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 23:46:48 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso7312795a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 16:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751932005; x=1752536805; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XPk1root0WuK7dRHLh7WX2PMH42V/Cq4joNrRdgfqU=;
        b=IbpXdEtKOuTaKrwSx78BXAXDjiawLrTmHj0j1973qQcQi9tYx8kjAhuxcixH598n1c
         16FYBuUon4Ufay6C1e1d1e1MJtdr4z8qkcA15wAOvOxSpscBeqSYqsY7+D8QkFnmV2xs
         u7Ct6ehbMDDRjGjutUmozIkNBkyOI6KFQQ+uITH1mFz2HjjSttC2u8sycUx+yeMC2Tt/
         FEWBkDApXJdFkJr35jHJ5MFNXnFKRZJcg4ntfGe77Etm4njSrFM/qzryYW5/cC5J6aD5
         WsSyR4cBF4jti59NuHIQ/sWcw2lftCiJlAHGuThiAQzTP1nz4vFhqLVHccT28lyQwPF2
         cuNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751932005; x=1752536805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XPk1root0WuK7dRHLh7WX2PMH42V/Cq4joNrRdgfqU=;
        b=FmB1sZ8UtuWw7/eJeSBnWb+KhQ87mUDzlcODaruFHL0Rkk0Pe9Lq69kxREqJIydZUE
         2YcFLDfIchTmTZOof06s8BPDmq49PbQmcfqD0nD/GjqNjfy63/Nmi/zn9xe7JteKc3pa
         9fs4Dylc/Df5OkRv/5zfquPRDc+wkHrWsoctswZ+zKva/QNLlMmucF0BXpXTRmptNG/Q
         IkjhdJDn0g0lSqlSXqCEGfUP6QDwHeedJ32aOtOY6UoQCNA41s39p4gM6bUSUoIfuJIs
         vUPyghgvKxvjFp19fLM7cmQY/FsTd9VVXsLG5tryZs2s0pFvn+aX/AcTrSIrZnb/zN7t
         mhqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0udjncHP5ZIu/RKu2jHUbl/S+lMT5qCjGetaF7VVk4KrheGAOwZ+wWbetY7ey6jej/xHEJTiMsVQFkZoTVvP7@lists.infradead.org
X-Gm-Message-State: AOJu0YwJIvwc4UDzXdIX1dUk4vyW5/ZsnMb00Bq6ztn8nt98y4nxETDt
	WAhjMeiA7fHU0F6RyxyCgxNEimr98EgpxM2YHzfCVRCHOprUHwpmTkAB
X-Gm-Gg: ASbGnctGHAqGrPqQncJVJ/wnh7conaLdioqfOAHI7HgmQlykwAuxaD1aeC/JdsFi6mR
	KzSs4belDrUVC8KrhL7iCQTsQhNXI9CexBRxeFFzAY1GOpbECfdrQ62dCOPUF2enMD+MOT3SFz1
	jBMMIXNRSKl/eSmEk3MP3D/BHvm5WExps7uwEpdNRgS2XLkTl0HpyVW7OoikmQLwFfmgVSfVX0v
	he4o7yDg10oNX/yyrxV4LbTQ+vS8qgBKcrr4RIBSkLHvKqkxb2DBObp6C7ptdTI+dHBBG/XO1ze
	/eEOP7vMQ+DXZdfwUGq06JXVYl57HzEwgKJdsYwCgh7PTOYi537epsaANvpHd1h7MFqN2dV+h2I
	TuUyHewUvX+UCaygWVCLXJ2s=
X-Google-Smtp-Source: AGHT+IHg/S+OKZXPbczL7aJL0lISW8YY04z127Xz3XTz7Zqi0kh9ari/hi5JHoRcoVlD1C56s6ePwQ==
X-Received: by 2002:a17:907:7293:b0:ad8:9b5d:2c1e with SMTP id a640c23a62f3a-ae6b0ddd818mr93226566b.29.1751932005103;
        Mon, 07 Jul 2025 16:46:45 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm781539266b.7.2025.07.07.16.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 16:46:44 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mark Brown <broonie@kernel.org>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 2/2] arm64: defconfig: enable i.MX AIPSTZ driver
Date: Mon,  7 Jul 2025 19:46:28 -0400
Message-Id: <20250707234628.164151-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707234628.164151-1-laurentiumihalcea111@gmail.com>
References: <20250707234628.164151-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_164646_724551_E6E15DD5 
X-CRM114-Status: GOOD (  10.75  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Enable the config (CONFIG_IMX_AIPSTZ) for the i.MX AIPSTZ driver, which
is required for platforms using the AIPSTZ bridge (e.g. i.MX8MP).

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 739b19302865..4d7a60444bf5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -262,6 +262,7 @@ CONFIG_GOOGLE_FIRMWARE=y
 CONFIG_GOOGLE_CBMEM=m
 CONFIG_GOOGLE_COREBOOT_TABLE=m
 CONFIG_EFI_CAPSULE_LOADER=y
+CONFIG_IMX_AIPSTZ=y
 CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
-- 
2.34.1


