Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACA7C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 14:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76NPEec58Tb1M0PywXo7lghUl4mVI11dXUa8hA9GYgI=; b=e4WQ51L4KW+lRupNZS98x6jYkB
	YKwVNI5eWJkGNFbr1mlxiOok1EP3nIWzLb5kRLaO6b+gljpqqv4GWlqKfW9ptzh3wFh/FP4ZfgwS8
	B2gs+Skb06tz5N3fpbpr7B1N66Bf/D4SRxxS2Hk5Gq6mcj0w709LztifcRWk6SpMBcEm4TxF/t7VH
	E3aXcV6PY6lw4BrCIe8C2FwBgMng4aGi9kgeK8+id8HHAoT0rFr5wHzHpUU4H+N7/Wu6FnHqzKZzj
	z++ulf0gYLMGgLpuLvqCxWtnH2DGzUJezIOg39fAQOs9JhXPPdoGlytANiHMT4d7sVJsogIeOZM90
	vZaB99UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtj6-0000000HOk7-0VU5;
	Mon, 03 Aug 2026 14:33:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqtj3-0000000HOjO-1pLJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 14:33:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785767587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=76NPEec58Tb1M0PywXo7lghUl4mVI11dXUa8hA9GYgI=;
	b=JloodaN+Ojs/zsNVnZ0zyG+IfKDJwzEm6gN9bgzKbtPPar2etAFQY/aOESf81IqUZLhjnC
	20Uo2HDvv4PXW+GDnpYpqYDPSP/utbQMlMyde1aefHTMoUbXy/tvLiVix0QB68yhUtjZtl
	PWSjaV3ELGfwOwDlklGtW1BWNwiyOkw=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-575-SSzd8wz0Oj-8IBDXyFX9Zg-1; Mon, 03 Aug 2026 10:32:51 -0400
X-MC-Unique: SSzd8wz0Oj-8IBDXyFX9Zg-1
X-Mimecast-MFC-AGG-ID: SSzd8wz0Oj-8IBDXyFX9Zg_1785767571
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-6648d902a6eso10239339d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 07:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767570; x=1786372370;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=76NPEec58Tb1M0PywXo7lghUl4mVI11dXUa8hA9GYgI=;
        b=kEbWTHV69wpNAGCfyVWKWM/agIVsGfm9T7hUWFRcpsoAl00zbGuEtmtFbZrQTdUSo6
         pOZRqPHoHNHi13RHB09QortCj34xz+Sw8fk8RidH3McYApTtHE9E7YFZMgIXz9W4s4jD
         WALOBiRSNc3VjQVlUm0UUhtEkK520ecGnLVQwdovPtDH1Rk2DfmcLbMUls3VDO020GQD
         lIkJFUPv5UbRXBdAQUNm30lhd2eziq2Ca4YiDSzg9GW/J2D5xxuZAWNK50+qkaflFaQ+
         M/7XmSJAb4e7Fu0+pJvnG5WhWJjW7/hkGOuiRXuLBeJYktvh9oXtJI2OjRjxZk9jk8nD
         oGTw==
X-Forwarded-Encrypted: i=1; AHgh+RpQoBEuZBbT2I1heMs0M7TBhhG1wQLdd2IMPmAPIGhREq0qGlTowlcAM9qBNNGtdakHXDKHzZk+7K2HhLVfVlgL@lists.infradead.org
X-Gm-Message-State: AOJu0YzzNDcLIGeA2XGWdrdXhEXPyO97+R8w9iM2iYyMKigDYjQTqe43
	3IvmO/CXSSYjWXNZRc1f++aJM62c6PzISRcR+DooQoBStumXyyzTHyyZTrD+iPkMxKSCG73PCz+
	00sSBN9+nLVq3atiPYCW+Tke0fwUyqO9Lki++3SJSfLHZMCTWs+pqHKPUTN2OasIpPt7uBNulCq
	GY
X-Gm-Gg: AR+sD12e+GFCTpoggB5woWSqdvF1G+TwZA+IfwG1AU954MfTneeGaOG7KyO5aTQjA6Z
	MNQdGzNYSTmsB/+oNG7L3JAViYbNFotLGLqgHjXfkY49SK2hb47GgRcF/F98IhUyCV8M97KkEh/
	cTDzzAIIAaxBTh3vMUZfWtDV3DPbw8xt6AcCUR/fL1kxIk94IyMDIcaTFfUbUquPmMzy/zgHGyk
	tNn3fI++ojWU5G1GEgyhFAas6uxigPBt1Uc/8hr7o65ITzcjUuXkpNaVqAgsBQNFUf1oL5PHczr
	hUOPF5NRMzx/TrsgnilLl9h7XagNLNemUfJTZpuW3CR3jY3BchMrq5IdCFeF1Dyx0bzvpTALEDk
	yxUZV8kwf/yf5gS/d6jPiuZ7DNodxoN013Xg=
X-Received: by 2002:a05:690e:43c2:b0:666:2274:f9f5 with SMTP id 956f58d0204a3-6694f1d38e2mr8779904d50.37.1785767570579;
        Mon, 03 Aug 2026 07:32:50 -0700 (PDT)
X-Received: by 2002:a05:690e:43c2:b0:666:2274:f9f5 with SMTP id 956f58d0204a3-6694f1d38e2mr8779869d50.37.1785767570090;
        Mon, 03 Aug 2026 07:32:50 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66948ffb54bsm5747947d50.17.2026.08.03.07.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:32:49 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:32:46 -0400
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
Subject: Re: [PATCH v5 09/25] clk: mediatek: Harmonize mtk_pll_fenc related
 symbol names
Message-ID: <anCmjnAVH1MRkNUS@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-9-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-9-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ShQRkuPYf3Xopz4qicR8wjfiPPxouMniT9TGiJT92iU_1785767571
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_073309_567575_E2A531FB 
X-CRM114-Status: GOOD (  11.68  )
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

On Sat, Aug 01, 2026 at 01:20:55PM +0200, Louis-Alexis Eyraud wrote:
> To prepare for the new clock ops set addition, with support for set/clr
> enable logic only, rename mtk_pll_fenc_setclr_ops and its callback names
> to harmonize the naming with the same suffix.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


