Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B27CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 08:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F8BQe+2TW0VIBQx8KKIHuEA4LsivO9fwNmFb+U3jxVc=; b=bjERXl2R5iqgCHPDxsCyR9OrXT
	Xf2JONhnkBpFNe2lE7lmhQ16WOkEVyazzXoM+fZ25QRVtzmCeAdlCTfltDh/d1JAg3HDuh2TsASqW
	7UnX3jec5JamYYO2O4xdxlh82SyZV5AVZbOI+fnyys3KPLovoJ2MIdQlw9FA4crIC7OrT4MVLGyPK
	ppoTiKvjlTnMwRpN0r7uVb81MLfmwjdYml8RtD5QUt4IpC6YoIUcvJXvnA4wX1wBJhf/Fsa/WQR+E
	PMFIFHSi/1Sz/iy/F82p5GfCvOo/Ko85xW41Af7ieXW2olpAkzFNcuDQ7PtGJQQrujSIP6Ug2bJsd
	vZTtNwJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkwT-00000001Zsk-21jq;
	Mon, 19 Jan 2026 08:48:57 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhkwP-00000001Zs7-1Pxt
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 08:48:54 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-78d6a3c3b77so52096397b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 00:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20230601.gappssmtp.com; s=20230601; t=1768812532; x=1769417332; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=F8BQe+2TW0VIBQx8KKIHuEA4LsivO9fwNmFb+U3jxVc=;
        b=XkdTvLSZLWXTwJyByWj9TUhH8zcuU+8U0RbGIFHnd7gHeVrGoX3v7QFdXorZ1AiJIQ
         yzHZruKCG5UeglZvLkyAhgWSerEjJ4iJqRmFBSnEZpzs7U8W7My2a+09HbpJSthZYJgX
         UvaJhZdDTwJq79bFpofh/IhqPrZRNbAucg4C9HVZf9uHurcTUxQCb83bVgIYmoqm/48b
         LtF9fc2/3zkLrXpDY7BKh4sHs3yfLMa72dDUnGS253JIwq7fHnYDrEY60BPI2yF0u+yU
         4BIc8Biq3RQbOUWbjYSBua48EYjobuxqaj2aj20uoL7bzELYGGEDhTTku8Awi6XoPGNw
         dfpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768812532; x=1769417332;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F8BQe+2TW0VIBQx8KKIHuEA4LsivO9fwNmFb+U3jxVc=;
        b=YjJUtKu2mbI54q8Y/Q0g8kCsZcANltSdFzfAZu6H0KG7f//CU3cudrbVJR8utQI6th
         n2LLdhp6w2TRi9ogk5964yXOMbOj/5UZYZdqxJjfXCPtu7ThViKQu3vx/+V9hEqUoZSJ
         Dwg/sqRmK1dHIlY/hcVGj5xDimlpWJOI30YGJTprdb1AClHxQs1YvDnAsg9L33D6fOT8
         VNWjMwNX13JhmW4BSFLfPvGyzjBAIHE8Fu2rrUznJllW/KgspDhIAsEd+4/MDKomOz8T
         vnxXZEtnLAILvjeg5/cxNysZM1+qILAvlAM7z9RfKxcHxWptg/ZiWCYFdtH1sKgAbwlT
         IPSA==
X-Gm-Message-State: AOJu0YxW7ed5fSOYt+lHUGmPjU3Tw7rvUovbSIzHTJBLKStoOKxk7CIW
	evAD/G/pAAiaQbDh/fqWl9dZRh4w4V/A5XkBH+aluYQ/PglaXlvFXFIKi7L0c0WaTGqHiQbXdmA
	BDRDvymV/JzbXL807UaQ3c0dgBgaSDK5w8q6CSI7M
X-Gm-Gg: AZuq6aJkdKJ9+tb9d9PUsa110y/wNvhrsu8n3xDSunfq7U/OMLDvGc3hXS40dmZUKQT
	R6tgWOx6x4Dr6dALvIr6FTrOzn+7HgybtBxp+m9GpQOsT8nB1JsxImL4VhqR4Rc3Ai5oiPtvewM
	3ByzQlRbnOL9vcdjq3zm9KvtzzSZRs+9beZ8xIYG6mFHp2w+hnSvuLVjsAGtG9y93N2SySsNAi5
	eMZIUXRBie5TY90tiRNcdPEYQivWdS/LafY51iLkZwm/sOyYXCXe5ABiKwwZERfOuDZD3lR
X-Received: by 2002:a05:690e:1486:b0:644:5309:3e3f with SMTP id
 956f58d0204a3-64916902980mr7763421d50.4.1768812532000; Mon, 19 Jan 2026
 00:48:52 -0800 (PST)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Mon, 19 Jan 2026 09:48:40 +0100
X-Gm-Features: AZwV_Qi1XfZwIEC4heGsnwiYFtgdbIT5b5PtFmWw8crpibmfGC19IqOi9UD3jOU
Message-ID: <CAHTX3d+S9MP6HS7=5X92F=g8S9QZ15wHmRf=VvFd2Qgd0uSu+A@mail.gmail.com>
Subject: [GIT PULL] arm64: Xilinx DT changes for v6.20
To: SoC Team <soc@kernel.org>
Cc: linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_004853_409170_D4C0A845 
X-CRM114-Status: GOOD (  10.38  )
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

Hi,

please pull these DT patches to your tree.

Thanks,
Michal

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-dt-for-6.20

for you to fetch changes up to 4310a370a323901b42f0ddd119a53af723f3359b:

  arm64: zynqmp: Remove ina260 IIO description (2026-01-06 12:33:38 +0100)

----------------------------------------------------------------
arm64: Xilinx DT changes for 6.20

- Cleanup SPI compatible strings
- wwdt: Add optional power-domains property
- ZynqMP: Fix OPP description and setup
- ZynqMP: Remove OP-TEE node
- Drop label from dlg,slg7xl45106
- Remove ina260 IIO description

----------------------------------------------------------------
Conor Dooley (1):
      arm64: dts: xilinx: add soc-specific spi compatibles for zynqmp/versal-net

Harini T (1):
      dt-bindings: watchdog: xlnx,versal-wwdt: Add optional
power-domains property

Michal Simek (1):
      arm64: zynqmp: Remove ina260 IIO description

Neal Frager (1):
      arm64: dts: xilinx: fix zynqmp opp-table-cpu

Rob Herring (Arm) (1):
      arm64: dts: xilinx: Drop "label" property on dlg,slg7xl45106

Tomas Melin (1):
      Revert "arm64: zynqmp: Add an OP-TEE node to the device tree"

 Documentation/devicetree/bindings/watchdog/xlnx,versal-wwdt.yaml |  3 +++
 arch/arm64/boot/dts/xilinx/versal-net.dtsi                       |  4 ++--
 arch/arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi                   |  2 +-
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kd-g-revA.dtso             |  7 ------
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revA.dtso             |  7 ------
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kr-g-revB.dtso             |  7 ------
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revA.dtso             |  6 -----
 arch/arm64/boot/dts/xilinx/zynqmp-sck-kv-g-revB.dtso             |  6 -----
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi                           | 25
++++++++------------
 9 files changed, 16 insertions(+), 51 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

