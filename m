Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1AFC71135
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Jun 2025 18:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YVu3ELHj03qw6JVbHO+qBJXkWeB0FzNWWpqUWGfylOM=; b=wKQfxHOVKQqqpR
	ZW4dZTdQh/+YcsJDph91g9RN3p2QLjt1e8imRUePzYxPA6ixEuBQr8Qo7qfbKB4AGOFNfc8JSin4/
	iRLuGzIyFWAA1K/CqEoXzLuH8UtFwKPG6r6rjibmAmCyvcWC1H3VO5vo1iB8ky3daX6029KPWNrTm
	EeFeVgA55MTxQbH+4wABO9C+gVNOOZKstqPCuL81wpbyVebaox58TiJ6pQsxNT8Zku3ykSZkFHcH5
	+wLHiq3WlPkK73zP4eEGDeyJod8IFrM3TxjdvlCH+9yCpzQgVJGiXsJlLDWDXG5cs4CWQiRrwITiT
	qNbVhujVc++8bk/jzUBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVRS-00000001eYM-1FEe;
	Sat, 14 Jun 2025 18:17:22 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQVPG-00000001eBz-25XJ;
	Sat, 14 Jun 2025 18:15:07 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-451e2f0d9c2so26325965e9.1;
        Sat, 14 Jun 2025 11:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749924904; x=1750529704; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YVu3ELHj03qw6JVbHO+qBJXkWeB0FzNWWpqUWGfylOM=;
        b=GgI/cjvs7fOJJqMz4VXlgziQLgNtOsQIdNkGASFjclAw6S3iK2iY3CZYAXAwlGNCpm
         L2rOiL7dU16qrP3h6zT9VISe585DkSjiWNdTS1FPOXqLAd1OPGntpwOYQq1uILzwH+FA
         N3US/spxft8BjGRMILD2/t+wUWJRon7CY0dLGsEnWa41r+Kk7KHLaa1yMPHX8JEFXdpM
         OoeVc+3DgGFwTfQ0YWQJ7k4FGAyg1TQGPUEBYU2sjTuYxibwsC+mSo9HfXa1VoXkRhmw
         u9oICxu3XNVo5O4zoEWVV6ZLI9kNG/SPlG8e8iW9Mn3zLMMP2rF77QWNbYnpxAJ6wrcL
         tSUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749924904; x=1750529704;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YVu3ELHj03qw6JVbHO+qBJXkWeB0FzNWWpqUWGfylOM=;
        b=fI2u/Y5GioasigfTt/zv1foPq9/vI5u9LFxVhCLriBMh7TTOWWhMsifwPMMB9LOOTO
         9r2v9r/qKW2Upxl/Xm183Qm0aAJcfW559SfYtzkG0HS09YL2l7bJv/b9npvj1DTP0Lqk
         c09cQQqfdEbezteRKg6A3o0y0YgotEu8RrtAh3iSTLGL16bnzqADvsACOL+YkgiyAsCC
         6B/EtD9mtcvCZ46CWHV6TrvasXO0CVT5bvVlpoTOubSDEL8SVKRr+khVQiBf+Tkw7vS+
         4Hp7HEfxTGyDFwdTwkKUTBiv722kmfQbFYnPi8B7VGvxnvHwkZgNvaKVDayzKISoJu8Z
         DLgA==
X-Forwarded-Encrypted: i=1; AJvYcCWOFnaO8OlPZBuJ/Axx587GUQftK4LFwqGCmxwgb5GJnV9L4a1gTqyg1/Myn/E8YpI3o74zb9tM8A2+ScNkRCo=@lists.infradead.org, AJvYcCWSrKYRxyjrQvg2hPUNTyfxCfAJowwHNVDCDqwb9Dxq8CtfFxgfweMRdADkETKN8Gtt+H/y94qQptUjaed1iXXr@lists.infradead.org
X-Gm-Message-State: AOJu0YxVl8z7yjHfAYGZnP5ZSnHO44+Cap0Kv2oM0k9Hc9fPYdOIOnrw
	x5C4D8IvoesTldnqQ4ccomiJ45uQgLA+8+bGNYUhTbiMDU24kFsfGwJ3
X-Gm-Gg: ASbGncvmLaRDPYVzFGPL6ieK2eDGopDTm+aCLMNMdplKsq2fYpq2q8zNWaCNtwyN7yN
	GnmwaQc8E8ar6kqQDb2udzGchfPrbkIVSVwYNAyEcVriCxUfrnVnpy8CdFxjHRv6/ZHX1ORdCnA
	0AMXZo7wAe+5PjDuCM0KGIDJjpgBgRBcFfM6BYMWr+ZgoFfJskjhuKBHdiGzbwSBq6vW+A7QqyO
	qw5pn3M9dJxgxNAim93oHtzFBWLSzgyCLadAqDi5HVCpE5KQjexJIKe/U/vOHO1Ze055wtlXBh4
	1IPvWw0JoDYNnN+e7SH8YeW727x78FMlICIGrZIctHO8SS0IqPagUb1I/k6uI6tvVF5rPvLW33q
	UaQ==
X-Google-Smtp-Source: AGHT+IF7S6DdjgB9HqBLnkqzUP5clevKdsXdT1UzIJZ2T7UBIuvG2KsfubEYBL9quR0XBdxCQQ+4lQ==
X-Received: by 2002:a05:600c:3acd:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-4533c8c22b0mr43443515e9.3.1749924904197;
        Sat, 14 Jun 2025 11:15:04 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.93.132])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532de8c50esm88195255e9.4.2025.06.14.11.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 11:15:03 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v2 0/4] arm64: dts: rockchip: enable further peripherals on
 ArmSoM Sige5
Date: Sat, 14 Jun 2025 22:14:32 +0400
Message-Id: <20250614-sige5-updates-v2-0-3bb31b02623c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAu8TWgC/13MywrCMBCF4VcpszaSiaYRV30P6SJpx3bAXsjUo
 pS8u7HgxuV/4HwbCEUmgWuxQaSVhacxhzkU0PR+7EhxmxuMNlaX2ijhjqx6zq1fSJTH0gSr0WN
 AyJ850p1fu3erc/csyxTfO7/id/1Jpz9pRaWVQ0eXhs4+OFd1g+fHsZkGqFNKH/5eTxKqAAAA
X-Change-ID: 20250602-sige5-updates-a162b501a1b1
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>, stable@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749924902; l=1743;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=iJiCJI7sEDUMdHrBPmtVqIaCr02IcgWh7GEhyL7jHyM=;
 b=oOTtK42sNKGPgFOk88atAKW1HsdVOAjslHToD41tGwccGRU4iV1vaf7dEgC9xqs8fGrvk6VF3
 OBy1U/DvlysA5II5eNVOuw+Z9iQ2A03G1eX9PiLbW3nFMRKNB8KT9Bg
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_111506_544929_668483B0 
X-CRM114-Status: GOOD (  10.14  )
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

Link up the CPU regulators for DVFS, enable WiFi and Bluetooth.

Different board versions use different incompatible WiFi/Bluetooth modules
so split the version-specific bits out into an overlay. Basic WiFi
functionality works even without an overlay, but OOB interrupts and
all Bluetooth stuff requires one.

My board is v1.2, so the overlay is only provided for it.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v2:
- Expand the commit message for the patch linking CPU regulators and add
  tags for stable (thanks Nicolas)
- Fix the ordering of cpu_b* nodes vs. combphy0_ps (thanks Diederik)
- Drop the USB patch, as Nicolas has already posted a more comprehensive
  series including also the Type-C stuff (thanks Nicolas)
- Pick up Nicolas' tags
- Split out board version specific WiFi/Bluetooth stuff into an overlay
- Link to v1: https://lore.kernel.org/r/20250603-sige5-updates-v1-0-717e8ce4ab77@gmail.com

---
Alexey Charkov (4):
      arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5
      arm64: dts: rockchip: add SDIO controller on RK3576
      arm64: dts: rockchip: add version-independent WiFi/BT nodes on Sige5
      arm64: dts: rockchip: add overlay for the WiFi/BT module on Sige5 v1.2

 arch/arm64/boot/dts/rockchip/Makefile              |  5 ++
 .../rockchip/rk3576-armsom-sige5-v1.2-wifibt.dtso  | 49 +++++++++++++
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 85 ++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 16 ++++
 4 files changed, 155 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250602-sige5-updates-a162b501a1b1

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>


