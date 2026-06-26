Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460C7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 13:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QIA0G/jpdUonaNek+iyuSn4PC2pWxZGQ0umU16wcyA4=; b=aZ7mGopqrfQ+sQTSXp4yI4ZPU+
	Ondh/ZzI/mn6aNaHfdbLoyhEWq3f+nzayDdxzR6mJoY4euSm8ViLAWPydL2NStlwcfCVUg07yWrOF
	coCaKl6JNoGSIGjH7d+oA3wjyMhAOARV/zhKKcYHlWWB6XOoaptm5qmeqejNMf8Qw3ocTj6qrf3gS
	QOtfwbIhSb0hDvvTdl9mQ96PQNiG0qW8fdIhVwzjcmFCaMdp/jQmqI7aqtwN4mbeCKFwQWaSB3dMu
	5lWVl/tgf/QN1CLTzDzzEKRZzc38g3Qry2A5ogMrWMGz8ZX0qisKXULQkwa3M+qZBJ66edGBCUYWu
	xkhDcwYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6V6-0000000BMeR-1zPF;
	Fri, 26 Jun 2026 13:21:44 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6V3-0000000BMdM-2uZa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 13:21:43 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-3967701fc3cso483621fa.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Jun 2026 06:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1782480099; x=1783084899; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QIA0G/jpdUonaNek+iyuSn4PC2pWxZGQ0umU16wcyA4=;
        b=aehhzwuCaC5mf9cmaxpEoQbGzMk7ZnwckUjAy4b1Crssub2Py5g8MaC0V+/lrTsdra
         fZOs9nTolJ5og80++2/tsJxxdvWweAlCx4UKrRxw/+nq1Jk0Pj57Bl0XlfUuv3l/eYcx
         QexSOKoj/LwWx5JwLnTVw534KDV7qxn2fCJn9Ql4/xANGzeM7KuyNevtASq8EurFzIhO
         OEpOs1m8QTYQ5qZyzKFE0lvC3btSAYII6xVn+NyDyB9QohujAUpKxlWLiN0XPEOjXaqD
         ni68xSPUdoOlyUoymDpoQXKiQwkQMcjAkeRNMDUG531lKZHJqCzle9zMkiHYjDfNFi0A
         q1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782480099; x=1783084899;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QIA0G/jpdUonaNek+iyuSn4PC2pWxZGQ0umU16wcyA4=;
        b=CeFofSVDt5EqAbOCawdmVbGQ/Eq4nHeT2zZkhuPIbBnnh/JRZd7mXq2nbgJLfK4Q3z
         2TggczdsSopMtbv8KEg+vnhTzEamxvF1ELFgrOUPpEwU6MQ2kVLsCd9cMYiIQdb2JrXT
         wTHX1/ZeSmlv3jBvhqdUW6GNUzUE8H2KVvCjZVeNBMlO3yoDeWd7cKS0n1xnb+UakgTd
         v5TksPmihknwz3edqgst1VfRYcwBQ7JSbNnRc2Gtrp+vhuNf89ZOeVqOIlamkF+JsAgo
         9xJTZKJA5IOoget2xCq/7xK4HeVq/JgC+V37oZw99Uh5iVny04+/ta2px0kcD1Ks5FoR
         3r6g==
X-Forwarded-Encrypted: i=1; AHgh+RpUJdkJS8KVUErONikkyIJHycIl5RN6I+gdXKr7tUNG0dULrzpCqvlQw1DpOQSXUYs2TiR7L/Qo39r56DCsFJ1Z@lists.infradead.org
X-Gm-Message-State: AOJu0Yyeo8c2gO1a3KIWPFtHDAodfZFNJ0ILxQPaQqI/gLYnlpIfFS1W
	BMf9y8bnmph695VUDUTUjrkcX4dNk0BA/J8Itgi35fFf8npCCv5Tv+EvoS9H2r7ah9I=
X-Gm-Gg: AfdE7ckWnOqvOua9R+d03l8N1EaiLs18wnqFRtc3zzP1XqfjMX1AahHEW29andGXkhs
	+HfjQkgbSUH5X9z3fbYFkZx2qsZLTwdH5mjfJBmSGBvbVW5T65BhpusovvJl9B9VxozoAp1LgpQ
	Ak9ycAH1zt/Vm0mceEIWK5W9Mqp7ZNIhwi7Agm/+MfjmojromyfD3ODh3bLCz8UzZX0alIyBJAQ
	XQavVH40LEC8yXoMD5HOMPBXtyg6dy8kLaQvKu7uPVnml+2qYAh3BH0Yjhz93IiI6sYhMTkyeHg
	/m+ZjJLCXFxAAubdH28waSW+dN0LL3BePs+GzsupdhwgKJ89xXqpSoGWnpj6RPh74SN3P853PD1
	fQ/4q49fLYGQZyEV3IVEPXN+/iu/AO/uOGwpRhPJl8Jhyd/qAqYGkMh2YgGvHyaNMbKETJQayqN
	THDrvUyhmLa/wwVDysDzNxxHdPQpw/qeiGgy39SPPkFhy8E1Ox7J251E8BEZqwlwHuvy0jjHhZE
	0z8dA==
X-Received: by 2002:a05:651c:1511:b0:39a:c9d5:3c65 with SMTP id 38308e7fff4ca-39acb97be3emr7979051fa.8.1782480099479;
        Fri, 26 Jun 2026 06:21:39 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ae2613f76sm460481fa.30.2026.06.26.06.21.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 06:21:38 -0700 (PDT)
Message-ID: <2f238823-d340-4cad-b6f0-24ff86ff969b@linaro.org>
Date: Fri, 26 Jun 2026 16:21:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] media: dt-bindings: video-interface-devices: add
 video-interface-devices.h references
To: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>,
 Matthias Fend <matthias.fend@emfend.at>,
 Mikhail Rudenko <mike.rudenko@gmail.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Michael Riesch <michael.riesch@collabora.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Sylvain Petinot <sylvain.petinot@foss.st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Paul Elder <paul.elder@ideasonboard.com>,
 Martin Kepplinger <martin.kepplinger@puri.sm>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Richard Acayan <mailingradian@gmail.com>,
 Thierry Reding <thierry.reding@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux@ew.tq-group.com, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
References: <20260626-kbingham-orientation-v2-0-47178be927b4@ideasonboard.com>
 <20260626-kbingham-orientation-v2-2-47178be927b4@ideasonboard.com>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260626-kbingham-orientation-v2-2-47178be927b4@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_062141_772414_1CF0449C 
X-CRM114-Status: GOOD (  21.09  )
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

On 6/26/26 15:07, Kieran Bingham wrote:
> Expand the documentation of the video-interface-devices orientation to
> reference the include/dt-bindings/media/video-interface-devices.h header
> which provides human readable defines for the orientation enum, to help
> avoid hardcoding values in dts.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>   .../bindings/media/video-interface-devices.yaml         | 17 +++++++++++------
>   1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/video-interface-devices.yaml b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> index a81d2a155fe6..c9c3f4f16719 100644
> --- a/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> +++ b/Documentation/devicetree/bindings/media/video-interface-devices.yaml
> @@ -392,17 +392,22 @@ properties:
>         The orientation of a device (typically an image sensor or a flash LED)
>         describing its mounting position relative to the usage orientation of the
>         system where the device is installed on.
> +      See include/dt-bindings/media/video-interface-devices.h.
> +
>       $ref: /schemas/types.yaml#/definitions/uint32
>       enum:
> -        # Front. The device is mounted on the front facing side of the system. For
> -        # mobile devices such as smartphones, tablets and laptops the front side
> -        # is the user facing side.
> +        # MEDIA_ORIENTATION_FRONT
> +        # The device is mounted on the front facing side of the system. For
> +        # mobile devices such as smartphones, tablets and laptops the front
> +        # side is the user facing side.
>         - 0
> -        # Back. The device is mounted on the back side of the system, which is
> +        # MEDIA_ORIENTATION_BACK
> +        # The device is mounted on the back side of the system, which is
>           # defined as the opposite side of the front facing one.
>         - 1
> -        # External. The device is not attached directly to the system but is
> -        # attached in a way that allows it to move freely.
> +        # MEDIA_ORIENTATION_EXTERNAL
> +        # The device is not attached directly to the system but is attached in
> +        # a way that allows it to move freely.
>         - 2
>   
>   additionalProperties: true
> 

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

-- 
Best wishes,
Vladimir

