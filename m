Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8237A1098781
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 13:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Qy+7GU+674UQssxv80dQQcOtzu/oCqnTiu1huAGi5s=; b=lUOdfTKd6PuZU2bJ/D53eGQ5dI
	rEQpjveToLcdsEnroOtfYI7vQjKiUo4d9hOMdMxfHIK91FdF7lPZ4dfO7aAQUXBggdbYFOSqtZPF+
	ouzs5WweBkgKp9/kqcD3CCSOGoPMWbjHN+h7a+8OGEbk0KrgN+U477UXwPD527joMoVfrQNZgxXzF
	ObjXz5ijOxHzh6d4zO3gs9aekgZcegNp/yo+ZvHK0MFz77L/FTuGFJIUBwJhnmUS2B6TaEcZsMX6n
	YDKps94X763yh6hoRciFh5qWY0XgWtJLWmZtoBlUytvFrfgAunlQ3U8ArzTbpIKucDb9WeABC4uii
	RLstvczw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Zpj-0000000CqqB-0M0Z;
	Fri, 20 Mar 2026 13:24:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Zph-0000000Cqpm-0QZ8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 13:24:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9D5643C8A
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 13:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84464C2BCB6
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 13:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774013048;
	bh=qKboe0/DtcoJu2p1G1+lmquY232Ov8fUQpxq2txGni0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IsmxSYJe13Uh2Ham+r9TnB/dla6xbqEeqDJoJyBrjNZknv+2gLOnec6nA7rwmRRSp
	 VX3aWbHsiGogLffTRLtYztOtlD8LUlE5JsZ/+h8X5AMO5UFjDy0hehWlkJA7emwQY9
	 pdtYgrO9etYNEoUU6i8Wbq2iHg6VH9JEk5Y8yIUwQvxpzjEb0uci4kKmQf1Xj5AePh
	 1admpNUXPfJIbek+/5Xlog+ItkFA1cIM0IH7Vc8i/l14DCc6Z9HDwG3SGdmqWhRQKZ
	 v5VIafh3FUq2rN9HFg/qIeRgu71ekoko+6TS3kj3pjE82XNY464bVvJPsJ08Zgcync
	 w29Hhl9Dn72pg==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-797ab169454so6434857b3.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Mar 2026 06:24:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWIyHutreg0ZbQun69J+U1W4rlKiR20hGUwv1PfjXqIe1oU9Sdu8uHusz8f6huqgTYkkV+t7wdzgR7omJT6kEFq@lists.infradead.org
X-Gm-Message-State: AOJu0YxH7Y7clfiowBXZpTMG01cihZQJfpDjw+D/Lqf7syh9Wqabm0DR
	PqpbRz5DFGmqSSH0O4ANkYRiqYgFoA9mBsXjw5kULJ8JdApPR8mfPiRRLS3dzyvi13wSTApuafv
	UFAeSJkFGONAy8Jr7/HO8RSuuYdqWisA=
X-Received: by 2002:a05:690c:6608:b0:79a:3752:af20 with SMTP id
 00721157ae682-79a90aae9a8mr26948667b3.7.1774013047789; Fri, 20 Mar 2026
 06:24:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260313195801.2043306-1-shenwei.wang@nxp.com>
 <20260313195801.2043306-4-shenwei.wang@nxp.com> <2aa1d063-181f-4145-9f1f-7e3012c4d0af@foss.st.com>
 <104e9861-bfd4-4e0f-8967-a849edf7e6fb@lunn.ch> <CANLsYkx6KhspTjzpk51ywfgWcf-FR7-3XrH=MmBi_W6yZmMukA@mail.gmail.com>
In-Reply-To: <CANLsYkx6KhspTjzpk51ywfgWcf-FR7-3XrH=MmBi_W6yZmMukA@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Mar 2026 14:23:56 +0100
X-Gmail-Original-Message-ID: <CAD++jLkAQzQ+zzC9ycRt+CQ3801G4p=sJbg1K0h2ugHW0JnQ8w@mail.gmail.com>
X-Gm-Features: AaiRm521fZwGOYxcLS7yMLe01ZzXoPJRV2jTRRY65q686pnlDl5uPYKXfNpRPU4
Message-ID: <CAD++jLkAQzQ+zzC9ycRt+CQ3801G4p=sJbg1K0h2ugHW0JnQ8w@mail.gmail.com>
Subject: Re: [PATCH v12 3/5] gpio: rpmsg: add generic rpmsg GPIO driver
To: Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, 
	Shenwei Wang <shenwei.wang@nxp.com>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_062409_199156_508DBC59 
X-CRM114-Status: GOOD (  17.02  )
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

On Wed, Mar 18, 2026 at 5:03=E2=80=AFPM Mathieu Poirier
<mathieu.poirier@linaro.org> wrote:

> I have made this point clear before: modeling legacy protocols in
> mainline doesn't scale.  Mainline uses a single generic protocol, and
> yes, it means breaking legacy protocols.  This is the cost of moving
> to a mainline kernel.  If people want to use the legacy firmware, they
> must stick with a legacy kernel.

I mostly agree with this stance.

But it is under the assumption that the contributor is coming from the
same legal body that can define and change the firmware in question.

For example: the mainline Linux kernel supports a whole slew of
funky Apple rpmsg-like protocols. c.f. drivers/soc/apple/rtkit.c

We cannot go and tell the Asahi contributors to change the Apple
firmware to use rpmsg like everyone else, because they are not Apple,
they just want to run Linux on someone else's hardware.

In this case, the contributor is coming from the same legal body as
the one doing the firmware. I know and sympathize with the fact
that sometimes working inside a company to make changes happen
can be as hard as working on the outside, and internal structures
can be as resistant to pressure change as Microsoft, or Apple.
Additionally they hit the contributor on the head with "just get this
done, now, fast".

So it is pretty important in this situation that it is NXP that we address.
The contributor is just a representative of that legal body
in this case.

If someone *outside* of NXP, say an OpenWrt hobbyist contributor
was pushing the same patches based on code drops and reverse
engineering, the response would be *different*.

In a way the situation is a bit icky. As the Linux community we often
see all contributions as personal, individual. And the discussion here
is that of standards committee, which we are not.

So if we are addressing NXP, then we need to be explicit about that,
and careful not to put their representative in the crosshairs. It's unfair,
he's just the messenger.

Yours,
Linus Walleij

