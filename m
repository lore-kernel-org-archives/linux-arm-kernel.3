Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD990CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 18:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mtuYbvQl5xGtavWlu1yVakqj5t0N5rS/4aiatiahmNA=; b=xtb/NWmJSCZqMZ2LNaZfBvcT13
	3wHkCS53PD/V89HnAyEnlvxuKarJFb6ZDk4ZWqxIC1t6nL4V3IajRlxSnQhgDoxeiGj9abC4dGUGC
	QlIG0Ui7NnooferEsqAuhNGXVE9m+SmWBWDw0+v9b1GeK/PhBp+LOu/Rp2J8FbGlUN0xu8zp04s7t
	FSshnrAikRZcqh2PBKfFbbitVF0ZCSJhGgFCnGrBS0bGlF1ueAyKkzwBACUap2b86ionB+qMnFfey
	MgHLMme30EqAC/FEWONCmNpbKUSBJbF9aY21TNNkCLrxWb/1R/MtwD++hX7uwkFOXBHc/Knedn1li
	Bozl7U/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRwBD-00000002p2E-0cGS;
	Tue, 26 May 2026 18:07:03 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRwBA-00000002p1i-1gQ2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 18:07:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779818819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mtuYbvQl5xGtavWlu1yVakqj5t0N5rS/4aiatiahmNA=;
	b=D0lHgfAERfxdTLz6n0n7s4/oyzmfvfCf638LCse0q2OPhUO6Nyvvbf6X1AR4C22FI20Veh
	8K2B4niWOKBSU037YWBsaFHNfAJHfWRtGrr65c7fXX/bEWDbM57H7au9v7LRMDQ7iU4M0A
	o8tnJAyRMC8ppumutTFT9Z/DniDyfSs=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-362-VRv9JAwZNlu9qUGucvPGsQ-1; Tue, 26 May 2026 14:06:56 -0400
X-MC-Unique: VRv9JAwZNlu9qUGucvPGsQ-1
X-Mimecast-MFC-AGG-ID: VRv9JAwZNlu9qUGucvPGsQ_1779818816
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-90fb4c8390aso1087215985a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 11:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779818816; x=1780423616;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mtuYbvQl5xGtavWlu1yVakqj5t0N5rS/4aiatiahmNA=;
        b=BlDWqKNspoAl+XNKkkAYgUd9zrPO3V7gP1SGD+dcyVyon/G1Jwzu4HZSp4mFmND9b7
         Ob2qf149l/M1+0pW1DxCZBp6yUiWHv0F78RkWrTtIbh9la3wzqJR5Lfp2cVdITapLsr6
         dCFZRnOcNJhk/79njMWRyUryEf+wYLOmbp25x0p4BJYuvMXVwZ8Qv6Ak/BBn+fFjmhYC
         FxSg7j81vs0KhH8K+bV2tZaCuL1q0m0fJt641sXYVF1LfaJSfqcP6KW1AGMIxHCHJIXH
         0BspwSBxQgBMyI9X5BDMoe0hHMORaPXFX8JgpmJUCsIOglNXn/3lB+R+9fHhzfJGcSj1
         7oIg==
X-Forwarded-Encrypted: i=1; AFNElJ+vb2bcv+6k9MaTcZSNMm45jLgM1qNR29iZ3nokaEEDFHLhaCsAqHS+4vJXiG0Rgbbk0JJw1KpR5jUd0Vzvx2AU@lists.infradead.org
X-Gm-Message-State: AOJu0YyxyIdPC39xTbIb/FBz20BixfDQONsapDe2D+ZHNfR3VGDOv0q1
	FqQDYVgeS0FjjC0OeQFS7V+5Aa8D9Fii00HIaoJy5sithY+lB14/s+bYEc6uCx0gnBfKV12LFY5
	ZEMGdt0ZlS6xIH8oMSg1UhtvebAegmzBk1ZPuuAcaYP/F5D6KccWh5I01kcUjyEqJMtriM3pqCw
	bo
X-Gm-Gg: Acq92OHRPIHyi9U3Irsmx9xD69BpLpVfu0sAa0zEzIF2xt4kDUdpNsLAPlvZ0UEMTQQ
	JW7veI8xcBBLLhapFXJgcuC9/74aYENCmjIEB1Iha7/MU4uba6caen4ItgZMtF4Fst8ugZNdkdv
	tel5jnZKJuW228g6QDV3L/YWk7vK72xBgYJklatUAgYWaMiq+mqPDEBytEadnzDXEN4FpFX/XO1
	oDvdGw3W2M0BXmKnF0nXrN5xd94VrrhM8odAEIS99ESNu81vaGWR58slVKvZmfbG+QF0TpzYWSI
	v5p8AzvxhezaYs6SpGc6Nwm4ixFvI7dw6hT2uanFNbYtCteOP7sU8OtpiqIxAmN5ZXJ7VRGX2Pd
	hQZr6aVtAiV9QZuzt1yIAHSIlc8qn7HpvCBQTS5P4lePuGBg+BJ/DB8hk
X-Received: by 2002:a05:620a:25cd:b0:909:e4dc:fb27 with SMTP id af79cd13be357-914b499fca8mr2868925585a.28.1779818816179;
        Tue, 26 May 2026 11:06:56 -0700 (PDT)
X-Received: by 2002:a05:620a:25cd:b0:909:e4dc:fb27 with SMTP id af79cd13be357-914b499fca8mr2868919685a.28.1779818815704;
        Tue, 26 May 2026 11:06:55 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914f881d91csm270637885a.44.2026.05.26.11.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 11:06:55 -0700 (PDT)
Date: Tue, 26 May 2026 14:06:53 -0400
From: Brian Masney <bmasney@redhat.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, ychuang3@nuvoton.com,
	schung@nuvoton.com, yclu4@nuvoton.com,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] clk: nuvoton: ma35d1: fix PLL_CTL1_FRAC bit field
 width and fractional calc
Message-ID: <ahXhPUqk6IIjO4GA@redhat.com>
References: <20260521014220.77955-1-a0987203069@gmail.com>
 <20260521014220.77955-3-a0987203069@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260521014220.77955-3-a0987203069@gmail.com>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2DmlMITG4v_5P7U71fFBUXlOtADVu-NGntHBfKsAkaE_1779818816
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_110700_516121_171BBCBB 
X-CRM114-Status: GOOD (  11.08  )
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

On Thu, May 21, 2026 at 09:42:19AM +0800, Joey Lu wrote:
> PLL_CTL1_FRAC was defined as GENMASK(31, 24), covering only 8 bits.
> The hardware fractional field occupies bits [31:8] (24 bits), so the
> mask must be GENMASK(31, 8).
> 
> The previous fractional-mode calculation used FIELD_MAX(PLL_CTL1_FRAC)
> as the denominator to obtain 2 decimal places.  With the corrected 24-bit
> mask the old divisor is wrong; replace the arithmetic with a proper
> 24-bit fixed-point rounding to 3 decimal places using the kernel's
> DIV_ROUND_CLOSEST_ULL helper:
> 
>   n_frac = n * 1000 + DIV_ROUND_CLOSEST_ULL(x * 1000, 1 << 24)
> 
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Signed-off-by: Joey Lu <a0987203069@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


