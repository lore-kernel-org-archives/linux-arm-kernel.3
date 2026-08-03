Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA84C55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 06:08:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+429yca2FdBmTXuXrcptqdw7Fqp7trYqd3GPV3frqbY=; b=I8eqfHyVBuC9J3VYbQwe9AzHhu
	FQSk11RV4DcZkvBgzUqNQX/NgP9+aFxReVOvcma4igitxm7vwD0bglJjN29VKIiqLqY58h/wnhaQC
	h6+khwrLj1wHFbauKjuNaLrzr3IzJKFwbFy1q9+djCfv14LoaIyNH+oc3WPvsqwU0iauydGmmpN8u
	D3JOlpr2zR9SibSjAshnVNnI8Ud7tIm78rayro87A1wXafZOKtc4V63ASDGR3L73YZPJALp19IyjC
	hSh5jBPbaS5KCaCrgi4PQaDFqyyJMeq/1SViC9mJFUrbkLOz75uZFu22KEE9R2DQwm1R6HhHoQO87
	KR27qAtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqlqs-0000000GPwI-3LWE;
	Mon, 03 Aug 2026 06:08:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqlqr-0000000GPvx-3yBk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 06:08:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 958B74125A;
	Mon,  3 Aug 2026 06:08:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A350A1F000E9;
	Mon,  3 Aug 2026 06:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785737321;
	bh=+429yca2FdBmTXuXrcptqdw7Fqp7trYqd3GPV3frqbY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=TCBYUIhHN4DucVc47pLstmUpT4hF82ufvFaZBEzKeeOWC127Bun1glCqoNRff040R
	 Tzm5d8Wy9KdrAXEJ671Bd7m6HVMD45VuBir9mvQnnDlSeiyvvHowCX0O1RCkrkcR/t
	 wcsrKji5wfh/fyLijxWZVpeL6NHsBInN90EqhSZgv87/UUkYJyHlCcEGIxwo/+PTy+
	 EogkVA6flmZMn5h69PEiME9B11PBZ6nxS5S4WXF1eMAoF49Uw85PQFamsJYg7UPaiQ
	 vtJyPXIJWlYQrIqZLNsyztIt9V1i/L0jO/QsRcWSzdikc2zfPC1Pq5JbTc5C81f1lE
	 S6AKIphzKGKFw==
Message-ID: <702e24f0-7dee-4a12-9665-49e85f407b16@kernel.org>
Date: Mon, 3 Aug 2026 09:08:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/16] iio: adc: at91-sama5d2_adc: rework temp
 calibration layout handling
To: Varshini Rajendran <varshini.rajendran@microchip.com>, jic23@kernel.org,
 dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, srini@kernel.org,
 marcelo.schmitt@analog.com, radu.sabau@analog.com,
 Jonathan.Santos@analog.com, jorge.marques@analog.com,
 joshua.crofts1@gmail.com, jishnu.prakash@oss.qualcomm.com,
 antoniu.miclaus@analog.com, mazziesaccount@gmail.com,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260727122633.117435-1-varshini.rajendran@microchip.com>
 <20260727122633.117435-4-varshini.rajendran@microchip.com>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <20260727122633.117435-4-varshini.rajendran@microchip.com>
Content-Type: text/plain; charset=UTF-8
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

On 7/27/26 15:26, Varshini Rajendran wrote:
> Extend support to handle different temperature calibration layouts.
> 
> Add a temperature calibration data layout structure to describe indexes
> of the factors P1, P4, P6, tag, minimum length of the packet and the
> scaling factors for P1 (p1_scale) which are SoC-specific instead of the
> older non scalable id structure. This helps handle the differences in the
> same function flow and prepare the calibration data to be applied.
> 
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>

Reviewed-by: Eugen Hristev <ehristev@kernel.org>

