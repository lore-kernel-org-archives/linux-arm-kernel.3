Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A84C5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 08:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwJVuh2Zw3Qt8AXUUok0G3WmGrLxUvlvv8s7D0px7Nc=; b=Uxuzqay7RHaCfqrb9KmIF2CzXv
	+WwmwqTYtVEvoeLLtME5QAKUXHIfDIyaJBXRTSksJUNxha4JtbhNP0nTGgr94ULfx3sEIMkyIUgmM
	8rtwk7SJ1Xrb9xqHKKPhZKKaZu7kuue7B96ORzYJHhSmXuXV2uRSChFHMtl2Kju/lBJPtQEDD7bwE
	sMg25q7aDVkEX46B4lQ+ATahBtzPhUzyMsTNy1xv2htJktBrkQCNKVgl/UoofRDiRp+sW94FIAb/i
	epmVVt9iONHf1w1cwIKNb+XMkdpzzp12G6z9yLjwCtMCkTBwwQsEaGRLhjX8PTeKvzo3c4ERrpUzT
	hIM/86QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbfQ-00000009JJA-2ysY;
	Wed, 19 Aug 2026 08:29:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwbfO-00000009JIs-3qOx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 08:28:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D95C041FE8
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 08:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD9671F00ACA
	for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787128137;
	bh=cwJVuh2Zw3Qt8AXUUok0G3WmGrLxUvlvv8s7D0px7Nc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YD5Dsuw3BZvBKFtfmW8bkDPQpa0BWqLAY4z28YzLE/INPClagphYH4yg734Xw5Ko6
	 det6frZZqWBOjKJ4/iAbL+/1wQ1arTcvWOIAj8N735C5q1XfuMnTklpeJTGHxeVASr
	 5GiIfFdLyHLr7Hm6zlh2kF3hytn4aooz5RgQi/M/ml9DnIdWMG/r7m7jZCCLy+BmjY
	 Ij8fWK9+1kTbdEvaYSF2MHFmCgbCaKQ+4nmlwKwwZHQPa5XR3EYtFyg4kFul92WsMG
	 QlTnnKjGno4t6zFhX8ZDmbLDL8PkIeqw5W4bah/IvKxXjNTU9Abhc3lSWgwDoe4OEM
	 cENYZ4KLAksdA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b45f1cd80eso776182e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 01:28:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqElvlSv6ZLYtWnIXFWmqWKqPCFXQHSyryBuaNgLlBz+FFMM7pmfglWLifCoRQbXog03tXUIyxPWwAm3Aa6rilM@lists.infradead.org
X-Gm-Message-State: AOJu0YxzbWQR+0nxv21jU3p31qLUjoSTjvQt7OdhO93RSMTD+v0D55VA
	S6bx93FsKjV2F9myvEhckGUeHNYP1s94tm3ksc+F4rm4xRpefdOGnYDD0OmcsYby+i+AoLhW71R
	000rGJAmj/r4gogvEeQ1OJYxXqX6XIcE=
X-Received: by 2002:a05:6512:39c4:b0:5b0:1551:d85c with SMTP id
 2adb3069b0e04-5b478bcbc81mr873936e87.20.1787128136557; Wed, 19 Aug 2026
 01:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260722-contrib-pg-pixel10-initial-dts-v2-0-3abae9717feb@linaro.org>
 <20260722-contrib-pg-pixel10-initial-dts-v2-4-3abae9717feb@linaro.org>
 <20260724-dancing-skunk-of-novelty-72c1b8@quoll> <CAD=FV=U0HUdjPcg+5Vx8_ag0zLd3CZx5w5SFr38p+YwRnC_G6w@mail.gmail.com>
 <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
In-Reply-To: <CAD=FV=V2+D1m5L-0d81W3E_ih2us-SrddeBUAJtMybpQons7Ww@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 19 Aug 2026 10:28:42 +0200
X-Gmail-Original-Message-ID: <CAD++jLnQGy_LvRxMjq1s2Hs9Hn4LNTFZ0W17zC1YLs5StwfqMg@mail.gmail.com>
X-Gm-Features: AcwNN1Vl05fdJa2xPsl7u4sGvJzUiZZr27GigbzGcGgDC8MP57szGl3gF9DhpKY
Message-ID: <CAD++jLnQGy_LvRxMjq1s2Hs9Hn4LNTFZ0W17zC1YLs5StwfqMg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: google: Add initial dts for frankel/blazer/mustang
To: Doug Anderson <dianders@chromium.org>
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

Hi Doug,

note: I know what it is like to be in active product development
with a product organization with one finger constantly on the
fast forward button to get products out the door. This creates
unacceptable stress for engineers trying to at the same time
establish standards and pass formal and slow reviews.

On Wed, Aug 19, 2026 at 12:13=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:

> Is there some other documentation saying "aliases =3D=3D evil" that I
> missed? Maybe some email thread we're all supposed to have read?

Yes, kind of, it was 10 years ago and about MMC aliases for
selecting a primary device for boot:
https://lore.kernel.org/lkml/CAD=3DFV=3DXLuPWKjQBMLApRQxk0K30p_TPcztB7g_1DB=
7iRA9BGRQ@mail.gmail.com/T/
and you were in the thread, it's not pretty, leaves a bad aftertaste.
For, I think, reasons stated in my initial paragraph.

The takeway is something like "the device enumeration is policy,
not hardware information, so it should not be encoded into
the device tree", and that is not an argument about aliases
per se.

As a result (as I think, I may be wrong) MMC gained a few
properties such as:
non-removable;
no-sd;
no-mmc;
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Doc=
umentation/devicetree/bindings/mmc/mmc-controller-common.yaml

These provide a heuristic for which devices to inspect for boot.
Then on top of that I think people use schemes like EFI for finding
boot devices. (Or they still live with their quirks...)

Now this ufs0 node seems to be about calibration of some sort,
which is a more hardware adjacent subject. Is there a way to
add the entity that needs this calibration to the device tree and
reference the UFS device with a phandle along the lines of:

calibration-storage =3D <&ufs_node>;

?

Even say adding a synthetic modem node if the calibration is
for a modem is probably going to be more acceptable than an
alias.

Yours,
Linus Walleij

