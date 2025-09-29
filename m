Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCD9CAC5B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Sep 2025 06:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uRlIBTJbS5dsUVU9BT5fMMctePqeQfAjKve/Q3RtfIA=; b=lp3CWftaJieDDopkdIn3gAx1mm
	FBkCANPDgj5esIMGJU0GulEax7/u01R/tW4Z+q9MFcuK3moksnsuNPqz0udcFH7+WSNOMrB67ytD5
	muiV6foJIkcDw0657fBbDTf7QJedqGPwTJL5MJtKlvlVCJatWdIzZzJPE5N2aF7Ezu4Ebm65pnYUD
	732nygbvyhpbrCywkj07T4te9DOs9+TC5bvzJf2eC5vNjrdDz/Q87BcvlHo/yOV3V6qMb0ovI/NhA
	nrefaAb3VOHb+Z+D7MNEN9D7LRlHLEE3yhJcAXe1BxCzvYI2NwNA17+JJl3Bq61+Gm+t2roKLTDGx
	vKKgYBcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37pG-00000001Y5V-3Nux;
	Mon, 29 Sep 2025 06:57:34 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v37pD-00000001Y4m-3qRX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Sep 2025 06:57:34 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-76e2ea933b7so3686875b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Sep 2025 23:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759129051; x=1759733851; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uRlIBTJbS5dsUVU9BT5fMMctePqeQfAjKve/Q3RtfIA=;
        b=AIVuczqC/NTztDAIPoCKGg3qwlTsgurjjVRYZkD2mHRiAJNIMicNDflxwdQxE/vjuc
         cEuRqSCejccChtA30/JQKmbS6zzSbpUshetA8s3LWggYfvaiTpHeuhGVP39FlQEtw9Uu
         k9Df3lM/81pS1jWVTWJaRy3GWBlqTHRu62crV5YPNZJMXQ1eRtcQ5BCwYM+IxSjV9StP
         d5imYancS1m8IOoCnegEFdfm15RFYuIZUR3Szy93idaAh2VQ4ui14eMsulxayYJzTGEW
         Kf8hTDUq8z6yp4R4ihUBTOp5ESBgZuDPWrHfjWFW5rS9RzDxAYwHD1XAIDfMJrlu+VRx
         sJ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759129051; x=1759733851;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uRlIBTJbS5dsUVU9BT5fMMctePqeQfAjKve/Q3RtfIA=;
        b=sptk5GFSfGB+PZ9bTulpBOUqetptcbC3vZgmknwDP1IzbyPXvpkZvnElBR/9R0etFG
         92t2j4niH71cSX75g/D8uD3haS8pnrpkB8OrnDfQb8Ib69tUsFUbFfUmPWAFkbbl2FHg
         +2Zm5gBWUqN3N2hBTd7CdsSZz6u3lEDdY0vlYAH5Tbtd5k0gpIJNQ1DK1DTKm2FjRnF+
         tOoZW8dStkeYy65R3gcT4gEWtE9hvUdECrIkV5qGj+1no5NGxGuKaqP1LCn/SOBZF2jx
         22KOVkuHdRl4zyAguf0UCII+Pijp5FRtWrEjdM6GfVxen5viFF+ybxSuwVSDzHAtITFf
         N3lw==
X-Forwarded-Encrypted: i=1; AJvYcCWJfI70zZlZtDC5+yws9rBQP+DBmOp8iz52vhIhcwu/XIrsNi8Jn9Ng8A6T/PO45AtJuEmK1MdceRh2IUfeTG00@lists.infradead.org
X-Gm-Message-State: AOJu0YylPf/cgE4coi6adMzlWUcMUd+G9AcktI3J8rzkHGIICGw05hbY
	MYocCHHTHSURAn6Hz0173qU7mZBeOd+7EfKt9L3ZSgoJgaMtWcUh5jBB
X-Gm-Gg: ASbGncv5H17I6z+pMOSfa4u4os82HtNIS5JOq1xwPSX15HiXG/g6pnRmBQDct3QP+Oc
	NrYSFK4FQxX9iXoXg8D68ObqxkV3/6ZWelcXhpGcYq1nXlzkTVBjm3peWBomzcV7FfWSQkvaNQ3
	PpWig7J7nU8o6RBWpJ+rNyhtoXQxR0Kuo4ZmCmB3yjxo2qLCJvsWzHTHbvfmuqEAEPYauxgnEDd
	qiPunZbXNiTF0Vt6FAQhmvB7CzJi6lifEpelK+pYsoMqf46ORODvOV5cjmvhQCKG2dT5O1ZIDBx
	QwaUEKqmnkoyAsFCSynPYlFM2G/0ZhXVgauQo8izfEo75r8KA+zGA4WW42rHY8wUgBGAJYKMIpF
	+IgtUcsBmzj7CIYtMU/wDuU/fQuOknnmGUjrvNrInPNk=
X-Google-Smtp-Source: AGHT+IHnOzVUSxV0rdJYyHdNFITwaxFEqSFhQIoUc3A0a+0YDe6RiTgSYuqOECxHlGbYNdZCP3ruxQ==
X-Received: by 2002:a05:6a20:7486:b0:2c4:5793:3419 with SMTP id adf61e73a8af0-2fda3a10507mr8690061637.27.1759129050776;
        Sun, 28 Sep 2025 23:57:30 -0700 (PDT)
Received: from localhost.localdomain ([120.229.16.251])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b57c53cac77sm10549595a12.17.2025.09.28.23.57.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 28 Sep 2025 23:57:30 -0700 (PDT)
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
Subject: [PATCH v3 0/3] arm64: dts: rockchip: introduce LinkEase EasePi R1
Date: Mon, 29 Sep 2025 14:57:11 +0800
Message-ID: <20250929065714.27741-1-jjm2473@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_235731_965095_EB15FF4C 
X-CRM114-Status: GOOD (  10.31  )
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


base-commit: d0ca0df179c4b21e2a6c4a4fb637aa8fa14575cb
-- 
2.51.0


