Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B707CCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 09:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQ8x6W2VkQNawhKHTtSrP2jT7BvbDzctIfpRw7ijmfs=; b=tCGXrsC0BMObig0uhIX4LgUFpB
	P1F2E1UpFET1llCW1akPk6N3HdBi7C0yq1+Gr50dCfE6Bg+ct0qaaLSrL5F811vbw5Qf44KENBvnf
	jU78T8Vi7CunuH7QZKc6KbESNc+qYBwd/bktbf1P7XTzH8aAjnGzMYcW2+0BXdB4yGYZqLGe5UMro
	kHlx3DBaLuxo44GC3sD7EwmSjsYf4OtbS8ghKdqm//EoqlROub4IMKXGZHyAYDWD8sK9+yPrggZKq
	q6isuu4pcYauxPJCZJDXGS9DZQJm/H7zUlTy3en/q3LJdiIqjhzoYDYA3+wd4PoGHbMS3FdoKO5b3
	Oy+WWrkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQiVO-0000000D0Iu-1mFE;
	Sat, 23 May 2026 09:18:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQiVM-0000000D0II-2eRI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 09:18:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CDD9344272
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 09:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A99471F0155D
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 09:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779527927;
	bh=TQ8x6W2VkQNawhKHTtSrP2jT7BvbDzctIfpRw7ijmfs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fmP5Tzr9npguHZm4IZxldm2XUudECehSbZBMvoXNtrw4Ix0inUdagBbXgUYfC9D4B
	 sxagbtyGtB9hmTpGlq85xKhP9dLMp084u3tzJOdxVK5LU4nx69ufMXIfpftcPpF2n6
	 T+Tf/kCv/7Bwm4iQDyaB2gN9SY72Q0Pl62hZTyxaJzXl/asG416+dB1qfGHW34jHEu
	 kvN121p1QYIOTAvgrNwFtrjSq7Zraa0OvU6Q+GDru3fa2goxbQ3pB80oRRIGzyS5D2
	 LeV/iPV10ApSIn2kSD1zGhkYZhQCcRmXW8rMTJhxiUaN5/psOSyHRskXLC9AdYrNw3
	 +DNLJ+WNNBFhg==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aa0cf8bca3so7619519e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 02:18:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9tYady0oIeXLfMF5ewxxSS2CHZijyLByLE4O9s9PJKXMCIdt5wkc5sa3e1XeV1UrYuk3Y5desSLUOqS68CoTx1@lists.infradead.org
X-Gm-Message-State: AOJu0Yxe6jyYz7UM/NPPASGMMbQXd7Nbpj9vyGLlkRiLbJLalJChj07/
	GJznn/ZGY5yv2aBAjj3HCOpJDDv4gSbScj303gleIF6gPJY9C/Lok4FuzfOGs0KHE1XJThyTADh
	OIhemf4BO+xn3VNl4bEmjswtw95b05pI=
X-Received: by 2002:a05:6512:61d8:10b0:5a3:ffed:8443 with SMTP id
 2adb3069b0e04-5aa323bbfd8mr1664992e87.23.1779527926425; Sat, 23 May 2026
 02:18:46 -0700 (PDT)
MIME-Version: 1.0
References: <20260513-scmi-client-probe-log-v1-0-00b47b1be009@oss.qualcomm.com>
 <20260513-scmi-client-probe-log-v1-5-00b47b1be009@oss.qualcomm.com>
In-Reply-To: <20260513-scmi-client-probe-log-v1-5-00b47b1be009@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 11:18:34 +0200
X-Gmail-Original-Message-ID: <CAD++jL=6ikpC-BqVqP1Ev5HC37fw=K_n6rP96AxKi0jdVcyvmw@mail.gmail.com>
X-Gm-Features: AVHnY4ITOyxIjMQnX36Ad3zAiWdBbfyUfI5jUIQb0t2xoh5_kwVjSKEq8ZFTExw
Message-ID: <CAD++jL=6ikpC-BqVqP1Ev5HC37fw=K_n6rP96AxKi0jdVcyvmw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260523_021848_694255_02A91226 
X-CRM114-Status: GOOD (  10.44  )
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

On Wed, May 13, 2026 at 6:44=E2=80=AFPM Alex Tran <alex.tran@oss.qualcomm.c=
om> wrote:

> The SCMI pinctrl driver does not currently log the number of pins,
> groups, and functions discovered from firmware. This information is
> useful for confirming the firmware exposed pinctrl resources during
> debugging.
>
> Log these counts after a successful probe to align with the existing
> SCMI client driver logging pattern.
>
> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>

Other kernel maintainers want a minimalist dmesg, but not me,
so I just applied this.

If someone is upset about the noise they can send a patch
changing it to dev_dbg().

Yours,
Linus Walleij

