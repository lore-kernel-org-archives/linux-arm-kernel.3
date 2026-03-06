Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2721F513EB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 01:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LnnpqImkXVkRtFO8SEKerY26no8xsuMRJboHttlWf3g=; b=vjF3kvBbqaxmiW4vqJ4BV2lc3t
	2JjE0YUDOuIglKqCrTzII1I0s/sbxuly3zUyh1bCwUIzEP9cdZPHp3FFvi8oYbtDrtXcbLjQjrBBq
	T+1jVHav1mggsSpCiTCwZQ70pygBdtTR/I0pBFsVtgpQicmGhxd2WXkZ7+L6Xsz8KkHVfh30U+Ulg
	AdtvvXfvGZtDFL51ydB9zojz1DU4YX2RhprQQW/ZwRpWgsx8mB/Yr/EXH7K+CHJMYbZktDwdhKxwL
	aiCtyExNd2o8Vt3/tQZ70TFbdp1J8CvmLXW8Zg4jcSI+LQXyKhjPFwf3c9mzTfJJjKr0/ozYVV6Ig
	thU+QHhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJf4-00000002oaF-0XZq;
	Fri, 06 Mar 2026 01:07:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyJf3-00000002oZh-0lCu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 01:07:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3977E600B0;
	Fri,  6 Mar 2026 01:07:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B926CC116C6;
	Fri,  6 Mar 2026 01:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772759243;
	bh=GFw22hv0nK5LumC6KM0cU1KesUX8U5Cyli/4f2X+e8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZFVKmoEDXMlQiSE7CY6ctT+R8lhUh3C+cE3vW+Z6rLnXG6lRpMFsWeyLrilcHvzqe
	 vp8WwzQBj5Q32SfkiUVUZ1O87LktV+KKWey+pCa5SMjUF6DW59i4amWL33VqnBcWZm
	 oXSTpWwdKo/+yzX9PuTCcoIDnTw4WYvb/E84iY2zWEUCDXAxd6UpETi1HEeD/XSMP+
	 OdirSdNaMeGAX1pAaIl1L4BhnoA2yPQGIT0OcC3DOa7eff05koadjlGo9y/4tjQR1B
	 Gjhy6Wp2Kq5BSyuU1BW9D9raGjD/GOUKVJYOvGTS0/YNR3X6LzGtYVbKsaLf0UNUxG
	 B3lM/qEkz6QgA==
Date: Thu, 5 Mar 2026 19:07:22 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: James Calligeros <jcalligeros99@gmail.com>
Cc: linux-kernel@vger.kernel.org, Shenghao Ding <shenghao-ding@ti.com>,
	Jaroslav Kysela <perex@perex.cz>, linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Baojun Xu <baojun.xu@ti.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Shawn Guo <shawnguo@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	devicetree@vger.kernel.org, asahi@lists.linux.dev,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Kevin Lu <kevin-lu@ti.com>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v3 1/7] ASoC: dt-bindings: convert tdm-slot to YAML
Message-ID: <177275924228.907103.4367357392721304661.robh@kernel.org>
References: <20260301-tdm-idle-slots-v3-0-c6ac5351489a@gmail.com>
 <20260301-tdm-idle-slots-v3-1-c6ac5351489a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260301-tdm-idle-slots-v3-1-c6ac5351489a@gmail.com>
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


On Sun, 01 Mar 2026 18:05:20 +1000, James Calligeros wrote:
> This schema was still in plaintext form. Convert to YAML format.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/tdm-slot.txt          | 29 ----------------------
>  .../bindings/sound/tdm-slot.yaml         | 33 +++++++++++++++++++++++++
>  2 files changed, 33 insertions(+), 29 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


