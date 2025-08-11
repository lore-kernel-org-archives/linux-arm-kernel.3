Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83ECCCA0EDA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dq0f9hbxOiPcgOoagCVQftGeGCtA482uSOeV1n3ljhk=; b=xTojYKoHH+TArD1GBepg0lc8FQ
	RMY2Ya4MslfY3/gIxrMwnvY6s/AA54cX6u85QCEev34nNkhoytCf3RAb3Hh+9OODbpZltQhgHJtez
	YwhF/oQBbVn49HNAHXHOP1Gd+98qmWV7mswCZqnBtY1HxWjzVy7lpFuqPzDJlITWCRAKDcFt252uF
	KIgHSupwepusFuI5/bYQw9Yre6zWZQ44TFuvYBFy5hlTagT4TScoik4m6JX3zJigNY4bQZTljD300
	Zqz3FMN30x2la4Msaja5MZfwgJsPhZZKYyxLVWDgxxPXbK9EpWNBUR1U//q8qARmiWRBQvhc0D3QB
	gIcbASbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uladE-00000009Dez-1fgy;
	Mon, 11 Aug 2025 22:04:40 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulYX6-00000008yPV-2mMu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 19:50:14 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3b8de193b60so2717453f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 12:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754941811; x=1755546611; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Dq0f9hbxOiPcgOoagCVQftGeGCtA482uSOeV1n3ljhk=;
        b=T83wlSGuv7YEREUVvE35R9xeMThasag1KhneFmip+3YMrnpZZGvn2d0wMiMlQR0rXr
         CcPOsketda9t/2GhPaOCZlTovMEd8snNyOfIzwW/Cyh1Blto8kAm2nAyvOjI6v95IloO
         kPamwIAg7EDUpnhR0UamPdUK2v1oK/2KQ/YuQLpaswgCe+wbczIvIg0EVFsB5Ma/REk5
         XW2KDYqrKxdegE8PB1SxuU1/gIfQ6yZ5bpiv0X9+T4T2EdYOPF95saFBj/oFpjl4pNmE
         1DmNHwGwzJLTW4Ds58wAEshoGyj1yT7zVXXiRpDL3d2Fow/qOrD6VpRREhzJiLE6iN4D
         R9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754941811; x=1755546611;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dq0f9hbxOiPcgOoagCVQftGeGCtA482uSOeV1n3ljhk=;
        b=joBAuIw3YaEWwU2cFJFo70XTIOh9lK2B3H42Zm9ABCHRIsewPEjmvNkVP33W7gfCWV
         HnZzT8KSVZpjA02zXIPpFCUs6VuwWlUH2y0C8UTDNROzbPY32fEatlZMgU0iVJqG7Lm7
         nLg7gtN1uB6qqewSFm3jxiWMHzSmgk1IRRg2axgxzNwhWc2gUOGErgACibEEl/TdmYnW
         NFd689BJJx6Bacq/6Lrte9OAcAb5ax69pRwoLauMACkUObJD4cKWfmfWONGpFLe5JN4/
         oWNe/MRqFjxYvL6XgNKcKp12aqHSmb1F9/4Ug9Y4S6fV5gk+MguBGMkT9jaV/P/Xxvy0
         DS9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfIC5dmN9g7iTccIynJJrsh6mvrihYTEeLGVh949RJK2bsP3hn+KagyGCt6jUu5LnaclDuHuTmeEYPIbfoaF+S@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4Nyaj90puXXVE0WOqGznDstFBOkWQTgeLNbAOY82Fa0PavFCg
	Z5CPIiPbcM52k44fbqvWTRcrGiw1lgbAkur0y1ihBqaKJ9fX48yP36vP
X-Gm-Gg: ASbGnctn6mWrm6h3wk01GBGzfdmJRy8I6WIPVUjFYwn6Vaqj1GxZk+Gn8Qyws2sD581
	f5TWoVRcYASQkGC414kzmthAxS7sLbV2E4sy9AtPhSE+ga9mViguPLRyyrhdFglU1ZK1Cof/e+9
	yzbMeRp3HNSEl8du9TKD+pIZMrl3DC6txkacayRHcsR2Gz93SxN7mtV73cLGOfZSa0in0wVsOew
	QFlxPYUiBhxqq6dNjht6ilfAt9CU8JQs3CRY/EetqaWqvdpt2pZXhKCgdBHs+3kQiOe4BWHp1ib
	KAos6P2vbBZaIzRHzWUFgZTQP5vc24OtsB1076iM6sfoDnXUcuo6RjkBeXX5BJlCXO0R9FbWkTp
	nqARRdNxwDPouqCRYWaIPguRZ4+YMVg1MKSvXvLcFcifuzJ/ShCU=
X-Google-Smtp-Source: AGHT+IH+bAdPsDt9XrIorgyNOEYeyaktekbVrFIZRRBjXCSd5Yc5wHtmlxqS1JCQ8nOI7Z8NtI15og==
X-Received: by 2002:a05:6000:2002:b0:3b7:9b81:73f6 with SMTP id ffacd0b85a97d-3b911042100mr751660f8f.54.1754941811015;
        Mon, 11 Aug 2025 12:50:11 -0700 (PDT)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9eddsm41709246f8f.22.2025.08.11.12.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 12:50:10 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Mon, 11 Aug 2025 21:49:57 +0200
Subject: [PATCH v2 3/3] i2c: pxa: handle 'Early Bus Busy' condition on
 Armada 3700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-i2c-pxa-fix-i2c-communication-v2-3-ca42ea818dc9@gmail.com>
References: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
In-Reply-To: <20250811-i2c-pxa-fix-i2c-communication-v2-0-ca42ea818dc9@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Hanna Hawa <hhhawa@amazon.com>
Cc: Robert Marko <robert.marko@sartura.hr>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Russell King <rmk+kernel@armlinux.org.uk>, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Imre Kaloz <kaloz@openwrt.org>, Gabor Juhos <j4g8y7@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_125012_711022_C3916987 
X-CRM114-Status: GOOD (  34.01  )
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

Under some circumstances I2C recovery fails on Armada 3700. At least
on the Methode uDPU board, removing and replugging an SFP module fails
often, like this:

  [   36.953127] sfp sfp-eth1: module removed
  [   38.468549] i2c i2c-1: i2c_pxa: timeout waiting for bus free
  [   38.486960] sfp sfp-eth1: module MENTECHOPTO      POS22-LDCC-KR    rev 1.0  sn MNC208U90009     dc 200828
  [   38.496867] mvneta d0040000.ethernet eth1: unsupported SFP module: no common interface modes
  [   38.521448] hwmon hwmon2: temp1_input not attached to any thermal zone
  [   39.249196] sfp sfp-eth1: module removed
  ...
  [  292.568799] sfp sfp-eth1: please wait, module slow to respond
  ...
  [  625.208814] sfp sfp-eth1: failed to read EEPROM: -EREMOTEIO

Note that the 'unsupported SFP module' messages are not relevant. The
module is used only for testing the I2C recovery funcionality, because
the error can be triggered easily with this specific one.

Enabling debug in the i2c-pxa driver reveals the following:

  [   82.034678] sfp sfp-eth1: module removed
  [   90.008654] i2c i2c-1: slave_0x50 error: timeout with active message
  [   90.015112] i2c i2c-1: msg_num: 2 msg_idx: 0 msg_ptr: 0
  [   90.020464] i2c i2c-1: IBMR: 00000003 IDBR: 000000a0 ICR: 000007e0 ISR: 00000802
  [   90.027906] i2c i2c-1: log:
  [   90.030787]

This continues until the retries are exhausted ...

  [  110.192489] i2c i2c-1: slave_0x50 error: exhausted retries
  [  110.198012] i2c i2c-1: msg_num: 2 msg_idx: 0 msg_ptr: 0
  [  110.203323] i2c i2c-1: IBMR: 00000003 IDBR: 000000a0 ICR: 000007e0 ISR: 00000802
  [  110.210810] i2c i2c-1: log:
  [  110.213633]

... then the whole sequence starts again ...

  [  115.368641] i2c i2c-1: slave_0x50 error: timeout with active message

... while finally the SFP core gives up:

  [  671.975258] sfp sfp-eth1: failed to read EEPROM: -EREMOTEIO

When we analyze the log, it can be seen that bit 1 and 11 is set in the
ISR (Interface Status Register). Bit 1 indicates the ACK/NACK status, but
the purpose of bit 11 is not documented in the driver code unfortunately.

The 'Functional Specification' document of the Armada 3700 SoCs family
however says that this bit indicates an 'Early Bus Busy' condition. The
document also notes that whenever this bit is set, it is not possible to
initiate a transaction on the I2C bus. The observed behaviour corresponds
to this statement.

Unfortunately, I2C recovery does not help as it never runs in this
special case. Although the driver checks the busyness of the bus at
several places, but since it does not consider the A3700 specific bit
in these checks it can't determine the actual status of the bus correctly
which results in the errors above.

In order to fix the problem, add a new member to struct 'i2c_pxa' to
store a controller specific bitmask containing the bits indicating the
busy status, and use that in the code while checking the actual status
of the bus. This ensures that the correct status can be determined on
the Armada 3700 based devices without causing functional changes on
devices based on other SoCs.

With the change applied, the driver detects the busy condition, and runs
the recovery process:

  [  742.617312] i2c i2c-1: state:i2c_pxa_wait_bus_not_busy:449: ISR=00000802, ICR=000007e0, IBMR=03
  [  742.626099] i2c i2c-1: i2c_pxa: timeout waiting for bus free
  [  742.631933] i2c i2c-1: recovery: resetting controller, ISR=0x00000802
  [  742.638421] i2c i2c-1: recovery: IBMR 0x00000003 ISR 0x00000000

This clears the EBB bit in the ISR register, so it makes it possible to
initiate transactions on the I2C bus again.

After this patch, the SFP module used for testing can be removed and
replugged numerous times without causing the error described at the
beginning. Previously, the error happened after a few such attempts.

The patch has been tested also with the following kernel versions:
5.10.237, 5.15.182, 6.1.138, 6.6.90, 6.12.28, 6.14.6. It improves
recoverabilty on all of them.

Cc: stable@vger.kernel.org # 5.8+
Fixes: 7c9ec2c52518 ("i2c: pxa: implement generic i2c bus recovery")
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
---
Changes in v2:
  - rebase and retest on tip of i2c/for-current

Note: the patch is included in this series for completeness however
it can be applied independently from the preceding patches. On kernels
6.3+, it restores I2C functionality even in itself because it recovers
the controller from the bad state described in the previous patch.
---
 drivers/i2c/busses/i2c-pxa.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index f4cb36e22077753e21b0260df52b8bdbb85fa308..6239200631211b2b6c9919d27fec63704bd19e52 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -71,6 +71,7 @@
 #define ISR_GCAD	(1 << 8)	   /* general call address detected */
 #define ISR_SAD		(1 << 9)	   /* slave address detected */
 #define ISR_BED		(1 << 10)	   /* bus error no ACK/NAK */
+#define ISR_A3700_EBB	(1 << 11)	   /* early bus busy for armada 3700 */
 
 #define ILCR_SLV_SHIFT		0
 #define ILCR_SLV_MASK		(0x1FF << ILCR_SLV_SHIFT)
@@ -263,6 +264,7 @@ struct pxa_i2c {
 	bool			highmode_enter;
 	u32			fm_mask;
 	u32			hs_mask;
+	u32			busy_mask;
 
 	struct i2c_bus_recovery_info recovery;
 	struct pinctrl		*pinctrl;
@@ -429,7 +431,7 @@ static int i2c_pxa_wait_bus_not_busy(struct pxa_i2c *i2c)
 
 	while (1) {
 		isr = readl(_ISR(i2c));
-		if (!(isr & (ISR_IBB | ISR_UB)))
+		if (!(isr & i2c->busy_mask))
 			return 0;
 
 		if (isr & ISR_SAD)
@@ -466,7 +468,7 @@ static int i2c_pxa_wait_master(struct pxa_i2c *i2c)
 		 * quick check of the i2c lines themselves to ensure they've
 		 * gone high...
 		 */
-		if ((readl(_ISR(i2c)) & (ISR_UB | ISR_IBB)) == 0 &&
+		if ((readl(_ISR(i2c)) & i2c->busy_mask) == 0 &&
 		    readl(_IBMR(i2c)) == (IBMR_SCLS | IBMR_SDAS)) {
 			if (i2c_debug > 0)
 				dev_dbg(&i2c->adap.dev, "%s: done\n", __func__);
@@ -487,7 +489,7 @@ static int i2c_pxa_set_master(struct pxa_i2c *i2c)
 	if (i2c_debug)
 		dev_dbg(&i2c->adap.dev, "setting to bus master\n");
 
-	if ((readl(_ISR(i2c)) & (ISR_UB | ISR_IBB)) != 0) {
+	if ((readl(_ISR(i2c)) & i2c->busy_mask) != 0) {
 		dev_dbg(&i2c->adap.dev, "%s: unit is busy\n", __func__);
 		if (!i2c_pxa_wait_master(i2c)) {
 			dev_dbg(&i2c->adap.dev, "%s: error: unit busy\n", __func__);
@@ -513,7 +515,7 @@ static int i2c_pxa_wait_slave(struct pxa_i2c *i2c)
 			dev_dbg(&i2c->adap.dev, "%s: %ld: ISR=%08x, ICR=%08x, IBMR=%02x\n",
 				__func__, (long)jiffies, readl(_ISR(i2c)), readl(_ICR(i2c)), readl(_IBMR(i2c)));
 
-		if ((readl(_ISR(i2c)) & (ISR_UB|ISR_IBB)) == 0 ||
+		if ((readl(_ISR(i2c)) & i2c->busy_mask) == 0 ||
 		    (readl(_ISR(i2c)) & ISR_SAD) != 0 ||
 		    (readl(_ICR(i2c)) & ICR_SCLE) == 0) {
 			if (i2c_debug > 1)
@@ -1171,7 +1173,7 @@ static int i2c_pxa_pio_set_master(struct pxa_i2c *i2c)
 	/*
 	 * Wait for the bus to become free.
 	 */
-	while (timeout-- && readl(_ISR(i2c)) & (ISR_IBB | ISR_UB))
+	while (timeout-- && readl(_ISR(i2c)) & i2c->busy_mask)
 		udelay(1000);
 
 	if (timeout < 0) {
@@ -1316,7 +1318,7 @@ static void i2c_pxa_unprepare_recovery(struct i2c_adapter *adap)
 	 * handing control of the bus back to avoid the bus changing state.
 	 */
 	isr = readl(_ISR(i2c));
-	if (isr & (ISR_UB | ISR_IBB)) {
+	if (isr & i2c->busy_mask) {
 		dev_dbg(&i2c->adap.dev,
 			"recovery: resetting controller, ISR=0x%08x\n", isr);
 		i2c_pxa_do_reset(i2c);
@@ -1480,6 +1482,10 @@ static int i2c_pxa_probe(struct platform_device *dev)
 	i2c->fm_mask = pxa_reg_layout[i2c_type].fm;
 	i2c->hs_mask = pxa_reg_layout[i2c_type].hs;
 
+	i2c->busy_mask = ISR_UB | ISR_IBB;
+	if (i2c_type == REGS_A3700)
+		i2c->busy_mask |= ISR_A3700_EBB;
+
 	if (i2c_type != REGS_CE4100)
 		i2c->reg_isar = i2c->reg_base + pxa_reg_layout[i2c_type].isar;
 

-- 
2.50.1


