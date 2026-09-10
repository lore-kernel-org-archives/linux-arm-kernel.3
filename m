Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2A2CC88E40
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 14:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZGkfTmvcfg2tYgnaJgCLfP1/mFjyPE2KGae6+BF91/w=; b=yfQdxtFFpdfJKvAdGvcJPJn9mC
	0VCeGzNX1ZGDKt08eRpG3lcFvWDTzgoBhOi0S7xljRtBGvMg/LQ29aQlwF41nFXJBnrO3GSAG9px8
	u8oHPmjd9bYiGwAMUoJW7amUfd3sjsAjvfmhmCG3iZAzdao9s5ML3RmPXQFFtg/wewNfQZDXwjJPu
	Oxy43cRoeAQlmlEIl128FS0+jTB8V8Mv9DKUMPx4fSSy6lfz4nx7CS02kMl9Xi6dR4E+0qab08b9c
	0vNZGy67bAWs5wnRJYoKdfRoxlE3/f2wFt9tlsXhYWYJ81G3K6edZIVgQJp/SUqwg4W5U8LhKML/v
	cvGL7g1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g59-0000000Eg35-2djD;
	Thu, 10 Sep 2026 14:48:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4g58-0000000Eg2M-2Kmp
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 14:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZGkfTmvcfg2tYgnaJgCLfP1/mFjyPE2KGae6+BF91/w=; b=nX0xwUjZOEPDYGGLZV5R5LCu0P
	XK1sD2JQCv1g1n5Lj7IxY1XBxh6qQd7ZpTvEUhajs1UMNuA9gL2akEVmoLuINqFJzU8qzqngcpp8x
	zKfwlbb3CmBInnhEc1wCeVSiEuuhJI/t/5TwCIJyIqBM3KyYotnduPe04xfmH8YSZCGsmxGWOZ8be
	5+0aN+I44FkpyOvncXrkY6JsFi9SBGi+qfHquCc9wBi5q/kuPh7ZbnMfmL0czYk5EPxTO/tInmzW1
	fNqWAAKnfu0gJAviS7V0bEaCo6iQ3/C5yp/cySziv8t1hVmyduzEkxV/yLTDUDOGFPumree2U4a1X
	lt2q5QTQ==;
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4g55-00000002dXY-1vAs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 14:48:53 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254fa663bfso301724566b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 07:48:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789051729; cv=none;
        d=google.com; s=arc-20260327;
        b=k2g9IUZj+Obsg+hnGWYiezw+J+f8jVjXZKxdp4+K+uqiAbHQl7STJQtkOYB+1F0ZnP
         FCnxIEv7qcHRRXCbc79X0m1XBLTu13KOc/a9ax2etaQrsK2FUbYy2t4H/4aRQG6nDKTP
         WoaazZBIUAltoZlNJT70klrTUDEBuJ5UTJ11oDl8b7Ya06szYsXbGu2M59b2tDLOdfrt
         PgMjl0b5XyUEjojWR/7duGl2mU3jj+J6sHUgfvs4OgEwG68nISWpVWU/mGUSfuTmGJx1
         hR7PsYTqPmDJoXWQrlNBOPPfJb0nJZouzsi3vqDsetrOZ82eiplWMqO2lv6R0u7uyA8z
         d4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZGkfTmvcfg2tYgnaJgCLfP1/mFjyPE2KGae6+BF91/w=;
        fh=KXOvVydvaCiwYVzHfJPPWRL9peRhvyOyussGNdw1LeU=;
        b=bdcrWWcY+9hG/gnhOm+M02+n7/+P5gdavqlC7YTRueqD+HwKYK812bMJirFbMpSjvr
         5N16qHkJ739qB/Pv5+5bE4A3sn+j/HJ8BV/peCgR3yQnD3zJm6N3MG+f+UoX7nDRZHT+
         0JftnxOo3LkJbdrSPLPYuOfftwiYQU/wf+DklLI1T3ZWww0haBl/pSTU0c9WZOb2M7br
         MmiZooyOWAUbkTDWn2ZvmWntpbXbGEgq7eMCYHL68L6ofC2j1R10Yhf1HvhXVRsZgfCk
         rLxu4lQRzTROdPLMkTeWoF+Lup953mhRUBdkkihTCKMd/3yb/7WXVuzGFArt8NnvE8ka
         MK/A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1789051729; x=1789656529; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZGkfTmvcfg2tYgnaJgCLfP1/mFjyPE2KGae6+BF91/w=;
        b=dUGSyrl+m1euVAllOEVQzx31t8WnXObaUe1CkBi0xA8ALhZPAo68LTwQ8urMAPRl8H
         4tDmuSufo8Vr7Lktis8bU8TnIFkyoMSesKyk/c0AyrxwV722OLMfSGVbnMvXpnOND6eF
         tqSExZ5xzclxSPkfFM/pETJK/TitkBmhS123pH1C6qqp9BeIcDDYnWL61m23hlzdmS/+
         KYz8idMqQgYmJFMajEYx6It/lm6qYY3uXXcJ3WiHvdEC/J6thC5QEKYOEnY3V2A4VW8z
         YFHPlhCKcIzfU6XQ5I/8TNt4BDjtoKi1vJ7XP4xVn1RUUwYRfXqw2gufDx90wsVA2F1e
         kdlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051729; x=1789656529;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZGkfTmvcfg2tYgnaJgCLfP1/mFjyPE2KGae6+BF91/w=;
        b=nbBXfuMl9FKIN0OCdZxaxZh19w4VCv4nJmW9IDxNdzdjOCNMAWk8lpRrwn0AzzytRV
         zG9bAPa7WoVjnTDG6FOUT9zjAdr2CFaqPXAip32KmLArjlIYulXozyQJ2q+dDjJj6xoU
         Tk7Po70gB8f3u8ZVv8LNExZ7LTi0kwhw8C2Dpo+vTyLE6hsgHg4G4nXwDT52QjYlJQmW
         lZmcNlj7I20ZkMCexTirVdYpcCgHh37zsYoPKRO2LRbhb0sIFx+wH6EkwMNH8VtELi9C
         Z2CTzI1QFCTyyypYqNfJmINUivBhu9jWNq8mVMI1jIoU9pJEKvLAJ4dZkXf6+UnRpAx8
         jvTA==
X-Forwarded-Encrypted: i=1; AKwUvByJy2M0NK/IGA2aZIlWA6rz58RWcCXxUUaVaF+/L37EpUb6aCgiTNoPyTlMOO7q5S/1mb6xvLuh0BhvbDiFmN48@lists.infradead.org
X-Gm-Message-State: AFuF++nBr+fZNrmXjxJwLwEn1rJNOk09XO/sFJYoK1qrH8aGPSm/tevg
	nqm5DJVaJddB27AqIjbpf2T19ZFd0BoaLQiGMCuk2Wb0mCxQv6P2unC86+3oNy91QenaIAnuAG9
	+70QUz0Up2sFNpU+gKYDM9wKhcI3OlO41Jboff9RZDw==
X-Gm-Gg: AYBFou0SiuCIOuXQuLQw+16kQYzU7JKm34Z1G3bYjSapkWGP8GXFjEU3GFPPf2FJvo2
	sUHdxpFgEHFCassJ2HVFH9Xyx+5SBWDnoNsI+Mhc+qijrWMlceUjSKBL01rvJw2rsfAdxjwdIfy
	2xHe1tszJ8sCuvrUNiQ12Q6lT2EgzzKR3IVu5UP5Ztk/cUiLIdxEHnxGzRTdn2uVu0L0ne+IgNT
	gzkOEtlnhJ3cfeo+5zF/DR8RfGy5Hi3Giq7l1tiIeTb04c+U4T1ArePrQLSYKwdBb79LhjtmJOL
	s+4JIAOBhqRWohbyUaFLYw8I1kJBF1H1D7HR+CJRqYliiwd4AswJPp6ngrfFd4LTX68iNM0/FBw
	S3KsnSWwoFgikg2k790SYF2vJ
X-Received: by 2002:a17:907:c5ce:b0:c25:47a4:fedc with SMTP id
 a640c23a62f3a-c29418b652emr491393166b.2.1789051729432; Thu, 10 Sep 2026
 07:48:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
In-Reply-To: <20260902-rk3576-otp-cpuid-mac-v2-0-e4b7fe2ab13f@flipper.net>
From: Alexey Charkov <alchark@flipper.net>
Date: Thu, 10 Sep 2026 18:48:33 +0400
X-Gm-Features: AcwNN1UfoxjgFqkNtB6Aosk9zTLZTrJucLfz7oY5DTmBgBUsxij8crpGNXoG4yA
Message-ID: <CAKTNdwH9QAgreJ-6+t1j_P1di4VyoMBSsFkf_g=mCi_-M8g9Pw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] nvmem: Derive Rockchip MAC addresses from the OTP
 CPU ID
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Michael Walle <michael@walle.cc>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_154851_666047_E265AD2B 
X-CRM114-Status: GOOD (  28.23  )
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

On Wed, Sep 2, 2026 at 5:08=E2=80=AFPM Alexey Charkov <alchark@flipper.net>=
 wrote:
>
> Rockchip SoCs are shipped with a unique CPU ID in their internal OTP
> memory, and Rockchip bootloaders use it to give boards which have no
> dedicated storage for a MAC address a stable one anyway: they hash the CP=
U
> ID and patch the resulting addresses into the device tree they hand over.
>
> Kernels started without that fixup, e.g. straight from the SPL in Falcon
> mode or by any other loader which does not implement Rockchip's derivatio=
n,
> fall back to random MAC addresses which change on every boot.
>
> Formalize the derivation in the DT binding and add a Linux kernel driver
> implementing it, so that a Linux image can use the same stable addresses
> regardless of the boot flow.
>
> Only RK3576 is wired up here, that being the SoC I can test on. Other
> Rockchip SoCs keep the same CPU ID at a different OTP offset - 0x7 rather
> than 0xa on RK3588, for instance - which makes supporting them a two-line
> addition to the driver's match table plus the layout node.
>
> Patch 1 is a prerequisite fix. The OTP hardware has its own internal stat=
e
> machine which only works correctly with serial access, but the current
> driver serializes nothing, which results in timeouts and/or corrupted
> reads (e.g. returning splicing a TSADC trim value into the buffer of a
> caller asking for the CPU ID, or mixing up trim values of different TSADC
> callers). Hence the Fixes: tag and Cc: stable.
>
> Cross-checked on an RK3576 board: the addresses fixed up into the FDT by
> U-Boot match the ones derived by the new driver, and the driver correctly
> assigns them to the network interfaces when the kernel is booted without
> U-Boot proper at all (via Falcon mode).
>
> Sashiko also rightly pointed out a use-after-free in the nvmem core when
> a layout driver is unloaded leaving its sysfs nodes and the postprocessor
> function pointer dangling. This is fixed separately in [1].
>
> [1] https://lore.kernel.org/all/20260902-nvmem-layout-unreg-v1-1-2d16bebe=
b518@flipper.net/
>
> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> ---
> Changes in v2:
> - Switched from a scope-based guard to explicit lock/unlock calls in the
>   OTP driver to avoid mixing styles in a function using goto error
>   handling (Sashiko)
> - Link to v1: https://patch.msgid.link/20260901-rk3576-otp-cpuid-mac-v1-0=
-ea9135270fc2@flipper.net
>
> ---
> Alexey Charkov (4):
>       nvmem: rockchip-otp: Serialize reads

Incidentally, patch 1 of this series also fixes CPU thermal throttling
on my RK3576 device: apparently, the mis-read OTP-programmed thermal
trim values broke the thermal governor logic, which now works
correctly with properly serialized OTP reads. So it would be great to
have these merged.

Best regards,
Alexey

