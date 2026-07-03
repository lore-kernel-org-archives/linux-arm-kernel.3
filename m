Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5C13C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 13:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:References:MIME-Version:
	In-Reply-To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gV0Slrjr8IXK+MlTCt7MN9hZHNcIK5BTbT3wdZMhFWk=; b=ffzuqvABqSI2HTGqXe4UtN2soj
	M67DQedV01m5J757lBW4TAoui7eS1qfrRWE83pOl8LS0zXneTV1b0hOy6nXyaytqQDpqto4n8EVOV
	VT3/i2+Fi9eiHX5ANXyQz3OfIW+VddR2yRCjlqm1tqVcVumBc8EvINF3sjPWYls2pj7Vhd+E8TQEC
	8AnyZZ5qXtvMJsrkO8N1EJlUjpmazhDSxerrUQJay4WT/GjrdMM+dntIlhqOgMrqOHhlyqxeBLYCc
	YqKAYuq6RTpjAnIIb7PDoqOmmL5uFjTpUJ6M+LD4PUFv7MlMX7J1g25bdTRsN0s8l7tCQ6F+MQ5it
	B1nMeWhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdl6-0000000744z-1HrC;
	Fri, 03 Jul 2026 13:16:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdl5-0000000744t-1JX5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 13:16:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6EBD7600E1
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 13:16:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206C11F01558
	for <linux-arm-kernel@lists.infradead.org>; Fri,  3 Jul 2026 13:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783084602;
	bh=gV0Slrjr8IXK+MlTCt7MN9hZHNcIK5BTbT3wdZMhFWk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=oSjWQJMVtg8g/LXoUb/K2FqnMziWICTYSrswtHn0oREeAe9aGAEYylsP6FTuQE+dn
	 wjGcvMuvcRqlVqoh7z8fwaNzIObZDxlRBmXX30cJheTBHAMRiQRW2RuEZByS4wcOe3
	 jylAsGqYV5LUq0Mtm9kijSAaV4jz7Z1m1+pn3+uswdn7rouFE4CSzcakh1RFvjbTVG
	 TAo/PBKLlq4cY94y8732frnrFqI0G+57B/6Coa9bTvjuMcke80Ok/wRiEhvPcWYLrq
	 QZcgKjIj341ZG9DxLr1WSAQ9oGUWetnM5Ixk3cqNtqKBGe3XjpxSF3vLN/YA0yWB72
	 oPqwysfcEV0eQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39af6402933so4937161fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 06:16:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoWJ4Eo3WXafiWjF4DnfmxOTOQDoZ8POr8omJaShCEVinGVTp7P6t1OUErxD6ZPo8ygzdoXVTSZ1NRMyH0Y+sUZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yyjo4b01ITFyXwrz4OuVXQWQOoA/ahHABFVXVtKANlK/S/JVDIs
	/s4YuIhxuxqP4wMWvpANvseqM7MEXpeRUN31uwKwNuHLAyaEVX18n/qnNMxcA+LVc+uAzGcKllY
	s/f1bbjFedkpdG8mLLviGbB0uyYLt1ZQw5azmC29CDQ==
X-Received: by 2002:a05:651c:2554:10b0:39b:90f:b1dc with SMTP id
 38308e7fff4ca-39b36e0af76mr18538581fa.13.1783084600750; Fri, 03 Jul 2026
 06:16:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 08:16:39 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 3 Jul 2026 08:16:39 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAGXv+5GHFnMj3qr5BcpLCQk25rWYOgnMKUX079ScELs4uqEdVg@mail.gmail.com>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-9-wenst@chromium.org>
 <CAMRc=MdMhr6qAnAtUePbuBbsH=3MzRC+BrL5GssbNTwGjp_ayA@mail.gmail.com> <CAGXv+5GHFnMj3qr5BcpLCQk25rWYOgnMKUX079ScELs4uqEdVg@mail.gmail.com>
Date: Fri, 3 Jul 2026 08:16:39 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mdoj204dTwVMeqFwsVt3f4JJUJtk93VL2hDgh7+C60eqw@mail.gmail.com>
X-Gm-Features: AVVi8CfEGr9ongua6ulDVSCJ0raV9SIaG27LcZHKlrYzQjvFFBvVAoVU8_PqL0s
Message-ID: <CAMRc=Mdoj204dTwVMeqFwsVt3f4JJUJtk93VL2hDgh7+C60eqw@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
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

On Fri, 3 Jul 2026 14:58:56 +0200, Chen-Yu Tsai <wenst@chromium.org> said:
> On Fri, Jul 3, 2026 at 8:41=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>>
>> So this is only needed to not have to track the state in a separate fiel=
d?
>
> Correct. Reading the field is not the problem. Updating it is, as the
> fields are packed bitfields, and Sashiko suggested that locking would
> be needed, though it may have been for the peer port, which has since
> been removed.
>

I'm not sure if it is. The user controlls the handle. We could argue, it's =
up
to them to provide synchroniztion. We only assign the target and pwrseq fie=
lds
once in pwrseq_match_device() and only change the powered_on field later wi=
th
pwrseq_power_on/off(). Unless the user does something weird, we should be
alright. Maybe a small note in the kernel doc would be in order.

Thanks,
Bartosz

