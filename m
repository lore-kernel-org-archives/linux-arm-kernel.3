Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBE32C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 22:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hfYAqJwJbNFMFz6RzV1LDP7c+VixeIXu+f3nyxM7aYA=; b=oYKqTy8lsOkRiZZ6adjnoM556v
	iOptFGqQ3lnfTUkKEhCj4ecz1BY1GRInl0A+g+F+okqZLHVuz86rgT+4Rrc6o4wArOm9w7RSJmB0o
	IrpIbpxwURRSkTMdh4UzFJdhd1uFEKKfIn3mVL2HA03Um9clyMQ41MZVZT71TVx2qNR9RcB6WJ2Gc
	itfvEPXDXy8porTVfybFF7Gl1fPC6xc4JU+32XpC1NbprqpIJXkqfPreCmRlAWXlrz+41B8plxmUP
	8HcIM284AVLcLJqoPr9fqA1zsAGNYtLZAq8FbjsDgL7+tQc1rMg97RiZm+SIrFT7LjJHGcAr9eed0
	S4eApOfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv0qI-00000003HiE-1TUl;
	Fri, 14 Aug 2026 22:57:38 +0000
Received: from mout01.posteo.de ([185.67.36.65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv0q9-00000003HdV-3bHT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 22:57:32 +0000
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id D4BD024002D
	for <linux-arm-kernel@lists.infradead.org>; Sat, 15 Aug 2026 00:57:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de;
	s=1984.8680eb; t=1786748247;
	bh=hfYAqJwJbNFMFz6RzV1LDP7c+VixeIXu+f3nyxM7aYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:To:Cc:Autocrypt:OpenPGP:From;
	b=gC2dybq/ZPKKxfZ0ik0hsmc1IO+EL6AbbbHLMuBMzL3vV6GglSRIyEHV9Tp8PD6gv
	 0201Mf/BsomjhM5Iy+R5dF2K0Z2BTXePGdJ5EVs8zOxdGyVrIb+sxhON1q22C5A+mh
	 Nvci6NAxaXmGLn2rMeCA/UpMbYZrjSHE6lYKMy3Ek6oMOHS7l1BZOcHmQ3d3fYNDpq
	 7diTd/6CwnLZTmufGDXRcOTtcoznrLgr0TB/4Jh1GfjUUIKOB3e6ch5OwsFdYc9pS8
	 Jnevp/JDUpd150s9Xv87B+eMFvuhHxJUc1dmo3txnPUwrWMKFZoO0Rxkl6LMyUQ4z/
	 QBJ/9ZB8bdtEA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4hMHg95w6Vz6txy;
	Sat, 15 Aug 2026 00:57:25 +0200 (CEST)
From: Markus Probst <markus.probst@posteo.de>
Date: Fri, 14 Aug 2026 22:57:27 +0000
Subject: [PATCH v4 4/6] rtc: s35390a: force 24-hour mode
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260815-rtc_s35390a_int1-v4-4-3133309c365f@posteo.de>
References: <20260815-rtc_s35390a_int1-v4-0-3133309c365f@posteo.de>
In-Reply-To: <20260815-rtc_s35390a_int1-v4-0-3133309c365f@posteo.de>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Michael Langer <michael.brainbug.langer@googlemail.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Markus Probst <markus.probst@posteo.de>
X-Developer-Signature: v=1; a=openpgp-sha256; l=3972;
 i=markus.probst@posteo.de; h=from:subject:message-id;
 bh=gPcfp6PPGG/l7uHfdPMSvzY7C5GnuEMDOGUabcan0Ak=;
 b=owEBiQJ2/ZANAwAIATR2H/jnrUPSAcsmYgBqf51PD00LbzI784B2JcVZiroXnpvy4ilvEsAKJ
 nTbopNsBtmJAk8EAAEIADkWIQSCdBjE9KxY53IwxHM0dh/4561D0gUCan+dTxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQNHYf+OetQ9JoMA/9H7O17W+IHFi7MeXgJtqgXLsHCcp84w7
 OlT+KW2rSzZ78Zg+Vm7Y/N12AVOS6TBm3qn503s5wJDwH7HaqF03VXzp3zNojaAbmCY+8kwaDkd
 Yk4peua8TBV5pp0pT3tE2OIlSMSBZCO52nBkbcUqaiCbrGM2WBsB0SiL6tZWvPYGFQk3SL/lEPi
 2KQyKwtW9Ro7wqmquktQAD6/logBXYKNhJK8Iz3B9DOsj+rSQILOedhnUDY2thvnFJsEpcQx3gF
 seutQAVz2SQ5bxC+QHWYnvYaeQjQjv0kkD39CwOepyFMCKztQBpF5NBGUVDre+KxQOXF9a4IsOr
 Q83fvoBN4+baYyeOx2Fi2np3shmFTK2Qc72e+OFHN6SLYacDkN2gaAgjbTFpqLnx6pvgWc+VnQv
 vmki4eo9Q74cr2qQb4M5nyBc6CL2jb4fZvxC5X7W0wprSYaw5wez5sD3UHkkHensdwnvJCBZ6C7
 npNbS6ST7tZFEZjA18DcKG/IDaww9JqYlabN7kgvRetPKleHboevj8aoQiY3o8xL0GvEeV6Khra
 HDGpa53ifQBrv3NmebHvPnZx8h2qDpaoyojNUjU4sHmBXXmt6Ob3IZCNGAUjVcRNLt8ZCbD5/XD
 LuJkrAFNaNMPsbI1pcxxmdj361ZWQiKiNY5ISQIq+IJbxyQyd5Y4=
X-Developer-Key: i=markus.probst@posteo.de; a=openpgp;
 fpr=827418C4F4AC58E77230C47334761FF8E7AD43D2
Autocrypt: addr=markus.probst@posteo.de; prefer-encrypt=mutual;
  keydata=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
  aBeNN4ijKZchBXHPgVx+YtWRHfcm4l8=
OpenPGP: url=https://posteo.de/keys/markus.probst@posteo.de.asc; preference=encrypt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_155730_198192_CA693518 
X-CRM114-Status: GOOD (  14.15  )
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

Instead of trying to remember the current 12/24-hour mode, which could
result in time corruption if out of sync, we force the use of the 24-hour
mode. Set to 24-hour mode if in 12-hour mode on startup and assume
24-hour mode. The 24-hour mode is already forced on reset.

Signed-off-by: Markus Probst <markus.probst@posteo.de>
---
 drivers/rtc/rtc-s35390a.c | 47 +++++++++++------------------------------------
 1 file changed, 11 insertions(+), 36 deletions(-)

diff --git a/drivers/rtc/rtc-s35390a.c b/drivers/rtc/rtc-s35390a.c
index 575bb256eb25..4d7fecfbe38e 100644
--- a/drivers/rtc/rtc-s35390a.c
+++ b/drivers/rtc/rtc-s35390a.c
@@ -64,7 +64,6 @@ MODULE_DEVICE_TABLE(of, s35390a_of_match);
 
 struct s35390a {
 	struct i2c_client *client[8];
-	int twentyfourhour;
 };
 
 static int s35390a_set_reg(struct s35390a *s35390a, int reg, u8  *buf, int len)
@@ -181,31 +180,6 @@ static int s35390a_disable_test_mode(struct s35390a *s35390a)
 	return s35390a_set_reg(s35390a, S35390A_CMD_STATUS2, buf, sizeof(buf));
 }
 
-static char s35390a_hr2reg(struct s35390a *s35390a, int hour)
-{
-	if (s35390a->twentyfourhour)
-		return bin2bcd(hour);
-
-	if (hour < 12)
-		return bin2bcd(hour);
-
-	return 0x40 | bin2bcd(hour - 12);
-}
-
-static int s35390a_reg2hr(struct s35390a *s35390a, char reg)
-{
-	unsigned hour;
-
-	if (s35390a->twentyfourhour)
-		return bcd2bin(reg & 0x3f);
-
-	hour = bcd2bin(reg & 0x3f);
-	if (reg & 0x40)
-		hour += 12;
-
-	return hour;
-}
-
 static int s35390a_rtc_set_time(struct device *dev, struct rtc_time *tm)
 {
 	struct i2c_client *client = to_i2c_client(dev);
@@ -225,7 +199,7 @@ static int s35390a_rtc_set_time(struct device *dev, struct rtc_time *tm)
 	buf[S35390A_BYTE_MONTH] = bin2bcd(tm->tm_mon + 1);
 	buf[S35390A_BYTE_DAY] = bin2bcd(tm->tm_mday);
 	buf[S35390A_BYTE_WDAY] = bin2bcd(tm->tm_wday);
-	buf[S35390A_BYTE_HOURS] = s35390a_hr2reg(s35390a, tm->tm_hour);
+	buf[S35390A_BYTE_HOURS] = bin2bcd(tm->tm_hour);
 	buf[S35390A_BYTE_MINS] = bin2bcd(tm->tm_min);
 	buf[S35390A_BYTE_SECS] = bin2bcd(tm->tm_sec);
 
@@ -256,7 +230,7 @@ static int s35390a_rtc_read_time(struct device *dev, struct rtc_time *tm)
 
 	tm->tm_sec = bcd2bin(buf[S35390A_BYTE_SECS]);
 	tm->tm_min = bcd2bin(buf[S35390A_BYTE_MINS]);
-	tm->tm_hour = s35390a_reg2hr(s35390a, buf[S35390A_BYTE_HOURS]);
+	tm->tm_hour = bcd2bin(buf[S35390A_BYTE_HOURS] & 0x3f);
 	tm->tm_wday = bcd2bin(buf[S35390A_BYTE_WDAY]);
 	tm->tm_mday = bcd2bin(buf[S35390A_BYTE_DAY]);
 	tm->tm_mon = bcd2bin(buf[S35390A_BYTE_MONTH]) - 1;
@@ -325,8 +299,7 @@ static int s35390a_rtc_set_alarm(struct device *dev, struct rtc_wkalrm *alm)
 	else
 		buf[S35390A_ALRM_BYTE_WDAY] = 0;
 
-	buf[S35390A_ALRM_BYTE_HOURS] = s35390a_hr2reg(s35390a,
-			alm->time.tm_hour) | 0x80;
+	buf[S35390A_ALRM_BYTE_HOURS] = bin2bcd(alm->time.tm_hour) | 0x80;
 	buf[S35390A_ALRM_BYTE_MINS] = bin2bcd(alm->time.tm_min) | 0x80;
 
 	if (alm->time.tm_hour >= 12)
@@ -381,8 +354,7 @@ static int s35390a_rtc_read_alarm(struct device *dev, struct rtc_wkalrm *alm)
 
 	if (buf[S35390A_ALRM_BYTE_HOURS] & 0x80)
 		alm->time.tm_hour =
-			s35390a_reg2hr(s35390a,
-				       buf[S35390A_ALRM_BYTE_HOURS] & ~0x80);
+			bcd2bin(buf[S35390A_ALRM_BYTE_HOURS] & 0x3f);
 
 	if (buf[S35390A_ALRM_BYTE_MINS] & 0x80)
 		alm->time.tm_min = bcd2bin(buf[S35390A_ALRM_BYTE_MINS] & ~0x80);
@@ -503,10 +475,13 @@ static int s35390a_probe(struct i2c_client *client)
 		return err_read;
 	}
 
-	if (status1 & S35390A_FLAG_24H)
-		s35390a->twentyfourhour = 1;
-	else
-		s35390a->twentyfourhour = 0;
+	if (!(status1 & S35390A_FLAG_24H)) {
+		status1 |= S35390A_FLAG_24H;
+
+		err = s35390a_set_reg(s35390a, S35390A_CMD_STATUS1, &status1, sizeof(status1));
+		if (err < 0)
+			return dev_err_probe(dev, err, "setting 24-hour mode failed\n");
+	}
 
 	if (status1 & S35390A_FLAG_INT2) {
 		/* disable alarm (and maybe test mode) */

-- 
2.54.0


