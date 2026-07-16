Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590D9C4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 08:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S6dzhBrZchW3iZvyn1hIvbsasMrCxNEsko6TeLvbddM=; b=M1nXXz/bqlndhuZDPxcVfOcWjP
	FxDnsp573xeRBsaqkWqAt5CzoLAD5cfR3yYYfrPIFyzAnNKq8breeOb9bN6DQboIqGMo4aKIB/qEV
	gnF479BnxlceY8GNrfooGL6vSzTxPRQ3NkKWmN+TDUzV+GpvWRUwRAM97aukHoI12pWxTwx6lHysQ
	7FYQa8u2+Qkntds30v62rF13D+4MXI+rce8z6QL395L17sQ6R5ois3LPszhFahfP/QhQIibSeC85Y
	j5M8pgwnPAJTRZ+tNaxvQ0ojExXmZMNN/YhZO8YgaiO5/m4Te+9qXCf4y9+UPmcpN5PCSJ0APgfW2
	ykjictSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHEx-0000000Gj2v-1Bp1;
	Thu, 16 Jul 2026 08:14:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkHEw-0000000Gj2d-0bpY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 08:14:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AEE02406AB
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 08:14:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E3E1F00A3A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 08:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784189681;
	bh=S6dzhBrZchW3iZvyn1hIvbsasMrCxNEsko6TeLvbddM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ILXJIECAsF50gCjzfPbo9WZ++uCuclPTHWsj/RRBjDVaQXiS3A7eKkrJVaM45nwRq
	 vsR1AL39qNsL/TTa/+zhzhQr29o2VwZneXGkKEgx5yicEAaup/pXqZ68oTzSJneAyH
	 a+FRUiiHHdUA7WHqKNVU/W60AN0scXOCedQyLqpc/HK4PgLeXxvTPVL1F0+L2EKQNX
	 f4hTAs5bekpCWzp1JXckxrMcTSkYloomfCYNDgvEkzvxRIIhdGW7a4oZccDNG4fm3a
	 JQ+dsMXn47utt2p1g69B6V/aJc5bjHuE9GewcW9IgwAZw4lT2SjDrlVI/EzTMYOlNM
	 37zTJ6KOsRoOg==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-39c7ed5410bso34353631fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 01:14:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RorXe8SFDNExvDAMzbu2ughNnBDu56yafyh9l2PSXoZEE229H9SJlVgvwt+Q73gsW48J9+X6ElnjxH7Ldyyis9R@lists.infradead.org
X-Gm-Message-State: AOJu0Yw14DOyctsjzc/BgHisIpbYmQ4DsaPvmuj0WsNQkH2N2PmVEmbF
	PdiWG+BfgElLBbYsqjlJe4qo5mEnNqUBoRSAldSaHJNjfLboOnhCOiQ9cyKpjhOLC/iIpz3tUvr
	DPhdaeD9+lVsSVyWjL6zfoF032E65+mR8SAiOrldoIQ==
X-Received: by 2002:a2e:bc82:0:b0:393:6934:6104 with SMTP id
 38308e7fff4ca-39db6c2a16fmr12970681fa.19.1784189680282; Thu, 16 Jul 2026
 01:14:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 01:14:39 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 01:14:39 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAGXv+5HGjGTrqqzJrpiQhLrCn3C6H20LXq3niPnoujQLOwgqPw@mail.gmail.com>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-4-wenst@chromium.org>
 <aldS3qTympJuVXYj@ashevche-desk.local> <CAMRc=MfHmejks83bPfe3fKzAzFySGXk2GHMA9oZdMQj0f44eTA@mail.gmail.com>
 <CAGXv+5HGjGTrqqzJrpiQhLrCn3C6H20LXq3niPnoujQLOwgqPw@mail.gmail.com>
Date: Thu, 16 Jul 2026 01:14:39 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mefxn81d0VUwmQgwFtffkL1=Er_1VQZCbC1Sa-Qph4t1w@mail.gmail.com>
X-Gm-Features: AUfX_mxn6Bl7rEMqDoJ22rvXDaXvLC48Woi6Y6ypETbOrTpITKxwxCyFT1q8e60
Message-ID: <CAMRc=Mefxn81d0VUwmQgwFtffkL1=Er_1VQZCbC1Sa-Qph4t1w@mail.gmail.com>
Subject: Re: [PATCH v5 03/16] power: sequencing: Add pwrseq_power_is_on()
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, 16 Jul 2026 06:59:01 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> On Wed, Jul 15, 2026 at 8:10=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.=
org> wrote:
>>
>> On Wed, 15 Jul 2026 11:29:02 +0200, Andy Shevchenko
>> <andriy.shevchenko@linux.intel.com> said:
>> > On Wed, Jul 15, 2026 at 04:53:33PM +0800, Chen-Yu Tsai wrote:
>> >> The power sequencing consumer API already does power on state trackin=
g
>> >> internally. Expose the state to consumers through pwrseq_power_is_on(=
)
>> >> so that they don't have to reimplement it locally.
>> >
>> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>> >
>> > ...
>> >
>> >> +/**
>> >> + * pwrseq_power_is_on() - Queries the last requested state of the po=
wer sequencer.
>> >> + * @desc: Descriptor referencing the power sequencer.
>> >> + *
>> >> + * This returns the last requested state of the power sequencer.
>> >> + *
>> >> + * Returns:
>> >> + * On success, 1 for on or desc is NULL (optional) and 0 for off;
>> >> + * negative error number on failure.
>> >
>> > I would rephrase it a bit.
>> >
>> >  * On success, 1 for on and 0 for off; negative error number on failur=
e.
>> >  * If desc is NULL (means optional) return 1.
>> >
>> > And this rises a question: why 1? Shouldn't it be some "unknown" state=
?
>> > (But since Bart Acked this, this doesn't prevent the patch to go, you
>> >  got my tag above.)
>> >
>>
>> No, this is good feedback. Maybe we should prefer an enum like so:
>>
>> enum pwrseq_state {
>>         PWRSEQ_POWER_UNKNOWN,
>>         PWRSEQ_POWER_ON,
>>         PWRSEQ_POWER_OFF
>> };
>
> Well I think the crux of it is whether the API considers the descriptor
> optional. The power on/off functions suggest that is the case.
>

True. That may be an inconsistency of the API contract on my part. There's =
no
such thing as an optional variant of pwrseq_get() so perhaps pwrseq_power_o=
n()
and pwrseq_power_off() should be converted to returning -EINVAL on NULL
descriptor.

> I modeled this on reset_control_status(). I believe the rationale is that
> if the reset control or pwrseq is optional, then either there is some
> other mechanism to deal with the reset (GPIO) or pwrseq (GPIO + regulator=
),
> or it's always on and operational.
>
> In such cases and the rare case where one has to query the state, the
> queries are possibly chained together and I think it makes sense to
> assume the "operational" state as the fallback.
>
> If this returns an enum, then I think the previous approach of returning
> an error value for an invalid descriptor is better. One doesn't need to
> learn a new set of return values.
>
> I'm fine either way. I would just move the checks over to the consumer
> side. But I think the principles guiding the overall API design is
> something you need to provide:
>
>   - Is the descriptor optional? What should the action functions
>     (power on / off , or query status) return when NULL is given?
>   - Is the subsystem optional? Should the stub functions besides
>     pwrseq_get() return 0 instead of -ENOSYS?
>
> Right now the API feels like the descriptor is optional but the
> subsystem is not. One has to add IS_ENABLED(CONFIG_POWER_SEQUENCING)
> around the consumer API to make it an optional feature.
>

There's one more use-case where the power state trully can be *unknown*.
Please look at the proposed new function from Loic[1]. Here we deal with
targets over which linux has no direct power control even though it may sti=
ll
control some of its dependencies. This is where an UNKNOWN state may make
sense.

This is where I also floated an idea of renaming pwrseq_power_on/off() to
pwrseq_vote_on/off() for better clarity of their purpose.

Thanks,
Bartosz

[1] https://lore.kernel.org/all/20260710-monza-wireless-v3-3-46253587af64@o=
ss.qualcomm.com/

