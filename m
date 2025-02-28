Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BA6C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 17:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y/RtQC/ZqMiqlAwLgN/RxMo2XuVJ4B9B3hd4T+t3P24=; b=pqkaV5LPDtCUyApCk9k88LvxJE
	ILlkqF2dZ21y7QaD78pYC8u6S/rDbsxdjDz5xelPwj/q58agUUJY3CLOtkZNs7Ct/p3XjB75j8K8u
	DKPuY9Q1jVddTC/O9Yae1Ij47FKQ6UQMJcDD4f20wHuQW+zVU83VdDk5aRcXe9gmGqYMQrHnV19Li
	6XOB6YHIv+BpG5Kz4sScXB4uE0qECim9U01hGElKUvfSq5vZ6I4Jc6FUQ2w7MXHKgNl6zLlW0WLJ3
	is255Y6/yKubBUXXZGHsXc6ggYYNLxIn2uKUD/bnyF8iiyoRDKg5fYlN0IDX/iklvPpjlMK+FoxZE
	ACCbMQkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to3uo-0000000Bsu5-0hMa;
	Fri, 28 Feb 2025 17:12:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to3pr-0000000Bqwv-0MZd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 17:07:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BACD35C689E
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 17:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF8CC4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 17:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740762458;
	bh=uz7YWAd8O0uBi8Im2yha/KDIrRaCObz+LjL/VNUp47k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=V1Bc1gJjVvY8uePckrHl2AFcrmUlPiqmSt+OKYDZaaYAJRwiCi7f0yG9+fWABXU+G
	 5mDN83OtUY092ZtJNVZ7g5fiq40tlGcK6KT5FUYAlbUikn9TLl7XAZy7tpFucqLjpR
	 xHQJr6rEUrjVcvVH2MeWvnY9qymeF6QoGzQkMVrWWw0LQho2OfjP5wydZF69WBOXIY
	 Y1P79tmbbAWlev1lftPgkAbmrCpT5K4GQoq7zcrnMQO6Vt/mKR5+kBSVH1Qu2n7CDU
	 2n70Q8nmFGdOThFtacF8TESbv4hy5Lm0kP8rRqr3sCrUxZ1XVp3BORJEyhg9ZHC/9B
	 Ew3pJIqBi0btQ==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e04064af07so4271550a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 09:07:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXI3iHqE+NO1e+8NDuzzp4NwNWWdnS+5sQvvN1i9KD9ekwvFgYtzdnUyUTerLRwrNrFvUiFPiaeVsx89AfB6/Jb@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1MOnYHlJrBIweGiu69ScKSXae9n5Tzv2IwIqmFfFnFzi8VA8i
	ruLtggYYMPoi6ayW6O54xzqrAJcZxPk/Ikk1DLLhIp8sJDAT1/jsdjSYnGbqjTRx/LaHsUqX17k
	XzQwobKdkwFjAR6LqK0k8T0NM9A==
X-Google-Smtp-Source: AGHT+IEHPy1qvm3dSI803ZGj26xFQwAtPW1n1+HYVcZOF+85YFAZAlcsJm1lq/IdmNqWRFeTlLzx0+mxXPel52yDr9A=
X-Received: by 2002:a05:6402:40c7:b0:5e4:c532:d69d with SMTP id
 4fb4d7f45d1cf-5e4d6926964mr3829294a12.0.1740762456471; Fri, 28 Feb 2025
 09:07:36 -0800 (PST)
MIME-Version: 1.0
References: <cover.1740421248.git.mazziesaccount@gmail.com> <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
In-Reply-To: <29ec24f1498392cafbecc0e0c0e23e1ce3289565.1740421248.git.mazziesaccount@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 28 Feb 2025 11:07:24 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+av-fptMQqBeVieKwA9c7+uUCaqZMLGu-RVJzWZ_7+Vg@mail.gmail.com>
X-Gm-Features: AQ5f1Jq19gEh952WMm9N8aBYMg7AK4rciiMO8rsTCtZsR8RobHuwRIGj0QbQL8Y
Message-ID: <CAL_Jsq+av-fptMQqBeVieKwA9c7+uUCaqZMLGu-RVJzWZ_7+Vg@mail.gmail.com>
Subject: Re: [PATCH v4 02/10] property: Add device_get_child_node_count_named()
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Jonathan Cameron <jic23@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	Nuno Sa <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>, 
	Javier Carrasco <javier.carrasco.cruz@gmail.com>, Guillaume Stols <gstols@baylibre.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Dumitru Ceclan <mitrutzceclan@gmail.com>, 
	Trevor Gamblin <tgamblin@baylibre.com>, Matteo Martelli <matteomartelli3@gmail.com>, 
	Alisa-Dariana Roman <alisadariana@gmail.com>, 
	Ramona Alexandra Nechita <ramona.nechita@analog.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_090739_213951_A5C19772 
X-CRM114-Status: GOOD (  22.62  )
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

On Mon, Feb 24, 2025 at 12:33=E2=80=AFPM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
>
> There are some use-cases where child nodes with a specific name need to
> be parsed. In a few cases the data from the found nodes is added to an
> array which is allocated based on the number of found nodes. One example
> of such use is the IIO subsystem's ADC channel nodes, where the relevant
> nodes are named as channel[@N].
>
> Add a helper for counting device's sub-nodes with certain name instead
> of open-coding this in every user.
>
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> ---
> Revision history:
> v3 =3D> v4:
>  - New patch as suggested by Jonathan, see discussion in:
> https://lore.kernel.org/lkml/20250223161338.5c896280@jic23-huawei/
> ---
>  drivers/base/property.c  | 28 ++++++++++++++++++++++++++++
>  include/linux/property.h |  2 ++
>  2 files changed, 30 insertions(+)
>
> diff --git a/drivers/base/property.c b/drivers/base/property.c
> index c1392743df9c..3f85818183cd 100644
> --- a/drivers/base/property.c
> +++ b/drivers/base/property.c
> @@ -945,6 +945,34 @@ unsigned int device_get_child_node_count(const struc=
t device *dev)
>  }
>  EXPORT_SYMBOL_GPL(device_get_child_node_count);
>
> +/**
> + * device_get_child_node_count_named - number of child nodes with given =
name
> + *
> + * Scan device's child nodes and find all the nodes with a specific name=
 and
> + * return the number of found nodes. Potential '@number' -ending for sca=
nned
> + * names is ignored. Eg,
> + * device_get_child_node_count(dev, "channel");
> + * would match all the nodes:
> + * channel { }, channel@0 {}, channel@0xabba {}...
> + *
> + * @dev: Device to count the child nodes for
> + *
> + * Return: the number of child nodes with a matching name for a given de=
vice.
> + */
> +unsigned int device_get_child_node_count_named(const struct device *dev,
> +                                              const char *name)

I think this should be implemented as
fwnode_get_child_node_count_named() with the device variant being just
a wrapper.

Rob

