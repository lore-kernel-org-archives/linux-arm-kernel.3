Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69E94D2505E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 09:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4CcV5AeMjzqz4dX84OHMKhqFU2THmMSUqKIzME/hWtA=; b=rTH+xXuX8/U+2xuSmn/A91eCyR
	o70ZCvm5msSkDd29rSN5vFT/8sfHQmkzgtyDnViIXNFkoj+z/hkRfpUjYUkxUegoYaH2zTLhDdqZK
	MD6oThohI8wddOSaMZGVMcVtjUBDWn+GOObduB6zByBU5PPf/lMvykvABt60um7kNynxzqXSAtKw8
	Cnq5mBwJIIPSQ5/1ymWAw73W4RBqf80jLVWFRLC7xg8Cmu2uZ1oP93002J9QQLD8wMIqyVdih93az
	8XSWzwU8RrpmLClwrHbxb8G4t4/QROM+j5x+SsS4gZk8MNzR2MT+uMO+Fvg100KWi3mgzNr+xgoRs
	XufCNSkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEBV-0000000559f-27MI;
	Mon, 12 Jan 2026 09:26:01 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfEBT-00000005590-2dSL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 09:26:00 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4ffbaaafac4so835321cf.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Jan 2026 01:25:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768209957; cv=none;
        d=google.com; s=arc-20240605;
        b=YlKGo5Lk3IA9zdkLHhl0yfCCIvX7W7/KUMyD5tx3LBuq3T2zhhencd0+HV0DCk8aZ1
         ES8/OP1l1DaFoXE9ovQeDF7rk6E8I25SKsc1xwzSZ/vj/QblOkZvcbXc9moiBY9gaRSG
         6cn8p20TSzOefbX82yrqKHVUMQyWhUYe9vcnMnQW70R3NZpiH/jqXxKz+NzCt8hZ44Yc
         32fQYUcWhUNcDItAqJ2K5PmqyuySxMVxPwdp8CdCgnQ4DsZQ1EEOAASsRfWaCyDrDw+l
         oYaAqO0OrzfggT+8VCD0ZwTm6ZSOIgwBCb2DDRp0gNLsSm558iLI55FKg7pz/Srt7kmC
         azEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=4CcV5AeMjzqz4dX84OHMKhqFU2THmMSUqKIzME/hWtA=;
        fh=HkOMqROq9EuiYsvNBKb8AG45pTN+NTnI9HLu3d59izA=;
        b=RkXJXgMq4Z8aohIyoeGlY1TEgbZndSqUBeybgS2jUGopMaKtOyIb0ag+CG1HpGzQQu
         2i++t+j3Zj4Hkfxtgm8DlisulF4QMdLL7TzSUS5Pcj4mpwho7SQ6VYBsWJw9NJRUQUNq
         HlZg8NX02EZTuOLy61KYfjceLnfDixQknZK8aCsZqBzDg6qEQ95JlEzWAVYZUJTTUgQk
         vo4MIF7MblN++1Od2Ku2tmZIkT6rdhj27B4hxeM0ADfg5kQdCO6mGr+TCb46Tjjztj2C
         eFyl+CUnyVkuh2coZR9WYjhqYOdsnxvp0bqp22NnQSXcmT6eOru+unavjd+letCzkQWG
         0zEg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768209957; x=1768814757; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4CcV5AeMjzqz4dX84OHMKhqFU2THmMSUqKIzME/hWtA=;
        b=KiRGxWnz0ufazyRd4bNu9HOGd1XP7t2LvUuxBNTWwOKUzQ9a/L1js6R+daiePGTAdH
         43DvlEcM0JiQ7czzfWF8kxFywQpgONp3E3E6B+AonNBzmoir7bzudCYk8S25mL90KKhw
         M7eMp5DGhq4Ngnj/aYMw952JSwz/yfsLRt9iKiIu/74vMiqIgrC7XnGiTu3Ot0EhgAkO
         6hzuWE8xeICPnEqfWl5rwT7A6hnDRXgQ2IEavU17NItcbX86MSaceGb2Ad2iWLZzxGIv
         GKycGoG5flQ5oewz2oqQrbj+zaTAyXqSyIJ5x6o2GxIwYTYEyG320t/EbY2ikcIe4Nby
         aD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768209957; x=1768814757;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CcV5AeMjzqz4dX84OHMKhqFU2THmMSUqKIzME/hWtA=;
        b=DbLI5i+resxY4CFpJGl8lWY3C39kZ/Y3ilTFOio0zHcpwz3aZ0ogvv0X3yH5jzu042
         WAlJSauNPab0pij8CvVF772ApguN397CWU/X+SmJosMWojKcO4VzNSepXnLPs1sHg36O
         K03lvTDoWgYr/zzdVeqw3z8oeq5eeCRvMKLGdtQHQZVrH+CRAlNj3YpfSunESZlFZgkr
         eHn8X0kWlx60jhrb8kQ1cKCauxQRxNhMo8M8kALLZ4mMp79qKsJEc5Vu2xyozabW8iI6
         v4292VRwj0XrqKsKcskEZ8mYmHu3C12TvTUOwrAlTcEb+c2DcYvODQXuJgP2hB+UidKZ
         sPUA==
X-Forwarded-Encrypted: i=1; AJvYcCXCryp5kyfGlrVxvW0/4jRQSNXe7jjooH/Ek21FEie5LMAO1VxuS4W0ZOn4QmaxRgoBZVtX315pqRiwqyaeey/i@lists.infradead.org
X-Gm-Message-State: AOJu0YyrfIFylwIYi92/mab7JelNS3tYFssjxDX0wFmmAm50NWTRkpsb
	uYeoh6E8LrHT9AZFgHiEBzdVIZ2G7CvwYzKTpXQ/31TRlIzZwWyjeH9BfL8UDtg51zY2IcTeupt
	qOknSoLi5EfL9vbjguBeoua8DlgxkIYT3WUdRN+a0
X-Gm-Gg: AY/fxX5y+l1T3uCjv0PKz1c1gsTk4cLT5UbLb1E65VNrk3KEO5uNo1CHHWiQDfWQUGA
	mU1VQu0E1JXw8rNnAFxAajlUce4Xy0JV7dqJ9qP/SfvHSvn+iqlLrHh4pruCThN8JYGAuo2wYoh
	JH8N/QWpZ0PwS2BtgcPcpocoLwH3ymQi5gGWgrhfooVFglz3xucjkkNi0rai0WbfBNRqZQ68WMX
	7bO3zvoGTZCA0rg136Wu4m5DIp70Sh656h02OpIWybOzygAmhc5LRZmI8/QkFgVuyYCFLk8
X-Received: by 2002:ac8:5952:0:b0:4ff:c0e7:be9c with SMTP id
 d75a77b69052e-50118159a32mr19754721cf.0.1768209957071; Mon, 12 Jan 2026
 01:25:57 -0800 (PST)
MIME-Version: 1.0
References: <20260105154939.11041-1-will@kernel.org> <20260105154939.11041-20-will@kernel.org>
 <CA+EHjTzNcTOR5sZpBTUXUP++yqOZEvmfs=S3wqBTG-YT=hxoKQ@mail.gmail.com> <aWET2EGnFKZCK2Ni@willie-the-truck>
In-Reply-To: <aWET2EGnFKZCK2Ni@willie-the-truck>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 12 Jan 2026 09:25:20 +0000
X-Gm-Features: AZwV_Qj-dXnEHT_eaPYhFYtJOYm6uHvi1c01WepSDaWMdR4ksdvmrI3uB9QhiUA
Message-ID: <CA+EHjTwBFJWM4+TGCz9YwFcPQAC+nNxBNLQxnZPPo7VeQunoQw@mail.gmail.com>
Subject: Re: [PATCH 19/30] KVM: arm64: Annotate guest donations with handle
 and gfn in host stage-2
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_012559_677148_5949F21B 
X-CRM114-Status: GOOD (  24.17  )
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

On Fri, 9 Jan 2026 at 14:42, Will Deacon <will@kernel.org> wrote:
>
> On Tue, Jan 06, 2026 at 04:01:28PM +0000, Fuad Tabba wrote:
> > On Mon, 5 Jan 2026 at 15:50, Will Deacon <will@kernel.org> wrote:
> > >
> > > Handling host kernel faults arising from accesses to donated guest
> > > memory will require an rmap-like mechanism to identify the guest mapping
> > > of the faulting page.
> > >
> > > Extend the page donation logic to encode the guest handle and gfn
> > > alongside the owner information in the host stage-2 pte.
> > >
> > > Signed-off-by: Will Deacon <will@kernel.org>
> > > ---
> > >  arch/arm64/kvm/hyp/nvhe/mem_protect.c | 18 +++++++++++++++++-
> > >  1 file changed, 17 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > index 7d1844e2888d..1a341337b272 100644
> > > --- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > +++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
> > > @@ -1063,6 +1063,19 @@ static void hyp_poison_page(phys_addr_t phys)
> > >         hyp_fixmap_unmap();
> > >  }
> > >
> > > +#define KVM_HOST_INVALID_PTE_GUEST_HANDLE_MASK GENMASK(15, 0)
> > > +#define KVM_HOST_INVALID_PTE_GUEST_GFN_MASK    GENMASK(56, 16)
> > > +static u64 host_stage2_encode_gfn_meta(struct pkvm_hyp_vm *vm, u64 gfn)
> > > +{
> > > +       pkvm_handle_t handle = vm->kvm.arch.pkvm.handle;
> > > +
> > > +       WARN_ON(!FIELD_FIT(KVM_HOST_INVALID_PTE_GUEST_HANDLE_MASK, handle));
> >
> > Instead of (or in addition to) this check, should we also have a
> > compile time check to ensure that the handle fits? We have
> > KVM_MAX_PVMS and HANDLE_OFFSET, albeit HANDLE_OFFSET, so we can
> > calculate whether it fits.
>
> The problem there is that HANDLE_OFFSET is hidden inside of pkvm.c and I
> really didn't want to expose that in a header as we might as well just
> remove it at that point and allocate from 0.
>
> Maybe we could make pkvm_handle_t a u16 instead and I could assert that
> at compile type?

That works.

Cheers,
/fuad

> Will

