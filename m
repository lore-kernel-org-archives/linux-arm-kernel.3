Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4807ECAC58F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 06:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ldA2Tv//rSpgM2mgoWOf2ki3ZpiTNjsfn7bnpTA+85I=; b=f5giLaxYCwiBNzjLJjVD2iaE/g
	V+MKkVGpDUp95Upl2DDdizDBiTeeDcByox7qVl3AoZlUYiunOms3stfBLAaiipPjLCfG2dVQp+Io7
	xgi2hOmDXYmrGHa3uWM4jOcLCDFyub6YnNJhZWVrl1GSIqqJ7z+Y4tcRjyNy1vF2s32Q78yxw0ug6
	+gYGKP8bAMG4K5Am+ZDd0esQt9YVSptVePrECsl82fTI8+FwNgUitX39Xhuv9MzP3vWKm1zhbtGiX
	XXesJUm4RyFcw4JD3lMDnSmE9xfhybttgbnW6TcqG34uCt063V/NLrH7T4gkTiTJXjROzGwZyrcDL
	wLAxnYKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxgOf-00000000Fv0-3CKO;
	Sun, 14 Sep 2025 06:39:37 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxgOc-00000000FtG-4AmF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 06:39:36 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3e9ca387425so167851f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 23:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757831973; x=1758436773; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ldA2Tv//rSpgM2mgoWOf2ki3ZpiTNjsfn7bnpTA+85I=;
        b=DIW4zJ5hqTNlYaAZrU3LjddSjqn10se2lWK2L0mjodu29eVliMHdOnqUC5/tBAHCWt
         CAaEuYZ+pkRg6VRtF3Vpp57UVl0O33gp/Xqyrab0otu+4VPgzA877B2MWYUFpjeFhqpA
         HRK+fBnzNgLANISAA03rmrMly6FX444d6X2NSC7MyDTtDfMLEBf3Le5X+pCLDGi9JzTD
         tTmfPpaA1F4XwiWERP1cRB768fKsugJ1zAkO0S3B7HYmVgzHon7UOOUe8HDzw1dh3t7l
         z8aCsRN9PfNW1oVFr9vMus3JJh+KE1yJTTGWdftugOVpLPan5/rKOaASzcbahZ0xU/kk
         brkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757831973; x=1758436773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ldA2Tv//rSpgM2mgoWOf2ki3ZpiTNjsfn7bnpTA+85I=;
        b=hUqfwVcQJKQjni10zII+jkvNwurRbApenEpwYQTiNbwko3bFuWqM9iEpEtIlKkRDe6
         5WN4vGGPFTsmq4EVvknWseEqIpu84xfBq682sOVKO2ij6kVE2VExH4SGDEAvG+4rwnx0
         jBi/GCj9/SevyKqG5uUMZzhdNRYFajeyUzIsUD6CiUfPIoTEcC8qx9Jq9Tkeajba6oUY
         PwXXPDpvdmEQ0LEyMmTQhzQujk8U4jqJXZvFFJOE734axvdXaFravpoVVR9dEeOGCWVd
         Ib91YmtsGgr5UOrdIFvU1Tqq4HsYgu8uhA0qrRGdKY3yD2g5NApsTN6+2tVbMvFbL8df
         Or1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWoefI1/lfzYX/hFjsHPe/o8ZomCJRbji5v6hO4Kp2w8M2dxtMdRQIX8DRW6Xgxwz2pzphTFWcRIQDmcy1TVpNY@lists.infradead.org
X-Gm-Message-State: AOJu0Yxtsj0MJUdvUQw1zUjO3Z2Ou2OtAuOqOuKhOYYCU7sk0JxxdV9M
	6INdfmDqRG2fzwrHnsJS0Pd+VA7ygVQNSaK77QGGZkC0JFmliUfFnPZI
X-Gm-Gg: ASbGnctVVOZ2I0WOqyhIjOeO5UyufVKicC7QJK3LWAn/bgQ3SEH6tsmXuqXobMGu8Z9
	yKlYS25dpyCfQJzL55qqw5PN/4Sdj/oHE49+H6c8cHdL0oSXOdqh2OKC0guahcx5lC+MjlInlVZ
	matv30X+Zr97Idy4c+br/IksnnNHfKWBV7jE1IAmRSN0DxQ+z794vp1xoaHUzBSTQvY8UbraGVw
	cRmDkE6fSgdKn437P+1CxFjor2CWr2yk04bQsNP66PLiw/aGt/DMovseggIC8IR49AAh0tdVj/9
	LYYMCY2Qm1CQqC/5lCS9KPNBdJywhXV2SQmvJGusG79Cm9oGNcM1xC/ORCm/E8lu2WrAXPPjC+S
	dAl3tfuW39vF/9vaKDXBKt/uCsSGWpqvbTd+jO9l4BqvepSOv7ZHOHyWdAjpykx5l+HNNzv8DbV
	pFsXo3lTghg17qxDBLvyCNccS5
X-Google-Smtp-Source: AGHT+IHqdhP/BEDVPeh1xqm+EIUCLoLGr/3DaGswlta+efo6GD5amfhQUS/xtRQB1Gjk5GwaD5Mz/w==
X-Received: by 2002:a05:6000:2401:b0:3ea:2290:7cc6 with SMTP id ffacd0b85a97d-3ea22908137mr405244f8f.56.1757831973025;
        Sat, 13 Sep 2025 23:39:33 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e9c2954b10sm1561270f8f.50.2025.09.13.23.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 23:39:31 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/4] soc/tegra: Changes for v6.18-rc1
Date: Sun, 14 Sep 2025 08:39:23 +0200
Message-ID: <20250914063927.89981-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250914063927.89981-1-thierry.reding@gmail.com>
References: <20250914063927.89981-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_233935_039500_93DDF3DE 
X-CRM114-Status: UNSURE (   7.32  )
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

Hi ARM SoC maintainers,

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.18-soc

for you to fetch changes up to b9c01adedf38c69abb725a60a05305ef70dbce03:

  soc/tegra: fuse: Add Tegra114 nvmem cells and fuse lookups (2025-09-11 18:19:02 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.18-rc1

NVMEM cells are added for Tegra114. These contain calibration data for
sensors and USB.

----------------------------------------------------------------
Svyatoslav Ryhel (1):
      soc/tegra: fuse: Add Tegra114 nvmem cells and fuse lookups

 drivers/soc/tegra/fuse/fuse-tegra30.c | 122 ++++++++++++++++++++++++++++++++++
 1 file changed, 122 insertions(+)

