Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC62AF3D332
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 16:56:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w2b4o87Dv8Tqe0cDumD9I6Yls5fZWHSIMLvm+YwvHiU=; b=YFPXUPw19xVrAP/XcLd40Ncg2x
	K6t5XFo7NyYilw7gyINsLfcsug5RbEeWqF0+KNt0O+Ks6dM6wm32+EGYTywKpVLbyIB2J7goKkspv
	3gCda4mwqK3wWznJ8m1m5aZGRcLlH0KojjX9Dzw5ia45rf5BFbBc6kZLwjWl94Pof3RvNGwroNNk+
	hIUXeFHeMlsNfXfw+dNsOZXm7ReiJwFvad32ZznzezCWGYMMXMHYKHtlCw9IwjBkP0F9vxm5MIMkf
	imUGsSkRpXVDhxrp1dXmwe3J8QHsXJbtVxdOMzjxM8jk6kdouNRW62gdRVEFOQ3K2uS+lzC63HTGq
	lE3C4E5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBzr-00000002F1e-46Um;
	Thu, 05 Mar 2026 16:56:24 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyBzp-00000002F17-44c8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 16:56:23 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-506a355aedfso632641cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 08:56:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772729780; cv=none;
        d=google.com; s=arc-20240605;
        b=c+cUAmb8/1ol3qx53q9AiIdFC3Rsgx7yJnlGU2YTk8D2w51fKhrRGA0rn/VXoGuWpa
         pmzA3IqD9n1RAonrku2NSzU3VSxH7j0JE7QGXJBNbSz2PdRrDzfjgTlYcJN+3hB8wXy7
         qj8f3D6Rc9kgDWZ4Ml4WrsszaYDrQl4zTIHDY9ShC17UVz60wu5F1VoViVuXe/AfEvYu
         Wg3j5eLcq8t1/wTfvzes5emYJ2E9J+OKf6i1qRLscZ5w0w9ewO8ZvX2FpDnnxm1whGtU
         cHUHm+GtSGcEHoCMhUE7EzFxDQAVxd/J1/SnfiUk695JY3UT2XB7ECOz7BlRoJwJsG2N
         uewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=w2b4o87Dv8Tqe0cDumD9I6Yls5fZWHSIMLvm+YwvHiU=;
        fh=sgtWmVD3lAo/k09glszqcVdYyjc+nXBuG2VC5MDMdOw=;
        b=TweB84k5p6LitkThfzfA3B0hp/lB9ETNgkELwJ5c1ggplmMmzQPhGfz01DDF8k/pm9
         7mUi4H6mzE1XN1ZcUx7j8h2XKfx/4Iikye7RPvMGLnHs6uGDRUhyqPpXSmdDlakRY2Ax
         lC27YQZtc65+7YLe/bdpIwj9fghu/ThLYwCWqShSQmdnPzbzdbZojFsuuAnxoJAQ0v1d
         mvDgHtaWpcXc2YCI2xW7yM65fN9cCStdZ+SrnAUXxh3tTadM9yiac2+A66mFbwgtyVkn
         r3gsBRRbhKREeYXuGboR3Qjh8XU+5KF7mWD70CSIlY4CG3AxrB2/jNtY6vKW5V2KRStm
         zDog==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772729780; x=1773334580; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w2b4o87Dv8Tqe0cDumD9I6Yls5fZWHSIMLvm+YwvHiU=;
        b=lOt5C18cfx1FAQcTL+8JLoVg1xfIgm8y00WL76dc8EA+puVQ2+u7Q4JqQCvcXyb2MC
         0ncxmztDX9YRs8JE2+oejoxZXfnb2qaUP6VN5oe+t/OnaHyVIt5u2DO9MbfbZ2dDmc1t
         Z0QZCTm84l+FcDvDGSidNN7dbP3ETFXm9fHa2htjnfIVlXp77WZq5Ll69Vw88dqFMray
         Wo24GZ8Jl5tZLmom9s9/69kdI3Fds/jUnXG9u91jSO8qYDRkYnNxoB/jPfkomI4a34tU
         sU8ojRSqy80GdwR5ir2gEF5C18q8IZ0eklUQrUk7SXDul9+oXIq9pjfOZUstUSHgzQQG
         fobQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772729780; x=1773334580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w2b4o87Dv8Tqe0cDumD9I6Yls5fZWHSIMLvm+YwvHiU=;
        b=Uinegooiji2MZBTaJtN35zjFlU5WL7SC+grepcVNTz5pX8wMJzSikD1Q6U4ZAeu2CW
         /ftnt6DrRQvT7yto3f11SYmNr/rQssY872r/pw2SN5fU4+jRnNQxTlnljtfjNKEi6Qco
         rkDkCazg6xh3KnZ/u7pBEinSbvXWoNdVnPVDk9kGjcmE9B3lV9sI3wca1MQMsPBuHTrc
         Lg+D1MQx9DmdYpD7buAGfRm7OEh44A4icaaYgynpFPmimKepv2GhkWV3QNn4tzHJfXM7
         C1BdmhD55oqImiQbQE46wiER7ejOWFobKtV8AUNvPzUH00CCZr4yX7t6ZIzdm5D5oWU/
         6F7w==
X-Forwarded-Encrypted: i=1; AJvYcCW6RoUpWgpyoOtxV3Q/ulAQHoCsK/1UbiFoLRasi7IZIqcCg+KA83vDaiKGSE+Tb32SyiFrFVKUsKZ21pueaZ6D@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4flq8pEkaKW1rEFYA9Jzv5nwXYe3HMTbh0nShIBjS03DEMs+W
	aG6RPe3/CGLs0pC7D1OJ4JFRLS6S6k7fLS4hyq5uMnUJsQmJ6HWMXZo0wxkeg6xir/Svqa9Rmta
	KbQgpux5ND2C4lpDEc26tbV5m1p0boelItsBMBmhw
X-Gm-Gg: ATEYQzz6iF8o0pPKefvtMAkz4cHEHG5OY0EixJuzEdO4QD8yv4kx8+eQt/rtr/K0/iV
	T4PIMAvEWl+0jorWzvSdWGIErM/2duqS39/vfNy3AvWDgoB1jYTtv4ltXTh+5Kp25af1IGLIj6/
	S3ZajUo1HF4pcqytPRa1N8QhQezJZdwRVRDTNfIiFqOyfKyBA28Wu71lhiVRS9A8f7XN763Mu4j
	E2rzLDEez3K/452kE8r3XeDkIhSZsSqhrO32C8cbIVf7Gewu6iJ1hxYPC3LoaJfx9HR2vgga6Tg
	bNEBj61Z
X-Received: by 2002:a05:622a:1908:b0:501:5180:3c90 with SMTP id
 d75a77b69052e-508e78bc5a4mr11348321cf.15.1772729779762; Thu, 05 Mar 2026
 08:56:19 -0800 (PST)
MIME-Version: 1.0
References: <20260304162222.836152-1-tabba@google.com> <86jyvq6wyg.wl-maz@kernel.org>
In-Reply-To: <86jyvq6wyg.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 5 Mar 2026 16:55:43 +0000
X-Gm-Features: AaiRm51dhM8VzhZriEGSXSixZJNkbyhhRpWwsRm0Q6k3mF9vnEvNvcsMfRmqcbY
Message-ID: <CA+EHjTyUhBqUGG+TC83rz5W11RcymQuFAr+FhFpRsPZbf--vTw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] KVM: arm64: Fix a couple of latent bugs in user_mem_abort()
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, yangyicong@hisilicon.com, 
	wangzhou1@hisilicon.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_085622_024821_36704C96 
X-CRM114-Status: GOOD (  17.06  )
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

On Thu, 5 Mar 2026 at 16:51, Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 04 Mar 2026 16:22:20 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Finding these issues just reinforces how fragile this 300-line function
> > has become. We really need to refactor it to make the state flow easier
> > to reason about. I'm currently putting together a series to do just that
> > (introducing a proper fault state object), so stay tuned for an RFC on
> > that front.
>
> If you have such patches, please post them sooner rather than later,
> even if the rework is incomplete. I'd be happy take small patches that
> start add infrastructure early and work out the full refactoring over
> time.

I'll try to have something for you by tomorrow in that case.

Cheers,
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

