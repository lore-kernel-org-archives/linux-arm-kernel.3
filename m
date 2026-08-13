Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBD4C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 03:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uAJYxuWYQfJvsQUaJRIL+oMrK23LCX8rJso9NIjzZ+0=; b=JDEBO3nguj6uDVfIuRnoPywHnp
	UtQAW39t4vBI/+qwzkgoHTS5p6jA7RsB8YFxQ8ut+nnd0+PpEaxB62Ucv+U7Ja6yoaHz0nfRi4QVm
	9psqwzFwOLPkkF4OEkO5u8wO1HQH4q6/bMYaKYngU+13iXm/LVH3Byup8mznwhawetXbnutMDnNgV
	Altq4UNAM6bGJHExVQlwnqvPjBzTInYAB5rWz9HvefRVJpUkRRrSsm4NYc9XmyoRe+r6fDb/My05f
	Jzfy5Qlca+9OqRfebmh1DnJpqApbEgvFGykYyOS5wY4qOibTsiEqzMEHY5S3gOercVMpqwr+M4U3e
	SadVTV5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuM8x-0000000HJoK-3Wu3;
	Thu, 13 Aug 2026 03:30:11 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuM8v-0000000HJnU-06bL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 03:30:10 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-66b2179133dso1714290d50.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 20:30:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786591807; cv=none;
        d=google.com; s=arc-20260327;
        b=MCptkS0VCwUUXGuC24HEBfahDu7rZnABu/XDC5kgTZhSnu4d4upyYjwBSJhnBw3A9t
         ktrkCrF+Wk5PhnXxeW0mO0qDyuMb/4DIGg/nGFJqGduQimtct9eCXj4KPTFhiLcVy/w4
         h3tlPxC0eyXQtJd1iN8wMTzSRtZ6CuBG6BDiO39bCmws5UhliO9/ZORYBiXRIUgnhSae
         iLHIRIy5WV4PVvaZ2Sd3VHBSUncAm/WCE4FLx8t01a+DrB2jUFQ8gMpXsBgF5D7UTM3J
         xPUXQmGv9qOJJERsMHcSVXg2bfRJqM4CvtvLWHGS4X/a4/2JzRii+9kV0BCHupOmwXje
         +e8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uAJYxuWYQfJvsQUaJRIL+oMrK23LCX8rJso9NIjzZ+0=;
        fh=5bCPwH+fflqlPGz61iChnrufcksOvJB8s58/E5wiw6o=;
        b=MsGx9Wr9Dt+1GAVQW5L8wwmc7r3GuCN61no/r1UVpvuICAMyg21l2+kUXAfnGqN7zN
         iwX+UtAlNKC/6HSBm4wZ5mWg4Jrwr3GL6GQPXF1XNx5PYxx7i2HbLRofGYsyxa1bqaLZ
         T5ctHjCn5KaGWn16Moy4LEP3xg2fu0fSfVb2jViH+76t03BO9OXb5AcSNnwXUf+V19xY
         P5fkYPa6j5rUNsaei9kjgIKyC5fTj8mGoig/kx4O5vZ1pCKH0GCGGfP6GfPtIRCQwkO8
         pyB9eVXGitjYOcm6HY0iQ4bkERYp8kdNIpMgMWubkqJurkotaeSRzjXcunaDPI6wmSfk
         310g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1786591807; x=1787196607; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uAJYxuWYQfJvsQUaJRIL+oMrK23LCX8rJso9NIjzZ+0=;
        b=NTYwJIHVU2WhiHcg5wUGD+kcK9w6Q251BNxvsSuuM/hMMm4PTFvWPmmcJup+FziAFK
         FRzI5vZW9BtkBTNWEQseWgbqtgpbsn6auBsLUKLaKw8N4Iv4ukFV/5+dNR5zPFMau+oC
         k1GeEpmHwGL5o3lrjsj+Ce0fkJPRVO3vMw9nQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786591807; x=1787196607;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uAJYxuWYQfJvsQUaJRIL+oMrK23LCX8rJso9NIjzZ+0=;
        b=IXh8Jt3dTwtpwOk2ky65EjqncR7BffKQOBEYYgkVHaJlVIjmT291PuYIqZm+uMrMUJ
         y16m/d7tgjqt9RY0rmPap+Sm3D0/7FUhm++qLnSdD884lWwuafE9FBJm5LNqSIg2xE3z
         qxiZNUL6ilVEM7L3prmK2Yvj3SKYmmucPak2fSjfTLhaiqAG52sSQTxmprIIyGtfuLm6
         wPrE8oTI0ksmKK2U9a1drPsfswrPR6nOfmLPizCB25ceS7iNuyQsNrWwyTG9U4zyqOPm
         opuOjLNL73D60xqn/grNmxiY9zhQ+s3dyF/+Q+/xBCQKLxsaYrqaJT857Jhiq7tx1r9o
         t3uQ==
X-Forwarded-Encrypted: i=1; AHgh+RqlPfz9kgnm2oNMYsIyO7Ky6jm0O/PBEAs0fCPOKQBabBzvgzct7PiZgh4oVPpDrsvYPAHGZFrwQ/QhsQycJBrx@lists.infradead.org
X-Gm-Message-State: AOJu0YzWQE8n8GGla0k5IRcV5W1CogTz/YSOWejqeIFdhlsuR0Y8JKIs
	eNU0cnt6GPBq32AO03we+Ir4LcgEjlE6dDSHqousYgqa401eox9tA4lJLQpaBxeuzy/ABHkkl8B
	fSZIp5X6RfKTt3SbhfNBDmF5P55tGnywMmU3FIG1F
X-Gm-Gg: AR+sD11oZrG622InCRjV+ij4C/Evu0FKG15HrjIrLbuuZ8+ONXHy14yVoWNmwTw9kt7
	fx9272hMTpa8xzpIf95ojOxy+BWoZwD6kul9Ps0lioknXNxqANNYi9VhEvjjOiMS+IuonomVtU+
	dKFeqiJ7tBo6fER6TBi4kd9MB2DrRQSoN3rfYtPomteWCqhs67LOSot4Im0c/LuaorcsBzGMC84
	Gjhikppgw5SQh8nOGNVecKAEa7g8OOt22NNkfBgmCjPsOOEuBfBUjpxaYb7C5IXJNNbUGRa7ah+
	/ow6fYRWFSBaLfnUME0YdVTSJSXQknppj5fC5AP96NOjyJJrulOJrM7msmAFPm6B7oV2+yJ0iol
	O2slMdyuhHQ==
X-Received: by 2002:a53:e5ce:0:b0:667:bae0:e565 with SMTP id
 956f58d0204a3-66c515b62fdmr981398d50.30.1786591807078; Wed, 12 Aug 2026
 20:30:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260811122011.3539250-1-wenst@chromium.org> <20260811122011.3539250-8-wenst@chromium.org>
 <an02idvk4GtZIMfn@google.com>
In-Reply-To: <an02idvk4GtZIMfn@google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 13 Aug 2026 11:29:55 +0800
X-Gm-Features: AUfX_myrCG3oNTwmlZwHDJSbsoCHFr7jcGIFmX0-QgCkqwSa3XLy1HbTAXteqh4
Message-ID: <CAGXv+5Gf0sYKvvd=JsdPsahvHCKr5rk+YiVu6SCY6ZQicJzd6g@mail.gmail.com>
Subject: Re: [PATCH v4 7/9] platform/chrome: of_hw_prober: Add delay for hana trackpads
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benson Leung <bleung@chromium.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Jiri Kosina <jikos@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-input@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_203009_103100_0D99C701 
X-CRM114-Status: GOOD (  20.07  )
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

On Thu, Aug 13, 2026 at 11:14=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
>
> On Tue, Aug 11, 2026 at 08:20:07PM +0800, Chen-Yu Tsai wrote:
> > Up until now, the MT8173 elm/hana device tree has set the dedicated
> > regulator supplying the trackpad as always-on, simply because the Elan
> > driver was missing proper delays. As a result the delay for the
> > Synaptics trackpad was also omitted, as it was not strictly required
> > under such a model and delayed the availability of the trackpad to the
> > user.
> >
> > The Elan driver recently gained proper delays after power-up, with
> > adaptive skipping of the delay if the regulator was originally
> > on. The I2C HID driver and I2C OF component prober library gained
> > similar adaptive delay skipping. The device tree will be fixed to have
> > the regulator not be always on, and proper post-power-on delay time
> > added to the I2C HID device.
> >
> > Also add the post-power-on delay to the ChromeOS OF component prober,
> > so that if the regulator is off at the time of probing, the prober know=
s
> > to wait for the hardware to initialize.
>
> > [...]
>
> This looks harmless even without the aforementioned patches.

As mentioned in the cover letter, it is harmless, but will delay the
probing and subsequent enablement of the trackpad.


> Applied to
>
>     https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux=
.git for-next
>
> [7/9] platform/chrome: of_hw_prober: Add delay for hana trackpads
>       commit: 81c1c0cb68a13d14dd1bbffcf4c49e26f9a6478c
>
> Thanks!

Thanks!

ChenYu

