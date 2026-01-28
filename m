Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1634D35699
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 09:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Asb2Rs1/PzTSQv5NAEyRr76hV3C7vZRHFKpOD2/+xVE=; b=DtVRFcvEOIoZXz
	NUUCWxA9uC22EvliopGAXlzGUmBdapvYD8tEfdjbpR1fSRIVEaM8gf/bvP/PVDwnVxN+ICE7Zy7ah
	FtYJb3rIec+MdKa1/SUP0yGrl+TGRN9K8VwGqw2c959lFZq7N9EhgH6d+NbyOFbpH5lfTxmGQHFa8
	jxL4qMzuiOBe+GBQlSd0gSwSwqJt+Xv+Ac/DOo9SlrdODIv0MeYI+9BOg/gp06mlg2UD3x5DnS59O
	XyWlHUUwvUfB+wdjSQ+4PG02Om4HAeUd08ZR9qpAr1SgWg+fZT7mPnH0X6xaFYs1Jvk1IpfxA6rEV
	BJ6EIfGGgTWG9dSsPZOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2GT-0000000Fmfq-17sh;
	Wed, 28 Jan 2026 09:55:09 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl2GQ-0000000Fme9-2uhn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 09:55:07 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-385b6a15affso7164841fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 01:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769594104; x=1770198904; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Asb2Rs1/PzTSQv5NAEyRr76hV3C7vZRHFKpOD2/+xVE=;
        b=Uvk3BDp2vNkPkGoZaORdqxZTwehhd2h6ZUv+Ua89ESrbY+QkosfoNs9sYcLr0+wHjH
         JdDX80yxNKouOGJTsS23adgdSaqOfKfVEEZoVZ0WxwXa4yxeILdDxLItCFxUwB9y1xQV
         XCCI3JUOF95cJKNgjIPcjVm/XbaL3jNmUjtEAvM2q/7rdpHjkeW8YXS5oQ+RH/A7v5/m
         Dw5xEx/Rst4ixWk+PtuKHTsu3GgQ4x12DsYYOpeekv17PGa4XnBI2kim44bjc105v52N
         C/7q7S0tGKvStSip9GFCFNpO89cInkLaJh3FWisz717G1mEGQiJg7wjEJuVq5qVSmcr2
         RFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594104; x=1770198904;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Asb2Rs1/PzTSQv5NAEyRr76hV3C7vZRHFKpOD2/+xVE=;
        b=YeClEAkhyjFO3gW1Gr35tmCUUJCVU/Vla112HNR5IjKPRobXcTzSh8tilsc/VPJYWW
         2GoZNaB4YDgqy8P7Z+mbb3pDdjR/McETL1BdFYnaC1+mv+HnO+x8+eLaVVN0rXxCL3a+
         AlVh5hbFz8ux1BFy5EGpNW5rhBIjXEtYMxHCQyb0T5uWbLGK87+VCPMPgW2JSWUX/8M+
         KdlwHFRCMJhc5Vd0Pqky5xh30dcvSgKzUHNPw63HNMCD//awBrCWbkh32SqGzbw0gF3p
         tduDyh8Y3ZddyDBGrWdrDBpkVPEo9tjQeG+zGeAhuEpRo1n9U58MWAabU9m8y5b+zT8m
         lgKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVp8IAbrlyibfzBGDZ/XHp1zK38bdTbRABshx+oBjkHtjiT3yuVsW0RmC1tTUNGioq3pXwO9PkgKxS/+gkPaYbo@lists.infradead.org
X-Gm-Message-State: AOJu0YzNEW6ZyixbnlRB7v+/48UOqL6zIdRZa1WYGSiyuqoYtk1L+EVH
	3COa7sf0TS8Bwbft/lCUxVMhKm45P1FbTY07mL4KqcV/D6mKh+pdSUqj
X-Gm-Gg: AZuq6aI2tx+N+Ovrxc2q0MWSGqXV3swxMtGx/BVGmrFpC71GLTavZgTXpl1FxYASVRO
	QzexPgN79uZTV2VKCFPxkYeQpZkU/vJDGmyyZsFCudKCnVSRPcagNDVysjHM8y9lvN/VZsm+zbR
	JGDWvqrW8HTEHG0ZsSmBRV2glRpKfmc31Ke2vqnPlRytRlu9JO8Afe4ER9vTaW+tAIPFO0DPH1d
	3WvIB2LNfASpP3SBazgN5PC1m6GYyOYfxAZNzZoL9O2N0QoEb4E9p1gVwvsPvUGKlQXFUWUcCma
	Iw5+I4MnRzMAZmEUQ1QRMI69oLykC+syin6GnkjOKCPKAsEeMlS/Yp8ITlfUWWG4j4kDl1owGeF
	a7NnuL6EsDrPups0J2BG80r5nSvZMPXs+apB7KU0RhcQMN74U+7j4tKZXBL22EwihsaGlBJNjuq
	GYLKiF+wOvz9kpB/f6/B46D/TPl6Tcrvcb/ONmdhqI5yYvRtTPCYaUWT96
X-Received: by 2002:a05:6512:6ce:b0:59b:b3dd:4675 with SMTP id 2adb3069b0e04-59e04024326mr1875400e87.5.1769594103639;
        Wed, 28 Jan 2026 01:55:03 -0800 (PST)
Received: from [192.168.1.135] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074bfe83sm459483e87.97.2026.01.28.01.55.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:55:02 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH v4 0/5] I2C Mux per channel bus speed
Date: Wed, 28 Jan 2026 10:54:26 +0100
Message-Id: <20260128-i2c-mux-v4-0-dee49ce276c0@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13O3w6CIBTH8VdxXEc7HP5Muuo9WheIqGyZDYrZn
 O8eumauy98Zn++YSHTBu0hOxUSCSz764Z6HOBTEdubeOurrvAkCStCMU4+W9q+RVgCK1w6NEzX
 Jrx/BNX5cS5dr3p2PzyG813Biy/XbQNwaiVGgWFotjGKgOZzb3vjb0Q49WRoJN8cAdg6zq5Qup
 RK21lL9O75zCD/Hs9NQGittkz/C926e5w872VkkDgEAAA==
X-Change-ID: 20250913-i2c-mux-b0063de2ae4d
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3060;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=+CISfVCWLwA3gPyAi83Po3/pIRtcfyYDHJJqqYesR2k=;
 b=kA0DAAoBiIBOb1ldUjIByyZiAGl53NehzMc33RiC+bTLMTj+/cEfkSOYbDFzHAEeTUGaF/9DS
 4kCMwQAAQoAHRYhBAVRoui2bLVNZMEsZYiATm9ZXVIyBQJpedzXAAoJEIiATm9ZXVIysrgQALF4
 kR7pbgh3IklPT/fQvo6T9WdcM2ot9vwlfBeUehM0cM9d4+oGMtnH6eTdRdglc7Y9GKYlwQ+DBaF
 FI55Mak5HcmtaVGgXyWe7ItH5r4n3uA19bZiut00olAQYvtmeJdqkSsAZckfIQpwb633DQoDgrA
 R5SBUIWiRWIB/5A2smTFmM0yAXGvcfINhOE4v6Qxbgow8X5WFM9h+364sLsNqj2KMt0SlmpwxYb
 EXk8GVhpLCwe3mvuyAegJDtY6Tf3uoWsj8cT1NNtxyZPNGonRvMJC4FkJZk3RE2qzur9mT7r76x
 iutcY/h7q48ggdcRiygTLEnMM4+j4uYP711hMvo+mDnvGmtLWuxoy/dmKrJDfCzYvcx3pxW3uXQ
 TQHR2hleF3L2PtR8Q2gZAHyUO+klFD90Ho3xU2ykkZmVzt3beRPLfVYmfMwvmNWtZfe1JNZQIZt
 +aQ4PdkN45PjSmI3A8V/NWbxThCleZfT6B6gByprN3Zh+7vjXx7sarRmVNdbcV3L5EeaLCviv/W
 U5XWHlb9VNK/3UMFEmWEPFL1UVmUNlH4l3QCeG6fpVYhCDElcCkaDf/QepoHdRAXdNq7LiKRX5Z
 vxreqKsT+BJlRH52wlDgeOQEALfOAUcxdPlJ2cNpJvUhnCRQECkSMQrOzrX11doi6tCb6IycHXm
 HpbGb
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_015506_773123_EDF6601C 
X-CRM114-Status: GOOD (  17.97  )
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

This was a RFC on how to implement a feature to have different bus
speeds on different channels with an I2C multiplexer/switch.
As no major complaints on the design came up during the review, I
decided to submit the series without the RFC tag.

The benefit with this feature is that you may group devices after
the fastest bus speed they can handle.
A real-world example is that you could have e.g. a display running @400kHz
and a smart battery running @100kHz using the same I2C controller.

There are many corner cases where this may cause a problem for some
hardware topologies. I've tried to describe those I could think of
in the documentation, see Patch #5.

E.g. one risk is that if the mux driver does not disconnect channels
when Idle, this may cause a higher frequency to "leak" through to
devices that are supposed to run at lower bus speed.
This is not only a "problem" for changing bus speed but could also be
an issue for potential address conflicts.

This patchset has been used and tested heavily the last months
on a custom board based on a da850 (DaVinci) platform.

The implementation is split up into several patches:

Patch #1 Introduce a callback for the i2c controller to set bus speed
Patch #2 Introduce functionality to adjust bus speed depending on mux
         channel.
Patch #3 Cleanup i2c-davinci driver a bit to prepare it for set_clk_freq
Parch #4 Implement set_clk_freq for the i2c-davinci driver
Parch #5 Update documentation with this feature

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Changes in v4:
- Rebase on master
- Swap order for printing warning about "channel %u is slower than
  parent on a non parent-locked mux\n"
- Fix typo in comment, adaper->adapter
- Link to v3: https://lore.kernel.org/r/20251020-i2c-mux-v3-0-908ac5cf9223@gmail.com

Changes in v3:
- Return -EINVAL if channel is faster than parent (kernel test robot)
- Link to v2: https://lore.kernel.org/r/20251002-i2c-mux-v2-0-b698564cd956@gmail.com

Changes in v2:
- Changed bus_freq field to bus_freq_hz in davinci_i2c_dev (Bartosz Golaszewski)
- Removed idle_state from mux core (Peter Rosin)
- Link to v1: https://lore.kernel.org/r/20250922-i2c-mux-v1-0-28c94a610930@gmail.com

---
Marcus Folkesson (5):
      i2c: core: add callback to change bus frequency
      i2c: mux: add support for per channel bus frequency
      i2c: davinci: calculate bus freq from Hz instead of kHz
      i2c: davinci: add support for setting bus frequency
      docs: i2c: i2c-topology: add section about bus speed

 Documentation/i2c/i2c-topology.rst | 176 +++++++++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-davinci.c   |  41 ++++++---
 drivers/i2c/i2c-mux.c              | 116 +++++++++++++++++++++---
 include/linux/i2c.h                |  13 +++
 4 files changed, 324 insertions(+), 22 deletions(-)
---
base-commit: 1f97d9dcf53649c41c33227b345a36902cbb08ad
change-id: 20250913-i2c-mux-b0063de2ae4d

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


