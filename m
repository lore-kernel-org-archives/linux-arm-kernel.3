Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAA2F532CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 03:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X3n35LNNeF5Wx2GIr4g4uUmRoFWbzxVfDULULORcx74=; b=QeRTTn+66SllGhL0+I7wKSP4ik
	gSYsEs1M4J7hKhSzwNsDK6kQrlGpnPXoafJ0vBtapwCKu4nZzRz2demt5H4TVyRWBSpThdArEcx1h
	/hzV15GjRhwOz8MerhQUY/favgiE/+cbBGse4QU4BoLLcSbg5kO/+bH8zF/1HKuc+BKsQlsKoNy1V
	l78S+1R9CJDyozWVqnDZzcfR5+6ZzuL5hRvoL+oiOja1epGywBvFMg6DFTx53UPCZ23Oy21qJdeA5
	wFeOuPCOiLfNr2NbjAfc4ZzapZu2l/1zIfbxfXTvGnzoC7uJFauJ6U6N7qWNCY4T8Lz0xK7+lRbMx
	8WOwSKMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sfA-00000000VIf-2CcK;
	Tue, 24 Mar 2026 03:42:40 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4sf6-00000000VFm-3jIk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 03:42:39 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5a12cd0bcd8so4382249e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 20:42:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774323755; cv=none;
        d=google.com; s=arc-20240605;
        b=Zj43mU921i07igWgda0nE1nLRKl/+4SlGhBlBwZGPUK07R1Uz18yJnL7G7Rsv042MR
         jPz98M6c1Z6JDonIg+/rf0AUbyZsgL3nNtLHW3e+qSo0g3ZhET1saRSiS0Et4xqvVwty
         3JT2nLagKqFcifaZC1hixvKZvPb/0sbnXk6c6xnO48VmQ72LZ+SOAVYOmorVpv6o4p27
         mseZty2MrwNkX934F2HSWcUaa4mB4lf4WzLNsGdcjyZClhp+wCJCyCCTU5HVsELL+2ur
         R05QiLSBauSny61L85Y123XljRVN+CSAWSwuBS79NX6jmHHw/0hx9CGB1IBP1hdVsVWf
         Ce1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=X3n35LNNeF5Wx2GIr4g4uUmRoFWbzxVfDULULORcx74=;
        fh=YkDzFZ126lcA1Y+4rdMffMm0Osaf6Xio0yTvoGH5ncE=;
        b=VtevR0P40pryOY6T11pGMdLlMZGb3PvY2hxyqZQyYLewAvJNHskT/ne+sKv0bn82Y8
         TpLfgNKoaZRu3+/pIyw0GyCcqcvwVZ5cmIMm4eaE6GXxltYqd6sR5s16AFXuoJEjUS/2
         Cha1+jTAdUMJ7LnlyynebaO3KwpTBCRN0D2bGHBo1kZsPyAwxDNB7294hBLpCDB5GDr1
         /hB1P46J9L8V4Ow/SkzY/A3H6Nh8jmXGqIrjTedwEhsyw+wqvjR8dzot0US7Ra4IbdSw
         CnfvFQvnj/M+JmZx5rvfK936aaGVj2om+3Gphg1HSVU5fCxUtnSNDuQjVgQepWaXXwYn
         I3Nw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774323755; x=1774928555; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X3n35LNNeF5Wx2GIr4g4uUmRoFWbzxVfDULULORcx74=;
        b=oW1MdO7KboV/p6hCsfi6XDwu75lQFDHWCEiaV3ObG29SmvrkOHgMB2oLhzIJOnghSg
         Aff0TY47vtf82Wz5gTgYMSo/da5oK2v1RDbGtqB9iJGpgdiV6L6ETxejjxrxCnogCRpi
         tNfhuYtZrQbsFqO+Y7FVk1WTNsme1jZwJF0BQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323755; x=1774928555;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=X3n35LNNeF5Wx2GIr4g4uUmRoFWbzxVfDULULORcx74=;
        b=j0Rdft+6LVPSdmRkbZfhbzkxZbUfV2J4Np5hJA6NOF9TIsrpyoAK/ueX+notdL5dpP
         8gp+WxUaGf0+785rOVkT4PLzK559ucOPKp11KHqfTfrnCgIGA5bbuz79RyDLlKq7ZByd
         l/1XupK2APPWQbZzDcjK0pheXTCoPZ8aivyu1nfvKSh6qwAvrepgrXPWI1xYM6bhUiuv
         tYBAOWUvn2E9z2styEF6xYff4CjC2FGKT6t9c6gzTjLW9DPWRoZEt0g9O/XZKlJAkGpK
         0HD633RQTns9iNdVaDQU/oLzGVN9I6P18+5ISnLJ+5rwDnQjtPz6UxBrShmYRkh6fmFx
         UuMQ==
X-Forwarded-Encrypted: i=1; AJvYcCX84Gge3kZrgRFD0Wt74fGtEv2ja1ScbBWyhRjBsrIN6S81ZqveMRZbrIIwl2WlEUxF34EgjUfMOFGQgS5X8M7k@lists.infradead.org
X-Gm-Message-State: AOJu0YyYr+SErwRvVq9uC53HK2OIxR9CLhIDmwW13lnVRJtZil/mVPgP
	GOqfsl/H04EJgKzY3tVEPfFZhvslQL74EEIwEm5Poza43IHcT2Xa3Bf0fihwpHnkXOWBQn+TsJk
	ONU0r7Dd4yj6hm58LyN+JUr33UW7qqOTyywz3E4Oc
X-Gm-Gg: ATEYQzxzV2TeulpUElYhpQlMj0JSTd8OJUrxs4/kgozm9ufV8zR7TC/dTHKZ6A8X1at
	P3tU/mOnVEKV8rKvkoSxsbYx70CkttRE9VJ5SZpH++543HVkCf0KMAZqZmB0J+S3mq4871ab1Xi
	NMj6u6t67+e+FGpe2flEDjwfC9DVV2jLj4UIzhCGy3cLWJONDwej6atWU5eggngYYnkkQnIL5V2
	K3UZand2VH2DJh2Xu8vkBZtHest+QPpnhLYeFGpYcMUQC4ujdRu+FT2wNpIByxsf7gq9X/qIwAc
	gvsFs79lwQ==
X-Received: by 2002:a05:6512:32c6:b0:5a1:44ba:c96e with SMTP id
 2adb3069b0e04-5a285b6db31mr4580171e87.38.1774323754655; Mon, 23 Mar 2026
 20:42:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260320072440.2403318-1-wenst@chromium.org> <20260320072440.2403318-3-wenst@chromium.org>
 <20260320-dashing-crocodile-of-emphasis-2cc43d@quoll> <CAGXv+5ESnhsVfu5pWf1DEt35+10ZKTgJ5G6DuJC4s6yEpRH_YQ@mail.gmail.com>
 <e14ae934-e448-433f-987d-77bede5f6d07@kernel.org>
In-Reply-To: <e14ae934-e448-433f-987d-77bede5f6d07@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 24 Mar 2026 11:42:22 +0800
X-Gm-Features: AaiRm52CNgLAlXeiRcCcd4-xI1ROYPaycCYYMcNwH55Sc_4mMYJ7m6m9CPgV9Vk
Message-ID: <CAGXv+5FhSsq2FtieUm+jKTZ4+Zes5TO9gD-a_rHgOzY5kTOB1g@mail.gmail.com>
Subject: Re: [PATCH 2/5] regulator: dt-bindings: mt6359: Drop bogus
 vcn33_[12]_* split regulators
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_204237_024062_BBD5C065 
X-CRM114-Status: GOOD (  30.93  )
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

On Mon, Mar 23, 2026 at 4:31=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 23/03/2026 09:26, Chen-Yu Tsai wrote:
> > On Fri, Mar 20, 2026 at 5:54=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On Fri, Mar 20, 2026 at 03:24:35PM +0800, Chen-Yu Tsai wrote:
> >>> vcn33_[12]_bt and vcn33_[12]_wifi refer to the same output. There are
> >>> two enable bits in the registers so that BT and WiFi drivers can togg=
le
> >>> them separately without any coordination. If either bit is set, then =
the
> >>> regulator output is enabled.
> >>>
> >>> Unfortunately some of them are already referenced by in-tree device
> >>> trees. To keep backward compatibility with them, keep the vcn33_*_bt
> >>
> >> So you drop "_wifi" regulators breaking the ABI, no?
> >
> > Indeed it is a breakage. I kept the *_bt part to cover all in-tree
> > device trees.
> >
> > But the representation itself is broken, as explained in the commit
> > message.
> >
> > I leave it to the platform maintainers to decide whether this "breakage=
"
> > to fix the broken representation is acceptable.
> >
> > Note that there is a similar issue with the *_sshub and non _sshub
> > regulators: there is only one actual output for the two. I'm still
> > asking the vendor for hardware behavior specifics.
> >
> >>> regulator. Also combine them for a shorten regular expression pattern=
.
> >>
> >> Instead the duplicates should be deprecated and driver should still
> >> support the "_wifi" variants.
> >
> > But it doesn't really work in the driver. You cannot set different
> > constraints on the two, especially conflicting constraints, and expect
> > them to work. And if you set the voltage on one of them, the other
> > will change as well.
>
> Of course, but now imagine a DTB with only *_wifi regulators and no *_bt.
>
> >
> > If we want the driver to support both with _sane_ behavior, we would
> > need to introduce some sort of alias lookup for both reading
> > constraints and resolving supplies. The driver registers _just_ one
> > regulator, and both DT nodes resolve to it.
>
> Yes, either alias lookup or adjusting the regulator_desc before
> registering them, depending on the nodes.
>
> If I understood old code correctly, the point is that ABI allowed *_wifi
> without *_bt and this would be a working setup. Now it won't work.

OK. I will drop this part for now and just add the supplies. I'll
resend the cleanup once I figure out how to do it in the regulator
driver.

ChenYu

