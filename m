Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9026CE8E94
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XXGV22KvRro49WJ7P3OIHLD6ejwBPqBJIfHBY5TbCSQ=; b=5CrAUCfDcEnAWNrMzd+OvfOBb+
	RwhWpztEcfWEwnJQKiPysrXyLaiwxPKiK8mkyZitxSaY8Qt7njiCA4EaBVUSKc9Tz5hQDwl3itbA5
	6rmQZNsVZiKo81EdmNvtWU3ZBVInCX+1Zsh+qV3C1BENjlyzm1LCZogRVqQ206DyxoCapO38vkZTO
	ih4fcGxedcNylaJYjCeeFCH1S21phBB1bpGy1p098vVXaZAy3/6BmdqLYHyJYBHCq1CPqqSMOv9MV
	U+4j4KQBfJLELzJuzKlVCj7keNh/7jvXg2em+p637eYpZuOe3l9CIRmthsl+1Jffjtld6rRIewQQk
	5waHT20w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t414i-00000001AvG-0EYa;
	Thu, 24 Oct 2024 16:52:40 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4113-000000019xw-3U6X
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:48:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 61DA5A4573E;
	Thu, 24 Oct 2024 16:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9D1C4CEE3;
	Thu, 24 Oct 2024 16:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729788532;
	bh=LaYLWkO8yuCfO8X6eZ1a7AiJcXeGGIn3VLInYOF8AJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fb00uFPCMIHg/CtcINPRFL0FSf0hZAsz2HJAaie4YFEi3U+CfnMbGk0jobrkAneEY
	 8HaDvnMsxo6F7qUWVDYWopMPfyHKIxTJoe6fWQHenxmRb+s33FSPMWqYvU7p3t9OHQ
	 O0qTNSLdLiB4dRc8cgEi6GtUJGC7zxDfiveOY0J6U+BO+pARFRxnJNnet2bu5lmDM+
	 kanb0AGwtFN6HB1SPxaUmwLf/eUdYBdKHW0sRSp8UqUfGiVsbCG2KZemcWr80ow9wg
	 SO/xXJmbuQLT+n3/w2Y2hy50DOkiTnXx+36zNaE0TiHx0vTkPsjL7jKP+tgByyabNG
	 OgSTKud6bv7Nw==
Date: Thu, 24 Oct 2024 11:48:51 -0500
From: Rob Herring <robh@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>,
	Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: fsl,imx-rproc: add new
 compatible
Message-ID: <20241024164851.GA572386-robh@kernel.org>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
 <20241023162114.3354-2-laurentiumihalcea111@gmail.com>
 <ub7yylef6qyztjtg3pciamg6jjznxh3ydlqsdcg2xcoxqngpi4@j5jlex4qukyz>
 <8a017e66-6d84-4bdf-8188-9ae3428b6d17@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a017e66-6d84-4bdf-8188-9ae3428b6d17@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_094854_024738_C46361B3 
X-CRM114-Status: GOOD (  25.22  )
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

On Thu, Oct 24, 2024 at 01:47:53PM +0300, Laurentiu Mihalcea wrote:
> 
> 
> On 10/24/2024 10:45 AM, Krzysztof Kozlowski wrote:
> > On Wed, Oct 23, 2024 at 12:21:11PM -0400, Laurentiu Mihalcea wrote:
> >> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >>
> >> Add new compatible for imx95's CM7 with SOF.
> >>
> >> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> >> ---
> >>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 58 +++++++++++++++++--
> >>  1 file changed, 53 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> >> index 57d75acb0b5e..ab0d8e017965 100644
> >> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> >> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> >> @@ -28,6 +28,15 @@ properties:
> >>        - fsl,imx8qxp-cm4
> >>        - fsl,imx8ulp-cm33
> >>        - fsl,imx93-cm33
> >> +      - fsl,imx95-cm7-sof
> >> +
> >> +  reg:
> >> +    maxItems: 2
> >> +
> >> +  reg-names:
> >> +    items:
> >> +      - const: dram
> >> +      - const: mailbox
> > That's quite different programming model. Are you sure these are devices
> > from similar class/type?
> Yep, these are all Cortex-M cores. It's just that their usage differs quite a lot.
> >
> > Your big if:then: block suggests this could be separate binding.
> Ideally I would have wanted to place the compatible inside dsp/fsl,dsp.yaml as the
> programming model would have been more similar.
> 
> Unfortunately, these are different physical devices (HiFi DSP core vs CM core) even
> though they're all used for DSP purposes so I'm not sure this is entirely appropriate.

That doesn't matter too much. trivial-devices.yaml is a bunch of 
completely unrelated devices which happen to have the same binding. We 
could probably take that farther with things like trivial clock 
providers for example. 

Having 'reg' vs not is pretty clearly something that should be different 
binding.

> 
> Alternatively, if you think grouping these devices (i.e: those represented by the -dsp compatibles
> from fsl,dsp and the one represented by the compatible introduced here) under the same binding
> is alright we can just branch off from fsl,dsp and fsl,imx-rproc and create a new binding for
> these devices. I'm expecting this to be relatively clean as they have the same programming
> model.

If it's just add a compatible and nothing else somewhere, I'd do that. 
If it's more than that, then I'd make a new binding doc.

Rob

