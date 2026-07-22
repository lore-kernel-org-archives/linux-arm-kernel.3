Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD577C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yOiMdhLhv0SVgfXHE2R9QZzVJ1NasACYuBsrPinmcjQ=; b=qYpKoWhVfVA9yXcsT43TsPDyMF
	GHEGuxea/A/8oLYeeLfVu5Ddd9hYpU+fkra62JZYCzCbfOq87oYAyrKbSD4QoxaGpuLONmA5/Fbn1
	C8ATmLHx5P17cQrjpt/j4kWXs+KUdF6vY0TF5hPV1h3/+RAoMTpvPHwmAA1sgy39N0nUDEhlXRtUa
	fRNBi05l/vWlGYjwgz6GuavIU+l5CU5IMr4nPWKETg0IKw3CBU4qfFArozWawb4FYodjgrdbbWUsI
	9Qzn7i+4PM84QJGOgm3uUOb6WJHCk4NXEJr0ZfTM3O1HYBrtpPgqJKZ3hcDhxMwSOvGMYeQMzzKX7
	kG4bdi8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSOp-0000000BGWu-3zfT;
	Wed, 22 Jul 2026 08:33:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmSOp-0000000BGWY-0jes
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:33:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9237C43755
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 08:33:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70C961F01558
	for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 08:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784709234;
	bh=yOiMdhLhv0SVgfXHE2R9QZzVJ1NasACYuBsrPinmcjQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=cgzEjcrmH5PlLCpCElB1OBH6pZDb9tcKKSjkHE96/QtQnGgzkATjdho95Yq4JnPdP
	 4bseFJVqO6K/UqwJsvayCPfsj31vo72qmJADaYpyPsUaeoJUk9Y3VvB3zBQ9MFfVnl
	 Pgo+9tW3d2+aZ5W8ByPS3K29Zgbs9gUBnPODvG3nF2Lce2jWb3QM9qJQ2x07OUOUbT
	 ydCXQY5bkLo6n9jGWTTJKuhI3LOVbhcqvFEH5fuNYjWMURiweOrbFt/O0vJokKT+4f
	 2FKeQDbQVm6xRgf3UebCQkv6nB+JS+ZzMHSmhYGtWV6s3SzG+ashfYsw6Vf9Q/2X6H
	 aY92W1h16xTHg==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39dbe684115so42764941fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jul 2026 01:33:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoEOrGciRvBCmf368abjguZh7PeZlxDB3qw91EVsjxFHCRCRaLsJXlO8j+GS6aGVTyZiIO0wTZM1goZ/w0qavsa@lists.infradead.org
X-Gm-Message-State: AOJu0YwsmfbkBuT6fmwQX5T3tHZaK773NHxjjqzFk04TsKOask6cW5wu
	vv9Gw0horImXff+XqBylX3pa1D6WcDpT8VoGNikrlMWO8JUsKq3g9GvIAPYQzfFgsL6KemQUdJp
	G9aVzJxK75kuVPtyaKhYAHqrojxHsfnoGExX4QPAHsg==
X-Received: by 2002:a05:6512:a90:b0:5ae:a4a4:b6ca with SMTP id
 2adb3069b0e04-5b2a9b8bf28mr697065e87.14.1784709233027; Wed, 22 Jul 2026
 01:33:53 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 01:33:51 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 22 Jul 2026 01:33:51 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <c826b73d-6307-4237-a065-b7a8487350ce@gmail.com>
MIME-Version: 1.0
References: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
 <alnlaCXmoLRAlr96@gondor.apana.org.au> <20260721082501.6128-1-bartosz.golaszewski@oss.qualcomm.com>
 <c826b73d-6307-4237-a065-b7a8487350ce@gmail.com>
Date: Wed, 22 Jul 2026 01:33:51 -0700
X-Gmail-Original-Message-ID: <CAMRc=Me55rUmjjR+ZzdWd2ss9JJMZzJch0zKd4GqONBjCzFMYQ@mail.gmail.com>
X-Gm-Features: AUfX_myVMTKcbCAssDxc43I4GIfVcXmrNN22ieXBDI4_jU6w43vodvQh9W2ZppY
Message-ID: <CAMRc=Me55rUmjjR+ZzdWd2ss9JJMZzJch0zKd4GqONBjCzFMYQ@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Biggers <ebiggers@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	stable@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 21 Jul 2026 20:29:39 +0200, Demi Marie Obenour
<demiobenour@gmail.com> said:
> On 7/21/26 04:24, Bartosz Golaszewski wrote:
>> On Fri, Jul 17, 2026 at 06:18:48PM +1000, Herbert Xu wrote:
>>> On Sun, Jul 12, 2026 at 05:31:31PM -0400, Demi Marie Obenour via B4 Relay wrote:
>>>> From: Demi Marie Obenour <demiobenour@gmail.com>
>>>>
>>>> This driver is harmful:
>>>>
>>>> - It is much slower than the CPU [1] [2].
>>>> - It Has a history of bugs [2] [3].
>>>> - It does not have exclusive access to the hardware [4], causing races
>>>>   with the secure world.
>>>> - It register its implementations with too low a cra_priority for them
>>>>   to be actually used [5].
>>>>
>>>> Therefore, disable it to ensure that nobody builds it into kernels they
>>>> intend to ship.
>>>>
>>>> In the future, the driver will be used for processing restricted media
>>>> content.  However, the kernel does not currently support this.  Since
>>>> the driver will have future uses, allow building it if COMPILE_TEST is
>>>> enabled.
>>>>
>>>> [1]: https://lore.kernel.org/r/20250704070322.20692-1-ebiggers@kernel.org/
>>>> [2]: https://lore.kernel.org/r/20250615031807.GA81869@sol/
>>>> [3]: https://lore.kernel.org/r/20260706-qce-fix-self-tests-v5-0-86f461ff1829@oss.qualcomm.com/
>>>> [4]: https://lore.kernel.org/r/20260629-qcom-qce-cmd-descr-v20-0-56f67da84c05@oss.qualcomm.com/
>>>> [5]: https://lore.kernel.org/r/20260524204537.GB110177@quark/
>>>>
>>>> Fixes: ec8f5d8f6f76 ("crypto: qce - Qualcomm crypto engine driver")
>>>> Signed-off-by: Demi Marie Obenour <demiobenour@gmail.com>
>>>> ---
>>>> Changes in v2:
>>>> - Add Fixes: ec8f5d8f6f76 ("crypto: qce - Qualcomm crypto engine driver")
>>>> - Add Cc: stable@vger.kernel.org
>>>> - Link to v1: https://lore.kernel.org/r/20260712-qce-broken-v1-1-85e2bff17871@gmail.com
>>>> ---
>>>>  arch/arm/configs/multi_v7_defconfig | 1 -
>>>>  arch/arm64/configs/defconfig        | 1 -
>>>>  drivers/crypto/Kconfig              | 6 +++++-
>>>>  3 files changed, 5 insertions(+), 3 deletions(-)
>>>
>>> Patch applied.  Thanks.
>>
>> Hi Herbert,
>>
>> I'd like to ask you to back this patch out. Admittedly I should have NAKed this
>> under the v1 thread but I thought the discussion we had under the Shikra series
>> and the subsequent patch making myself the maintainer of this driver (note: Demi
>> did not Cc me on this nor the Qcom mailing list at linux-arm-msm) as well as the
>> pending series[1] fixing the QCE issues was enough to imply we should not mark
>> it as broken. Please consider applying [1] if the fixes in v6 are correct.
>>
>> Bartosz
>>
>> [1] https://lore.kernel.org/all/20260717-qce-fix-self-tests-v6-0-455775fe5f6c@oss.qualcomm.com/
>
> Is the BAM locking patchset also needed?  My understanding is that
> without it, the QCE driver can still produce wrong results due to races
> with the TrustZone firmware.  Until it is merged and the self-tests
> are fixed, the driver definitely needs to be marked BROKEN.
>

No, we currently don't ship TZ firmware that could cause such interactions.
The only driver that currently suffers from such races is the NAND driver
which races with the modem firmware and it too will use the BAM locking
feature once it's upstream. However we do plan to support DRM using this IP
and this is when it'll need to account for possible races. IOW: BAM locking
is not strictly required to fix the QCE.

> Also, what can the current driver do that cannot be done better using
> software crypto?  I understand that you have future plans to add more
> features to the driver, but those are not relevant to this discussion.
>

We can offload crypto operations to the QCE saving CPU cycles but more
importantly, the QCE provides HW based isolation which some vendors care
about.

> Finally, I very much appreciate the work you have done.  I don't
> expect that the QCE driver will stay BROKEN forever.  This patch is
> purely a reflection of the current state of the driver, the speed of
> CPU-accelerated crypto, and the small message sizes used by the kernel.
>

That may have been true when you sent the v1 but with a set of proposed fixes
it'll no longer be the case.

> That said, is drivers/crypto really the right place for a restricted
> content driver?  A driver that uses dmabufs might be a better
> alternative, and would be easier to integrate with the Direct Rendering
> Manager (DRM) and Video for Linux 2 (V4L2) subsystems.
> --

These are future plans, yes. But right now we do have active users of this
IP and now also a maintainer - yours truly - who stepped up and is actively
working on this module. With the fixes applied, the driver will again pass
crypto self-tests and should not be BROKEN.

Thanks,
Bartosz

