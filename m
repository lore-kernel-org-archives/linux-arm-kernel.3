Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72500C624D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 09:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytaSS9E97s/JULLyGWR20qPV51uikwUgTS3pF5XmIPU=; b=0+yyYCzK1cZHEhBRw+wcH3iub3
	wFBuAiqFWWNk675UJamxuix2HSCgJ7axTrB357ORpHAhQPglWr4Nnj4bewgvd07j7wDtH7pI3qVrl
	UwlUaAogqgNcQ/t01wCkWISmkAhxZTt8qLScjq5Ck41bodA8S+lbtaEFXmCNxmUedm9QtGpyFNKg9
	uukhDPzMuD1FqIxVqkfYwowBF09stQCrLt0N+yeC7RibV6E37kJTkydevBcD4HCKHQRPlqe0l5XTb
	dRwgIl/OfTKwEvuGC31aumZYJQnGy6bpOGaYFIpsD5+IGcBcTt7J5NCXzzTux52kn06U+P5s3mKn9
	XtdAK8Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hCY-0000000ECq4-3KDg;
	Wed, 02 Sep 2026 09:24:14 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1hCV-0000000ECpL-1yOy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 09:24:12 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2d6d28aa26cso5058205ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 02:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788341050; cv=none;
        d=google.com; s=arc-20260327;
        b=XnjkGBcTDCma4jg2k8GT7+34aEVAxObak+Bb0eZZNZNeDSNr7Y9hdKqB8w0Qta/G2Q
         CKkzKvKYQVEpIrD0FRJIttGof/odA8vJVpRUf+9jXWC5ExWwG64uVG5LtwfQofue4t7K
         odnyzJVnnM1d9Xoh378OZuG6sK7kdLWvcjHhYXfS7nXnVjP3cFN7wiZ4n/BDZG53jK0I
         a6yUbsfjtRk1thq7vLGGunhOdhmfwG7lMbXyeReW76oHsvSmNx05/S2mtQCF4viTngBZ
         tjx4cmG965bvuvS4F5AEZWADbyzoIekMEVVFXVxaWb1rvd+IjOJlf2KeWirSxs8qON1K
         cCyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ytaSS9E97s/JULLyGWR20qPV51uikwUgTS3pF5XmIPU=;
        fh=LmbxcZxonHH/SKQj4EU/6xUT/tv/1S6lvi1GbmjwxdU=;
        b=tCds9ursWA0uVb2jQaEfdT+vXPLkgwrTR8wEMFs10uM4F9N3BD5/NGOqRdJ84yqw0/
         hWpfA+FnEGjlp47cJYzewGvqli3xQKL1HMnuzmOss6WRQ1Vt6/62kiXu0z2saTOSUBID
         eTHb4t+I0YjHgDLsn+RqjH9IwqidzuLKdQCI42fNThFf8/cLG5rPC3FkPQkEzkt3x5H/
         JIk+8X1mKA+k0xSe6GST4cPHpIUVxd6H4FiRJ05aLoFuOJHjwDmhhB1ZVjeqnkJqbkJy
         JxgBMaI4rkCAyEhpYFeVLYVm71hK94eMyg8HlvVgJv4XuoOQZhfFYVCn7FNorEomnPQf
         dEPA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788341050; x=1788945850; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ytaSS9E97s/JULLyGWR20qPV51uikwUgTS3pF5XmIPU=;
        b=KcxMloGz3TvP11abkE0kauG9SGeNWj9ALthx0iSj3HFlr/FimOI1QmF4Mi1XEx007k
         ZKSipg/xRruMGf6KwXZ5Chjhfp6Gdp5v84HIEBFJk15bUBIJuYluhtgq8sVykdP5nnrr
         3I1hqWOfEIP7BXhUvbj0Kt/brenr++4d3JPXRglMVOPx7F//zsmwJVDxRRz7KMr1YYdj
         lbgj0mOf3D9ykN5nR30SAndS0+QV59htf8f1ORVA513RtxhnqIcrz5hWR4heOTZXM5my
         0xWy7fa5gv0kSk5vtSkaYnnhqjO2/zCQefoxho0+yth3J3zv9T2VBl1HdbSM5GtITWsD
         LrwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341050; x=1788945850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ytaSS9E97s/JULLyGWR20qPV51uikwUgTS3pF5XmIPU=;
        b=lNxEtwlmFPI+tVdtLrZlRdRNIwsMPrvAdLn2XEb2KMvLMIuJjlBZzGqF0pLLkaWAvD
         VIDI3UPKkW7EP08wxB+C5MbIcBXt6Ch4B8wk/RYK5aVLDmHnvujJ8IwvpCAMzLoWjlye
         o34S7sbEmHJnTWw4r7F0eA8434logOFJsAF5pwIQeBsrYcHuS6a7Am3ch697IvprHRXl
         45ZBHs6GmD9rPNDtGiw00KJYLziF7LFCW6ac+MdDAiDXOhc3/HdCTlMNGalPRbEr+6nY
         JdH+VbLtYX4behKBZtU4A9jo6/gqAoPVo3+woHAz7hugLH6O5sHbcxmtwagczCg4bJtd
         hWNg==
X-Forwarded-Encrypted: i=1; AKwUvBw9VjOmULZqGRnFi1YI66qQIVdBJryAnDGpy9Dk9KwwjX4fUdFD235YVrEBV6dfwN+uQx4Kk6DYUJxb1J/cb6N8@lists.infradead.org
X-Gm-Message-State: AFuF++nQbfV1b7YC5MTDYQ+tnt4rKL3vBO42oVlMipuihLk9lI5x8mGf
	RL3DWamtPR5NgrZXIciKNUcy5w6vAYViH0Qmjeilwn3HASIA1g/tJkRamOdN4Vbxqzmu3lUdQYW
	mbpoDgtkjw/x6HApjJMph8pz0/J1B05bwZ83sl7hbgA==
X-Gm-Gg: AR+sD12LjL43NjP40WJGzlW+iESUeQyEDdgOgXK8Nwmep6r9pwJfRmJLdNQ5uCv09rP
	ym6gzaHnfAXEzFGPQoFiIcACbsVEx6F/0VPN5tzMRI6XbpxQMkKG7kWzbt1LqQ5u4YjsVpAah8S
	DfQYBFKgoAps1lt3U3eHyP705a48LWgBSwEmqFR4Cff8MN8/5aSXOrgg/HglgN9hXZHd/2KcRJP
	hdEtHpB6MVFXfr8LevCiqQmIkYXOe1RTAi+w/Mtbn3yo7H2DXUcinS9qdkoqUZMitqQPtFnqU/D
	dUTwr6ewG98bKsFWSSwJoiFn9IGRhBQMNAqb8KCFhdk6xcgbLiAFJf+vuSJpimp6UIhtoh6WFIv
	fCA==
X-Received: by 2002:a17:902:f682:b0:2ca:f21a:a6c5 with SMTP id
 d9443c01a7336-2daec5ad6d8mr40455475ad.1.1788341050320; Wed, 02 Sep 2026
 02:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
 <20260901-rk3576-otp-cpuid-mac-v1-1-ea9135270fc2@flipper.net> <87ecfc81e9.fsf@bootlin.com>
In-Reply-To: <87ecfc81e9.fsf@bootlin.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 2 Sep 2026 13:24:00 +0400
X-Gm-Features: AcwNN1Vwt1UNue4ueZiVCGXuJAETKqvfhojim__xlQfGqQYcvUB9rCpZaBk-bcY
Message-ID: <CAKTNdwH5S3MxgR=5s2LXPquCFRXE-61LTTsZoHP9+YmXo_P4Ag@mail.gmail.com>
Subject: Re: [PATCH 1/4] nvmem: rockchip-otp: Serialize reads
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Michael Walle <michael@walle.cc>, 
	Finley Xiao <finley.xiao@rock-chips.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_022411_522514_CDDF0C47 
X-CRM114-Status: GOOD (  19.87  )
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

On Wed, Sep 2, 2026 at 1:10=E2=80=AFPM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 01/09/2026 at 19:33:11 +04, Alexey Charkov <alchark@flipper.net> wrote=
:
>
> > The OTP controller is driven through a single set of registers holding =
a
> > state machine which has to be stepped through for every word read, yet
> > nothing keeps two readers out of each other's way. Concurrent reads
> > interleave, and the outcome is either a reader bailing out:
> >
> >   rockchip-otp 2a580000.otp: timeout during read setup
> >
> > or, worse, one of them silently taking delivery of the other's data.
> >
> > Reading two cells in parallel from userspace on RK3576 reproduces both
> > within 150 iterations - 53 read errors and 9 corrupted results, the lat=
ter
> > either losing their first word or, in one case, ending in the two bytes
> > which belong to the other reader's cell - whereas the same reads issued
> > sequentially never fail. Concurrency is not hypothetical here, as six
> > thermal sensors source their trim values from the OTP and reach the dri=
ver
> > straight from asynchronous driver probing.
> >
> > Guard the read path with a mutex. Reads are the only way into the hardw=
are,
> > as the driver registers no write callback, and they always run in proce=
ss
> > context, so a plain mutex spanning the whole clock-enable, read,
> > clock-disable sequence is enough.
> >
> > Fixes: 755864feb729 ("nvmem: add Rockchip OTP driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your review Miquel!

Sashiko complained about mixing a scope-based guard into a function
with goto-based error handling, so I am replacing the guard(mutex)
with explicit lock and unlock calls for v2. There won't be any
semantic change though, so if you don't mind I'd like to carry your
tag into the v2 version.

Best regards,
Alexey

