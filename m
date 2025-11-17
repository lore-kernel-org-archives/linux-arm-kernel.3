Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71150CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 16:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mcDSXa6wO0VwMtbrXwflFakufSl+A3K9Sb6+lWFUaj4=; b=zEM3bRrpBsa+XFzMIvDQSwNkUC
	18hcuNgE3NXrfkrSz2nhgG9d9N5OpnlymqGzkReuznKXh41ftBRSfM46Dk2Ce4Q5DPyN2ksS3h4Vq
	JHvdfsHgCRN3fX2812YZKo/Wh1SNIsyuALXtS5wkBbTwEOyt5+0ci8Ig8v4iJyxy+Vkt2G7Qf3VZl
	CUoSt+iLfmTeLRQIZ5lIF4MY55FSs4N14EDTwobjWDSNONXVT7ErgNmrnS4eZ/Ftf4ZHjowp7fHb9
	kFfB2grkcBHKRfxz3FhxsT7f3dT8rFN5IVaDZZ1qfmhHoAAv8leJ2iWbrLrJa/J1m2iV4HVvvJZlv
	Waf+rZxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2CZ-0000000GPLU-2epb;
	Mon, 17 Nov 2025 16:35:39 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2CX-0000000GPKn-3VtJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 16:35:39 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-42b3c965cc4so2308393f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 08:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1763397336; x=1764002136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mcDSXa6wO0VwMtbrXwflFakufSl+A3K9Sb6+lWFUaj4=;
        b=EaDs9LX+1ZQDvd1XnN4DfhjoLZlhyzul2bO9FvRJnrUkqSC8MsEqgUot+kRnfF2E6p
         V/SPNswH9UowWo5HX39ZndMLYjMVi3aPA1OlRbTJTg2qUwLsy+nxhOQ3XWkMpKgOvE2F
         7vatII+jWfVg1eslOzBIpnyb24wE2p76/8v6gXjDPWDZOU8rXZWhIktR/XcNAV9J0sxe
         G8eXeOFSIDP1JTGXCF1FAKlm3tDI1FphfeNNlLiLEr+MoH098+mXde7VDFRMqkHhyIpY
         fFbS4kMuEu76MNyHW/smpo4Q4KCT2dZ7BnIiQhr8xX9p/5pI2wwsO+tl9RqnYS8mCmd/
         v5Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763397336; x=1764002136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mcDSXa6wO0VwMtbrXwflFakufSl+A3K9Sb6+lWFUaj4=;
        b=u1co6NqAAbg5U7FMs1eh1FoJdALDNFDG2gmlhCav+8ApjleQUClMufHcaZGCfvWOaF
         w/M05pc2L098mmX7fo/TWEi5li05PrIYbUiBtWQXaam9wjvJwyDLxUI3/ISanFupW653
         YNagHw7JjfIx7lLZDwAZ0xJeJlpd+u0Qpm4+TUW1IDGyw6ZYOzJzZu1ZFowX/ykUORUq
         0e1AZ/xAJCluKfosRZw7q23Rj8VRUm1wcKK21blO5bXJ/v1saAGdcPvtAlOyJZ+thTXH
         s4Tk/utNI7SfJhI24L6xn4tpVGbB60y5RjYRu8mt699/m6wL2usWYQy3nrvObg0wstiQ
         uHeA==
X-Forwarded-Encrypted: i=1; AJvYcCUeICgVoZ00ZP1avKJkUvu6lAhA8tgWgWxLw/O8VDG6p9FN8DqPAWHFLIHQHCYG17Ueq2/xG0hlrgsPxzlmB0Fw@lists.infradead.org
X-Gm-Message-State: AOJu0YxvEtqPue7UpB8JNLti/2ebrSsKWodhYB7A9nA+L+xz3ZKZ8L7M
	L6SELAPNUGKdieI5ibVdk2Oel9kWtZLtwbc4sW4ruTvTbqfN9WVvk9xftwb+mPCwdU8=
X-Gm-Gg: ASbGncs5/Mt0yfs7NDxutGSvuWLVIQlYQCVGZW/cE2qmcmL4Mh9iIcQK4PlK5OfU5i0
	P+Bdu1NXIa11LxXpo1UPQNKqfLKnGv9inIbiBiB6RaxWqaRWyRyxVxH01YZ2DPPkntfZup0hNjY
	h+5ficcN5IEFxKEaqwEy4rc11Xdk+aQrIR7gclwl3l68StbP8lb0bU8Ah7WjtnMIC/v6laE1CIM
	l5FZdIuXQWg/bSdCpcMoM3jkMjg5AeGLMHgJ8PrcPrHqZZTNeN3r5X5meXvDrFm9E54hkvHQire
	vmb9lJn2MQJtO6UwVHCZM+FkFx32q07IwIXlH7j6WT9JpECm2dQGoMKZE0yvuAtOmVFqBU8QV8W
	Npa2aiwRBTRu8Z+YypOAmQurSR/cZesZPpz7eUYB+jIxL+p9hA/Vks9hrV+cE8SZksJHWDloboS
	a+Yixe7wen3pr+YjGRK2Pa2mwUQ0B4SQ==
X-Google-Smtp-Source: AGHT+IF5T7Au6ooMk3nR9R2A+BmiQ8HwY2tnu+X67pk/ismWsgHxgTwDEBSxjBtKs4VbUsEg1VDXqg==
X-Received: by 2002:a05:6000:26d1:b0:42b:2a41:f20 with SMTP id ffacd0b85a97d-42b58db7a16mr12599558f8f.18.1763397335690;
        Mon, 17 Nov 2025 08:35:35 -0800 (PST)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f1fd50sm26904384f8f.38.2025.11.17.08.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 08:35:35 -0800 (PST)
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: soc@kernel.org,
	arm@kernel.org
Cc: nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Microchip AT91 defconfig updates for v6.19
Date: Mon, 17 Nov 2025 18:35:32 +0200
Message-ID: <20251117163533.209608-1-claudiu.beznea@tuxon.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_083537_984728_29C96B46 
X-CRM114-Status: UNSURE (   7.85  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux.git tags/at91-defconfig-6.19

for you to fetch changes up to c1c654b5daceea6143a31292ec0e4f53cac2083d:

  ARM: at91: at91_dt_defconfig: set MMC_SPI to module (2025-11-08 11:06:23 +0200)

----------------------------------------------------------------
Microchip AT91 defconfig updates for v6.19

This update includes:
- CONFIG_MMC_SPI is set to module for at91_dt_defconfig

----------------------------------------------------------------
Manikandan Muralidharan (1):
      ARM: at91: at91_dt_defconfig: set MMC_SPI to module

 arch/arm/configs/at91_dt_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

