Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2115CC44507
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DMCjy06zEXDnbWum2gCuxx6nJG7pOKzGSJuwH+iOivg=; b=iK4qenB+uROBg95oElG1Jonlte
	XfpmCVK+hR7qQcd8ZMbEhP5vE/Jznp1IMuE9znDHGz7n0HumTB5MciYVuH0zPjZxtNXG0sepatPZ1
	uCSXp0D4jS+ChyWe5o9fAuv51HXSViqmA/v4QxvJK5g0TtlqPz8JF9EMZPvb0KdYM02up1j4rQC5G
	9utNh0+0n/H0F1gYF7jDlzOlsjtgVa+WNrQHikGpu4TyI+mttfjVJ5dRfWmxU6wL25QvUyGyYdsSJ
	1rXBnsD9JYpJHci2ubN97IBq96vFEWoQNuM5fefzH472gFN39WJ+cZO6jDs+LVGM/gGnKIKNkBPwe
	JmuLQ+cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyRh-0000000EjLQ-429f;
	Wed, 15 Jul 2026 12:10:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjyRa-0000000EjHN-01Ei
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:10:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BBEA440F23
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E7D81F0155F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 12:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784117429;
	bh=DMCjy06zEXDnbWum2gCuxx6nJG7pOKzGSJuwH+iOivg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Q84hagRT5mPR6Sg5DtuRlLw+qHQbfE0zv769VXXV9fdXQpiVBljonlJJa72YMpf7y
	 iYZKdHDeOLn8CpItSXEjn1bhf/D4qCsfnSPEa7/PTcNChMqAhAqIRMVv6IPYnjTWNf
	 f6fX48BpqcIK+ON+887Wu4FNF344byUQrM0B06tKW0vZac2Mc7MOJY+3WBJGIbOU+Y
	 s+XfEqlz2dR3TJcJ/wfD5eHKBMjk+CX2g65Qv7jgY9vFpJ/lCvVHcRqKIqgqNj8AG2
	 O0InDdM9pynSkxccpuvAM61EcsTe+9yFBOyTSh9Ps6BNkic3e+7+aR0leWcj1IPoJc
	 1hyWYWU7Tv3Eg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeae771c49so6208435e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jul 2026 05:10:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp0NHysvadOEAgQPCa8igmvgYsc/U1JwnN4/Md09nvHTvA8mms7XAsxrVf8X7Dbjn8/pcQNRN4x8QEkpzHmyNQh@lists.infradead.org
X-Gm-Message-State: AOJu0YwC6SAKl75lnITI+IllcI5Xp9C+FQzCzNbeLVhpBnW2/lJZJmTi
	gWlT1MeUb3oKyxpyXIMicecFySlyiliqQV6W3JboYjF9i4JH11QoVKggEiliXzjEDrp9d10itvp
	zDW38Zkp7IfsyyB09sH3dAOc6pp4l1BWySLRacepHLQ==
X-Received: by 2002:a05:6512:2507:b0:5ae:bcf8:e7d0 with SMTP id
 2adb3069b0e04-5b15d7baf00mr578542e87.55.1784117428284; Wed, 15 Jul 2026
 05:10:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 12:10:26 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 15 Jul 2026 12:10:26 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aldS3qTympJuVXYj@ashevche-desk.local>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-4-wenst@chromium.org>
 <aldS3qTympJuVXYj@ashevche-desk.local>
Date: Wed, 15 Jul 2026 12:10:26 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfHmejks83bPfe3fKzAzFySGXk2GHMA9oZdMQj0f44eTA@mail.gmail.com>
X-Gm-Features: AUfX_mxpntQH8Qnw3cJ2vX6VfUBu9N4HciM9BCR-9eipAChzpXbQ2rXlvYEnYl8
Message-ID: <CAMRc=MfHmejks83bPfe3fKzAzFySGXk2GHMA9oZdMQj0f44eTA@mail.gmail.com>
Subject: Re: [PATCH v5 03/16] power: sequencing: Add pwrseq_power_is_on()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Chen-Yu Tsai <wenst@chromium.org>
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

On Wed, 15 Jul 2026 11:29:02 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> On Wed, Jul 15, 2026 at 04:53:33PM +0800, Chen-Yu Tsai wrote:
>> The power sequencing consumer API already does power on state tracking
>> internally. Expose the state to consumers through pwrseq_power_is_on()
>> so that they don't have to reimplement it locally.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> ...
>
>> +/**
>> + * pwrseq_power_is_on() - Queries the last requested state of the power sequencer.
>> + * @desc: Descriptor referencing the power sequencer.
>> + *
>> + * This returns the last requested state of the power sequencer.
>> + *
>> + * Returns:
>> + * On success, 1 for on or desc is NULL (optional) and 0 for off;
>> + * negative error number on failure.
>
> I would rephrase it a bit.
>
>  * On success, 1 for on and 0 for off; negative error number on failure.
>  * If desc is NULL (means optional) return 1.
>
> And this rises a question: why 1? Shouldn't it be some "unknown" state?
> (But since Bart Acked this, this doesn't prevent the patch to go, you
>  got my tag above.)
>

No, this is good feedback. Maybe we should prefer an enum like so:

enum pwrseq_state {
	PWRSEQ_POWER_UNKNOWN,
	PWRSEQ_POWER_ON,
	PWRSEQ_POWER_OFF
};

Bart

