Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00535C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 12:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SlllDyrG0fYSws8ZDTJ9/6dg1cf1e/vrQ7JEAgapZYk=; b=l4i2dwbHXAa2VUQfVHelVPva0c
	kTGOJIqQFCwdOG53v22KMvSZ+3eua4L4UN1UAGURAbEukXX4FDCFh84d3AS922mc6qsFBQym76Qiq
	nm7CU3KaNFMR5U+qCy9aQN3NDB2MgQy2ZubiG0f/ox8NgYJRaFEycxtTNdF6TaRH5D6+J1k5Yxnu1
	63oED26BNO2PRROLe67shpdc4ALk5MjNDU2GVM0OR04MF8VfBRExyhE4/cob2N3dWTgYD2fpMThl8
	oE8nItgwo7FU7s5WJtKDW0maJkSx7WQ9GX6vIiJ3mTgp/ZhwcPPEvc6E/qpTBKHbGDbX7erJHnveu
	Vyaz9mmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKzB-00000008NIk-0mju;
	Wed, 12 Mar 2025 12:14:57 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsKCx-00000008FHX-1EjL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 11:25:08 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-6f6c90b51c3so64437737b3.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Mar 2025 04:25:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741778706; x=1742383506; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SlllDyrG0fYSws8ZDTJ9/6dg1cf1e/vrQ7JEAgapZYk=;
        b=XQR8PWxX4Am7nYmb5Uud1LUTiM7VZX6tJNBy/QAaEcJdXWds0TzJCV7PNbs0HgXGoz
         CmGMlJDui1LHDHFDnufE6wpLlwKG2GVg0LuTwKucWucC0SmALHBESwophDBx5iE0tD7l
         HWYmwjqbVJT49Mf+4Egs6fhwY2yo27MYmZJlixVaMaWPVSLiZkneO8Sd8rGBzBKLwB3i
         +KNziiOe0ZVJQRT3knnYzXxlLpJ1YR6AxoDlzncWwa5UDZwpqUl5TfQty95U3VKMzmHl
         ZD6/TXEk6JPZUBZyGXgSQx/+bshrohOhgwXALOcHddRVTRjJcNe+V/07T8UN4bsCOXDk
         rzcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741778706; x=1742383506;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SlllDyrG0fYSws8ZDTJ9/6dg1cf1e/vrQ7JEAgapZYk=;
        b=XYKG9Z0Tpm2eXiyWffFcMCdFSXHQHkK6OPAqHBZl3y0nujcwhWvI09gvB71pFYyfTd
         vQ+5B2Bidq9T+GqXcKojstgpdH9NsUv9a3chECNXDiYeZwjuPXnRk1MszyRGMeP1Uh0s
         IITFps3wgL17wj3c9cygVq4V6p+OltODyph0g8LfbO1g9K/X4uhdYQ/E/ZlEmVxv7+ry
         CznEobCiKhubbb3gEatiOh46fSmn6PSDRdSVn3qU7KCA+Gi3uO+6/lbuLezrnYvdM9yn
         i6TAWk3iPpJzgTAbV8Asv/x+iX3+eIjwPEd1CfbLbwSkQjl9pb+BeuXm46Z3lKXzB3w5
         GLBw==
X-Forwarded-Encrypted: i=1; AJvYcCV8YqIZmjm6Z5BJeKXhbN83Pp05SDa2W8B88oRC2SO31Sv8Vjx3xraDNtPHk+c22gg1f255la4GZrQtkshxec/K@lists.infradead.org
X-Gm-Message-State: AOJu0YzAL187R/+qGweXtO3Ae8s+RfGQkw6sorrDlqNeb1KeIaGndkE+
	h95QYmzVxWM2yZW/RMII8Fydk5vebjIRitENGT7KHDmDwKp0eglz0wBZHXdDSGljtd5MnhsCjpq
	+1Edjq5y014kgiRAf3xufClL/g6m5IRUhKym/Hg==
X-Gm-Gg: ASbGncvyPSkIOxj4HqBNwPHI7HF3ueo4bNxYvFMDBCb/9yKhQ4M0AnBnKA3RxpUhQvu
	rO5fU+CYnLTsz2VdYxt+pFi0u8znTm0V0hiZUmDGZiniHX39J7CBNH3PU5UvGYsOTEhvwH/HgOq
	rD1upacES8WGqx2kmYWJACN0n6Ffk=
X-Google-Smtp-Source: AGHT+IGzzYKZqQnzo4/TkxVRdAG+iFIbj58CZgUDRSBl5yXeaKcuRHZ3DsF7Iz2ZDi/kqew08vFq+RA7yevcdns+/6o=
X-Received: by 2002:a05:690c:3603:b0:6f9:aeee:8f1b with SMTP id
 00721157ae682-6febf3e0495mr303639797b3.31.1741778706131; Wed, 12 Mar 2025
 04:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250224-mmc-slot-v4-0-231620a31e88@microchip.com>
In-Reply-To: <20250224-mmc-slot-v4-0-231620a31e88@microchip.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 12 Mar 2025 12:24:30 +0100
X-Gm-Features: AQ5f1JpKdBqCJY0FuHEmcwF7hCaSqNRMMWLNVMGY2ucMSaeEfL0rXnlSWP-UCcI
Message-ID: <CAPDyKFriZ8xaS0EjO8axVpv7e-8D2Yg9Fm0APCK6M-WYe87_9Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] dt-bindings: mmc: Fix the mmc-slot and Convert
 atmel,hsmci to json schema
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_042507_335150_359F45A6 
X-CRM114-Status: GOOD (  17.86  )
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

On Mon, 24 Feb 2025 at 03:53, Dharma Balasubiramani
<dharma.b@microchip.com> wrote:
>
> This patch series modifies the property status of "compatible"
> (required/optional).
>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>

The series applied for next, thanks!

Kind regards
Uffe


> ---
> Changes in v4:
> - Rewrapped the commit message with textwidth=75
> - Allow slot pattern property to match only 0 to 2 as per reg.
> - Add Reviewed-by tags from Rob.
> - Link to v3: https://lore.kernel.org/r/20250212-mmc-slot-v3-0-2bf288207040@microchip.com
>
> Changes in v3:
> - Add compatible as required property in meson binding.
> - Include the dependent patch that converts txt to yaml for clarity in patch series.
> - Refer the mmc-slot binding in the hsmci binding.
> - Explain "why" the property is made optional in commit description.
> - Link to v2: https://lore.kernel.org/r/20250205-mmc-slot-v2-1-da3c5f30e2d9@microchip.com
>
> Changes in v2:
> - Instead of moving the compatible string to the other binding, just make it
>   optional (remove from required list).
> - Link to v1: https://lore.kernel.org/r/20241219-mmc-slot-v1-1-dfc747a3d3fb@microchip.com
>
> ---
> Dharma Balasubiramani (2):
>       dt-bindings: mmc: mmc-slot: Make compatible property optional
>       dt-bindings: mmc: atmel,hsmci: Convert to json schema
>
>  .../bindings/mmc/amlogic,meson-mx-sdio.yaml        |   3 +
>  .../devicetree/bindings/mmc/atmel,hsmci.yaml       | 106 +++++++++++++++++++++
>  .../devicetree/bindings/mmc/atmel-hsmci.txt        |  73 --------------
>  .../devicetree/bindings/mmc/mmc-slot.yaml          |   1 -
>  4 files changed, 109 insertions(+), 74 deletions(-)
> ---
> base-commit: d4b0fd87ff0d4338b259dc79b2b3c6f7e70e8afa
> change-id: 20241219-mmc-slot-0574889daea3
>
> Best regards,
> --
> Dharma Balasubiramani <dharma.b@microchip.com>
>

