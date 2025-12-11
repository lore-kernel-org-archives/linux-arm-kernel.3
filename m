Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480EAD41D64
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 17:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EMUEsjsV+UnHdVdxs42rX4kdIiZsjjM1yfHblt+Kr5Q=; b=GUBQ584XNRrZ3PeQ8KqZupEc+E
	ezGeGbvq0T8cab+UWY0dBMgE03gUT5K+NRf/lZ3eSCOGN2HZ21aDvmiDls/4duHm5ngKno3jNslCp
	Bv2pQDZyiiDUdtBHI+5fcGJ7GNskf7GN0iXgaW96KwVpyFtc4UuyA2SgZ4a/w/gmn/BTIC7pKeO8s
	CNmKYPUBSnmbfHLk0MZBst/kH/7/tIwx44FzSyMaKHzMYBwoPYXOVQrDWgmcVXf7iA+/S0VjxNfmX
	sb+eGhWWy6BHiA6xfwz9rmyjcsrmOPY+qy0Rs8N5yOBCdABEezhJiGdrzIPFd12NewbBAn7GpY5+O
	Fw5Wwcrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTkGk-0000000H18i-2pS4;
	Thu, 11 Dec 2025 17:15:58 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTkGh-0000000H18J-2YDh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 17:15:57 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4775ae77516so4193725e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 09:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765473353; x=1766078153; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EMUEsjsV+UnHdVdxs42rX4kdIiZsjjM1yfHblt+Kr5Q=;
        b=FEA1GQCBY8oZ5ymmggpwkL9smbZGZukQJBvp05aZ2fWyoqhUsgTit+YocYnqVWBrO1
         adTlHMUp36CMZuV1TNrSH6j862Ft/te5E1ZHTtfjnS4w3tj+8VAU9pXwoyOIp8zYAWew
         n0cFeH2oGpnWnJuXLedYlKTGD4TEsseq5NeAB8NyKicGtD2Z6OusJmvvV1f4Ea0247Mp
         8KTh9VdFoDHSrHMoSLEBVwUMXMm73NdcD9qqZOLedKTJwqnxmUP3F6IZhN2b+W3QPGNp
         qtIwqNe4VbFR+fUDY3Uj6wa8uB74CSI1aztv+rVEH9IK7NnDWfZZ0ZB7hZuE4xwZ0BUz
         BXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765473353; x=1766078153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EMUEsjsV+UnHdVdxs42rX4kdIiZsjjM1yfHblt+Kr5Q=;
        b=XSm5qTb+n/88rR/2oFjDLDYKse6uWMNkVVUg0I39rwK2RDHt5zV3Nty/Ay8DoGKfW2
         qPMocfpuHgsVkm66ruutNBMMipbJcOFZUQ0rkKbKCO+hWR5S5vQsV1lfhMYdK/AxAfbs
         jXHvxXkXpA/AmVmW4G66gBwd2e/uH07VmYGWKiv0ZArKsEva1fb9GvWEu8gcECPDNUs/
         3gFuaui4UWPbXOmpsTx8YY0pV6UwIDhTODPuQfihOsC6DGWHvgWbjIf9GL6Kibh0L/nu
         qf4XTVtCROpQkwaB9p+uLklUNgEYgUnNDZDazvsu3NmpE9P39uFG/H/nd4bYQ8ALQaHN
         17Bw==
X-Forwarded-Encrypted: i=1; AJvYcCXcBRlzxbcWddg+jIHFHhNJs2NwKOpAKCO0uWbOeWiLwnDHH9Cr+T7WYz/w8p9iTW2Yo2dF7zj9yEUw+hatkKsd@lists.infradead.org
X-Gm-Message-State: AOJu0YzL4s3PYnZkEbtHMmowgA3lQOCqShaUVPasMOji9JVgJ/I9+74z
	PWF94YisKq1zdCFAQRnOmbbQCvLtJ+M3yrcToVy501tCXAcALcHlms3PxMfcnnh/2b4=
X-Gm-Gg: AY/fxX6y0ZSfagyEQvwSt7O7lHA2MV6nRvD59V9ru0eGRVKVyl2l3ifZVSFADjbC5tl
	5FqtbceKFc8k0an0GqgN8WMkHhLaZD6X9/eK5U69Z577dqOPw6DbwHxvOZeFJcJcy+z9m4QT9lE
	Q+BRCAK5zoDO3GJTkkoiq5RzlBJcIkdtHDhrq8Lw5BSFt1tLtZKaNOuDZCDNv6rXncmQgtQXPUv
	7BieZdi7zUd2IZqCl/J6FmA/8VZths00UTMZndKEShijAnVPLvvrgBrQvlQuieyvTO1hu+ckq6W
	BR+nzs/i2xjFDeYydjAbkjcOIa/0TqlKPXLia09ysL/EEjIcQjbW6OeyWp/4moBEt3aoWRqLaxM
	MuMVNPLGuUFd1XjdAH+NhnIsLrTspiu3RjCTNM5Hocac3MrcxxKo7FAtn5Q5+ybfrvWH3XJHayn
	1k9REGNxDUE2XyJuAoNJe2BFD6/qZu5ny6ZZg6ElB4qTsKi3WuPt1RrxL7wVc2ffRvYTfi1LDXx
	uA=
X-Google-Smtp-Source: AGHT+IH1WdB9lpe0Nt0W2bI91FzFVq1XhPopqcW3gxsnNR/pZMKlmmN+J4cQvorBXPFQhPdkhqM0qw==
X-Received: by 2002:a05:600c:1d0b:b0:477:7c45:87b2 with SMTP id 5b1f17b1804b1-47a8375ae3dmr83804315e9.16.1765473353260;
        Thu, 11 Dec 2025 09:15:53 -0800 (PST)
Received: from localhost (p200300f65f006608b66517f2bd017279.dip0.t-ipconnect.de. [2003:f6:5f00:6608:b665:17f2:bd01:7279])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42fa8a6fd62sm7327909f8f.10.2025.12.11.09.15.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Dec 2025 09:15:52 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
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
	Sudeep Holla <sudeep.holla@arm.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	=?utf-8?b?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
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
	linux-crypto@vger.kernel.org,
	linux-rtc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-integrity@vger.kernel.org,
	keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: [PATCH v1 00/17] tee: Use bus callbacks instead of driver callbacks
Date: Thu, 11 Dec 2025 18:14:54 +0100
Message-ID: <cover.1765472125.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3006; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=VskU/7ED+cd07+YT0cLSY6lSv8W33UJFXaXtUVFg16k=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpOvwTkOdNXplS+sYyTfjIHP/A8Gme4RZEpqcXt diRkMgNgISJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaTr8EwAKCRCPgPtYfRL+ Tl1NCACRY8t0HOZ/pe2jgNYt83zctNNDYXhzu8cPsBYC6DoxIG7qbaEG/i2btzV7P9iWEXcGnaW iTW12DonZuA0Ys9v8JfYi5w/j0bn6FtrwKHIXypEwJzVzqmq0s9FhsPI+49irrtevJQOGtp/6FA ++4ZHclomZVYjG5ZORmnn0yLTtXHbQYEPcyHuzEEUvs+tHCIYIgkV7gzQ+qvpTw0lA+x5uFNqib OwGvVZIMvKV/HN70QhazY/X+w3FigDIT5y0g639i0H9JkEXX1mq5qRYi9kcC8z3WazU0iJ39L6Z w+blXNgg5fNZycKQ3GRhj80bk29PcQH7RHH6Vzov1GydnnYE
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_091555_761719_32F5361D 
X-CRM114-Status: GOOD (  16.47  )
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

The patches #4 - #17 depend on the first two, so if they should be
applied to their respective subsystem trees these must contain the first
two patches first.

Note that after patch #2 is applied, unconverted drivers provoke a
warning in driver_register(), so it would be good for the user
experience if the whole series goes in during a single merge window. So
I guess an immutable branch containing the frist three patches that can
be merged into the other subsystem trees would be sensible.

After all patches are applied, tee_bus_type can be made private to
drivers/tee as it's not used in other places any more.

Best regards
Uwe

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


base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
-- 
2.47.3


