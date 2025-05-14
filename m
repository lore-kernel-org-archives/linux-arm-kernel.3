Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F13C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 14:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s6k9/GzU7jK7zlNovm76Gy0+NwNfyykNoxZQiNddalM=; b=mQRumi2U85NT3AmRghiConEm+2
	mflO2zI9IcNAm/4vU51ALNtsLmLEqQI9awR0SVqiIiCeCyu5MsZOmF3TrtNc4q43GfJBeHjeHzO30
	926YGePzV2CHdgS6wfhjOxrzDEAhmBpuAj7GeW1Rg+f8YxA57an6lldnLSz3WG/dDTFEd79h6JkrK
	VPsdImzvMsflVbbxTtaOUxZOwF+HtDdV2wUBRjhUR7n4TCPlTgjZOET+0oPSM8W3c5hax4UuWbTS9
	w6NBQH91e2fFZBdcj6h+vC+fvbM2iDCUpHZ9GCNwfCo/iLzVrAxQM4/M4u1ReDa/xrLRe9p0DXCUA
	1vCcVWBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCzu-0000000FP0N-0Pom;
	Wed, 14 May 2025 14:22:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCRV-0000000FFGh-37JV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 13:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747230400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s6k9/GzU7jK7zlNovm76Gy0+NwNfyykNoxZQiNddalM=;
	b=f7WUk6OPTaxohewWw5gxTHFZdvkCSZyceI84kgDXAd3E9e1TERl327+MxD4HeaRblBcyTG
	75ZWX5kC//TL1OXPPsPZDnj6ZXSTf+BEbX0rDHieNIiUNNquBKpWbuej0K0GIaQUzh4TN5
	lcF+u62wreVX5tLVw4assxBQzvzy9zQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-QnRMjhq8MwOMdX25Fd5mgw-1; Wed, 14 May 2025 09:46:39 -0400
X-MC-Unique: QnRMjhq8MwOMdX25Fd5mgw-1
X-Mimecast-MFC-AGG-ID: QnRMjhq8MwOMdX25Fd5mgw_1747230398
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so31657135e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 06:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747230398; x=1747835198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s6k9/GzU7jK7zlNovm76Gy0+NwNfyykNoxZQiNddalM=;
        b=sf06Xd23Uy25h8wxDdWQCYuBGStVLUs7Hftu+BuGCbsLTqkMdbLCZROKa4/vw3OVb/
         NmXmWHHnAILVnOpoA5KLMmhVvtS2X2Zd9ExseZsR5687RyJj7807fg5q4C8PmuSIxiBw
         jFkqovuyyIosMkWabYqxdof1jZ7SDirWUSnfFZFc42MroZrtjT8fOgU+KJv1Lyzrs9cm
         4HRVsJaS1poegg8vFv6NmUYhzlAWAA2jkcO/00ZfK3tNIk6SkPZ8gP5gQvZ10fIalzEi
         Wr+5M4hlgKYulgu5QZfvkW7JWowMpG5ZSWw6zOsfhIbGPPYgQeleG14L9wFt1X2k3o6M
         Xo7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbI4U314eWgo0Xp2pCJM6wcy63en7uLlMJ3VOT+aO1MUn21BvTNQn2qZcHyj0fclnao9PeZp6tlAch637WZr2V@lists.infradead.org
X-Gm-Message-State: AOJu0Yyfe9Wixvs8FD8tiLmy3P2KltMgWRXwa9eQpoj+EsRVRsOmkhfz
	8q6X7/WC1hcxuZ5PZ6Q6D/RuP24dOHjaSAlVrNqOljK082j5FhKXN7NW5MBxxc8WyJBU2dfRKQU
	yeDpTwRY+Tph5n7sdNOZ/b9IB28aWoxDFotMYO0bXY6duAzLO1rmmToyx3lp5C1t76E2yotBN
X-Gm-Gg: ASbGncu75wjeDVDOp6c1A/y9FbPTO40IGI9OiU5o8Ar3EZm6DJk8q/52gp9uRBAuy0x
	gzz9NjFb5j3h73JVBkyAp92G8E/x/87wjGX8r4juavH8AywobGuf6eir/anxZYgyDiQxOATlV2d
	SC8p4BRCXOIuRSZN8M0nKSqLohtfAOpSTX92Qmyjkbtqwb7vzgHaatQbBL71E7NO6h02vZXgPks
	Grn9IPqPlxyTmjqrHDyCPagnQATpyB2KlslFe9Bdrxg9o8s617KvZPZ4CL+YRrAeMTGEOcNefYf
	4X/P4OT/mf7CgU3IwZE=
X-Received: by 2002:a05:600c:c07:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-442f21690d0mr31437815e9.26.1747230397958;
        Wed, 14 May 2025 06:46:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFY9vh+bpQG79sp/6DI8di3RxLNOV35Az0tewqTY/ffxwzq3/IqQ2Ik1HsPTwPjASd5o1gbLA==
X-Received: by 2002:a05:600c:c07:b0:43c:e6d1:efe7 with SMTP id 5b1f17b1804b1-442f21690d0mr31437185e9.26.1747230397293;
        Wed, 14 May 2025 06:46:37 -0700 (PDT)
Received: from stex1.redhat.com ([193.207.148.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951b62sm32993785e9.22.2025.05.14.06.46.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 06:46:35 -0700 (PDT)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	Peter Huewe <peterhuewe@gmx.de>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	linux-integrity@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	linux-kernel@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v5 0/4] tpm: add support for sync send() and use it in ftpm and svsm drivers
Date: Wed, 14 May 2025 15:46:26 +0200
Message-ID: <20250514134630.137621-1-sgarzare@redhat.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: f3pcQhSohu36R7hfgc1mTihmK4SDf-s1mNF0LOA88l4_1747230398
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_064642_026336_9B2AC2B4 
X-CRM114-Status: GOOD (  18.54  )
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
- v4 -> v5
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


