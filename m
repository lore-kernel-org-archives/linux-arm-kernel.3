Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B1F6CAC5BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 05:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wDWN4g6ghBuiYarXPc9Grf4Kf/+CFy/Pefagl1DF5KE=; b=oJ9/0wHlH2lex54QIlVCQBXZve
	qe1eCbSfrz1gGPvjRzcKwU7Ty+Cx7CQrFgD8eAnald2VIuzXg3xlxy+H+xUlwh8dkT2D7OtLlPJLN
	cExfC017ODygw+3t3nTIHsDspFIHscyO5xdXCLbsFNEw2uLiDfGI9DFq6ZVmrxYP+3FORwF4tXB5Y
	hV/BVIeIRvz4MojZ1EjL/rPi6TxRyllBfsjmo3W7LtkE8aHacT3TTM74jN11H6zlCf1PTPIKJ9LQe
	0NCvMDtqYYsvhdAl3qrovCMm6u1DeTOniVFr64EtTBUuAwAs5Zhfvsn0PKt9Q9zEHjdXK3X6UVC/R
	caZzk0sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3TG1-00000004HaV-1K3q;
	Tue, 30 Sep 2025 05:50:37 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3TFv-00000004HVR-1fJj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 05:50:33 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-85780d76b48so578572285a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Sep 2025 22:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759211430; x=1759816230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wDWN4g6ghBuiYarXPc9Grf4Kf/+CFy/Pefagl1DF5KE=;
        b=gDG/l3S2mF1RDvN4hCpGFB9dnajDSOAzMW3zYW0dymSpJIRE6oM51dnY1bWpbfEzOI
         2ybVLIKLp3HDU3UoUvqRxeFYxZ5DZNFDmLMiFGQlFCd+D+3SBCy00zIH9JH5Ee9Orpqq
         O8Zq9hSjYQuQAhqFAtWvw1veU8H8qUSdlguYbHQNSpGnZIY2guc78XdGJB/VdG4d9gu0
         c0I3GiyZHIeV7CCYaL+oZTfcSi7FZPj6WuW86dUA+IXM19RbD2vvSwjFVObTktCEBatN
         5rd4GVmIlJHxMuwwFqRiYZqwZcWD9TskprOai7Y4mt0uk82SJ6eVlPInJNyuvysALfZO
         biaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759211430; x=1759816230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wDWN4g6ghBuiYarXPc9Grf4Kf/+CFy/Pefagl1DF5KE=;
        b=hpoHo36bm1JqR5b2oGo38EahVWM0kAcc0HWRMCFMNL0vhC2SBUIx9pUe9TodKyuIAH
         yUzuij0qDpy/eruGOr89SMKRfLJShv+TLvtYz83BPgKUJE3RUmVBh732Xu4eK5Ji0iCX
         E+AEO2BsjBP7KlmbFCJc61vHCK83SttL4FVb9ISvq/a7DBd2sKjwirju2zzEOmaoTKfe
         s+gsnQ5ZIS730ez1Z7cjbg0lIAhfJ+Hh3mwWiWbs+fI6vjCbKasnKDcjXMXQSbU/Ei4P
         lnx6M8H164dht5j5rDvokBLs3DvYkWVpCS84plJFL+CRCR03ImaWa6YOriPp3Ki0gZLL
         EyNg==
X-Forwarded-Encrypted: i=1; AJvYcCV3eiguiXnVTmgUFkha6/i0tgU8aox4CM1USRKxjOwREX+gHyDkPjsWfTKZLCNqPx3kj1CgcKaUHx9EJA2mkaIk@lists.infradead.org
X-Gm-Message-State: AOJu0YwSFCIUJChckV99n4b4vf3aGBUPMm3eMLNmOWPHRnSnmBTTxO9k
	9R+chpXQ8Nsm4yF4ztUreBGdSIH91lqXQ8gHFc9iPpiwD1Oe7TJMX9UX
X-Gm-Gg: ASbGncsFvWBAsEG7b+rNS1O2aekpvtVcgbPjgMiob/lHhY0OLidi7lhUZFhcA+xF/Lv
	LYr7se9dvpvzuSU1ot7YE+lBp4XlNb8e5L0hNw5UijKHmhhMAZfgznXkiy//i4ZzETIrXHt2Q/n
	aTFd7LB2QPaQh7VdWE7vMZ2/OZ6yiNyH52r5s2TBrfUh9SVfOZZNb413cQYGoZWzLX3yIDFYD0D
	MWhEpybwV9rlPP0mUglLnyDzNepX5P37H+S1Dp31QXl43hAcKdoOMj4EkVEIe6QGq1TcEn/rIbK
	/q1N7lZPDBjyR9KBwT0ItM4Rw4gfLeLNAmKd3ODUOb6yRvl8Qslv3zkgp1JT6ZxRBIvxZyxpHgc
	wNnZUGIYImuKz/NolMVrhE3geYbNPDyzEx4ynWjnXOLy0
X-Google-Smtp-Source: AGHT+IG9qqjmdiQSDLHuO7EpbaYz9j/RzszkZqlPiHzP5xEh40KEmQHqMDJaw66yqCAcH/AUHfDcug==
X-Received: by 2002:a05:620a:198b:b0:863:a3da:6407 with SMTP id af79cd13be357-863a3da6711mr1776483085a.31.1759211430006;
        Mon, 29 Sep 2025 22:50:30 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac5:3981:263c::3cf:53])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-85c306b5f64sm971990985a.32.2025.09.29.22.50.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 29 Sep 2025 22:50:29 -0700 (PDT)
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
Subject: [PATCH v4 0/3] arm64: dts: rockchip: introduce LinkEase EasePi R1
Date: Tue, 30 Sep 2025 13:50:14 +0800
Message-ID: <20250930055017.67610-1-jjm2473@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_225031_449845_AFF72C59 
X-CRM114-Status: GOOD (  10.42  )
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

Changes in v3:
- Fix typo ('status = "disable"' -> 'status = "disabled"') found by kernel test robot https://lore.kernel.org/all/202509261328.Grjhp029-lkp@intel.com/
- Link to v2: https://lore.kernel.org/r/20250925092037.13582-1-jjm2473@gmail.com/

Changes in v4:
- Fix missing "Acked-by" message in patch 1/3 and 2/3
- Link to v3: https://lore.kernel.org/r/20250929065714.27741-1-jjm2473@gmail.com/

---

Liangbin Lian (3):
  dt-bindings: vendor-prefixes: Document LinkEase
  dt-bindings: arm: rockchip: Add LinkEase EasePi R1
  arm64: dts: rockchip: add LinkEase EasePi R1

 .../devicetree/bindings/arm/rockchip.yaml     |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3568-easepi-r1.dts    | 692 ++++++++++++++++++
 4 files changed, 700 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-easepi-r1.dts


base-commit: 30d4efb2f5a515a60fe6b0ca85362cbebea21e2f
-- 
2.51.0


