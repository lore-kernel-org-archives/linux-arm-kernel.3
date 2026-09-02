Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D5DDC624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGdN2UjN2hke+3EUIE2BMe8wlc88G/++lGdHQipHA0o=; b=NzZFDVEaYnTI7nMAOoaaksijxI
	frE+YhNHDgptk60f0PUw7OlqplbyuHHMp8TVWQUHJiRJ5H52GkS+I1nCbRHdDvy7JxNc69P+Xeg+L
	8JRN7G2cDQmzY7NAjF3cphNhZV/DBZq3ZpFoMN+xr0XiI3xfepQpVbkN/TdnZOdFLtPjrViDkLMbQ
	8Xhpu5KZj4uPqzNm7IqOZCNslaoo77OweE9Z8Zu8e4xbuuQ74A6tucvHUAkzkKIIw44nxpatazLgH
	3+A4eUPSJkfSBM1dUHLlYuu9r7rrqxVtEGfsSTMTPTiZRdfXus4FXKjZVZPfiATmIw8IvAi+0mFY0
	TyW5h7Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1i2E-0000000EKAq-25Hg;
	Wed, 02 Sep 2026 10:17:38 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1i2B-0000000EK9w-1sJ5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:17:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 071904E414CC;
	Wed,  2 Sep 2026 10:17:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C50196053C;
	Wed,  2 Sep 2026 10:17:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C45FA11C79340;
	Wed,  2 Sep 2026 12:17:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788344247; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aGdN2UjN2hke+3EUIE2BMe8wlc88G/++lGdHQipHA0o=;
	b=A63GuMXetukibemYG47lx5bU87mEh432g1k0HLhRwhiCKPEQbkCH4l3fyG8CRT1PFYRJj/
	pQH5rHmlpUuhGnxmHT5l4Fb2Bf2E3qrUzfNRDLeL9YN5raFI6wzwDlFROrLiB76VNBXDOJ
	FUkAOdmpTVFCMV+UbNGXUVIQRZI/wrcYaWz4z5CI2ghST2Gn/e34PQRuEsRsm5J4hOvfQh
	ScutLTjTLWc4xrFKDA4XBnirYGPIAHmu+Ev0gxsSywJUk6WJxA4/RHfFt59bPAoXQDkGrS
	5Jp2UkhpDZz2QIe/idUmeim2YtjSKKLzS6bworBKo0TXMZkKEKaSPAnTkzVeWg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Srinivas Kandagatla <srini@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Heiko Stuebner <heiko@sntech.de>,  Michael Walle
 <michael@walle.cc>,  Finley Xiao <finley.xiao@rock-chips.com>,  Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  stable@vger.kernel.org
Subject: Re: [PATCH 1/4] nvmem: rockchip-otp: Serialize reads
In-Reply-To: <CAKTNdwH5S3MxgR=5s2LXPquCFRXE-61LTTsZoHP9+YmXo_P4Ag@mail.gmail.com>
	(Alexey Charkov's message of "Wed, 2 Sep 2026 13:24:00 +0400")
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
	<20260901-rk3576-otp-cpuid-mac-v1-1-ea9135270fc2@flipper.net>
	<87ecfc81e9.fsf@bootlin.com>
	<CAKTNdwH5S3MxgR=5s2LXPquCFRXE-61LTTsZoHP9+YmXo_P4Ag@mail.gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 02 Sep 2026 12:17:24 +0200
Message-ID: <87y0dk6jpn.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_031735_615967_C80AA15F 
X-CRM114-Status: GOOD (  18.89  )
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

On 02/09/2026 at 13:24:00 +04, Alexey Charkov <alchark@flipper.net> wrote:

> On Wed, Sep 2, 2026 at 1:10=E2=80=AFPM Miquel Raynal <miquel.raynal@bootl=
in.com> wrote:
>>
>> On 01/09/2026 at 19:33:11 +04, Alexey Charkov <alchark@flipper.net> wrot=
e:
>>
>> > The OTP controller is driven through a single set of registers holding=
 a
>> > state machine which has to be stepped through for every word read, yet
>> > nothing keeps two readers out of each other's way. Concurrent reads
>> > interleave, and the outcome is either a reader bailing out:
>> >
>> >   rockchip-otp 2a580000.otp: timeout during read setup
>> >
>> > or, worse, one of them silently taking delivery of the other's data.
>> >
>> > Reading two cells in parallel from userspace on RK3576 reproduces both
>> > within 150 iterations - 53 read errors and 9 corrupted results, the la=
tter
>> > either losing their first word or, in one case, ending in the two bytes
>> > which belong to the other reader's cell - whereas the same reads issued
>> > sequentially never fail. Concurrency is not hypothetical here, as six
>> > thermal sensors source their trim values from the OTP and reach the dr=
iver
>> > straight from asynchronous driver probing.
>> >
>> > Guard the read path with a mutex. Reads are the only way into the hard=
ware,
>> > as the driver registers no write callback, and they always run in proc=
ess
>> > context, so a plain mutex spanning the whole clock-enable, read,
>> > clock-disable sequence is enough.
>> >
>> > Fixes: 755864feb729 ("nvmem: add Rockchip OTP driver")
>> > Cc: stable@vger.kernel.org
>> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
>>
>> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>
>
> Thanks for your review Miquel!
>
> Sashiko complained about mixing a scope-based guard into a function
> with goto-based error handling, so I am replacing the guard(mutex)
> with explicit lock and unlock calls for v2. There won't be any
> semantic change though, so if you don't mind I'd like to carry your
> tag into the v2 version.

Of course.

I haven't seen Sashiko's answer but isn't the goal of guards to just be
released whatever the actual return path?

Thanks,
Miqu=C3=A8l

