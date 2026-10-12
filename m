Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A32BFCA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 10:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fscg4JINZL7Vzeywayyz5wQLf/idjMk2AC90hL5b11o=; b=IJQVaTN4xZgyNer8sdqflUy+dp
	123VYRSTwanX0Bm1t0dipotj8Lm1AVe65N4RpiAaKbg+XButm8pZC0CdLPK+wtCyP7U/SDOJ4uf9L
	PvhThIDYt0HxEGQPDOn2qKTUem1goORk67ddLNLwV2/pxnZWI0CjG7YUpsDQmQE5h/CE3F5av0Y21
	n4Mr0PmEgLut9ORCnrMKsJUJp8Cakh9+f1kBmkfM3mIJjuRQ7WZTq7ZA3PZ+MkAE2R7jS16hX/+GT
	I+6O2wWxpszorNGm+mSPrXSc/T+J7IiBb1VdYqhu17+84HgYrDL+ADQX1N3tu2Fp9cxYOlHRJ6dZA
	Y4+tkA0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDiw-0000000AIJA-0akR;
	Mon, 12 Oct 2026 10:57:42 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGDis-0000000AIIO-3dhh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 10:57:40 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-67583c777abso1620495d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 03:57:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791802656; cv=none;
        d=google.com; s=arc-20260327;
        b=FWTl4ibWCGGqE5qvi/3GiLJ2tkezkHpRogrTB+v6lU9iliqRIlAsRLWhsnfPgCIACT
         oOsf1GP31JF/RT9WXvMi5rIgC04LGNUZH8dCgKHeq3YK/0b+Joe3ngg/pIPfmPKErJNP
         hVeHAJIrXdanW/jcw16ETzJdQeW3s3jkyJLqFL18TW+xVlIqzF1OfMPpgZoVoqyfn22y
         D1eESJfvazDTuFMm91a86eG8v9lpyDu9lYVyBvgp9XV9bEhwTl9o4meyhIHSS3po2pgx
         lF3rSrdAsxmXKXHJSO+5cFD7TMqhcxhNGTjw6k2yfLLPh55o/2ayDdI4Fi1hagbpmSe0
         VZdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Fscg4JINZL7Vzeywayyz5wQLf/idjMk2AC90hL5b11o=;
        fh=OeRp1s+1yc5kSomG3VHb7M+ycITctDbGvBH1/+TaVk0=;
        b=cBWPGdRTTNyOTFhU24wDWADN4mWhlTusQdz1CVRssmS3cxFvWZpj9hawwbkf0FTZll
         W8fUhdt6PbfhLalVFaWirnljZ5dq4av2kCOf5vLQvvhP13TJw+94av1KjMnClGlrGA49
         f/naMpB3xa4rIME81Hbeif9AtW7Lac+rdz0YRWDiWbzh8U4Y3jqgZFtFVMLGMxCNc4fe
         VGfvMKfNd20jO+08KH3nlCRbu2BTIp/M5DzmV+5ITjaVoXuQn9O+6CZ2fi0AANGfxMmH
         5o32AJnTbrIzEF8SCAix1BWPsT0khyR62b3JwLlr/s9pqG3UTZTvbVUbm0hUuOpONJyO
         vHIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1791802656; x=1792407456; darn=lists.infradead.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Fscg4JINZL7Vzeywayyz5wQLf/idjMk2AC90hL5b11o=;
        b=WNoLqRD4YnHdM2sXcxuI3Iw+rK2m8uttcZpyhiBjEqw//GBVJzH7WUhG75qZHeSJV3
         tfcxrAUc4PG4PRp+Zau3E+frWXTMS/hTf1FW0seB5UvDYrtJKDj/60MWSISxoNgqsuim
         2UkqbcZW8jx0UiCcUYi3VenVcEwLbixsT7h9FyERSXqmj2ApVhoCwbDzME56RJdNFA0O
         Q/Bg8PZUJXIT4ctdFM8toMSbYAc9we14jABtRtfkbHkP6E7rgBi3Ly5Jlob5nBgfoyZe
         wv6KbQ90D/0o2cN8/QFChuWi+lpLSt1jMURmq3nHuHssDjFvHOyi+Fl4eakAz/hJCOWO
         ZQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791802656; x=1792407456;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fscg4JINZL7Vzeywayyz5wQLf/idjMk2AC90hL5b11o=;
        b=j2OcUQY0db52X3mhjC3Mkcl6xN56ndCfNsHI4htfOFA5y9MwAlp8BwehfUVxeuVLmk
         T5pZ591suSoyMWfqt8ij+fR6BwJf4LVii9ghwVulehiggUrarJrfdVjH7wF8oCL85jXk
         OurvdhhkUi+B1lwCfCQW2CkO/2kcaAlS+alhKgv6NDpRXcEfG3aGnV+XN1dmvY/sQThk
         ez9Wol0P+RK/L3CFgPb7ossJU8QRzgcGcjpBwInEcynxGtNxuoyd8X/Tn9SbZOhJY0a9
         1T4/iGStmkXDV48EIwlny1jYjrRjbqQNr1JN9WVjCzire3lkTsKxcVMpdVhT1u+2C2ZL
         iP7g==
X-Forwarded-Encrypted: i=1; AKwUvBxKKR9Hn6rGF4PR7wsnNKro7h3xAYdaqyrRwXbhOwCRt0zMCMiVi8e2O5GSU+CJJtbA381H7eYVQLNYRKmWKgFP@lists.infradead.org
X-Gm-Message-State: AFq9FYJEuCF6TCjPOQYtu2r4QJ6dXxj4w15vDvTUYdzWZLguVLXGIr+G
	miMHXshvzuBUbqFQnvON/s4434UPMTzb50LHFbLdlzB6DsAFEE3V90kYMgMNbGIdPLDS3T6ZOh1
	XwdOo5XMzVlQR5Kjigvq3Kp1MpDfvAzdYgleRkSAc
X-Gm-Gg: AYBFou3+sdBFDgmBZRs/MjtztMeR34+zNWQZCNSbDnXxZQtIMwNdKzRF44xA/vPFgAZ
	ImYBlWJYsKPl/a3ewfKCVHRX5+IXCrhemQ1MCVyezutMtecTDF5Ei+xYczDrW50KRfENzLLjFoV
	F6fRYzTZPjB+UXmDnggvFBBlkcS0Z0drmMAN+f/KQ8CiQ3nOkQyv8lmnKJ8ZTR+NN2GS9zWqkFK
	9/qQ/rS7jb4T0cZ7P5Q9C1Ig36xP/EGhhHEPaA72TUp6w/7eCVS3rFuqPJRpiL8Pq7Jnk0NIhLn
	dXxcF6LeSnOlHp52mMrVTrTAwVPDXCaGqcrCLiuwoQJJUl/BrdjeKwgXQ+IERKg3FZQOMqQVwgf
	yySY0hpJs1t7B
X-Received: by 2002:a05:690e:dc2:b0:675:5b6b:64f2 with SMTP id
 956f58d0204a3-6793693562cmr2851523d50.31.1791802656620; Mon, 12 Oct 2026
 03:57:36 -0700 (PDT)
MIME-Version: 1.0
From: Michal Simek <monstr@monstr.eu>
Date: Mon, 12 Oct 2026 12:57:25 +0200
X-Gm-Features: AclHuK8n4GCiKTJKoIe_GD4HnQ9qVHRTmopzfVjqxwULnllVJTlGBzQoSjMWJk4
Message-ID: <CAHTX3dJ4Hi0sHT9acVE+4r1pBU91Ryew9f-2D2vfDYcF98P7kg@mail.gmail.com>
Subject: [GIT PULL] arm64: AMD/Xilinx SOC changes for v7.4
To: SoC Team <soc@kernel.org>, linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_035739_175205_ADB52A4E 
X-CRM114-Status: UNSURE (   8.31  )
X-CRM114-Notice: Please train this message.
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

Hi,

please pull these 2 SOC patches to your tree.

Thanks,
Michal

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynqmp-soc-for-7.4

for you to fetch changes up to 118be086595e8f98b19e8fa8e24276466a8e9483:

  firmware: xilinx: support RPU boot from DDR (2026-09-25 15:42:55 +0200)

----------------------------------------------------------------
arm64: Xilinx SOC changes for 7.4

firmware:
- Update UFS and remoteproc firmware interfaces

----------------------------------------------------------------
Michal Simek (1):
      firmware: xilinx: ufs: move PHY/SRAM ready polling into the
firmware backend

Tanmay Shah (1):
      firmware: xilinx: support RPU boot from DDR

 drivers/firmware/xilinx/zynqmp-ufs.c     | 70 ++++++++++++++++++--
 drivers/firmware/xilinx/zynqmp.c         | 44 ++++++++++--
 drivers/ufs/host/ufs-amd-versal2.c       | 46 ++++---------
 include/linux/firmware/xlnx-zynqmp-ufs.h |  8 +--
 include/linux/firmware/xlnx-zynqmp.h     |  5 --
 5 files changed, 120 insertions(+), 53 deletions(-)


-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs

