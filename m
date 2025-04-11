Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13330C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 12:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qVcEprkFzd3rrJu1u3UMnInCKF4r4l20VMNImQnFuE4=; b=OoUbXl79o7r1lI
	cUMWKieaOgPrQ6zlwiisEnHnq9Sc916nAx8mVqYH2LQNlIvQqG98id3Woi2cR8pZEBaau0e+X8Txm
	iiL2zpUGdfgNIybR4MU9/ckPc+hr7uKHZXHPKtHrEHSFcT28bXl7097t3lCI7n7BNrtOZuGUJNdxJ
	iKDh0X8UQx+aP7NThB9xKlfBfG/tX63A/5RLvE399zpl0R69LINNT/Ej4DXoyCuXtJIhSaq6RWI4B
	ZbzJKB6ra/HKg9F5kJekj8rpppw5OjOsYke/wv11/UJ/mn/evbqVpt8UnTKTsA+PGRfvFBQgGsD0W
	rbiK7bC6uOxb8tG3Wo1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Dhk-0000000DmHp-1PZy;
	Fri, 11 Apr 2025 12:41:56 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3DcM-0000000DlBp-3W89
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 12:36:25 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7399838db7fso1926449b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Apr 2025 05:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744374981; x=1744979781; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qVcEprkFzd3rrJu1u3UMnInCKF4r4l20VMNImQnFuE4=;
        b=h6tqpTUpvXKj8J1juMz9GMTSz2qR85te8vrvH+BbYlq3I/DDoXzMRXBALtvuQGI1oH
         CHOc8A+QgizEIF8XZVUnBiKT+HqqrWMq25n8ghozAjmGbgyH9Ox9gf+X/YkKcHh7MbLN
         qLGkSGa1B0jv9w9xWcW2hJgRfXpz9vuKZXhIMZfDWkqYCX9qaO1NmdDx1SJp1sIyyRIZ
         8SpjdMwMc45wmM5tVpELUUP6nor6CqTxudvWSmzKKKOsgIXJrdBATq1exYjFFKUYTyr+
         /ygxjAIK+m59FD8nBZ7u+VLxlsX8zCg/7HAbVAd7idSGpTav/Y8pWbyy2gy2P1ciRHs1
         20Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744374981; x=1744979781;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVcEprkFzd3rrJu1u3UMnInCKF4r4l20VMNImQnFuE4=;
        b=D/GxCtgmVdf+J7icxRr83RL8CroKmrK6nmEMgZX8PqRC/jPibyEvP42xjEH5Bw655E
         JkA9f2Mw23EY/Cs/ZJN2cbOw6BzEPadQcQGntuS4NXEJgX1aSizI6ktsJmsQxoYtReYX
         Jkr5GZKMyoeXSvKl0Z760fVsR0VF6bgb6MA25LkQVVa2kLaJGH5u12cL8Fbpy0HBAk4T
         07SILTBnoL23qrWp5enm5jPDZTNNBqVS5XMrdR13RLXAZOY3q/q1IbQku0gEG7EzLMFZ
         NNrYjA+0qPsmHj7F0EMbxpuUxJeUQP2OkFB7rG3uA5X3TPJd64yzMM5odZw1gzhbXLty
         mo8w==
X-Gm-Message-State: AOJu0Yw0njFEXj3ly9dWuWV3Xk63H4XpZKyNb60IVwexHfWSOOarl6r6
	GyQpJmYRNL82hDnk5NMeyz7piLYbkdlruOnVhNNK0YjnSahL5ikF/DpIJcA48TM=
X-Gm-Gg: ASbGncu59QbUE694U2ya8td5RBFyfyQl/0dZVv5ijm+ViR8mBm6POgPZ3vD0h288ZXR
	MyHouf3fUWzMEmypwCCJVs+T0EhzelY5DtbrTWTu8garb1MBxfd1YtwOYpvVZlJRrdH3Gue7IPC
	t39378XSIQ0dnTfHiunBIBa3urB7PaHpt1pUQUrMN8GRqDziVMP8Xv2ppw1y+j7yZUz2mxxLQSN
	dEX6E27WWrKENqIOwTMGESlfrhtN7aEnG1QoV8vWhoCm0w4MDAqd4JmN+rwHXihhp28qW9RExh8
	vUi4Z4JmmsISEt8S4aXjK1gnU7QXWhIJw9ORjyeiOr4=
X-Google-Smtp-Source: AGHT+IFovmGyGMQj3bymdOLN01PpdPyLZzWvo7zsQfRwoVJ3a92T1FSTenwoChm6y8KulWHfihn9tQ==
X-Received: by 2002:a05:6a00:1809:b0:736:5813:8c46 with SMTP id d2e1a72fcca58-73bbf5db4c7mr10560474b3a.8.1744374981364;
        Fri, 11 Apr 2025 05:36:21 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:cf9d:bb30:5951:692])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73bd22f8253sm1408292b3a.93.2025.04.11.05.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 05:36:20 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Subject: [PATCH v3 0/5] Enable RTC for the MT6357
Date: Fri, 11 Apr 2025 14:35:53 +0200
Message-Id: <20250109-enable-rtc-v3-0-f003e8144419@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKkM+WcC/22NQQqDMBBFryJZdyQmjdiueo/iIhMnNWBjmUioi
 HdvdN3l+5/H20QiDpTEvdoEUw4pzLGAvlTCjTa+CMJQWCipjGzkDShanAh4cYDK+6s21qvBiCK
 gTQTINrrxUHJbNxrYtcf3YfLhe4aefeExpGXm9ezm5lj/JnIDEqhTSqM3BrF7oF2ngEy1m9+i3
 /f9BwGfd+7DAAAA
To: Eddie Huang <eddie.huang@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3605; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=TeU1qtBc+lGVT/HpCQKfBJRuhD/X5cT4MzAlX7BxgrA=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBn+Qy+NoIYjXj+o9tBSbe2ubQIPyD5kfY0YF94od6r
 MU0pleCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ/kMvgAKCRArRkmdfjHURVN9D/
 4k3aK0aGww2YNwHcKCp0TO1UivbsRrZwQC1+ak/Uk7UU7vYjLfAYE/2Dn20O2fUDmSLz92un+oTBP4
 x9Fhdg9CHZkQaaoxcapPvvG32aI2Aau2SYnny8/WhV65oCkofNgsmj22b3HHWSq1voe7T/kWghKUIo
 INAdePtn/XBWvyNNt5QUKX1fFUYxG6TZgTF2RryD7y91yyff0QE/UqpzsbA7ZOriIrfCC6MkQq/kcI
 Dfi6huKX79Aij45TnVutEJQozpDU839t4r1hNIsihIUXI0DkMZTUKdqftJoi+dhwpQGIQuyb2ilDlB
 izI7ZCeZsnnCW91AxhA7MitBvFdHdmoWyrzKUoQak+rNfMdiSYD8EIXc6SQlFG2L2hDkgnvpSAji7K
 jIU6dnaUKFY1ITVHzLGxbyAvgKrdlfUMmkeaHuRW9yNxoYVsd4Io2LJ3V9hk9PhXESMr3CRl6DSEI0
 nlJusBoAibu3rFd9TW/yKTlC0L7eqDgLxRvgLVClSZeUDaC2YJIxMnRrEqH9ffXks2uF6bMftm/Jt9
 lAhBwwVAHSGS571K0h9uk8QmQvOMSPTNu+/uVbx/F8BAO5bJjb6Yi/P6nCGHFUZ+7FuF4UARR7SXXW
 BkZJsK6teBtEffDviuxEDEwPAh9/YTnJJx1ClDIfZv8AaVBXbpar7T50Es/Q==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_053623_154864_598E17DA 
X-CRM114-Status: GOOD (  20.00  )
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

The RTC subsystem in the Linux kernel has long had issues handling dates
before January 1, 1970, particularly for hardware with base years before
the Unix epoch. This patch series fixes these issues, focusing on the
MediaTek MT635x PMIC RTC implementations.

The core problem is that MediaTek MT635x PMIC RTCs use some defined years
before 1970 which are negative values after conversion. These differences led
to inconsistencies and bugs when the hardware's native time representation was
converted to the kernel's time64_t format, especially for dates prior to 1970.

The first patch adds MT6357 support to the MT6359 RTC driver. The second patch
fixes the fundamental time conversion functions in the RTC subsystem to properly
handle negative time64_t values (pre-1970 dates). The third patch adds
explicit type casts between signed time64_t and unsigned timeu64_t to
fix comparison bugs that were causing validation problems.

With the core functionality fixed, the fourth patch removes hardcoded start time
parameters from the MT6397 driver and instead relies on the start-year
property from device tree. Finally, the fifth patch updates the DTS files to
specify the correct start-year values for all MediaTek RTCs.

These changes make the kernel correctly handle the full range of dates
supported by the hardware. This matters for embedded systems using
these MediaTek PMICs, which may require accurate representation of
time across a wide range of years, including before 1970.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
Changes in v3:
- Rebase on top of rtc-6.16
- Added explicit start-year property in DTSIs for MT6357, MT6358, and
  MT6359 PMIC RTCs to ensure consistent values between hardware
  registers and the RTC framework.
- Removed hardcoded offset and start_secs parameter in mt6397 driver
  in favor of using the DTS start-year property.
- Fixed type comparison issues between signed time64_t and unsigned
  range values to correctly handle dates before 1970.
- Added proper handling of negative time values (pre-1970 dates) in
  time conversion functions.
- Modified rtc_time64_to_tm() to correctly handle negative timestamp
  values.
- Removed the tm_year < 70 restriction in rtc_valid_tm() to allow
  pre-1970 dates to be validated correctly .
- Link to v2: https://lore.kernel.org/all/20250109-enable-rtc-v2-0-d7ddc3e73c57@baylibre.com/

Changes in v2:
- Split the patch to have:
  - Add MT6357 support
  - Fix hwclock issue
- Handle the year offset in another way, but the V1 way still viable.
- Link to v1: https://lore.kernel.org/r/20250109-enable-rtc-v1-0-e8223bf55bb8@baylibre.com

---
Alexandre Mergnat (5):
      rtc: mt6359: Add mt6357 support
      rtc: Add handling of pre-1970 dates in time conversion functions
      rtc: Fix the RTC time comparison issues adding cast
      rtc: mt6397: Remove start time parameters
      arm64: dts: mediatek: Set RTC start year property

 arch/arm64/boot/dts/mediatek/mt6357.dtsi |  1 +
 arch/arm64/boot/dts/mediatek/mt6358.dtsi |  1 +
 arch/arm64/boot/dts/mediatek/mt6359.dtsi |  1 +
 drivers/rtc/class.c                      |  6 ++---
 drivers/rtc/interface.c                  |  8 +++----
 drivers/rtc/lib.c                        | 38 +++++++++++++++++++++++++++-----
 drivers/rtc/rtc-mt6397.c                 |  3 +--
 7 files changed, 43 insertions(+), 15 deletions(-)
---
base-commit: 424dfcd441f035769890e6d1faec2081458627b9
change-id: 20250109-enable-rtc-b2ff435af2d5

Best regards,
-- 
Alexandre Mergnat <amergnat@baylibre.com>


