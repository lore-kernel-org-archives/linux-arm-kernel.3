Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B169AFA1FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 21:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4mWfyrQddMklpmzPYtTXoknwThtWFygtQ93s82K5k+4=; b=ddIrv4ZIABClmIdQt5S5y8lLui
	lJCcf6ME0Vjwy8MTh0ezZfCmkYi4Lj33dQpQ4XhzOBn2jiQNFo1pbqg4qmWA1Rjb8nOZPsowHYxfU
	1VDRORPc4hunqOwH2bD+OW0YedqF8zEIAynGyUqrhyIqXOwdfhVHAp+ZWfQGi2xfXC3dsa5/JDgi9
	Ka8Hdpthopgb5xDy9pAa3I/igImjJAyR/bMcFiDjLtpk11t6RnbxL2r97YYgl0fZdYl1qqPAlyT98
	eRXIeWocNUS/wMWhf0udWUM6meZHgDWTPk927AzZAalhMskes/aeQqAEmTffVN9bSsaQMsqpcdrgC
	mPmDMQEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFepW-0000000AkJ5-1Lt9;
	Wed, 22 Apr 2026 21:09:54 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFepS-0000000AkHe-2mco
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 21:09:52 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4891c569cb1so5402485e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 14:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776892188; x=1777496988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4mWfyrQddMklpmzPYtTXoknwThtWFygtQ93s82K5k+4=;
        b=RcRQZroR3VGZdW5Z6GVr5vFXtkLHf4LKHazbMIyf+Jp42yn+D7rvMQeJczdP5cRSjz
         Zc3cMsY92+Zsj4U7LrO42fScBxuAi3LoQ2jRLFbguhObT/x0pHCdYKbVEGFbfkzEgqzl
         qC/DDZ/0JQ4+UGrUD1hzMwUNxqlEmPCUalXgF+3a208FSj7gcf3bnodU5Dprn5O+jVwF
         F+cVlW7w+AOirMjKHePapx1n3EppcpsGqvsHV+zA08SdDgixVelZv1ZyZF75jkuGGNlP
         JmHKJG/PaLjjnyvk9BGwD2o5FehYWSVfHNiDc+hGg6qLUyFIv1WgIxKzSOG/ZKn8NOTV
         O7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776892188; x=1777496988;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4mWfyrQddMklpmzPYtTXoknwThtWFygtQ93s82K5k+4=;
        b=esn3Znyfznhw4aKdQTDapwvm42M3H/aEO070XCVIT7VAn4Fi3EcTAFiF/GOWyVQ4Oc
         racfAQC4CJvAiVw4iUWBzxkpFI8V1DmejOEPdzfrAKDYF6FEOWuMCDt9LLX7pD8uoaKu
         ddqeE5M1DHY6TrE/nhcZNCW0MU06cWy5kZs2gdE7d/TooSYfrYCPgaJ+K7rAwl45sh0y
         Y1f/qzIzfTe3lbFLenCZ3ODwIWuuXxiNNYPtPNnzhFMV4KrGHQvVb7GT+nKbJbPtP9Th
         a/kVsFBvIcdzAi33Bc+oiLaqf75GBElMw989x6U+QmgGE93Tp8ICR82vrHjLRoVmyqEm
         B3bg==
X-Forwarded-Encrypted: i=1; AFNElJ/DzFenwXPhVRlivueNoGN3NnDtZi47HfcG2nJR/8Hne8gewcNB3AJ1lv7HEJorLCRbJW61L7IW5+pyfW/9tZXV@lists.infradead.org
X-Gm-Message-State: AOJu0YyVQ3DRpya1gyrJr5JG0s8yR312j5eZ32QNxiWhoS2unzxF2ptW
	YoczXOjmMmGm4fKmeqMHbPdNI2T0g8SgA/HVjC7EK6wHhNhMXDBD2QHe
X-Gm-Gg: AeBDieuq7kZ29yuPAW7DdXZoc8GAd3jzmZrX+v6ZWTuQElA6gl+oWwh0r4Qp6o8OR2n
	LzWO6KIbWllrVYrJ/amTKNjn4BLQojPz5sUcdVpO1remtzcNvQa+Inv+2C4Rz3I1I7+apMDYP2n
	h9a6J3QnTnqWQ3uR6omew8yOWRGdGQEBs3BqO0sDX/kn9V2mLOYo9I6V05WHj2gVTHsHarQpHuM
	0Ej8qB+p9bWJuQcPbszuLLNpWX6+wS+5aHv81LWQAr3umcDCvBqnMezjsvLhcWvt2FQPJ9eVrEy
	MA9B6rI8FV/7lxe2QHYebGeSpvP1yXo9QilD86M2zKGtmEykMCSwGWbl6pdMyCWgB/NSC5/1gds
	AOVQI/xY2VXWh30NToF8clrW+lPsr2EyD6LslD8L/cyQOELxwyidp9Chf5dHnm3xDGHKHLNfgD9
	LTdWic5koY/2uKCaeWoniZcLUb1cPjdNrn8DdiKZgaLMDBaLoXWbTkOdSWwY/msPiYovaRadadR
	Q==
X-Received: by 2002:a05:600c:4746:b0:488:a2ac:a338 with SMTP id 5b1f17b1804b1-488fb7685f8mr168719945e9.5.1776892188108;
        Wed, 22 Apr 2026 14:09:48 -0700 (PDT)
Received: from menon.v.cablecom.net (84-74-0-139.dclient.hispeed.ch. [84.74.0.139])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a4b329542sm352469085e9.3.2026.04.22.14.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 14:09:47 -0700 (PDT)
From: Lothar Rubusch <l.rubusch@gmail.com>
To: herbert@gondor.apana.org.au,
	thorsten.blum@linux.dev,
	davem@davemloft.net,
	nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	ardb@kernel.org,
	linusw@kernel.org
Cc: linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	l.rubusch@gmail.com
Subject: [PATCH v3 0/3] crypto: atmel-sha204a - multiple RNG fixes
Date: Wed, 22 Apr 2026 21:09:33 +0000
Message-Id: <20260422210936.20095-1-l.rubusch@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_140951_608883_5892DE68 
X-CRM114-Status: GOOD (  11.86  )
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

When testing the RNG functionality on the Atmel SHA204a hardware, I
found the following issues: rngtest reported failures and hexdump
reveiled only the first 8 bytes out of 32 provided actually entropy.

Having a closer look into it, I found a (small) memory leak, missing
to free work_data, miss-reading of the count field into the entropy
fields and parts of the 32 random bytes staying 0 due to reading the
slow i2c device.

The series proposes fixes and how fixed functionality can be/was
verified. Executing rngtest afterward showed a decent result, due
to the i2c bus a bit slow.

All setups require selecting the Atmel-sha204a as active RNG.
$ cat /sys/class/misc/hw_random/rng_available
    3f104000.rng 1-0064 none

$ echo 1-0064 > /sys/class/misc/hw_random/rng_current

$ cat /sys/class/misc/hw_random/rng_current
    1-0064

Testing RNG properties currently shows problematic results:
$ rngtest < /dev/hwrng
    rngtest 2.6
    Copyright (c) 2004 by Henrique de Moraes Holschuh
    This is free software; see the source for copying conditions.  There is NO
    warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

    rngtest: starting FIPS tests...
    rngtest: bits received from input: 1040032
    rngtest: FIPS 140-2 successes: 0
    rngtest: FIPS 140-2 failures: 52
    rngtest: FIPS 140-2(2001-10-10) Monobit: 52
    rngtest: FIPS 140-2(2001-10-10) Poker: 52
    rngtest: FIPS 140-2(2001-10-10) Runs: 52
    rngtest: FIPS 140-2(2001-10-10) Long run: 52
    rngtest: FIPS 140-2(2001-10-10) Continuous run: 52
    rngtest: input channel speed: (min=7.631; avg=7.804; max=7.827)Kibits/s
    rngtest: FIPS tests speed: (min=32.273; avg=32.701; max=33.056)Mibits/s
    rngtest: Program run time: 130177956 microseconds

Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
---
v2 -> v3: Removal blank line, rebased
v1 -> v2: Removal of C++ style comment (I saw it too late, sry for that)
---
Lothar Rubusch (3):
  crypto: atmel-sha204a - fix memory leak at non-blocking RNG work_data
  crypto: atmel-sha204a - fix truncated 32-byte blocking read
  crypto: atmel-sha204a - fix non-blocking read logic

 drivers/crypto/atmel-sha204a.c | 60 ++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 21 deletions(-)


base-commit: 3bfbf5f0a99c991769ec562721285df7ab69240b
-- 
2.53.0


