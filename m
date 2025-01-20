Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35017C02182
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 12:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fexiX3t4iLg5WJeHYZBOyI9XPTWA4aqxc31q4mlujto=; b=TSIKJ3Mub9o/6/GlIjubLwgHP+
	JVq/auRj59ZnmM2C+P0gqnFyE3Gszj690g33xmOofuwQv+YmdX1PYis//T1Sbx1Sxdgyp6YRWKOpz
	H6psIByUvuojbU1nb0FCi2ys+ynnUZbqg9SW5+++FGMt7FB4/uYXvwnsouSkWeiD6wdoQvQx5UvbM
	SzNj5GAzxHfHi8N/yuVc/IWZZeZ9qdRt8WCWPMvKqZrMuCcgLLNOSS7FKME5vjuz8a5CsDdK8gwEZ
	hU2ZCQqvSrzGOvQ8qyUYDszufQEDLgcRx12/hDaWaPrCh8fe+VAwLiPxQ/UZjYgxC6mzwXELvmw3h
	bsg4aorg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZqVm-00000005VRF-2UW8;
	Mon, 20 Jan 2025 12:04:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZqTx-00000005Uzk-0oGs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 12:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737374536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fexiX3t4iLg5WJeHYZBOyI9XPTWA4aqxc31q4mlujto=;
	b=Fu/8ZEZY02chzvE5Sxz1oUlADv5LPUExgcAP2CZV49scxgVmM0K7eXdhlMx8xpKgWRqv0n
	6CumzXjV7O/1Q+LV6Sf7SXbBmYo0tPl585Xnc3dC/nl3OJioav9hpBM16vDI2a4Z/E38v3
	cXg+ZtDgD05L2uXiGq054bNO4qI9FBw=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-351-5NhdREExOn-hjENCo4vE5Q-1; Mon, 20 Jan 2025 07:02:14 -0500
X-MC-Unique: 5NhdREExOn-hjENCo4vE5Q-1
X-Mimecast-MFC-AGG-ID: 5NhdREExOn-hjENCo4vE5Q
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2efa0eb9dacso8414606a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jan 2025 04:02:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737374534; x=1737979334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fexiX3t4iLg5WJeHYZBOyI9XPTWA4aqxc31q4mlujto=;
        b=qvHVIsfcLAZZmgFTXq4xL0Rr0DWVKkjy3jvUURTheAmoc+N+3gHI+Xr2uZcJ21VoB5
         N2ZbPzsoyJw4thw5H0z30uYRqmY6A0gUHM7vBsUuOiIZRtCvfy2kN5E+m470uosU8cY/
         /GMmyn8/EP8aG05g6od/uO4oXBX7AsnMHPcqi9msKhcSO8hxvrCKQrzPVystvWilHi87
         TBNBEPXj3klubXB9NoL5gQErZo8w1JIJcr5CMDblTB+KyZVvWQPlJRAm+RqsbRrTM+Xs
         ZdGZCGc+opqMJ3l3SikIOIBhtQl0Kb/efDRmej6Zt6UGMAEHY1dAI7ZzYAys0i8IKEil
         vV7w==
X-Forwarded-Encrypted: i=1; AJvYcCWxUrSvGcVPPsNvjLjZiy6NRGkDC8h3Hz5JEtjpgFKVNtaLY8MMMUfL3LfUibzCryhREB8+csnaVNKQrzIJexOG@lists.infradead.org
X-Gm-Message-State: AOJu0YyCpcmmSFMlHGITZF2DY+EwlfGfNmBNfChqQ5BN+y/Rt2bbL3Vx
	ewJ3GVRTKSdRfBnpzNYz5TrxfKOorUpg6ep+o79B75Z1dm/WTTJJWIvHjqX2XlpKKLoR8SlCa0T
	ql7H6TDyoCZXy326zCnGZD/FtCUmWBXoeSX7GgGAyIdpZuTMv4rIqZY1alruBI3GBw7StYZ8HjF
	9DiKL/Bu/LdY5EXibAVkFcPbdbpz1/m7lRRAHXYkCZQGFqm6Q=
X-Gm-Gg: ASbGncuExFW7BLLa6VkAVS28nGZD+/WO/3Zu6AjVgnR0yOdswiNaMcBIokGePAQUfUc
	BtVk2l+XuYWsEHzXJlCrOngqU/g9M92czf2a0S5lpdgRWRsr2Zxom
X-Received: by 2002:a17:90b:2803:b0:2ee:ad18:b30d with SMTP id 98e67ed59e1d1-2f782c4bd4dmr16496016a91.6.1737374533815;
        Mon, 20 Jan 2025 04:02:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHOCF0Lznp77ArLmeUPdmlx9sZZQ0u9IJTB8m9AZJMkb86ZWhU7cWNeBlgeTiJ+ImUI9S/aJk3IrYNM5QQgQRw=
X-Received: by 2002:a17:90b:2803:b0:2ee:ad18:b30d with SMTP id
 98e67ed59e1d1-2f782c4bd4dmr16495993a91.6.1737374533558; Mon, 20 Jan 2025
 04:02:13 -0800 (PST)
MIME-Version: 1.0
References: <20250117115208.1616503-1-maz@kernel.org>
In-Reply-To: <20250117115208.1616503-1-maz@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 20 Jan 2025 13:02:00 +0100
X-Gm-Features: AbW1kvav04dHAd6EFLXeH44giVkOFuZp7i48ZD-kxEE0FGoV-Ua3PABvmPT0ddY
Message-ID: <CABgObfYckN2J_Q3d--ZfAP=QbtGWp-teOpXGPfubU=BN4DSrgw@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/arm64 updates for 6.14
To: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Chase Conklin <chase.conklin@arm.com>, Christoffer Dall <christoffer.dall@arm.com>, 
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Fuad Tabba <tabba@google.com>, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, 
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>, 
	James Clark <james.clark@linaro.org>, Joey Gouly <Joey.Gouly@arm.com>, 
	Kalesh Singh <kaleshsingh@google.com>, Mark Brown <broonie@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mostafa Saleh <smostafa@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Quentin Perret <qperret@google.com>, 
	Rob Herring <robh@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Vincent Donnefort <vdonnefort@google.com>, Vladimir Murzin <vladimir.murzin@arm.com>, 
	Will Deacon <will@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LKgYESKm2ATg0dfzzYdOB0L81ph8Y8QBgRlNSotzzOU_1737374534
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_040217_301444_33EA72A0 
X-CRM114-Status: GOOD (  14.72  )
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

On Fri, Jan 17, 2025 at 12:52=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrot=
e:
>
> Paolo,
>
> Here's the initial set of KVM/arm64 changes for 6.14. The bulk of the
> changes are around debug and protect mode, both of which are being
> radically cleaned up. On the feature side, we gain support for
> non-protected guests in protected mode, EL2 timer support, and some
> better CoreSight support.
>
> The rest is the usual mix of cleanups and bug fixes. Note that this
> drags two other branches:
>
> - arm64's for-next/cpufeature to resolve conflicts that were not
>   trivial to resolve
>
> - kvmarm-fixes-6.13-3 which was only merged in 6.13-rc7, while this
>   branch is firmly based on -rc3, and we had some dependencies with
>   it.
>
> As usual, gory details in the tag below.

Pulled, thanks.

Paolo


