Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167CFE677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 11:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNxx58SAnxfm8WutwLtZrpYz0UwbZu8UhPuKwFhJ2Po=; b=C3vxiEAB6NGXYo
	whEIRTiBjfmDfHcE6oCA+ZQpy2QXHUNIaGNv6LnL28ILbKATn5t83jZV6ATU8HvyNSMYBH0u/Pol1
	QKjR+cdAuoH0rKNsNgBk9yeEnQ4bTR968B/sXB3vjbACeeA+9ELQ564nPkMeP+5/so3Lv+IvyUJDL
	9Iyp6PXFxcRZDmHJhEbux7LEl02Z91/BJgA0FduhIsrXx5vVbyVOEM/5USMVTBA/KwPRrFczLqIFa
	DeD73ik/rIwQ8uXtIfz3a1ut/92vzp2lc7zyYKCT+P9feOBLDokstq0pZ7ZtmQ54KXJuiAZD/O0Re
	IXhXPXy/zWXEuk4od2fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7CmY-00000009ewK-1euk;
	Sat, 02 Nov 2024 11:59:06 +0000
Received: from mail-lf1-f44.google.com ([209.85.167.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Cep-00000009cqb-1hx1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 11:51:15 +0000
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539ee1acb86so2752874e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 04:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730548263; x=1731153063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HNxx58SAnxfm8WutwLtZrpYz0UwbZu8UhPuKwFhJ2Po=;
        b=Cz+bauBOl8yY8FfWCrvEGJpK2WFfciIIVWpYC499302J1rv3Lu7FRhltfbMBxbwEjt
         7/gD8MggE74PMTfBEpIW82zrnBfnlXBDFNy4pRp5WTOHS6x2l2KIbZEDhp8zssJrkcF8
         2u6X3U82OQ0KhnxhE52vxN9iwS8UbhaPxBWDZfVEc4n+oBvy2UITWtmkfqX1ia1twGMt
         DuMgn5Fxy0G4h80R9CBC/tTUF7v31mDHaSqTROW1MBGLqiVaGprmIloFqyVZl1J7w+Ej
         ztLk/1judL7Ww+Aq07LinFpkVHUuOXyK2wKPm2fz0wD4cVjI0wSrDkFe4/PLEpBosVme
         p/Aw==
X-Forwarded-Encrypted: i=1; AJvYcCUm0E4YrKAABEpLZd26FDgCprrcvo9br93mmGfgGJ8LowofuxnDpJalSm/Rq+kTm9T4F2yiNhnUsE93yGhvRFx0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7j9Ii1ty3ETbTVgQAHEm+WdBGkgNMQHWpHC4E3C4E6cwwdT74
	xPBhejwvPMVYFcvxfST5SyagnRKd3d1eOvL0okCUVpqI7SSzIscpNtPm2F5ogqs=
X-Google-Smtp-Source: AGHT+IHoBoOxj6P8nFIl6S4H196JyIsUnQLuyzgW4WZz3OAcqQ2kON5ikb/EpITLjXJ71rdMpi2aXw==
X-Received: by 2002:a05:6512:3d09:b0:536:9f02:17b4 with SMTP id 2adb3069b0e04-53d65e1abb3mr3482501e87.40.1730548262982;
        Sat, 02 Nov 2024 04:51:02 -0700 (PDT)
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com. [209.85.208.182])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53c7bc9587dsm881383e87.44.2024.11.02.04.51.02
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 04:51:02 -0700 (PDT)
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb559b0b00so23045181fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 04:51:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUSQEFsY7oygiJ6kGEVUYz2SHDwFwrg7sSPtXoIJ0HHTBsW1sgdyu8KmPVBLERbVP6mhb95XhQirDxedeNr4Jyw@lists.infradead.org
X-Received: by 2002:a05:651c:247:b0:2fa:ccae:d1d3 with SMTP id
 38308e7fff4ca-2fedb7a218amr36689791fa.11.1730548262188; Sat, 02 Nov 2024
 04:51:02 -0700 (PDT)
MIME-Version: 1.0
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest> <20241031070232.1793078-12-masterr3c0rd@epochal.quest>
In-Reply-To: <20241031070232.1793078-12-masterr3c0rd@epochal.quest>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 2 Nov 2024 19:50:49 +0800
X-Gmail-Original-Message-ID: <CAGb2v64BtnCTCHnqpQrT=c8XRpr8UtpLK58DrWd9gv=tJjPHdA@mail.gmail.com>
Message-ID: <CAGb2v64BtnCTCHnqpQrT=c8XRpr8UtpLK58DrWd9gv=tJjPHdA@mail.gmail.com>
Subject: Re: [PATCH v2 11/13] dt-bindings: opp: h6: Add A100 operating points
To: Cody Eksal <masterr3c0rd@epochal.quest>, Viresh Kumar <vireshk@kernel.org>
Cc: Yangtao Li <tiny.windzz@gmail.com>, Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Parthiban <parthiban@linumiz.com>, 
	Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_045107_544197_CBCBA142 
X-CRM114-Status: GOOD (  18.89  )
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

On Thu, Oct 31, 2024 at 3:03=E2=80=AFPM Cody Eksal <masterr3c0rd@epochal.qu=
est> wrote:
>
> The A100, similar to the H6 and H616, use an NVMEM value to determine
> speed binnings. The method used is similar to that of the H6. However,
> the information is stored at a slightly different bit offset.
>
> Add a new compatible for the A100.
>
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>

Acked-by: Chen-Yu Tsai <wens@csie.org>

I assume Viresh will take this along with the cpufreq driver patch.

> ---
> Changes in V2:
>  - Fix ordering of compatibles
>
>  .../bindings/opp/allwinner,sun50i-h6-operating-points.yaml       | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-op=
erating-points.yaml b/Documentation/devicetree/bindings/opp/allwinner,sun50=
i-h6-operating-points.yaml
> index ec5e424bb3c8..75ab552f6ecd 100644
> --- a/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating=
-points.yaml
> +++ b/Documentation/devicetree/bindings/opp/allwinner,sun50i-h6-operating=
-points.yaml
> @@ -22,6 +22,7 @@ allOf:
>  properties:
>    compatible:
>      enum:
> +      - allwinner,sun50i-a100-operating-points
>        - allwinner,sun50i-h6-operating-points
>        - allwinner,sun50i-h616-operating-points
>
> --
> 2.47.0
>

