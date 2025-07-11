Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7661C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 22:29:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Gk8E+s9RWyBn5WK+KrEq4ZIzC8Xh0foVp5UKjjOUlg=; b=dtxrh4duZqL+A0n9maeP0i3kEN
	OgcYBS8aVJfsHQuFwtqsHRRJn9bI6WoZP2z1A2+wor5i4TtmPgwImgf/gRZpyYI59oAHrgPo+TRlg
	EQB9ymnduRqMzUmsIWs2fVdhYFrheaf3u1Ay5VLBKGk7khd6MEP+YUWl4J8jdBpN1V2i6XvnAygxW
	7A7hh3D7TkOVvigxOK7hHKG/fGlMP+PyUPzkbwAEtPYNZX8bdg9fyu19Aul42y+bSWfafkXhdLH+E
	+bNZTKABKd12owM8WfvLijHmpt+jIjMBtehUpeKR6j1U3VAPnR/H2ysgULww/YE0Q1cpxJ7LxNzX7
	Z0WsepZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaMEm-0000000FxGB-2oyk;
	Fri, 11 Jul 2025 22:29:00 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLwR-0000000Fw2f-2CLO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 22:10:04 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-455b00283a5so5990595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 15:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271802; x=1752876602; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Gk8E+s9RWyBn5WK+KrEq4ZIzC8Xh0foVp5UKjjOUlg=;
        b=edHOIayXXr4JqxhZFZWGlHG9ct9XvDsNOEHn3PGk+h36QktAt0PBJT+TiJ2F/i6Dfz
         bYtmOhCOpxbwFjVDGIosbyYt5jltEQxePg3tq+uqgBqkfklvR1FO+Y04/hZajdYReua+
         dlUnJNLE7kyjceUYbmxd/xDJ4k0BP7rgjHzOV/rAwIyoiMLe2qJrJqfc8Pm2549YlDjY
         MIJyyd/xBEKYxNQ08N4aSYLS6PsrTgHZcHc8/3e/KLfqbq0Hju8eczxuL7/IKG/uo0zg
         ykNln/bhrm+MXQlEqQA+1xPZaDUkg8n90lGgxrKoPMA+horQHucoco1ppW2sgl/Sc4qU
         ZgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271802; x=1752876602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Gk8E+s9RWyBn5WK+KrEq4ZIzC8Xh0foVp5UKjjOUlg=;
        b=haZ7J0UyZtFvRDtybe+aMWo79U+9eMC4T0gNzMH57ePdEncQloSdrge+pE9hHeSMZG
         du+bqMDFme8oc90BqzsOSUB7WA0M+O7/XTc+Q2X9Q3uD0YZdCxUXpIXQvgVD8F5RPq05
         nTTsF/7kZ5kvffBb/5mx0k4zPr2CLhUGJB9IHDFXTtzOd4QNbRkONU0sMt0NU+7tnFH/
         qBEWLe3jARxNCcUPP49X+Fm9y6g6Zm2BkNIosIdy5kg7K2Y4FOJtPJtxUI7A8C4z/qo4
         qAHdnHDyx0FC33iW6ICT+x9nOr5Psl7Jgj8Vw/kYoBSh7ubdTi4AaaHw/wS/ohp9W3zc
         ct0w==
X-Forwarded-Encrypted: i=1; AJvYcCW4pUQqX4H11XywsvUHtYYVnapxswTxpr5zhdlE89jT0HAzfwVrSpnoiiO7cEHU4zEp+WASWpz/pSsMhl8yh+UJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxvMsMwAdpkWKnkdBt8/SBZRrsfgvFZMIajHYGqX5K3lNcmkqCw
	4TbzrQJ4nulVjxWMaWOigLXsMy2OWRWqEaHc9PAhubxzL6UYHt4aJRDs
X-Gm-Gg: ASbGncsknn/7zdTmUVbunvRGZTT5T+q/Qx9S4GsTqgEjfhBSDRALE2uURggE6trvGKt
	eCr8vQF4tvxfAfQZcEyJl7C9bvkTmdb9E7yda5uKzH07bVJZ0i5PBoKxDfpcsNXXdH+XsSofTF+
	ksYBl0uSwqenLFWhrjMeOEgPmawMVenZfOsetJnIsuJBmxIi5QWkwJtnKtHIaO+zQDi+7EoGlDu
	e3nM+rO8QapFc40V1o6R18dMH5nCCz6Vw+qiCkYeyTef8ysf7LIbadhO6FiWcmXTBRZWmoYzDQ5
	vZQrp0MPJcqoZAwaX72Sh7UyCUKf6NgXFXCDlW3FEo0Zygf0470yK5qq4y4NXEzICa9h7KjpP8L
	yVbMK6WB7KfH2JpZdbOBQECgmNsiAfy4Mw5Bs8Vup10gfQmQlJYnF330Ij83zN+i14VnR0E/SjX
	vR7lNHS5jtzg39GfNiQ2dsLIz/
X-Google-Smtp-Source: AGHT+IHy8K+cMlEn6WaDFY14pAsG9qqBk8/FSdFXqmhoAJtzNEuZl2gUeQ1mPurKUKcz5UGZPQj7jQ==
X-Received: by 2002:a05:600c:4f4d:b0:450:d37d:7c with SMTP id 5b1f17b1804b1-456058e1e70mr909075e9.21.1752271801720;
        Fri, 11 Jul 2025 15:10:01 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454d50df5a1sm97491575e9.22.2025.07.11.15.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:10:00 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 8/8] arm64: tegra: Default configuration updates for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:41 +0200
Message-ID: <20250711220943.2389322-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-1-thierry.reding@gmail.com>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_151003_563883_D90EB623 
X-CRM114-Status: UNSURE (   9.37  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-arm64-defconfig

for you to fetch changes up to bd3b8e53e244fec2255ab037242230847559161a:

  arm64: defconfig: Enable Tegra241 and Tegra264 (2025-07-10 23:16:40 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration updates for v6.17-rc1

Enable the HSP and BPMP via the configuration instead of selecting them,
which can lead to problems. Also enable support for Tegra241, which was
never done after support for it was added, and Tegra264.

----------------------------------------------------------------
Thierry Reding (2):
      arm64: defconfig: Enable Tegra HSP and BPMP
      arm64: defconfig: Enable Tegra241 and Tegra264

 arch/arm64/configs/defconfig | 4 ++++
 drivers/soc/tegra/Kconfig    | 9 ---------
 2 files changed, 4 insertions(+), 9 deletions(-)

