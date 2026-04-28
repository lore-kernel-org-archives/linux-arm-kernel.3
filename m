Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E4AFF886D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 17:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ilD9fa5wTpStOFrvMge/Ku7HjrZnkaE7qBhT8ahnpw8=; b=C9PsTvOpFWk4RvEOVCB14HkC1w
	afB0evxZim1O2hyZSgqBloxf+RH/87lysiImuEuWxj0e/3LziBJQrpELMqY39HrgRKQRuTjW1Bt+k
	u6kwyyFlAoPKMqmo4fl3EnA8Kz9zRoYbRSRWvGQL982acybj88Pc6PEvgDI/H137r8CvYWRdCbzSA
	xpb72DE12OtYGrDzqDXU/mmLGx99/6K/s9HJLnE99ItrsjIjM3ckYaAnV9H+2NPGZUqErAZ1Z39RX
	NbIRiWfcDKtHwkbnAutAQhnEq5z/UCRRRfI5kiRu3U+H9900Kh+BF0Bqe+TXVUOBsgIZKsf8qrJmd
	rDTulEaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlsn-00000001zun-1Y6x;
	Tue, 28 Apr 2026 17:06:01 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlsl-00000001zua-2x2r;
	Tue, 28 Apr 2026 17:05:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA05761119;
	Tue, 28 Apr 2026 17:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3AA6C2BCAF;
	Tue, 28 Apr 2026 17:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777395958;
	bh=03kc1X5djN18NtUt3ZkSRWjk4rDjoE8IX/g6F/yzhNQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=IBm9z0e1byXGF/I29fTlHe6oH1fe9a0tQ6J9jfc41wrvSvbma+0mu25dt2z/M0ar3
	 12F7INIbcYf6SPJjSdH+TDDUj7N1UvuIkzo5W0z7yCU21DDiYZU54arKAXeT8yMO1t
	 spEoQbEs5LAiB51pKte/ZrZGkQwGduQ3Y3s5XD1RPoTtQ1ngY+5fAxOLC+IzHuSUop
	 jO/tLxCedihbsdUFwYg5kw7RewkZ0JG1Qh1nHBIz7AfHESJqQxkBMShsgD5cOx2WWa
	 82ZmOmZDUSVJ39BmW6VqKVTBoREOqVexjgaymNffwHnY0yVZHDZzMGldMA2MqXyr/5
	 kVWfwIFB4E10g==
Date: Tue, 28 Apr 2026 18:05:47 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome
 Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>, Rosen Penev <rosenp@gmail.com>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] iio: adc: meson-saradc: fix calibration buffer leak
 on error
Message-ID: <20260428180547.6efaa859@jic23-huawei>
In-Reply-To: <20260427-meson_saradc-v2-1-8981c56fd05e@gmail.com>
References: <20260427-meson_saradc-v2-1-8981c56fd05e@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
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

On Mon, 27 Apr 2026 19:26:31 +0800
Felix Gu <ustc.gu@gmail.com> wrote:

> meson_sar_adc_temp_sensor_init() allocates a buffer with
> nvmem_cell_read(), but the old code leaked it if
> syscon_regmap_lookup_by_phandle() failed.
> 
> Fix this by adding missing kfree(buf).
> 
> Fixes: d6f2eac64403 ("iio: adc: meson: no devm for nvmem_cell_get")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
Applied. Thanks

J

