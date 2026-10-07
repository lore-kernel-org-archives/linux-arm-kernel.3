Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E897CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 11:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TBxpXoaGQbR4eb5uSSham19NGk19XqmEGsKTZDgSljk=; b=op/RRTc+jRIm2PXHyXKm2rKyVx
	XYgCtREk7RhhLojbRefZfHzZq/33d8PyJC2svXinb45tyPvmE6qJ9FssC+l+/LO5AaMD7GqiK5uYT
	kfbp/pCQMdy8znexUioN76F1zmbISTzN/OQo3Rt+DnXsk/iXBXRWxtB7eKEpRMuJzUxj7nIUgGvxr
	CGJfZikYLxs/eRR3rEA1rSHJeW3CXx4qixVi2wzfpFzF3kRy7+rHuTUzdgkpuJo9D+vxy4he3V7c+
	EuyvCwjrtdhBMQYmegpx+z+gWlibItr0vbPgRjZrtyJmqC191LjzJBBFjj7QidvftdM2QaslbjufU
	rHnWDlOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPwz-00000002LGE-2G1J;
	Wed, 07 Oct 2026 11:36:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEPwx-00000002LFj-3nlh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 11:36:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 42153601FF
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2691F0089C
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Oct 2026 11:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373003;
	bh=TBxpXoaGQbR4eb5uSSham19NGk19XqmEGsKTZDgSljk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZqIzr2j9kbE/9eBn0CzV0lGbA+Bu956qDFOMpLdkA2NmRIJEdUKmvm+zPT8P/haIH
	 5isvPHdqgW3GxDOPoObQOgDp0e8ImA4zrK/oBqKZit1ECZ1rqZmcPUXGYPIyFI5xo8
	 QDnBk9GRsrkg3U/PWJIHfhazDkfBr6KKZXFiB2dYGmdtZeQYVXS0iSzPgY1iT3B2hW
	 t3mAZPKvTb1bEbL13K5pUNf82xHt9n2K8Fe6oZzj1AqcXRj5RtePvLQXo3eK0PfeRJ
	 TlwyP/Hojb2RZLPtV3yQRrNNpeZjyW7PNtlMb9IHr8ZikVTXDJSPtb/2TUYfuRXivQ
	 skiQLiPYjtvUQ==
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-49e20441e45so1305363fac.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 04:36:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy43UAWrOuzeJJ2BzU+Bkzeqs45fiTVwP7w9waScfP0sJ9PRZ+crFnnfMmRUExqXVvB6xH2CFb8ZcN+8Z6W7Km6@lists.infradead.org
X-Gm-Message-State: AFq9FYIh3ZX701umIxvHD9i0PVIxncPUJluSBlf8d8AcOlNFIcsCZFzw
	gHHtnJ9eho4KUVWO8H2ZM3sZc24ZEBIZ1HR9Bt6BQRKGSM/IxvIROSMWiQDPo8Fx2mt0WzN8C5q
	+9oUmX5T1M9XjClPgVJ2OsBruZWf5QXs=
X-Received: by 2002:a05:6870:568d:b0:470:e97e:8f8a with SMTP id
 586e51a60fabf-49f4ef2bc33mr4625121fac.26.1791373002343; Wed, 07 Oct 2026
 04:36:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-rtc_s35390a_int1-v10-0-e7b1cbc50a7b@posteo.de> <20260930-rtc_s35390a_int1-v10-1-e7b1cbc50a7b@posteo.de>
In-Reply-To: <20260930-rtc_s35390a_int1-v10-1-e7b1cbc50a7b@posteo.de>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:36:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLnoZF3OPE-XB3UB9Lt=1gq4Ofm1Xkp49HM9DnMuzbEA3g@mail.gmail.com>
X-Gm-Features: AclHuK_d0kcEVyhjiUf_VzWqfX-gVVSvbp1U-AR1wppeZzPfDg4E1ifmWd5pWUI
Message-ID: <CAD++jLnoZF3OPE-XB3UB9Lt=1gq4Ofm1Xkp49HM9DnMuzbEA3g@mail.gmail.com>
Subject: Re: [PATCH v10 1/6] dt-bindings: rtc: Add pinctrl for S35390A
To: Markus Probst <markus.probst@posteo.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Michael Langer <michael.brainbug.langer@googlemail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, Sep 30, 2026 at 5:31=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:

> Synology NAS devices use the output pin for interrupt signal 1 to wake up
> the system.
>
> Move devicetree bindings for sii,s35390a into its own file.
> Add necessary properties to configure the individual pins via pinctrl,
> which allows the interrupt signal 1 to be used for wakeup alarm.
>
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

