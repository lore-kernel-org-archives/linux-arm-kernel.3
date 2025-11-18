Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BD6CEE35A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 22:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qpMyQPu9jIkesKfUZe3icIOgmXSz6HM39lSUCdy/FF4=; b=4CJVidDXfxYgLCbGJiY0w42tR6
	iI3UZ7gJhHi0jh5BDTCPq+llxNN72Hg/xePpwD4H2esqu9EES3kFwRFxZ8Pf4u1y1vJSKIsd0wvXO
	bBJ/UbDfsJ6uIT/aOu5ie3sRbL3kqoNLkgifTALkii9NKb5Nfuj3STtUI2lC8ZoJlEVus3DwMrUTp
	bYNshsejK+fXnLYtmHrnNdGGI+fW+b+TIBYo6M27oosfjOo0L+CDbbzyL1Dmx2lLh4H0H7gkfmmnQ
	n44F68wm7Kc2YiwzZ71JpEi8e4JP5cPgRZQoGizBDnKvqkEyvdlVoT+2rKZWD87UEqU9rxVhBhiLb
	5pg85H4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTo9-000000019j2-1Vvh;
	Tue, 18 Nov 2025 22:04:17 +0000
Received: from smtp1-g21.free.fr ([212.27.42.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLTo6-000000019hk-2bgr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 22:04:16 +0000
Received: from belgarion.local (unknown [IPv6:2a01:e0a:a6a:5f90:ec95:b1d9:10ea:943d])
	(Authenticated sender: robert.jarzmik@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id EB86FB0055E;
	Tue, 18 Nov 2025 23:03:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1763503447;
	bh=wA7xapN4wn55TAXjCx/XtytYfW/c1kqwNEm55jTd8j4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=k+MokbRhkgwcsNI0tp5xAlYiPRulfdlAz6xLIzd/wMar+D8P8zrCPv235UaJL+LUE
	 +xLqP/W4qlRxZUPr6/PB4tUfkVSHOlQ2hDlrxGnB3d2g4hL6uLYVicBhBRRFI9aBB4
	 NdB3dbh9wZDbXxFZJ4s9WpzmPDFFSyjPiQEhEPRz3Fmla6UmxqbVcPKmJ16Xv+8A/A
	 rm/KjL9H6Pwsq7TFHe/VgckcBnEJAIcWNAJTCOqBVvlpLjfnO8iKDHnPzrp2jpwBzP
	 nCkVH4UlygAGCc8UAgwVnNzhgmI3w5oC5o1y+l0Dfc0ogMtJ6rDLr1SaKDz/BteBn9
	 TtxnSIfHmSV6A==
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jisheng Zhang <jszhang@kernel.org>,  Doug Berger <opendmb@gmail.com>,
  Florian Fainelli <florian.fainelli@broadcom.com>,
  bcm-kernel-feedback-list@broadcom.com,  Linus Walleij
 <linus.walleij@linaro.org>,  Bartosz Golaszewski <brgl@bgdev.pl>,  Hoan
 Tran <hoan@os.amperecomputing.com>,  Andy Shevchenko <andy@kernel.org>,
  Daniel Palmer <daniel@thingy.jp>,  Romain Perier
 <romain.perier@gmail.com>,  Grygorii Strashko <grygorii.strashko@ti.com>,
  Santosh Shilimkar <ssantosh@kernel.org>,  Kevin Hilman
 <khilman@kernel.org>,  Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
  Masami Hiramatsu <mhiramat@kernel.org>,  Shubhrajyoti Datta
 <shubhrajyoti.datta@amd.com>,  Srinivas Neeli <srinivas.neeli@amd.com>,
  Michal Simek <michal.simek@amd.com>,  linux-gpio@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linux-omap@vger.kernel.org
Subject: Re: [PATCH v2 05/15] gpio: pxa: Use modern PM macros
In-Reply-To: <CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com>
	(Andy Shevchenko's message of "Tue, 18 Nov 2025 14:06:34 +0200")
References: <20251118003229.26636-1-jszhang@kernel.org>
	<20251118003229.26636-6-jszhang@kernel.org>
	<CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com>
User-Agent: mu4e 1.12.13; emacs 29.4
Date: Tue, 18 Nov 2025 23:03:41 +0100
Message-ID: <m2ecpvm20y.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_140415_115356_3FF54E1A 
X-CRM114-Status: GOOD (  11.97  )
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

Andy Shevchenko <andy.shevchenko@gmail.com> writes:

> On Tue, Nov 18, 2025 at 2:50=E2=80=AFAM Jisheng Zhang=20
> <jszhang@kernel.org> wrote:
>>
>> Use the modern PM macros for the suspend and resume functions=20
>> to be
>> automatically dropped by the compiler when CONFIG_PM or
>> CONFIG_PM_SLEEP are disabled, without having to use #ifdef=20
>> guards.
...zip...
>
>> -#ifdef CONFIG_PM
>>         unsigned long   saved_gplr;
>>         unsigned long   saved_gpdr;
>>         unsigned long   saved_grer;
>>         unsigned long   saved_gfer;
>> -#endif

Actually this is not equivalent to what was there before.

With Jisheng's patch, with CONFIG_PM disabled, he adds 16 bytes to=20
the
structure. You might thing today, 16 bytes is nothing. True, but=20
on a
64MB RAM devices, it's something.

That might not be a reason to reject the patch, but it's not only=20
a
"modernisation patch".

Cheers.

--
Robert

