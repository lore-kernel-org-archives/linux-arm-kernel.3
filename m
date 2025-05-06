Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE55C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VJBH0Ap7+ClrcdS7u14Bn1WtQh5v3tsJ19PPMPZOP2Y=; b=2Go6VEz/dNiCR6R0cw5Rfizxsf
	Y2iqpLIm+6jS/Xqz8lDXKphfsD9tNu1aasMaS8oknwY0AQpFrrOYqjdFX+crSx29hgJEubElFXBIQ
	ABnIY9DhBCLM8vwb3VZJmHGG0kZbXK+Vvx1ShTb6cfBnr8zCrebFRQgmFX+niQEIwRbCHatwAdewk
	fdtbBfnn+yJR3QDn177eYow2ByNVgR7YZUsAatNsp+Y2tPb9ilhaqrQnUgNgcyZjwpy0AdY5PsUox
	QVbUio9q5T4/+P8/TwV/ow2Rq1UXqO8UQKM2F06jnKtC4qThPWOOXj4NES8H+pjgdjKdhpdtrLG7F
	J9AjgVpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLgh-0000000Cmw6-2nIb;
	Tue, 06 May 2025 17:02:35 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCIOM-0000000C874-1Rf0
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 13:31:27 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43ede096d73so34354725e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 06:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746538284; x=1747143084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VJBH0Ap7+ClrcdS7u14Bn1WtQh5v3tsJ19PPMPZOP2Y=;
        b=ZbYyeuSTylXNTWXBKt6ZhMQg446/+nNeHsLq+8604WrPSMVL7DL19/ASrHQ06NoEmj
         7Q8bYb36KoQ58ufzQprELCHMwEmEcgYNhDJYbb/+iFKfDq8Fz1t2vrVxxF7bFNsQrsbQ
         wy3mxxChWU62cMaziFmwDOpbYzGzp6LhucRbyAG0uuZ2ASVUCMSzok2pnRST1AUwf2Tb
         6GSrEaouRfYuB8ejkeJlcWqRuIr+fAYwWlb9Inv0Wgj6cVcZjW2uES3Ep3eg8H+M5DrY
         JO/x9AycFnvIOpmS5sIlzYVznPI+IUHMgrr9AC6B6Kjx1Kavh4cWVao060d9MRjuWAHi
         z8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746538284; x=1747143084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VJBH0Ap7+ClrcdS7u14Bn1WtQh5v3tsJ19PPMPZOP2Y=;
        b=q9Vmk7LSEIWYcyCPCFIHucag+NjlnSMAST7Zg8OfJujMvOiuJueKCKryCGcJRIJ5Jb
         cS50p+tvkUpCBeJdpkWwrbnOMBciF1gOjN9YOc7iFYhvscfkyxVOt9j4m4Fu7SOX/syV
         fMb03lHRv0S+QT0InlEY7uWy1sbJocnMtLRuR3bNvl7UT39lP7AeYH+WiElpgPu5TmuV
         VjbdMZiNvtO8IBDOG7vr+su2mC/tWa1GlBZxlnJm671Anex/et1GYI9AqBja+aesBqOq
         mq9ppi4KO8mqeFzDCEOnLVTnxnHmnWwo3XsnMynAxfCsye28MDphTYQzk1+2Mvrl3gtf
         JvAg==
X-Forwarded-Encrypted: i=1; AJvYcCX/KC+3mxxTXHkhsPA4Uj1nL58m1OFtmjWQHljuDAkj2hGvN7x99Pt897VIcdIhf+umfWK80rcwmPWaSiavjt3g@lists.infradead.org
X-Gm-Message-State: AOJu0YynzuZtCBTN7suZFjZxUFEpXUNM88oTJwWNk+j0LXuE8xlLVv1A
	P8+jg3jkGF9q9qZKA9fBj/PHvKBbLyzGyxqNm0lkIaBl0En5ZeuNlGmUCQ==
X-Gm-Gg: ASbGncsVck1YBKhmz8iaY60pqS8jhXF+kTapEIqjutvg0BwVYTjUoNK5bSgehdPSmOI
	qnF6kjOZfjFYu4Cpe6Pt08wc6CO+9cnhKdJiOj9Is3z7a/zSOgCP0mqd7OwI9AKcBRIB0uFhDdy
	18Gg8DUyGgyf/qRE/HWFnPB2tDSoRYlDCAfzy3Na5SXVDSRci3YH7LqhYvOt5S1yqH36TojhVv1
	i2U2QpVdpe0Y/fR9MdzjRtQafs3W97p3ge5JBtIMBoj+AjBuWKOfLHS9+K2mwBb5zSrVdvta/ZP
	eXjaIXm+nRgb9lxCoFOltnAAJyIPDqWL2NP/RIxk6h2sEVIOieiOnOG8SXqaHjh8U5BMSmWe4KZ
	qUyeVyEnikE5lgP/QXbsM9w4Mn7DXj/7p
X-Google-Smtp-Source: AGHT+IEuwkLbg40ckGVZYcLuKpLqbliGZWRhvYxovjIDkNk3XniEYkEDcOoQdZWzo/NdvcbVVM4Pgw==
X-Received: by 2002:a05:6000:40e1:b0:3a0:9dd8:4ba7 with SMTP id ffacd0b85a97d-3a09fdd8438mr9682251f8f.52.1746538284262;
        Tue, 06 May 2025 06:31:24 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae82e4sm13915643f8f.58.2025.05.06.06.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:31:22 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 00/11] Add Tegra264 support
Date: Tue,  6 May 2025 15:31:07 +0200
Message-ID: <20250506133118.1011777-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_063126_384591_DB816063 
X-CRM114-Status: GOOD (  10.43  )
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

From: Thierry Reding <treding@nvidia.com>

Hi,

this series of patches adds some of the building blocks to enable
support for the new Tegra264 SoC. It's similar to earlier generations
but has some significant changes that need new compatible strings, so
this is mostly adding those differences.

This also includes a patch to fix an Kconfig dependency issue that can
happen.

Thierry

Thierry Reding (11):
  dt-bindings: tegra: pmc: Add Tegra264 compatible
  dt-bindings: mailbox: tegra-hsp: Bump number of shared interrupts
  dt-bindings: mailbox: tegra-hsp: Properly sort compatible string list
  dt-bindings: firmware: Document Tegra264 BPMP
  dt-bindings: misc: Document Tegra264 APBMISC compatible
  soc/tegra: Enable support for Tegra264
  soc/tegra: pmc: Add Tegra264 support
  soc/tegra: Add Tegra264 APBMISC compatible string
  firmware: tegra: Fix IVC dependency problems
  firmware: tegra: bpmp: Add support on Tegra264
  arm64: defconfig: Enable Tegra HSP and BPMP

 .../arm/tegra/nvidia,tegra186-pmc.yaml        |   1 +
 .../firmware/nvidia,tegra186-bpmp.yaml        |   1 +
 .../bindings/mailbox/nvidia,tegra186-hsp.yaml |  23 ++-
 .../bindings/misc/nvidia,tegra186-misc.yaml   |   1 +
 arch/arm64/configs/defconfig                  |   2 +
 drivers/firmware/tegra/Kconfig                |   5 +-
 drivers/firmware/tegra/bpmp.c                 |   6 +-
 drivers/soc/tegra/Kconfig                     |  17 ++-
 drivers/soc/tegra/fuse/tegra-apbmisc.c        |   1 +
 drivers/soc/tegra/pmc.c                       | 132 +++++++++++++++++-
 10 files changed, 171 insertions(+), 18 deletions(-)

-- 
2.49.0


