Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45985C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Jul 2025 10:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eeZqZiIDDXHwWP76HNKsyEyhco1yGowTasqjD2qFGQY=; b=KklHYG+RXZ/StgxFAICbnyr4mT
	Jdc2JjjHIMejQ5qMt4YfEzoUduo2EOmYU68tsB96cYgbgNQ7F3fY9ICojqMHintTiUUb1coXZu8of
	SVjh0ahHACxcGwxG21BE16DN0bD+ABYEG17rHRa2z2uasmy/Rbju2eHOrkeJ1DrtYAqiADprIU43B
	aUb4iUgs68XffJu4BeHA8XLPiSFhORTzsHmO1j9M/zPk38Le301bJ7XLafVGweRYHVN21Dq8oCTvn
	jlxibv9sZwEv7GhDFdrvujMq1dMR5xEI4M7VPUxC9e+gA7MAQRX+WwAmF3DY9hDBB8zmWAVozaYRE
	vrtSxNKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQRt-00000003MNJ-1K82;
	Thu, 31 Jul 2025 10:23:45 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhQPF-00000003M7J-0h6L
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Jul 2025 10:21:02 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3b7848df30cso1081717f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Jul 2025 03:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753957259; x=1754562059; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eeZqZiIDDXHwWP76HNKsyEyhco1yGowTasqjD2qFGQY=;
        b=EpHanyv30rzqOrb/X+DjaVCuxRNgK2Ue2z9nBc/lNeoVf6+s2AgrM744E2/6o8PQfD
         MVmbP8lk2jG3ZPXae/LLZHghay44eEQqWNJWcvkXGs3Bbj/HEeAf5we2+tD2yw/csppb
         zuTI37wq29DWmnD7RHTZAJ+AJSfLLQ3El/OuDb2nhvz4e/Sw8A/3BXvXVFbh+wIEisjt
         lvzzo551hejRpCm1macEnziRF7vWOGvqi8IOFrvIWp2Qp5ch5u3ub/dmVrhh+IHYUM6s
         U1pCduQMS1YHdA4H21cLz65i8xhHxN4c6AZhcS056Zu8nplURKcni2f8NOOfEtQclKVW
         n1NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753957259; x=1754562059;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eeZqZiIDDXHwWP76HNKsyEyhco1yGowTasqjD2qFGQY=;
        b=uNt5zbe2nhU02QF0aQfNN53b5JdclanvfAG0cYNJ2Igu+Fs7l2eFu77iFu9Xp14LzX
         Nd07LgMP6+iWYlJW4OFqrIwmjViNdUgisS19s+EOWNIfnFphbzAGkJbpBZlmfc/VXuQr
         6vblRrwTxZGbz6360E8wPwOEyHioaFnz/+y5QhojaIsutn/QpMn1IHP55uIBfNy1bhXs
         MhUhgXMxv+Q3j1DWKhiWUlld9wGV0e4D/525E5aQzT+II2MT+gHR19GzKUdjWs7tJy8x
         OMZyH8W4UqCOq1X/YuYzNto7COdEXgrUbn3aa3u7fSskvZg6golV+NgNugnrQ7RVeO+F
         SfNg==
X-Forwarded-Encrypted: i=1; AJvYcCXUDHhXZ5T5oGrPKShQqDUBo5I4ef6hITBjTkWhqodTh/EXD8uFkss86ACkuyDdt+80kE222EZMss/T/w670neu@lists.infradead.org
X-Gm-Message-State: AOJu0YzwtoSm/ibjYudkCJRWIqg5HGWz+H9D+3qHyfOqPNn0OCBXRwAL
	3Udbr2icPhKMmwIXlJO9RAGr4IJCS+pbE5LvN4bU3Mr4yhgr7kdLNsYE9ZHKcRkFzbw=
X-Gm-Gg: ASbGncveEWZSPtwfiNZwFjevS86QXoloq3syQ3PahPj1XJle72Kjv1c/dGd1zjfIlLX
	3EbKPrjnsQlJISqN/Lwk+FxutbOvNxvMOOIpMiTF1ZqM3Lzc811kktgPpo7VLVHeBim5adqRi+6
	ktX8jnClEZTJ2OBh4N5WsFF1LJxoTnnV+l0WADDxv1szmFKablsRfpZgJ1XXnDDhjFBBdkow3y3
	iDrcIsqhCuNexTchz8XTkpBWgvKiUMUAWiLiqSZuzyR6ee8bHJKqSDlR2xwELVKfienIlDgnMSI
	7sye8ImbKbNFbku3O3QvmsE+PRyVkdhfuC/n5nFcpLLgaxzljU77Pooa2UF+lYZHoKDWy4CEbUn
	/hIrogjNRxHJLzZ1A2lM3ghaUHA==
X-Google-Smtp-Source: AGHT+IFVEwLIcO4fNKnjyIY1mnWetXH6kHJKTnn/c6Wln21XoHb709OPThVEb0OesSZIKjx5gzja4Q==
X-Received: by 2002:a05:6000:22c8:b0:3a4:cec5:b59c with SMTP id ffacd0b85a97d-3b79d812bc8mr1195293f8f.25.1753957258867;
        Thu, 31 Jul 2025 03:20:58 -0700 (PDT)
Received: from [10.1.1.59] ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4588d89c50fsm60787795e9.0.2025.07.31.03.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 03:20:58 -0700 (PDT)
Message-ID: <1a72e672995ef6cd186f8ff18a91bb8b72d86554.camel@linaro.org>
Subject: Re: [PATCH v5 0/2] Samsung S2MPG10 PMIC MFD-based drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sylwester Nawrocki
 <s.nawrocki@samsung.com>, Chanwoo Choi	 <cw00.choi@samsung.com>, Alim
 Akhtar <alim.akhtar@samsung.com>, Michael Turquette
 <mturquette@baylibre.com>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas	 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Alexandre Belloni	 <alexandre.belloni@bootlin.com>, Peter Griffin
 <peter.griffin@linaro.org>,  Tudor Ambarus <tudor.ambarus@linaro.org>, Will
 McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, Krzysztof
 Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 31 Jul 2025 11:20:56 +0100
In-Reply-To: <20250730145100.GA6782@google.com>
References: <20250730-s2mpg10-v5-0-cd133963626c@linaro.org>
	 <20250730145100.GA6782@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+build2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_032101_217057_51A6922B 
X-CRM114-Status: GOOD (  15.86  )
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

On Wed, 2025-07-30 at 15:51 +0100, Lee Jones wrote:
> On Wed, 30 Jul 2025, Andr=C3=A9 Draszik wrote:
>=20
> > Original cover letter further down.
> >=20
> > This is a resend of two patches from the original series that haven't
> > been merged yet. That series was merged except for the attached two
> > patches here. Other than rebasing against next-20250729 there are no
> > changes to them.
> >=20
> > Lee, I think Stephen's intention was to get these two merged via the
> > MFD tree please.
>=20
> Although I have no issue with this, it does seem a little odd now that
> the set consists of only Clk patches.=C2=A0 Let me know what you / Stephe=
n
> decide.

Thanks Lee.

I simply went by Stephen's ACK, which to me implies he wanted it merged
via a different tree (mfd). I guess at this stage it doesn't matter anymore=
,
since all the core changes are in already.

I'll defer to Stephen :-)


Cheers,
Andre'


