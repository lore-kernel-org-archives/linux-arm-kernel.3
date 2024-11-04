Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0378FD132D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 14:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+nWI6Xd/q/LZwmtaLVMw4xyJRrOQePjMO2FUfWARW0Q=; b=ezjntydqzJdlDkGPJ0yOSkjrlO
	tCQ2Cn3sHMfjPHv+d7M0H59EerXhk+7dSLC0huTHsXSpA8e7n59M0UkbnZbWxCE5SpqssbIVda/YO
	V8FCagXuFdzYnUoiMDmxkKPBN86EimC0DLXZlw6J7ObxVZHLwjNIsuA6tQYPQJXa98dCmUEY8VdTv
	5HMofRYO46r5qoF+UpOwdDor4T7dq197vhZNfvtR6C5PGCRqSnSjgeX/whpfnxjsNPaqjugr+3zy/
	wNsWurv3/SYvjehk8WWQkKLDQLaQ6c/7U2W0dIe7fFy+zRJLd/7xbqLAbJxppC9wGqBjiCkauEIU7
	79nwc4Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xsG-0000000E0qc-43ss;
	Mon, 04 Nov 2024 14:16:09 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7whP-0000000Dlsh-3pp4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:00:53 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-539f6e1f756so4231292e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730725250; x=1731330050; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+nWI6Xd/q/LZwmtaLVMw4xyJRrOQePjMO2FUfWARW0Q=;
        b=TSrLY8cER/qEASnlwfRVBg8bICY1n1hjvf6QNY7HECCgo1GDu+4/xnJmQYMdltHEJ5
         ucMTcbRmg3XNhMq8z4klxwOQE+ihPTk1p6IL6Wn1i6eEHc+ZvnfwVPx4ABm2F/hpxC1c
         0ZWVDfpxVCMLPUGPESvIRlG8Wb/6UXZibwlNM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730725250; x=1731330050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nWI6Xd/q/LZwmtaLVMw4xyJRrOQePjMO2FUfWARW0Q=;
        b=b+JPAsmEUlT1Q5RijWNb/D8eSif1YUnI5SzGN+Y4GUCVN1xHqN0OBbRNVz0dVVCWg1
         r+u4jwANc2cQpp8NPwKj9rFAwxucOybd+B1HjKMfbYwMaoN9y6tmoSITgGTh7QtEiv3t
         w0Ii3gsKSUeeK+tjEn8rv7a0UYTGfBwS9BB7w3ci3r8YPze3g9yhDDnwdX1iGvtaMbRm
         2x1SFiMOw/f+wf44FDdoSHbv4a7BqWHy6u9sC8u6AkskmUTgDcfu8LvC3MpAVQa/BmXr
         TA5/Hg1zQVnQkmzp9+Q+ApZk5bSqMSKKDhFKrZJ4Zx3PyVRpi3lCs8SrmnZAwqNQU8dG
         axGQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpem+TIFvnpTzfFAI+V9x9CSTGvRqNPxLeWmNogkC/w108qqTXGnl4Rt3efzSW1nPJWUAfno46oAl2SOEAWrE9@lists.infradead.org
X-Gm-Message-State: AOJu0YyUv/QpDVzssufyTaib/IA9bH8Z1fvexYdJ62dp9fx7dVXcgLi9
	fHQ3SPrXuT91uPU67pR5IAR7d1jkUOUe9ZW31HRwo66STYEur4vxfkxsVx1HIXKnUsD6xKiDvIP
	f30a41C6q7J3/crO1qvNm/xPt3c/hh9xL3am3
X-Google-Smtp-Source: AGHT+IEaB8ZZda+xiJN8hKjO+7R4XsS7rVORV17qPKkGoFiz7+eoeVha8v/dIRlM1DAoeMrrYQuRDQrFwr1eS5hM8ts=
X-Received: by 2002:a05:6512:3404:b0:530:ad7d:8957 with SMTP id
 2adb3069b0e04-53b34b36e63mr15028995e87.49.1730725249927; Mon, 04 Nov 2024
 05:00:49 -0800 (PST)
MIME-Version: 1.0
References: <20241030070224.1006331-1-wenst@chromium.org> <20241030070224.1006331-2-wenst@chromium.org>
In-Reply-To: <20241030070224.1006331-2-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 4 Nov 2024 21:00:39 +0800
Message-ID: <CAGXv+5HVy41qee6kwVUeLV_DfA0=wk2X77kv81rBKAZDGE6mww@mail.gmail.com>
Subject: Re: [PATCH 1/4] arm64: dts: mediatek: mt8183-kukui-jacuzzi: Drop
 pp3300_panel voltage settings
To: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_050052_010814_FAC9481C 
X-CRM114-Status: GOOD (  17.08  )
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

On Wed, Oct 30, 2024 at 3:02=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The pp3300_panel fixed regulator is just a load switch. It does not have
> any regulating capabilities. Thus having voltage constraints on it is
> wrong.
>
> Remove the voltage constraints.
>
> Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

I see that the other three patches were merged and included in the pull
request, but not this one. Were there any concerns?


ChenYu

> ---
>  arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arc=
h/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> index 783c333107bc..7bbafe926558 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
> @@ -35,8 +35,6 @@ pp1800_mipibrdg: pp1800-mipibrdg {
>         pp3300_panel: pp3300-panel {
>                 compatible =3D "regulator-fixed";
>                 regulator-name =3D "pp3300_panel";
> -               regulator-min-microvolt =3D <3300000>;
> -               regulator-max-microvolt =3D <3300000>;
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&pp3300_panel_pins>;
>
> --
> 2.47.0.163.g1226f6d8fa-goog
>

