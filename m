Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AB01FB44C3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 07:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbnGJiqrP8jRAcn40oS1Ab2bMTl/WwxZH6xu9xU/G1E=; b=NFw3lCH4kdeo79HCviHu6v2aJe
	EXNwbONwfdub6RTBsalaCRnQZy6qJRfkm3o/0GCgnpOj+PuPz9x3Uk4ELrFdbGOF1gIrX9NJY1k+R
	AJ7rurK34xKi0w7aCuJESkS69UckE8zS1L0JnFFBvo2lE00AJr0AKfwfsYJZkJngiTIZCiVb8nvZm
	63oew2ehIMqwBy6WZWOLAjmMWaT+eFIbmUVd1TpJlCpEMwDiz14aLwpypSv2p3mXBXWYBaTn/0Wzg
	U6V6eTVbsq2GCktvIU4t8lBYPYdic0m9Hv9CnZyRzqKwfznFjFlPLVpQ0rMbF2S1EhXOpXfc1G9Zf
	yUkxcLyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAdM-0000000Cm2T-3WyH;
	Fri, 24 Apr 2026 07:07:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGAdG-0000000Cm1L-4C2I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 07:07:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B47FF43B35
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 07:07:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F7CAC2BCB9
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777014442;
	bh=pbnGJiqrP8jRAcn40oS1Ab2bMTl/WwxZH6xu9xU/G1E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=njlx00A1MRjkjmQw2YjC10g1xTfcnCDzvhb4huNB0WmZNvulUOaNMK3/KiGBrWm27
	 bTgBWVRhU0dKV3rRvbpge7Y+9OsjRFNiwMDIAsTTFJoKr0OolQrrSlelDAIjK9vwSe
	 DRsBB1rbumOu9WZMqfVInxH+22Ihp+Jum38e3fTeuXd7yokd/6UjoEkRvv1l7yl9q4
	 lFs5FnvL1RGnS2X3BF6aoU0S6MQCVcuUoLCUmgQB21uiuiJHrnu3rV3ADbTgCnyIck
	 JrUBYmWRJi+pT+O/kDIh8/7t7wNf5NH1AH0JOrgC+WFh71fwjvsaMqIgVfZU2j79Mm
	 DmLXoGWVdm7aw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a3cee3a271so7610316e87.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Apr 2026 00:07:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/PtbBFgLEl/euVl4O2q7jkIFOcrTUPAtp05dayyxspIFBQXjEIjrQjJgiuiarpQdPjTB2M3lz5we40yBiDQSCW@lists.infradead.org
X-Gm-Message-State: AOJu0Yy65RdQkpA5i1CIYS24YUyUQio0AQKGa44xaHeZbkR1471/WwjK
	Xvk5CH9KHqASH+4EF3PvxI/+7F3QI1LxDAietOeRVJrXj1ewyaMDtxlP8ei49V167R5J8rRSiRU
	ZSJdcsPFzHj8FInNm/2185T6JmiTgqLw=
X-Received: by 2002:a05:6512:1189:b0:5a2:7c1c:74a with SMTP id
 2adb3069b0e04-5a4172e78f7mr10272865e87.29.1777014441285; Fri, 24 Apr 2026
 00:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260421-send-v5-0-ace038e63515@gmail.com> <20260421-send-v5-4-ace038e63515@gmail.com>
In-Reply-To: <20260421-send-v5-4-ace038e63515@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Apr 2026 09:07:09 +0200
X-Gmail-Original-Message-ID: <CAD++jLmLRTEjG15y1=f47te-5uirMUnpOTATA_5F21dSaWuGeA@mail.gmail.com>
X-Gm-Features: AQROBzA-9wp9u4XvJ0O13Bd6ibbYj5VYWJ5xrqchTqPmB8NQokc3_R07wRhKPaM
Message-ID: <CAD++jLmLRTEjG15y1=f47te-5uirMUnpOTATA_5F21dSaWuGeA@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] ARM: zte: Add support for zx29 low level debug
To: =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, soc@lists.linux.dev, linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_000723_063415_1935F965 
X-CRM114-Status: GOOD (  11.01  )
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

On Tue, Apr 21, 2026 at 10:24=E2=80=AFPM Stefan D=C3=B6singer
<stefandoesinger@gmail.com> wrote:

> This is based on the removed zx29 code. A separate (more complicated)
> patch will re-add the register map to the pl011 serial driver.
>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

