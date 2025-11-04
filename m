Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324DBCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 15:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21lGBZHN6RDH3gDJV/VR93+uRMqtY4vgBTT2MKuRSr8=; b=ZJCdSwCeV/oVSuUA1lJrzgjgBR
	XTFdCrkzZMHQamK91MpOYFySa7EGfDgXh6ZHuG7f4I07PKgfEncHDVcKgTJAP16bgcw/J/HXT3i8b
	aXyWzOSZ7nk1c9oYZDaBfVUlAT5VMsgp02p0NeDk+W9qDy9CQjYE3zB337UOjALAgeegMccvVzmlk
	0CeTReSZQPv9P5SnlMgmb4DDzkTN2VPpJBDn+Puzs0fSMyLIsK7ZlQX14dCWtRd+YKvonfyK19TpN
	RuonO+DEyHb28dlw0fmBnQ1VR1kD66z7UeNd4ehIRcS7v6j5P3qTgme10uUX/lo5EBtDvixfFY9OA
	79ri/tKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJ0X-0000000C688-3wQS;
	Tue, 04 Nov 2025 15:31:41 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGJ0V-0000000C67T-3cWT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 15:31:40 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4ed0c8e4dbcso377131cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 07:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762270299; x=1762875099; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=21lGBZHN6RDH3gDJV/VR93+uRMqtY4vgBTT2MKuRSr8=;
        b=XKSqZjGl9yUfLxtzl3ZXgwRNKoO2Pp+VLRNjsU0tiTpRR6NW1BY+XDEKs0Esqux8au
         u4DzZPgDG/X+l0BuSO9V6mp0LNE4TsM3WNXbwpFV9QSPjbdfX3Khu+RyZehe1VxzgFes
         9wtvxkkf/gtMzgZ9OVb8U4eNvuQUKYf98b4r2sc6/Wk0Dn8eKEKjaX4CO6+5yFqJmDTz
         z+s2pf6QmNFuQyzHtR+UWPJCsIxTV6BjXRuNTn1+Oza0XxueajU/11ltU4a3RcsQgXqH
         qKc0KQuumc0wO7A2zXrZQ0rc27Kl4zrNxICO7swfagn851uzmCsAwkRNmUXXUjSUIc9h
         xBEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762270299; x=1762875099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=21lGBZHN6RDH3gDJV/VR93+uRMqtY4vgBTT2MKuRSr8=;
        b=XiFFPKV/U1JR62tj/4TSjyToNd4D8Avd6YJT37SsWYYJVtch9A+lVHhYmuS/7Vk9n7
         0OAvPPGgI+X3gDv+wotW1i11rLWKSziC6+UwlZS+AXddukuenGZyQOKApHohQ2tETDJj
         FicjCMMin03m+O9wmOFrRsGM+rZUBFzjv6yGhwReydxuGdxrozBjMMnvraXiXYVE6Nwr
         /xRtC2ig3XbeUgJQUwyCX0utsdFwjD2Sh/nZ4qcH12tD1MJ33zkw0odYKeJ2zPnUwBxb
         iPg/z8MzictchcfdqauRW8KqaAjvQhKLZKX+C5UpPA+e77rPum1X4kDAeoVE9My6/Rbp
         1tmA==
X-Forwarded-Encrypted: i=1; AJvYcCWlvTaMdtCTDMlEBdChKgO32+Rtw+115IEq9YVFBCJT4iWzcnbMoC/5cecqS5l16XJOylds1JyN/5tBRGk8qAmH@lists.infradead.org
X-Gm-Message-State: AOJu0Yzd9iKHXssTyr/Anf0dWBlG0wURYbBOuWUWoieDYFsr/ZtgG0wt
	Ipwk0KBW2z44eRPwEqQ//Koim8R7aIpb9e1rKMaHL1f/bJ0/BbeRGgXSg76gqy6zkdrxLSGHLjx
	kQUMvmNjPXsOpUxJH2mnjVTyvXh6B4uuWKlCswFyQ
X-Gm-Gg: ASbGncsVl93HkmTs34Ohd6uCeEmX06V5jtOh7H7tMKtP011KctD6uHd08sbAgdGcZec
	DuP5yqGXZPcieDOjuiJ7feBIJbKLbY9C8U01R6CtmlWozyYHFLAgyRCj+cb8rVcObte94du0YM/
	fdNJwUa7LqNzPQAmRjZ++UlSs0BPjlopF84zkVuFCubffKNfuX3KzA332X7RVRapW4hjeHJHAPa
	wAUd5d+m5q9L8MSe9jZZarbO3X8fdVDL3FtmYgcD4RSRsnIq6MP8J0AItdcCbE4EuRtrlO1uCoh
	nroVBy7wUvlzmO7H4yFzmS60
X-Google-Smtp-Source: AGHT+IGKUuRG3ZTQJQjA7fDbzPjiK8c0XLTuIcGAohK8BXI9QMN8hTTl8zf+znwMZHD4+Rf7gf9pYImYFgIOVtGiADE=
X-Received: by 2002:a05:622a:1794:b0:4b7:9a9e:833f with SMTP id
 d75a77b69052e-4ed6384651fmr5720961cf.7.1762270298370; Tue, 04 Nov 2025
 07:31:38 -0800 (PST)
MIME-Version: 1.0
References: <20251104125906.1919426-1-tabba@google.com> <20251104125906.1919426-4-tabba@google.com>
 <86fratvmy6.wl-maz@kernel.org>
In-Reply-To: <86fratvmy6.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 4 Nov 2025 15:31:02 +0000
X-Gm-Features: AWmQ_bmmcY2AsnQ7Tf1DOOd59RP8aCPwMHtrKQbQXLvPulNWGjrihLSXD_qNPF8
Message-ID: <CA+EHjTxTBxR6VN_JtA-ga6QrZ-FL=AKyLTDr9vWSqfkdwjz9-Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/8] KVM: arm64: Enable LS64 instructions when
 supported by guest
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_073139_904150_24EAF9B2 
X-CRM114-Status: GOOD (  18.53  )
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

On Tue, 4 Nov 2025 at 15:26, Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 04 Nov 2025 12:59:01 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > The FEAT_LS64* family (FEAT_LS64, FEAT_LS64_V, FEAT_LS64_ACCDATA)
> > enables support for LD64B, ST64B, and their variants. If a guest is
> > advertised these features, KVM should not trap accesses to these
> > instructions to EL2.
> >
> > This is controlled by the HCRX_EL2_EnASR, HCRX_EL2_EnALS, and
> > HCRX_EL2_EnAS0 bits. When clear, these bits trap the corresponding
> > instructions. KVM did not set them, which would cause guest-supported
> > instructions to trap.
> >
> > This also created a state mismatch for nested virtualization, which
> > validates its own HCRX_EL2 value against the features advertised in the
> > guest's ID_AA64ISAR1_EL1 (in handle_other()).
> >
> > Fix this by checking for each FEAT_LS64* variant in
> > vcpu_set_hcrx() and setting the corresponding HCRX_EL2 enable
> > bit if the guest supports the feature.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
>
> Please see 20240815125959.2097734-1-maz@kernel.org, which has a large
> portion of what is required for this to work. Just flipping the bits
> isn't quite enough.

I see that now. Thanks.
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

