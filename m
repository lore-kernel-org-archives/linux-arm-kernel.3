Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D6BFED3FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 20:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sp92EwCFMmdCctd+G8p5NZ1F+m0+I8XgaVk8fcD+2Os=; b=F1VRdi6tZIJX/6MvslWGyGhDCR
	x6PkklVH4aRNHxzp+8BPGFEh3rBeAFIq3/bztR0U8a7gwHNXfp29lwkr/jEYEENi8xP8pZIWwANvj
	0fyUSTuCQ0+Bm/Bm8VRK1D/btMfPRm7e3mx1oGdWBMK7KdW484GmhJEWmEP5ui3Elk3qLzNYD35DA
	4Bch4Ql8l4cL5gOIT1yMk5L3RW0dJxtCEsosLeQEThL/KQVpO3AlXegTeZPZmYug7UrXsfR/3Bo3g
	8INwdRdIqXEIzYPijqZVZNHXj3MaTJWSnkomabzMJT8HsmPjOU0T8MscnSJQlMioxWRpKgghd1FUN
	TUaLmE7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGMwE-0000000Dj2M-1QDM;
	Fri, 24 Apr 2026 20:15:46 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGMwA-0000000Dj1q-3izn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 20:15:44 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ad4d639db3so42046925ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 13:15:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777061742; cv=none;
        d=google.com; s=arc-20240605;
        b=GpmQExSO26dT8WgBUcJMbVhW3aZ+8IfNjzVirWHDYSaNFf7N12BIXpuPDnO32q5h5t
         03iS8lZKZTIINW0GQEM4NATRNOL+MTEvXCMz6xL9B7Y2+OhbsYL0fOdPuQ+/FduIUQRr
         doRaZ2CCP3PxMfXn9JjEYhUJ6whoS53/kN4namFHOfYboR9Vd+iDxZFX/llpe5WBmSCn
         33F4pmqBzgFAPugDb3xp5uTwy2C6gtUkakFz/NQRPL5i1+oKYJQmmjCObD5u3/51SBuT
         9hLSa0/vH40FRfKVLzr8mGR7VO4keDFRJcbTxIblytr6BSdLSSU965yliFgmEzLUbEUh
         ttRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Sp92EwCFMmdCctd+G8p5NZ1F+m0+I8XgaVk8fcD+2Os=;
        fh=FLVusSb7kQ9GY7EPWWD6hJwFP4isVTb0VQHjcBLji8c=;
        b=fegRAUQ1cDhNTD6bhx4YQR+i4nYRDr91Ugs3jdZ90U1oYqBwkjp9AIYYfdk9wRl5MC
         KjlTrEvGyPgSJusO+0Wyp5GZrjjCkEHn75yomnQRH6y+QwaEUhS1QD8FPqCyKMEMvOWf
         oXiw9SqWtGyXrUk1nswZBsnUcdO0VVpPFEsQBfMeiPeJluacnhPOt0KyUijSG/Wvfl37
         RId8fB8PpmhjOAQ7FwDwRKdX5zLPxB5EBZE1cmfNIWnGjYJIcGqmOWcTYYibz5oaROKG
         GgefiLGLQeyF9L0vK6uvL0vy05t675uWlmSh/K97TSEkbmEh6tavCwqAtqrO7IWnJWzY
         eGSg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1777061742; x=1777666542; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sp92EwCFMmdCctd+G8p5NZ1F+m0+I8XgaVk8fcD+2Os=;
        b=GmOF12Y/9k3BOTqZJ3ojFZm7q7Jnync47WpJxI16A4hU8Eq3WBz0M3W7p+mS+wt1I/
         Y7mUSPo+R/XQBtI3Nr9fMtdG9GtQRMSLnuBed3lp67oh3UET6yUUTZDKokADJpmRNKg9
         k31iE5DcszjAodIgumVo/LhHXien2n4/gHIK9FkrM6MtDumU4kxNaTV6xEGAXJqc+l1C
         L8fRcOTa7LDrq9z1VkLJRg0AM33OkE4+Th+Ll/HW8AEHt4VhgjC6CkVjVBbctYJP1sZY
         dmwRnBCfXXoYJul56DnsY6yT4MV7Rbxd4vz00OXk1o+mLIRQ9o0HywyBmH/GACx+S8nz
         /ZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777061742; x=1777666542;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sp92EwCFMmdCctd+G8p5NZ1F+m0+I8XgaVk8fcD+2Os=;
        b=db0e/0hSlYAvOph2DlHZzAAUxiEIXF4SANNGtiAVohon54RGo3iyGZU8hlk3WJCSCf
         bF95R28JGC9utTW46LSSJPn3IRssWEjHaqgOUxBgkbj+G1E9mRhaKQaKbL6tM98xEPex
         Diclom2J9RBde/Wb4s7RAfgNFm7DtwDQAeobeblhqkLP+W/9StOmN6vtMs5eYAUAW8r2
         5rVzOA8JCGGVvHLjUJya10bFXN+Tcn1tC2IImHbSxVlB3cVywU5sMnwvRuGoAZD8Ek8+
         yvw6ewrOl99oS7glh1oUb2mJ9kyVYlTxcxjvlshCYflaALIJJnAW4dZPIMxxrBORNbRW
         o+pA==
X-Forwarded-Encrypted: i=1; AFNElJ86xa7AJ0T4u2ykmdXGjM9DCvjds1WECdCcO2pf0ctrMNrtChNXb6ZcQup0SkM67PiJMqB21BMNtumjincF++gX@lists.infradead.org
X-Gm-Message-State: AOJu0YyDTHaEgVDBgUmqr8jg+LwORwkXvZupqJVkgx2+qYdPKS+CGA61
	4EwxHq+O+MzKoKkdEsViyCtlYZrYI358l0o3kDZIPdTcO5cVw/f6cfKpdqz5Lna3qs8dOMcpPhw
	2a39OKfMEFIhS9HfWwOsw9DbGgYcYmktcku6asQ29
X-Gm-Gg: AeBDietbdUCgM+AtpjLeMUx5VmRIp7SHdqhLyXou+5fnCC7c3YwMWfrQ0s81QMyZXgC
	I4Omz60E97p0PD585XR/VrO04kSR5EklXRBikQ7U6SrKl7l6YLHHab28c2Je44czFB9gyuihcRy
	WLFgIt2QVJ8wNf9eg6knT68HAXe8MnMKSiElMiJcbddf7qNmQ5sBBH+sKiEC/lcA46igKtOkAkH
	8408INYk5N6LNel0UABWYqhH58EB6hqbpQHYg+rtbwQZTVjt44wtm/KU1CJoYJ7n/NWPM3xmg0N
	ats4uV47lIU7F775sA==
X-Received: by 2002:a17:903:883:b0:2b2:9f45:2266 with SMTP id
 d9443c01a7336-2b5f9f8302dmr254143155ad.21.1777061741644; Fri, 24 Apr 2026
 13:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <aeoAlVEwzRUPrlVe@e129823.arm.com> <aeoRxWPyOHGJd+Jh@e129823.arm.com>
 <aeoWO2Cwo04YYu2l@earth.li> <bd908e28298d968740d03c97bc7e441de188b7b4.camel@linux.ibm.com>
 <aeokwrC86WI7uT+K@e129823.arm.com> <aeomlp3I0eVE5mce@earth.li>
 <aeotq8nPVu4wvEx5@e129823.arm.com> <e4e242ae5533d5762a3647186a178764881bf9ff.camel@linux.ibm.com>
 <aephL3MzYoqFGaT5@e129823.arm.com> <CAHC9VhRQWHEWQ5NzOPiu8jtYv6UsRm8WVS4fd74AbkOcAd4y_g@mail.gmail.com>
 <aesGU8a3mbVzvteH@e129823.arm.com>
In-Reply-To: <aesGU8a3mbVzvteH@e129823.arm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Fri, 24 Apr 2026 16:15:29 -0400
X-Gm-Features: AQROBzD85SjPMTZ-_HyOS5lMf1XvZbjXC0wu_RfpvlwIboP78qicPJqw2hn2ACs
Message-ID: <CAHC9VhSaT_quKYnpFjAfqvL07JNbWMgM6c4pB9F46NHawX3DCA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] security: ima: call ima_init() again at
 late_initcall_sync for defered TPM
To: Yeoreum Yun <yeoreum.yun@arm.com>, Mimi Zohar <zohar@linux.ibm.com>, roberto.sassu@huawei.com
Cc: Jonathan McDowell <noodles@earth.li>, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-integrity@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	jmorris@namei.org, serge@hallyn.com, dmitry.kasatkin@gmail.com, 
	eric.snowberg@oracle.com, jarkko@kernel.org, jgg@ziepe.ca, 
	sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com, 
	sebastianene@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_131542_933849_62E7C122 
X-CRM114-Status: GOOD (  22.20  )
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

On Fri, Apr 24, 2026 at 1:57=E2=80=AFAM Yeoreum Yun <yeoreum.yun@arm.com> w=
rote:
> > On Thu, Apr 23, 2026 at 2:13=E2=80=AFPM Yeoreum Yun <yeoreum.yun@arm.co=
m> wrote:
> > >
> > > Sounds good. Once the patch is posted, I=E2=80=99ll review it as well=
.
> > > Sorry again for the noise, and thanks for your patience ;)
> >
> > My apologies for not getting a chance to look at this patchset sooner.
> >
> > This seems like an obvious, perhaps even stupid, question, but I have
> > to ask: if IMA can be properly initialized via late_initcall_sync(),
> > why not simply do the initialization in late_initcall_sync() and drop
> > the late_initcall() initialization?
> >
> > Does any IMA functionality suffer if initialization waits until
> > late_initcall_sync()?  If so, it seems non-critical if waiting until
> > _sync() is acceptable, as it appears in these patches/comments.
>
> This is the way first patch did, and here is some discussion for this
> (Might you have seen, but in case of you missed):
>   - https://lore.kernel.org/all/a6a0e15286c983d720de227c6827adbe976c5b9b.=
camel@linux.ibm.com/

Thanks for the pointer.

Unfortunately, my concern remains the same: it's either "safe" to
initialize IMA at late_initcall_sync() or it isn't.  Attempting to
initialize IMA twice seems both odd and wrong.

I understand the need to ensure that the TPM is available, but if it
isn't safe to wait to initialize IMA at late_initcall_sync() then it
would seem like this is a bad option and we need another mechanism to
synchronize IMA with TPM devices.  If it is safe to initalize IMA in
late_initcall_sync(), just do that and be done with it.

I'm also guessing a two stage init process, e.g. some in
late_initcall() and some in late_initcall_sync(), doesn't make much
sense here, but that could be one other thing to consider if some IMA
tasks must be done in late_initcall().

--=20
paul-moore.com

