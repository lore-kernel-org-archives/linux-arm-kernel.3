Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0DECF259E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 08:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C8vU/bXiUiSX+XlUElJe1ZIOtLsB+Q8+itOmUp+Ohro=; b=ysQfEeAvOmJU021eFWkhmWuf11
	3PvVOh9iNkdPDXxQvcdNCWYIOVvfytag6stepQAE5lzJR93D9L8FSjKLpQChFZPTwupVIWqxdbCtF
	SfuNCZPXw2pgXyoyjMupXggQxoaB7QvJrC3u0lrnJj7DIFFXJHtcmfQb5mcaIPcXcDNWgo7JdsTwq
	9EW2XG4oPhnocM28pTWMshD4W+n2nmzaCpYUhTh1PACHuOHioa1l4RN8e60cQ9HgLvpGYPo9Ib9SY
	RTzxx/Dl6sccMFl5iuvbFaWplXNa6bFHjI1MzXcWxbh/Yq0FGs4bpsS4WiRnvaVbycnae8ECS4fEy
	lL/ozraQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdxc-00000002pC4-0lor;
	Wed, 19 Nov 2025 08:54:44 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdxZ-00000002pBK-1wOP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 08:54:43 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-37bac34346dso38507151fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 00:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763542479; x=1764147279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8vU/bXiUiSX+XlUElJe1ZIOtLsB+Q8+itOmUp+Ohro=;
        b=aywkRloun2Sm05P6HbnVvsNHoVjxUAMZq6ahiuy+0elgXnauRDvn+evCb6wDF7gCCA
         KdOKvH9uSAIbkDepCzW6Risiom2ZT6jSKD6ScV8L+PBp2RFFQHQkANsuuy7p8u+TD7Us
         8EOgLUsp0LiRlMA8nOlcdEDrHO8yBWaPSqcAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763542479; x=1764147279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C8vU/bXiUiSX+XlUElJe1ZIOtLsB+Q8+itOmUp+Ohro=;
        b=AKBImmZeWRBV9mF/XBQjFTXRVchtCOp5w1UmYKXJnqbYgBvgDz65saF/cN5dkF0zHE
         gwBppl1Ymq66IKlpNH2lNC4m/O4jqDKc7e6DmcxAblYrhjfAggSLGAk2XGf0d4mz/YN7
         V6XtRMHx7rQ4jJVO2wAZ2e7A6qXebxXE8g3jBumfcne7iD48gi9PrqDfj0vn/13Mj1ON
         u2CA7pVdn71rohnCCmEJwDMVKsDCyS3QTL8ZJrWP4QAnr3Mi1etnMoi/k5HEwDCbYvnK
         zN36WoQUxlf3G2OCa3E2wIwEhCh4AzxZhgN47GqCfICJzwtqozN1a0knaKTLgjokqygB
         XrvQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGkQqAxTEUL1NqU2Y6n2V7S7QjPwaNy1J4OuaiyNwyivWAyknaBaYDiDOHpC/t3P18op+VVpE3m73YhctvzIHD@lists.infradead.org
X-Gm-Message-State: AOJu0YyfbkS8/uT6ybyh7OwBm4NwBHQftZnZd1uoLXEKNoY8ONWyRBtA
	23IzmlFaCFQLnPVR9yaJ34kpXjSF0rPucDO8wNqnQmu1lXCFU0Nt1tbRhCzEh1XPptMRrV5FLXZ
	F+uHj80yHgZBonqrlMAiTYwdTrourX7z4VFXO32Jg1U6u7Rxe90Y=
X-Gm-Gg: ASbGncub+JnO1HOmkwYXVlBVXPAp5a6cpe/z6sR0cCocnty5cgbmfc6bf+wn8ZdeIB0
	GRz1LOhCiRGN9O0v2708Uqx+LTYFPvb7UHyoMg14P7rpzzVX+UXqozNS2dGYMvr1bq/RCHbZF81
	7adJZHWbVKieozY9fxr1fycZ4Gq8sKL6u8bfY9G/RSMHfgNL0dQevDaBX1c8ZSmnVKvdsKzEX5J
	4hQzA+lEIIW3Xk4TWGiwGAVA2r2nDXDns+1nv9xGjryrUweeLzgfi6Ti+KvFItmckbYWvkNpdPu
	VBrPsi3zq8B1xpigqbS8c4ynaA==
X-Google-Smtp-Source: AGHT+IFhlPMrRvpqdsL1dRrt5/hvTvDt2HQaw6mOPpwq4Z8rWgeUCX2QlUWOEDMbkLtDd/Z5qXCyPQTzgWFahIEpLfs=
X-Received: by 2002:a2e:a00a:0:b0:37a:4085:c83d with SMTP id
 38308e7fff4ca-37babd5c8d9mr55521611fa.29.1763542479298; Wed, 19 Nov 2025
 00:54:39 -0800 (PST)
MIME-Version: 1.0
References: <20251119071126.1719405-1-wenst@chromium.org> <18342493-54f9-4e5c-be05-568a3026663e@kernel.org>
 <CAGXv+5EnfwRA1SMvt=3n7gj1gS3BndXKNVfmfkC=y6n2A3VsdA@mail.gmail.com> <d8f3eb00-c7a6-425a-9e69-a01bc3532f0c@kernel.org>
In-Reply-To: <d8f3eb00-c7a6-425a-9e69-a01bc3532f0c@kernel.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Nov 2025 16:54:28 +0800
X-Gm-Features: AWmQ_bnHnfSc8wAlhe_rBr-TemtbkaVyA6tPaH5I_09BBzsfr8kvP5fgv6NpHVk
Message-ID: <CAGXv+5HePVim+-fx0bG-geBHp3kLQbNGLyknGRx=LgLZ7H+DUQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: firmware: coreboot: Document optional device
 specific properties
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	chrome-platform@lists.linux.dev, Julius Werner <jwerner@chromium.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_005442_055348_7EF47CC4 
X-CRM114-Status: GOOD (  22.39  )
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

On Wed, Nov 19, 2025 at 4:13=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 19/11/2025 08:32, Chen-Yu Tsai wrote:
> > On Wed, Nov 19, 2025 at 3:13=E2=80=AFPM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 19/11/2025 08:11, Chen-Yu Tsai wrote:
> >>> Coreboot, or the ChromeOS second stage bootloader, depthcharge, will
> >>> insert device specific properties into the coreboot firmware node whe=
n
> >>> there are valid values.
> >>>
> >>> Document these properties in the binding.
> >>>
> >>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> >>> ---
> >>>  Documentation/devicetree/bindings/firmware/coreboot.txt | 9 ++++++++=
+
> >>>  1 file changed, 9 insertions(+)
> >>>
> >>
> >> TXT files cannot receive new properties. You need to first convert to =
DT
> >> schema.
> >
> > OK. Let me look into this.
>
> After the conversion you will hit another problem - you need vendor
> prefixes for these, because only generic properties can come without
> them. Otherwise (without vendor prefix) these would define the type for
> all other bindings, which probably is not what we want.

I understand the concern. But given it's specifically under the
/firmware/coreboot node, which is inserted by coreboot, doesn't that
already serve as a namespace or vendor prefix?

FWIW the ship has already sailed for naming. The first three properties
were added to depthcharge [1] and coreboot [2] in 2018. The last property
was added to depthcharge in 2023 [3]. That is what has shipped in immutable
firmware on ARM-based Chromebooks since the RK3399 days. The coreboot
change was presumably added for other devices.

This change only serves to document what the firmware already provides.
Whether they should be grandfathered in or not doesn't change what the
firmware already does; it just makes it more well known. It's not going
to have any effect on validation either, as the properties are supposed
to be inserted by the bootloader, not added statically to dts files.

Presumably we can update the code to use a new name, but we still have
to live with the old names for up to 10 years.


ChenYu

[1] https://crrev.com/c/1028728
[2] https://review.coreboot.org/c/coreboot/+/28104
[3] https://crrev.com/c/4975217

