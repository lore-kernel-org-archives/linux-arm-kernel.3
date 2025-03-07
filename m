Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00B7BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 16:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bC3W5Jgyz8sK+kS8zy3FrVrbANi0rcZdKDzcMLG0QyM=; b=dIowPXbA7OiXD2FeGPzoGBr1+d
	vgquHbOjIRS1yM0GbmliojbJrzGFV9PYvv4EOpYYV6yS74HSrdK0Q3QkW3CsxopBtWSpvC+l6kbI0
	xL+g4WUojv8hW2JUpRAybYPAM6/K5mzX6XMEtJaXG/84PSEAi6wOzsyw+3xsWXSmP2QFIOlCTs80q
	g3Vc5YTnma3OOz7aN0GZEx2zKsBzG4Ovc6ye0LwzhiRjLgHItT8nXWqaegs0FWEErftssqZHyOGmZ
	epXGIgzXudGcpNAEl3CFsnR5KULR4+TMn1FmvKlrL7DiDTAxUrpVdN53Qzvb8D0hVl+OYk0sZYzTt
	hPTBD29g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqac9-0000000EtrY-3GdV;
	Fri, 07 Mar 2025 16:31:57 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqaU5-0000000Esrz-2BlV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 16:23:38 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-390e3b3d3f4so1086074f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Mar 2025 08:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741364616; x=1741969416; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bC3W5Jgyz8sK+kS8zy3FrVrbANi0rcZdKDzcMLG0QyM=;
        b=kxnuqQnUf/L5E6cvCucrC7Lua4C+yC3z2vltXV98uPInjRMTxBO12nCx/VBsNelB3c
         Al8iwD9ur3Nm4+ZX1khkYV8IsNtpNdj/RBbkaWd3GgdbmVtMMVG8orJMuE62fmO7ojxf
         9yUZzs9LZOkc6Dbko1DhiqdO8wW5sq31ZA2hesSI2phDwM9lMcrgFSLBlLo5SPtpflju
         p2bL0hRnlyUlRce58b2VTcCLrtwfS+mrdzgnGd+ujKmUaNyGEbTDcijK4doNz7YcGPNM
         UhLmGRiSsBPUA3o7rSenMAUKGMazgiY/psAFVI+WsyYR+QSItXrykhw0laR4QkmsziG/
         LLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741364616; x=1741969416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bC3W5Jgyz8sK+kS8zy3FrVrbANi0rcZdKDzcMLG0QyM=;
        b=n+khNPTakDaWZgkdM0RrOhp5yr62QapWygtJ+zkb3zMgvdk9UF8LnkB7zR5wmsDLwN
         qGsocK/l7sIbXO6lIDh6jFbIQYGhvnNKxWdtGRK+Igk1JRU1s6ehZDSJI6EcmRj/+XtL
         +rYkxk9C7EcuhmHchWWeZsNXaJYsUaGpqxF6SZSYVRsI0OyZqj/PPby2Zq8c+ltabd6j
         f9YXgidJDRBBoGhbnCdbVz3ynCzMjzUpNJFutfUnPQQS3rqo8gIDBPrP4luypjYAz+SZ
         srEfWRfeqvios1slFBQzrgvTfe7MoIbMuFXIHEELK8Ph6N0r0xvhgpJYLlk11YGMTlPx
         CGIA==
X-Forwarded-Encrypted: i=1; AJvYcCVH0jR9tIs/LE8TzxtHlBy9UK+xHmM4wovbZS+Q6i41aFfIE/mEeU1JDmtxq0OmjhkT7u6z6cK9CwLhONY0l1LG@lists.infradead.org
X-Gm-Message-State: AOJu0YyJlufTQKCzuRm8kpZH5rpM1lds6pVT321QU0UKtjfN87CJ44r/
	5MBV6JhX2WvR6l//MSEWuW+UACLofdH2PSm0VKJN0/rIjT2E3UXk
X-Gm-Gg: ASbGncvrlcoI7hC0WsVHAYS2oonPjOL+ZqxNunNP4Wlr/Drbej9EVEaUPxZIl0tP04d
	2UB00w7sfGp+um5FfX41EWsXFICKgxeGm90UGoDwPYGk0WPZ8tvRADdbnd1rzcurtSbjBEAGgF2
	ZNwguIZT72yyd2D9ihaGB92uRerDVBLDcqBWwquiEIKd/Frrzc1Ms+Ju8dpjlbMaqG3UGrJlnZ0
	PixMGZniFL0yOGcTvkZa/ME5NZrL5D1BG3k+7GbZLaIsSNJTPmJ1JYrQ7OeHK26gJog5DtQfd1a
	b4h9z87P3bXVtYsBf2smmJxoxTwKdR71c3bAhj2cza7brksTGNFMZ6O7ur6LoLvxa4Su3FugyUK
	Tge6qgef3ZuCG0l7xWCD9FtpsuSsFn5NhgPfq
X-Google-Smtp-Source: AGHT+IEebjr3w9CsyhbfSL8ojkUic5W+TW8hWHGIa3t/IyTg+mTMNhqyhq716AMCymk8pTN/S5VM6A==
X-Received: by 2002:a5d:5f45:0:b0:38d:d9bd:18a6 with SMTP id ffacd0b85a97d-39132dc545dmr2401035f8f.42.1741364616020;
        Fri, 07 Mar 2025 08:23:36 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c01567fsm5706991f8f.41.2025.03.07.08.23.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 08:23:34 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/5] firmware: tegra: Changes for v6.15-rc1
Date: Fri,  7 Mar 2025 17:23:28 +0100
Message-ID: <20250307162332.3451523-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307162332.3451523-1-thierry.reding@gmail.com>
References: <20250307162332.3451523-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_082337_557261_176ED66B 
X-CRM114-Status: UNSURE (   9.69  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.15-firmware

for you to fetch changes up to 27321c788b3aa238af3c3234dc722a30b62d8dcd:

  firmware: tegra: bpmp: Fix typo in bpmp-abi.h (2025-03-06 20:02:26 +0100)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v6.15-rc1

Not much to this except for a simple typofix.

----------------------------------------------------------------
Zhu Jun (1):
      firmware: tegra: bpmp: Fix typo in bpmp-abi.h

 include/soc/tegra/bpmp-abi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

