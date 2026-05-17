Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D93CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 May 2026 08:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwEMal98Epkv3bylVhHBHykFgLUZqAnOwEA4hmXeJeY=; b=SW8tyJ+frFUdAVn6mwupiAIaSL
	64HUqeT0SpKwafj0Sk7FXtwyyvu9EUkNaX9Wu2RrXtVeaOWDxhCbgU4t7AFp6YJrb2D+FzMMxBIDh
	BbkZFWKsHvpJZS2kMLz8LBlBtdfzLbFfqvE1/yGKn4nAmr/QVsEPjQCN8mkTSGCSbdNmjvvNpxbpM
	sf854ubsDCfau9ry9+eQx5360QC6vnSJobYY5ZizE8sRr9bHHs7rixhdfALkCs8QSNW8ewFCbJAvB
	T7BBqYCvw+pTNr05eHOo0xUc2F0n9tJJLVqx1V3k7diVO0IBV0EiKIxutsR1Db5d4ARpyXVksYi7D
	Q6rJASjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOWUf-0000000CL18-0ALw;
	Sun, 17 May 2026 08:05:01 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOWUc-0000000CL0D-1GCl
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 May 2026 08:05:00 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2b9ea536877so5902115ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 01:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779005097; x=1779609897; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwEMal98Epkv3bylVhHBHykFgLUZqAnOwEA4hmXeJeY=;
        b=gt7lJEZ5AbjnIFCk+EzCrq9fXOR3/2VhzZO+EtxrMiQUBbNZiSjyqVeCrruhJuh9MB
         2FIcZir7MJd6RBKiQzfFkQRWc5paUifG3iS4AWWs2kV+QcULgWaWqIz6T+3EBr2U1DdK
         9xaskvHA6I4rhGEQRvvxStt+qSqOoW+VEjA2SHwP9xjP5PsigY4LKBTzIYEt+P8OVn1v
         QktzTv5q5O+DZ9vaGdlcBLid4Lkgwc9MbnjSl7D+DDDw07ZxxHKjJwFrQUFcExAiWj6e
         u3WmKVaQTMCoc1l8rTgjyJJHhqm4Pop2xZc6WT6zGuG0L8zFNV21r5ffUSqK15PwRpAv
         o+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779005097; x=1779609897;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cwEMal98Epkv3bylVhHBHykFgLUZqAnOwEA4hmXeJeY=;
        b=AOMcDp8WngOmXoYwo8lKzRH+zw64apkvy1LCAnf3mNZkilnu5uiu9g4n/QJ/ttYNam
         J2eF0XvnDVqLpqqDr2V6KUyVfFNNDBjEX66e40iZjjVtzgei6M8J3nYBBIY0IRLs+Vmr
         YcMnel8iFAO/x4fmjfAXA332f6jHKb8mP8G/Wq+27PmlTDfXzepaj51o7YhQc2cK3ou1
         wrzsNNmkr58c0gpieJ/mGsuRaP1L5JG6GZSeV2eJ2Fwofw17Oz5D+BDZ4AAeXJc6LjWs
         YijqfpZEhiDUonNi/58v6Cm7UndaZn9P2zSsHpTTLexOPGljqbtD9LdyxY/NqtY2xRRI
         Zh0g==
X-Forwarded-Encrypted: i=1; AFNElJ/rRWl6wJF35/33NU/y3m9aKK+8HyTM3sij81N8U/HfU+vMCxZgWgr+zvXp7M4baFTKAZeMR+OEYd34yvVyI7QU@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs4+FwUTqQMFyyqfdUBlveuRTpEuuJQjP6kPTMX0nDzeakcTzl
	060/rS7OrVZOrl/uPKWR308uzYxjKG5eJOrLn5OeRPwHXiL8keO2v66N
X-Gm-Gg: Acq92OHyEcFAEN2lzo0al091a4WTTLikldcyWBdifAj/Mm4n2/rxyXnbU/XIALdd5F2
	nNouL2NrQAn7iUiqi+KuW72zhfr3lxLFBGIP1w/mEAppA8QnAS7196GGckOVct1s303LklAW0tp
	Rq01Ip6hUGkGdGct86VvfeVqQmuHPTyyYQg0zhRiNw6wfnePWhcuF8pH7PNubiij4oNGohEbjjm
	UIWgAwqJ4WQtMSOCg3vomP0aAqJy7tb7en2d0DmlHMnvOd6FZ7oKxpnMjwW9MbqqT8sQWBCUB7k
	vJV/zWrtKHR1xdu3QHc0BjSBRAnYUOGzzvfqOjjC8wzdbTSNhrdmEkkBYOC5hEgp8V6eHxu49yR
	gDf8FRPlq55GJ56ZJ9Vl26lJqpG1G7jt1jM9iprWa63LgpAlLB7BNndybXWK7lgPXcyvP6bFrc+
	87vQuPBh/WkAkWZ7ASdjnjTFIzdLrOwYTfTbQUmuGntty5Kee8iToHU8noVZ0s
X-Received: by 2002:a17:902:ebd1:b0:2ba:bab2:a867 with SMTP id d9443c01a7336-2bd526fd16amr125158475ad.12.1779005096859;
        Sun, 17 May 2026 01:04:56 -0700 (PDT)
Received: from fedora.taildae27b.ts.net ([2409:4064:2d80:75ca:8541:272f:2bb3:5e55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5fb17sm109834595ad.1.2026.05.17.01.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 01:04:56 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Subject: [PATCH v3 0/3] raspberrypi-hwmon voltage support and teardown fix
Date: Sun, 17 May 2026 13:34:42 +0530
Message-ID: <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_010458_345784_9F9BA845 
X-CRM114-Status: GOOD (  10.57  )
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

This series adds firmware-backed voltage inputs to raspberrypi-hwmon and
includes a separate fix for the delayed polling work teardown path.

Patch 1 adds the firmware voltage IDs and the shared voltage request
structure to the Raspberry Pi firmware API header.

Patch 2 extends raspberrypi-hwmon to expose the firmware-provided core
and SDRAM voltage inputs through hwmon and documents the new sysfs
entries.

Patch 3 addresses the delayed polling work teardown concern raised
during review.

Changes in v3:
- corrected the SDRAM_P and SDRAM_I voltage ID mapping
- moved the voltage request structure into the firmware API header
- made the voltage request structure voltage-specific
- split the delayed-work teardown change into a separate patch

Tested on:
- Raspberry Pi 3B+ running Linux 6.12.75+rpt-rpi-v8

Shubham Chakraborty (3):
  soc: bcm2835: raspberrypi-firmware: Add voltage domain IDs
  hwmon: raspberrypi: Add voltage input support
  hwmon: raspberrypi: Fix delayed-work teardown race

 Documentation/hwmon/raspberrypi-hwmon.rst  |  15 ++-
 drivers/hwmon/raspberrypi-hwmon.c          | 139 ++++++++++++++++++++-
 include/soc/bcm2835/raspberrypi-firmware.h |  25 ++++
 3 files changed, 171 insertions(+), 8 deletions(-)

-- 
2.54.0

