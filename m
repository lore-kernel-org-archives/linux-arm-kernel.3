Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3358FCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yT5544sKHRC4UJIanLDlxMS/mhmwycCyd6tuBNwVOw=; b=4YOTrWMD7irIs259cdwLt/ZY2R
	uqqkZwi7Lvl4LCP06CxDWIoDFDc8dHzpeWZgkuy+PWXDCX2kePl+5UdsZHn3E5aVR48jKF0YaJQrW
	Qd0dqda5kif8/nYe7PdeqY9PI9BHfwNMjVe0uGSCnbmiRUgrEP9eRSqlHTu6QSXV9RIJvk/NEsGqk
	oDclkK0WFaHPh+UP7mbmCqbdaSH+uM6SyQBe/GOj7AUkAIIr8yjkfxtF2bfWryeqbcGMxLN+6ZdnS
	Pmt2a40ClJ3ltzSsIiRyiNwdOeHiw9hKrJsWtnqhtcLkrTb9IYjHiAFrlAFd9hOL5D30dOWaxJWU6
	t1969wiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2E8-00000000Tpm-2Kzx;
	Tue, 06 Oct 2026 10:16:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2E7-00000000Tnq-19QX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:16:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 492746053E
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Oct 2026 10:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 022391F0089A
	for <linux-arm-kernel@lists.infradead.org>; Tue,  6 Oct 2026 10:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791281810;
	bh=/yT5544sKHRC4UJIanLDlxMS/mhmwycCyd6tuBNwVOw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VHNhDMlh1OA+rNA30dbudY3rH8vebR9Wx9qabq4ztv9HecddI3IyL2Gf54ZMtQws6
	 51w+5F1mZnbP8fsgeUx0Kbcx4j5V9GZwhWFRaAoZb+2i7YQgBUosfmC8jkXsICK3a7
	 Zq/t2e1k/FOcPfJZeB0eChDmqPd8DflBR0GVgPmYA+Q1kfLD+NwCSomOQkl4rDWJw/
	 X+fFmJvdT6uIgsJApSN7U5cbeoj4hNxruosOgMISqmlz9I2+f6cn8YtMQVBF4s/jTu
	 sWiZ+0K6a//ZCrC2gqcoEuot01UkrRv2AQ3LtpJGjvcdobP8TNO45fNX56P1e1wN8y
	 uJIhuwijJCMag==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5bcbd8df6fdso245457e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:16:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzpIDPvF5JMDrV9EnEKn+bPp3TMCpLGNiqIn9X/jNq4Z7FznZAb7IugzZqBBK9Gkq4pe135TqSS6wbKCbpvue/+@lists.infradead.org
X-Gm-Message-State: AFq9FYIwaOlaj8mG4JMvgdC63lV66FH0LZrfJ5pHk1smH7wdh75w7Vs8
	0UHjYPkoOlqcJhhz2jbCBShiPDedOlD6RYw2suaWNea9dv2qQyGRUWD/qsEAFyTvEf8u8EMPC5E
	A/i+gDnSMvP6HKoZmwtzoCKN3So6GliM=
X-Received: by 2002:a05:6512:3b8a:b0:5ba:3c46:bc40 with SMTP id
 2adb3069b0e04-5bccc72009fmr448959e87.63.1791281808765; Tue, 06 Oct 2026
 03:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20261005-gpio-mxc-cleanup-v2-0-bdc3afbb35e2@nxp.com> <20261005-gpio-mxc-cleanup-v2-9-bdc3afbb35e2@nxp.com>
In-Reply-To: <20261005-gpio-mxc-cleanup-v2-9-bdc3afbb35e2@nxp.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 6 Oct 2026 12:16:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLk_1xMmHBH-H31KoS1=FXhqnMNSC6=kwVDAN-9DbaDEzA@mail.gmail.com>
X-Gm-Features: AclHuK9V7e9CfZeeOp-0WXGtKf7q_zCnp_IeV6eED5pGDx-rwyMwOeYAwsAl9Gw
Message-ID: <CAD++jLk_1xMmHBH-H31KoS1=FXhqnMNSC6=kwVDAN-9DbaDEzA@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] gpio: mxc: use BIT() macro for single-bit operations
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
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

On Mon, Oct 5, 2026 at 4:25=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> From: Peng Fan <peng.fan@nxp.com>
>
> Replace open-coded '1 << n' shifts with the BIT() macro throughout
> the driver for consistency and to avoid potential signed-shift issues
> when the bit index is 31 (1 << 31 is implementation-defined for
> signed int).
>
> No functional change.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

