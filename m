Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2574CD0BB6B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 07:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=We/1lumigGvb/AvS94K3cD85LLxMLiC39f/BqFGO3xo=; b=V2aKZyD+SYfAcVyOkb7uUKbyG7
	ChBzOZdLFcrrzdL8QJexOdv58sE+UQ6z7EBv+ASQ7d9ph8HjnNGsZIcnJjKI1mvFcEQPnqX2o9GZE
	GT71i1Bfcw85s1mZ3ksxe+lHOHb2grovfHJWXAeJ5jeC3PTy7gzBuev3/DxM94WOpp9ZaTAhOXvyH
	w9uOhI8h1JO5c0GbPldNSZshuy8m73Sq9cLC/8M2wj/3/jSuMJTlXSDERVSUNKh/4uPl0lRYOqhZx
	6Bkbp2RyjSHdY46WND9dqNT8EqXqtruMqNxJjXCrU1NNqNKuazmcD3KpOO3P3zzpv/aKChPpdPf78
	dOs/dlfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sgr-0000000HBlP-3kYD;
	Thu, 24 Oct 2024 07:55:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3sXi-0000000H9NE-2QcJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 07:46:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 78D01A4519D;
	Thu, 24 Oct 2024 07:45:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86070C4CEC7;
	Thu, 24 Oct 2024 07:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729755961;
	bh=T+80owMJgrDDVyRL0LAjbSEBW9ztZO0IsWvfnxMpzZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tt1ityiMhdKTNa3OQE0xi1izaNQbq7V4iSTnwz8hIrXm86sAuKUnTVnvRU5cnPaIU
	 2Ijj75H4fbPWjP0NCtJ88qppe895e7FBMD8aekXUKgaM4pY8mvdN5xww+7YHxuOV7z
	 12K0i6K597AfMYhbPw0LUPFRtSJbb7EpJAFQpGvNuqlWkGDNIVGrDoLCswyqAjq4a3
	 4tolrgHS7cm0eMYa72kVjHHpoNnU5P3i8XMXI1Habxq/VfsysLj18ig2PIEcajXnzL
	 4uK1CWdJyWIqZX916mcSZwZtzwIER6XcmJpH3IkxygSRRj7weXE1TOHyBfPkmPSoze
	 nO5lw03ZgAexg==
Date: Thu, 24 Oct 2024 09:45:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Peng Fan <peng.fan@nxp.com>, Mark Brown <broonie@kernel.org>, 
	Takashi Iwai <tiwai@suse.com>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Jaroslav Kysela <perex@perex.cz>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, 
	Conor Dooley <conor+dt@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Iuliana Prodan <iuliana.prodan@nxp.com>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: fsl,imx-rproc: add new
 compatible
Message-ID: <ub7yylef6qyztjtg3pciamg6jjznxh3ydlqsdcg2xcoxqngpi4@j5jlex4qukyz>
References: <20241023162114.3354-1-laurentiumihalcea111@gmail.com>
 <20241023162114.3354-2-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241023162114.3354-2-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_004602_713765_738EC6C0 
X-CRM114-Status: GOOD (  13.59  )
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

On Wed, Oct 23, 2024 at 12:21:11PM -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add new compatible for imx95's CM7 with SOF.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 58 +++++++++++++++++--
>  1 file changed, 53 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index 57d75acb0b5e..ab0d8e017965 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -28,6 +28,15 @@ properties:
>        - fsl,imx8qxp-cm4
>        - fsl,imx8ulp-cm33
>        - fsl,imx93-cm33
> +      - fsl,imx95-cm7-sof
> +
> +  reg:
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: dram
> +      - const: mailbox

That's quite different programming model. Are you sure these are devices
from similar class/type?

Your big if:then: block suggests this could be separate binding.

Best regards,
Krzysztof


