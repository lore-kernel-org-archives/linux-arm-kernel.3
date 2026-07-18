Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C916C44520
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 18 Jul 2026 11:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jA614hcDkr1x/8k5i0HFdOVHmUkiD3T4/89ZLATA1s=; b=U0XJ7aoddOfm4Qp8t1Aum6Y6pG
	RRk+bNtWCixwnvAKOAszMuTWbj7OtJycXtiU8HVsIA0rwuy0wNI7LsK8TDwjYawE3QfI53rVNNbOg
	4n36X0L1PBhjUgGZlxl8KZ0VdUY82VsBLguUG7nwPj4/k8NpxJPpOxXm7bZrHDMiWGe6T0PUv5NmS
	H/zWVeTVlNQ+mcWgc2fiflTNxi/1gJUVL+COBiFzVIeSBZh1H/cZnvBMEien0wZJAbsXRUiyFnETX
	7t5JSGHdY17WmzfEEDhHjr0jU0ow+HgGt48FFuI9nYSc814k6GyYIxCA2PNrHI405hUb8TVkf3vn9
	XPf2mh6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl2yG-000000042Hu-3mmd;
	Sat, 18 Jul 2026 11:12:41 +0000
Received: from mail-yx1-xb133.google.com ([2607:f8b0:4864:20::b133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl2yE-000000042HB-2XYe
	for linux-arm-kernel@lists.infradead.org;
	Sat, 18 Jul 2026 11:12:39 +0000
Received: by mail-yx1-xb133.google.com with SMTP id 956f58d0204a3-664a5193741so1082409d50.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 18 Jul 2026 04:12:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784373157; cv=none;
        d=google.com; s=arc-20260327;
        b=dFxsLkC4No5H+QDxmTSHxrt14bhAkUZHdJDd2+4UP4SmKaJ3da0jlQwlPgvPPl6ejr
         ScjtYvPjfIvXjnB/UQqkNU38Ld30gvRNog/SDxKwafwuP7ax0nrFBaj+4WdFl+54xgC7
         RETi8SatuBbqhShOtCL6/00opWjfqzwSC3YtwTCK5IXRgHJCrKeQYAoAIOhFlGwiEInC
         Sc4sy4GLwts9YCW4TSs1rrg4wcpGiOf/Ek830YrtU/T+xgb1hwoGWtdLriNcibv9p9fz
         LLEM4t6Pt+Lotnf52uJdjE5QlgDVv27GnSocjcz6fO711/wjTnCP1p+bF2l0gLVeoVhf
         ZFhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2jA614hcDkr1x/8k5i0HFdOVHmUkiD3T4/89ZLATA1s=;
        fh=JQBbuKlqSfG0MsfGNmOMKLGqUO9jvocSuEtNi+SUr2s=;
        b=hxnnsResNI/9sROhzY1lsx84mtwRUOuMS0Zssft0JTVXqfU/4/RQ20uIfKPWXfXF17
         pq4CT3RiWZVRkm0dhEG2NIP4PT0CBw6+YrHh2HZeQzOghtXbqQoLau53lpe1t7tGArPK
         YQ8t7cd56vjzwURaz+KqUbg1QCGyxx3rsVMWufAoPHakJLd90WXuFs0y+eyR5XL3533A
         2+VJjeRQku7kpnJG40FENIn5JMvB0ENgzXXJGfQmp3iUn51Z7uPwpakZmLYipK8Ab9Cg
         L+knCBYCktkIOLyHnztyZkj6GqpA+4n1DtoV+x37bFZG26eXO2GMP1IrYxCUGNuTaOK4
         gwUQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784373157; x=1784977957; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2jA614hcDkr1x/8k5i0HFdOVHmUkiD3T4/89ZLATA1s=;
        b=C42LVnWi8EFquOvmePh7arFM8FFwiA9/tTcPhsdKI/u1awfmFbjK3mKDzBzzqCoy0C
         ThgEeIdlQ9e4HEGdmB0NRQ7lnYFyBRwL7Fh2qeu79Iv4g/cgupCKW/sRqLos+Dr/1+U7
         FmKUAaim+Wxq80mKxlNqbcgCWFsb4xUIgTRavNTGn0Q32Hp18Au+k0HMzV5YzwT/Y16N
         mUXBjtiUSdraLoPxt6UmZy6bl+aDL5w27h9MgGmTHHDrcqqLe9JUcOf5NZ3SR2FUONMZ
         qVnpYkvTpROE3ncZz1Qb2APITkLTw2P304uCRlqWdtbPT5mp3z92yClt+MPneIeuJaHl
         lihA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784373157; x=1784977957;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2jA614hcDkr1x/8k5i0HFdOVHmUkiD3T4/89ZLATA1s=;
        b=oZiCdFqmL1NoypngQXr84iHB6lJgXFiNpqp2+hsoejEle7xtmH0fPGTy110cf90yJJ
         VP/D+VzpEoS9K0CfvnPIcgKrxpy22+EOu/F9PGzCGkCkdw/nQGjVO6rBsC6yDwjJCnPv
         ejeNpiT/Ed97VpjX3ydAt6SzvigDwjkwJypx3sAw5iVOVqSj1ylOmYoX2FQfGevlZ794
         iS0HmjcGVl+IPN9lg4cuE3ZqRhilvs/Ii87vrxJ3lLmNainR6dMCwCT63BD8VFTc/V1p
         W+JIuEblCQxnbMeT5OnvKm7X93hPpdPFYMqwjYrkSL3ZnMZ10jA51GymuxaHdny0vRbj
         t4tg==
X-Forwarded-Encrypted: i=1; AHgh+RrK6mQfaJ1gWkjAHR+s++GuqKCDRbmkX1EiXCFCFr8gFrJ7+fZ0H/zmHzXlPBuCTPdlevL9XbTpNab+oxqf6nvQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzl8YyLZSE367McV5Zd2eoOr+pqjgg+0t+hNQHpJkmb+qEErGHd
	lmeo7Lv6QIRz0IwCVeOmGQYF+pTzhlwV8imYDDsmXfOKG5Yro+tA+9tvN4tQ9EvAXE3zHL+wccN
	HPCIWyOXpvd/b/9nPGY9mUM0LphPdF54=
X-Gm-Gg: AfdE7cnKFkpIimIcXkvd4FLY94oP2AJwI1oTZLDnPCuKPcyFatCysIb+eoUdqrSi3zt
	gSM3jc7j0NVmNDDso5ikV4sypUdtsWVamwLt7OmCmguxCk9oiWqrWkqtacw5bLEvwyHVjdXosXw
	7riI17dCkn7G2czQXAMoRuDOR+9JUFPESFq9k1sZfKmMuB2E7p3q0dBNMixuto9i3nlLssCnnSV
	qbQ4XewgcgMJF+ZD2fzx1rcTB3hDuqXPsmL+AJqz3jx4waUTXxnZzdHGKGUfLKQcLUtgg4TVv7m
	Gj1ezQPZc1EcTajRERM=
X-Received: by 2002:a05:690e:4009:b0:668:3d3e:17ce with SMTP id
 956f58d0204a3-6683d3e1caamr1668547d50.4.1784373157564; Sat, 18 Jul 2026
 04:12:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-4-royalnet026@gmail.com>
In-Reply-To: <20260718085728.6797-4-royalnet026@gmail.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Sat, 18 Jul 2026 13:12:26 +0200
X-Gm-Features: AUfX_mwGRLq_cQ_8jKTIfqRv7vemDXFXO-Pu9-yMhP9fEm6AWXK5YDte3V2WYyo
Message-ID: <CAEWPSH7b=KaVhz_Vhyrbj4mM2KANYSEzXPPqNSj1bW0xPLLRGw@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] arm64: dts: rockchip: add #sound-dai-cells to the
 RK3588 HDMI receiver
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_041238_679157_76D6E09E 
X-CRM114-Status: GOOD (  19.21  )
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

A testing note for anyone trying this out, found while exercising
the series today:

after (re)connecting a source, audio capture currently requires the
video capture path to have been started once -- a cold
`arecord -D hw:...` right after plug-in fails with EIO (the I2S
interface gets no bit clock), while the same command succeeds after
one video STREAMON/STREAMOFF cycle, and keeps working from then on
until the source is re-plugged.

Setting DV timings alone is not sufficient; it does take a real
streaming cycle. So for testing audio, either run a video pipeline
first (e.g. v4l2src ! fakesink for a second) or capture both, which
is the normal use case anyway.

I'm investigating which part of the streaming path opens the audio
packet flow, and will either fix it in v4 (if it turns out to be a
missing enable in the audio path) or send it as a follow-up with a
proper analysis.

Igor

On Sat, Jul 18, 2026 at 10:57=E2=80=AFAM Igor Paunovic <royalnet026@gmail.c=
om> wrote:
>
> The Synopsys HDMI RX controller exposes two digital audio interfaces,
> one for I2S (0) and one for S/PDIF (1). Add the #sound-dai-cells
> property so audio cards can reference them as a codec, as documented
> by the snps,dw-hdmi-rx binding.
>
> Signed-off-by: Igor Paunovic <royalnet026@gmail.com>
> ---
> New in v3.
>
>  arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi b/arch/arm64/=
boot/dts/rockchip/rk3588-extra.dtsi
> index a264001..fa100e3 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi
> @@ -338,6 +338,7 @@
>                 reset-names =3D "axi", "apb", "ref", "biu";
>                 rockchip,grf =3D <&sys_grf>;
>                 rockchip,vo1-grf =3D <&vo1_grf>;
> +               #sound-dai-cells =3D <1>;
>                 status =3D "disabled";
>         };
>
> --
> 2.53.0
>

