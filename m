Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708AECD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 22:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7JRornaiplk0uZKMqz9STwhUMyLeMRJwxelXDphyMs=; b=i7qcsPHzb3sTJ4LaB35fXZ2FRm
	4oVuCLoRfaqmkuMg2obbvUSUgr1AEbrOZ5YaWfrXppUwyk0jD53n/uhrQ0imRbbdxG2ppXQ2IHsMF
	AFfRIdLXQcjZtjP7VPEOOPUkK1xofR9DWUHImLSri6PTjtuwAWOI9IEekgjS/ab+mjF3STDMVN7f2
	p6pG0Oxz900pau6JnGX+FMSjUbJ0k4ciAqaf0h1fJnqFxw+hWeF8ILq/MkVPhjyT1k4iMXp9p3a0D
	IBiIjiDbWey7aBTxxL8ZvGU//wBbB+BvNVjLR73/h4NUc31UpAvJtUXixjfL5/IBIiqE0If44zMRs
	NZkcB+ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJfaE-0000000BB4r-1vrK;
	Thu, 13 Nov 2025 22:14:26 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJfaB-0000000BB4S-1Idp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 22:14:24 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4770d4df4deso7985e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 14:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763072060; x=1763676860; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f7JRornaiplk0uZKMqz9STwhUMyLeMRJwxelXDphyMs=;
        b=SYQBhCbpt3JNB5J2h+sdObC7Dd9Ne7xK4Tnco3SuDXOEQmdIYmugWkl7scMEFI2Tve
         tl/KmVO/BeL6Bssbd4TJP2E0L0ShrIatj2g2aVKaZCTU6djZcRROVr6TD4o6HFg1cQNq
         TpC2X0SdKvCvbiJPLDz4BdMscvt3uKlf6Bpt1iEjn0E6frWkwLMRIX8WZuHuvGy+AFuh
         KRJVAaejrYWMDLPMaF+VWZarmt04ZCGfaKTWfTJlfZ/Qh9nJw4oH2QXW02DFlzDrVYVq
         F3U25qrN/3tA8pEdhKPWTZ7WfldyW/WQ1segTBCBEJDvvNwlIEo7+q/QhSbE6lQrDxa+
         XRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763072060; x=1763676860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f7JRornaiplk0uZKMqz9STwhUMyLeMRJwxelXDphyMs=;
        b=NMbuhObRMFtCW+EXMqVGqvAcdMiANYvwe9nU6f7ka7nqs2GVo6y3N71qPmwgceHvj7
         Hq7z88klv5rbXNQGF8Yl1roPnyVlNwchHp+6gzMY1rluPKfES5uO8spIHRv6IsrfU7T9
         WypHPqwGuWtGApb14BSKNdp19oDUAViZ9u/UE5/ZztmJW+Sar5BWYC4kDmRV895Ywg3d
         VYsKYoHRa27G/37Litc+FaHZjIhmP8rl2PwJRmfrtHOIHbXmMDUyIH+oypmydrmVftF+
         4BqqNr45YoxLwVuaxOVQl4h3EE3y7D7/xJvB5KzwQCIgSH9q8uleJcHY8nTT86tlvSUf
         YJzg==
X-Forwarded-Encrypted: i=1; AJvYcCVk2d0wy5gBhqfEEZRv3o2YoVpmk/pexvZSPZMWlXKynP7OOUEEr6elVZHjc/z9JWgyf1RSMmG7P6T/r1fXiVgF@lists.infradead.org
X-Gm-Message-State: AOJu0YxABy1s3T6nj/pahli6WGYWCCvXzXIvgSj0fYjQ8cDOqYKLaZ6L
	gcmapmGupA8mieC06rR3G6qLbwtWQHrkG1E3zrPWsGyd8ykGx0mEGoahPK/hmljjXuSugM6yR6U
	xF/OTTcDPuKw/9smNZx5HnBJw264KRhZOFS2Ta9vb
X-Gm-Gg: ASbGncsfCpMUcpevApyK19USAc289Wcxq3XoUALXdnMnFv1sRXail1RvqSAJKQyef22
	XtlfCiA0R91XRIfoedvuhtnf8bn0EvCl8freEGRCt1iHRXquHlX9ARsUmbGCB6W6s2vEsSsOUzi
	KKNX66OGGVVHdzF6AOtlSCeanVP3X5OvpUgMo/3XWbWuukbbYlng2esgDMe/eC3GroF70Zl8QkT
	w7nhoE7FX217uyiUunJdphYD9Ni2A6PQf7A228bsbQ5IlRZPAYeEJWqWyggb1444AHBSbf5a2GY
	9jM0a/rsgFsarwBXHTyvn9WnNQ==
X-Google-Smtp-Source: AGHT+IH1dTN9h9lNDnRTlh4UyFd6aH1+EDMlfhkx9gNk7p2AjcKqv19bBUUeTsmBJjRKqPU2Xh2SmzFkyX1KkJheFqs=
X-Received: by 2002:a7b:cc99:0:b0:477:772e:9b76 with SMTP id
 5b1f17b1804b1-47790b11bbdmr102735e9.7.1763072060296; Thu, 13 Nov 2025
 14:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20251013185903.1372553-1-jiaqiyan@google.com> <176305834766.2137300.8747261213603076982.b4-ty@kernel.org>
In-Reply-To: <176305834766.2137300.8747261213603076982.b4-ty@kernel.org>
From: Jiaqi Yan <jiaqiyan@google.com>
Date: Thu, 13 Nov 2025 14:14:08 -0800
X-Gm-Features: AWmQ_bk6n8j-0ORtQ1jAf-pM3nvvAf6VB8V4V3Ju58iczpjKI42PYMXub9cNtfk
Message-ID: <CACw3F51cxSgd-=D46A6X6GptEZS8-JZ_MnB_yK_ZR1wktunYRA@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] VMM can handle guest SEA via KVM_EXIT_ARM_SEA
To: Oliver Upton <oupton@kernel.org>, oliver.upton@linux.dev
Cc: maz@kernel.org, duenwen@google.com, rananta@google.com, 
	jthoughton@google.com, vsethi@nvidia.com, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org, pbonzini@redhat.com, corbet@lwn.net, shuah@kernel.org, 
	kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_141423_365859_71744FBC 
X-CRM114-Status: GOOD (  10.14  )
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

On Thu, Nov 13, 2025 at 1:06=E2=80=AFPM Oliver Upton <oupton@kernel.org> wr=
ote:
>
> On Mon, 13 Oct 2025 18:59:00 +0000, Jiaqi Yan wrote:
> > Problem
> > =3D=3D=3D=3D=3D=3D=3D
> >
> > When host APEI is unable to claim a synchronous external abort (SEA)
> > during guest abort, today KVM directly injects an asynchronous SError
> > into the VCPU then resumes it. The injected SError usually results in
> > unpleasant guest kernel panic.
> >
> > [...]
>
> I've gone ahead and done some cleanups, especially around documentation.
>
> Applied to next, thanks!

Many thanks, Oliver!

I assume I still need to send out v5 with typo fixed, comments
addressed, and your cleanups applied? If so, what specific tag/release
you want me to rebase v5 onto?

>
> [1/3] KVM: arm64: VM exit to userspace to handle SEA
>       https://git.kernel.org/kvmarm/kvmarm/c/ad9c62bd8946
> [2/3] KVM: selftests: Test for KVM_EXIT_ARM_SEA
>       https://git.kernel.org/kvmarm/kvmarm/c/feee9ef7ac16
> [3/3] Documentation: kvm: new UAPI for handling SEA
>       https://git.kernel.org/kvmarm/kvmarm/c/4debb5e8952e
>
> --
> Best,
> Oliver

