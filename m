Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3911C5DF88
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 17:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fe7DkO5aRoKlOx5BdmX7YNUhZMMlLH8G7Y1MOtuX6k4=; b=fH0Ks44EnDpMgU9fJMkcDLa6K6
	bBEtuvGFRrJYSDIv1I50V/rj5WwJlwpmylocEyrwOZFwytaW29HtwvFY61DYA0RuuQ9zBqtnG/Vmd
	OP7ZNSFUAH52rwss+ydcS6JwDRnGvpeu99rQ6PhydR5qDTg+9dxOvkHWNKBUw8XMY2ec1nB73a73A
	EHugqpGroRPMAgC9DVbostsDYJ32OpJeSw9EZNgC6WV+AOyvG49Mki1vrz4wWTjarLOUX2igurhV1
	zZ1YqFqkkT6e7BhD2WOfxHQltXAjDODbUUjM1BjBYwWOK47VqJLasPLCBbaAC6EqnWSR9Lx4+atE7
	9LF+MK5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjhl-0000000AF8s-1gNL;
	Wed, 19 Aug 2026 17:03:57 +0000
Received: from mail-ua1-x92f.google.com ([2607:f8b0:4864:20::92f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwjhg-0000000AF7v-2hiW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 17:03:54 +0000
Received: by mail-ua1-x92f.google.com with SMTP id a1e0cc1a2514c-9690c99c917so501471241.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 10:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787159031; x=1787763831; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fe7DkO5aRoKlOx5BdmX7YNUhZMMlLH8G7Y1MOtuX6k4=;
        b=Xtkj7BZEZbByGNbfcDA6anrwjyO9CK33wpBIiLbDP8U736ip+OI5ShVLQXTQ0zUzxP
         Gprk8GBd2kNl/47sX+YPoeFxi4hco+SCKrJ9pysNnIAIWo/vybktOcByBUplXXVpLCpa
         m/+wLqdOGmyNBwrrmb99MbKWMF1NHqnLHApnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787159031; x=1787763831;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fe7DkO5aRoKlOx5BdmX7YNUhZMMlLH8G7Y1MOtuX6k4=;
        b=M10kgtUF1sfVXdng4+FclopSoSzT0oBOWd9zanJjNxx0YTeLrTG0rsdn25LIlFBR+v
         GXLP0ZT5i7VFQ6tU9IZQqS43b3e59XrMNOlqUQzT7bdUIt9E7H2KzchnHzVE4qN7Rdou
         CsfkaoJV7G43hRW905yVT353hdYAOiANedz3yszdyshUZrP2CkVzTHDAss0pHJGdEAs4
         sBge5TBiis5uAsCizJ0BpTKli9THLuUuqGVdgKUDNXRRBj482b0Jp8v/zhrxiplaHk7G
         P4BAuIS2fDqptfAjmm4rqC8j/M4hMsyvSdsYM5NCMxwPnzj/ftsO/hnStUxm2cmcfCS3
         kusQ==
X-Forwarded-Encrypted: i=1; AHgh+RrBaYyqAjkd5sxXXIB38GFumIX308bG6icH7N9dIC0CWv8ws/czvzqsNjkwWHNTrO3/MEEOLK6cg9kX+p8T37LF@lists.infradead.org
X-Gm-Message-State: AOJu0Ywm7+8OwsXX3c/YsblHpLXPPBMimpGaBCIMdYxk4E9+P/utpvEm
	5io9AiWZPYLHi9isLvRBZol8RmBU54qC4XmiQgBoQBArgscnfMQTmexa1OgFPjF0UN8YHVh6xFg
	C1oY=
X-Gm-Gg: AR+sD13lLNm6F1AaVvs+2G15aI0qVwqi0+z5bffiCXiRbs5eCoB8WL9mU+MPLiqGNHO
	fJHJvJtR5fp2TjrhFssIe2C5iWkbIghFFJ9cuqoEopDN6B9WT1ak2vMe/SHCZJ9Ni4z5Ai0XwkH
	I4vLZTZtPgZPmT0ey3eXVxFYW+C6uW3+KqrEv8swquk85dfRkAs2cQfhrYby4nVtJxMSgPmeik8
	lmxGCm2SJkaesrW8nSf0Ajtz60SIkfEh0zvOYY8g3iyMSbXJQy8ZXPl9JAAYfHN04xXbeGk+rzq
	u+BWJA6O2X3QnYhgcb+vx0/jOhzFxIHyhKThTBg3yT+ps9ydGMGVDZKrshrR1ehkvTNth9+Z4pe
	yEvabY12CTHLuy38CB37wGVexDBOFQ1NhySz5FcrrFshM+aJrlUPWl1GQy24HJQ24Il95q49ie5
	+Yul5agxSxDNREUUtIdHQzLK11WN9zOQjDrc1ZHADzu3elylJfz4M+Tkm2WWhISOchwxUeW6vi5
	b+Wcprq/rBrNFqcjvuMy70dvVU=
X-Received: by 2002:a05:6102:1499:b0:778:9b9f:f434 with SMTP id ada2fe7eead31-7789b9ff98bmr1285017137.11.1787159030526;
        Wed, 19 Aug 2026 10:03:50 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e25e34b9sm2828033e0c.3.2026.08.19.10.03.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 10:03:47 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-97c441f40a5so376269241.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 10:03:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqEgXsiSZyZtpSaXy5M0K8y/Odz5ugHsI90SNqIeXcv8Q7HonHjSxr5bCj9Rm1lqFS7N49c9FFvBkv3z74Cd3cI@lists.infradead.org
X-Received: by 2002:a05:6102:918:b0:778:5c2b:f836 with SMTP id
 ada2fe7eead31-7785c2bf8famr1715744137.5.1787159025695; Wed, 19 Aug 2026
 10:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com> <CAD++jLnQGy_LvRxMjq1s2Hs9Hn4LNTFZ0W17zC1YLs5StwfqMg@mail.gmail.com>
In-Reply-To: <CAD++jLnQGy_LvRxMjq1s2Hs9Hn4LNTFZ0W17zC1YLs5StwfqMg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Aug 2026 10:03:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VuVdq_=TQmONJZak84S2c2-2yQ8DS0k_odYsUfg0C+rQ@mail.gmail.com>
X-Gm-Features: AcwNN1Xq_Hs6V24rG4OhS-cjamxWAO0UpSeGmP_9xYxqjvzRBGkaMhCLOMPBOe8
Message-ID: <CAD=FV=VuVdq_=TQmONJZak84S2c2-2yQ8DS0k_odYsUfg0C+rQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org, 
	soc@lists.linux.dev, Juan Yescas <jyescas@google.com>, RD Babiera <rdbabiera@google.com>, 
	Brian Norris <briannorris@google.com>, William McVicker <willmcvicker@google.com>, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_100352_734985_D8D604D7 
X-CRM114-Status: GOOD (  37.87  )
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

Hi,

On Wed, Aug 19, 2026 at 1:29=E2=80=AFAM Linus Walleij <linusw@kernel.org> w=
rote:
>
> > Is there some other documentation saying "aliases =3D=3D evil" that I
> > missed? Maybe some email thread we're all supposed to have read?
>
> Yes, kind of, it was 10 years ago and about MMC aliases for
> selecting a primary device for boot:
> https://lore.kernel.org/lkml/CAD=3DFV=3DXLuPWKjQBMLApRQxk0K30p_TPcztB7g_1=
DB7iRA9BGRQ@mail.gmail.com/T/
> and you were in the thread, it's not pretty, leaves a bad aftertaste.
> For, I think, reasons stated in my initial paragraph.
>
> The takeway is something like "the device enumeration is policy,
> not hardware information, so it should not be encoded into
> the device tree", and that is not an argument about aliases
> per se.
>
> As a result (as I think, I may be wrong) MMC gained a few
> properties such as:
> non-removable;
> no-sd;
> no-mmc;
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/devicetree/bindings/mmc/mmc-controller-common.yaml
>
> These provide a heuristic for which devices to inspect for boot.
> Then on top of that I think people use schemes like EFI for finding
> boot devices. (Or they still live with their quirks...)

Yup, I was definitely involved in that conversation around mmc. ...and
yes, that was a frustrating topic. Though I guess I remember things a
bit differently / have a different takeaway. Specifically:

* The whole argument there was about people not liking the idea of
assigning "numbers" to MMC nodes. As I have said, I'm OK with not
having a number here and it's not central to my needs. Said another
way, people seemed to hate assigning a numeric ID to hardware devices,
which is not my goal here.

* The "mmc numbering" patches were (independently) sent again and
again by people because (shockingly, I know) people found it useful to
have their MMC devices enumerate with consistent numbers.

* In the end, support for "mmc aliases" was landed. See commit
fa2d0aa96941 ("mmc: core: Allow setting slot index via device tree
alias").


> Now this ufs0 node seems to be about calibration of some sort,
> which is a more hardware adjacent subject. Is there a way to
> add the entity that needs this calibration to the device tree and
> reference the UFS device with a phandle along the lines of:
>
> calibration-storage =3D <&ufs_node>;
>
> ?
>
> Even say adding a synthetic modem node if the calibration is
> for a modem is probably going to be more acceptable than an
> alias.

The crux of the issue is that the bootloader needs to add UFS
calibration to the device tree provided to it, and later the UFS
driver in Linux needs to find this calibration data. Since the device
tree lives outside the firmware and is provided to it, the firmware
should make the fewest assumptions about the device tree possible.

Having the firmware hardcode the path to the UFS node doesn't seem
ideal, since (I believe) device tree paths aren't guaranteed to stay
consistent according to the device tree ABI. This, and the current
downstream device tree path differs from what upstream would accept.

Using an alias seems (to me) to be a reasonable solution. However,
I've tried to express that I'm open to concrete ideas.

I appreciate your suggestion of having a separate node for calibration
storage. This feels more awkward to me than just giving up and having
the bootloader hardcode all known device-tree paths that the UFS node
might be found at. That being said, if everyone says that this would
be a great solution, I could try prototyping it. The trick would now
be that the Linux UFS driver would need to be able to find this
calibration data, so the Linux UFS driver would either need to be able
to find it at a specific hardcoded device tree path or the Linux UFS
driver would need to search the device tree for a specific
ufs-calibration compatible string.


-Doug

