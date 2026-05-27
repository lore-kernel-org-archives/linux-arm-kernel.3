Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02394CD6E43
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 20:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLf0B2lXTuAagcE2zAxmwrn1wv9oh/0KxMyx/SOt+9U=; b=blcArPJz3H4FHX9TKH3lsqqhGP
	BW/IoygB4UGe4kZkbJYfxKWoh8n3Y/Di1H6mGXgq/2Tr/Qbh3dQ0uaNSvp6wnmE7wz2zwloiUS1bU
	mc1iFQZsByypB6mYfz5humCBe7RyddhNGWDa4lQtU7iWQzmcz0jU/1Fvcr1drI96STg3/cu4YM4mW
	IoA32FUXctdsEUm7HD8mXr/8YPbV0BfziRAp5P4/2RWViB5Sgly+LECrdHeUQlhUQBR5dXo2cS4iT
	Q0JtiQAIncvTB57Z11zLs0IjKXntyjjYQGbEAD78mdp5UX/PHANhTLaRjNtCoZ5dzyBre9bC4wPxy
	SdZCe8lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKpc-00000004iMs-2el2;
	Wed, 27 May 2026 20:26:24 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKpa-00000004iMB-1Ltx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 20:26:23 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-68852b58d87so3900668a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 13:26:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779913580; cv=none;
        d=google.com; s=arc-20240605;
        b=ZWt3n8OHl+qoF18KA9MlxY3Um3vs9ub7KCkMFHWuJVpbGV4O0756DM4bHFtYuHqhoG
         ZUIoQIvwkdl6ARNn79PUAjSI6RO6k5DIV2E1Yyl+9ojLQ5Ktu6Tqd9s3+M1X39ShOLxy
         7WbQcRNZblfHt2KPdGRl/mX0jHxeEEyFDfEGsGdp/VcKhU9DoCTULbwED6iLAs9TbhBH
         CPLNhyBCeTVOV5ymVl97+21NHL8Kve3Kh9RIx4NxkJX8C1hF8U8JSrefzYlx8WA9N79J
         qo3zAjPWsyE5pBO5IaGJxvHqeOuHX11CUh+KDT33HlcStwIBkYGirDxon75/kFK95PNg
         aZcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lLf0B2lXTuAagcE2zAxmwrn1wv9oh/0KxMyx/SOt+9U=;
        fh=rkot0zdBnyRqXtlw7wpOCf6y6VJQCH2U+bJLVQDCN6A=;
        b=KcqBRNN+Uddu0J9knQn+JWYzeo5az0p4So9t7o7gBzcWLcoDRJOEHovAt7SwMv8+cJ
         gCFWW3/ED6NP0yVA7ZVxiJLwnuwuFN3zEsiT1+2IZ9oioGx2eVKGlTnGshjtcs0WUP7G
         bZcwFNs3oisr743QoqJMkoKwHjZQkm1ZWzXG1avuQsKooi5j72X3uwySrm5RCG835Vyr
         B3Q+DH08YD/cnFW4hwOG+dfaTRzwdTMZOhzaXcu67wB4TlSq8AL6L86mjoN7FmRD1EXQ
         P+9dGQ31EhFgzSw5STDxaCHBEJro0EuhO1AsJiTMAEDaeMmxdmSdLhSuE5tthRcVwVm+
         ZgNA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779913580; x=1780518380; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lLf0B2lXTuAagcE2zAxmwrn1wv9oh/0KxMyx/SOt+9U=;
        b=HcKIikjs/TDmDShbi6miaFe/41HjI6uX13KZ1MSSjyii9hBAS4j/HWJrL8rZiT2C3R
         MdCI4QgiUT786FPUlNlIU6BhcGiGwYfVHZL8XMLZLGRMmnycQ6tRlWuseUu4zXK0Q63e
         3yCWeZgejYmUMOa5uFjcJttQNx/r0mVvsLBLjADuTtcpL/uc6Qfr9SHjRG7xwaXC2XNc
         zZdfiwSuYTAEIQgrqo9DYOqI9AbV1OlJdmzTr/Hu305Qvo4oHz/wItCHwAcpeeaseZrl
         C3itiCxGmxaqYEOaQVgiF4FhrZlXpWy9gBnbOx1m3urXVOvzDTb4lvlD315Lux0oB1Sy
         +bvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779913580; x=1780518380;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lLf0B2lXTuAagcE2zAxmwrn1wv9oh/0KxMyx/SOt+9U=;
        b=BKYhLpFzjwAsIZXo4bxNMn9ysMnjDkHZmXpTzIToioTYKkU3DhGXXyHKj6OqNfFqeV
         W+4Z3m3MSzWNspwfkL7oxHgpcgLSG1iHLkvwn/trYPcQH5t3r/9uIVGS5eV1Zzk3N0sd
         sBHc37eJXE0ewxM4B5QGOG+TrC/tFkwIaiPFT57vUEOKMa/IsLs4dqPcnH0oF/N9Xvwa
         FcVv3OuRBStNgLKziWQfhXSs9aeS41b3VKScFtPaCOYNa2escFhEk2njMPvSE7HudUY1
         4dsGBn1/5u6g4CPomp/VlMpeiFr20xWLQTOj7y4qHutyHB+m4sw0lz0x/BoQ0CYjMsJv
         wFmg==
X-Forwarded-Encrypted: i=1; AFNElJ9QS+0PG9klO2Z3KQnRNDuHQXJJpkxQidR9dBkcF3nR5almkjYdPnfjP9AUowW89Av3Z1LED/2rzzwg8M2DrFOF@lists.infradead.org
X-Gm-Message-State: AOJu0YzxuGozxIUIshXoNoEaLALZTTXz9qQnnnNMo0BStRfiowQEkKEs
	ekcdtSoQ7dEQNrtA8W383hJoYksW03FM8lO7D8iDX5bBpLHeDj8hHbLnt+Nnc+soYNl6fVeVD1i
	n+9eO4aFlwPhhOTeZhmTCuuzOOrRhrQ8weA==
X-Gm-Gg: Acq92OGBfUHlTWcoamVgB3UM33c+2So8LorEySkWMfbSLDCXfMCx5YzYFnv00D5Q4wz
	zR5BM03nOZyQC3U/2ijH8w8mgq7kKapkcG6K9ul3tFysF4c7QX/LcTvGnQKi6Q3kYfL9DgILdPv
	CPWtW3mojIz6cceGCodMj7k8aoKh4gDEPwdBUSPDotNtGsDLYHPNjkeMzzCCLKGautHZCjU5nRD
	z1gD9IHmqxXLmfB9RiHGBTuwfh6fx9qU6BT+T9Mk73XNqLchYblM1TuiXGiLWHPOgM7ShguUI+r
	TTTGgN64XOrZ2dpTa3Jh3Q4uz+F6MFHIoCO3iq3Ygy6SsEuXdBF9sjQC9rGPJI3zhUHyNeWG9u6
	Nql7OC47nj6w1j8X4jE1WwfJzG1l79mECaHeWB0qIRKpYn8nP0ldXEHwgeI5HaJDKhQTD
X-Received: by 2002:a05:6402:34cd:b0:687:50e8:eb0d with SMTP id
 4fb4d7f45d1cf-6889cc31c6cmr13916705a12.18.1779913580018; Wed, 27 May 2026
 13:26:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260526201552.13376-1-rosenp@gmail.com> <CAD++jL=W-gcheTLgfJvFU4CBeHkxQ5gcwbzQA10PNE0eP0=nxw@mail.gmail.com>
In-Reply-To: <CAD++jL=W-gcheTLgfJvFU4CBeHkxQ5gcwbzQA10PNE0eP0=nxw@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 27 May 2026 13:26:08 -0700
X-Gm-Features: AVHnY4JA7Bib_4ETy4nwVSnN4xa4_8TtiQ4AHOQlz8ur560fNiVMHeOEctwVadk
Message-ID: <CAKxU2N_UzRaaG7GU4G2utRiNcdWTL6GCQuYWnhXd_jOHAiMOFw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: ste_dma40: turn d40_base phy_chans into a
 flexible array
To: Linus Walleij <linusw@kernel.org>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, 
	Frank Li <Frank.Li@kernel.org>, 
	"moderated list:ARM/NOMADIK/Ux500 ARCHITECTURES" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_132622_376359_228AB35C 
X-CRM114-Status: GOOD (  17.37  )
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

On Wed, May 27, 2026 at 3:14=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> Hi Rosen,
>
> thanks for your patch!
>
> On Tue, May 26, 2026 at 10:16=E2=80=AFPM Rosen Penev <rosenp@gmail.com> w=
rote:
>
> > Convert the separately-offset phy_chans pointer to a C99 flexible array
> > member at the end of struct d40_base, and switch the allocation to
> > struct_size(). The log_chans and memcpy_chans slots continue to live
> > in the same allocation immediately after phy_chans, indexed via
> > base->log_chans. This removes the hand-rolled pointer fixup that
> > recomputed phy_chans from base + ALIGN(sizeof(struct d40_base), 4).
> >
> > Assisted-by: Claude:Opus-4.7
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
>
> OK!
>
> Please add
>
> unsigned int num_phy_chans
>
> > +       struct d40_chan                  phy_chans[];
>
> and
>
> phy_chans[] __counted_by(num_phy_chans);
Not possible here. The allocation allocates space for both phy_chans
and log_chans. To do this I would need to split up allocations into
two. Not a fan of that as two kfrees and two allocs would be needed.
>
>
> > -       base =3D devm_kzalloc(dev,
> > -               ALIGN(sizeof(struct d40_base), 4) +
> > -               (num_phy_chans + num_log_chans + num_memcpy_chans) *
> > -               sizeof(struct d40_chan), GFP_KERNEL);
> > +       alloc_size =3D struct_size(base, phy_chans, num_phy_chans);
> > +       alloc_size +=3D sizeof(*base->log_chans) * (num_log_chans + num=
_memcpy_chans);
> > +       base =3D devm_kzalloc(dev, alloc_size, GFP_KERNEL);
>
> Please describe exactly how the ALIGN(sizeof(struct d40_base), 4) require=
ment
> is met by the new code?
Will do.
>
> The phy_chans will be read by hardware which depends on this specific
> alignment otherwise the data will be corrupted.
>
> Yours,
> Linus Walleij

