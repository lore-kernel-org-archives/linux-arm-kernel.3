Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86D1C28B26
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:32:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aTCtr0i4SG/QE/FNq50+gRW/p2tQeowoOyJAzQbTUXg=; b=fYtuoC/E9eKRY5AlVpZGB5X1Fi
	taa+Da04vbOFVQmMPOtOLG0uAosb0FN+2+cunCzUFkmnYiw/4vDff+SBZPt+LAbKX8cJESe/UJxow
	to8GSCDRF+gzczDkqvgSOo6p6vZf8aToF8ur/uADSbOJ3pDOaSTGX8sut3vB9GKosnsdMKZ+jiN1a
	Q952dpuZHvqsg8qhKD//37sc9frRXOMpTHXwZ+nBV5wA9CUo1+TVVEdBY4LkKZItvYWAOYKYj+WzI
	2nznE1PN7d6rh2PT/wrgg1QzlCFLiFT9XtSJ+eT0ZC/bryABsgcdg2HW8vjPRJMwax3uCKgUfbxmj
	aakmsxlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqac9-0000000EtrT-193N;
	Fri, 07 Mar 2025 16:31:57 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaU3-0000000Esrg-2l4d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 16:23:36 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-391342fc0b5so1245547f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 08:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364614; x=1741969414; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aTCtr0i4SG/QE/FNq50+gRW/p2tQeowoOyJAzQbTUXg=;
        b=QDl2y8zSJbjDXlmr+rc+Jo79pDCaFR8OvMrsSKOlSF47ql/bloHaXLjBCv3SHKElk7
         HifqNvrJ69WpCDI9uG9W4icxEJePHvVwYgr8hJ/c7mi6bxqvl0aOME7rSqCcP09Q5OSj
         t0VqqnciLiPhUpxKwmDrM7glEepL8E1KUtZCoGhap5lyFF4Vqg3Jm+vJ0qaN1W12Flrk
         YPaiR0gGK6DjhVf2ncUp8dhrNk6xfwmogBtXrhORRZeo8x9rtq3yhrqfv56eAet5k3cP
         RXiKrUmBvOPGZ3AS1tO2F8AEzStD3QO1ZhancNvw+cAnVsxUPIB+GCGPpsrIRj2yubRe
         I9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364614; x=1741969414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTCtr0i4SG/QE/FNq50+gRW/p2tQeowoOyJAzQbTUXg=;
        b=Bb2xv7ALC5lIku+rGLvy7eAe3J3KHzK+bZufUzN52R40RN/za43YaWTDiDR9SYLMvf
         OYKZQskP7EGaU5yQh4IvWCVYNaQSjm2P1Ar86oqgXddL9Bddcku9FSDyHl3qgC4qn/6B
         oYZD3IACrbGUXGLvyAL5iOB/BmzI2jZNbPYEzsxma9JM+Z7ph2h4UgldWtgbBTuBJX1V
         qOtgDi3jt/q3rh4yfCk/d5x7KssKkEuUMzRN1OOkZXGU6fCxgynqJPNH3NxwnyIVOflZ
         3gm33d0+ikzPIQ3YxcdSLPY1dF9uXpA5RSTdbGINxxbIrTN2ngepdkj8SGsTWEqkX1X4
         YRLg==
X-Forwarded-Encrypted: i=1; AJvYcCWqhSWcN74tndyyt6kgKzMp4XtoM6KQAsSEQyvaSxITJUJfY0n+LAqGYWiDXCfQGdHeNi68IC6CBqvmaJGQ8g2g@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7MtV/t81Ra4w+eWVHXU/Il6yv0DWoPPU+sDANVPLyW4EhmqAh
	kQ9DRshlTniCefKq7qgP9cOJycFS/pEtUdzeHu2JuVMnjiJQu1/a
X-Gm-Gg: ASbGnctO9Ywch0FUxVhtXA08xajQfljrOiuSB9KNN8T1j3apY6BsHRWCzQGN/n9DBZ1
	fzC6KGduU9hu+LiDE1Zr+Rg/I0PsoFGNKo5VdzK+Y9zRwb1+Ce2uLLZw6CwMo9kX4qcUbdrhL3Q
	VfuQSfObTmlD83tncr5N9VMcgWwmD73zmFhOz87ZKMD9SlTfSqxOppdHorlwA6KgaChrGJDnLTC
	fWiVpClsDmZ+8NpSCIk2IZpveF1/K+LCGSlx9ZrkWBUpWGWlq2K9kAtVEX/J6HTlzdZbA55AXGi
	Yz7aXH+cjQzX4Pqnd7qD+M6YAZ1czwYxC8QSJAwJgechi4jRvNjRNnyPOi3cfBy9PYWMDlK4bTt
	ynV+U/XrV3A2B8/Ifj95FpIQz39z1uviFMnrM
X-Google-Smtp-Source: AGHT+IEd+gRoPQ8KmABrlOREXez4/oLZ8nyQy5Gl1xM5wK9QbkF5BtSw7zOZUYVrcxnENMVPZJZadg==
X-Received: by 2002:a05:6000:2ac:b0:390:eb6f:46bf with SMTP id ffacd0b85a97d-39132d08dc1mr3526643f8f.5.1741364613735;
        Fri, 07 Mar 2025 08:23:33 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfdfe61sm5910609f8f.38.2025.03.07.08.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:23:32 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/5] soc/tegra: Changes for v6.15-rc1
Date: Fri,  7 Mar 2025 17:23:27 +0100
Message-ID: <20250307162332.3451523-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_082335_694696_2AE17E3D 
X-CRM114-Status: UNSURE (   8.65  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.15-soc

for you to fetch changes up to 5e63dfe213d01cdf0bb2786ae3d5ac613182a433:

  soc/tegra: pmc: Use str_enable_disable-like helpers (2025-03-06 19:12:37 +0100)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.15-rc1

A simple cleanup patch to use str_yes_no() instead of an open-coded
version.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      soc/tegra: pmc: Use str_enable_disable-like helpers

 drivers/soc/tegra/pmc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

