Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC8AC71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 13:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=efezj3LnMENDrFh/B5S35gvfWn7TvlAanxYCoetZO3w=; b=C5ktwCz4teJQ26/wR24BdBz5NO
	7O4D2+evrJWbdz6Dk6Ylb/9Czlm2vUnot4vq9ki63eLQPHJHRr5eSH494zFGhWGU+6Ab2a7Gv2vzp
	BcRowPx5t2JJTTX4kKW8qCMZpBDBmO5rl8moPSMatebB+ywLZ/pPi6p3b66Etaj2tAYIoE+v22Qj6
	vTunYUQh9+NDKHsMTRIS9OQTlOAl7Z0oVtdU11TkRtJOFHWlxGaHHhOSpXgCoSLVTu/sKkXjmcJvw
	BPpPpDvD6/Q7pnHWdvMNyZY3q5Q/cTD0CHJz3SSJuf7YXt8DkgGR/8S+FCLDE60NotzbSlMpRl8ay
	+G8iCc0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbyO-0000000FkBF-3hq7;
	Fri, 20 Jun 2025 13:40:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSbTo-0000000FfkQ-45J2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 13:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750424906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=efezj3LnMENDrFh/B5S35gvfWn7TvlAanxYCoetZO3w=;
	b=BhOrnrZeqFQT/RphKQgy1jZE58cRPgjN5Kxtrru7d7do2NIWl7gO73iL3bftk+Za961Vfd
	NuRlfBRG5GN/LMbFsjngz3MxjTnqvfLFAYkdyF73gQSKmM62XlYoQXJm+sQZ0+wzlkG98W
	gIoMVWHNVLN8eYJ2P3a9lQAnR+Y2Ayg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-hNIzdO1jPWS_wd8rOrNx0Q-1; Fri, 20 Jun 2025 09:08:24 -0400
X-MC-Unique: hNIzdO1jPWS_wd8rOrNx0Q-1
X-Mimecast-MFC-AGG-ID: hNIzdO1jPWS_wd8rOrNx0Q_1750424904
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a50816ccc6so1177315f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Jun 2025 06:08:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424903; x=1751029703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efezj3LnMENDrFh/B5S35gvfWn7TvlAanxYCoetZO3w=;
        b=wB6CimLaM+TGNK7PIpChu8sMiXfBXL8cW9oh8GgFPnD9uzME7CH6UR5Nz4Wqsy+6OY
         1yoEYSY+A54YI/955ZvzcIGcEAxOMPH6NvXLF3Pv6KSXMbdCwE5EGUT5Qu/RPRfV7AZf
         rqXG1UtfwwFWOCk6KLDxRugf2gVYZaBV0nH0+6jts/4RD38E9/67EUg0Ec+yKwET6XSe
         UZ9p5Ik8xw9gnkFdUeBnTCNDBEQmC5tOQ5m07tLhwWQfoKEdjOrjRnlnTCpQKf4oLMfj
         eyW0e7DGktQaY3K/Va66su0SuYLssXzjc2KPa878TjaLf0qMVji1PTOG1qAiJK4IzRFH
         +jWA==
X-Forwarded-Encrypted: i=1; AJvYcCWpw+YVSymAHs0QXlFWswGj2WAJBhpFD7LOF2QMxRP22A+1TOOS+/BwNiPT5vRp5TUf/EWG4SNCEoe2bddlPbcs@lists.infradead.org
X-Gm-Message-State: AOJu0Yzqu02gynQYAGqtLIV9tYQAYoklHLdn2qKFc0+vKM5k6+86JfQe
	c9/5ktsipxHSwjcS4XS8KvGhG7sDZYuDFvG4fciLGDRsmkr2CbDph6nBm+tnNmJccQkMiHW6aYS
	kD/gx0GfK6ilW15SVk99wSU62Pn5M82VnSt0wdXIcM4EQDAAH6A+LsBIz6J+0L0DxDG7Iw2GQ9t
	xQ
X-Gm-Gg: ASbGncsQHD9hshfIMx4CTSvpNe6gIVw7KjDVgkSFnd6+JHsNRDGkgzxjJZrGhB+HpT3
	+CxBURnxDyPBtFvAnBVvqCkF6FM05NGtll6Cfs4ZzRqEV5IK2swraOyhlFHrNuxn5Y9DjEmX6YN
	OePn181YfNwEleqrREo99JLKLQydqDBvb32KrwvicywA5BCEWBdTkpYa52UEKMsLesLOXse11ot
	iOgq4ZT0w9zuBVnVs1lj0HQ47UEm9IVOOnBY0fgzXgSMEBo+wPwZrTUS3jsnX20w1zwj3Gvhvyw
	XFvh0+5b51i6Wj803e8gvOCMZgfWGi5l4gA=
X-Received: by 2002:a05:6000:70d:b0:3a4:ec32:e4f3 with SMTP id ffacd0b85a97d-3a6d12e8d73mr1963672f8f.17.1750424903390;
        Fri, 20 Jun 2025 06:08:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvQvIvRiOMOwY6vcPGATBD4+Ygw2boYIIBCDTjikBg4YIpBv3nF1VGt1H//5h9pdOChc4ssw==
X-Received: by 2002:a05:6000:70d:b0:3a4:ec32:e4f3 with SMTP id ffacd0b85a97d-3a6d12e8d73mr1963604f8f.17.1750424902439;
        Fri, 20 Jun 2025 06:08:22 -0700 (PDT)
Received: from localhost.localdomain ([193.207.146.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f19f9esm2059296f8f.39.2025.06.20.06.08.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:08:21 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Naveen N Rao <naveen@kernel.org>,
	Sumit Garg <sumit.garg@kernel.org>,
	linux-integrity@vger.kernel.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v6 0/4] tpm: add support for sync send() and use it in ftpm and svsm drivers
Date: Fri, 20 Jun 2025 15:08:06 +0200
Message-ID: <20250620130810.99069-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cfiryy62v7NbqqfEtPeDEB8q-KUyFOMT3gfdRPHtA6g_1750424904
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_060829_085302_607A7374 
X-CRM114-Status: GOOD (  19.08  )
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

The content of this version is the same of v5, but rebased on current
linux-tpmdd/next (`git range-diff` on v5 is empty) after the merge
window since tpm-svsm patches were merged with another tree, so we
agreed on postpone this series, see
  https://lore.kernel.org/linux-integrity/aDCb-wkHGoLQ-IGg@kernel.org/

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

Thanks,
Stefano

Changelog
- v5 -> v6
  - rebased on linux-tpmdd/next - commit e271ed52b344 ("Merge tag
    'pm-6.16-rc1-3' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm")
- v4 -> v5: https://lore.kernel.org/linux-integrity/20250514134630.137621-1-sgarzare@redhat.com/
  - changed order and parameter names to match tpm_try_transmit() [Jarkko]
  - rebased on next-20250514
- v3 -> v4: https://lore.kernel.org/linux-integrity/20250509085713.76851-1-sgarzare@redhat.com/
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
  tpm: add bufsiz parameter in the .send callback
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


