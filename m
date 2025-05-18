Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D21B5C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 16:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/hg4XOiM8dzAP+sj3OctfJb8nVC7grXLEYczEbyGvks=; b=T+HGsv1DbmXxxR
	lXy4IL2BnipL3IJ78rRoF7VTNCnSTVeqhVbb2lq0Z1a3PzZDaYyfZ3jD9H42fDAXkPWO6WqJVQgij
	ubLM6BAps03kmgXkxBiVhGUK+9JVq0qL85yhbSd8h6ZwmNn5/f5lMCbab+VLSC5tWe54T13oSONHe
	pPx0SWWOP46C3lmwcB40cPTXWl50yxwT/lCaSHkYdAbj9WZDziW3Mup7CtkdekAXbBzZpURjInT+O
	AVvOAca5joAWK46N1OyL9AhgR4sS+X7ykPQ+DYRuO8tW8WFpii3qhrqfnuZlj3pZnlnluCyCIOdMc
	MscguTyof8PrUhXDaoPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGh6I-00000007IQ4-1J8O;
	Sun, 18 May 2025 16:42:58 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGh4I-00000007IHL-0bq1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 16:40:55 +0000
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54c0fa6d455so4408279e87.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 09:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747586450; x=1748191250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/hg4XOiM8dzAP+sj3OctfJb8nVC7grXLEYczEbyGvks=;
        b=iLt+6GYGbylovJgfO/7sMMGLF2gbRliin9AlQccIDgR/7y8GLcjx4zhx4pDNr1GBU2
         6FM9YOQrnSGPX8TT4P/YD8a6ByON6+WgTaCqB+rsgr/AjDZ5uUVLeJth2d4lRr4e4sAb
         12mv7+ZB/2+VLa84iLmGqUabVW5kIP89H33zsxy5R5eWHiNJTUmgpeMepw6th5/n7XuH
         5zMUJtxEt5SUEDB3rlil/JB8VrLdNgvOQUKGiGIqY7LqHPrmClEUgV7uT3PJnNFmgXOO
         7zau1Z085VE8X8g8TD6vRonHnHPJBVeYmcya4f0ID4JamPBwBqYCp156F6/k3vThqPi9
         k+gg==
X-Forwarded-Encrypted: i=1; AJvYcCVMHIV/PibjOyPtJQe4WnovGxZMSefcrwaEk8yOC2+5EdxhPgYiOcL0yVQhOWtjcnC67p+Q3s+RcZ9eG+N8+zE+@lists.infradead.org
X-Gm-Message-State: AOJu0YzbyC/EojA0n8O6ztU8qSSyFsXiclR/wPz37gybP2VuD2CHuiNj
	zGtSuWdKo89F+H+fFQdsQb0g8gFteYDceIh/MrMBhUNIMci1VNrhrYpIZthSOHXhIpQ=
X-Gm-Gg: ASbGncs1rgsVuE0RTgU++Z+HVJM51TOVjd/qW5R4v0GiKaWT6v7Z+q3Jw1Jxiq4BrXP
	tf5FpjVQbz0PolRZrFr+Scsb+MMPuiJ/N/dW7w8mpq8nNBHDVWBgzWwLw3iICfw/l08lPu5PsNz
	ZRt0hQ3G4trtCuCUZiTZf0Z91j7+5900y1oxk/Z88pSRdA840J+JUMqbUgsNnQ7XkSCDD22Gzjl
	OPTF7hoOz3ZaDYIV3vv/dSPO19vAWBr5vVq9pd2gob+eZBGZllC+hqM060ZRAEj1sLYNVReIuQl
	siOebt7trIVJfenZhA2o0t+ZwHOU7izsZciJkQ9FhAVZa8rjZ4oQ75aLdLtyEySNFUBzhsskFkw
	/fWR1Ybqp
X-Google-Smtp-Source: AGHT+IHLvibQ6J/pcbGiEiiTHm70hqSNcDjWfTfTxTpqNlLici6EGdEGVjqrdQKAFi7xKSnyiBkDCQ==
X-Received: by 2002:a05:6512:620b:b0:550:e5b3:b1ab with SMTP id 2adb3069b0e04-550e719529amr3072614e87.4.1747586450141;
        Sun, 18 May 2025 09:40:50 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e7017f7dsm1475092e87.117.2025.05.18.09.40.49
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 May 2025 09:40:49 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32840b91488so14963991fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 09:40:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXyr6CKruqvTdE5f7jV5y6xQyT5mU9rcD3Lv2cEjzXbtPat91iR5/3BCiTX32WQRjYng4nEkjakAc06qKF9lt4t@lists.infradead.org
X-Received: by 2002:a2e:b8d2:0:b0:307:e368:6bd6 with SMTP id
 38308e7fff4ca-328077cc6eemr39628791fa.32.1747586449458; Sun, 18 May 2025
 09:40:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250516105101.11650-1-ryan@testtoast.com> <20250516105101.11650-3-ryan@testtoast.com>
In-Reply-To: <20250516105101.11650-3-ryan@testtoast.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 19 May 2025 00:40:36 +0800
X-Gmail-Original-Message-ID: <CAGb2v67jfZx4gxhBh9cc5SRknzwc0jX_148v2p0HAV5+adL9aQ@mail.gmail.com>
X-Gm-Features: AX0GCFtGZP94oDImPioaa5-NKNR-5OiIQ3Lm0O3X3TZCX6x7PwMx49wsoQ0m4fQ
Message-ID: <CAGb2v67jfZx4gxhBh9cc5SRknzwc0jX_148v2p0HAV5+adL9aQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/8] drm: sun4i: de2/de3: refactor mixer initialisation
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
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_094054_185013_4931FEC9 
X-CRM114-Status: GOOD (  10.01  )
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

On Fri, May 16, 2025 at 6:51=E2=80=AFPM Ryan Walklin <ryan@testtoast.com> w=
rote:
>
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
>
> Now that the DE variant can be selected by enum, take the oppportunity
> to factor out some common initialisation code to a separate function.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

