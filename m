Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D622FC037D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 12:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Rd6mCwQnnaosvOS+7aLcQoA499FS26q0zQACS/fXaU=; b=bdrxxFsoPHcnV6R3XQ9krOt62k
	z/iwaCUxZnnyd9kdvNFBK9trlSC9a5hamkCY809ryR+Uf7U0nt7Bd35sRZDznsGkaqANnV+Oe/tnK
	HQXtx9kY5PSwy6y/A8P7rBOz1ylXtwquzGHX+2S7CPFTwXtxhFO8iP/zurcrzOgsNKAfj5NHOc3yZ
	bVQ1ZUFXIHC97kXgfnB3SSD9+4vXuBI/9Ei+GFUp5kdO59rtY+srKHZo8slwHI91DhPNFVk8UuPsR
	d7TOTwAS3m4XJdA6N2QbgXwWE4820eJpoeumkqcSpQ2AM2Wm53K6dEvuIvFLMXLF2Yag4B3TTM20m
	PLK/ipHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGFmP-0000000DBsi-09TB;
	Fri, 24 Apr 2026 12:37:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGFmM-0000000DBro-1jbu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 12:37:07 +0000
Received: from [127.0.1.1] (chfd-03-b2-v4wan-176392-cust229.vm15.cable.virginm.net [82.19.20.230])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DFD011587;
	Fri, 24 Apr 2026 14:35:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777034123;
	bh=KCGG71CLMmIar38TlRIMxcvDFT1J+bF5d3VJ7VIIF/M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u9QLlTeAsr304Azcw0zhce0pd1eMp2YDRNAKvOtE1qIXi3LowyIBDtjbd16y/QKEa
	 U9147w9LgLqldq5+CCl3jUUbOjxyZESxHABgvhvWgoE8gnJ2elF2iz6bRKmbWyfvSK
	 pRbCdStDVffxC3zL7LAbriEjKoSCMmfDP8O25fJU=
From: Daniel Scally <dan.scally@ideasonboard.com>
Date: Fri, 24 Apr 2026 13:36:46 +0100
Subject: [PATCH v2 1/2] i2c: imx: Don't recover bus when arbitration lost
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260424-i2c-imx-fixes-v2-1-34fb9504aaeb@ideasonboard.com>
References: <20260424-i2c-imx-fixes-v2-0-34fb9504aaeb@ideasonboard.com>
In-Reply-To: <20260424-i2c-imx-fixes-v2-0-34fb9504aaeb@ideasonboard.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Gao Pan <b54642@freescale.com>, Fugang Duan <B38611@freescale.com>, 
 Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Daniel Scally <dan.scally@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1232;
 i=dan.scally@ideasonboard.com; h=from:subject:message-id;
 bh=KCGG71CLMmIar38TlRIMxcvDFT1J+bF5d3VJ7VIIF/M=;
 b=owEBbQKS/ZANAwAKAchJV3psRXUyAcsmYgBp62Ptb30gbhkbdoXbzk2HNvn0SEvk/pxYvLAND
 95dcAXyvheJAjMEAAEKAB0WIQQqyuwyDnZdb+mxmm/ISVd6bEV1MgUCaetj7QAKCRDISVd6bEV1
 Mj3sEACOkCQ5mSB3coiFik4V/scY0kA8h52z/HTzH+Hh1Z+13bP1bQP83zICkqJruB/1wxPMXLz
 Eq3IaKgKpZC6VLqCQ2B4sBxMEqrUKemKLECfBSUbG8mc+N1TSpxXH7zfbLRrq7wkiYkFXQH9Yzt
 brKW6vivGQM4TT/Y9RMfMPTQRXjzKWD+14Ui2U3YlYAIar11VcHXld3GabfwdVCVNuYuycnhaQZ
 6v9FydgdwfW2MQ2SRk/u9WyG41Wclcs+HCm7hhSRiEFtfWo5NkB7AEeUfzpu7oeecgyK4CDtPKs
 KwUUsRpEeK5wAu+esFU8LyvgcTwStlDo32Cl7R89J+/lwhu8iNL+PldsAXWjauuz746OQh/fCc+
 AklCMNW2U9z+zOpzCTuMY/hokhGK7fSqKtAmCIC2vvsk1+1hR73ukewDNEdNch34jRZC5n33+Gk
 7LoRnVJ1RA3wsfmBCDJQDLcNw7usv/czIi76EKzUh4j/cp9CpahSw8ZNhjItgV8gijHIo4oIo5K
 N9os9xwEPYH4tdDQsYIIP+otzXGPkof1YE79Sw6Rh6lU1b/qwQYSFC3j3wsIzZZTQvs5B5DYXo5
 sCwEGf13enwFeMpt6F7rI46Y+U0II99O2Xpku4nah4bOLDWGBd1m/sYpzlgq4G0nEoIH1P0paRB
 Gp4U93JR+SR/Qjg==
X-Developer-Key: i=dan.scally@ideasonboard.com; a=openpgp;
 fpr=EEC699ACA1B7CB5D31330C0BBD501C2A3546CCF6
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_053706_852784_37039794 
X-CRM114-Status: GOOD (  12.58  )
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

In i2c_imx_xfer_common(), the driver attempts bus recovery whenever
i2c_imx_start() fails. One of the failure modes for i2c_imx_start()
is an arbitration-lost signal which results when a second I2C master
on the bus tries to control the bus simultaneously, which is a normal
and expected behaviour.

Bus recovery is not the right response for this case. Add a check for
the -EAGAIN return code to avoid running the bus recovery.

Fixes: 1c4b6c3bcf30d ("i2c: imx: implement bus recovery")
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index a208fefd3c3b35672a00eda8448f24859aaa793a..b68a0f7105682006bbcfee52891c9a9c2d8c009e 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1552,7 +1552,7 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 
 	/* Start I2C transfer */
 	result = i2c_imx_start(i2c_imx, atomic);
-	if (result) {
+	if (result && result != -EAGAIN) {
 		/*
 		 * Bus recovery uses gpiod_get_value_cansleep() which is not
 		 * allowed within atomic context.

-- 
2.43.0


