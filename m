Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD77ECAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 09:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jUgn42r5a8mNNBXp0C9lNyB4hr+HTa+eeMoWV7f//J8=; b=S/SPNP7swGvNFR0Gt83qZUuZSJ
	Jus2tJosC4kekPJ9hSyWNyzC9Rp4/D4A6jAuuRH3uPaprfxWV2lca+cP8KuDXAUHDisz4DuyEkaye
	zTu1+c81PCurxdY5jZ/v80sm2Qm3a0eif4+IaerUCgTXVbSsm+2y1fVWNVu1h8+alq1DXEbir2UGd
	GJAReUNS6YWFTgpsaXBC0J3ixOzSb9MQul+c9NLx4oSxfEwKAYfRdfMaE+PQRBpNt2ZY55mmpsQoa
	5Df2Zds86pZ8QFjP+FjvfCR/h1fVVKDOy7OSYWDDxPqo8+zQ1zlFw0u7eF4fAZy+dA+gAqCjcyOkC
	0iWCuxAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iAH-00000007XXi-3Brl;
	Thu, 25 Sep 2025 09:21:25 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1iAD-00000007XV4-3c1p
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 09:21:23 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-b5565f0488bso535086a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 02:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758792081; x=1759396881; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jUgn42r5a8mNNBXp0C9lNyB4hr+HTa+eeMoWV7f//J8=;
        b=CMGG+RpOKmHunINqUcsb65dxv2qSfysDewW2rVtyHu9aKqA37d56Cmcs+q5CdddAUa
         8XYLVaKfNb5NSJKCEIZi+NeaOXJT8Aw4twRImF5LJ/17bU9E3ctUf+Ykt0IzIIFyMRAO
         OL+3vwnxnyTICzUN41EihrJRrnMNNDVDtx/dIicMKbhyQm3kZNPeVC/pc9yoOU+hx5YQ
         5M4Zup+eo8Frwo7AfMVrZc8xV3qdiWtdmg8PJ2d3Cs5q6aaqoidrzWaPniWX/OpTZg5Y
         QkK2F2FoPRJRCLki/uL6Dzuk9nFGbUYoDy8CEN7TDgworBRlaB9qt3rqlYXcOj5KUzXJ
         s30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758792081; x=1759396881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jUgn42r5a8mNNBXp0C9lNyB4hr+HTa+eeMoWV7f//J8=;
        b=Q7xrHMXAQiDqXFH7d5x3u8gThpp0URZ3+wuZ/rSaqQkcJU1st5pvXAuIb02V/5QK7N
         ynHNwGv6AIw5A+ps5pKTAe6B2niY4eWUv6KWnLj5HIztxbAuXcCKNJTTABvjxc/wIvkf
         VTmoJjh5+LoxpfU5iUvOxXO9xQqbsV/pBmA+vX0nDkocXb2mrNk7Hm0+BbUwsSehF4ea
         ZwcG7asJJoF5WjomK0ZH8uuXI9UCVZ8iCdTdVr4iavNuCSUk7kZegvOvGqWMBeJq69DW
         BaysKPkIl4B8KBuMAL0lcl+Y6zsgxeqc01VjTpnexnqFGIsg4Xi8d9ZuPM7zbjrjuHi3
         AGjw==
X-Forwarded-Encrypted: i=1; AJvYcCWa0FppDT6rsLHv9bUyk5WSFPO3ZBsOtBdnph/ul97E8sAP3MajjRY4ouOBNxjgC8+Mk3anyaKmvoVfBvW61tow@lists.infradead.org
X-Gm-Message-State: AOJu0Yykp1muJnWlCA5iYDSfKlmJVDQlr8WgJ5H1Qsv86pkO7xG/d1XX
	whnTFGQMcPmJfMBP7pEBvmP+ttcaMq6I+/tuCJhZ5zVpMY+9LxEUOMX3
X-Gm-Gg: ASbGncv3mDuCKG2CXKqvh8JxJiiFdVopGuoKcH/2C+hdyXs7jVQ+RGkOuwZ4UqI1c5O
	A1fs0ania8fvL+SN1/XD+OlJdksT3jxsydESv61RgIIUQv/U0geyQbownFVXi37ZqE9GpQIq+cb
	O9tabd+EPnYXZM5f3gPVm0FEFTBj1HM+qTNrjL8iWDVLY8lxDazhnc4hQyHEk7vHlQEnoteqArK
	soRmkdi8GORdlwtax3XXGv7wbRIMLso0zmbFeKFU8Lr9pk9UoX+Yrq6Zw7OVij+SebqmvJ15HdF
	HCcrpvVbe0EeV9WLxOKNqa2lPLJRjrO9Kwl+bQ1fccUI7kdsEeo63v8ykJUDzH+landkCgYzjIx
	dgMy4Uyg+QmMF7IT0Dy1v4I7OzZQUqI8QlsLWZM/2JQ==
X-Google-Smtp-Source: AGHT+IFnE3x/HOJtgYIO/KfGDkE6OL9Yv5CTm7GbsosRRNTd2+C/2E/tc4yHiROdLQZc06HYbTLMNQ==
X-Received: by 2002:a17:903:384b:b0:260:df70:f753 with SMTP id d9443c01a7336-27ed4a7eadamr32620015ad.38.1758792081013;
        Thu, 25 Sep 2025 02:21:21 -0700 (PDT)
Received: from localhost.localdomain ([120.229.16.62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed66cdfafsm18251855ad.30.2025.09.25.02.21.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 25 Sep 2025 02:21:20 -0700 (PDT)
From: Liangbin Lian <jjm2473@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	kever.yang@rock-chips.com,
	naoki@radxa.com,
	honyuenkwun@gmail.com,
	inindev@gmail.com,
	ivan8215145640@gmail.com,
	neil.armstrong@linaro.org,
	mani@kernel.org,
	dsimic@manjaro.org,
	pbrobinson@gmail.com,
	alchark@gmail.com,
	didi.debian@cknow.org,
	jjm2473@gmail.com,
	jbx6244@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] arm64: dts: rockchip: introduce LinkEase EasePi R1
Date: Thu, 25 Sep 2025 17:20:34 +0800
Message-ID: <20250925092037.13582-1-jjm2473@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_022121_900523_93FEFE83 
X-CRM114-Status: UNSURE (   6.96  )
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

LinkEase EasePi R1 [1] is a high-performance mini router.

Specification:
- Rockchip RK3568
- 2GB/4GB LPDDR4 RAM
- 16GB on-board eMMC
- 1x M.2 key for 2280 NVMe (PCIe 3.0)
- 1x USB 3.0 Type-A
- 1x USB 2.0 Type-C (for USB flashing)
- 2x 1000 Base-T (native, RTL8211F)
- 2x 2500 Base-T (PCIe, RTL8125B)
- 1x HDMI 2.0 Output
- 12v DC Jack
- 1x Power key connected to PMIC
- 2x LEDs (one static power supplied, one GPIO controlled)

[1] https://doc.linkease.com/zh/guide/easepi-r1/hardware.html

Signed-off-by: Liangbin Lian <jjm2473@gmail.com>
---
Changes in v2:
- Change deprecated "rockchip,system-power-controller" to "system-power-controller"
- Link to v1: https://lore.kernel.org/r/20250925055906.83375-1-jjm2473@gmail.com/

---

