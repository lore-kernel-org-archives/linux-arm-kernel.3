Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 077EBC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 08:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=83/6bruci8d3XeppjMMQIod4VG9vV6e31bosgCEHfPA=; b=fIG2+Oqjwlq1oU
	7dWxvO/cSrdclehnYpGPmPJzocRgXwYqqyqGImzX5FGmFSNoY1zhm0oxrcTTu5Q0zcufd0oq+Xlum
	QLeo/WSFY4Adi+A/Fm0DjdaRLu3wsp/RagTF7r1AnlGgFRv+1umJLGRT4stzBqjOV9Xu0VVyOhVxP
	12L+3dXEsGUkvHq5vn1YdlKKF5AWKUFHtjBWeHrEJ07j1/E6usGcUA9BGo4Wqg9vQEo18zffNelrp
	JhdwTqYvdJSWEHvCy7Bpt9a7JKNW/X5D5cKxN9jfjIhq/Hu8pRqHhuk6MxbChQ3ezpVZXpr+pPGoJ
	9ByKgb4WmqCE9ecLw4KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTYC-0000000HRHw-2Jlg;
	Thu, 15 May 2025 08:02:44 +0000
Received: from mail-lj1-f171.google.com ([209.85.208.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTWA-0000000HQvj-1NVP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 08:00:39 +0000
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3105ef2a071so6381821fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 01:00:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747296031; x=1747900831;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83/6bruci8d3XeppjMMQIod4VG9vV6e31bosgCEHfPA=;
        b=GH1xuNXUtVsTNAs5yfm0ISfU3Tp22zxzJBZYAvP75tm2pJxTvIRTDSUw7bS5w7aXO4
         5CUEd0mG8Jwdt3d1Qmgi9vfrCiHdTg9KlliY5CCkaIFjk1fZuGfZMfqhkiillMH9KNPF
         Ju8gdNMIE21NuW7QY9F6Yd5IJxTI2yyylFKN/UyitfZEqTP3Vuh5Nt7SClWTK4Z/fRzj
         9oZSgP4aUFe2JbsmxANa3+ZXJPhgcN5Z9PAWH3itG9gsSD69kfenmKPHyG2rvl4zW6Dv
         IT72GmrH01bNJ+SANDN2QX3Sj5T+znry8WhgQDbQ7S9XYliVNGz+oFjamHOxrF09ZHwE
         sYBA==
X-Forwarded-Encrypted: i=1; AJvYcCX+XgqrMmlGlwpnLmAZpucTCJxcUojZIKhcBz1qgosKkJ+4yORKTdC/z9acVBzPGnWo89Sulg5Zuz1qS9eHQ8Z2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgzwu5Avwf56ZNNcqa0VEFMnxt20Ck+LeTZKL47sy2GoZR/xc+
	EAlChYSANmjBtiRyF5w1tgYcrYfP5M1ozSKp+l2z256CuZsxXg758KKM22oj
X-Gm-Gg: ASbGncvJEmWurSEOV7HCg5LdjB1mjP7/ImoftlLDWp+hHcSsnqxBKv/XRPoGOvb3hXX
	7r9WM0Qbm61gk3DpliiRJBbXSjGDZD+2AoTaYZHqV6g5msrlKrFIW83V2wisOs3vq2ok08R6jzX
	jr2baVeDeiqo0517NVPm+dfeRHRArJtHCPbde11i7iotMMCxsQfVO7FJTSF4Hy8g2DaCa4uAawE
	53zmy4fLZ7dVWjfRzrwFx5EIGl9QAHezhMfmsZPfvuHTW8UHN0GZ7idvWGYMgl4+nXv0T7ZXyvw
	TOv56VAaGOazPJxpX3xpMwWEeVF3g2RGopwSETR4jTT7NF20xXbuThrJl9CXL4Csu88RoUBtCYF
	6TP45KV5z
X-Google-Smtp-Source: AGHT+IHneXGCYN0gk6iOVi2GnjGi5k58K+rHiHvX+Wimebp9tk+OHo/I29a1oWd29t3LY1jQDSgZmg==
X-Received: by 2002:a05:651c:3130:b0:30d:e104:a496 with SMTP id 38308e7fff4ca-327fac86b98mr5157851fa.40.1747296031048;
        Thu, 15 May 2025 01:00:31 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32803059f23sm248461fa.86.2025.05.15.01.00.29
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 01:00:29 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-327fcd87a3cso2433891fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 01:00:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWuKZwmI9x+hAhu3nJ5Izk+qAJxbelqjtTEg0j9zwkcx7u0HOG/oa1kR8//CZjxZ8GzGaChRGd9AHiyJKiCiOzq@lists.infradead.org
X-Received: by 2002:a05:651c:1477:b0:30b:f2d6:8aab with SMTP id
 38308e7fff4ca-327fac55a0amr5702491fa.32.1747296029090; Thu, 15 May 2025
 01:00:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250511104042.24249-1-ryan@testtoast.com> <20250511104042.24249-6-ryan@testtoast.com>
In-Reply-To: <20250511104042.24249-6-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 15 May 2025 16:00:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v64BY+8ZkoxG82MCP+-5BZAFiYMRcm4LXeke9uVfpZX2bA@mail.gmail.com>
X-Gm-Features: AX0GCFtQJojOkTJDrh1Srsp9NZ6Emv-AQGyH6XtcUh5xrCVbMWvLF3It26XNdqM
Message-ID: <CAGb2v64BY+8ZkoxG82MCP+-5BZAFiYMRcm4LXeke9uVfpZX2bA@mail.gmail.com>
Subject: Re: [PATCH v10 05/11] dt-bindings: allwinner: add H616 DE33 bus binding
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Chris Morgan <macroalpha82@gmail.com>, 
	Hironori KIKUCHI <kikuchan98@gmail.com>, Philippe Simons <simons.philippe@gmail.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Chris Morgan <macromorgan@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_010038_358564_E23FA6EB 
X-CRM114-Status: GOOD (  19.92  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, May 11, 2025 at 6:42=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
>
> Add a display engine bus binding for the DE33.
>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
>
> ---

Since this just falls back to the A64 compatible, there's no matching
driver change. Can you send this together with the DT changes instead?

Otherwise it goes unused.

ChenYu

> Changelog v1..v2:
> - Correct DE2 bus enum to reflect fallback devices accurately.
>
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
>
> Changelog v5..v6:
> - Increase reg maxItems to 3.
>
> Changelog v9..v10:
> - Remove maxItems, this was added in error to the bus binding (rather tha=
n the mixer binding) when it was split from the other bindings in an earlie=
r revision.
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-d=
e2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.ya=
ml
> index 9845a187bdf6..ea7ee89158c6 100644
> --- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> +++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> @@ -24,7 +24,9 @@ properties:
>      oneOf:
>        - const: allwinner,sun50i-a64-de2
>        - items:
> -          - const: allwinner,sun50i-h6-de3
> +          - enum:
> +              - allwinner,sun50i-h6-de3
> +              - allwinner,sun50i-h616-de33
>            - const: allwinner,sun50i-a64-de2
>
>    reg:
> --
> 2.49.0
>

