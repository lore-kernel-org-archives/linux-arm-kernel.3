Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31347E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8OYND6fn7kYwT+1ERcVanRX0/dhZjw7OVtcr6DSH24=; b=NT+gx6o4ZrBRtK1ko5/En1BkjP
	NEHj1pyCgrL9qPK3vanCnqpwS/h0Uxk1H0Db+jXexx5bV6LqfVP5Eaq4fnXVD3bgfhZScYzUkZqSp
	mFABCH2O7L/Ze+aXXBgt380efMfxIf1bXoNZNgDXttgq7KVWK49sWRhdgKM3KogcNOBZv3qrMF/CA
	nCLy93CyV+N+KzioE12HVS8RcBK8SeIehWo0DZ+7qnkJ6LXJ2SOo7Tp4AKEjeEmTJxEJXnAUo5XG0
	JRDH5KeN02uWDpmudXRg05f7AUr2Ka4B4ohpzsUdsYO7/b/r3+JVN7sOcyGdQRHyywcOYSSR0tJY3
	kKwUwlsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXMC-0000000DWEE-3FTc;
	Tue, 17 Dec 2024 13:11:24 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXJO-0000000DVhu-1gAr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:08:31 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5d3ecae02beso6958593a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Dec 2024 05:08:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734440908; x=1735045708; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c8OYND6fn7kYwT+1ERcVanRX0/dhZjw7OVtcr6DSH24=;
        b=nTQHK7DM1dCQv4jP5z3r4i+fyFs1FrivOZmSCqx8eTvJPB8TXqOHyrjAn0Vn6ejLzb
         uOT/fID4c497FduWdPlQLO4SRru9QaR84dAZecjtS+Kq3SbuDelU6adwgtqTsvFhUgXL
         Y3nqIZv1WMq5VujjFYG79OaVbwrjzE1zlmgdH/2RJiOXaOLTgc4GGW0Q0Ha0eeCF7EM6
         051nMxIMM22l8uoYhtCUHyfRHFwSHlRMSl6dkw1NJagEpix69Zhzap/ZCkIzEK5MVXKy
         cIlfMRKf1eHfpD+KHVScvOyty9B+IBQB/hPZ8y3q3DFMs4ogRq0g9+bJZLGzpvQCOwcg
         +5NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734440908; x=1735045708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c8OYND6fn7kYwT+1ERcVanRX0/dhZjw7OVtcr6DSH24=;
        b=ITYuvt/ZLz0HEtYoMFzQ3x+Y+P1EiuX0y5b4COlAD6aKRKbuNakrDNA5apI4ONnREz
         p+zjcWQwOyefeuMjXcQqhQnozhWImOQim63hpQ/jWpU/kQakvaPKMH5e8hkYzKuAXXrt
         n2uFo3rT5bUeXj09dLZuLmUB0AO0Hffqh82jpu9F1FIFHadXjatP9gh0jKK3Eso2s+qs
         QWxD3XPh8LnupOAIylHUTNYx/xtSx2QMaMIG7uGJKhx7g9BgqVnZIGfpV7cFd3JSJoky
         hqkOwa8BKhj1V9lDcm9yGZZKI+y+kRV2QOG4Xo/li2GxJjb5KXti+yv9ZATg5MbIXpnh
         My3g==
X-Forwarded-Encrypted: i=1; AJvYcCVdOa6pU1Gve6f6nh8msUW/YFr3DmSQfdEjsc8LHSfhytB82FhFLBAtjpwvZSH1AmsHIoVCh92ihgTBNjoqPfB3@lists.infradead.org
X-Gm-Message-State: AOJu0YzK0my08p9kfPK5UkrleKZIE8NeJiwsRMjh1pMj51Rxao7o98ls
	YY+UuHPXIPbxSdCwaw6JF3+3HelGMn15Jew9OuSBwubVd2+RqvpuOCYAODWyyg==
X-Gm-Gg: ASbGnctN9MVRemAENuoEjc5EFpBW6ObBpLOIhRJzD23fmIiQ7srj1GKN9C6c5aKFycu
	ZYpbz9nc2zQvEUqZroippRVbVNEui1cR1EeOz/lySggtVR1BOcVPXEwzt2iPVTwtTu53LDMFVVi
	xnRZHgZY1jIHVMW1mQn7FFcq8ePUd7d3z3gJ7quFCdXtwpngX9QLD/6zPK96PBBfr3f/CBTmBv0
	7MWk2poDNI5TlA/P6zeRh5/MLP7zBy0BlQLHFcOp6CjIzQqpMN3YNxuHDrjE3Z9TayYGFX2FgPs
	tqIuty+6oMg4/ZY=
X-Google-Smtp-Source: AGHT+IHU4tb4zHbFKvDOUJ9Ob7TRBXCdnvvA1xIyi35Z/f8YS65dxxBPeEBOCyi0d2KP9W+sPCa32A==
X-Received: by 2002:a05:6402:2690:b0:5d0:cfad:f6b with SMTP id 4fb4d7f45d1cf-5d63c30684bmr14855753a12.11.1734440908222;
        Tue, 17 Dec 2024 05:08:28 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d7c043e7d7sm2050482a12.35.2024.12.17.05.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Dec 2024 05:08:27 -0800 (PST)
Date: Tue, 17 Dec 2024 13:08:25 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/18] KVM: arm64: Make hyp_page::order a u8
Message-ID: <Z2F3yY6DwUBmTtnr@google.com>
References: <20241216175803.2716565-1-qperret@google.com>
 <20241216175803.2716565-4-qperret@google.com>
 <86zfkur329.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86zfkur329.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_050830_435580_3ABB594C 
X-CRM114-Status: GOOD (  16.10  )
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

On Tuesday 17 Dec 2024 at 10:55:58 (+0000), Marc Zyngier wrote:
> On Mon, 16 Dec 2024 17:57:48 +0000,
> Quentin Perret <qperret@google.com> wrote:
> > 
> > We don't need 16 bits to store the hyp page order, and we'll need some
> > bits to store page ownership data soon, so let's reduce the order
> > member.
> > 
> > Signed-off-by: Quentin Perret <qperret@google.com>
> > ---
> >  arch/arm64/kvm/hyp/include/nvhe/gfp.h    |  6 +++---
> >  arch/arm64/kvm/hyp/include/nvhe/memory.h |  5 +++--
> >  arch/arm64/kvm/hyp/nvhe/page_alloc.c     | 14 +++++++-------
> >  3 files changed, 13 insertions(+), 12 deletions(-)
> > 
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/gfp.h b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
> > index 97c527ef53c2..f1725bad6331 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/gfp.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/gfp.h
> > @@ -7,7 +7,7 @@
> >  #include <nvhe/memory.h>
> >  #include <nvhe/spinlock.h>
> >  
> > -#define HYP_NO_ORDER	USHRT_MAX
> > +#define HYP_NO_ORDER	0xff
> 
> nit: (u8)(~0)?

SGTM.

Thanks,
Quentin

