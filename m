Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA99AC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 08:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BtB7+CNVALHL1cBw/t7zuipwO3nSDX2SfGMp29Go2JQ=; b=Jn/W4u3pCSMlwDYwtSAGrA1v1w
	HPOPqA4lKE9YHTAIvDxziJ6FBamqbIVvBDAOXy0yUAwHUmV+lVX1+SNK6fIwYFShsuSL4vM8w3C+T
	jT1mI8+fqIiAQO/lFj62Qk8WODJ+mNv8IbkOQFANbVL3xIVmze1CdGWUEqLB14SDZxsDjXbO+2Y5y
	JsZo/abD5BjKFh/I3i0KIDrH4FBF2nyyVuk1sq6Mrj243cKRErRVCiVgQnIpFUiVM+UAsq/eIC9G4
	A7VWDhRjIbD3Z+mkBh6isVP3BpBVttV4oQXxeOubEKR2PDFaco5MakCPTt8OHFuY+3P4BQ6sZ1/rf
	4Zx5JkRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x624t-00000002kA9-2edB;
	Mon, 14 Sep 2026 08:30:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x624s-00000002k9w-0N6V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 08:30:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AB88541895
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:30:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9024A1F000FF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 08:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789374613;
	bh=BtB7+CNVALHL1cBw/t7zuipwO3nSDX2SfGMp29Go2JQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Xm1KGjGuvhzkkQFou5uy3P7IfpsXtKBGxJlQKkw2tRRzxaOopnmG5nhgl7U281ODU
	 Ay8I7V164UaAJUDJ2f10EcLvIgWE77cXAmaZymbjxSFQ1ZfPcRrSpBTFi4iCq9IWTA
	 lFpFJQzQXDtEsH+oePDx65QRgjzUReIim20BLPjMsp2ygo/Ngcnxkzwlnyk1oubD8W
	 ofwfIebUt2mfjcexofaItoM+0saOyVgyraJmwokRDFHiaNxFGIwE5rx8TKdplhdEG3
	 sKy9UTvFtzY+kV+m3vF0cbMYCwaHt9Wqgc3NgawfmLL30EaBlEHMAhTs7x7lj31FOY
	 ZG8mh9mnIOTqQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e023so789591e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 01:30:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxARpIwNJRXjwuu8JwNbaj+F3DjlRdJxD5oc/zEGmXLT1d7BK44mGBtre0CyqlWRneWwXNNOa2wPIAI+WSJnlN0@lists.infradead.org
X-Gm-Message-State: AFuF++mPBtGdBJ9dNd3Rr9Pej9wMvNjoyfWfm4mYiiMJ4cnMLxg0dhEa
	wbVTabKCE93tSaIqEu2/QENSgMZnu6dM2pltjECIpud/VLBlzIPMTP3AlrUtTDoE4fjdIK6eyvj
	M+JOvfKciS9SmW226g/SVl7IXNaVHV1I=
X-Received: by 2002:a05:6512:b90:b0:5b4:5854:77f2 with SMTP id
 2adb3069b0e04-5b8ae613d00mr362002e87.3.1789374612343; Mon, 14 Sep 2026
 01:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260824074427.3226457-1-andriy.shevchenko@linux.intel.com> <20260824074427.3226457-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20260824074427.3226457-4-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 10:30:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLkykrzxwWzWxJWsDWf8MomXt89GsAFzWV9kT08oPQ_gWA@mail.gmail.com>
X-Gm-Features: AcwNN1VcmtqzjQdF-ZFjxAf-sA_kNQrMzRdHTrQ0dq75GLL5ft5m5c4JgWyJOJA
Message-ID: <CAD++jLkykrzxwWzWxJWsDWf8MomXt89GsAFzWV9kT08oPQ_gWA@mail.gmail.com>
Subject: Re: [PATCH v1 3/4] pinctrl: ma35: Replace open coded fwnode_is_gpiochip()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Jacky Huang <ychuang3@nuvoton.com>, 
	Shan-Chun Hung <schung@nuvoton.com>
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

Hi Andy,

sorry for late review :(

On Mon, Aug 24, 2026 at 9:46=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Since GPIOLIB provides a helper, no need to open code it, hence
> replace that piece by fwnode_is_gpiochip().
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

I guess this needs to go in with the rest of the patches?

Yours,
Linus Walleij

