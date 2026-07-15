Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E77AC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 14:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACfTUsYc5cSIDcygJYvmfOEuoTU9YLmEZsn/dlKjqbk=; b=xxiXIwjo62gyT4b9S4a0mQaIGa
	Awz8H7tHARrCptWPNLAlJPPcYnBR7DuPKWk45qRumKLT5h7HrNorSBCXVIf584x2LLSUY/dZoEx0s
	dx4xCeyiAujcrZppnT0KShirBXZhvTIUdYa3pzmv9mEOre7jsoJO6u0z2jOxbWqzE2DNFVOM0HIhA
	WopmLcASe0xV/OXuZxrDEXq/VWLDLCoKQAph+MjA6E6R/TrtIOBiJ0NYl4l6rZBVQcelmkTRDTKdr
	eA1ehtybUK/v60o79ubLJV/YX56WPHyWfa/vzXxw8LOpraLP1jyOplpRVlKD06PAIEWHbKAKA/OLP
	NCL2J7VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0Xl-0000000F6sj-34OM;
	Wed, 15 Jul 2026 14:25:01 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk0Xj-0000000F6rP-002r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 14:25:00 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-39c74722e27so22590841fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 07:24:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784125496; x=1784730296; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ACfTUsYc5cSIDcygJYvmfOEuoTU9YLmEZsn/dlKjqbk=;
        b=aDu47q+zXVkK1WxLa93ICnTwzmGc2r/QUomsyT0oOoZlmeNfci0u5ZCQNIva5F9E5v
         9wlGgz4HRjbkk5mocrUbyaMhYPZFT6PQMbiGlHz3SHKBTiJntH/nVyx9658YjbiwrfUA
         OBnQ3nrXlPYwGrnCKOFwW/PyfyMFfK/2tZO7SbsBd0MswJgeBU7z8eJPUw7VFnzn/cRC
         eh+bpOODTQGXrqDXMWUABtXTkodV8cinP5oYhtlI6fnjEl9uy7bA2kb6IQIMjEOkwYV2
         ClDtn7EOzYv+ChHdjr5SPafc95srZG/+IxUb19lfdb1I9NJIWTzA83+bvPB/pYPbd+kL
         49aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784125496; x=1784730296;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACfTUsYc5cSIDcygJYvmfOEuoTU9YLmEZsn/dlKjqbk=;
        b=FesEThv3fnNcUaRdCLWztxDvatpY5ifGf5wmalIBykXjnkX8HeRIt2JsR6gHwOaxKe
         C/MXN9nEtN9S7nr9YC8VB9wpXrISyaV9n7G1MejaTQhRVquDzNjusUt28W3P8s5OVlsD
         p8nqdE+HmjVUT9cKAD6td0+8YV5XsqOCgrMiaxiQTlAJOPQ3DCXM8t5yKn0m4yUWX2i7
         iloMnRvziB2XiS+FHY8nrNxjHBjnBv6mUkoa/FfYqfPueb2owaavqjTZ8gF4gJCi67nd
         3Vub6DRGF9Pmj+7Yg5f5voVp6hID7JB6W78dXWLgkymAGOheOCHJOiMgf2JLuAeCIkca
         KFAw==
X-Forwarded-Encrypted: i=1; AHgh+Rq/gT0dVmzy4GtvNWrxeKsGdmtqv3y3glOMZPdu8JMZT8PTq82UmtT2YR2JPKxcyTID1PvLkui3dSDgP0sHyKlL@lists.infradead.org
X-Gm-Message-State: AOJu0YwcRVYM/h26mEQvXoh/2s2yqSTlX+KpvmsSHgHkHFkvvRHC2XMC
	8qS0WFWWtFSNRJnfAsD2j9G7tM5kUL7EYrWm4CrDTSVLgiNGlQVhFgn0
X-Gm-Gg: AfdE7cmcEFR4lxO/UsCqubLzGuaaNRWQnAwczIpPp8bvQ5egWQwoqbFB64maTWFXhXh
	UGGZwVcCkonrpNSW5DG45/qmJshi+L0o8AnmB4hukWSen2tBAFEzF04ASLavWyTD9W5LuF2P+pn
	J3NNqV+aY1skJfgpYurCSuS97ova6KDPT4Zk4EvY98r63bHtWzWpT8eqmr8Ngx8kl52ZFyvlx56
	G8h//l2sXaDfN8j0f3CWQMwx2D9F7+/TzL/4t+FOF/KNZWtdYCVRGVG0KzF2LXR7AVE8PM5MIbO
	n2z521t/A4AVrIjVXmDnWCXJuKEGb87RPtOQ40sTIK/TWSiVxv26n3V3BSwvnQkuw2NfWoylPCb
	wBlytMzKtpXMcnmXuca1XzFUHcHHDY7q/dUdNeg3gRGa8Ks/6CS9IlDbWedltwB0MrL/4IvWt7C
	0+8fRclkzZZ0fm8FKIowQXrsbhtrhmyKvVFrRHp8Xd6jww1NnJTIsf
X-Received: by 2002:a05:651c:b28:b0:39a:fef1:ad7 with SMTP id 38308e7fff4ca-39c94cde536mr48470341fa.21.1784125496005;
        Wed, 15 Jul 2026 07:24:56 -0700 (PDT)
Received: from smtpclient.apple ([87.200.95.144])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849180f3sm36977811fa.4.2026.07.15.07.24.51
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jul 2026 07:24:55 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.600.51.1.1\))
Subject: Re: [PATCH v7 00/19] media: meson: vdec: Fix lifecycles, race
 conditions, and stability bugs
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <CANAwSgSz+e483m9VKkFZzSKzB1Tsd8kS20UcB3ON-cZ=J8gX+w@mail.gmail.com>
Date: Wed, 15 Jul 2026 18:24:39 +0400
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "open list:DRM DRIVERS FOR AMLOGIC SOCS" <dri-devel@lists.freedesktop.org>,
 "open list:DRM DRIVERS FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>,
 "moderated list:ARM/Amlogic Meson SoC support" <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS" <linux-media@vger.kernel.org>,
 "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
 Doruk Tan Ozturk <doruk@0sec.ai>
Content-Transfer-Encoding: quoted-printable
Message-Id: <8DCA30D7-46DA-41A3-BB05-4C841D20BC0F@gmail.com>
References: <20260713120840.17427-1-linux.amoon@gmail.com>
 <CANAwSgSz+e483m9VKkFZzSKzB1Tsd8kS20UcB3ON-cZ=J8gX+w@mail.gmail.com>
To: Anand Moon <linux.amoon@gmail.com>
X-Mailer: Apple Mail (2.3864.600.51.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_072459_070473_D2C1DBA6 
X-CRM114-Status: GOOD (  23.40  )
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

> On 14 Jul 2026, at 11:23=E2=80=AFam, Anand Moon =
<linux.amoon@gmail.com> wrote:
>=20
> Hi All,
>=20
> On Mon, 13 Jul 2026 at 17:38, Anand Moon <linux.amoon@gmail.com> =
wrote:
>>=20
>> This patch series addresses a collection of critical race conditions,
>> memory leaks, use-after-free bugs, and resource management issues
>> within the Amlogic Meson video decoder (meson-vdec) driver and
>> associated components.
>>=20
>> The primary focus is tightening session lifecycles, safely =
synchronising
>> the V4L2 m2m framework callbacks, hardening work queue operations
>> (esparser_queue_work), and correcting buffer validations to prevent
>> stability issues like KASAN out-of-bounds errors or stream-on =
timeouts.
>>=20
>> Summary of Changes:
>> * Race Conditions & Synchronisation: Fixes multi-threading and
>>  execution races across stream-on, stream-off, job abort, and
>>  teardown pathways.
>> * Memory Lifecycle: Eliminates memory leaks and use-after-free
>>  vulnerabilities by safely pinning, canceling, and sequencing
>>  device removals.
>> * VP9 & Buffer Hardening: Addresses payload handling bugs in the ES
>>  parser, properly tracks ongoing buffers via atomic counters, and
>>  prevents invalid memory writes.
>> * Platform/DMA Adjustments: Adjusts DMA segment configurations,
>>  canvas handling, and buffer sizes to match modern hardware demands.
>>=20
>> Note on an outstanding issue:
>> An execution deadlock occurs in the driver workqueue path during high
>> stress or long playback sessions. This stall is triggered when the
>> Amlogic hardware internal video FIFO buffer becomes completely full.
>> When esparser_queue_all_src runs, the capacity validation check is
>> tripped due to a design limitation in how buffer exhaustion is =
handled.
>> This blocks progress and leaves the workqueue worker waiting =
indefinitely
>> on a core mutex lock.
>>=20
>> The resulting hung task call trace shows the worker thread blocking
>> on the internal lock:
>>=20
>> Workqueue: events esparser_queue_all_src [meson_vdec]
>> ...
>> __mutex_lock
>> mutex_lock_nested
>> esparser_queue_all_src
>>=20
>> I have tried to address this issue, but the underlying deadlock =
persists
>> under extreme conditions.
>>=20
>> Any feedback on this new appock is welcome.
>>=20
>> Testing was done using v4l2-compliance and active decoding pipelines
>> on Meson platforms (like Hardkernel ODROID-N2+ and ODROID-C4) SBCs.
>>=20
>> The v4l2-compliance tests passed successfully via:
>> $ v4l2-compliance -s -v -d /dev/video0
>>=20
>> Pipelines were validated using the following GStreamer script.
>>=20
>> [1] =
https://gist.github.com/moonlinux/08295ba1f17ce7155550773f2d2cb6e5
>>=20
>> Previous changes:
>> v6: =
https://lore.kernel.org/all/20260530094326.11892-2-linux.amoon@gmail.com/
>>=20
>=20
> I will review Sashiko's feedback. I will look into these suggestions =
and
> work on incorporating them to improve the code quality

Hello Anand,

I=E2=80=99ve picked this entire series into a LibreELEC image using Kodi =
22 and
ffmpeg 8.1 (using the RPi source that improves v4l2_m2m behaviour) on a
7.2-rc3 kernel and run some tests on a GXBB/S905 board.

Without this series H264 plays and seeks well and the unmerged H265 =
codec
also plays well and seeks well but with minor artefacts (something that =
I
need to look into). The experience is not perfect (this driver has a few
flaws) but it=E2=80=99s consistent with the =E2=80=98usable=E2=80=99 =
behaviour of the driver in
the last 1-2 years.

With this series H264 plays but seek seems to hang everything with no =
logged
errors anywhere. H265 results in a black screen and again everything=E2=80=
=99s hung.

It=E2=80=99s possible that kernel changes need to be balanced with =
userspace? Can
you please share details of how you have been testing things (and on =
what
hardware)? - I will attempt to replicate and poke smaller portions of =
the
series to see if I can isolate which bits are problematic to the =
otherwise
usable current experience.

Christian




