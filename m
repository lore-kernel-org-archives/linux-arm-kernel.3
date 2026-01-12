Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA71ED25032
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 07:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gYDs2WdHiWHfUSPlGjz43iM5GtvJMWzLlC06mLGN8Q8=; b=KvBmQ38r01vUF0D15Z2xSCt6OJ
	Sb6oOismoURkSAkWdhYBscrCTxB1XUwENkAkEUhtREJ9afE4QfytLCEdLR+PBv/dpSVfdQulL5lJE
	FfF4qUPGx6DeqvXDojcbWVRO1pvlYe4JxYrEmXJnlRHeO1IDwyuuXSdb4WSrvHYXmHz9ouvfAMhwE
	yUOOtm8LRnup0zu3qIJT/668ck2fzyP/Sa9zn6z6F9S2/ncNexySy11gIiYz8mEYGYz9Lzq2m+JeH
	Z0aJdqtc5/ax+MwAB23/JtYH0bHhzmEQKBTmxH1cN3ZD/Pba28S2A2S9GBJC6ObmWux+9GNAp95/c
	qbZjNTKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCg0-00000004vSl-1I5M;
	Mon, 12 Jan 2026 07:49:24 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCfw-00000004vRf-2VqZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 07:49:22 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-59b8364e4ccso3032246e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Jan 2026 23:49:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768204158; x=1768808958; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gYDs2WdHiWHfUSPlGjz43iM5GtvJMWzLlC06mLGN8Q8=;
        b=YFkySDSZqoNpOszAy1BiDvLd+u7t566Zn12keZL/xcem1O/H5J+AEW6Pe2TGUSZfK9
         UvR26gCNLh4H1TLofWDPUzN2HrrT9JbO+PonZeIXjK/GFONLN7RZF0JsiibHYtcftYAB
         VeSEPn+uKGHs8OkWJ1KxPfLHj8dqa7Vg8ezMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768204158; x=1768808958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gYDs2WdHiWHfUSPlGjz43iM5GtvJMWzLlC06mLGN8Q8=;
        b=bCfKPOStUPbTcE+xtIbvyRD8z4vCVpt6QJigtETTEobikkUnkaP1pGlSvWYlztJ7u0
         AcNzn6yYW5VU8HqJU2PaunTrUp7eftJx9Fg3Et177867AbPhxR0J9maP9T1l73jSkitw
         j6UEYvqUDDLZDHlDWiG+ap7mXBXNhTRR6g9fVowfp1EMfAM1exmaW4+RgkoUjmkpbCZr
         bwULPW3UXp/rSnc8RHlM81vmpstucpnBsApE1hEBYX96okXA6NL0EC1BJnP0/HwON9ur
         7RHyc3fbGe0AKYpD7MVG6b3UGQ60ToPvLGjm9PowRRc+d6dYTG78mlePxOe4DpSmRmuS
         RQww==
X-Forwarded-Encrypted: i=1; AJvYcCWDvxFuiNjUN96uZjn5cSpyXdJJ8Y9ikqDbb65yMRx6f1XsbY+UOkgoOfcFk3mK05lE+0+wWNhijQfELcuZn5Fq@lists.infradead.org
X-Gm-Message-State: AOJu0YytFRYJPpHuHsOndFsQugABCnxQbQVqijEj4Kkhh+FRa3H1Sh0u
	OShMh9rpRgfhp1wGggjv4rVCci4WDHLz4K9HW31M4dUVjQJPuAaZzEcxYrNZPOwR5uiQA77/BrI
	SiwxDkNLvvvhKdmPzuDU7cOjHkXG0Mpt6RvLfVEHr
X-Gm-Gg: AY/fxX7rk/WJ24gYAjxcYTN6JNPvVvOscBn4FEzJ/AoXopV/sVkSKqWIuko9d6jX+F+
	G9KuK0n6DvXpXHm1lFHQRg4YpuReQIu3D1MFQZMAfSfKF/9dsTCYLn8ReSsFCc52oNkthSynkvC
	tzDsWir1mRqHAv4VtBXK3g6qsYwlnUFfVsLDyZJNhHRA6Nu0qQHZNmYCEomvjdKh6+9nt9wVIwy
	TuxPennkux7ROCyHo+9lmgSW2u3MGT9eQM288FyQDs417IP+Ny850SRCLgRGges7xzDxRbeHDAX
	jVYSOIRhpVfkfAEegaORLwgu
X-Google-Smtp-Source: AGHT+IEPf+ctffeJf140aoBJ00YAyEVGjUL3Nj2MAQoRL4lkX+em1WFVdY04W2EZPfOEZSq9xL+BIPkSo86C36EFZlU=
X-Received: by 2002:a05:6512:3da9:b0:59a:1a4e:c098 with SMTP id
 2adb3069b0e04-59b6ed134b7mr5017113e87.8.1768204158184; Sun, 11 Jan 2026
 23:49:18 -0800 (PST)
MIME-Version: 1.0
References: <20260108143934.69634-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260108143934.69634-1-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:49:06 +0800
X-Gm-Features: AZwV_QgjsDK-32UNI1Kj8KhdJKQno21ayqzxpgGCeVRe3qKhTwXnm4PxxIOLkUA
Message-ID: <CAGXv+5EvWVhRXoxLbsV5G7DEWLnVGRMCC1Qtd02fD8jh35VRqA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: arm: mediatek: mmsys: Allow single
 vdo/mmsys endpoint
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_234920_698481_903D42BC 
X-CRM114-Status: GOOD (  11.11  )
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

On Thu, Jan 8, 2026 at 10:39=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The hardware supports using just a single output while leaving all
> of the others unconfigured (disabled), but the binding did not
> really allow specifying a single endpoint@0, because in this case
> one must either:
>  - Call the subnode `endpoint` and not declare any address and/or
>    size cells; or
>  - Call the subnode `endpoint@0` and have at least one more other
>    endpoint(@1 or @2), and declare address/size cells.
>
> Allow specifying a single `endpoint` subnode, without the `@0`
> implicit suffix to suppress warnings happening on this kind of
> valid usecase.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

Looks correct to me.

