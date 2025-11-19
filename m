Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F7FECF258C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 08:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5j+PVmz1ThbmMU8zEKanJG/8MyZ6W6XB53wlJvy8v2E=; b=vtWO341bbr9tUhmL2eqGJtXcqR
	nhh3L/HCWJRVDc2FhnCf5Oc19ob6dpqn1PNLTRxVZnFXA75IbSToiZW7s8Fb6DyEyScMxUhlVtESD
	giKgelyI9P51vHNkRm+zRfH5zhY0lw5LFsedd1Qdz6vgypf9frOA8wkxQDMtyvSJt9mzbqgFXQDik
	4vyvZ6lxOsOdB8HDCpwuav1FNXJLO3q63zcGLDDnDbFco8gSoAfKQpKsQA2j5ukZp60tToCs4MBd5
	eKmoJk2Uf3KAqF8LchOkUmo/s0xr1WfP7cwcnRBYfs/9N7NbHZgdccU3IU1KBQJNf0PztOAkQvaXq
	fagg3iCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdkx-00000002oIO-2s7P;
	Wed, 19 Nov 2025 08:41:39 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLdku-00000002oHL-2Yqd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 08:41:38 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-594516d941cso6064869e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 00:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763541694; x=1764146494; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5j+PVmz1ThbmMU8zEKanJG/8MyZ6W6XB53wlJvy8v2E=;
        b=FL8pUhkx97Yy7FUeFe7xJ7U72eJRV+UXaQ5odoHIr3KXhgnpT/QH+x93gwf9Havvy2
         P0NE9NXMf0CIHzhwNeVRdBi6EB8f9fRNNTU7JyqcqrfZngnVtZsVddbS/o+VJv3XejQS
         HtgwUzSmyZhloKLrEG10BfkJblaw4xzlAWzCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763541694; x=1764146494;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5j+PVmz1ThbmMU8zEKanJG/8MyZ6W6XB53wlJvy8v2E=;
        b=ag+nzChy0S+eZ5hAdvtuNozInhXFnq9HTDtgFSX+a1LRpycdgETvAUZPr8FAjU4PiX
         7R65USANv2iZI1Mz2Fs+t75XbUf1gwY45VqttCgPIC4JIolsXRWQdBq9o8H9j9ILed+b
         eoZIqeRN6jt3jzqs+o/Ddj/nLH47QyC4ClaclGSqVbb7xcnHiny7u76hpwq5zJM8NyTM
         JlmkYo5B7go44jgTpkWJ/9C8BmfaRnLZl9Q9fVXpkkzzHZACmypxXGD3TnrPZnNZ8Mcc
         q0KKsd1weDHVDtETKczy+MAkPkEjyIUmQqIygC88JBFx3qZZzQD7jphkehcTfZfTvLi/
         lgAA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ9b3KCLn6TUB2Euy+JBfAKK7QcMt+zBR+bAeFV6qkT4t2g2tTjZA2o6yywA7+2mVROADztviHG/AfyncGyck9@lists.infradead.org
X-Gm-Message-State: AOJu0YyDlcM0E3HQUmCjmoh4JJ2QgDDhbT1t7bW/ijzqrHplTlQFLFOL
	U10k4ggIPW6uiscvrSU8Y/TAB14Dfstq3Ya20FQrqP7s9MOaJEDoBw7UJFvQgH3eFHV0z/Yey9d
	T4tJLNudhPzymCIkGH+NBgw5gRJMuHPgFNensipqE
X-Gm-Gg: ASbGncvDLIlcOC52/K3HzzD+4B5RFK0M3od6CcKrS60oKJBy3/ObCIMbR6CMhe5+98b
	L/6ethb1t8OV/tLWTAuSphFIYxp+sAF8KKMpVJTYW7j9xQPzKBECEFNh88dNPWF3jQkhVmxPXFN
	GSFpicQQl2oI6CE+BVwTp8+FHYifyTtvSqG7uqPjrKqtoP7b8Ukq4m2Ng2JqYVLOfN+qvBlF5+q
	lWZNalkIWKK8gCguETQyqvk/2FRZ48oK2WsO4Dw+1QpmVYsLIq6hCBUnleYAud/b9QyS0jNpjtW
	JLojalkJJhfJbfNcpiX74VLX3ews94C9Hk6RCFkfig5hyUU=
X-Google-Smtp-Source: AGHT+IFQrP/i43BRhijnwjgkcRa7OAPKQ47ycdJ6Y9winLF07YK7XNLrMlityx7sOAiSK2CbDbRJMbbPsGbnrHHqS5w=
X-Received: by 2002:a05:6512:3b22:b0:595:76aa:8e with SMTP id
 2adb3069b0e04-595841f7d84mr6219364e87.38.1763541693273; Wed, 19 Nov 2025
 00:41:33 -0800 (PST)
MIME-Version: 1.0
References: <20251119070230.1716418-1-wenst@chromium.org> <66693e69-7ad8-4067-9bd3-ef1454e3ec18@collabora.com>
In-Reply-To: <66693e69-7ad8-4067-9bd3-ef1454e3ec18@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 19 Nov 2025 16:41:21 +0800
X-Gm-Features: AWmQ_bkZdxwhlKh-aCeAiAApl_fYKJMVFMF18ypbY25Gza-xyZhDFbzK5dIIIps
Message-ID: <CAGXv+5HOrP=hj8qxZmjq+ozeppXrzFKh=kq2Cb+QqWEx9n83Bw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8188-geralt: drop firmware-name
 from first SCP core
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_004136_954311_E146B17D 
X-CRM114-Status: GOOD (  26.99  )
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

On Wed, Nov 19, 2025 at 4:31=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 19/11/25 08:02, Chen-Yu Tsai ha scritto:
> > Arnd pointed out that having firmware-name in the device tree is wrong.
> > Drop it.
> >
> > Fixes: e36be19823f0 ("arm64: dts: mediatek: mt8188-geralt: Enable first=
 SCP core")
>
> Fixes here is .. well, right, but wrong - as if you "fix" that in previou=
s kernel
> releases, you will create regressions :-)

This is a fix because the commit in question was merged in v6.18-rc1
and v6.18 hasn't been released yet. So you should pick it now for
v6.18.

> For all of the currently supported boards, I was planning to temporarily =
leave the
> firmware-name properties in place for one kernel version (v6.19) and remo=
ve it from
> all of them at once, for kernel v6.20.

OK. So I guess the plan is to have MT8188 SCP working in v6.18 based
on the current name then?

> I'd be okay if you send a commit or a series removing firmware-name from =
all of
> them, without any Fixes tag and without any "fix" word (so that we avoid =
autosel
> backports at all costs!), but keep in mind that I'd pick that in the next=
 merge
> window, and not right now.

We can avoid autosel with:

     Cc: <stable+noautosel@kernel.org> # reason goes here, and must be pres=
ent

(See stable-kernel-rules for the whole paragraph.)

After the blobs in the firmware repo have been renamed, we then explicitly
backport the change to stable. I think that works out better? And the only
one that needs to be timed is the MT8188 change anyway.

How does that sound?


ChenYu

> Thanks!
> Angelo
>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi | 1 -
> >   1 file changed, 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi b/arch/arm=
64/boot/dts/mediatek/mt8188-geralt.dtsi
> > index 7fedbacdac44..8e423504ec05 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
> > @@ -1166,7 +1166,6 @@ &scp_cluster {
> >   &scp_c0 {
> >       pinctrl-names =3D "default";
> >       pinctrl-0 =3D <&scp_pins>;
> > -     firmware-name =3D "mediatek/mt8188/scp.img";
> >       memory-region =3D <&scp_mem_reserved>;
> >       status =3D "okay";
> >   };
>
>

