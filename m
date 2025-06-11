Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A559C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 22:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1MF1dHTik4WYDT1dqFKnZOlAFt0Xaso+/EljV+ZdGk8=; b=SqIGx4+wevwot9IUT+GtbHwvtn
	3gxCph4l9bUUDJBOZhAJ9spJ2ovfuWJuZ4PrNfzQ2gV4pipq1y0rpLrLiHVqycmXqVm5OWFMXbje4
	yD5qT1AhSfVBjdwMrxELrETb3zCgUHOUqC15hXcH4EtwaF6VBL/wKP+vyYCXd3Gz+nHpZjzppe6NP
	J9plHyvVyxQ4nlIXNpUFa85L5nob+SUt5Q+i0WrqtgszbTxTUCvFFeSX4x0QEHFgAEeLuMiEQdF5S
	NCrMfqwVMXHyaDYMF+Sj3vWjhFcjxLqX4gJQHYDF7ACfT1WbWFBjfvrVp+CSvSBPKmkubbcaciKUr
	W8Fjaycw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPU6D-0000000BUrq-1hNE;
	Wed, 11 Jun 2025 22:39:13 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPQmx-0000000AwHH-19B9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 19:07:08 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e81826d5b72so134670276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Jun 2025 12:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749668826; x=1750273626; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1MF1dHTik4WYDT1dqFKnZOlAFt0Xaso+/EljV+ZdGk8=;
        b=iyJqXVjLBaJ2gIVj0nxDEnJOx+i8QxH4GDMZCQ8VOwQUrwgN9JHcIzLVokhdKCp9+z
         BCAepmBiVuVW4v2yd+YRLraGxXO4dKtFoNSr+F4uooMa6eo+WNjKPdaOlR7M9/hVGLGW
         mmPSig0U3j7D2md6a+mJbhGV2IMbIWNJL5+TB0hq5MJNhk4YsbquFIeYvlIbA35znwPF
         qv/M+ByJ57u2ia8i0tUNfM4PhFqQC0F70MPNcaCmPPE24EifAcBA9niTHtvSzzx6Xqbr
         MDJY+RZI7J/IHxLwLT2cNLY+MfpHlKzJVjj1RW+r/GaQp+y3AH4KISavoiYjVJ6LzIvt
         sULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749668826; x=1750273626;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1MF1dHTik4WYDT1dqFKnZOlAFt0Xaso+/EljV+ZdGk8=;
        b=ABXN64CuJHcdo0YKjNKB+AzlWW62MhK/usgYLOpqmQUlf9fGkvRe5rJVjs2klmO37Q
         gfFMuXMCFenTdSAD2EkCrTbssEvy/nywqwFco+cqJNdaKgRBr7VCk6B8eC6OcFZB24lc
         ygZVv+E1n8e0h+OIL+K70lk4/rxxmWQLUma/43GISmZ5u2xSlZ4aQRHyr117hwMYKDiW
         jEZwTdTdCl0IjHVu4HsTLZ0azUEqb0BlWNgMw2n01uSbWZ+jcK1LGh6+pb6cKsd6JRt9
         HyonRUeOt5EE39sdU613dZMtl2cL/k/y5JhRJyZdzxVYvFAl1FXMm2SV8YE6Zdo71B0J
         lIvQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5mK2zVgGzEa527eFNdO4Cmxz7qSeJ+OnCOMukPtpMej/Mk9w116M/vaAUC28pyPOJRRl5V5pDHDnmrqCWc0Ax@lists.infradead.org
X-Gm-Message-State: AOJu0YxzQ5AqVqZjPyOon9McPCQpe6sd2cCZp3uQjCxGxgdaHLaNOZhh
	5uoLhZnG7lCVX0zJNpPJkWzIFoonicKfBGJ4lqech951FPqDFmBo7xa1SHIHA+vTxd3BiUoBhXB
	1ln9fqCA/9Dk497S6quh8ToEfMHl/Q4A=
X-Gm-Gg: ASbGnctEE5e90mHaVmFgdJvJNK01wJN2PGS7NJ98HWP8Tb+Pwth461vx9GTmaF3IT0i
	qxzOLSrbjIch1u+kZKjFAfycm0AUsvDCIjoY/eGA+Rh8FfrzJWQJR4L5mH7twnnHbJa1FG3Ji7F
	MhGpuxB7yDJHq+rqBzSJXBpNwSNTifqMPm+YhjfFQX9CKl9z5lIMn76gQ=
X-Google-Smtp-Source: AGHT+IFsZ3UIOk9VseJbWKxt8KvtKbfGOyN+aFYnhFj7EA+lzwyye2nE75imMRB1Spn6prKv90Mi/kjbFVIWTts4th0=
X-Received: by 2002:a05:6902:250b:b0:e81:99cd:9be with SMTP id
 3f1490d57ef6-e820b64d1a3mr1175425276.14.1749668826227; Wed, 11 Jun 2025
 12:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250611-sgx-dt-v1-0-7a11f3885c60@gmail.com> <20250611-sgx-dt-v1-1-7a11f3885c60@gmail.com>
 <edf14a64-decc-4392-a038-08b5dd942f8d@kernel.org>
In-Reply-To: <edf14a64-decc-4392-a038-08b5dd942f8d@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 11 Jun 2025 21:06:55 +0200
X-Gm-Features: AX0GCFvMeV5Ol-Irt1s6ubsKN_ZZGACBjoQJdDOoAp2hIzH0XLvrHdYRqZQPnT0
Message-ID: <CAMT+MTRYybR=tFJrcUn43UK3iW-fqEH3rmCLUezq2eTrEK=nQw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: Add Apple SoC GPU
To: Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Simona Vetter <simona@ffwll.ch>, 
	David Airlie <airlied@gmail.com>, Neal Gompa <neal@gompa.dev>, Maxime Ripard <mripard@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_120707_308865_6A16B039 
X-CRM114-Status: GOOD (  12.17  )
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

On Wed, 11 Jun 2025 at 20:44, Sven Peter <sven@kernel.org> wrote:
> > +      - description: Driver-opaque calibration blob
> > +      - description: Calibration blob
>
> Like Alyssa mentioned, this description also raises more questions than
> it answers for me. Do we know what these two blobs contain or why they
> are two separate blobs?

At some point in the gpu initialization process we give the firmware a bag
of pointers to various stuff it needs. HwCalA and HwCalB are separate
pointers, and they use separate gpu allocations. We do not fully know
what is in there, but we know what some of the fields do and how to
create the blobs based on data from apple device tree.

