Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F297C55184
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JwikhXmMiyptngbwEJz5XWlF1hdjeBqdvWFYDWbslQ=; b=GuVULRy/lmpc0IJh8nxX+J5NC3
	zdYETHfM9kTp5FSs0k2S3NDEGnunvgx67CwvhDD3Cv1mClCZDKFuQXdalT3o6Dx0CTi+3Czv6OFYA
	8QMi3uUSgOP/RwdxOv0k6wWd79g+oX89DlI8RqthNvAx/tvkpz6Q1gc45KFnMh3yddrY9hBt4b6nS
	eoXvQk5RrPskYwjSYHS8+7qsODjO2L9ypycWpxGt40M8F1d2Y+UTLqavpnBKOkU8JoqfcMKm4OJnD
	1j0snvQ38vP6sAmUPtWr9DGRieCmrXvuBGt0dO40ilnhBT3udkdFK6S6MAkxhb99jlEVUZH5FLa+r
	N5JchePA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtpA-0000000HPRG-2uJI;
	Mon, 03 Aug 2026 14:39:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtp8-0000000HPQe-3WVC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:39:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785767965;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/JwikhXmMiyptngbwEJz5XWlF1hdjeBqdvWFYDWbslQ=;
	b=gIPgeP/bUTuNWfnBbPqTnQim+MKK4kZeKPqaYqr7CuNTh+0nI+OfwaEDKf8hCNZo3GyjCs
	ruAKnpp332GLgPsp4m9ZfE7Ld+hJhY64iZXRfxI0rxiOsNISRSOuTs50Ra5MfTZxPm0cTj
	bgRJ0btBUpMrUokJksQG9M5eoVrKS0A=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-Se_DfI61O8arJmKbvlnT_A-1; Mon, 03 Aug 2026 10:39:23 -0400
X-MC-Unique: Se_DfI61O8arJmKbvlnT_A-1
X-Mimecast-MFC-AGG-ID: Se_DfI61O8arJmKbvlnT_A_1785767962
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81e71be771cso121686587b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:39:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767962; x=1786372762;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/JwikhXmMiyptngbwEJz5XWlF1hdjeBqdvWFYDWbslQ=;
        b=s1dE+m3cjmlmIc+C3gcn9iPTOUlO/p3Yx/+SZ/SPhQoVK7Bda0nKZlAA8QAq0UiAJN
         HWTJZ40OrLrb1c0YeeXJBdD2clJTPgKah6wDdNVaf6//+RjsZ1DOZOs0bKKMRGDKvXrr
         qBa27UjuXHKZNNF2AqwIY/h8QkRg6bUbQe+yeOqVCLG2sw8AY7QaCRD5w1S2C12rIex3
         6iTorWghoorQ3GPSoSghPwsTTbI/WSffgYOF6+41aV3bXT/zbpJ7GhrTg+6iXBV0j/kE
         ACstPLkG9IS5JL+C4yNf3dr+BobOlBx3r8Wx/O4U0DVHjOCPelAJkPVjJIgk7AvhtnS1
         dsxw==
X-Forwarded-Encrypted: i=1; AHgh+RoUorpH2pioi6HJ4DhdnvBr4adFQtBS8Zb6xoR9LkG7oRkyTGKlNqfFkGe3SrCqslzHsbeFnpsN3J13K9Uh6jt+@lists.infradead.org
X-Gm-Message-State: AOJu0YznI+Lzc28wA7WGUVZHXVq6pU86UMdfPYGWEuUWJ15OXdwYkiN9
	vov6CXjy/KykFdhwJVQMBtbNDwnGMIDuMChavlUsVEH2qdiT1CdHCtvQcQOBvZ150Ij3SQx0vVy
	QE5sQ1weFar3uI8htnAuQwK51xcA/rFIfd78APIGmrb5FSGiUYii9HoEXKDbOrvXgg/XePgl6xp
	Jt
X-Gm-Gg: AR+sD13e8C3dv4vKccLzFYz90RynpNWSPiNhNMMmvtBdBS/XVWaG+8lxWnX5m++9LVe
	TWwNTP5QCWoMFJWdN0eyvu0IYB4/2N3SWfQg6FZhkGpgqI9vnFv1WWUNrrJVdkUdfzfceFAm99w
	wcgiamq1N8YPyzCk98GI9dBYGhYcg0645WsqmeGTC20m5Ys/zR4rB3X+NY4yeg/Ab6W83FTsBjL
	Bf76N9EwbG3NVHHKaMNuQ/ehUzyytz3A5iBZSTT+3LaCO1x3fDy31sKER/X+WhYLsdzZ9qyrmDi
	6fZ15pPDW3qBRt+AKUI2AM+0EjNF/MVutErT4yVQ8fndjxXf7Mw25tS6ueQ6SDmYKJKY8lhRoO7
	LQOTGFku7Uf8ZcsQ4EloRwZ9XRLIJsg6oYyA=
X-Received: by 2002:a05:690c:e3c6:b0:81f:69a:3739 with SMTP id 00721157ae682-81fcbd4e504mr154831817b3.18.1785767962443;
        Mon, 03 Aug 2026 07:39:22 -0700 (PDT)
X-Received: by 2002:a05:690c:e3c6:b0:81f:69a:3739 with SMTP id 00721157ae682-81fcbd4e504mr154831257b3.18.1785767961867;
        Mon, 03 Aug 2026 07:39:21 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf9555dsm57109317b3.20.2026.08.03.07.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:39:21 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:39:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 11/25] clk: mediatek: pll: Factorise pll power on/off
 sequences
Message-ID: <anCoF9SJ9nDHqaa5@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-11-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-11-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XemuGWHsGfAtoYlSjppK7_P53TwCz5JsipE1JZoU2Qk_1785767962
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_073926_943004_A6C73F90 
X-CRM114-Status: GOOD (  11.91  )
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

On Sat, Aug 01, 2026 at 01:20:57PM +0200, Louis-Alexis Eyraud wrote:
> In order to prepare the MT8189 SoC support, that requires different
> registers to control PLL status and perform reset BAR, and so a
> different sets of clock operations, split the pll power on and off
> sequences from mtk_pll_prepare/unprepare functions into private
> subfunctions.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


