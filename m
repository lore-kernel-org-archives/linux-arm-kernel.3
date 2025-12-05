Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392C4D37497
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 20:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QvV5ac3UPAUOpNjnIM4GRf8TjdDG2xguqUsq832Ab1Q=; b=XHq/VDjUxqt8Ri/3uuD+ZFPsSM
	0oBOrWWdKeL8wW9NkTIwfsb590GdaDjkxNWqDa2Nqg5Fj7LuYL37H71/UvQFYXs0SKWDmfwMV9pce
	48jE45SANBu9TcsAoZIFlYtqWFrWDfOzkkfWhqXRb3FxbpLXFczFYl3Icmj7BUWEmtedtoZs+fGPk
	zRs5VEHmSc4QgNnC2HmRAqcgCL7pxmoe+kiha/sgYvqG0++/BougpUf6enSNjVSQFW1ZRxaVXykKE
	OIkkCB1L+fi1vkwxEWYvZ9pJpTCIoJ8uzhDdiL4kfpR8MqlPx+UaO4LxNwCHUNG44MLUf0c3IrN9e
	coUKlEIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRcHG-0000000A0sQ-1ToF;
	Fri, 05 Dec 2025 20:19:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRcHF-0000000A0rN-12qg
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 05 Dec 2025 20:19:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QvV5ac3UPAUOpNjnIM4GRf8TjdDG2xguqUsq832Ab1Q=; b=EhjDJOm4k9lFGFfuZWdRZOjE1+
	yyDgSxP1Fp8lIJJBKkyh1k0TiJmzozBZSHj9DK/NIQt8ga8Ph5lATCGrPfVekUvjT/fyO8lsbhiyI
	03hh1wEw3tkTHy5GVdG9LcYBjsXrSqjTCUJot72lP1PGQBR0KCF7M150B7l0IrMwSmc1vGxxMBQCi
	jcr+dwJ2mV5fNlXEVwno1B7cR4uiYf6ayvR7UV4fxS/CxPBdbQaL91xcCGUMryTgPXvY3lXlph1IO
	cxHtbXfiU8xobR8ou5PxDjp4/i2+Tve2OCSOr5q7Q21XA2mfQrSBgR+JcuhoWeZ2CP5iRcPp9ICja
	jpflfcKg==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRbPf-00000006lmW-0Uv4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 19:24:21 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2953e415b27so28839735ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 12:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764965976; x=1765570776; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QvV5ac3UPAUOpNjnIM4GRf8TjdDG2xguqUsq832Ab1Q=;
        b=QSQ29NZn2ittFwo0g7CjEVDEWEzj2pfW5drrz8uYz69XHlfHYypve7L05JxRZ+OpJi
         Uep7xvh+3VcSbHjTbacaxGMpoyip8KRSo1+H3pSn3wQk/5kwRc96khjy3decicgWUcsu
         flpWb5tMYWu8iVnc9MjPFHh4Q7XkC1R8cXWhHK5eUmgD9bd4B+vXBlPXo3UmJTpTr7Bk
         KUyUxFkS6N7hzdVIsLbw87i0TOcTDSL91hj9PH6fyPnt39W7vt01A0sQu79wHRQFfPSD
         cNCDVavu+g2I33QHAeVfvKrsMIPmxnOSPRpq5G1lZaB9BczvcVS9pKdHKtNxtM9bdtKt
         U2Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764965976; x=1765570776;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QvV5ac3UPAUOpNjnIM4GRf8TjdDG2xguqUsq832Ab1Q=;
        b=MTqucEUh7P4izcFR6TeDrzgdlNHFjIZrbARhV6wkLdEFUhNlrmDeLc6GsXunKjITdF
         EPPw8e6UtzjKJJFYnAPET5j+oapk6/gLQYfJL3SHh0c46USdGhO208gSaQ/m90SsF/nN
         fFzqkDK5D03dDQi/MxCiiVY+ZBWdQW5rDxG/0B+od4mrzxT6PTctXA3QdW6mIBKpvZfQ
         bSspahHLBNq1QIEIZCOGQFPAeN9CnMhOhEJ0J5j7OX1L5g3Ueilxgs143OGKhLWbx8Uy
         qId5Jc0RnUInKpHFJ6ob606MDNrlrCbL1y0fZ8Mg1HcmYy5qHUinEUBzN+k8brGMMnbY
         x4vg==
X-Forwarded-Encrypted: i=1; AJvYcCWg1IyQDh1gZ8xiBPV73ZZN8kvoqrecyXQhrZxpFujwv1h4BxnDCGaXHyt3tOhDyMgG9HBCOQ4KfdFgyJUo4Jcl@lists.infradead.org
X-Gm-Message-State: AOJu0YwtEbWcOAmONGDWDoC/T2KKsAfYyntgbfq6bU4pFs2Rl5vwK9BG
	opgXn5fH6ZbwX9asL0n5SSNlvJg/aiKM/hKYZwX3GoshV2meFsX/8odp8BC3pIKSWGiRxCyWq7V
	g3wVTKmZWvHA6gcRdCAKYHIhoVviOhm4SvlL87Wm9
X-Gm-Gg: ASbGncuajpiIW0IBf30u68HwKzIGLaFXRKVeZKgB+dAHTI5OAwG898L3OmhtAHKKPCP
	xTqH3t34cHMmGsoSGEKE1H2ZexpCyKnVl2CrmH7rdn/jrFCeMbqgWBheXTMagmLXTcuk9Drtr/x
	5XjzZN0G/+n6VIGdI2xn+3dWUB03ue3FpMmk/DjwT0DAmEBlgOnQC5ZHoC+dksvo+NM/NyUcuEI
	JQSotbXHsDoit8JvDp6oq6Sj0xNOodbe/JH18YVobPB7/T5WFd89LJL4B+flqz1/AMkcsEMZnKO
	nGESFYaC8iioxZM/IXEu6y6y8EA=
X-Google-Smtp-Source: AGHT+IGbi66b69isMZCCE2vWfm2l3aWjIU/6Jm7GoDCB7TYGbRrZY7LzGOWLW8ndmCQQy2C2xov9C9hN/n0jZy26kcQ=
X-Received: by 2002:a05:7022:b95:b0:119:e56b:c74a with SMTP id
 a92af1059eb24-11e0315aa31mr278198c88.15.1764965975826; Fri, 05 Dec 2025
 12:19:35 -0800 (PST)
MIME-Version: 1.0
References: <20251205-phyb4-v8-0-c59ea80a4458@google.com> <20251205-phyb4-v8-1-c59ea80a4458@google.com>
 <18eeb1c5-d21b-4505-b6a4-472f6e191864@kernel.org> <CA+zupgwa+m8Pa=+8shORaOA1OO6zoo6zYEojFS2UDuP0doBq7A@mail.gmail.com>
 <f32e0810-56f9-417e-abf6-0cc7b361bd15@kernel.org> <CA+zupgyxQisYBnLj9_3DtcN3R1Ugfv+-p-wimFp-hnqkhrrgyA@mail.gmail.com>
 <988b3fcb-44db-45ca-823b-5ab13206bd04@kernel.org>
In-Reply-To: <988b3fcb-44db-45ca-823b-5ab13206bd04@kernel.org>
From: Roy Luo <royluo@google.com>
Date: Fri, 5 Dec 2025 12:18:59 -0800
X-Gm-Features: AWmQ_bkSdeahcfk9MTu5RJ__-7yt4YnGMQ_a-ehzxXaIp_XrZSBLGUDbWDooSxE
Message-ID: <CA+zupgzi55svWK4gHsFtdQSD9jFKbxHx_0GE2R1R5DafmYyGNA@mail.gmail.com>
Subject: Re: [PATCH v8 1/2] dt-bindings: phy: google: Add Google Tensor G5 USB PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Badhri Jagan Sridharan <badhri@google.com>, Doug Anderson <dianders@google.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Joy Chakraborty <joychakr@google.com>, Naveen Kumar <mnkumar@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_192419_293422_A9B687C2 
X-CRM114-Status: GOOD (  41.25  )
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

On Fri, Dec 5, 2025 at 11:26=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 05/12/2025 20:11, Roy Luo wrote:
> > On Fri, Dec 5, 2025 at 10:52=E2=80=AFAM Krzysztof Kozlowski <krzk@kerne=
l.org> wrote:
> >>
> >> On 05/12/2025 19:47, Roy Luo wrote:
> >>> On Fri, Dec 5, 2025 at 9:13=E2=80=AFAM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> >>>>
> >>>> On 05/12/2025 04:54, Roy Luo wrote:
> >>>>> Document the device tree bindings for the USB PHY interfaces integr=
ated
> >>>>> with the DWC3 controller on Google Tensor SoCs, starting with G5
> >>>>> generation (Laguna). The USB PHY on Tensor G5 includes two integrat=
ed
> >>>>> Synopsys PHY IPs: the eUSB 2.0 PHY IP and the USB 3.2/DisplayPort c=
ombo
> >>>>> PHY IP.
> >>>>>
> >>>>> Due to a complete architectural overhaul in the Google Tensor G5, t=
he
> >>>>> existing Samsung/Exynos USB PHY binding for older generations of Go=
ogle
> >>>>> silicons such as gs101 are no longer compatible, necessitating this=
 new
> >>>>> device tree binding.
> >>>>>
> >>>>> Signed-off-by: Roy Luo <royluo@google.com>
> >>>>
> >>>> Why intentionally dropping the tag? How are you handling this patchs=
et?
> >>>> Rewrite every time from scratch?
> >>>
> >>> Hi Krzysztof,
> >>>
> >>> I dropped the tag because a new file is being modified in this versio=
n,
> >>> Although it's just MAINTAINER file but I thought you might also want
> >>> to take a look. I wasn't sure if modifying a new file qualifies as
> >>> "substantial" so I erred on the side of caution. I should've called i=
t
> >>> out specifically in the change log. Sorry for the inconvenience.
> >>
> >> 1. so just squeeze that change into second patch and no need to ask fo=
r
> >> re-review
> >
> > That's a fair point. I will be more mindful of the review overhead
> > going forward.
> >
> >> 2. You did not read my complain fully, look:
> >>
> >>>
> >>> Regards,
> >>> Roy Luo
> >>>
> >>>>
> >>>> <form letter>
> >>>> This is a friendly reminder during the review process.
> >>>>
> >>>> It looks like you received a tag and forgot to add it.
> >>>>
> >>>> If you do not know the process, here is a short explanation:
> >>>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new vers=
ions
> >>>> of patchset, under or above your Signed-off-by tag, unless patch cha=
nged
> >>>> significantly (e.g. new properties added to the DT bindings). Tag is
> >>>> "received", when provided in a message replied to you on the mailing
> >>>> list. Tools like b4 can help here. However, there's no need to repos=
t
> >>>> patches *only* to add the tags. The upstream maintainer will do that=
 for
> >>>> tags received on the version they apply.
> >>>>
> >>>> Please read:
> >>>> https://elixir.bootlin.com/linux/v6.12-rc3/source/Documentation/proc=
ess/submitting-patches.rst#L577
> >>>>
> >>>> If a tag was not added on purpose, please state why and what changed=
.
> >>
> >> Where did you address this? You dropped the tag silently.
> >
> > Why: a new file is being modified.
> > What changed: MAINTAINER
> > What's not changed:
> > Documentation/devicetree/bindings/phy/google,lga-usb-phy.yaml
>
> I don't know if you still did not get the problem or you think that I
> really need that clear answer. So no, I do not need that clear answer, I
> understood with first reply, but you kept explaining instead of
> admitting that your changelog needs fixes. So I still do not believe you
> understood the problem here and you might repeat the mistake.

I admitted that my changelog needs fixes in my first reply.
"I should've called it out specifically in the change log. Sorry for the
inconvenience.".
Maybe you think I didn't read through because my reply was placed
before the <form letter> section, but that's a misunderstanding.
I did read through the paragraph, that's why I mentioned the
changelog in my first reply.

I also misunderstood your question of "Where did you address
this?". If you were asking where this should have been addressed,
obviously the answer is to address it in the changelog,
but I thought that was already made clear in the first reply and
you might be asking for a clear answer.

>
> I think you need someone in Google to coach in this process, because I
> even gave you the exact link describing the process and what was
> expected. I even pointed specific paragraph, so you don't need to read
> entire file!

I appreciate you pointing out the specific paragraph, I understand
you're going above and beyond here. I did read and understand
what should've been done instead for this patch.

>
> I assume you understood what should be done instead in this patchset.
> Anyway, my previous tag applies if there were no bindings changes, but I
> wasted too much time here to care anymore. The expectation from big
> companies is they do not ask community to coach on basic submission
> process. It's quite unfair to my spare, personal time after work,
> considering how much big company is making. Big company should invest in
> this coaching.
>
>
> Best regards,
> Krzysztof

Thank you for the feedback. I understand your frustration, and I
apologize for taking up your time. I will be sure to be more thorough
in the future.

Thanks,
Roy Luo

