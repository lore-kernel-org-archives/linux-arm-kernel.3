Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0758CCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 09:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t+aytgWJYWMrIeGAWf/uE60NzkgJIffFPhmKzk31inM=; b=zyLvETYUYIQYTngnMf97Ptx9bq
	65Ve35BiYrHY/0P33TzNK8K/+TEm7xlOmBbMz6juzvpkR/uVdPNdTiGdDUCc3eT3XQIMvSAwEaiU6
	j883t/eUGZAJ7jjwLZB+DNR94XiAo5mpY/mOadFh9OOoy1cwYjNpCFk9fwKilVntymHseX0ui3ZWO
	L9MVaIUgiDg7CHWduyArY3ynyqMmvjEqi2NMfwvJ9rzQ3luo+kI0cF5f7ogjemNrAP8UkmxgsIcrL
	6i1Zk9BJBDuE5bLo2PBhyW3MtksUjBxLZGZXtdxVFyNr7ZU/tkXphzMneIte/mutCz/KqHA7GUvvi
	IlpyagNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQiWv-0000000D0U0-2rKg;
	Sat, 23 May 2026 09:20:25 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQiWt-0000000D0TS-0hG8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 09:20:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CE82244565
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 09:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE6561F0155E
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 09:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779528022;
	bh=t+aytgWJYWMrIeGAWf/uE60NzkgJIffFPhmKzk31inM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cfxBsi7J9fsxEfsgvFmd2NVs986Q+ome4emmk8XKBW0g0Vb4bFRCXh3k/gEInSN8Q
	 wEXuaXm6WH4wWD/NmykWGGJpFREKgCOdeQKCh67hcMtBLIaQX8g4xf6Fj0YJaJrb6E
	 0KkeYumHzBE0gW2aIVVaoAPL6MsNZAVaieL5jDJ98UnLoSi/slwePbTpTNRRuCtkdo
	 oilPK8HHNaAyy21qLXJqkYqQiaNjU/7QbTVFL/kKpraNgzZP4FeFSD6emYDCnGFOJs
	 r6bIrTI6lLYD5KEOFKQaAN034CwriA+B+X8bZ8PfjNeuBeHNwWRDanNTFWv/061nE7
	 oe3vN4O5udvEQ==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3938cc204a7so61827791fa.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 02:20:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9FREFB1a3uNn7JvXaxhbsFn2HOianckKJBKggFW1cBPaaIjyAw8myVsAc5ifH3nj7E9hbk70IzgDJtSVWKTQmI@lists.infradead.org
X-Gm-Message-State: AOJu0YxtL+PgZWexB69+taciXGtIKepxGl7QqVy/RshlhhvkfZ3Tt8yi
	eb2o7xWTvFsY6LYdWVR9PrLkUzU875s45VNBDe5cu8IRiRz6CkGCEyk8h3RTYU1RFB//oDWrtPL
	YWhGI0mca74OTu5LXjA2tgPIXUiI4pvA=
X-Received: by 2002:a05:6512:61a:b0:5a8:ee42:c131 with SMTP id
 2adb3069b0e04-5aa323cbd13mr1605975e87.34.1779528021498; Sat, 23 May 2026
 02:20:21 -0700 (PDT)
MIME-Version: 1.0
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
 <20260513-scmi-client-probe-log-v1-5-00b47b1be009@oss.qualcomm.com> <CAD++jL=6ikpC-BqVqP1Ev5HC37fw=K_n6rP96AxKi0jdVcyvmw@mail.gmail.com>
In-Reply-To: <CAD++jL=6ikpC-BqVqP1Ev5HC37fw=K_n6rP96AxKi0jdVcyvmw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 11:20:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkCiZVOWYcN3yqLu6fOqjQhSkM0aZAbzVuoL-5hj+Lnzw@mail.gmail.com>
X-Gm-Features: AVHnY4IWSrFsqHQpeusKv0ApoYMxulT_ZRdAj0wPbeYFZEu1mlSyB-OxmXrnTAU
Message-ID: <CAD++jLkCiZVOWYcN3yqLu6fOqjQhSkM0aZAbzVuoL-5hj+Lnzw@mail.gmail.com>
Subject: Re: [PATCH 5/5] pinctrl: pinctrl-scmi: Log number of pins, groups, functions
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Jyoti Bhayana <jbhayana@google.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Guenter Roeck <linux@roeck-us.net>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_022023_246083_99EB12FF 
X-CRM114-Status: GOOD (  14.72  )
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

On Sat, May 23, 2026 at 11:18=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
> On Wed, May 13, 2026 at 6:44=E2=80=AFPM Alex Tran <alex.tran@oss.qualcomm=
.com> wrote:
>
> > The SCMI pinctrl driver does not currently log the number of pins,
> > groups, and functions discovered from firmware. This information is
> > useful for confirming the firmware exposed pinctrl resources during
> > debugging.
> >
> > Log these counts after a successful probe to align with the existing
> > SCMI client driver logging pattern.
> >
> > Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>
>
> Other kernel maintainers want a minimalist dmesg, but not me,
> so I just applied this.
>
> If someone is upset about the noise they can send a patch
> changing it to dev_dbg().

Ah scratch that, Andy made a fair point that it is available
in debugfs anyway so I dropped the patch.

Yours,
Linus Walleij

