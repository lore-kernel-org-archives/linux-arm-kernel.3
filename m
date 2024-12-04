Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC20E77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 15:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=an+Z8/U/MO56+6B3k0dC/+jPNgqzlMa1M5Aal/WF2R8=; b=IppjU6lLfaIEWf
	kFOyXJ55T5XhleHTXTZnGCORkAZSBwJGS7NG/i5gJj8EXJs5H+mxqORq+SIWuGfmSV7Ei7zprtdEs
	ZJ37nCStouV7MaUmD6RUjdFZAbd2n9uxKKgvD1dpKeOGMi1qxq+XFUp0ANWBFpzFPposU2s4t+jA7
	AJNeIROvBPzbm+EK4myi08qed6A3ab78wI8zP5ou7ugurIB+OlbDAdzNAmEQVE1r1vpqjlhcpS7Nh
	4w6yxW5Si/UYHGOQyblvZ542PyWZCz33sp1Ou2YI+GarloDvlrl2r9b3EjoUZF3gr8RL5+VKDEZ/m
	IazeDcRrPPaK5Tse1sig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrm6-0000000D4iN-1mGX;
	Wed, 04 Dec 2024 15:58:50 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrl5-0000000D4Oi-0gyb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 15:57:48 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-53de79c2be4so8351004e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 07:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733327865; x=1733932665; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=an+Z8/U/MO56+6B3k0dC/+jPNgqzlMa1M5Aal/WF2R8=;
        b=am+WSJtf6RS9vpi49u/U5PK+E2HvXPQT2i3DnPPMUNStekKT2nsG6pV0QbS2DdGqbn
         pqRzk5oMoyHMXMimEkH1YyVurTQkNQzysryfHmoZ/evW/pAiRaTm1ivbhikcSa62j4c2
         dDgAqkA0KFN9fptGElS62XQj48EoYO2gwE0ttGovLWMwiYNzu5mOTidC+hig2c9MPNeY
         /YMs89lRIs3vGWuVm0KEswfy0wW4RfJb7A4AYDxf0pikkRnSyeqd6rQow7JfKOlQOrPl
         XxYnbJ73eYff2OfC+ySVdMH+ZSIfoQHCeWkYTl5Lw9IdhA1MCHLCtZEwE9wOdz+hQt9/
         /yAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733327865; x=1733932665;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=an+Z8/U/MO56+6B3k0dC/+jPNgqzlMa1M5Aal/WF2R8=;
        b=qFvMkpRoLCBefcr/lcc48kz5+5bsfdKDlXl64xeRsGLKhhgUlu7hOHOsubXEWrN7YD
         nJyLj3UrW/ybRs2zszkKGqlOlB8UAQVr2meidqeppfdBGgP8XyTYP5eOIkf8Zn/Yqjng
         3F0LpEpie/eVvyVZ0CgiiFcAJBGEQ85ZQdl80GDOXAkVZ2DvPI/0IwEfR3Hhho1jX+Rm
         U850UDEDxRT3weeFbPXjdbp+5CaM5E0xQs/nnJ4WQU6S7CgNEEHZpoItm1ryAdcuxcyF
         jP6jP5Rd9l0Pb9NTnbnZbjd99pFkjMaeTtU5fccfWO+YJ96g17ZjVfeSft7Ib1T8qHb2
         OSiw==
X-Gm-Message-State: AOJu0YwhAVRPFzKGIMV73ukkjSeay/qANwJlxBW5vUO8V058ANl1MJor
	p58UjqhnO9fxLOs524Rl/6FAmT4ocEuiS38BBahuJDDVPrNO223l
X-Gm-Gg: ASbGncv3ZBoHQoKl+SXgKj8sukKFXOWdvZgviFscqIoHykvArZd5fTuBwaKhteqzMYw
	V07BTdl0H8nDsEsrEORvBfno5MZZJEnX+TW20QhCTgBKmcy3PF5kR3hR8V5gCTJ9rL/2vL9tTM5
	Ohu+m4v7nsG3Kw1Tnk1BB4R5BGzQNZ5gSwR/ja8pYHfo8wexlDeCImhZ/eN+F9iFubfcPNpcZ2y
	TTJxE5peL8gyqIFhjb9IRuZi8ETAPru3VS1Ngjfs+pCl9YXOxFLdpJT4c97ECXZGAhMlwLVd3oz
	zUXgT77Q5g+PYP4=
X-Google-Smtp-Source: AGHT+IEy9n6nxWmwqhFSvEOtXxa2/T4QYEk0NY96t8djbuTb5+3DKRoxBp5roEh8mU61qF3g4m3EWA==
X-Received: by 2002:a05:6512:234a:b0:53d:e4d2:bb9 with SMTP id 2adb3069b0e04-53e12a3521cmr4486318e87.54.1733327864801;
        Wed, 04 Dec 2024 07:57:44 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e1f5498easm168999e87.105.2024.12.04.07.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:57:43 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH 0/9] Rebuild default configurations for some ARM boards
Date: Wed, 04 Dec 2024 16:56:42 +0100
Message-Id: <20241204-defconfigs-v1-0-86587652d37a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALp7UGcC/x3MQQqAIBBA0avIrBN0sIKuEi1iHG02GgoRiHdPW
 r7F/w0qF+EKm2pQ+JEqOQ3YSQFdZ4qsxQ8DGnQWjdOeA+UUJFa9muVE62lmRzCCu3CQ95/tR+8
 f4GScaFwAAAA=
X-Change-ID: 20241204-defconfigs-706a21dc5e4c
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1936;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=YnG7z0fOKJrMFIenIZn/cMyKITkPo1UCS66LL8X/56M=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnUHvE/sKv4AaxRiWeBOth6xz467RGh5qwWXEon
 sjLcr5gT5eJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1B7xAAKCRCIgE5vWV1S
 MimdEADQXFpBCP3zM2ifwMzmUGOrx6G7P/aLw8UR67mVpyR+t5nSRIqRdDwJGb0BbSdwEKFGuZd
 MgOPNFZDkKduYqnqfcFoPOW0s6GKmNBsH6zsCvx3n2XwX6nvGVzl8P7DZqfNE+a7DajajRt74pq
 tI6bpsVDQLM/7hphDkLVkOb3MiITjryc57v9p3DSsqZf4Zr2ImKOtt+pvXTmrpmSld96R6LmOVJ
 A23Z/cRjWRtKyJnlFwt982t/zVsu24ebApAvTHYT4aZ4EY2nkWIgBTbUtdZZjF4J2DWu61JCRrb
 /AubGtaFC/Gt5c7CVhHYEF1VYEJLULwdEVesAxMGAU89wfPCzt2dC9k656g6jxUejosEt7txbq4
 0ALq/dp9tb34ud+PvelWF1kw9peKgw18yyitFo9jy5fAliMcNTOFSfJ+ddzs5r//pZiVvTL8WDS
 8AQd1z6bpr2y6imt3u4J3Jr/xT+iF+klJgp88h1lrgIi9i6JRgVtPjhYJ6sRpW+j5iRDe5caHuT
 ENZDbbatG80h/+IjrAbYJNoERNarGQWuCFyDCt40sjZ3vi9E+ymYJh7IE7RxXPHmcvZfqymPWP7
 1OumeLUAJ2WwfFS8ehe9mJ+bfqVuTY+xSovrB0r5XzWP3OALPcnEFly/lPjTiatJmuD/VWCDATH
 tG0cwW70ZxepPsA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_075747_206140_C4D9E8FC 
X-CRM114-Status: GOOD (  11.49  )
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

I was building Yocto for a davinci based board and got the following:

[INFO]: the following symbols were not found in the active configuration:
     - CONFIG_MTD_M25P80
     - CONFIG_DRM_TINYDRM

Both of these configuration options are obsolete in newer kernels.
When searching the tree for other instances of these I found a few in
other defconfig files.

This series is simply a
$ make foo_defconfig
$ make savedefconfig
$ cp defconfig arch/arm/configs/foo_defconfig

for those defconfigs that contained any of the options listed above.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Marcus Folkesson (9):
      ARM: axm55xx_defconfig: rebuild default configuration
      ARM: davinci_all_defconfig: rebuild default configuration
      ARM: dove_defconfig: rebuild default configuration
      ARM: keystone_defconfig: rebuild default configuration
      ARM: mvebu_v5_defconfig: rebuild default configuration
      ARM: mxs_defconfig: rebuild default configuration
      ARM: pxa_defconfig: rebuild default configuration
      ARM: qcom_defconfig: rebuild default configuration
      ARM: socfpga_defconfig: rebuild default configuration

 arch/arm/configs/axm55xx_defconfig     | 30 ---------------
 arch/arm/configs/davinci_all_defconfig | 18 ---------
 arch/arm/configs/dove_defconfig        | 11 ------
 arch/arm/configs/keystone_defconfig    | 12 +-----
 arch/arm/configs/mvebu_v5_defconfig    |  8 ----
 arch/arm/configs/mxs_defconfig         | 11 ------
 arch/arm/configs/pxa_defconfig         | 69 +---------------------------------
 arch/arm/configs/qcom_defconfig        | 27 +------------
 arch/arm/configs/socfpga_defconfig     |  3 --
 9 files changed, 4 insertions(+), 185 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241204-defconfigs-706a21dc5e4c

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


