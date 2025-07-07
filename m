Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F74C83030
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 23:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1fi5w0DR+FyqjgkZcHHsVS9qWZcL5DthmO8OzA77qp0=; b=KLtRcnJ8/BdtpFKiyC9Y50w+zt
	7RVGXzG5iPxndZp6MVGRII2O9UKUyAIc4vpnzqyQUYha5iVZ1gNVBEvUueyIj/uh9ugdTfKGqVt9T
	jzjNEHcIT4XA/yDAnrD1Z6ID1x6JFYKAgzcPHUA2mUj+S+s32pw2u4UyXsQB279ixlWB5NPXbkfBL
	6OEwRb37iYnfvR9dUbHCPXs0fhted8JEZ7xn2UV7qBVjxlvDKcmoS8LTOum3DrKvPTKQrYn3nArYi
	MogZbhNhpIHYgAUZG2Iv6IWfq6zUXky0tAqlD6/i0Ld6yTcfUolvi1Vt6547CbIlqmPgvK9KbkD5b
	qgWc5KYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYvcJ-00000003oFi-2QVZ;
	Mon, 07 Jul 2025 23:51:23 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYvXl-00000003ng8-1bTb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 23:46:42 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so625632566b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 16:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751931999; x=1752536799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1fi5w0DR+FyqjgkZcHHsVS9qWZcL5DthmO8OzA77qp0=;
        b=japW5A2ED1PuWXMvQEwbC00UNv+1WTQANAEwE/3f9peT2vCK+MDYkcbOqTbkLu9pX6
         E+65Zj99+WRI2W4jpFy9fpbtijpvCUCrwScNKS9fzZw1WvnF9X2TlmOv2jQqaVI1GkVL
         ibN4BAMIv4eYDRO8zPnA261V52Ni17y/BUN5M6Cc2ypkn7SYDaX9pVPiSOVCXux0fqBP
         P6D8lUyweXYngvjEwsdjj23BI7Y3gie7D45Fy3mJvf5FNJI8S6DER4um8b92oof51XrL
         1znY5qPO4AdpAOU6HSJYUj/N7vofiPgW/29d4Z3cyG6cZcbg8BO6ZHysLgTbhk0VrjoA
         s1qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751931999; x=1752536799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1fi5w0DR+FyqjgkZcHHsVS9qWZcL5DthmO8OzA77qp0=;
        b=tPKZjn+AxT8WzC2OuVtHGUIpt7k2nIpl1rUuxkrJP90vrwg/hVqqIcWVFMHimaxit+
         gsj/Qi5BwG6fv+rFeDw1xjaGQZEiWJxIy0J+CS05QWV0mXW+V611+1IrIjFbT8+16TJm
         n1y95kmV2TrnWxF2wUUj45wXo3peOY4r/uLf5uGaYJj22xHLzRz9EI+hTTxhaZKMOC//
         sKal5z2dBeBTa4bbFAsIC+wiM8YmttQAQAiZRa9yebjQt5kU0vXwPb4VVKlzLYXois2d
         kRNNfZFOdpFfYACoou5dp3d0djZ+7zflPJqQiHmknaLiVKGiuMGYQxCE0ehNKZ8pV8kU
         dtJw==
X-Forwarded-Encrypted: i=1; AJvYcCV+OZ1LQ53ck6TA0bOlRJNfC830lmHjXEP7kgmAM7WXMEEzmTqzDS0cQSE4L3W7QFCVTQh/XV/X8onaKkxv+E2f@lists.infradead.org
X-Gm-Message-State: AOJu0YzCsfjCG2SfpvsUZwzH5I+FL7nXjhK0JtxXFsz4LT5tyINBt68G
	0+JL8Em7FDnshZJuO08zOrUcd3e/0z2r3VyOZLyFBlImBigoc+do7dWJ
X-Gm-Gg: ASbGncsfQojv+4xWaNuZPSXKtZBSW9pzjqqUvLI4wV+HT495WVm/ZVclbH1hPxRSpTs
	0MyOVWeGxTj3Euf+2bUZBgaE94NVYp7UoowpKln2KrEgGAWfYJrWFQN24GiI4u0g6ZYZABpwWO7
	A4888Ro0yv5yJjwPN//6+3YAUaUpcf+017kdKWXUSFvPwTWIEslJswsmp2e2RfAcnlLmipFsfFL
	xVf7eRSDkl5auXGHXz8eqI8x7GOURgSB3yu3vq3qxKUz/KThY72i7s8QcnFjYdBZdFuoGADcqO5
	JxfXZR6xudLjudGXEi9cX8084AQ18pZ9cXs0OqwfKLhAdfE8vEEZO/qN4Mk8TueD+wdoX8qYmem
	U8nUGIjXBvxrOb+NK3gdDGHQ=
X-Google-Smtp-Source: AGHT+IG8IzAN5Gc72bWerrOtzcRkbpj2JL0dKhrGlpVZA2c4kmwm79VJMsV+AFaKrJkxF9i66kiHGw==
X-Received: by 2002:a17:907:3f0d:b0:ae0:db23:e3e3 with SMTP id a640c23a62f3a-ae3fbc56f54mr1529856766b.16.1751931999299;
        Mon, 07 Jul 2025 16:46:39 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm781539266b.7.2025.07.07.16.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 16:46:38 -0700 (PDT)
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
Subject: [PATCH 0/2] bus: imx-aipstz: fix probe-related issues
Date: Mon,  7 Jul 2025 19:46:26 -0400
Message-Id: <20250707234628.164151-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_164641_420860_1467F7FE 
X-CRM114-Status: GOOD (  12.13  )
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

Since the introduction of the i.MX AIPSTZ bridge driver via commit
796cba2dd4d9 ("bus: add driver for IMX AIPSTZ bridge"), a couple of
problems have been reported by Mark Brown and Alexander Stein. Namely:

	1) The driver doesn't get compiled when using the ARM64
	defconfig [1].
	2) The children of the SPBA bus do not get probed [2].

These issues are addressed here by:

	1) Enabling the driver config option in the ARM64 defconfig.
	2) Replacing devm_of_platform_populate() with
	of_platform_populate() and passing a reference to the bus OF
	match table to it.

[1]: https://lore.kernel.org/lkml/ac1daf6b-ee06-4076-b86f-b436ca0acd6d@sirena.org.uk/
[2]: https://lore.kernel.org/lkml/5029548.31r3eYUQgx@steina-w/#t

Laurentiu Mihalcea (2):
  bus: imx-aipstz: allow creating pdevs for child buses
  arm64: defconfig: enable i.MX AIPSTZ driver

 arch/arm64/configs/defconfig |  1 +
 drivers/bus/imx-aipstz.c     | 14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.34.1


