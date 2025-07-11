Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525DBC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 23:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WiEoirSuxHsjo9/zUoypts93ySUADZW6qbVGNgsxEik=; b=Zo93hhlWRWPlWk/t06QRYDSJSm
	Lrew7atDaokJEwT+iv9Y9dQVd2s2Gb+qexWjSvOxRpf+nJm3Yn/gfK560n9EGxaN1Tp5JD9X5pbE3
	NThTZU7Y3VydIY9goZuTjZr5XftDXOFdO9CDUTux/WvQksIycj2DnHriFBj+eCmW4cIx4EsA8nhMk
	qiC4DsNoNt4NSVIOUYIyI/KzHvVcqCN9rhoYB3wLUvMD+AbB+FWufLBfeyGIXwflTkLaEkc3kzlTL
	z+GyYrY52E7Y0B3I3ZCHkfB/Byt0Ns/12jflkmXXTHDyUmxqCunzPTeZYz96O7eSbQ1sZC2j38wmk
	XaINVNrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaNB9-0000000G1Tt-2YDu;
	Fri, 11 Jul 2025 23:29:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLwH-0000000Fw15-4B4M
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Jul 2025 22:09:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WiEoirSuxHsjo9/zUoypts93ySUADZW6qbVGNgsxEik=; b=MOSrfsP1Ex0imUmqclC/A2d4wB
	uMwSfeZI8RaITH8yOuQXPhHSBOeAfb+Oj5BNMxw1nZDDcr99roThYwGG0C5lIKXDE6tw0s83Gp880
	/kGxR7CYlC171bpHjWBpjJPcNrAUMcI+2VVaQ9uK4IXPXXlqM7fva4B+80boq6A/vXksLgMjOAN6h
	I76y9zUvOY4tQyiKnYKhPCAfJC4DvBvrsaO4fhVRjkkAJaMjD0TGXTlsHeYGhYWGl4c2J5nT8YnM4
	teYH/A6XYHpdxgKRmszOi+2jnTTXnZ7dU73gUmP7Hv/qevO5NQFwgRhy5DiNywfMfQj50hIg5q03V
	EcXvl3dA==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaLwE-00000009Msn-3wHu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 22:09:52 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3b5e6bfb427so1358659f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 15:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752271789; x=1752876589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WiEoirSuxHsjo9/zUoypts93ySUADZW6qbVGNgsxEik=;
        b=VTHvgIapP806yg23nwN9GNfEl7LBWTlxUkHvy4GpHEZm34qBBltTJ1sw3NGUmRBKBY
         Pnm0TSzHgwfEZIq9gnYkzs03cliRzMamutsIjIe3A9RF6fI4exVu0RkOgOA+k0GdC/uo
         a6XGe+VDHPDa4n4I6kxoMRHAFFRlhvsUhkhm6U/zBjZL27P6bSQL4WNvsjy8IAMsSoq5
         4KYcaeQpqGQwFMgpi2WidOy+oGLTwym28GezJaVhIfLlG+bgNycmiJ/6hqLVKIrH1/BJ
         TkxuDrXkQm+u/Vw6250qAAZZjSJSA5ah7deEpPGNIB6nD3vDYN7bQiKYIc2vT4Zz7O3a
         ndpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752271789; x=1752876589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WiEoirSuxHsjo9/zUoypts93ySUADZW6qbVGNgsxEik=;
        b=vg2KSOq8y4BucRUK58O79J3HYRZP1n4ky7sUKDlfdRNkjExZzPlO9xhyednyGqJuU0
         Ua5fvuNjIl2dZKHtQKRwh+ZX9VSqaZR1S+/1PqPIS+81YwrLkyJfJCdSvq8i4n0+4zHD
         YQExd26vFBXL/s9dpAw7qozNJB9+hDg8vm902XcHw2NOW+OjHJ4VMyGQLAiq6LSCNghA
         9GVSLX5S8alaImm04SyXV57knGTbZj2KSzmhezk1KdR9A09fP9dVoH1DlJabDFiQewY/
         W8/IPGfJOtrKVmYeQ5PTZKvwwdHTyZI/6N7g3XiOIzL0BueqCHykJI2YQHmQOHaf5Iul
         C4kw==
X-Forwarded-Encrypted: i=1; AJvYcCXbQ1xeIIqxEJoZfzdpiCBkpzMC+pQICYGvBIvirV4UNEou6lCC6/P2IqxRApZcBcI/It1wUdqTlvBknPup9PXg@lists.infradead.org
X-Gm-Message-State: AOJu0YxHQpv8vHYM8bE6B4LxDV0JbWawLfHGoirysHeqj/6JsiFZVHu9
	902WU7YMllYcGAWkgLa+D7Qvtlti7Wgt8Wkeu7ku6Z58Ri8+zPloOvay
X-Gm-Gg: ASbGnct8tmGqhJ45u43pFQtvTSixPXkQIaByInlw0tJZOSQzlK4DG+Vs//aK+b+udSu
	DHzDeYz0tpQKxOiftyclRxB3+QY9Go5UsbUegUFoWO4Q3JR6nNnV/wg8xVk23VxVIvJji3W36+q
	Q8272LqbPx+WGD8wxQtXJlIMX89NiTIvq4WoBGWiyl9bEJjeUZWYBR3NhrLKjcG4VXgvNeuS7+A
	6bNHb2as/A8yIRsuTgdu7AZE+VxE9jRu+fJkMiw5e2wQJa+tIppwUiWGi/OB+ng3/SIn/jiS/nV
	eUbngtNjtRuBjGQB9Nka3LM4IGGh9cVm392G0YM8NyZcrbMEWewCqSX7k0H3s7BjfaM+pj3XHR8
	46Y7iAfLVsmEGvplCU1P1qX/Cn80ievCsyHVlYWump422HrcPQfsei54HWHt7gxkj/cad+Jq/S6
	yrCcIyPF6bltd1iA==
X-Google-Smtp-Source: AGHT+IH1Nwmj1nJTt0Sx523oF3zbT+IqMBHza1/CIgwExgeLZ19zMtKml+bp6x6d1S9hslRC9/KXMw==
X-Received: by 2002:adf:fc11:0:b0:3b3:a6d1:6b57 with SMTP id ffacd0b85a97d-3b5f18d96e8mr3631673f8f.44.1752271788727;
        Fri, 11 Jul 2025 15:09:48 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b5e8e1e1a5sm5495462f8f.74.2025.07.11.15.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 15:09:47 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/8] firmware: tegra: Updates for v6.17-rc1
Date: Sat, 12 Jul 2025 00:09:35 +0200
Message-ID: <20250711220943.2389322-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711220943.2389322-1-thierry.reding@gmail.com>
References: <20250711220943.2389322-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_230951_244826_D9179592 
X-CRM114-Status: UNSURE (   9.99  )
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.17-firmware

for you to fetch changes up to 83f96a7eaaf0e3ac1b1447f74a8d3b2213187b6e:

  firmware: tegra: bpmp: Fix build failure for tegra264-only config (2025-07-11 14:50:35 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Updates for v6.17-rc1

Add Tegra264 support for the BPMP, fix some dependency issues and clean
up some code using new OF helpers.

----------------------------------------------------------------
Arnd Bergmann (1):
      firmware: tegra: bpmp: Fix build failure for tegra264-only config

Rob Herring (Arm) (1):
      firmware: tegra: bpmp: Use of_reserved_mem_region_to_resource() for "memory-region"

Thierry Reding (2):
      firmware: tegra: Fix IVC dependency problems
      firmware: tegra: bpmp: Add support on Tegra264

 drivers/firmware/tegra/Kconfig         | 5 +++--
 drivers/firmware/tegra/Makefile        | 1 +
 drivers/firmware/tegra/bpmp-private.h  | 6 ------
 drivers/firmware/tegra/bpmp-tegra186.c | 9 ++-------
 drivers/firmware/tegra/bpmp.c          | 6 ++++--
 5 files changed, 10 insertions(+), 17 deletions(-)

