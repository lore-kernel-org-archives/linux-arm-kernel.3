Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1156FCE068
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 13:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0gpTv0cQ1xaud3+6Hv+n3cMevQTI+cIYX2yYWA3C2vw=; b=hV0UhqH9NUFzJkRtLwOLN1+X6o
	l2lQgCk3afJGyou+JIYNbXTXA57JCsi3JcSWErzhOn6/ddZYXYE3+3n8tcC6zS6SEd0tsB2bSrh97
	nRpOUBhrMGGSOh7g7qhgcpSgd7msiYWsp6cN7oX+EgCUUNlhhXbhIBuhiaStcyHq7gr3p/9mim62W
	p2JJ2IURDhM1P71iUyh53w7+fIniIspr+FQxSI8eRVFEBVHqynrN4+l/kHFLrOt/6ywjJXKiO7i3G
	ocesIF2kw2ivxr4eznelSqnKWk0CdEd9PoLix35GlL/Ixl5Sf6x2v5XZ2uZtrtcC0eyobPckabK4D
	vnEKSN1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvb9d-00000006BIe-0VnZ;
	Thu, 26 Feb 2026 13:11:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvb9b-00000006BI1-1YMr
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Feb 2026 13:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0gpTv0cQ1xaud3+6Hv+n3cMevQTI+cIYX2yYWA3C2vw=; b=XUN5oRHfB/sfBUIeoqeW1jtxcN
	vze4Vwb9HmRFAy+IS1K3QoV7UpPYAikUbrYbiFF2CvVjBK7E4DS+8NtRFNxGToSqvOThQcEPA1wXQ
	VlW2HLl9hd8UgdfZTKTLI3tT3Pw+2BpSsAWQc6ZS/Ql923YWgkfFnHaJmSiDZG114CJ7kqjXSnd7Y
	sek2OapJoX4gdnNJm0r3sIwqdOfW6lT5iEv86DrwBaSjwUxi8wslqZm8Hus/GecjY0HbaTCarmiUD
	QDdRCPHZ3yYRuNfgnoaXAndUlYWUXgJ9G2Gs0EOT04/DEtOwyB1DvK0Y1HERG+nxjOLu/wAHpG2YJ
	E15zP0hQ==;
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvb9Y-0000000B0OW-0eVo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 13:11:42 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4837584120eso5964215e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 05:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772111498; x=1772716298; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0gpTv0cQ1xaud3+6Hv+n3cMevQTI+cIYX2yYWA3C2vw=;
        b=ZqO2Y4+IxWJOFRVOnGsIQzEew3d/6rV1E1u/ZtEv88gNvUwQePF/lkfPrVn1FClt6V
         olWJgayFncAlRq6ZyqjMq/bpbqfiSTxjAlvqwG9WTOizyWixUtPE6qvhF2UZwRIAPcfU
         qj4gRArWm3o1AwZH2fGxf3ruBcYvLpDcaARMQF2d+ggeU7Qu0+yoE3Vujzn7BFle+oGa
         ki8eR2KA8xkGAq2sVdjJthrxEaDp0+z7yQ/TntUnGAMAjkYAc8rB1t/jNch6UbLsY/wB
         Tw5wDvN7vhGeM+xHUCThL4Em/0gpNBQW7M52gzMqEh5SVAzRD1ZggnCWd+D+hm5C9ubB
         Wk9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772111498; x=1772716298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0gpTv0cQ1xaud3+6Hv+n3cMevQTI+cIYX2yYWA3C2vw=;
        b=IbJyglmwmfjMxgAKJTjeE9VXOyubvBiBLUYIUKm6qmMJvGzdK28wc1/MgfPTaiAMiV
         kWOKuJ61Snkwgc0Qpi8xsu53oiHN+IM0IRPxB0ntd6uDlSGAPPpu2VpwXzJunltx1VbQ
         ZMKzU87gCNWi0DqH/CSqFBw5SK/qqggbGQ5NEqQFsQVbQkXlKJX8ZiLfIgdTlAGsai7G
         MgQUCdEuagL0CyP2JkFJUF6ZScXAUG1LdHqRIKxKY84c4rVBLeYTtkcqMlWvKI/nZWjV
         CHVoUn9UYHJH8TTA+O8qbt6+pbiUwZcE0vsBJmZDf2iEsh/5v1BupPSfdAcDixWJ0rQa
         tqsA==
X-Forwarded-Encrypted: i=1; AJvYcCUq4aq8os9tUz5sntlRvxhq/8qymOiVKlM9SIsXGNkcDUzEpuX2tbRw4dVHSO1GMOhhpKv3I+NaLjOB46C1pVmU@lists.infradead.org
X-Gm-Message-State: AOJu0YyzFZttLWAbPbKUPvun0K56UBEKZZiE5GsnQh/F+7EI6PgA/DVt
	orH13KWnx9XWykDXJqrq++MHcud9YbmEhqDjwPTOlmVzeL9x+Y/fMHMe
X-Gm-Gg: ATEYQzxHCMUysXwsZWYw08bj8kyYzBzJZJKhbaf4TToi8vYpm7M8WoKkA2Cgi6E62GB
	aKy+MmuMDmDwtdmY8pqGTdjqXbWfLDVuS7gs5w0ZJijZoawY19m9JwuSdCv9AC3bNjEWFcfPUJP
	3T5z0i/fg4H/YuWUTY0QBp8VX46dE5i0AFkHmMm+4+O2uI1qqOZBEZaDwhuKOPtKPUO1OuZ4709
	OJRD/Taa/9jKAw5Lz3mOMUroswOx7wbhW9ub/g/TlJNXLOdDu5ISQ3XZMannm5dPJVFvCR34W53
	tTQkNmXdLMTIBMZAEEsubxqpIQ+B5os7a6/s1ojOddSq+eY3L9ibOXCemihY5vPgr9iA+1MYcxR
	TjKYaFDIORMCGnIgkkL3+EEMN/fJgxjmzurC63x6VJ6dMOUk8/7qUYltzgbjKk7pGNdosNaIXZG
	zWMZWkEk67qQ5eeIiFGYJ5noyMsn3+olTjKaS9CpxtcrBxoX3P/P8uh+3Z6a9u4Xo=
X-Received: by 2002:a05:600c:83ce:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-483c21a9ab7mr73637575e9.31.1772111497833;
        Thu, 26 Feb 2026 05:11:37 -0800 (PST)
Received: from [192.168.0.253] (5D59A51C.catv.pool.telekom.hu. [93.89.165.28])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483bfb789efsm64827145e9.2.2026.02.26.05.11.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 05:11:37 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 26 Feb 2026 14:11:27 +0100
Subject: [PATCH v4 1/2] i2c: pxa: defer reset on Armada 3700 when recovery
 is used
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-i2c-pxa-fix-i2c-communication-v4-1-797a091dae87@gmail.com>
References: <20260226-i2c-pxa-fix-i2c-communication-v4-0-797a091dae87@gmail.com>
In-Reply-To: <20260226-i2c-pxa-fix-i2c-communication-v4-0-797a091dae87@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Hanna Hawa <hhhawa@amazon.com>
Cc: Robert Marko <robert.marko@sartura.hr>, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>, Linus Walleij <linusw@kernel.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_131140_334632_CB2A7AAA 
X-CRM114-Status: GOOD (  31.54  )
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

The I2C communication is completely broken on the Armada 3700 platform
since commit 0b01392c18b9 ("i2c: pxa: move to generic GPIO recovery").

For example, on the Methode uDPU board, probing of the two onboard
temperature sensors fails ...

  [    7.271713] i2c i2c-0: using pinctrl states for GPIO recovery
  [    7.277503] i2c i2c-0:  PXA I2C adapter
  [    7.282199] i2c i2c-1: using pinctrl states for GPIO recovery
  [    7.288241] i2c i2c-1:  PXA I2C adapter
  [    7.292947] sfp sfp-eth1: Host maximum power 3.0W
  [    7.299614] sfp sfp-eth0: Host maximum power 3.0W
  [    7.308178] lm75 1-0048: supply vs not found, using dummy regulator
  [   32.489631] lm75 1-0048: probe with driver lm75 failed with error -121
  [   32.496833] lm75 1-0049: supply vs not found, using dummy regulator
  [   82.890614] lm75 1-0049: probe with driver lm75 failed with error -121

... and accessing the plugged-in SFP modules also does not work:

  [  511.298537] sfp sfp-eth1: please wait, module slow to respond
  [  536.488530] sfp sfp-eth0: please wait, module slow to respond
  ...
  [ 1065.688536] sfp sfp-eth1: failed to read EEPROM: -EREMOTEIO
  [ 1090.888532] sfp sfp-eth0: failed to read EEPROM: -EREMOTEIO

After a discussion [1], there was an attempt to fix the problem by
reverting the offending change by commit 7b211c767121 ("Revert "i2c:
pxa: move to generic GPIO recovery""), but that only helped to fix
the issue in the 6.1.y stable tree. The reason behind the partial succes
is that there was another change in commit 20cb3fce4d60 ("i2c: Set i2c
pinctrl recovery info from it's device pinctrl") in the 6.3-rc1 cycle
which broke things further.

The cause of the problem is the same in case of both offending commits
mentioned above. Namely, the I2C core code changes the pinctrl state to
GPIO while running the recovery initialization code. Although the PXA
specific initialization also does this, but the key difference is that
it happens before the controller is getting enabled in i2c_pxa_reset(),
whereas in the case of the generic initialization it happens after that.

Change the code to reset the controller only before the first transfer
instead of before registering the controller. This ensures that the
controller is not enabled at the time when the generic recovery code
performs the pinctrl state changes, thus avoids the problem described
above.

As the result this change restores the original behaviour, which in
turn makes the I2C communication to work again as it can be seen from
the following log:

  [    7.363250] i2c i2c-0: using pinctrl states for GPIO recovery
  [    7.369041] i2c i2c-0:  PXA I2C adapter
  [    7.373673] i2c i2c-1: using pinctrl states for GPIO recovery
  [    7.379742] i2c i2c-1:  PXA I2C adapter
  [    7.384506] sfp sfp-eth1: Host maximum power 3.0W
  [    7.393013] sfp sfp-eth0: Host maximum power 3.0W
  [    7.399266] lm75 1-0048: supply vs not found, using dummy regulator
  [    7.407257] hwmon hwmon0: temp1_input not attached to any thermal zone
  [    7.413863] lm75 1-0048: hwmon0: sensor 'tmp75c'
  [    7.418746] lm75 1-0049: supply vs not found, using dummy regulator
  [    7.426371] hwmon hwmon1: temp1_input not attached to any thermal zone
  [    7.432972] lm75 1-0049: hwmon1: sensor 'tmp75c'
  [    7.755092] sfp sfp-eth1: module MENTECHOPTO      POS22-LDCC-KR    rev 1.0  sn MNC208U90009     dc 200828
  [    7.764997] mvneta d0040000.ethernet eth1: unsupported SFP module: no common interface modes
  [    7.785362] sfp sfp-eth0: module Mikrotik         S-RJ01           rev 1.0  sn 61B103C55C58     dc 201022
  [    7.803426] hwmon hwmon2: temp1_input not attached to any thermal zone

Link: https://lore.kernel.org/r/20230926160255.330417-1-robert.marko@sartura.hr #1

Cc: stable@vger.kernel.org # 6.3+
Fixes: 20cb3fce4d60 ("i2c: Set i2c pinctrl recovery info from it's device pinctrl")
Tested-by: Robert Marko <robert.marko@sartura.hr>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v4:
  - rebase on tip of i2c/i2c-host-fixes
  - add Tested-by tag from Robert
  - Link to v3: https://lore.kernel.org/r/20250827-i2c-pxa-fix-i2c-communication-v3-1-052c9b1966a2@gmail.com

Changes in v3:
  - rebase on tip of i2c/for-current
  - rework the patch and use a different approach which does not requires
    modification in the I2C core code and update commit description
    acccordingly
  - remove Imre's SoB tag, it should have been a Reviewed-by tag, but due
    to the rework this is an entirely different patch so that does not
    apply anyway
  - use Link tag for the URL of the referenced LKML thread
  - Link to v2: https://lore.kernel.org/r/20250811-i2c-pxa-fix-i2c-communication-v2-2-ca42ea818dc9@gmail.com

Changes in v2:
  - rebase and retest on tip of i2c/for-current
  - Link to v1: https://lore.kernel.org/r/20250511-i2c-pxa-fix-i2c-communication-v1-2-e9097d09a015@gmail.com
---
 drivers/i2c/busses/i2c-pxa.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
index 09af3b3625f1107d2722cb026e67b69b07cca2e3..f55840b2eb9ab70aad43bd7f4f44c39aa4d9c67f 100644
--- a/drivers/i2c/busses/i2c-pxa.c
+++ b/drivers/i2c/busses/i2c-pxa.c
@@ -268,6 +268,7 @@ struct pxa_i2c {
 	struct pinctrl		*pinctrl;
 	struct pinctrl_state	*pinctrl_default;
 	struct pinctrl_state	*pinctrl_recovery;
+	bool			reset_before_xfer;
 };
 
 #define _IBMR(i2c)	((i2c)->reg_ibmr)
@@ -1144,6 +1145,11 @@ static int i2c_pxa_xfer(struct i2c_adapter *adap,
 {
 	struct pxa_i2c *i2c = adap->algo_data;
 
+	if (i2c->reset_before_xfer) {
+		i2c_pxa_reset(i2c);
+		i2c->reset_before_xfer = false;
+	}
+
 	return i2c_pxa_internal_xfer(i2c, msgs, num, i2c_pxa_do_xfer);
 }
 
@@ -1521,7 +1527,16 @@ static int i2c_pxa_probe(struct platform_device *dev)
 		}
 	}
 
-	i2c_pxa_reset(i2c);
+	/*
+	 * Skip reset on Armada 3700 when recovery is used to avoid
+	 * controller hang due to the pinctrl state changes done by
+	 * the generic recovery initialization code. The reset will
+	 * be performed later, prior to the first transfer.
+	 */
+	if (i2c_type == REGS_A3700 && i2c->adap.bus_recovery_info)
+		i2c->reset_before_xfer = true;
+	else
+		i2c_pxa_reset(i2c);
 
 	ret = i2c_add_numbered_adapter(&i2c->adap);
 	if (ret < 0)

-- 
2.53.0


