Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D25BCC6B0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 07:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=; b=anCFfOWI/+e1lqRqMssZu515vn
	5ckXTCk/wQBMWYJ1DJG9u6DiNv3KqugpKdixxSGtJH9vLaGGYia2+oVbZB95vLPhjrnI6GkxWzdyA
	sj6snkuGwNFES1Tp2fZG769S74jEd2blJ7+M+5Gq/W1L0aPh0tzkLTUNfB6hxy7vHclU2VciwQi+k
	XSxGx0l/Gul69rKu/5xsXstZToXyEHf9PCOoBHyoFVLLA5r+U6Q4jJRIEHhrZp9xWI+OgVctxIT3R
	q0METwicPk5GSagctNY9vIKsmnwOIBXJFQxnkljyF1YAsiGtHfRoyxlBoUEbUS4vu4nfBCBX7qTUe
	tbZgE3dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGWis-0000000CCD0-19Fw;
	Tue, 13 Oct 2026 07:14:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGWiq-0000000CCCR-1T26
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 13 Oct 2026 07:14:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=; b=QK2H9KmgH5f9rUEKnQnjpQ7IAA
	QSFKjwC4oxAd9L7DxZZtz+m8gOGyBXGo4eRiuNu4iyrdI4HmFgN6dkq6ISJ879+CwWhnTQfniWSIs
	q9OLUWPZu6H6xg24Ke+ISdMsV2FeIUSRY/FvhXp7HhXXDJXlG2n1p16lZPNi1rwws8RS47+CpYPvm
	+PfUyoZ30j0IPsvjRgvsS81Xpspgk9x3KTp76O3Upfb9tbWXkakWBVAALG20AyX3SMkfp/jWX2pqQ
	/GHPJTgEicMCHyiOymNRqPqeKWD9qqzgdy86Jb9Eugo8rCNtx4wdo2JXK4Vm46JdkT8nBhMbbgV4W
	45v2mYVA==;
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xGWim-0000000FBug-2UMJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 07:14:50 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-4e4a4d77e5bso2650806b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Oct 2026 00:14:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791875685; cv=none;
        d=google.com; s=arc-20260327;
        b=Mcy6+Paeda/OfDcuei7aTKQAIdQfkbUw56KZpSbeetMqEJS9S33ix1mGilEN1KHGZP
         mfIeuyJRttFTIAiWijan784fBoX9xpzt/7VRedTCUf/sVrj5xuTZ+YbeEsMsGEvt7k9z
         5sOJl9AYBosC+ESM0/1otJ5fEn0puPRuGU9dTllcAAcNzsV49ODAVDa98TwjZfgvbF2j
         GH0u6ZZY+QxSNUp/E9tU0VABqym2bSPzR0lU9oIErG6ycZ9vB+HTJMXO2JXFUdNw12cv
         7bvWe8RBOL15hRMItPUeY0V8G/hH62uR1faU9S6TRzj6lCtfFi9Fe7IhIElKKV6h57D1
         ZEhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
        fh=uoFYvX5YrWzYQAQN450494PWsOesIs2TVwkpWR6RQ4k=;
        b=oBYzglG88a7vI1OHBXVQQm7vKwZT0597FVQSFjSpldTX5phPpyZn3BtuA00cssc+DG
         T3r0UHOQgrSkx/oTJFvUddgu+y3iQP1Jl7y0pQF4G+POhj5z/2wXWtz4Ee3TigQ2swVE
         M/Jalp9PNKwUlJkRih+rn2Vq2gTycgI+rr5mreDFWobNWIhH3oEVqAKZMqz/vqrQ8s+m
         IBFb347W9tEgm0we/sdebwHBx0P0IlWdSLGl6JmHxBpqbyhcrglVdbsgcA/SjR/aXhxs
         szG/R5CrOuaYi71rFCuRdeMa631cd6ce8lLAaAH1yFk0MCJIr8v7KAhjiM3eVhZV8LBk
         R0ug==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791875685; x=1792480485; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
        b=q/KKPECPHelyuj8HvWLkNxdNsLl1lkqcjDuOMowwETsGK9sbhCbtBIlRorSYiAfnEG
         ifkfttcM5v6Jp9vp8LVMx4JgiyhornR8R/2YivNukVrzb9T5CpT49qwRGAsET6xlhtYh
         WgnPpIvlZRsZ1LbFq/7Lsva1vwePgQAIsZg2qyKvIAgtpDm7nEt018bTgN2kcz5SGQKs
         bXqGH5GVdnP85Me0pFp+MBpS+xgTgBv9dlQamExYSiXTwMd//XYlKHVDwyDNlDq64Oqq
         34FV597T7PkhqlpzjikxHnPOwigZhNyAfx2K3z7PkimEXcOo5VuT4SrSFRmcNj6M7mK7
         c+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791875685; x=1792480485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oab5q36RLcRFvq5kzowaoH9lXYz57V+AFbZGkJbzRns=;
        b=pHK4j2xEr4U9h5QNHKFrA7UBdQFK4ex1uHAyVZLBFJ54qlakoFQ1+3xG1OHREu7WhA
         WQaTBA9oe9EVbrA8nDQzyPuSdR+uBPHtPekEYO1ng/vzcEOnZujcx3ynZTiBMB+dLSg+
         UFIWaM8h1dHUxfMCiy3/++ZYWL/hliOsayfv63sKr+3kkYp7R97z1Sr5q+M/r/vWkPAl
         qnJYhbSDgr4jjvXu0JfyHn840wE8TAB7ngTn5vAmBF9R6108Bi/+X5IYC7k8dIDk2+wa
         LrEnPROiq9Nnfui8zmgydMwaGK0OK34T6/MHse62oCeRSQjVv5Ha2wxjFuhZrPUtdVn7
         v9Sg==
X-Forwarded-Encrypted: i=1; AKwUvBxdc/wi3j2ElJyZ9UCIjGEPCoFRYj5UqsOjW+578kd3LwCYk4dUntrsIPgRsmz3ZLmFYpTiJ/R/oK58L0+zPhha@lists.infradead.org
X-Gm-Message-State: AFq9FYLRwecV9o5hbu+jTKgl9+2VZuQ/LKwZjOHZJJ3XFRngLHDarPDY
	KaHrVTW/4eaUTo8Fj0bGMGun3TxbXTI1iqkL919ytZtkB4r9KDoF7ZSQMR2R6hvOiMpyf3E/+s5
	TAbDHkL3Gr3rjtCu82jBRFsUdaaizcNY=
X-Gm-Gg: AYBFou381i+UWB/XEO0t4xTBIwajZYWqR+fLM0KZo27SfIOBW5CZHX8LKvJyTy0S6dT
	QCcp5igzkDv5a7ET2OXs1FAD3VCmmFf/0gji/FCBjDbnABj7CCbfnOk80VJqdUNcT5YQxeFhjrm
	cDwY6YptboZz2slHsPHVu8uasvM/AGX9FoCgEdqTbIM5+/boArgaRurEUP/fD9ojfd/HGFoxNjq
	Ka468VED8dg+gPTa1sJGi7nKc6RbrPYEjL/lmzVD+/pDSrA4CuXfK4HTIXrCtL8lX7i2NjS0P/L
	HpPtQAhNDw9UyOk3ELoM5zdMSSTdQ5zvxAgOsRPO0zRdnLoxnGmGT9qqj6unFTaPWVor90bGdKp
	bJwJcbNZ+d62NXksj3Mmi6237NaGm/ryLpDGqNcDOqEucTqPYEZp5GSieLln4KwNd9nDjqmlBFe
	7H+gg+Fwste3CLO2QihbDH3bs6Ty/loRguPfx2K5xFQm7anwoCmlc=
X-Received: by 2002:a05:6808:30aa:b0:495:ce6d:7d48 with SMTP id
 5614622812f47-50c4e67cdf5mr8677005b6e.9.1791875685589; Tue, 13 Oct 2026
 00:14:45 -0700 (PDT)
MIME-Version: 1.0
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-9-7b47ed6335a8@gmail.com> <3698d260-13c5-4050-8f03-61f7b7185514@intel.com>
 <l_pd6lBHQaWNYoohhfxhFw@gmail.com> <8fcdfd97-fcc5-4ed9-8a9a-3e7eac53fed3@intel.com>
In-Reply-To: <8fcdfd97-fcc5-4ed9-8a9a-3e7eac53fed3@intel.com>
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 13 Oct 2026 17:14:34 +1000
X-Gm-Features: AclHuK8TJXmdm-cxsbCKrijwUibcd22A39HSUGZRpbNW3PHDJmMdVBEajRXhBY0
Message-ID: <CAHgNfTyTQW2vMieSo+U7CTTuckrLZL+PuEKXfKCHYMFDBCFWng@mail.gmail.com>
Subject: Re: [PATCH v2 09/21] ASoC: apple: Add macaudio machine driver
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Hector Martin <marcan@marcan.st>, 
	Sasha Finkelstein <k@chaosmail.tech>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_081449_265463_78A61465 
X-CRM114-Status: GOOD (  16.59  )
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

On Mon, Oct 12, 2026 at 8:03=E2=80=AFPM Cezary Rojewski
<cezary.rojewski@intel.com> wrote:
> How does one know the speaker died? Is there some kind of signal, event
> or an interrupt we could depend on? As delayed-work is a mechanism of
> choice here for handling the case, I believe there is still a gap and a
> chance for bad things to happen.

speakersafetyd is a userspace daemon, not hardware. It cannot generate
interrupts. The daemon puts a magic value into a kctl every run of its
safety model to signal to the driver that it is alive. The driver checks
every time this kctl is put (see macaudio_slk_put) and schedules delayed
work for the timeout, resetting the timeout if the correct value is put. If
the kctl is not put within the timeout (e.g. if the daemon crashes),
it locks the speaker amp volumes to a safe level that will not cause
damage.

We do not want these checks running when the PCM is idle however,
so when there are no longer any active DAI BEs, we disable the timeout.

> Czarek

James

