Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1ED6C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 16:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWoZ7J24SqGNnWzhgAOt78qtKw6volo/ygjmTz+Hx00=; b=QmLuEDopmMEJorpWWyNOkwZg5p
	XlYLbcdOfyP4VgtkWiZc/R2Fj4JRBSPjXA2bjYl3qPjogB6VVeGLZLynTSFtvIt7+5cLE6oTHyAxU
	xrNAGI+VpoDJ9vRa9jYZOh1gHUDPrL1Ka5zy1YByBR1fKjWef/1803w7LCTpyUQ43Gjh3mT9voU3b
	4JkGhQQRzwbFy7e7SozVkSVJdnqGdkWOQbgrYjYTIvEfJVCtLXXhv8fDGwBtiBulNM/rp5l9ZfQ9h
	Au+pPFGuglyRDt0pm4qN3snpAP9Ep89ECYo1+CRhvYXp2N7vJ4Vxs8Pz0Tbv7B5Oc0ImhH3dVLSr7
	rNR4zApw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg4Xw-00000006ows-2Dsx;
	Thu, 06 Feb 2025 16:16:08 +0000
Received: from mail-qv1-xf2e.google.com ([2607:f8b0:4864:20::f2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg49g-00000006lMV-2E5e
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 15:51:05 +0000
Received: by mail-qv1-xf2e.google.com with SMTP id 6a1803df08f44-6e435639b59so7371076d6.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 07:51:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738857063; x=1739461863; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWoZ7J24SqGNnWzhgAOt78qtKw6volo/ygjmTz+Hx00=;
        b=zqFePgQjQ+wcgVRwshcdmw1DsLgXQNcE09xXFiHm/Lpej0+9+x6seWV550aUQhI7jD
         +fT7RAGdATcXQN9ahIr43+qNciNMwgULjC1oFzN5s1ZH35D08uAgstz+kujmoG0Mjvbi
         Th5cR19pj6gRgSSnc7m9qu95SrwFuqA94MXvop8h7RWz8iA3D1mh6AeMymhThLnQ8k/i
         Uw17eWasnz+SX4f772aeKSVmWRbVDAY9JxVMap3X6kzUjgHr/8GVVfMYCOqpxSA0cZ/F
         HmhrPuaOUdtufV/AGi2pB+wk0e3XcBJ+IFci1oGuL71+ikFHBBbSXXVv/iSLIBUItj3V
         dd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738857063; x=1739461863;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QWoZ7J24SqGNnWzhgAOt78qtKw6volo/ygjmTz+Hx00=;
        b=KIDfTXwLVP9zeyU5j7YIXdl+lH8tDI/zpSgAdqNfDnXu9Om7TiJBj0D9xNUWfn/Q8h
         Uypv88G71cehphM28PA1ir3SMwnEeSF7AXE0ABW8Dac7TycHFB2Gs5s9iGxAJ5VU74nl
         f6Ro2VIHaY1Q/19PBHxRloOV/vR9WW/xtfM9T2i2ZM+rEatbw+s6NXycTMzCx1N3+Ibc
         Uzcqw8kmLFwb1xFLnn1DpI2WQZXbLvqZNSjCRgBXknn15TmgMi5G9CTFHpG0Rny2vtfa
         F1fwDO3IyqfTlrKOjHVkAlRKMbH0TOJAKOXGuGz7Z0P9vjQKRBUXlB0Ub8ao19yqFoEm
         E46w==
X-Forwarded-Encrypted: i=1; AJvYcCXY+CZJ8xs+OgJuIe9e96kUiYNLNvQrqfyOE9R27YbUdMt4ReHO/xfG6i5BkY6dynTvMzf7gM2wGxD0SU/7I26N@lists.infradead.org
X-Gm-Message-State: AOJu0YwKET0BEVkskkEFIrctj6V5Ykkyv9N9mSrDVGAWPuCka7K31kje
	wEu/RytvKJ/cdOprc/pQ7vA4g9GCv7hbg9XAA32LI81oB4DEBZju5aLHYaPhVppcHteEGn3ukq5
	iunB0nPFhKqkyDZOQJnAS9w6ESysF014zLxCB
X-Gm-Gg: ASbGnctWr3m2BEErlup/cbS/1MfiuYeEvhVR1kskWRPqOFmQRDr1Rx7QZTYBFIOgVoC
	Izz2komp0c8kFzYNqr9+PcHj1rrI6mW+JpPawFBQHl4w+QTLYdqPHVRVtRNP92XFsX0CT6MR5dx
	8XhVeY86sO9IPfr3ycUZIcHta0dyc=
X-Google-Smtp-Source: AGHT+IFvk3+K1/NeNAHDQ1axJFgyu9yz47vrA6lu8lKIFboVQOfS99VlvomibC8PJu8UYjYziL7fvrE5epYqdVs4Qgc=
X-Received: by 2002:a05:6214:20c6:b0:6e1:6e74:7ad3 with SMTP id
 6a1803df08f44-6e42fc02175mr121361066d6.22.1738857063267; Thu, 06 Feb 2025
 07:51:03 -0800 (PST)
MIME-Version: 1.0
References: <20250206152100.1107909-1-maz@kernel.org> <20250206152100.1107909-3-maz@kernel.org>
In-Reply-To: <20250206152100.1107909-3-maz@kernel.org>
From: Alexander Potapenko <glider@google.com>
Date: Thu, 6 Feb 2025 16:50:26 +0100
X-Gm-Features: AWEUYZmPwfuXexC1RdrgqtrawDuVUJMO3ua_5KrkCM8FmA_6qe8hyqKXHCquBps
Message-ID: <CAG_fn=UFvUnFmPcvkX3vdOEtNjPgVzJZa7mgD-XXVhGDGD7aGg@mail.gmail.com>
Subject: Re: [PATCH 2/3] KVM: arm64: vgic: Check for unallocated PPI/SPI arrays
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_075104_567130_B85F74C9 
X-CRM114-Status: UNSURE (   9.17  )
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

On Thu, Feb 6, 2025 at 4:21=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote:
>
> Alexander's fuzzing has exhibited a large variety of races that
> all end-up with taking the address of a PPI or SPI structure while
> the vgic was torn down (because nuking it is only an ioctl() away,
> and syzkaller is amazing at finding holes).
>
> In order to preserve some sanity, always evaluate whether the array
> containing the PPI/SPI is allocated.
>
> Suggested-by: Alexander Potapenko <glider@google.com>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
Tested-by: Alexander Potapenko <glider@google.com>

