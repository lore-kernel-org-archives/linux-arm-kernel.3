Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68CD3C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 04:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6VEqGe71O4B6jvfykXcb0jRrukuykdD7MfjxVd1svFc=; b=h0XvwGy8A2yewQLzpqNbW3w8g7
	GhG1NF+wNInWb5esELI+w8TUNwMXlMWzypbX2aS3bu356m6+PboU4fCGhNckkjrPRq14BJBpt3SpL
	0BCVob8D4DCACmmvhYOMtmODD8Dyh5YZMDY7fAk9V5eq0+T8v/v1lm/iKuRc2A6JXMMBkFZ9Mzuaw
	IdIxaE0gWI8MNjvtgHWxy6eLFBAOj3c/A+rQA25TH14DxeS07CNvNxpCSDeYFGFhSrZyRcJuWkOlU
	koLEuJnRVX46qzzycliEx8w2n7uXYxmHKigRtB7R9EddSd+j0Z/c2zm03AMczHb8FD3scDOMx8T6H
	7yeb1YyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkbji-0000000ApuX-0Orw;
	Wed, 19 Feb 2025 04:31:02 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkbiD-0000000Apk2-1LIt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 04:29:31 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-543d8badc30so7306201e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 20:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1739939367; x=1740544167; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6VEqGe71O4B6jvfykXcb0jRrukuykdD7MfjxVd1svFc=;
        b=gGmR1gYgCf0Nmt4U+ht5EkFLeZSqa6uk0lU/PLQFIlRkVI/vxp+CqaUvAfEdLVR4cP
         oGvCZLBNWm+0y+GsOBlUtR3x9sLUkIr24YkVBxXBwrfhUkMjoqH3919gHcltJkO9nhqi
         Z4z7467uK6rlRknCAuCMh0aB9Egox0lD9dFNk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739939367; x=1740544167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6VEqGe71O4B6jvfykXcb0jRrukuykdD7MfjxVd1svFc=;
        b=IFd8bxLleakiHNWYioNcKIVV6jGQ5BNEjNizAQEeaLZLzOe5zGB5BuhZf6vPGab6br
         8G/wOVOYHXEyQcVJmZT685qjIMY1l2Oex6krOnm7/TYrEEles6F60zs/h0SLvilPH68M
         wmIGAg9mZnbBt21tvWtPfZtsGkSFIoOyq2Tk0ebrVJRMC18PNOxMwdvFwICre2jmHRbH
         3HNtPoOmZWfD4FnZmhqxZAXKtNkPnOvLeZV5FdvfhYOfe2MZ0U7IRAFz2QL2fmxWamC2
         7l3pNucFLMFQn65bGNGbU60Lz6WeFFSyeetHE0oUnkwCCVJDG7kp1PyTj2WxmFmEuazP
         K31g==
X-Forwarded-Encrypted: i=1; AJvYcCVGNnLoqxyakbtvZHaOMotcYpc1A53WJ/nxSPM9WgTW5nLKoOv0uGhpSYidVaOszyFow7EjCCE/rhb69sXr440U@lists.infradead.org
X-Gm-Message-State: AOJu0YydCMydcEk0krppdsgDoB9+fw7dELZ7C4gJwP/zlUam34HfhbUW
	kOy7M8yc7GA9o5fmI8FW9CvRr2cVqLpsDrMFivDS14EffGhz9aNr+TJ6RYz5BBOQN2jDi3GddeC
	7bArR6y1CZ3z48A/C3SHLCX3CgKS3aRa5rbJM
X-Gm-Gg: ASbGnctzWO4451+DAimOrywZd5yMfyZCwqqIdUGcd6rh7CQZo1NTjPqcWDOCJv6wMLV
	7ni4hUepZVLCxWE9a4VFCV4HIVALtiNerxS/3VmKwrGGDnZW7xTBwaNqT9N7s1+Y+mVs1Vu04Bx
	6HE1YO3o5DcuCMFavuslofov4v
X-Google-Smtp-Source: AGHT+IFDON5BTBrIkCqYoruAW+GgEU4kzLUMfNza88SwUu5KL01SJq4OJVKPavaKWnoXBdabjUxCkcKdf2JVNhz5ek0=
X-Received: by 2002:a05:6512:3d8a:b0:545:85f:4962 with SMTP id
 2adb3069b0e04-5452fe5bd65mr6877441e87.20.1739939366740; Tue, 18 Feb 2025
 20:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20250218-genio700-dmic-v1-0-6bc653da60f7@collabora.com> <20250218-genio700-dmic-v1-6-6bc653da60f7@collabora.com>
In-Reply-To: <20250218-genio700-dmic-v1-6-6bc653da60f7@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Feb 2025 12:29:15 +0800
X-Gm-Features: AWEUYZkGeDpr43jARxyOu4uYPJJwq5tj1ueAuV0HV6f4Jx2FAOS0QlcBYZWYQSE
Message-ID: <CAGXv+5H1pfJMQPBTF_K72D3-JFsZDvZ277erZ449sc6FTkNFSA@mail.gmail.com>
Subject: Re: [PATCH 6/6] arm64: dts: mediatek: mt8390-genio-common: Add routes
 for DMIC
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, kernel@collabora.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, parkeryang <Parker.Yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_202929_488018_5BD9009D 
X-CRM114-Status: GOOD (  15.85  )
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

On Wed, Feb 19, 2025 at 5:27=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Add necessary routes for the onboard dual DMIC present on the Genio
> 700/510 EVK. The dmic is supplied by micbias0 and micbias2, and inputs
> into the MT8188 DMIC DAI.
>
> Co-developed-by: parkeryang <Parker.Yang@mediatek.com>
> Signed-off-by: parkeryang <Parker.Yang@mediatek.com>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch=
/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> index a37cf102a6e928440cc88e7e8fe0225fc28ec962..efdeca88b8c4e58f0c1782515=
6276babf19af145 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
> @@ -959,7 +959,11 @@ &sound {
>         pinctrl-0 =3D <&audio_default_pins>;
>         audio-routing =3D
>                 "Headphone", "Headphone L",
> -               "Headphone", "Headphone R";
> +               "Headphone", "Headphone R",
> +               "DMIC_INPUT", "AP DMIC",
> +               "AP DMIC", "AUDGLB",
> +               "AP DMIC", "MIC_BIAS_0",
> +               "AP DMIC", "MIC_BIAS_2";
>         mediatek,adsp =3D <&adsp>;
>         status =3D "okay";

Shouldn't there also be one or two new dmic-codecs, and a dai-link here?

ChenYu

>
> --
> 2.48.1
>
>

