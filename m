Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3FEC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 09:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KczM2UBQW66xcP870XQKZDwDetPPkSEynH8wmBTSFuM=; b=AVldxvams44lnbqWzeTAKI5iGx
	VhdXcfU1/r9UJjnHihvDO4sriLw7E3+SmRMF8t9iNoKQRWgVrXRW1WMZIDXApXuV5yEy2OuxwFFxa
	yplOKs3U+hZ57skz2inE5K84UNagMxFEPSahRTaXNqQqWxQYR5jEx0Ks3QwbyrSKHgLjnnV78HBQw
	c/v7JbC3onzwA6PmDSVd2yvHVat55GIWULZ4nWTs9vGDIVGLmg346JCbrZflAsCEhYw+0SYtMpTZ4
	MojTY+KuxdqHH+rUkBwJxUTzumFOStzfOiddvFZAyBdjUxc1ODvIsBh8Zk0MksObA03s2m68GU7Y9
	/vNB+U4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDK46-000000037GP-0GTc;
	Fri, 09 May 2025 09:30:46 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJXs-000000030Ul-2t3e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 08:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746781046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KczM2UBQW66xcP870XQKZDwDetPPkSEynH8wmBTSFuM=;
	b=TrilwuXKv7jOuUGaxANxd+ndeM+VIVL+9PuN8LqgZRxg5eaknkpOZG6lPGL/nDkPtcMC3v
	cFnzxNWUDCR5VygyL5qjqy/ti+WddVk9JOmZLxNSq+UWCUiPxDZXqC4OxlsOczsSBylNtP
	X4rcG9YW22f9HDLD3nXX9TP8pTrGgHo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-354-iFwkmQYkPNS0SLl8CWm4Tg-1; Fri, 09 May 2025 04:57:25 -0400
X-MC-Unique: iFwkmQYkPNS0SLl8CWm4Tg-1
X-Mimecast-MFC-AGG-ID: iFwkmQYkPNS0SLl8CWm4Tg_1746781044
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ad225698c20so25367366b.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 May 2025 01:57:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781044; x=1747385844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KczM2UBQW66xcP870XQKZDwDetPPkSEynH8wmBTSFuM=;
        b=tdp4X02GPRacvzUF68he84AKllDStyCdyT192ocLSrQsXxZXULLXJVBjfHmzZd9etm
         fe/z05Y257KV+CbOaatOkCkP+ckT/3wlD45WO0V6SUJ25a5rsAmkPsJvVVE1OolKYmYr
         zSKnU34iaGFuuPDNgNGmtouRjiTWnA48RNphyslPxPgTXfi6R80I61emh2iW50IIf9dg
         E/4H8K1A1hDwgWzXEH8GpB28UvSbJKHDP7suT0PEYVwCQdMLFtVNwY8SArc7+WrYRoRh
         Esrc1yHre4OmBrE8VKI0r2M9o9Ea8OiSaFlo9XVm11PjgvG0QjBRcIbTf9t0PTLT2TGa
         sB4w==
X-Gm-Message-State: AOJu0YwTampCVP2fyUqdFnP7sD854/Pc9wRSq5jStoOGjAVdFavFMUok
	AuTjQnTW+WzdqdPYbMfYfiSJuntgsyCF7928uOa//Dlsdh4xOFeoNaa9/eTlPGf7MEKDNhufpAu
	HPPsdUZMLVcC7bRe6ydxhHTUUIf1TywraD6cLRC430nDKA8EOagbNATtTeeZHXjow++QdHeHl
X-Gm-Gg: ASbGncu+Y7vESSL21exuaxY2zE+RWsBNi3ZZaTI8DJhaKhmkfwbYWExER4m3VM6Xx1B
	YbbIR9CmKhhdli8zf9+dvoUN8QYVPp0iVzoCmmu/20PKo7ggzwFGPIbb+yl6JtFaVdikQzz/lSA
	oW43n1px/j5TRqLDb5lfBF10wkvXwEobiSQjqc8j20MWEP7CcTPBTMFTowxK1jRejgIbZy4/NuW
	U/r5IGB3VaFuaT3p/zZUaMLhXVYYezp6q+GsHpDIfRT/E6x+qJpADmR+f5Yc+/BYt/GZQ4L9aGe
	NqrVXJy9sgh8MRzGFdBlotMHhA==
X-Received: by 2002:a17:906:6a22:b0:ad1:8d47:f5a1 with SMTP id a640c23a62f3a-ad2187d9ff9mr242884766b.0.1746781043700;
        Fri, 09 May 2025 01:57:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHDBevO7YDl8KglZ476gaG4KxHzTLxc7mg7e0L2pUNIVoWmz4WZr1HNz4n0w09X6zYeiH0HQ==
X-Received: by 2002:a17:906:6a22:b0:ad1:8d47:f5a1 with SMTP id a640c23a62f3a-ad2187d9ff9mr242882866b.0.1746781042944;
        Fri, 09 May 2025 01:57:22 -0700 (PDT)
Received: from localhost.localdomain ([193.207.182.136])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc4f240sm1085791a12.33.2025.05.09.01.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 01:57:22 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-integrity@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v4 0/4] tpm: add support for sync send() and use it in ftpm and svsm drivers
Date: Fri,  9 May 2025 10:57:09 +0200
Message-ID: <20250509085713.76851-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 1zCqB_m1YWSDOSHxfhzAcCHfjoUDtyvU_zOhLMN58c8_1746781044
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_015728_795409_C5799538 
X-CRM114-Status: GOOD (  18.74  )
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

This series is a follow-up to the discussion we had about whether or not
to add send_recv() op in tpm_class_ops[1]. Much boilerplate code has
already been removed by Jarkko with commit 980a573621ea ("tpm: Make
chip->{status,cancel,req_canceled} opt"). With this series we try to
avoid also the temporary buffers needed between send() and recv() for
devices that do not support interrupts and provide a single operation
to send the command and receive the response on the same buffer like
tpm_ftpm_tee.

The biggest advantage for this approach is with tpm_ftpm_tee where we
remove the local buffer and extra memory copies. For tpm_svsm it does
not change much since we continue to use the pre-allocated buffer,
to avoid making an allocation for each command.

Introduce a new flag (TPM_CHIP_FLAG_SYNC) to support synchronous send().
If that flag is set by the driver, tpm_try_transmit() will use the send()
callback to send the command and receive the response on the same buffer
synchronously. In that case send() return the number of bytes of the
response on success, or -errno on failure.

This series is based on "[PATCH v7 0/4] Enlightened vTPM support for SVSM
on SEV-SNP" [2], which is currently merged in the tip tree and available
in linux-next.

Thanks,
Stefano

Changelog
- v3 -> v4
  - reworked commit descriptions [Jarkko]
  - added Jarkko's R-b on patch 2
  - added Sumit's R-b on patch 3
  - rebased on next-20250508
- v2 -> v3: https://lore.kernel.org/linux-integrity/20250414145653.239081-1-sgarzare@redhat.com/
  - fixed comment style [Jarkko]
  - renamend `out_send_sync` label to `out_sync` [Jarkko]
- v1 -> v2: https://lore.kernel.org/linux-integrity/20250408083208.43512-1-sgarzare@redhat.com/
  - changed title since we removed send_recv() op
  - implemented TPM_CHIP_FLAG_SYNC idea [Jarkko]
  - removed Jens' T-b
- RFC -> v1: https://lore.kernel.org/linux-integrity/20250320152433.144083-1-sgarzare@redhat.com/
  - added Jens' T-b on ftpm driver
  - removed last patch since [2] is not yet merged and will require a new version
- RFC: https://lore.kernel.org/linux-integrity/20250311100130.42169-1-sgarzare@redhat.com/

[1] https://lore.kernel.org/linux-integrity/Z8sfiDEhsG6RATiQ@kernel.org/
[2] https://lore.kernel.org/linux-integrity/20250410135118.133240-1-sgarzare@redhat.com/

Stefano Garzarella (4):
  tpm: add buf_size parameter in the .send callback
  tpm: support devices with synchronous send()
  tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
  tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC

 drivers/char/tpm/tpm_ftpm_tee.h      |  4 --
 include/linux/tpm.h                  |  4 +-
 drivers/char/tpm/st33zp24/st33zp24.c |  2 +-
 drivers/char/tpm/tpm-interface.c     | 22 ++++++++--
 drivers/char/tpm/tpm_atmel.c         |  3 +-
 drivers/char/tpm/tpm_crb.c           |  2 +-
 drivers/char/tpm/tpm_ftpm_tee.c      | 66 +++++++++-------------------
 drivers/char/tpm/tpm_i2c_atmel.c     |  3 +-
 drivers/char/tpm/tpm_i2c_infineon.c  |  3 +-
 drivers/char/tpm/tpm_i2c_nuvoton.c   |  3 +-
 drivers/char/tpm/tpm_ibmvtpm.c       |  6 ++-
 drivers/char/tpm/tpm_infineon.c      |  3 +-
 drivers/char/tpm/tpm_nsc.c           |  3 +-
 drivers/char/tpm/tpm_svsm.c          | 28 +++++-------
 drivers/char/tpm/tpm_tis_core.c      |  3 +-
 drivers/char/tpm/tpm_tis_i2c_cr50.c  |  6 ++-
 drivers/char/tpm/tpm_vtpm_proxy.c    |  4 +-
 drivers/char/tpm/xen-tpmfront.c      |  3 +-
 18 files changed, 83 insertions(+), 85 deletions(-)

-- 
2.49.0


