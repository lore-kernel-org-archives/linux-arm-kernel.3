Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2114FC9EF8
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 13:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//g81zaHopU+0vvh6+xKDGSxSBMz+BJt8bMVAzeSb2U=; b=FynDpIynzffqKlIE+ySzjxid7b
	55+roTs1DAdvirzEObMJyVHQGuMYaZsBVHCQ2xQKNBsM5Pq6YUaIRghPW5gTASDIXA4qhRU9YQfKy
	2QJRFqPZqC8j9D72EvLvW9vgaDHra4N10hPUu/dcp8Ob9ZgmYZ9BBbKgpXaulzvd4ZghqYoUNaD8D
	pFBLhiO4E5+1EeJE816F62tvijQW8T2TJVsWR/uDx5N0sN2isZIthuVtN/QeoGixtYbQG0krhycX+
	Sy6jIP08TuGwghGDgRB3a3j2VWklSlS6NjcKt5I8dTpBkwOvoBGERovFFRyuOTT3zGDVldbczUXr3
	qmFchyKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyrTq-00000005DYB-1ecy;
	Sat, 07 Mar 2026 13:14:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyrTp-00000005DXb-0fz9;
	Sat, 07 Mar 2026 13:14:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 22324600CB;
	Sat,  7 Mar 2026 13:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1105DC2BC86;
	Sat,  7 Mar 2026 13:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772889243;
	bh=XlMEEXzB+WjMvOB+Oy4SuOD48pHVsx3JOsZamGOtvwA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=P56EtmRSfaz3NuXB7SKevKkNm9qHV4u/7m9Y66Ng8pdfeFqD0HmRDY+Mxj1UUFIG7
	 VKpWpbbwikK+8YJLtI/18IMvDhDhvXCr81YX2YqQbV74g1VQJj1435XZyP0fpWQm+9
	 VMcxdj2/ViO8pvPNi+Lf+P4unxo5/Y7PtSlQ4d18A6AWNGFS2oIR6N9rUqUlMPAVCR
	 wpZIVtmliRd10p4QcNRS30S6KpgKi/BvEhBuudTfRDTVX08Z5F92hTKfLc4IfYj0o0
	 wUuGKbnfhaSFqgpB6He7oOumkr+08PywZ0IJf//iPOKRKCmjQrRNxerBGV+DyiDwsQ
	 2njXV40/glG3Q==
Date: Sat, 7 Mar 2026 13:13:54 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Xichao Zhao
 <zhao.xichao@vivo.com>, linux-arm-kernel@lists.infradead.org (moderated
 list:ARM/Amlogic Meson SoC support), linux-amlogic@lists.infradead.org
 (open list:ARM/Amlogic Meson SoC support), linux-kernel@vger.kernel.org
 (open list)
Subject: Re: [PATCH] iio: adc: meson: no devm for nvmem_cell_get
Message-ID: <20260307131354.1875ff4b@jic23-huawei>
In-Reply-To: <20260304041716.7631-1-rosenp@gmail.com>
References: <20260304041716.7631-1-rosenp@gmail.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue,  3 Mar 2026 20:17:16 -0800
Rosen Penev <rosenp@gmail.com> wrote:

> There is no reason to extend the lifetime of this post removal of the
> driver when it's only needed in one spot.
> 
> Moved tsc_regmap assignment to avoid two nvmem_cell_put calls.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
Applied. Thanks,

