Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E51E6BF39
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 20:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PNSw+Lr6oCjiEm0w8JQ15Otbu/5SwQUBiwMB+Of3T0o=; b=SuyKzFYirCChfyXzt8FIQ82Tsk
	hoe1Mat3sTh9dvWYy7QsVi6oYcNmPj7BiJtRqSnOlJXgp72/rK622nEH4phDUr6/m5f8p/KuouTt8
	ymsSDlt8NBPdlGHhlv96d78Mzv9Npz/B/hjFqGxygd5cXUSd+cxB/WWVmCbwzk8Ip6ojhILA5+0zy
	CZ16m6RUPhLcGXJy9uuIOcA5Gi1DDEplHeoB75QcDg/LxacbHqbD/Exuc71FdeOtY54v9SnzOwHAR
	nwtKlxA9QW6kijwmF505qNMn6s/RPE/JMo7Ra+JcYQrIV3CuBtH/RUtiZmSk0VkpXOg4YNEuVKdki
	dKVbNWfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvQA-00000001xPE-4Avn;
	Fri, 30 Jan 2026 20:48:50 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvQ8-00000001xOJ-14Me
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 20:48:49 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2b703e04984so141263eec.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 12:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769806127; x=1770410927; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PNSw+Lr6oCjiEm0w8JQ15Otbu/5SwQUBiwMB+Of3T0o=;
        b=Pe5j5NZ/OAcjCd4EX5bydouxxP6Vp+sMXXey1F2R2OTRPcBDxNUZxnUMYjZvlQ8E59
         /MOvcqLhIoxEajRbE78/1jPVv51YK8xR9dMjSrW+o2tmNa1rdrbqXyLaPTxInPDKQ1wO
         xr5ntTVCUReq0njJlixHCT5K1KHH6xFdvnMcTQUvkuVyXukygJTW3aPF0OT8nt1+B4L9
         2HDMjHbWITMVeLTgc05SApPbo0cQbx2Ep+QZNSmlgmOkNnyXZ/V7NbXdPOupCrJBJoLO
         bKKVNxdLcyml+fsg3u0OFKxb+qdRJKNbI3E5ThTzryriMRBvs+OfApp3ELPsUKgTqIrq
         uDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769806127; x=1770410927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PNSw+Lr6oCjiEm0w8JQ15Otbu/5SwQUBiwMB+Of3T0o=;
        b=DdigOgqCuQwwPeZQmZFcEE6mlKjnwL2NPVMVpgNbIvthCB4gdXyKfu954j2E843HLd
         6W5zdUY/tkxPiTW8wNqMpyPILerY9BvyoiZOWjvJLncfvUgK/CMe+jh+zCKJAVkJgcoL
         4iHUQ+e4rBiNmiKSRgulMTdjSTmvij1Ogn2sm2STJWfIJ7hR9Tzeni6z6wUXae4A9OAv
         Woml26QU9Ww720F65pOgSp/uBHDdPbuXYzTnE/Ht/+pCPuDWqomKHWQSDEJUcx0x9YoA
         YLpdgmvVZ9ET3b8TsHUHg7cHLGhaRYMzB3S6JFUv2BVTasFu1CEmssxX8ZupikZKB/SQ
         IufA==
X-Forwarded-Encrypted: i=1; AJvYcCXwftRLEOoWF3/qC69n/7gQOjrigmtbN5v2Ro59R3ModaDrR2mtC1eHgnuOMxJQ4gZpPyJJD5lmWlnr2tzP7FZL@lists.infradead.org
X-Gm-Message-State: AOJu0YxD6MIrhdFJnfVOj+VCwPr8ra86q1NR9oby/ZI7xmn5brzBDE/3
	7KfF9izhJfTBuHDOaiUVJxbhrpKxGcC8px64lZKihnQmjZjokS8vRieI
X-Gm-Gg: AZuq6aIcX0abSnMvp61ByinjXGDn/2gNdnUa3cgbuj7PxBDtYGuk0M3Buh1sLmVD+zQ
	daCX8PcWhunvTc44L0HbqIj7yvOYzLTulNAuZ2gp6D49toNGT/C5lQTFonEptHqH96gvxKEIr1k
	Xj31AbFa8L6wosuEZS4ukSjlsM/HHIt3ZRDQlBgpr/s9XcCpMu6qoB3IHlmJcTM5lhoGZ8TQl+2
	b3i/A4K+kQUCap5N2dsfaEPWS4hG/ADEvFQ542F/LGyvvmzDN9TfpfXO6YXWclCI3ayHZk1HN56
	PeJjR4y4YInaIvw16Cij1eSQzTJwuzWHLMQy4EhjUkh9PJl1I7oIdMf2v9RsFAJQvqElAh9EoUW
	hMWy1+jOj/FGoagBcs819cM1mGG8nRZcj4W9Y8mzpM/bkmRB1rPhJSYRWPmeJjXVwpyvQcFHa/l
	bCSCkr
X-Received: by 2002:a05:7022:e98d:b0:11b:1c6d:98ed with SMTP id a92af1059eb24-125c0fa8f87mr1183669c88.2.1769806126977;
        Fri, 30 Jan 2026 12:48:46 -0800 (PST)
Received: from localhost ([2802:8012:29:1100:899:eb0:bfbe:884f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9de948esm12981470c88.9.2026.01.30.12.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 12:48:46 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: kernel-list@raspberrypi.com,
	mchehab@kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	linux-media@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: gascoar@gmail.com
Subject: [PATCH 0/2] media: bcm2835-unicam: remove mentions to dropped driver
Date: Fri, 30 Jan 2026 17:45:39 -0300
Message-ID: <20260130204628.312246-1-gascoar@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_124848_285361_E3D0EC02 
X-CRM114-Status: UNSURE (   8.94  )
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

The driver bcm2835-camera was dropped in commit <90204a38a760>, but it is still
mentioned as a current driver in a comment and in Kconfig help text in
bcm2835-unicam driver.

Remove these two references to the dropped driver.

Gaston Gonzalez (2):
  media: bcm2835-unicam: remove obsolete comment
  media: bcm2835-unicam: remove reference to dropped driver in Kconfig

 drivers/media/platform/broadcom/Kconfig          | 5 -----
 drivers/media/platform/broadcom/bcm2835-unicam.c | 4 ----
 2 files changed, 9 deletions(-)

-- 
2.52.0


