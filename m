Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531F0F3D5F5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Mar 2026 07:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1NxKiVQ1TIIQfXxJZ2jTSHxmlOFYe8yRaFFPpJwK6WA=; b=tniQRs/1zZcimDwkanYxB70Ppk
	0r9uZNIVNxBYHBSEAt2Lu+ZBIQBMVIbbJLmX6tZXbS3rrPSaKTEvu9EEGA7f/7KockfHiiDa8AxjM
	qxGWDMlFsBM+zzSANzqH5+CzjYs9fqNnKsR+PcOpBKu0ztMueMkcYv97OmPdal7wZlPUO1Dronr+R
	ehOHPUykSV7yr0kkutQjr6UK9FsPxzTwCI2m8u2Gam23pjIWSzI01Li0H+kguUwaykqcPFcYv8RUc
	g1zDmvoPaiTbPFzBwK7fd1XwcJgwKoofkkHPBOerSZyluAF7CCGbAV7IFZXmJYRC+778u5W3glhp4
	ljQp+cqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6kNu-00000009gfH-1009;
	Sun, 29 Mar 2026 07:16:34 +0000
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6kNr-00000009ge4-1Eic
	for linux-arm-kernel@lists.infradead.org;
	Sun, 29 Mar 2026 07:16:33 +0000
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-56ccdd0044dso3282566e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Mar 2026 00:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774768590; x=1775373390; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1NxKiVQ1TIIQfXxJZ2jTSHxmlOFYe8yRaFFPpJwK6WA=;
        b=H1sBMoJ14s82NlMvMENNGVG9R4UcOoYVHZsJz/YLtFX4EQR5Qj4owySjmfJ6Z8WYir
         gQ0uKgpcr5HKIwse+tOUBEh7G8UX0l6OOngD18FE8SXUwYVjpqof9M6qcZ81SM2FuEGa
         M/Mxol4g96Cba/52cbL/IEPgeshDL5sFXtBjI0vHikLqqQ9slTJMgzXm8S2mT8We6U4z
         BNS35aash/dwMuxpvvrWlbraMl8+xTtYQPcr7OIlli495KT5Ut8XjMoCwyC8vyYl3GdZ
         v0C5YmgzW0/bUSnxkn3R6slSbmCYD27hVqTbUO4qzm2O1ndWXG3IMxkrB/U6NgrA0694
         SQog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774768590; x=1775373390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1NxKiVQ1TIIQfXxJZ2jTSHxmlOFYe8yRaFFPpJwK6WA=;
        b=H/BF2zGDUEiNSGud/+DVhkZ/7LuW7CXNrJ4WLFIr8tFSDIR76SrofiwzHsOKWX6AYG
         U5fL9dUB8X4xlK6q3aE7OVc6ajt+Yi7jNyFbDCSW/cuZY8UH1nRCXgxd3TF+nteeE17e
         +m8i7k4i44UrZCtws7w/C47KYIMpYVbuI4Bh24PCk0N6TL/V9u5+Wvtz3lqkJiBq+T1G
         T9dNvNyiHP8vDsKumOTptRnhfks+4r/3MElHCGNkwgGC2oTfYQCPDMgtn7LEHgSU/jr0
         ZZtMVZdJwz31KcfIq17KHI+jWd5BdMoYBT9rEfmk8jsmwvbHCmispJfh0+F90SfoxLcj
         7+LA==
X-Forwarded-Encrypted: i=1; AJvYcCV2jyzBA92ismmEP9+wotUKJe8qr11Oy+3TOXxWoT1AjuyjMpVeOKDIEf+jZQHNZUkdFoQN0EPK/W6MwFwIagcM@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/PcH642uR6GZ2dqpmdQhfVI+hQi5blVnFxYc080dFhaMqDlZt
	YkIcc42q3cy/N8CS1GlDVH/1kohHYrNWulEm4PGDNf7wqSBLJ7kwPTMS
X-Gm-Gg: ATEYQzxVBAOeje5NGlggeTu4TAf1KgdSJOgcXthxBvaY4aJLzWyc2ZBVd17SfZczraQ
	XJA28pdfb/D3RLJ7YfQxLjWA7h5jTTGNsVATuqquDKwBNBFf2lcctr9AsvLQH24nmMCyZjG0L0Z
	xNFWePHom71AsKYDCPzPzQGMgJSzAlL+va7NqlIkECRGepTvW9uHASConj5CuPN9CMDRohMyRSN
	C4jX2oXqAW+rOI5J0CPtvfjBZ1skfhYg8cl7CFIXgwujWqVaRq5bF4ydXyCYdfE7sOgx5/lqMZj
	qlYHxVRLTejc0oGraNZzNAHLiMCxmLQC3/SlmPjcpitaNb08GFyWPvYpUWQ7OGougLyhmZzmu/1
	exITLvlESv0G1AUn3cfmy29Syros2TR1Ogo5mxsYYioBr5kkWNEiP1tTxnxYyBu2DDEyf5fhRTh
	m6Vpc0aNONeMaBG0GeG1Op+1OD
X-Received: by 2002:a05:6102:f95:b0:600:d0f:bacf with SMTP id ada2fe7eead31-604e4d73ea0mr3937751137.11.1774768589747;
        Sun, 29 Mar 2026 00:16:29 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6df:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512a5afa9sm4390638137.6.2026.03.29.00.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 00:16:29 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH v2 0/4] staging: vc04_services: vchiq-mmal: fix multiple memory safety issues 
Date: Sun, 29 Mar 2026 01:15:38 -0600
Message-ID: <20260329071616.507876-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260329062229.493430-1-sebasjosue84@gmail.com>
References: <20260329062229.493430-1-sebasjosue84@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260329_001631_348612_E6B9556D 
X-CRM114-Status: UNSURE (   8.92  )
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

Changes since v1:
- Reframed patch 1 as hardening rather than security fix (Greg)
- Switched pr_err/pr_warn to ratelimited variants (Greg)
- Added Cc: stable to all patches (Greg)
- Note: dev_err() not used as this file has no struct device access

This series adds defensive bounds checks to the MMAL VCHIQ driver
which handles multimedia message passing between the ARM CPU and the
VideoCore GPU on all Raspberry Pi models.

Reported-by: Sebastián Alba Vives <sebasjosue84@gmail.com>


