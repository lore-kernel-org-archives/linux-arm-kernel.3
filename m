Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3892BC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 22:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MrD6G6uWm4iVHDO8rhUuewFU126DhR2aJytxsLn7Lp0=; b=ZqrJqLBpklFhXSyUtOO6x6Scgi
	6kmMqh/yiYeo5iY27NxCneCNmFQOe/R57qRFYlEi+p5mAVjcQmsn7qh/bvCQO5xGPOlyxl7KC3IfI
	7SPx0eQO/x2t5xDCLaVVzpTTMw8F6rokwPZWvgXPuQd/5TyV+xAF60lvaklEzGmQ+y1ZynZBN0Hvi
	y1qwa64ZSf+ToVL7zcCBqHhgxTksM9U255H5y64TsNWViRKP/zTVZbSFKl/SriMaP4g4nONExBIiH
	VRPW0nHH/hc8oaUL5BXyWyRGURrotCYNb4pnqd7vyK2LCZ1CWPpEDDaIwZCazPKqMHgDPg92gUisf
	nDS8QhCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua014-0000000DBlj-3d0F;
	Thu, 10 Jul 2025 22:45:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxZD-0000000Ct8K-3w1a;
	Thu, 10 Jul 2025 20:08:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=MrD6G6uWm4iVHDO8rhUuewFU126DhR2aJytxsLn7Lp0=; b=XK5KcGVCB8LeKakF5wY/yVYI12
	t4kOalkuuU14wecXDzLDWi1hNqzgSllTkwak9I8K1kJTR9Zr8nqZeOEuJernz6aJo52e5TMNi7Nqx
	ut1NJk+k913/2oVrXSFbdM+3u1y2ZOdyhBAIzWkZ6QWVmYviEtUBxAa30oahAyyiD+oanmU/5+bgK
	ZthRF850T6N0bKvcxEi2pAZ9HNY92Eg5Rizhvs4MSLcKX1daUasxKWM3g3eYuMZfQ8ecrrKCifqLQ
	pGCxdjvW38Q8Sz78VFOV/XYm+ODajK9bEJAqqdej2MZqrqVb6oKCiY8kpuprIiRhD1nPGzIJ1PRSB
	BPuBhYUw==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZxZA-000000098xD-408h;
	Thu, 10 Jul 2025 20:08:26 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-74264d1832eso1982066b3a.0;
        Thu, 10 Jul 2025 13:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752178102; x=1752782902; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MrD6G6uWm4iVHDO8rhUuewFU126DhR2aJytxsLn7Lp0=;
        b=IYaMryCM4f+zVgJL8chBWVzLBDVCfx2lEgJnAyosvQsnfindWgctvSt9/Qz0n9nBU0
         ymoKLsZFNjE4HCCQnuiYfF9H9e4g0LcBAS74TrMN1uHRBZAwIVb6l8jZsgELeabteFlY
         MbuIvL0T7DBI6ArSysRi/xoXOZaZwvguRCGbpZlAhpgjrd0BEW3BE5YljWe6RHUkJHer
         DSU7XmWjjJeA9xzoppb7nj7x9eHZHIh3yUNkQsS4hpkg46Q9xky9aLzy2SVg4kxjo2eh
         uyT+58z723NE6MvnTh3mrlxZY8dOFloV/ULFg9YdfbnFmrtzeXmRw52NT5DVCn3XdpyZ
         MMyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752178102; x=1752782902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MrD6G6uWm4iVHDO8rhUuewFU126DhR2aJytxsLn7Lp0=;
        b=MV8VAGNJjLLEKQ+qcvE4shAWJQ0+PxNhq/LIshfM3PRcu+LBjfrVYgs7rtiwiET7QE
         8kauODEi0tltqsW07n1jRUPPgiZawlePf8xV318vfwQhPsZLAvKd7H82E8HnvBm+7Cgk
         nZXXxxx1jNtJDR+kdwHNJpwyUb8IzMFR2h3WfVF21DN+CU3/OL2RO1ZCYypnU1yCjooN
         5jL1AG/NPY12KI7uLF/cCHrisfF1NOliKYq5YIyDj0ok+2Hc6og29nAjKsx1XRu+Vyq3
         exyp4Ok/hkTOGDcSyrxYEcKB/10dycBTBkPw1IAt/uw5yQW7KnCR+OHg+E0sFqfQwWjK
         NvzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhFfWxjiQnGatvHFDUtndsb91gBJztX2PrfM6oGrGMNtEGzqg1Feh2aHIk/rGQZjrC+TBDZlvug82KTXy3wgJd@lists.infradead.org, AJvYcCWlSf7YPDq0S5r+py5/9RTNLcVqAbhEGwKXztIVlhvlyQF4qzkcL+dZZphrsdcHxZkysUuXupOJa4u7HJPaL8A=@lists.infradead.org
X-Gm-Message-State: AOJu0YxfPvqmQUvtWU9JHsf3ebo2KxMIwUCK4UXhXWXTBfZyRfnGYX3h
	d8yEhDvP7pGZDETK2D6UmPiALLV57ma6TgCwYbM31MLLC3a9blo/5IAJ
X-Gm-Gg: ASbGnctZBRxXI7aj07ug7K9I9rl1a06P7PzarLlpFpkHYj3m0WVg5MEB720ULPmvW20
	o2S7/3mBjEaYaxiqfLtygsi8Rumeg9Al7MQBVd0UEW4Nf0VDXo5lwqkXqquUE9r6w4WMHQ4YuSL
	dBYKpc68+VOQap2fRVpCPqtkxElubUZNNxWBb1EubsMyf6qs3aGtx3fZse3Xuu8hGQv/dwycgaJ
	ar9Q/n5saVPBIgw5zTSADTCYPSr7MMf7LveaKgf9GkJorJ9aG4DWrq03ggW07kSdV4jNHjACHWp
	Tym/KMUrujMbYMQ7WiqNElVyrn+K75Mt2mY1Daqxr6s=
X-Google-Smtp-Source: AGHT+IE6ziDEGlHzKPQcxsHZf+p+xEI0nTizoC/4zeszX1wWc3SyRmkm4rOzmm671Ky9r2t0WlIOEg==
X-Received: by 2002:a05:6a00:1141:b0:73e:970:731 with SMTP id d2e1a72fcca58-74ee2949c61mr396274b3a.16.1752178102166;
        Thu, 10 Jul 2025 13:08:22 -0700 (PDT)
Received: from archlinux.lan ([2601:644:8200:dab8::1f6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74eb9f1b29asm2729453b3a.87.2025.07.10.13.08.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 13:08:21 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stanislaw Gruszka <stf_xl@wp.pl>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linux-mips@vger.kernel.org (open list:MIPS),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCHv3 wireless-next 0/7] wifi: rt2x00: add OF bindings + cleanup
Date: Thu, 10 Jul 2025 13:08:13 -0700
Message-ID: <20250710200820.262295-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_210825_131249_323A34B6 
X-CRM114-Status: UNSURE (   8.41  )
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

It doesn't even compile. Added OF bindings, documentation, and other
stuff to hopefully this doesn't happen again.

v2: move all of 2x00soc to 2800soc. I didn't realize only two functions
remained for no good reason.
Fixed typos.
Slightly changed probe for clarity.

v3: fix wrong compatible in Documentation.

Rosen Penev (7):
  wifi: rt2x00: add COMPILE_TEST
  wifi: rt2x00: remove mod_name from platform_driver
  wifi: rt2800soc: allow loading from OF
  wifi: rt2800: move 2x00soc to 2800soc
  wifi: rt2x00: soc: modernize probe
  MIPS: dts: ralink: mt7620a: add wifi
  dt-bindings: net: wireless: rt2800: add

 .../bindings/net/wireless/ralink,rt2800.yaml  |  47 ++++++
 arch/mips/boot/dts/ralink/mt7620a.dtsi        |  10 ++
 drivers/net/wireless/ralink/rt2x00/Kconfig    |   7 +-
 drivers/net/wireless/ralink/rt2x00/Makefile   |   1 -
 .../net/wireless/ralink/rt2x00/rt2800soc.c    | 102 +++++++++++-
 .../net/wireless/ralink/rt2x00/rt2x00soc.c    | 151 ------------------
 .../net/wireless/ralink/rt2x00/rt2x00soc.h    |  29 ----
 7 files changed, 156 insertions(+), 191 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/wireless/ralink,rt2800.yaml
 delete mode 100644 drivers/net/wireless/ralink/rt2x00/rt2x00soc.c
 delete mode 100644 drivers/net/wireless/ralink/rt2x00/rt2x00soc.h

-- 
2.50.0


