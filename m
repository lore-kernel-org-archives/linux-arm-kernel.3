Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF6AD2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 06:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e6/Xc856dVnZFQ/9F8I90IBNHI2pEc8W4VcGHN3v5jw=; b=exmPXI3H89szx4VYn8xuZbkWi8
	8q/Njm8JZv5hvB6fLc5weW609VZPYpk2ElhhjcWmS4W5SAHSu4vxsXRsUPYNsyiME8kQKHRsO03fA
	e9W/4OxyhjbmHJOhjaBDltGKVeNfpWExpTBLN6CUKDc7Ma+F2W2sf2t4fqUMXilyfcj6ad1rkU2YB
	bbweep+b3m37bwGPjyGvdN+I/V2nl2a98XdlNdLDro0A/9veM7ZwOISRIl8fhRdd8sq4UGqtOzdJS
	uBqnGGmNTnfed6U65jwZlonwG3E+kcaQsu6HQBc+5KzVXKSHVbe8Kf5Eu1szatHGKigIKK0u+oqrd
	RoMemK7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTE2I-0000000FBMr-1GsU;
	Wed, 10 Dec 2025 06:50:54 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTE2E-0000000FBM5-1R5u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 06:50:52 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-78a6a7654a4so60730507b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 22:50:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tomeuvizoso-net.20230601.gappssmtp.com; s=20230601; t=1765349449; x=1765954249; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e6/Xc856dVnZFQ/9F8I90IBNHI2pEc8W4VcGHN3v5jw=;
        b=hsv3hNLqtiMAZt+hQz5ga3CqnWX4eFfk38V1SSAhzqDHHSJzMQSBmNyF/BXKrSFUcE
         KIXG8qOGvw5GJoujlZwgpZKG+/ovCAYC/DdGOSz+f3bO75deuiqPC5DE6sWm8gprLujv
         PGshw8Zz6402eu+Xjiqwea7QHxsJa+pSblKRy/pqa7MdJdQ5VVRLVPH97TSWAanDT0zt
         FNNnoSryJAg0v3P/iNPyF7ORW/waFO3aJGBVJoO+Qf9UjZhBnTaVFeZHk9BLqSi2Hnc3
         kmk71ZEgh2Kr6X9DFZA3C65RG7w0VrrUmudEP5Wl+w7+MMTmWqWK6FLlEsOtCfXicOvo
         AKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765349449; x=1765954249;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e6/Xc856dVnZFQ/9F8I90IBNHI2pEc8W4VcGHN3v5jw=;
        b=pKv9/CumabPQD+ngGAptKamfFaO4yxqHo+0wGCPTiJlWQTg+KjjZ4yiGynUW/6Xd/X
         qniiWwMxNVcDcQk0KmSou+/4rcwagDVHCitRyWjiq2h3YtZ1n9Ypru9P77gOwaS6K1X/
         9hTXsuoGwwe4TqGAXe5FLsSN6+f306y3ND4riW1f8dl9+FmiIJXzoVh831EXGmdPBHXU
         IuBMPba/CqvZP054aJ0e7CLlOFIwdL8xsPFYR4ZVurIeRb+IjDh0YKwdZRT+GspHeLhk
         XB/RQchNa02iKlKTXq3YREtE/Ebd0O1Somw6JrqneZZ+qMs6w+8Ve0k9W+W2hB4QjEF8
         uDKg==
X-Forwarded-Encrypted: i=1; AJvYcCXhYXij03wWQ4n0JfC2CpcKu99OE9k/tK7CA9KzoGlkp0gUbFCM7eboc3eoEysq5VN+PLkzACMysjISTRcvRTbN@lists.infradead.org
X-Gm-Message-State: AOJu0YxTf7z18HpJ7dgCtSV5Akowptto0tzmqjJcIByRO1oZxts4Plo0
	bdUHk0hYCM6trxGtAwfHNjkymmn9T2B8eaYAOWGEUtN83Nzlz9mvFjxx5zU+aphINGw+KMcJIMh
	/4sBQvCA=
X-Gm-Gg: AY/fxX5f3V0DZU0/nNAIe0IMPDpk6xTLc1+Wos8jhpFfjZcA1H4flmAyk5bK1+JDtn/
	hi6r6Kdx/KuL1Iv2MY2q/tTIgh4+1Jjc++FBC6goGHwq/LD85uoisXshNacVKBZ9SElNMoqsqoL
	CFswTQoHN4Wxi9B12OMeYpiKIskuOoGcqqaFPug7bU7ffcvTR08OBY5bKbwXAyNhlRqvCBwOI3u
	wCdFc/6CZOf6QmUdYolzembc8Qg0peXGed4vwfyrrYan7yR0qiK6wK/tE0U3BgohmiLUpmDnXfQ
	2+e5XavdQ3MqkeEw05881MjwE8hCKRgHZlXzvy3bYjWrRew06S5dGWXVOiaVUu5VoDzxAWfhBvx
	txPXhQfFGKt1qit383kcaeqyS67aIwbMkStuI+pnk3m5mG7CrwWLqrdYp0wntRZXn1cJlCMHEBS
	BalQw0f4ikH8CqjngNwD5PHICXy3tMGXZkkCgrhUunbk/tGX0Ni42/Wg==
X-Google-Smtp-Source: AGHT+IH7ZQqLyvT0vLD8H8uRRKvy3OeJH2sjtn0VgaUhYeNNxNClnIMWZJAC9ROcQEg7XtpWqWdb7A==
X-Received: by 2002:a05:690c:6004:b0:78c:32fc:d3c8 with SMTP id 00721157ae682-78ca644b466mr9486017b3.61.1765349449204;
        Tue, 09 Dec 2025 22:50:49 -0800 (PST)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b4ac94dsm68443307b3.9.2025.12.09.22.50.48
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Dec 2025 22:50:48 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78a712cfbc0so72023477b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 22:50:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5dNeLwyc59UnahjB9Nyk+vP6y0gdXx5LKOrP+MrkvKey3qSidvjjKKeLp1WFXA/34ByiJgKgouFxd/kTP9Miq@lists.infradead.org
X-Received: by 2002:a05:690c:3508:b0:787:fb60:f021 with SMTP id
 00721157ae682-78c9d706f7emr13066887b3.4.1765349448147; Tue, 09 Dec 2025
 22:50:48 -0800 (PST)
MIME-Version: 1.0
References: <0b20d760-ad4f-41c0-b733-39db10d6cc41@cherry.de>
 <77685900-2c34-49b8-8c7e-14718841ef17@rock-chips.com> <fa82d11f-ce11-4feb-bdb4-c31d360a2a62@rock-chips.com>
 <CAAObsKDYLXVf1GdYUNeaOya+pWD4jTOEf55ouXAL9iM_kWCcMw@mail.gmail.com> <75166475-d6a8-45b8-8092-f31d292d4206@rock-chips.com>
In-Reply-To: <75166475-d6a8-45b8-8092-f31d292d4206@rock-chips.com>
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Wed, 10 Dec 2025 07:50:36 +0100
X-Gmail-Original-Message-ID: <CAAObsKABYQnw9rUfxwTS-yiQSoH9rdxZ_ffUBtp2H3tMJqMb7w@mail.gmail.com>
X-Gm-Features: AQt7F2p53s9xIk3APN2FpJ1uFAy8tAWuNCMsBMdjBwpL5IMqSHDOS32N56bYPQY
Message-ID: <CAAObsKABYQnw9rUfxwTS-yiQSoH9rdxZ_ffUBtp2H3tMJqMb7w@mail.gmail.com>
Subject: Re: Issues with DRM_ACCEL_ROCKET (Oops, power-domain, probe-ordering)
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
	Sebastian Reichel <sebastian.reichel@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_225050_647787_A906D984 
X-CRM114-Status: GOOD (  18.26  )
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

On Tue, Dec 9, 2025 at 10:31=E2=80=AFAM Chaoyi Chen <chaoyi.chen@rock-chips=
.com> wrote:
>
> Hello Tomeu,
>
> On 12/9/2025 2:55 PM, Tomeu Vizoso wrote:
> > On Tue, Dec 2, 2025 at 8:00=E2=80=AFAM Chaoyi Chen <chaoyi.chen@rock-ch=
ips.com> wrote:
>
> [...]
>
> >
> > This need was questioned during the review process, and during my
> > stress testing I didn't find a need for core 0 to be treated
> > specially. So it was considered unneeded complexity and the code was
> > dropped.
> >
>
> Oh, I just noticed that the commit comment in the devicetree still
> contains a relevant description.
>
> > My testing involves running the supported models as a whole, and also
> > their individual operations as individual tests. I run them in 8
> > parallel processes, in batches so we have continuous bring up and down
> > of clients.
> >
> > I'm a bit surprised that that testing worked stably but we have still
> > failures in some setups.
>
> Could you please describe the failures that still exist? Thank you.

I was referring to the ones that Quentin reported when starting this thread=
.

Regards,

Tomeu

