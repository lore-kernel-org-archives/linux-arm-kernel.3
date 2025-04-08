Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B2D6C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 08:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EIgGazPnpY83MOYPFrpriS6Ll9aCnAeY2hjvoYNgsGQ=; b=zy21E5GVG5XmlSqK9V9JS3rgaF
	OjY0hFiG7q1qoLZlvX/Berp4HsRv2AQzecWUxDrcAezgT5oEtrTmZkk0iuUDiTx2Ydkd3SM8+a0Kv
	C+IjuSQgrwsRhIrYE2IZJ0G7GmOeFTc/1EmGChKc71DyxJAqWjt6WaMomGaBLZdkWuDB/0sqqfbQf
	PeitHgQew+4bagYyEAXW++p4JXI4MotAuj7HImp5d+LsLVkzeeObBhgOH+r8EYFYeKZeRAc1DvzVo
	dFfDKkRMi3D2dEHl29h++Ky6jRii0V0+whJKqpCYfrretFmZ0WKe8Buhk59s6GJmi4qvoPMb2Gp23
	xnwE3wYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24Sf-00000003HFM-0kku;
	Tue, 08 Apr 2025 08:37:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u24PC-00000003GmW-0nCD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 08:34:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744101241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EIgGazPnpY83MOYPFrpriS6Ll9aCnAeY2hjvoYNgsGQ=;
	b=hHzFFjwyXRbKQNoG3aAkEDVgPTssqNNEGXGS6haz1hyNO+APjub5d8eUpb1Q0QVYVfNtgd
	dmYJpbOS+1KLxca6fVCTosAI3DhdAS3pgs+XbUEWI+xZ2knJrGL0eKx4v26RnSzAneRUgR
	aBfx8cUOA49KSChfu2gKzA8ul6JGlLA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-D-u0xHRHMAK2nnLFzIDhDw-1; Tue, 08 Apr 2025 04:32:13 -0400
X-MC-Unique: D-u0xHRHMAK2nnLFzIDhDw-1
X-Mimecast-MFC-AGG-ID: D-u0xHRHMAK2nnLFzIDhDw_1744101132
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so40105365e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Apr 2025 01:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744101132; x=1744705932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIgGazPnpY83MOYPFrpriS6Ll9aCnAeY2hjvoYNgsGQ=;
        b=BVfiw6xgcZbmntwMOnugkEs/J73x72NAyydJrb9NMZ0u/DiH6fJO2xQv2NqLvfnegT
         fzqB+FTVAM2lXlPpg6i3PWj4C54OwMnfoIJHtycZhyta7zRTY4j+ioKvgK/iK36rq9pT
         Cxg9UvHqp3T815RhCSMlYUeVsPE2PMT0wBst23Wa9CzK5AAso3r3Gth8wADFTZ261wW9
         gJ3p3r2Uda9i6KDG2//XBXCiBDKrABgCTm8+Yg2itfctLG+CcbJDbO1Fe0jXX5lmPdt9
         8K7kk3ZLcKbvMdZDsIu6CqkOvZIJHtEG6bFxAJwoh2pf187i1EbvNL2tDvap/p+ARNeb
         Pd1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPGsfxOsjhBfFwH7t5XrlBclqU4k3lF/zNxRpbCM+laAGDnOmDUhUdQ65thVMQiotBavMtlEESq90SkvjivKcy@lists.infradead.org
X-Gm-Message-State: AOJu0YwtUyK7m7MfQeHGoDQS+vC3l4KVlGt8FoEGfhf6RCjUePY+ght0
	HOeXKHKXTDwswuXB36u6XVV287Wv8+T/aaGWqAmpy8OM4iNv1zo0UQs1VDRDWm8C4cGGHxLo7Ff
	QjU390zJzE5ZnZEXDd2Kwb4Ci3oARN9fSZFMtY1Yu3viRrgCxaU6xyAukebh1LsvTGk50arnz
X-Gm-Gg: ASbGncvDMQ5mvumNSTiERIGEJ7Kq83NCNa14QHlIH+9KWVtZtKLGZItvRRF0QfmZDiq
	QZrdTj/3kwhEY40MFGsfOajTFFtN1s1wuNry/Ze95Py2Fx/czPfKU3cdQqpLROc3EtcXZ2KOMMh
	BKZEPDCS3Nlx+3nHDg0F550fJrhs8QH6E2/bxkY8VPurpwx7k9xM7yGGiHcI1OU85N1K53ExPvd
	yIy+6aiFAKE6IPdAKfZjvGub5CSg7ORX9jOCHQqRgMnBKNIzGufQ5aitCR1t7DcnANgVwDoeYds
	3o55nVjUHIhiyw9qNmLU0DEgse0/eFp4/5boxvMBlNmzXtRCNWg/Qwn/PAoLanPklg==
X-Received: by 2002:a05:600c:b90:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-43ed0d6aba5mr130770535e9.25.1744101132335;
        Tue, 08 Apr 2025 01:32:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgPkhOboJZ733S4u0DItGfgIvyrdGzL+Nsa1iDulpOSNfq/oW82+ZuG+Ms69bzenXSEUjucg==
X-Received: by 2002:a05:600c:b90:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-43ed0d6aba5mr130770015e9.25.1744101131821;
        Tue, 08 Apr 2025 01:32:11 -0700 (PDT)
Received: from stex1.redhat.com (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d6b1sm14361605f8f.62.2025.04.08.01.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:32:10 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-arm-kernel@lists.infradead.org,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Sumit Garg <sumit.garg@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-integrity@vger.kernel.org,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Huewe <peterhuewe@gmx.de>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v2 0/4] tpm: add support for sync send() and use it in ftpm and svsm drivers
Date: Tue,  8 Apr 2025 10:32:04 +0200
Message-ID: <20250408083208.43512-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZtAV5An3sw_PWPx2pYmMmP61v8v4Ce2HPs_cnzmfo2Q_1744101132
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_013402_299688_A23F8962 
X-CRM114-Status: GOOD (  18.91  )
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

This series is based on "[PATCH v6 0/4] Enlightened vTPM support for SVSM
on SEV-SNP" [2], so if we want to apply this series first, we just have to
remove a hunk in the first patch and the whole last patch.

I removed Jens' T-b and Sumit R-b from RFC/v1 since we changed the code a
bit, so I kindly ask if you can test/review again.
I left some questions on patch 1.

Thanks,
Stefano

Changelog
- v1 -> v2
  - changed title since we removed send_recv() op
  - implemented TPM_CHIP_FLAG_SYNC idea [Jarkko]
  - removed Jens' T-b

- RFC -> v1: https://lore.kernel.org/linux-integrity/20250320152433.144083-1-sgarzare@redhat.com/
  - added Jens' T-b on ftpm driver
  - removed last patch since [2] is not yet merged and will require a new version

- RFC: https://lore.kernel.org/linux-integrity/20250311100130.42169-1-sgarzare@redhat.com/

[1] https://lore.kernel.org/linux-integrity/Z8sfiDEhsG6RATiQ@kernel.org/
[2] https://lore.kernel.org/linux-integrity/20250403100943.120738-1-sgarzare@redhat.com/

Stefano Garzarella (4):
  tpm: add buf_size parameter in the .send callback
  tpm: support devices with synchronous send()
  tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
  tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC

 drivers/char/tpm/tpm_ftpm_tee.h      |  4 --
 include/linux/tpm.h                  |  4 +-
 drivers/char/tpm/st33zp24/st33zp24.c |  2 +-
 drivers/char/tpm/tpm-interface.c     | 20 +++++++--
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
 18 files changed, 81 insertions(+), 85 deletions(-)


base-commit: 92d2673cb03c16e47d7308dedad6ff3bc3d117ca
-- 
2.49.0


