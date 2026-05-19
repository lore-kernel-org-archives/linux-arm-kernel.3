Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8C0CD4F57
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 12:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXWENuANe/jSGrQq2ukgBgZ/4H6cQmEOV8lkEUWmoMA=; b=Meb7hxEmRllHouSqzYtOULqkuJ
	J4KFJyOR1sUUdScvkWDVAkJbgg2G0NWit09K6BgMeeq94Ma12/sjKAa2Gi5QwBB1WlEV4qtBt6vj/
	hvk8qDJf3jj11t1Dx0VUY22iY5sPWUVR3tLkgOJyukhOgKKOKTGJddWKOO1uMj/UjRUehRsn/m6ZR
	7+QwXGvATeYPhF5gcayDnYJ3jYDEcffIW/yUMlQIhkXeMnYnutlnbwWSOHNla/Orv+SmrJGvDAOnM
	V4ynXsufiE0f0zRKqg8bW8FyLHjeBkcfr2v2gzHIb2oc7HePznd8SAcR/MvV7VQUfCXNd5jlcOZwM
	4YSJzXig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJKl-00000001RSz-42T3;
	Tue, 19 May 2026 12:14:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPJKj-00000001RSG-1JF5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 12:14:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779192839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pXWENuANe/jSGrQq2ukgBgZ/4H6cQmEOV8lkEUWmoMA=;
	b=h0eUIDoOEOrzplMCbVfrEh2sPliz/nPc284pHYoV+1d5BeabPcrFwQmAG82TSwVKk7mnxO
	Zq55prtxIjG71P6sTFtKdczqU++GF8T551QEktOYqN2ErTMLqCOCJF90Qh16CbugIaPRIR
	yH9lraUTOQkQzX4vhyHPwqnBB3m4rYY=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-368-OVa-y0BCOx6Gvg0zvMCr_w-1; Tue, 19 May 2026 08:13:56 -0400
X-MC-Unique: OVa-y0BCOx6Gvg0zvMCr_w-1
X-Mimecast-MFC-AGG-ID: OVa-y0BCOx6Gvg0zvMCr_w_1779192834
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-44bf1ac8893so2809959f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 05:13:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779192834; x=1779797634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pXWENuANe/jSGrQq2ukgBgZ/4H6cQmEOV8lkEUWmoMA=;
        b=M5dslrid4XvkG4jxwyjW+3rkpNlys4AbbX8IPoXOxOlJbO+Maf29/RCWR2OTllc48x
         ueOlv899mcD9JSWcRPdVVGbE/KrnVHAotZ/yKev+B/B8xs/Mz8Kdx5f4Yqu5PbaT+foA
         bUDkmrtSp6DjIwcM3ObERllRMhTpUIVLw/AahA+xfP4OiTW+YHofU9uNozdgKqa1hnDg
         wnKabRflKEkUgPR23CJDxEP4yWuT6zlCvDrXzsuLkyqjBDNpQXYG5Lbb+z3pLT82C6tT
         7JpjpUFLl/KXhNV8nOHKj+z0QDPR2bNAtY4I7viQpazqaKRmpCRzGOmIdEn1AwI2guAp
         9BYg==
X-Forwarded-Encrypted: i=1; AFNElJ+/ufj+7kh1nV8i0VrywIRtmhaJTwt7R72zcXbNwkdfZStZwvc71mVLBhQ958NsGLD9bUUbyTZDlbS6+hkeIarn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+1FjZzyR8MDcNjvbiUC6xHqfOM6eN/Nkwcsx9h5zza4WKp4+l
	vjqOsyA26En4hg7GXg1OjiOHZAgi6ApRTGsmlZYi8MEPm1bp0qzkMD2bOc9bTljmqr5k4PodbjM
	VaGx5GIbzDcoUG0mMtcGoZuhDmf2Mkxgci/J65rBsHrD2hOLtCGqTSKd5o327MBOsqUhQrwr69I
	o4Gk/5NWJsIIWFfw5a4ELID67rMAs8xJ+jDURfECXnmGLvA39sbU8=
X-Gm-Gg: Acq92OGzSbmQBbXkxkgHIUoyifPAB7xdlNOeh/GY/l0OGxQcXpex933SaOuSEjZRBk6
	J9yxHave9ittia0WEatpKCIhedpMeYcRvbfakDsxuTze02z6vZqMv3GZznT/YGJal1Tvwc1B3lX
	ojgiy6xnOc06btOoHHYWqUVgdGY6Eikvqq6Z50erV/J+KmGb482RrkPhk47WdF1s0eaBYcpTXNW
	8Tvd8zOismKjZ5d31NcgoXwMKJO0h0NCV6TpFd/CFazrcu/bP4WxhGXfpncTL5XZlb4BaQeKkIg
	kFWkeQ==
X-Received: by 2002:a05:6000:2207:b0:45e:73eb:2a75 with SMTP id ffacd0b85a97d-45e73eb2ab3mr19018194f8f.16.1779192834237;
        Tue, 19 May 2026 05:13:54 -0700 (PDT)
X-Received: by 2002:a05:6000:2207:b0:45e:73eb:2a75 with SMTP id
 ffacd0b85a97d-45e73eb2ab3mr19018142f8f.16.1779192833807; Tue, 19 May 2026
 05:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <6856b269d2af706eae397e0cf9c1231f89d9a932.camel@infradead.org>
 <6afc4b95-3c15-4d71-877d-19b84e91ce05@redhat.com> <57bc082f4824d6114d3156744c25986effc29aca.camel@infradead.org>
 <baff82ca-6321-4b16-aa61-b2d6d60b6535@redhat.com> <86h5obya2r.wl-maz@kernel.org>
 <48b06e5655d56ff6eda30e563b34894fa0eb2f07.camel@infradead.org>
 <ba08dfe9-932b-40c3-9fdf-fc891d52e1d8@redhat.com> <d9d4471a7f5ec1e297b3ca07f42a59090aa91e15.camel@infradead.org>
 <CABgObfaM-JtNn2MuYXaiadQnLfAhTEaoHAcTG9=J6LkMcQCJ3A@mail.gmail.com>
 <3f9d731c3d26b0367600f1069e6425099bc34eac.camel@infradead.org>
 <agxFbniU_6eQ98t2@willie-the-truck> <cf429f2082e863571595f74d1d3dedc3e6a82964.camel@infradead.org>
In-Reply-To: <cf429f2082e863571595f74d1d3dedc3e6a82964.camel@infradead.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 19 May 2026 14:13:41 +0200
X-Gm-Features: AVHnY4KnZP7vwbtgqcU4-2-Suro94ZjhbnxjZ4Hm6Me_3CnnH2LMZ4Ptbe46Vgg
Message-ID: <CABgObfacAYexR25SMi1kSZMRnHx3EDGj8=E84V1DumER66ibnQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: KVM: Document guest-visible compatibility expectations
To: David Woodhouse <dwmw2@infradead.org>
Cc: Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, kvm <kvm@vger.kernel.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	"Kernel Mailing List, Linux" <linux-kernel@vger.kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Jim Mattson <jmattson@google.com>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Raghavendra Rao Ananta <rananta@google.com>, 
	Eric Auger <eric.auger@redhat.com>, Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Nathan Chancellor <nathan@kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	kvmarm@lists.linux.dev, linux-kselftest <linux-kselftest@vger.kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YdTPq99TlcHM7LArVL8mEmGI4X7lgW3jyL06YwYvfco_1779192834
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_051401_421290_91E9F6B1 
X-CRM114-Status: GOOD (  23.05  )
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

On Tue, May 19, 2026 at 1:44=E2=80=AFPM David Woodhouse <dwmw2@infradead.or=
g> wrote:
> > > So... what next? Is one of the other KVM/arm64 maintainers going to
> > > speak up? Paolo would you consider taking the fixes through your tree
> > > directly?

I admit that my knowledge of Arm is really limited, and I do not
understand which IIDR values have architecturally allowed behaviors
and which (if any) were made up by KVM; but even if I cannot honestly
remark on the code or even the approach, a compatibility knob is the
right thing to have.  That's a userspace API design matter, not an Arm
or GIC matter.

I hope that Marc provides a better explanation of why he believes
https://lore.kernel.org/all/20260511113558.3325004-2-dwmw2@infradead.org/
shouldn't be accepted, because I am more than a bit puzzled about
*why* that patch is being rejected or (in v3) so far ignored. Marc in
this thread wrote: "If userspace is not a total joke, it will read all
the ID registers, and configure what it wants to see, assuming it is a
feature that can be configured (not everything can, because the
architecture itself is not fully backward compatible)". But in this
case there's an ID register that tells KVM if userspace wants the old
or the new behavior, independent of whether that old behavior is
architecturally valid or not.

I will certainly take this patch, but I won't override Marc. However
I'd like to better understand his point of view, because right now I
just don't get it.

> If KVM on arm64 doesn't aspire to maintain guest compatibility across
> host kernel changes =E2=80=94 regardless of whether the previous kernel's
> behaviour was "blessed" by the architecture specification or not =E2=80=
=94 then
> it does not meet the expectation that we have of KVM implementations in
> the Linux kernel.

I agree with the "aspire" wording. Even if it's not going to be 100%
achievable, KVM *needs* to aspire to maintain both guest compatibility
and architecture precision. Sometimes it's impossible, sometimes there
are constraints that require you to trade off one for another (e.g.
via quirks, or by breaking behavior that no sane guest would have
cared about). But in general as a maintainer you don't *get* to
choose.

Paolo

> Or indeed the standards that we've held for Linux kernel ABIs for the
> last 35 years.


