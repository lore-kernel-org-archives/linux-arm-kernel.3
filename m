Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 114DFCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 12:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9aiTARP7drgu+dP0YCc4GfgWTsxTwUR3Caw1q6/RRg=; b=0qn1dx8EM35eG0bXKKx/TuVjz6
	b/W1ONK7ZnlQphNlkqmFOfRwDyfwT4C8bEiiwtpWayD02TEdzaY6InVhP8+9elUBJDO7cwFlrKR0Q
	wZ11DZVxg9swXaCVATk9DfM2y6Lh+HV+7xTQjZh0OQx+oVAg0ZDeguiWbaxOeMTy6SJfduafkLNMk
	it4isu/OYpOplVGDDxxyYYnK+p57ewbLENn99S3Y6Lzclp3q0jVhaclA5fQYvKzqjmTjulnIlru+n
	FoqSg36lqWsCKiJgRXomKPHm295fMuu0C54S3OyVsLNajlNLgCNSkUnIjPfzOoi3X43BVrk7XsF/e
	+oy3kNjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUng-0000000HEdw-1pur;
	Mon, 25 May 2026 12:52:56 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRUnb-0000000HEd7-03oF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 12:52:52 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso120960575e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 05:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779713569; x=1780318369; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H9aiTARP7drgu+dP0YCc4GfgWTsxTwUR3Caw1q6/RRg=;
        b=C2V9d3wUZkMNY73nlgAiqLKWnzbcHTnqzMnY8gZXMDBuW1wBUe6ouA/4l8bWDgPHps
         leOojplFDv9YQ0cBYWukarEFbjcTx8GxO7ZjbLWyBeVC3TW+meVhnMGaV99wJKoesfiy
         ixghW6L8x/geMoS3moxRxx6JNyywiYhkEjUjZ0/FeqXkvXkRWq21BcdzVSQk6wjVsymQ
         zyQnuqo4wHlTRcFQZiB3QRc1Mz50xR/9W49aYY/dm9GVz6TEh5z7g2rveb/UONhYI5wX
         zYIauLP296SoFzoxANmaLy6E8vsqQm55ezJYQICYqe0m/8+pOcuG9eRV2EDjlrF+HeYS
         n+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713569; x=1780318369;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H9aiTARP7drgu+dP0YCc4GfgWTsxTwUR3Caw1q6/RRg=;
        b=cNAdZkOAy/5QeEHNEC/5GDFwW5mT/GzNdWj5n3i0X28upajvtm0rrKXhg0bT5N9t+e
         OwmRfrQ9/tb2idAKawl6XiQDT2x8Sp/dkYaj3xOXMkv4/dHxzooa1QNt3GwvgcP9Gf50
         MJpQxR/sbGh0fTqNCobzZW8+hikaJx+JvTFzna8igyHcK1fCkQhjrG4YOyK6U+om18oH
         Jq3rBuBzUFf00AgTuxvVNbha/YhprzPvR+NnvO39mQLqHEpwavMkKJEt0mxlB5EO9f9Q
         YkLgxJQLQL1oHucEagsaMjTQNs65H5bQBw7nksO/MtCJ1u9OTZI6gyr+kCz7i/Q6zWZ/
         BkXg==
X-Forwarded-Encrypted: i=1; AFNElJ/Cir9+vD7rjT48PShcqs10r6OT92FHxO8ey+Uho3WPoFjULdiNMaZ63jL4NOJQeXxLK+cvs2ie1TtLjzZ8nXaI@lists.infradead.org
X-Gm-Message-State: AOJu0YwZFGEHlHk4lowRj2FerlN7hcQCU8odZDn4ACmvplrggQ8F0p2V
	QZ73kQlZlkuZyK6cMtTEls8Nskn1sPYL+KY0KzywiN73VwuBPyLJP6Wn
X-Gm-Gg: Acq92OHTvPOiNgmUVBOvaXuJTj7kkzzyk9Gh51aWmPvm2TNUqscSFJVb4/iKtjAHpxy
	Re/dQhFzib54G99avBbz1OFfIngfqsBm+f59g310Y+JuzSWk5C2Iz4BjLSLn1Gc/lt+PurvhkZ1
	11NuVWwJ6uyoOMa36eA3KiWGFguxBpF/5CvtD+uSwiD9b8Z91eLomKsuoZym6Nxoh+5jEn0LC9Y
	hQHFs3o2X4BPmQLOgEcOX91f/VV3PhFPaFAxXvgzN6Wy6uQgcPGatTqWntEZEJbrBCyOE3VWTob
	LpTVhgoTi9Dto0q9aLA9x/I0Ctb0Ny/m6nJ5QNTlbiFVNOyQvVid+9Rpe8gDQeFMrHIll8a6Jnf
	nu4c/LLM/r5SC6sClxKq1J5P+6l3+8dTxGZXMI+AnGpHA8JFQCxHgrY020cteq8KEbhnpGXjPN1
	e0qYebZnqsoxoNso4TawH1dGGGGuvh6tQq3muU3fob/r+S5JtWtg0HOiTJ
X-Received: by 2002:a05:600c:1c0d:b0:48f:d612:3c59 with SMTP id 5b1f17b1804b1-490424b3927mr260477655e9.9.1779713569065;
        Mon, 25 May 2026 05:52:49 -0700 (PDT)
Received: from [10.25.212.250] ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904561f682sm267142095e9.13.2026.05.25.05.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 05:52:48 -0700 (PDT)
Message-ID: <a9e929ef-f8fe-45ce-b1a1-de1c1e23dfa4@gmail.com>
Date: Mon, 25 May 2026 05:52:46 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: remoteproc: imx_rproc: document optional
 "memory-region-names"
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>,
 Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
 <20260522111849.783-2-laurentiumihalcea111@gmail.com>
Content-Language: en-US
In-Reply-To: <20260522111849.783-2-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_055251_105878_53D13B27 
X-CRM114-Status: GOOD (  14.98  )
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



On 5/22/2026 4:18 AM, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Document the optional "memory-region-names" property.
> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml     | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b64889..6679b10f9da5 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -62,6 +62,14 @@ properties:
>      minItems: 1
>      maxItems: 32
>  
> +  memory-region-names:
> +    minItems: 1
> +    maxItems: 32
> +    items:
> +      oneOf:
> +        - const: rsc-table
> +        - pattern: '^vdev[0-9](buffer|vring[0-9])$'
> +
>    power-domains:
>      minItems: 2
>      maxItems: 8

So, I think the AI bot is right on this one. I've missed the fact that the programming
model allows you to specify additional carveouts (currently not allowed by the constraints
here), based on the firmware used. An in-tree example of this would be imx95-verdin, which
takes another carveout called "m7_reserved".

Based on this, I wonder if it would make more sense to leave this property unconstrained
w.r.t the names we allow.

