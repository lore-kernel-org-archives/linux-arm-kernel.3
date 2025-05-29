Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE5FC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 17:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YVXYcQRv3WLSWQAfJBtkuGRCwO3gzeCu1+3GwyAE/8U=; b=DhpTHqXuaakDL07Uc8FAYyoT76
	704fHJNH11Xr1WZ6d78NOhQiPIUqxM0xaY7TSOaWfMnAFEtIt/yRgbZRzL55kf+hYNMxHzViTpIoa
	2q7pQQtMe+rWzsv/ChYwLDqMDCqLdGbeRZi2iCIRplKsJ40vvOgNuZISgwLzcmZDOoTuDu0zrkGeM
	A2bxD9TM+NI5XBy++0AEmGrbzB/kL+ArFyFtBVV+6DJSAS1ClNyjF2s4g8fv1mI8zWDNFfBtGNecz
	7h+zMmQp3iionksuYGQ6QQu9Sgon+ZVUAOo5BtmMZWU+NLK+mPdZogKuxNrZ62O62WGC4JtR/M5XZ
	1Pqd59ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKgko-0000000GFvp-2bC4;
	Thu, 29 May 2025 17:09:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKgif-0000000GFnO-0qr8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 17:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748538423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YVXYcQRv3WLSWQAfJBtkuGRCwO3gzeCu1+3GwyAE/8U=;
	b=jUohAsugpgKX6gXUjKHd0Culi5q4Rw1f0xHP7PXQrzlUDb0ku7VW9Qvtcc4oTBcn3pDc9V
	k2CKM6+ZyXgUj50ef1qP0tsbdbkvUtOwtPLjAWHLJc6/8HLNmqBuhaW9CkvO72eehbTTtd
	UkCzTmyYj3IfAHCvzCVOaoBlQ4NCcOU=
Received: from mail-il1-f198.google.com (mail-il1-f198.google.com
 [209.85.166.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-JvgRpIjwPSWASG0cvFyUlA-1; Thu, 29 May 2025 13:05:31 -0400
X-MC-Unique: JvgRpIjwPSWASG0cvFyUlA-1
X-Mimecast-MFC-AGG-ID: JvgRpIjwPSWASG0cvFyUlA_1748538330
Received: by mail-il1-f198.google.com with SMTP id e9e14a558f8ab-3dd77fda439so1101965ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 10:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748538330; x=1749143130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YVXYcQRv3WLSWQAfJBtkuGRCwO3gzeCu1+3GwyAE/8U=;
        b=Wa1mud0OLeYqNXysbU85LGyPY+CPsnFFmAtu+OmlUvT4JYnVw0yrUCqJn6zJzq/Uol
         BQ64uPk24iDCqTaMrS3wwGXmG2n/PJ8OVLfAou6KdhFZpaNeIqhfiam/P7glzI4/Ua1H
         sAp5SgBE+j/s9s6NgPGAbg5Wjonr8fTpvLuG9kCHu2YT7JP6T4a+kag7v6sErh/jkt/2
         I9/j5WTCr/3curFECXHjLAXdx6T1TFX3ibI9KQJ+uRKSS5OoYD5et9BG5jg2dypVXHFd
         QdaucngSZh91JnFiwDu+SCYn8nwUcHr72fIXzWDeYChK8wg4DzG4vJqRmyYxI/l/ZEvI
         taGw==
X-Forwarded-Encrypted: i=1; AJvYcCX7soqMAfzNQk+b8dX8zMZtkNdI2xhvTjbM3w0MqV4cyrRSBar6gkvBeezG+tbNxcOfPjijq3RjOnpMBb0SnUhM@lists.infradead.org
X-Gm-Message-State: AOJu0YzFVy21TjSJ/kZMOV32ZN36ii6cCWw2SXGCVdZyuLTgvtEk+Z+N
	BA5VZ14cTab5qtQ1PmZDtVbQoe9Aj0sJddoJHdaCrcGJFAu/Vf6JIC46ScneScpPueXfzUSsnEM
	RPHrpE9fwuhkS0DWLdOEJhyKRGFaKtAP7WRlczXgLOjHdVJy/kBCNCRoJ0a6KSAb1h6td6Vhrck
	6p
X-Gm-Gg: ASbGnctUPdNbng5TONgUiVYnQoFsntOClEsJFx95nO2IvOwNLHw0w8NjeuE8E1GY9kI
	vPqZ5KByOK+BZuNXIMn8yQZ0z9mBxccOY+mrJZnGlBpMtpIN1S0OfzkPrIbf45p9pmvLE4YfV8n
	CEPz5pg/WWGHcA0dTcMtR4V7AB+o02zUyXcu2BZHo7Xvah2nUW9JKd501U/ra1IpZM120fMIjFA
	RyfGHLJXuPOOKqc9xs2e6D9jgAbOZTiL8boJsqwD0gPeNI9ZioJH1mtXLf69MKzb9KUpGKMxyX0
	ja9VLo5IkS4U3Q0=
X-Received: by 2002:a05:6e02:2789:b0:3dc:7cd7:688 with SMTP id e9e14a558f8ab-3dd99bd0681mr1264925ab.1.1748538329896;
        Thu, 29 May 2025 10:05:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfF2IypLjTHDTvX90AOSKarc6ttkVaDkLoPGB0d3lYBRme4WFH0Ya+stqq3YBkEYUuHUQECg==
X-Received: by 2002:a05:6e02:2789:b0:3dc:7cd7:688 with SMTP id e9e14a558f8ab-3dd99bd0681mr1264795ab.1.1748538329510;
        Thu, 29 May 2025 10:05:29 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3dd935462c8sm3928805ab.36.2025.05.29.10.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 10:05:28 -0700 (PDT)
Date: Thu, 29 May 2025 11:05:26 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-s390@vger.kernel.org, x86@kernel.org, Ard Biesheuvel
 <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>, Linus Torvalds
 <torvalds@linux-foundation.org>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library
 instead of shash
Message-ID: <20250529110526.6d2959a9.alex.williamson@redhat.com>
In-Reply-To: <20250428170040.423825-9-ebiggers@kernel.org>
References: <20250428170040.423825-1-ebiggers@kernel.org>
	<20250428170040.423825-9-ebiggers@kernel.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zNTyqR4Foov0UxWWCSNFxoW1eAz67k8ABPEOkggGUd8_1748538330
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_100705_312931_57246420 
X-CRM114-Status: GOOD (  12.51  )
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

On Mon, 28 Apr 2025 10:00:33 -0700
Eric Biggers <ebiggers@kernel.org> wrote:

> From: Eric Biggers <ebiggers@google.com>
> 
> Instead of providing crypto_shash algorithms for the arch-optimized
> SHA-256 code, instead implement the SHA-256 library.  This is much
> simpler, it makes the SHA-256 library functions be arch-optimized, and
> it fixes the longstanding issue where the arch-optimized SHA-256 was
> disabled by default.  SHA-256 still remains available through
> crypto_shash, but individual architectures no longer need to handle it.

I can get to the following error after this patch, now merged as commit
b9eac03edcf8 ("crypto: s390/sha256 - implement library instead of shash"):

error: the following would cause module name conflict:
  crypto/sha256.ko
  arch/s390/lib/crypto/sha256.ko

Base config file is generated from:

$ CONFIG=$(mktemp)
$ cat << EOF > $CONFIG
CONFIG_MODULES=y
CONFIG_CRYPTO=y
CONFIG_CRYPTO_SHA256=m
EOF

Base config applied to allnoconfig:

$ KCONFIG_ALLCONFIG=$CONFIG make ARCH=s390 CROSS_COMPILE=s390x-linux-gnu- allnoconfig

Resulting in:

$ grep SHA256 .config
CONFIG_CRYPTO_SHA256=m
CONFIG_CRYPTO_LIB_SHA256=m
CONFIG_CRYPTO_ARCH_HAVE_LIB_SHA256=y
CONFIG_CRYPTO_LIB_SHA256_GENERIC=m
CONFIG_CRYPTO_SHA256_S390=m

Thanks,
Alex


