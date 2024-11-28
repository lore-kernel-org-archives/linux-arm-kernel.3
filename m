Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409B0D609CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 04:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9gNdiwWZ1MbH1bVKN1QAiVS5Fv7sTB11zjZfTxLD7cA=; b=X2JLfxSm4KaPdG4slhvu2kcwyK
	mpUbKKxbDy4F3I2hFOGMiwwOqzirOz8ag+qEgH8JndAdF4grvul7xcr1vAxhPpFSi68VLaYZ6K0uh
	H1iZQufBS34ueNy1lJyVv/1qYEM0iyF8rgcArUzlgMKj9qdHnW3LH+Acj7aQndFwV7h4qnrauoLYS
	v5ZMOY3w+Krcy7eYZ94mVkug7wbudj8Pbo9GJBRS9qbjsZb4vZMu9EDvsVt9sFX5+ugc1Pfd8U/+B
	pXIHnGF4s7vyDrTUF8tpIv9PRKAAmE4vHc9Nkt6nK9cR+bNm/aScw1Mn9v9vJDMX6BqOBzFLpKbyF
	EA0mBu0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGWbf-0000000Ehny-3HyH;
	Thu, 28 Nov 2024 04:58:23 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGWah-0000000Ehj6-0sUw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 04:57:24 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53de7321675so318832e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Nov 2024 20:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732769841; x=1733374641; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gNdiwWZ1MbH1bVKN1QAiVS5Fv7sTB11zjZfTxLD7cA=;
        b=l4FSRNVF7pJImpvDS5RM/YJqJZsXANrd+ukY9M+Fd6bNgySX8117sT0a90vCUMk7VV
         sr5z6rmNvFprpPfOWwbp9dN+4WatBLYeZl1K//XcV1hkBeffARK5cM8dUVZOEbFIEtaK
         04QyOAFO35z1QMGlimneDYfmeguBfMV5eVriU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732769841; x=1733374641;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gNdiwWZ1MbH1bVKN1QAiVS5Fv7sTB11zjZfTxLD7cA=;
        b=SaHSjc019eHpsOch0urw4gnDETqNslqsnv/HNhUHWVVFrJ4ejutsbqWxicxBm+Du6k
         LxESnEWMVokrcUbli1DwK2icmK0fuxdihdrApa/pjnRbUI4qeUK3+UuaWL16CqA+kI9i
         FPNBC1dUsQHuzluO2beZ8Rwdcn8PosMPoxDb4pkg14xcXiquUlOotOhZcdlE8XGWCMw9
         n2JIlk0GdsM4aZqu+7u/UAlqCExAsm1ODnriM+jcqOXNSgfAROvTleCM9WyxLjmZXJ1h
         cdqVlC795348dt/G/iFpc2aSkRIptCqH24ArjwsN7bZmCw5Oy5+cYnIqln/snpvbSVLX
         65YA==
X-Forwarded-Encrypted: i=1; AJvYcCUtpLiQEy6iaHTPgeVnLSRNn1yYQ3cQLRZlhNbmVDYnrQ5rkLQb6vuQjhZ7OoyXjbpFdoqD7Hp1ViWJ0M7zsjak@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb5XdTKC+PzeOZ9QbSqZpmnfahlQtEQ7/HHJN4IN/dGQxEjkq1
	IlYThRE0EN3U7WmEEsZuT3W3DK5kRm1yHVAaFInM9kicbkjTcsj4U+LmaIspnq9ATlob28IE24i
	8b+i5LxFVZ5qbBd30ZcjF6AFk8omsD4O26YGc
X-Gm-Gg: ASbGnct85sUEUSpuD3X8Be7DTl1RgMPoskrhfMA9nQVKoBfjoLozg6MkrjN16Porfrt
	iO/ipsXs9vk1an9BSOnjAgAfrzWpK7kZ6/tGyvMeXbwWn3NgLkTBPxkNi3GU=
X-Google-Smtp-Source: AGHT+IG7n8N4nAMz6o9K2XahUaKaMVFWZxqJsiGFCbLs2B2ko1EorvcGfAfKGctbegSVwAcOe4uRUizxkULBFWIPM2Q=
X-Received: by 2002:a05:6512:23aa:b0:539:ea7a:7688 with SMTP id
 2adb3069b0e04-53df00a9f35mr3140014e87.1.1732769841115; Wed, 27 Nov 2024
 20:57:21 -0800 (PST)
MIME-Version: 1.0
References: <20241106093335.1582205-1-wenst@chromium.org> <CAGXv+5Fzrz9sBvE=FpV6URpcZtxvchxfY9WE4k4s+S3BzMWw2g@mail.gmail.com>
 <Z0b_f0gg9KgSozPH@shikoro>
In-Reply-To: <Z0b_f0gg9KgSozPH@shikoro>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 28 Nov 2024 12:57:09 +0800
Message-ID: <CAGXv+5GUGwqEGpyJptAUc7aqdGAeFP=-um4=EfUNzxkahiXB9A@mail.gmail.com>
Subject: Re: [PATCH v11 0/7] platform/chrome: Introduce DT hardware prober
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Wolfram Sang <wsa@kernel.org>, chrome-platform@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_205723_271480_458A1ACF 
X-CRM114-Status: GOOD (  13.48  )
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

On Wed, Nov 27, 2024 at 7:16=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>
> > Just checking in. I just wanted to make sure that this is still on
> > track for v6.13-rc1.
>
> Eeeks, not only Andi was so busy that he lost track of patches. Please
> accept my apologies, I was under the impression that this series was
> still under discussion. I sadly missed that it was ready for prime time.
>
> That being said, I applied it now and will send it to Linus by the end
> of the week. Sadly, this series was not exposed to -next before, so I
> hope a few days of -next will work for him.
>
> But I will surely try. Sorry again!

Thanks! Fingers crossed! Hopefully Linus sees that all the stuff is
just new symbols and pretty isolated.


ChenYu

