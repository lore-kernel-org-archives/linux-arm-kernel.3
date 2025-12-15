Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B52FD5B16C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 14:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ppOcPFqIwq9P7NGqZqTz1/tjn18c3F+fMKSBb9x2/Cg=; b=kWJ8ruqmGGfrlFXVXKU/Fpyk0A
	a0VGrkjdcpoqg95HSJ3ewt1Ww6qCQppntGNWqZ618pzCX6C22P+JZQk02DxQ/gPocyQRC4iG6nJ0D
	UIUpx/yjGRpXQua4b3kWr2829Pe0hlPeHQscC6d70l33An8Jfou3EDjqR3pwsV/yEWCaR4tJIM3nf
	+PMPBSlx1tQh2W9OwDSQc/qMkZjy6SD2Lh57voFmnX3EyT7ZeQqdR+wNg87BEgybe2R5hhm534AUp
	gbKt8Xjer5MfDEJqCEF3GLvKPc5sWq23xDRsO6Omt4Xw2ETnn7SLfETrAaqvEgKjRpFpZ1I7X6JWA
	P6YhfW8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9OP-00000003m7c-0cQ4;
	Mon, 15 Dec 2025 14:17:41 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vV9OL-00000003m6g-3uuA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 14:17:40 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-b7cee045187so693305266b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Dec 2025 06:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765808255; x=1766413055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ppOcPFqIwq9P7NGqZqTz1/tjn18c3F+fMKSBb9x2/Cg=;
        b=jcJnFUadUX/hQq6MeQ+v31+mIXzLy8M2jACueYQo7hWJZCpM1AU84zcLS6K9WqU7nr
         GzP2BcIgcDJi+whZU43PelNHujg4oXj4qFNwZoRdkyxTp5AgJ2BczQ/5ZGq8XXmPYOGT
         sTHa5IkXeS/l89yR2JRdJzpTEokzhITIg+D78ug/rhhoPgJseHybCXLmvhbf3MvXNyDM
         0kce/MGaJe0/luczfQpPQSzKkPwAcZAGg19u4Mowgs/qePx/myhkkgLFKlU9KlF92iHv
         zM90TITDBtf6eMHHfQJ5VXLGOLi70oTB3OGTAYOOqztKfSVvre/CD+vnaG82u8mIq3T9
         1wPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765808255; x=1766413055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppOcPFqIwq9P7NGqZqTz1/tjn18c3F+fMKSBb9x2/Cg=;
        b=FuJznHRpFm/ChgMayOGuzjvIXPTDehu4mgp8lairplhoA3qNI21CSosoMqmqqjvGJ+
         /914STS8ex7nPARbgLyBuQnmhho6yp5TFqNPtn1BiANgvXnJLMC2k+23U7wGtJULyXos
         StgXr2hmqKd6K40Pk1hK6SnQVzY49bKvDppwdO4QLAb23yAxZQACaKOzev+vE2mRw4Ev
         xrU0J0+wtuLtRJk5BdPfZRVO82ObCQ9vSp6tnD9aO/eg9JUeiIUKXdwXEQBknBoc69wg
         /P/ukSJmCD4v5i2xAb9NaiqrqPX9v2jKiKUPc9EOukPeqM0KFWa/58PlQTNi7cT7mS7y
         Pl+w==
X-Forwarded-Encrypted: i=1; AJvYcCWj62BsTQ8bSqJvSM7xZenO7+9AXrG4iRDASd47KXCoj1BmoR6zAuzcZAU7zMcmkn0+gXWKGmpZBaBf8EF58b94@lists.infradead.org
X-Gm-Message-State: AOJu0YzOhlEHHJTtqd5tvn9ZgMZ4doj/NiIdVeLyTG2vLtVfNKWAuZV8
	oNCzivyZp6Xfs8si30NnsRup/PaH9hX5+8iyhfJEHE/M7j4UHuTOrEeCDzQR5IH6WY8=
X-Gm-Gg: AY/fxX5MvX7ssmWYswdVwQuDwzj7s7zJPcFDBS3/MXFGGJhhUB7XBrkbo1/+jIjxcqD
	Q9yrVbK3FQ+hNdjiTDk/9N5UfGNg44NpEE0S3LCRdDc3AtgYEdbHTSjddUvZ8e1ZTeU08dSmeTW
	SULZnvq/H20+2+rwXw9S+BHqmbYYmZbzgGG00TWDz7uqEeb3qZaB03MeBgf/lAz6p/4gWexRDlF
	zgwXsOIaAMlY/m3BZYO1eis7jXxa8J0mmv8HARy6ekXI6PItij6MrRFs/yOH5yGr05i0XvdPtUS
	y2lxYXQfHmUDxe5A8tT5GrU8eaQFFcnxQVp4n4LdjE82wUZ11y2f/I8akmcZjd0Nnqzhb9NNgUW
	6NGom8tV5FfHwQ5+SPq3ogPHskv61BEa6YDEXqGNj8Jkfny/BeEwW8y0l4zJOd4WGH6QmpQ/6jo
	QJXEx14Zc8qBWV+0Yrycxbu+IzdsyjV9WMMihNM6aOvBzNF0UlqRTp44MLzQ==
X-Google-Smtp-Source: AGHT+IF5kWl8asvVZ2gDn2/ukMC7FmJVzWuHgbBPUo4GSSTrWpKfiHxIiV3JEK3vNep6zj7EVQ2rxQ==
X-Received: by 2002:a17:907:a909:b0:b7c:cc8d:14ef with SMTP id a640c23a62f3a-b7d218d55fdmr1188092466b.32.1765808254923;
        Mon, 15 Dec 2025 06:17:34 -0800 (PST)
Received: from localhost (ip-046-005-122-062.um12.pools.vodafone-ip.de. [46.5.122.62])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b7cfa56c152sm1380034166b.56.2025.12.15.06.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 06:17:34 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Sumit Garg <sumit.garg@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	=?utf-8?b?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	=?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Mimi Zohar <zohar@linux.ibm.com>,
	David Howells <dhowells@redhat.com>,
	Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Peter Huewe <peterhuewe@gmx.de>
Cc: op-tee@lists.trustedfirmware.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	linux-mips@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH v2 00/17] tee: Use bus callbacks instead of driver callbacks
Date: Mon, 15 Dec 2025 15:16:30 +0100
Message-ID: <cover.1765791463.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3083; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=KVuyHGeUtpLkpGJYZbfb5WtDJicjtg3giXBlS+vhN0U=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpQBhBsL1Z+rYFoGFHUfEy6nbD85QotpwGnuS0G OxYNqNRFI2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaUAYQQAKCRCPgPtYfRL+ TugUB/9E31O/wKyUkNJNEPUiyayhLen3mT/3afyja8AKlZtLRRSDYD85SklWs8WUYR25f620Tug HCQFCBGP6zvWFDFUJWDts8iS5V7u/2f3fzK4EwWEIO8RjWf//RCGbcOXzrjD+gHhyiO4ntF2NWr 3ospR0B/APcHFEMI3zfkmIaPNlyEhNrddsNRbaHKA+WTWhZm7A/yqOnVYIJ6MLuTrhjHLZZoL5u gBimMOyT/Dmu6TUF9ex7Rhk+vookCt9jpn+vbxsz0ArRtMIo0W8fVdouxPDFA9SMn/bCn6BBJ+B fl85F7WiQwNbfWoeC8/qrjWMCGDfxgyRZi39jRQ+nWgTC5V5
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_061738_348147_0799CDF1 
X-CRM114-Status: GOOD (  15.82  )
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

Hello,

the objective of this series is to make tee driver stop using callbacks
in struct device_driver. These were superseded by bus methods in 2006
(commit 594c8281f905 ("[PATCH] Add bus_type probe, remove, shutdown
methods.")) but nobody cared to convert all subsystems accordingly.

Here the tee drivers are converted. The first commit is somewhat
unrelated, but simplifies the conversion (and the drivers). It
introduces driver registration helpers that care about setting the bus
and owner. (The latter is missing in all drivers, so by using these
helpers the drivers become more correct.)

v1 of this series is available at
https://lore.kernel.org/all/cover.1765472125.git.u.kleine-koenig@baylibre.com

Changes since v1:

 - rebase to v6.19-rc1 (no conflicts)
 - add tags received so far
 - fix whitespace issues pointed out by Sumit Garg
 - fix shutdown callback to shutdown and not remove

As already noted in v1's cover letter, this series should go in during a
single merge window as there are runtime warnings when the series is
only applied partially. Sumit Garg suggested to apply the whole series
via Jens Wiklander's tree.
If this is done the dependencies in this series are honored, in case the
plan changes: Patches #4 - #17 depend on the first two.

Note this series is only build tested.

Uwe Kleine-König (17):
  tee: Add some helpers to reduce boilerplate for tee client drivers
  tee: Add probe, remove and shutdown bus callbacks to tee_client_driver
  tee: Adapt documentation to cover recent additions
  hwrng: optee - Make use of module_tee_client_driver()
  hwrng: optee - Make use of tee bus methods
  rtc: optee: Migrate to use tee specific driver registration function
  rtc: optee: Make use of tee bus methods
  efi: stmm: Make use of module_tee_client_driver()
  efi: stmm: Make use of tee bus methods
  firmware: arm_scmi: optee: Make use of module_tee_client_driver()
  firmware: arm_scmi: Make use of tee bus methods
  firmware: tee_bnxt: Make use of module_tee_client_driver()
  firmware: tee_bnxt: Make use of tee bus methods
  KEYS: trusted: Migrate to use tee specific driver registration
    function
  KEYS: trusted: Make use of tee bus methods
  tpm/tpm_ftpm_tee: Make use of tee specific driver registration
  tpm/tpm_ftpm_tee: Make use of tee bus methods

 Documentation/driver-api/tee.rst             | 18 +----
 drivers/char/hw_random/optee-rng.c           | 26 ++----
 drivers/char/tpm/tpm_ftpm_tee.c              | 31 +++++---
 drivers/firmware/arm_scmi/transports/optee.c | 32 +++-----
 drivers/firmware/broadcom/tee_bnxt_fw.c      | 30 ++-----
 drivers/firmware/efi/stmm/tee_stmm_efi.c     | 25 ++----
 drivers/rtc/rtc-optee.c                      | 27 ++-----
 drivers/tee/tee_core.c                       | 84 ++++++++++++++++++++
 include/linux/tee_drv.h                      | 12 +++
 security/keys/trusted-keys/trusted_tee.c     | 17 ++--
 10 files changed, 164 insertions(+), 138 deletions(-)

base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.47.3


