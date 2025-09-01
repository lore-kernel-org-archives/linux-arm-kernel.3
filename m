Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82D9CA0FFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 09:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OOAB7G9n/2hsZ0P6Hhao2xBBN7OqCLCO8ZYMEN1skRU=; b=edXridWWRt7Cbtsiyz89oviTgE
	l6tknB3WmilLO0aruhP07tPMFTxQ+cxizPDIJea/fGs4m0ul2+VFQm5voDmBAGGpxWemKq9zgMmNF
	jM9zmVM2UfMCG+gyazZYfbB+iGmpAsWAr/u5rsEbVTkGdc7AuB/f3Zuxyyi6oq23xqBGXSR5wRtDg
	eZ1ydnJApvgWxEPCaU/u+9vwqOjsIXsuLDRg04j+vtMuTUUSWgAEkEmINDvgPPqLu1pPbzw0FMiId
	YI6rjUynStwV37QD+uq3//E/uRrwkutrGPco0P/vth9itSt7l0nM6Y02k7dBR0m8hZFhdGPti7vhN
	oNPuKEjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0eY-0000000BiX9-0oYx;
	Mon, 01 Sep 2025 09:16:42 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut0K3-0000000BeUx-327W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 08:55:32 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-55f7c0fb972so783688e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 01:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756716930; x=1757321730; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOAB7G9n/2hsZ0P6Hhao2xBBN7OqCLCO8ZYMEN1skRU=;
        b=xybDGOkKROjIyHIKxPy/KOYiZGn6ovPJxSEpTBsMizPQiZufX91G1TM0LrZJkJym0I
         vGTzqHcgc0ePwyIvewcU2QjguSNhK5jIDUtVX6ZzKDZ9qtnyIwViBu+mGTrHALM7LOuU
         vi/rGIJLUlOSQlI/0FGtIlOHaA3hrsrY5PzfO/B27X8HHPBH3enHFVS+FWpQXRNE/9VB
         ZWmHs0r76w3SQL//HlyolGaNtYhfCjlx69n4nClQHlTunyfZspV9FdcmsgGWUH/sMv9j
         q/O4BR59xxYWpncO0JoOPy8EPETLSjfIzQffambHsclcGFsO5ZghwBh5l4IbsP7qttnO
         Uk9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756716930; x=1757321730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OOAB7G9n/2hsZ0P6Hhao2xBBN7OqCLCO8ZYMEN1skRU=;
        b=jNPV8cTWNq+AWO7vNfykB2/+KiwAI/I3Qp4AyTop/DmfX3IiUwDZULUmgvrTEffkWZ
         3WvO0q/QdUGYYjDdfityEztKFjEFcqYu+CGEtgl3zCouaSMcnPU9SnQaQcg+PdODZZm0
         8t7ATDTcBUxo534N9hDNbn/cWcMFPxaFlByWMDIPZ8uPACz9XjFpLjApbOumw5n2g4nm
         FuyrncLYZ9MKNMZpfYsMkYYN2UrBz7t7HbaKKX3fnoCKitvYvrwvEFplCwez2oo0uUkZ
         MDkU1F3jSDHk0rg5Rce6JzPqpv8+lJuCSyxfjBeG7ILWtVDUmM8YPR9LTj83HJU2+xAO
         u3Uw==
X-Forwarded-Encrypted: i=1; AJvYcCUBtsqAy2cWskQh+OfKXD9YcXyt5AKi6Zzt/61e3UyNnym/mSVl/d1uZ3kSTMYFAKIXOIezttmxJXK4lnIBJvVE@lists.infradead.org
X-Gm-Message-State: AOJu0Yycejxa9I/1ckVh5D/b/V8hvhnp1gKj3wmIrxL70BYLIhbM45s/
	594wRKh84dxWd6tMzy/0XvjDVMWf1nRpFdgo5+wZDKDS9ykW++BMfAsuFvaDnN699fM4KwFfl8F
	U2S6tzZ0yfQl5ieSI6MCnzG/Csf8q0E2xXKe0HQpsPA==
X-Gm-Gg: ASbGnctq9PV9azMpJH1/UgM9NIn5S3c+G0x11B9a6bdPH+EAdCZEqfxZ7fqtBNFc/Tk
	PzOKM+WDFGo7YLJDqUnjAh/TYJTqx5xMquQctNPP4t74EZOzue20aOlG93DDOXmcUcBzN9x0abE
	EU3fSEQH8WjW+G/xbjfr6oH0qNJHtsZG6/AuZOS56GoM/JNzC3bc5mkbpGqpfYsoHTPu+w/DNLg
	VznxZwdkySRJwuT46l9P7AFAfgWjMRqW9mV0znDugSyKTBEdmRW0ureTR3m
X-Google-Smtp-Source: AGHT+IHJKYSiuNDKUnzQmEIKfpZrhsAJlqPS0fGnhXH5tRx1POy1grVGkgaVCiDVasH9ouBJqfH2P01ocXKVrKkuhnM=
X-Received: by 2002:a05:6512:108d:b0:55f:6a6a:4974 with SMTP id
 2adb3069b0e04-55f708ec7e3mr2047715e87.27.1756716929899; Mon, 01 Sep 2025
 01:55:29 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 1 Sep 2025 04:55:29 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 1 Sep 2025 04:55:29 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <CACRpkdb=8GFLaAtSyWx4jgV6BN4gPAFH3tDKmDQT8b0b1xeasA@mail.gmail.com>
MIME-Version: 1.0
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
 <CAHp75Vd+q5NZ=4YSouU-EdbR4TZf7S8PGqR0B0HJG8DkVKKtAg@mail.gmail.com>
 <CACRpkdZcPwwpie51D55AHTQRSqG_EQ=tVG+0aMJpHhYZLGq1yg@mail.gmail.com>
 <CAMRc=Mcy8ia5Cp-hpvZp4Pz-gLEibzjg=MHA01YTeFk-OkFspg@mail.gmail.com> <CACRpkdb=8GFLaAtSyWx4jgV6BN4gPAFH3tDKmDQT8b0b1xeasA@mail.gmail.com>
Date: Mon, 1 Sep 2025 04:55:29 -0400
X-Gm-Features: Ac12FXxB7Oi319OBJqAxgLUSgdBpknMsupe_z_UTHBIhDjp6vltsJiEYsceT02s
Message-ID: <CAMRc=MeAHn+r0YHq5KgT2xVUuT1uOodcTLhfF6fc668tgs1saQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Andrea della Porta <andrea.porta@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Shevchenko <andy@kernel.org>, 
	David Hildenbrand <david@redhat.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_015531_759876_AE54A4CB 
X-CRM114-Status: GOOD (  17.58  )
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

On Mon, 1 Sep 2025 10:44:04 +0200, Linus Walleij
<linus.walleij@linaro.org> said:
> On Mon, Sep 1, 2025 at 10:34=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>> On Mon, Sep 1, 2025 at 10:31=E2=80=AFAM Linus Walleij <linus.walleij@lin=
aro.org> wrote:
>> >
>> > On Sat, Aug 30, 2025 at 10:19=E2=80=AFAM Andy Shevchenko
>> > <andy.shevchenko@gmail.com> wrote:
>> >
>> > > Note mainly for Linus and Bart:
>> > > I agree with the patches 1..11, but starting from 12 needs more
>> > > discussion. That said, I hope Linus can apply the first 11 ones to
>> > > make it easier to continue with the rest.
>> >
>> > I applied patches 1 thru 11 so we get some traction.
>> >
>>
>> Ah, I hoped to get a Tested-by from Mark on the IMX first as I'm not
>> 100% sure the fix in this iteration actually works.
>
> OK I backed it out for now, let's give it a week.
>
> I'm just a bit jumpy... I really want this to get some cooking
> in Linux-next by now.
>

I mean: pushing something into linux-next and seeing if anyone yells, is a
viable strategy too. :)

Bartosz

