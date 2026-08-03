Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A22AAC55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 13:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w6tFfl2k7VKoJYI6A9G9h/Yn4jzbGCJFQ1d/hM/wpXM=; b=gMP70jjeZ4ALNmseKloI/rLkbV
	CZ/rKoVQv9PnRyIN0GaZgptLRssUPlWWvBQ32XWKy+zyap+rb/AHt0pJjzUJR+H0bHOwijG+Fg+ic
	XPFlid8QKl3bPIgZdjqpDIrJl23NEF9pv93KiSFpBEanQdCcjNKK5R1UiUrcuTV+3foYWUp0RNCng
	BF7hoJKojfUMyi1OlpTcAzCOyDM7rK0Dt6dXyZXPxRNjzKiveJsWcKPD71DQAIR8rMRXYt0AR3cQc
	FECRxU0BFEHS0qtI6vISsGwKnUUdRvN9Cef3ExtP1kjl3Ygc+s8Qt4nGTaoNY28+Y1E7QE0swJnRP
	2rFCiweQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsHz-0000000H6B0-1OOQ;
	Mon, 03 Aug 2026 13:01:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqsHw-0000000H69t-0jMo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 13:01:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785762062;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w6tFfl2k7VKoJYI6A9G9h/Yn4jzbGCJFQ1d/hM/wpXM=;
	b=CAHbQTeHPF/cfsEztrmj3xh+kR56PUM3x5fytphrD7RhuWmm41LLMGaPEl6+4XGZnAOuTo
	hH0BEcvp/TLpR296CBoCadSaQIpeS+ifCY2se6FddH/G5QYyZ9C8LTWPQun4YhMiIRs7Dd
	aOySwvndbx4s+gmSVcDZfS2asqg063g=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-676-IkROyCWlPeKf4i_uMbmTIQ-1; Mon, 03 Aug 2026 09:00:58 -0400
X-MC-Unique: IkROyCWlPeKf4i_uMbmTIQ-1
X-Mimecast-MFC-AGG-ID: IkROyCWlPeKf4i_uMbmTIQ_1785762058
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-81e8577d187so118852957b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 06:00:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762058; x=1786366858;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=w6tFfl2k7VKoJYI6A9G9h/Yn4jzbGCJFQ1d/hM/wpXM=;
        b=lMXVddGS2O6EEDw6N0adMz/M18Qr1By/+XQ40pPpPQt2lcWSij7DkusCWhYuASTLIe
         joEfFuwkY5jVyev+h7yBW0/eqT2jdBIGreqnaeJFInA0E9m7ZgDb/dB8xpd4GH0vqZIz
         gBjOcce1VaAL3+E1gJn00pG+0Jeq4+ozoygKmlzdsRoeR2qWO5mAhndhf+GdFaGuWzQK
         L/LoVMK0GvDoNQTeZQZLzxQiNy+CHzQMf01eiO5PIo9WGBIzYzZ8HlfubuNE/Y7B3ndO
         5IDCPJkxzagacbL9R9bV/Gcln9nJDG2lzZN1BWTU09w/YtflRJvvu0v+FiHEj2qlSIqy
         3yZw==
X-Forwarded-Encrypted: i=1; AHgh+RooPpwYBaa0Y+t8JGB0ozqADDJ9DHXf/uHfkVQr2Jl/0LgUmpPxx+xAN00+J9h9gTORzFDGuQf0zDrV22yaLFzc@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8LciwPsT902j0xIQP3dB8V83l7xwZDb06aLkWqjrRnktn2idX
	sKFaELkUXmH/C2JkNrUu/AGN7NkcpYTaKoqa4vQEvAYS4fNj0SyvA+oRPFsIwwQvdQ6cmTY2jT7
	QLKSEreeCZ7jZZP0/VdK3dTgN9unM66Iiv3LGgLR2xSpD1f+I1k0eB2fQudML4MsN9FSe5tK7lz
	2s
X-Gm-Gg: AR+sD111zB7a03akGtUXa1/eX3TSfK2XJcKXTAfg2wskGVbUNjUkfi2lsuxN8WJuTBp
	YlBW4z41ldOGz+8j3FxmLFyAcqlihQz9BGG+HBcG+dqU/PMiy+DfNICg3t6PTqQdjk+eYvtnfyN
	4ufBzf3KqpapbfVjz8cvWcmB0BEI9/w3OtTxVOYYbwpXHnUlSGhQosd4xnxBXh/RjcfIJEl8tWR
	gw8KoHvWnuvKdajPqgTmFCzwbe/gnoCNog1tKVLJeJS/zJ/BTufaBxFtZW5t74WEpnc4pq0povi
	bOoR5xqsn6/63ExA0xh++ZSC4bJYAjJgm+X57thPIYFxpHiN2UsFG6O0zpbH5K2yXkpsuvFvbSs
	Z2TQOyR53+FdPiyklvB4RltRojW7mGSYOnrc=
X-Received: by 2002:a05:690c:6c08:b0:7d0:79f:339f with SMTP id 00721157ae682-81fd4c09889mr120971977b3.34.1785762057658;
        Mon, 03 Aug 2026 06:00:57 -0700 (PDT)
X-Received: by 2002:a05:690c:6c08:b0:7d0:79f:339f with SMTP id 00721157ae682-81fd4c09889mr120971147b3.34.1785762057045;
        Mon, 03 Aug 2026 06:00:57 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fccf2e239sm54877467b3.5.2026.08.03.06.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:00:56 -0700 (PDT)
Date: Mon, 3 Aug 2026 09:00:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin =?utf-8?B?W+ael+elkOWQm10=?= <eleanor.lin@realtek.com>
Cc: "mturquette@baylibre.com" <mturquette@baylibre.com>,
	"sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	Edgar Lee =?utf-8?B?W+adjuaJv+irrV0=?= <cylee12@realtek.com>,
	Jyan Chou =?utf-8?B?W+WRqOiKt+WuiV0=?= <jyanchou@realtek.com>,
	"afaerber@suse.com" <afaerber@suse.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-realtek-soc@lists.infradead.org" <linux-realtek-soc@lists.infradead.org>,
	James Tai =?utf-8?B?W+aItOW/l+WzsF0=?= <james.tai@realtek.com>,
	=?utf-8?B?Q1lfSHVhbmdb6buD6Ymm5pmPXQ==?= <cy.huang@realtek.com>,
	Stanley =?utf-8?B?Q2hhbmdb5piM6IKy5b63XQ==?= <stanley_chang@realtek.com>
Subject: Re: [PATCH v11 09/11] clk: realtek: Add RTD1625-CRT clock controller
 driver
Message-ID: <anCRAqhQ93QAihsS@redhat.com>
References: <20260728142806.1954638-1-eleanor.lin@realtek.com>
 <20260728142806.1954638-10-eleanor.lin@realtek.com>
 <amuBqi43ce9bYbir@redhat.com>
 <577a6882b25e457fa94fa199e66f3197@realtek.com>
 <amy47how40BJnHsn@redhat.com>
 <a216b77c125544c0871b40f31c021ef7@realtek.com>
MIME-Version: 1.0
In-Reply-To: <a216b77c125544c0871b40f31c021ef7@realtek.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9JVIGn0WmPpa94lqG9YnhccLMtgHa5m67MCONxXHiEc_1785762058
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_060104_286305_B8D35848 
X-CRM114-Status: GOOD (  28.25  )
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

On Mon, Aug 03, 2026 at 09:56:01AM +0000, Yu-Chun Lin [林祐君] wrote:
> > On Fri, Jul 31, 2026 at 08:17:44AM +0000, Yu-Chun Lin [林祐君] wrote:
> > > > On Tue, Jul 28, 2026 at 10:28:04PM +0800, Yu-Chun Lin wrote:
> > > > > From: Cheng-Yu Lee <cylee12@realtek.com>
> > > > >
> > >
> > > (...)
> > >
> > > > > +     { /* sentinel */ }
> > > > > +};
> > > > > +MODULE_DEVICE_TABLE(of, rtd1625_crt_match);
> > > > > +
> > > > > +static struct platform_driver rtd1625_crt_driver = {
> > > > > +     .probe = rtd1625_crt_probe,
> > > > > +     .driver = {
> > > > > +             .name = "rtk-rtd1625-crt-clk",
> > > > > +             .of_match_table = rtd1625_crt_match,
> > > > > +             .suppress_bind_attrs = true,
> > > >
> > > > This driver is listed as a tristate in the Kconfig but then you have
> > > > this. Is the intention of this driver to be built in only?
> > > >
> > >
> > > I will change the Kconfig options for this driver, as well as the
> > > related config, from tristate to bool.
> > 
> > Keep it as a tristate if you are going to use module_platform_driver().
> > You can also drop suppress_bind_attrs unless you have a specific need why.
> > 
> > Brian
> 
> You are right. Keeping it tristate is beneficial, especially for aligning
> with the Android GKI design.
> 
> To properly support module unloading and driver unbinding, I will add
> the .remove callback and drop suppress_bind_attrs.

If you are able to use all devm_*() APIs, then you shouldn't need a
remove callback.

Brian


> 
> Thank you very much for the thorough review and suggestions!
> 
> Best regards,
> Yu Chun


