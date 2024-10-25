Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E78D10399
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 15:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=o4jm7E2HySnELyG9zm7DDwvDwm6AuAvYPS0Zt6hbJzQ=; b=O38AvnY5mnEviLFJWOfq+SS5ho
	4sMcyU5Hc1QbcUAhVI4P3OKqWjLb08+XDkeBo98ArxL646XewBFIsZjeUXMfXA5qOFaCnB7n9mjLX
	Wy66Ppm1tpuzHGLuj298hngmmgdKlVsW3/aZUfyKmY6mfWJC0Shfw8IPE0qR5GlB3NRw5UIEzcPBW
	Lz5g4uH6uC5V4Dvk/DGco8YKHGJ+izv4YrztEdJrhzLQttTex2GlPbMIycH6YSbBqphyhEtyZ8/TE
	oDDQ3pjoiZ456WS/XN6Hu4ij5pwXjxrK8StWLJwGI+1CLU9rnJmkTlJRklL1qSsmAIjuaCzpda/1z
	yM2kNBtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4MFE-00000004FPY-2Ofd;
	Fri, 25 Oct 2024 15:28:56 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Lt0-0000000491U-3mRp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 15:06:00 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-539e13375d3so2609362e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 08:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729868757; x=1730473557; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o4jm7E2HySnELyG9zm7DDwvDwm6AuAvYPS0Zt6hbJzQ=;
        b=iThtzTWEKR7I+QfMzPntrFuaO4YS4NLow2GyVsaBDqsN0klrn/sVsh2XKD3KoN1kQZ
         ak1CPiTp5ZZZuRQMYvHUDE0ocfKS4MXrIsJ8MbcFG6GIUcJ/C5NzGonox8j7SxmSD81+
         wO9izCLSNHcrf8ArU8DzSF75kdlTo+p82nvt2hDTvf2slg44ZuVic6cgZ0hHiwc+9iVZ
         HrUmy6PUxZevFNWcCeX9Dt/3dktaom7J9Nwr2xfYdo+QL4akxahd5bjvRsDPb7BtysTM
         6RaRY4W+nPDxMgjRCjcNCzypkqJu5wFp6YQ+Zn+ERQuDBYsmKYjDFx0G04So2n0yjuQH
         wZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729868757; x=1730473557;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o4jm7E2HySnELyG9zm7DDwvDwm6AuAvYPS0Zt6hbJzQ=;
        b=Y7knly4H+7J8mQkVoaEWWkpHfv/D1UnOPPAwvouJhjh2UTR+Lna+frZdNLP5gT0a1L
         4SJLj86uwNmhG7PfUFWjkPqe7eqXThgWHxJVF+K9njyW5L8b25wmU3TLH/XhixXJP+hs
         FDUdG/Nw8bmEkUT38EvFBJhTmqI7racn0/qtxEqESE9JKlzmYB2Rxo+pLYVNrFZp67Kt
         wqT7x30iQjkR2q1GghvhyHY3t0ZSAhg6wk2FVafHwZ5PFnl6SiLVrllNo2FrAKqsehqZ
         wNv5l1r1F1vVGgrg8CcxtgbTg0n2kBqsGS2FDI/sUv7hjss5ykaOEOMFxP3reN7DUiTi
         x8iA==
X-Forwarded-Encrypted: i=1; AJvYcCUirfEsfEJC29SksxcKVd5H3zWtzf1xpLtB5gx3PYWvhMGRopV/YUM1AYf0Pifvb86m+U9AgzZLtt0kWtjU6oke@lists.infradead.org
X-Gm-Message-State: AOJu0YycZc1B4qFolzsbUZ/JlDJ7hLYwYpgV197GX7W4FhxI8tewqW5p
	I8+M8gfa7U26CouQ9OXdZ9zpvCvXDafOukn/EGvEIadENXz3SfkL
X-Google-Smtp-Source: AGHT+IHTM23FL3bJlpdISIMVzlbuGYE9A6hd7jLPKz9nwIWo6tnhlsoUHKmmW3kzgkp6OuVhvzyoHQ==
X-Received: by 2002:a05:6512:1594:b0:533:4689:973c with SMTP id 2adb3069b0e04-53b1a33312amr5892835e87.23.1729868756328;
        Fri, 25 Oct 2024 08:05:56 -0700 (PDT)
Received: from localhost (p200300e41f26ec00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f26:ec00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4317dde77a5sm73187855e9.1.2024.10.25.08.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 08:05:55 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/3] firmware: tegra: Changes for v6.13-rc1
Date: Fri, 25 Oct 2024 17:05:51 +0200
Message-ID: <20241025150555.2558582-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.47.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_080558_969096_7DE0A23D 
X-CRM114-Status: UNSURE (   9.25  )
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.13-firmware

for you to fetch changes up to 61c6fe3d6f0e1606a2219ff8afbac7e5068a5795:

  Revert "firmware: tegra: bpmp: Use scoped device node handling to simplify error paths" (2024-10-24 18:38:07 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v6.13-rc1

This contains a revert for a patch that I had modified before applying
and the author didn't agree with the change.

----------------------------------------------------------------
Krzysztof Kozlowski (1):
      Revert "firmware: tegra: bpmp: Use scoped device node handling to simplify error paths"

 drivers/firmware/tegra/bpmp.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

