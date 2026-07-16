Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76B2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 04:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8dI52NQd5mdA4AuWKzP1mtoK+n7nzP2uY77NXwFDCM=; b=vD9VEJaqyKADlPNf8Mf8QMjJOa
	QjW26Z/9QZAfCah9r6JyxbaT6gyz9XuVMPRzCWfITu1ZnmhwNeSsz3I3eVVzlvtTnLc3NhrUOLCoo
	GKcYU+oD5wjob1kLSbOFbAW0VmHkxs2u4DMYoCqUb2Ugwxi/7Nyg6qjMknU5MrTJ5KDVhM7IpNnLe
	1w4cxAptvjemIeWdrUy4eIjdUy/QHXSlZkA3Hm7nJE+ZXTsNPVdau6csCKva1BEiRWSaiLdOWLMZI
	AjvIV4kNMzKE53prH8KJqKJb1YwAzHWn8DXy4NoMY0ORfUcKTS8tPXpwPfNd0T1PAKiovgybnny5b
	h1eEN0Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkEBo-0000000GRYw-0raj;
	Thu, 16 Jul 2026 04:59:16 +0000
Received: from mail-yx1-xb136.google.com ([2607:f8b0:4864:20::b136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkEBl-0000000GRXq-0qhA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 04:59:15 +0000
Received: by mail-yx1-xb136.google.com with SMTP id 956f58d0204a3-667923d86a7so361971d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 21:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784177952; cv=none;
        d=google.com; s=arc-20260327;
        b=BFvYyZMNnejZXhkyKwRBYNFtkLQV69zmRv5IkcoULPg9wi3ETh+736MXgDi7ril06o
         jp3AHue6nhLHOAE7S5lp2E0MjjnPrTwti/Nds6YAjL2djJ9w5uXmiAihjoSoUkSUun07
         627RdlNEN1Lf8plxjA6QHrp0Y4ph36ThqA42GP0HF9oT9Y1SedxWhLUNnhJWlX3xQLjZ
         yCOCStcmHYWN0gWQ8eryhdOKSnf73J01//uKwyIm2iRkiEwp91BLLbe1LTcxjrCW8d2I
         6Bai4I5ntUYzBRGDF0nwebnSe+QMo3LywS6AJfJiJzm2RkmDUlxyCexNooygte7VSXdA
         V6bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z8dI52NQd5mdA4AuWKzP1mtoK+n7nzP2uY77NXwFDCM=;
        fh=ylFZ/tGjaXxdRPF1BQR3TLvq9PnMDuyqXrWxRGIuGdQ=;
        b=c1x9qxFbBxxQ5Q9luLwPsu4BuVOdHiQIB6d9T4HexhzHWyyQtoYxsIcepx9ztK+yQE
         +NZKtDzLbWylTo+C7aqhVv7MSiqZBOZfEN7VpRP9JyGr7QkzUqY1f6gU0394Pit2JHRW
         sSE8rkqNKvOi4cZTXT3TVY6c8AzYxFaWQPkqb7UHhTpVAEW4Uq3FQg2a5blCOV5RDS9t
         +oKQg0x1mPexiY8xBwvd4wAPV7Ai4VvAw6gygjuLeg5fmXU5KNAaI7a9EbO1gtYqV9A8
         aWcl9QTB3wE0kplcQxRETf3OpoIInyMm5y6lF0x3fTJ09X9beTrnisoF/Oex+92cv3CH
         GuhA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784177952; x=1784782752; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z8dI52NQd5mdA4AuWKzP1mtoK+n7nzP2uY77NXwFDCM=;
        b=BuL+MWhIxqj2V1fbCmYLtGQhHBgaIVANdkSfqCPFxvk4DaYHBFMHK1Xzg8trCnus1d
         Jk3WrZzklDZjOjqQnwqb4ivowRKE8xBzKmf0nrx2dV16q4XUBp2QSHB99ZVvkEOx+9Ro
         ns/8d+favxQnIhdCBfJoptXRrRcOOWmD76WWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784177952; x=1784782752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8dI52NQd5mdA4AuWKzP1mtoK+n7nzP2uY77NXwFDCM=;
        b=YnTFoa0OXOMjKM+Z+ywsMFpAN7KhKgviOtGj1pF1WKwYQfR5TbqWtBjkz40HrloFx/
         panKJE9/dvDCgMf1O0k5k+6td2OUcwr9r4vGcsnWdUgi+qzaUUBBkVIXVeG7SXBCruR6
         LqdcHhhVJScNCHCN8DY3yF+mMERYI1ljOFCNxlX9t4QUDiF2tXc5cT5uz2/ln0D55UQk
         23uZHbD9N9tts2ZmSH7HAfuwc0lXjntyWClXhphrm3QdIHla40LKcS+Tjw8YZdVp2Vi+
         b5Nti1ArLvsUHOLlvaWlIpbqIVgqPfYogERW1Z2qmYNeQU1ZRSAfIddrLiyIU0fJ5pC1
         wMYg==
X-Forwarded-Encrypted: i=1; AHgh+RqbzzxkBasuSudisDx3oVnbSoF14WgTIi3ZQmRsM4GTAcJDr43qh1SDgA0fgOJMN+zBOKMQf9D10IPHBi+MFoge@lists.infradead.org
X-Gm-Message-State: AOJu0YwGAwDIl4xn3eCs8vtx96BX31QIQRAkZwiOlSVW3VC6WTvEQxDA
	2s7TguG45esMQoGStpRsa/hCpe1oRYE6wSkPQM4eTzF3aYXgd3bzVXB7DwgiRpzvC1mlORLFpay
	dBjmPfvAPNmRSVktwSAzdUsAnP8v+J/B12v+aNU7X
X-Gm-Gg: AfdE7ckvsE9YnCU/H9vaGLoDW56Pw6YKC8Q1wVYKENYbxlMM3v8yE5dGG6bDR+BCIoL
	0IIBSleOAytw58rNFJFRvM24NsSfs6DJmLqH4WQmb+gAGWpypaXlwaaJpuv5753L5kB7AwQiIcy
	wAl6DjW1c/PJb0U5G962txNak3HWYvR2DNNXUg4AuNiEUBpPsu8oqs8MF0O2bvBqfmZ1wiCo6Q0
	iCOn6d5wUj0f/OlRQDtnBe0RocpOec6qXNe7f2I4eBpc3auJgzSCaFSJRNiR/3dZQ5lDGjn35eG
	taDXBY5YCr2gEjck
X-Received: by 2002:a53:b784:0:b0:664:b559:d524 with SMTP id
 956f58d0204a3-66829f39e58mr611543d50.4.1784177951944; Wed, 15 Jul 2026
 21:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-4-wenst@chromium.org>
 <aldS3qTympJuVXYj@ashevche-desk.local> <CAMRc=MfHmejks83bPfe3fKzAzFySGXk2GHMA9oZdMQj0f44eTA@mail.gmail.com>
In-Reply-To: <CAMRc=MfHmejks83bPfe3fKzAzFySGXk2GHMA9oZdMQj0f44eTA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 12:59:01 +0800
X-Gm-Features: AUfX_myfMUyRbxWwYQRsbuThILT6idiwmNtqsd830qG3sUgPLjemD-RPoobAiuo
Message-ID: <CAGXv+5HGjGTrqqzJrpiQhLrCn3C6H20LXq3niPnoujQLOwgqPw@mail.gmail.com>
Subject: Re: [PATCH v5 03/16] power: sequencing: Add pwrseq_power_is_on()
To: Bartosz Golaszewski <brgl@kernel.org>
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_215913_288274_E27921B5 
X-CRM114-Status: GOOD (  27.92  )
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

On Wed, Jul 15, 2026 at 8:10=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Wed, 15 Jul 2026 11:29:02 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > On Wed, Jul 15, 2026 at 04:53:33PM +0800, Chen-Yu Tsai wrote:
> >> The power sequencing consumer API already does power on state tracking
> >> internally. Expose the state to consumers through pwrseq_power_is_on()
> >> so that they don't have to reimplement it locally.
> >
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > ...
> >
> >> +/**
> >> + * pwrseq_power_is_on() - Queries the last requested state of the pow=
er sequencer.
> >> + * @desc: Descriptor referencing the power sequencer.
> >> + *
> >> + * This returns the last requested state of the power sequencer.
> >> + *
> >> + * Returns:
> >> + * On success, 1 for on or desc is NULL (optional) and 0 for off;
> >> + * negative error number on failure.
> >
> > I would rephrase it a bit.
> >
> >  * On success, 1 for on and 0 for off; negative error number on failure=
.
> >  * If desc is NULL (means optional) return 1.
> >
> > And this rises a question: why 1? Shouldn't it be some "unknown" state?
> > (But since Bart Acked this, this doesn't prevent the patch to go, you
> >  got my tag above.)
> >
>
> No, this is good feedback. Maybe we should prefer an enum like so:
>
> enum pwrseq_state {
>         PWRSEQ_POWER_UNKNOWN,
>         PWRSEQ_POWER_ON,
>         PWRSEQ_POWER_OFF
> };

Well I think the crux of it is whether the API considers the descriptor
optional. The power on/off functions suggest that is the case.

I modeled this on reset_control_status(). I believe the rationale is that
if the reset control or pwrseq is optional, then either there is some
other mechanism to deal with the reset (GPIO) or pwrseq (GPIO + regulator),
or it's always on and operational.

In such cases and the rare case where one has to query the state, the
queries are possibly chained together and I think it makes sense to
assume the "operational" state as the fallback.

If this returns an enum, then I think the previous approach of returning
an error value for an invalid descriptor is better. One doesn't need to
learn a new set of return values.

I'm fine either way. I would just move the checks over to the consumer
side. But I think the principles guiding the overall API design is
something you need to provide:

  - Is the descriptor optional? What should the action functions
    (power on / off , or query status) return when NULL is given?
  - Is the subsystem optional? Should the stub functions besides
    pwrseq_get() return 0 instead of -ENOSYS?

Right now the API feels like the descriptor is optional but the
subsystem is not. One has to add IS_ENABLED(CONFIG_POWER_SEQUENCING)
around the consumer API to make it an optional feature.


Thanks
ChenYu

