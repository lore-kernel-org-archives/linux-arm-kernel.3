Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F4CE77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 08:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXcF/zg8iZUBkhFDZzmxx+J2cDTkM6h59kKvLz1r0as=; b=h26rpDbDQgLWBM
	RMDQ4ytkXMyy5j8CCBU95BTCcEI/XjdQYiGRXOE/ONDFxll6mM3Id6+/s3xTTjxy8UT2sOKSKGUT7
	4+teAaK8Jevcb6Ox/Gfv59d+UizN31CT2XZCLbc0RlNuk+VOVTnbwUlFnFTJPWP3ay4oeRR0RAhjn
	GaGvJKVgFYCpFsNL5BH5UNgT/PlabW7yiZlKqSLyGfLIobKN/MfSaMFmNXCerwKVFF/95uHoDJ4jT
	tQu3Nv859WSc+I3kw7qHo0Y35dXqc0FmMBZshyQKhRXdccrpMPiENLnHsQAi34Ea1mqPgGSg91cyQ
	ru4TCSrFmve3gyG85nhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4n2-00000003ts0-1XNJ;
	Tue, 07 Jan 2025 08:18:16 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4jQ-00000003tDF-2fQu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 08:14:37 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43622267b2eso159093195e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Jan 2025 00:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1736237671; x=1736842471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXcF/zg8iZUBkhFDZzmxx+J2cDTkM6h59kKvLz1r0as=;
        b=PbP+4XVBmHPPi5cywpk3dJA4vb6iTUGN0OOGztguCanl69hHjapV0rH1J+PkGW4+hK
         NaBpbYLAyAkM4L+ofb5zeuXvAtGMmAQyRIFxz4TtH7J0AnghiiA5XxVlVeriWr2W0dgk
         TW4sx71HU3g9c4QgIYCCLwYG56mP9eJe/SOFuJmHeIG3l4Jyl4G8h0v9uJ98qVwAgas/
         g1g+CBgjGRtXdTsix/rvOt5ga/4qZ7KLKD1CAWDnCllY8X+voHjEUhQq+VugMeZBJd5z
         ERXgmcesPU3wlyTxSAGDcnp9x6GF44p40AfAxkmo3o7W4EkvdjGq5O5Wkv4ZPeeMhFlU
         +M/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736237671; x=1736842471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXcF/zg8iZUBkhFDZzmxx+J2cDTkM6h59kKvLz1r0as=;
        b=qdQHky6YwFA+kyJHVrN3lXUQbpfHhgbM2nCgNBTFlQlE7DNPoNhmF6wqf+puHHcl32
         VaFPNBvcp1z6jhkVudYU/tnUIqWvPyDXjJSPB02IYd+PNvhgANc2Gj2HhYKD3S+uXoSo
         nmv5RmyckuGmGZpHHo59X5OE31f1GO+cdQ184am/OuXlmAYaS9asY08qfwTjm1yo9UKW
         8YDKydl615gDaBJzd9gmqqivxhCUw3aJEZYkcSYgkNAa+IyxEMcn440ZdHP6zFikvCkV
         I2jSLa+lllClULLnBV3W+6CpcVFJZaYEklQGuVCQLnMc01HQzlXVKbZq5h4uGTa4INKU
         ZVGw==
X-Gm-Message-State: AOJu0YwgIbJZsj5tKt/4/1r0UY3ldRAnOGgbdkWDr2B7OpeHqB4TwAoO
	79AQyi+N33lsXOldilYBbnGvQFdLhFOVQMZqq+FsdGXh9lCHPgRfLL4tg7hao1I=
X-Gm-Gg: ASbGnctAhEPO7QBR1cRBaErCvw3kMA4ESgxcfkl8yJEzkDHSRIJ/29m2aEaTOiRQ4Rg
	NhX843t0OqfE+GI1FvHnardgGu6YvUZS7M/Dt7pR7TFr9jCY7sp2ER+dK8JGX0QzZ1OrcHAiIXS
	/9tVQyBuCauGfUZU31vPddEyGBzF6uRwHZHPVak2y1DM/I1pmUCUSgZuIX32x+Azf3xWZcuBCMb
	WkWGnokk6fXNymNumnI5z6bTk93df0A7L2+NZvqusl3Sm5kDPppnNJ4JH2SG5KocyNRzfUe1Hw7
X-Google-Smtp-Source: AGHT+IH7acLezt/XoaaQVIdn6IgtSq2a87yjQeYiM1StsMAqE09iPlejhkyAkuDB+tNY0i8edcwdsg==
X-Received: by 2002:a05:600c:3b20:b0:434:fa73:a907 with SMTP id 5b1f17b1804b1-43668643bccmr506037945e9.13.1736237670709;
        Tue, 07 Jan 2025 00:14:30 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a75a47943sm3541314f8f.87.2025.01.07.00.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 00:14:29 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: arnd@arndb.de,
	olof@lixom.net,
	arm@kernel.org,
	soc@kernel.org
Subject: [GIT PULL] Microchip AT91 SoC updates for v6.14
Date: Tue,  7 Jan 2025 10:14:24 +0200
Message-ID: <20250107081424.758980-3-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250107081424.758980-1-claudiu.beznea@tuxon.dev>
References: <20250107081424.758980-1-claudiu.beznea@tuxon.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_001432_672933_3710B668 
X-CRM114-Status: UNSURE (   9.75  )
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
Cc: alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-soc-6.14

for you to fetch changes up to 452d18c78a469cd18b3f7bc7bc9427f9af390f7e:

  ARM: at91: add new SoC sama7d65 (2025-01-02 12:30:01 +0200)

----------------------------------------------------------------
Microchip AT91 SoC updates for v6.14

This update includes:
- support for the SAMA7D65 SoC
- support for automatic mode in the backup unit power switch, eliminating
  the need for software intervention when entering low power mode
- a fix to release a device node reference in the failure path of the
  SoC driver initialization

----------------------------------------------------------------
Javier Carrasco (1):
      soc: atmel: fix device_node release in atmel_soc_device_init()

Nicolas Ferre (1):
      ARM: at91: pm: change BU Power Switch to automatic mode

Ryan Wanner (1):
      ARM: at91: add new SoC sama7d65

 arch/arm/mach-at91/Kconfig | 11 +++++++++++
 arch/arm/mach-at91/pm.c    | 31 ++++++++++++++++++++-----------
 drivers/soc/atmel/soc.c    |  2 +-
 3 files changed, 32 insertions(+), 12 deletions(-)

