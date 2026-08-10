Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BFD0C5AD55
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 21:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HM0jDu4T7yH1UL3y9Xop+wHBl7p45KQE498sSn5/W1w=; b=EmFGa09AK6oNX/51WEoio5VHy9
	yaXDqPDw80kOIWIqkzMvK1gwGIv8z5ER0gemKSGVOlcqwMHuf5aF992I0u4B8Cu0eRhomMaNL+G6P
	XIIU6JK1s+6qf7p4q4F++ZJyozfUyXlsqD6FSfj2Z1ogT1OQhPomnt0MzfQt0zj6oFNsnE5yGZrhS
	rFZdbyiBSufdOhoX+224gIbfRBkaF6J3m5KjFR2vnQutoSPleGaBl6yN8NSTaiYG4S+JAERbzAE87
	lYfQLMsfcnTwEG45e7DPs5VRbs7DjvwOpHtAgx+9+yCpWcM05zf4CpJuG/oi3us6RkYUu0BsyzTKi
	OOtqRlyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtY25-0000000CwSn-0OsJ;
	Mon, 10 Aug 2026 21:59:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtY22-0000000CwRZ-3g8u
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 21:59:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786399181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HM0jDu4T7yH1UL3y9Xop+wHBl7p45KQE498sSn5/W1w=;
	b=N9yQZdn1Hyx1MDQuypzEHzzU7WSUcQUorvxt6r4FSIwg6Z2I/W2Tygrmu74SBmfPCPqFXy
	jzZTbd2KHarNtUO41b4qMH7xUoI+WNSx0l13VgBwWXmVppJBwV8C/PMHaEb5J6uj3bmYNH
	tsi2XCRLY9cSpCNKRZ4e2kBiU18AT8E=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-G0_kgkiOOPeAvuviAU08hw-1; Mon, 10 Aug 2026 17:59:40 -0400
X-MC-Unique: G0_kgkiOOPeAvuviAU08hw-1
X-Mimecast-MFC-AGG-ID: G0_kgkiOOPeAvuviAU08hw_1786399180
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-7f582244e9eso76363387b3.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 14:59:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786399180; x=1787003980;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HM0jDu4T7yH1UL3y9Xop+wHBl7p45KQE498sSn5/W1w=;
        b=VqSeNNaZywGtISal+m1fmnm5e8wvyKK2qa+GMLGF15wH2iw0LoUnWsHk9iYuVzBNv3
         h9ulbJxgEr4B8/KzwlALmzOewm4VUFQo0VBGWbv1HFeuUDw1/inz89YUpLot8V3SaLy5
         e7P3/S5H4n2WS5trJwNRDhkRYd0sKc98B1aKg3YuqKA2Gv0DSqXOJZkJEk6m3cbClVs1
         dg0pyz1AQNC5JnTotfMNzr3FLSH/zdPnBY9c8QV5YISLTA8NUeBQ/zFx/MAbQrIDsSKr
         KYgVt7SEIMW1UBgcycVur/WiEsZn8GA1J3S3HWO1+2+EsP+cfvhEJKe2gvjz/7wkz71o
         fArQ==
X-Forwarded-Encrypted: i=1; AHgh+RpXKms+Iz9gWumcO7IUY+HIzouhGPDSP1bLHkWolDu/KZFZ0J6WJxCulkN9e0XwqVaEGEXkVFAqudyso66MdDdE@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4KZ5peviYShaKgKIjbj2RyaxP5Mm9clorocYM7XJZQBqHwJjS
	H4IoRgILrnnJd+eGPF3PgEed7LmDNhoQOxUkPpQzFaH3lMudscu3uZ5cBQ/WArbUMdfCKy53Qln
	xYv0QK97c6dnGLI8JvIXFea/s1mo+VM+KRXzyCct271fkPwLZldr3nXfAHDll7XCBuTur/70ZPR
	Mu
X-Gm-Gg: AR+sD12bYJvqi0Vrdy1FrdlaRyLJFdyvq7zC02ZuApwPlGRzj+c9agoy1KrUHLyao2h
	/JbUox5hkKencqxAADrensIxwngMQmYvaBHiMtfjAGoPqhwhqN8w//PsM1P9oc+9tHXNs7obCoe
	vKA7kZZTUKVWBv9ljrP5bKPJtn3fa8f3SD91JpeMb+I4Ik+abmXVeWOVkoYe9KWz6sC8DZe1ots
	F5MYjRJdCzyKCQwABoo/aTmLI9tqHQto7msVxJN0n1IPIkr/sKfuGTMUC1wT2zKt/8hik97ydLo
	0kaPvjftlODjr8YYfj3HoEFku6J5aIwiIM9erSLQEj91BQwnMFpjTyDavMSMH08rRNkslgP901c
	uoYPdsYOgGLpsvGCYY1ByFWXX70cEO1yg99E=
X-Received: by 2002:a05:690c:2506:b0:81e:eb11:6e5f with SMTP id 00721157ae682-820229c195cmr279357037b3.34.1786399180121;
        Mon, 10 Aug 2026 14:59:40 -0700 (PDT)
X-Received: by 2002:a05:690c:2506:b0:81e:eb11:6e5f with SMTP id 00721157ae682-820229c195cmr279356737b3.34.1786399179584;
        Mon, 10 Aug 2026 14:59:39 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-823efbf208esm64134367b3.10.2026.08.10.14.59.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 14:59:38 -0700 (PDT)
Date: Mon, 10 Aug 2026 17:59:36 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v10 10/12] clk: zte: Introduce a driver for zx297520v3
 LSP clocks
Message-ID: <anpJyOYpFBe6ah0I@redhat.com>
References: <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-10-63846490712c@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260810-zx29clk-v10-10-63846490712c@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sDPmM2zEvdJb4GN6Odse-5X6LmY_b0R5BiAOt84DA6k_1786399180
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_145942_984126_B482B06F 
X-CRM114-Status: GOOD (  14.36  )
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

On Mon, Aug 10, 2026 at 12:28:29AM +0300, Stefan Dösinger wrote:
> "LSP" is ZTE's term for this part of the SoC, I suspect it stands for
> "low speed peripherals". The main UART is here, together with the flash
> controller and more surplus proprietary timers.
> 
> It also has one more I2C controller that supposedly connects to a
> battery charger, SPI for displays and I2S for analog telephones. The
> boards I have don't have any of these components though.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


