Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E43BCE77198
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Jan 2025 02:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OYb0qFT4xNRqbSd0yzfW3pxzgxiWHcPjDPKxST8NQXE=; b=wfUWQ51WnwbACNOkEL6oBboNTc
	/BD5TQWYoPCuLEDtszTi4R9R9ORCJXJkokl3mWRIjpxeto5zBEGOHIwNJ6UFFGGat1+F7LLUyKxhf
	szQ2ogJniXHBDjZ0kFwYsdHGHsMbAMFUkEu8P87lDMh19ONt+ZpsVAWnrtginpHDfodkrvvYXDRQ0
	Ifoe79Qi01tNW+i+z5uGkIjWpgfRFYcK7mMZnaRa58pBNZ3M2OLqe/c75SuC9qb1ZiEL+/PDZ3uX1
	r7jF25PhBEvFp23V/WmptvGY7OYFYqyeRkj711uDBb4OT0epGKjmgK86rjOM6aHoc0He8FjqhYifh
	FNME/Maw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTtZf-0000000ELNA-3xlb;
	Sat, 04 Jan 2025 02:07:35 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTtYO-0000000ELCi-2FTN;
	Sat, 04 Jan 2025 02:06:17 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3eb87127854so4058232b6e.2;
        Fri, 03 Jan 2025 18:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735956375; x=1736561175; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OYb0qFT4xNRqbSd0yzfW3pxzgxiWHcPjDPKxST8NQXE=;
        b=OjMQ8ksby8EnTS4z0/0wht8cHK9jW3xNEohblKnUj+wyvxLqt4dsN0vpY1B/lnm1tE
         74PptRog7HnxnpySnvI+VdHhG1VjXWgRlpcHtRiWkjc/WZw/8e/Y/R8eQy4wvxBHOsSo
         eODK2bCaJYj7h3Z9lFoqeQ+/CA25avE9LNanDPj4yADlm0Eb37h3bLacp0sIkikwGwYQ
         klG+eS8mGmWEEqipGzq8qvY2+G6en9j7j3yasUTkVk5NmppZRo9QdCYZf8JD4wmeN7iM
         jYupcG/P/MEibX4ZDBjn1pqKA/EgXL1EDFBU4qVQlPU8JZCHutFAtmHgTnwwtEgpL71Q
         GhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735956375; x=1736561175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OYb0qFT4xNRqbSd0yzfW3pxzgxiWHcPjDPKxST8NQXE=;
        b=DlUCMUJhYHyoM7Cer3cDz4Uz6Shvhpelb9pO6soPYzK/y3WsheNVCWCXj1gR2Izdai
         bBuarHb/d0TtGMfosaCK7nVkOy6wQt90GdZr66TPby53CfsgjsuzlMqaaCVMIz2bZ2kR
         3oHJEEKq9AcYYfDBTIQmvZCKHPgsliperBdyWAZff1R7jEzyNAw0JmkY+yabGYAuzd9g
         PJlPlVbBFa1orpk/DNoCuwTevK8oTsVsK4qzF4zbDjB6L8cYaQM/XwS2EYb/8SSSeDTK
         eRVPXYI19WW6yMHjLJry6ozXcdClMhWJsVGDgjbY1UIrUjUlbqK6d2GOo1vcdZ4uQ/8X
         dcVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7RbzYSkfA1eNoKTdwKT+Y4uB4Y++sHMLQymryfA8o3jwMHNG7qkpm5DzzYZN/B+fdq4olo2Y2iUybTDx0ZRa+@lists.infradead.org, AJvYcCVcN9f9NkZaet0pqP9oNBtfVD0LYx1wbAjZeNQaENKzIrtycEbH+0BVOt07QALjBss3MJXIJj0o1PX2cwWZ5pE=@lists.infradead.org
X-Gm-Message-State: AOJu0YxJK8cAjRnxP29gvAIWCCgBlqhKRSfdDeN5k8P34CX/iodgRW36
	Uxba+VOQdZ4txX7ieuZQNIontg0YF1ZoyRItcT2D+ozbkfo4JhPd
X-Gm-Gg: ASbGncvLaqJcnbDgqY2uHU1uZYqXEl4QMvIm8jvJVEilF+7TEOEXBVOd+BU7ACD+AaP
	MBbvU4j7afoPXEF9DcE+oby0+rCkvC/3DApWGaNQ9kdK9GPgce4uLPiPEgLGVq+xkpSPkEskL/z
	cj4ioVAScfpWRkGm8ZBBcXdqx1BeHtSHo3psTjxnhufWJXhOPn+i91T19fatlMtzbpm7KhkaOH7
	A7uPb/CR2sOIMDZiReHw1NwbOe6zKfuKzGJik29a5TrkTGbz/jmtBLyE7DIHd2QHA==
X-Google-Smtp-Source: AGHT+IHVvrnXzgaqHx2pTSSQxMbOCL2qiRxIqwKYT2ArKTJ/TAhARkxGQVgvgWyIgP+0ezHSfqi7xw==
X-Received: by 2002:a05:6830:71a3:b0:71a:6845:7d7a with SMTP id 46e09a7af769-720ff6a7e98mr32360970a34.5.1735956374674;
        Fri, 03 Jan 2025 18:06:14 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:7057:8598:1940:24f4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71fc998ef6asm8406568a34.50.2025.01.03.18.06.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 18:06:13 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH v6 0/4] Orange Pi 5 Max
Date: Fri,  3 Jan 2025 20:05:36 -0600
Message-ID: <20250104020544.6777-1-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_180616_588312_346D6538 
X-CRM114-Status: GOOD (  12.53  )
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

Add device-tree for Orange Pi 5 Max

Orange Pi now has 3 SBCs using the RK3588 SOC. Refactor the common parts
of the 5 Plus DTS so it can be shared with the 5 Max and the 5 Ultra.
The 5 Max and 5 Ultra have a similar credit-card sized board layout and
will also share a DTSI between them.

5 Plus: HDMI0, HDMI1, HDMI RX, M.2 E-key, USB-C
5 Max: HDMI0, HDMI1, WiFi/BT using SDIO/UART
5 Ultra: HDMI1, HDMI RX, WiFi/BT using SDIO/UART

Changes in v6:
- Remove clock-names from incorrect merge conflict

Changes in v5:
- Include Orange Pi 5 Plus USB 3.0 change in baseline before refactor
- Defer Orange Pi 5 Ultra to a later series
- Defer Orange Pi 5 Plus HDMI1 to a later series
Link to v4: https://lore.kernel.org/linux-rockchip/20241229184256.1870-2-honyuenkwun@gmail.com/

Changes in v4:
- Orange Pi 5 Ultra was released and does not use VP0 to HDMI0
- Move HDMI0 from common to the board level
- Make DTSI to be shared by the credit card sized 5 Max and 5 Ultra
- Updates for the newly submitted HDMI1 support
- Add Ack for dt-binding

Changes in v3:
- Refactor to share common include with Orange Pi 5 Plus

Changes in v2:
- squashed commits together for initial board file

Link to v1: https://lore.kernel.org/linux-rockchip/20241026100310.52679-1-honyuenkwun@gmail.com/

Jimmy Hon (4):
  arm64: dts: rockchip: refactor common rk3588-orangepi-5.dtsi
  dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Max
  arm64: dts: rockchip: Add Orange Pi 5 Max board
  arm64: dts: rockchip: Enable HDMI1 on Orange Pi 5 Max

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +-
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rockchip/rk3588-orangepi-5-compact.dtsi   | 151 ++++
 .../dts/rockchip/rk3588-orangepi-5-max.dts    | 101 +++
 .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 855 ++----------------
 .../boot/dts/rockchip/rk3588-orangepi-5.dtsi  | 805 +++++++++++++++++
 6 files changed, 1127 insertions(+), 792 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi


base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
prerequisite-patch-id: 6346d482f91509dec24bfe5d4f0ca0d345b90deb
prerequisite-patch-id: 4672b745f4308a7be527749279edb71625d120e6
prerequisite-patch-id: 2743fb64eba2a29eaf993ebc8a5d6ee445b69dfa
-- 
2.47.1


