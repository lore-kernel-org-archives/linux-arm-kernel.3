Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 735CECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:51:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDqVhSeK1e71j8vG7CPDHZkgMbyJjBHY6Iqx2foqFvE=; b=dIAYFmGHjxudpQ6se6Tu2h/XkM
	VrQQtigImSKDo49jHw3xbsREFdojn3lLvXBhVgFYmvpBVoFkfNyCzGGPT4NDEat+XlN43vdZe8C6W
	b8uBPa6gvnTXqiBZRokFHc9weZFEM0CT4PLFVySzq430TKULswW0MH7ulU437w7n1Xf6U8bIzvvrF
	sxgSs5TlfJKba/K1BNgq5ZPPNUujdW8RGuJLFm3SfRn9CtDftO33bcd/kJETkFaT2ADACnkpAcT1q
	s1OrpS+LcHYz++x+8JRUYmf2yhY6M6RJvm0nKNP7k2XfpuNgSdFsdtxFtKlGpXlORLmrDJLEABtcv
	4WkEOtVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urMB9-0000000Gfcc-1BvU;
	Wed, 27 Aug 2025 19:51:31 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIL0-0000000FxMn-3qYn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 15:45:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1756309525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BDqVhSeK1e71j8vG7CPDHZkgMbyJjBHY6Iqx2foqFvE=;
	b=HEKV1W0zWY3TKZKr56tGZ+rXCx+n60O6/vpc3uysTGflLm6l0UpNKw+7rw9TdT4IS2sWS5
	wEvPRscaTQZ3lypCsUL3xIlDwNjOOoJaSGVjXeGyWFxfI1BUZcTq2rmQDtmv66pFZc3jZt
	fjuG2veJYIxtTARGzGqEm2ByNbxzeGU=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-ss78_1iBNhSohc4yNMW6XQ-1; Wed, 27 Aug 2025 11:45:23 -0400
X-MC-Unique: ss78_1iBNhSohc4yNMW6XQ-1
X-Mimecast-MFC-AGG-ID: ss78_1iBNhSohc4yNMW6XQ_1756309523
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7f2942a1aa1so279078185a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 08:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756309523; x=1756914323;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDqVhSeK1e71j8vG7CPDHZkgMbyJjBHY6Iqx2foqFvE=;
        b=nGwcw0jIFA8m82x1sWzdH7HfsEaEs5BFmCzxM08QNnleuZC0AvTymxOK6moqHUFYM7
         9u4Cl8ZjKro4ejHWjO06ehAZ2RqRFjcuX0YdfqKWYxCva8eOwkxY1eFPm2ii73YKmvc6
         37WpCrVLDERvt/6eARxR60lGsAGNtVJCXNkmRPk/XE5zo0JTVv/IlRN6W1cSniZs6c5T
         bd72jkpuIK9LJN7XPRxW5AzJESxsaxhWozHTfl4pQsclfvBtkkwkRVM48Y846s5sak/L
         2Wav/XToaYI05maG3o4XB90eDRwBqVDSlXbCUc5FLbA8Xg85zgHDp7vVYULw/iN6zAUD
         XUOA==
X-Forwarded-Encrypted: i=1; AJvYcCUNsHQ+Gb/eK3teXqCoAkDwCyE7970xgg4xr8A5qeNA77F7ywTDVhTBjFZka6fPzqBGmNmLo/NaIR1mxZjGuQn5@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi6dg2Ni79vGbNfge+WYV/QPskNPKRMDsz+esgsmsG8pKPuCw8
	URNtDG7BfSeoC+m4NX6X+/1gqwozYB7J+n4aoHl8uMe2DMoTHyvpIAJvbTeeO/64PDPVDWbyXUP
	OmXvDrSaLLvpdYsK+x4hYc9P3W0iDZ/TrM3HIqrJl7WuhtLogdI5FuS37HC/j7BtKRjUpDkVkFC
	bU
X-Gm-Gg: ASbGncuPB0fJVMHPgZ7s6sWetgaiaZBtPoN7BkaqBW7rJpOV7FjjHDo47vuDdJSAxEV
	JNNszTDvHHnGfyEeyzRPQ7n7gziqQeK7LouW2Ko1A/7L2nFmDojLGMmSsWneynWf0LcIWfD17zF
	7Zwa9qFgB8JtUszxGLYkamDDK8wVWrus4hBietJC4RNKVuFzTyehe4f7quiJT2ZdsZruGiTHJJ2
	qEn9hYhcpv6UASSrBSvWTk3cLFlY6cLFQff/fyW/GSQSQedLkL0Mdzwc282gQ9Vf54Vbqd0jsdU
	92HmgosjNeyj6zEzkhMNB+0gx2yTyDBZBDhirbHeO0x+nO1crxfTLhCXnQanN07ISufSNmB1Ta8
	SfOmcunt16j+EVLzc9fc=
X-Received: by 2002:a05:620a:3709:b0:7e6:9753:d959 with SMTP id af79cd13be357-7f58d941f00mr677233985a.4.1756309522453;
        Wed, 27 Aug 2025 08:45:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmUGjZymg97kwzbvc9Ng0QsbL1xmqeZFpXH0SyMzHjWziskdn6bTnadHzycYk8K6ZKteAcMQ==
X-Received: by 2002:a05:620a:3709:b0:7e6:9753:d959 with SMTP id af79cd13be357-7f58d941f00mr677228485a.4.1756309521893;
        Wed, 27 Aug 2025 08:45:21 -0700 (PDT)
Received: from x1 (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8de632csm94044401cf.36.2025.08.27.08.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 08:45:21 -0700 (PDT)
Date: Wed, 27 Aug 2025 11:45:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peng Fan <peng.fan@nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/3] clk: Introduce clk_hw_set_spread_spectrum
Message-ID: <aK8oD6HNw131avjI@x1>
References: <20250812-clk-ssc-version1-v1-0-cef60f20d770@nxp.com>
 <20250812-clk-ssc-version1-v1-1-cef60f20d770@nxp.com>
MIME-Version: 1.0
In-Reply-To: <20250812-clk-ssc-version1-v1-1-cef60f20d770@nxp.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rvsWd85_Cx-DV76a4dtIYDtPG8uuAWr87bOKnQpelSs_1756309523
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_084527_222494_4D4C5EF6 
X-CRM114-Status: GOOD (  16.28  )
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

On Tue, Aug 12, 2025 at 08:17:05PM +0800, Peng Fan wrote:
> Add clk_hw_set_spread_spectrum to configure a clock to enable spread
> spectrum feature. set_spread_spectrum ops is added for clk drivers to
> have their own hardware specific implementation.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/clk/clk.c            | 32 ++++++++++++++++++++++++++++++++
>  include/linux/clk-provider.h | 29 +++++++++++++++++++++++++++++
>  2 files changed, 61 insertions(+)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index b821b2cdb155331c85fafbd2fac8ab3703a08e4d..48c7a301b72b30fd824dae7ada2c44ee84d40867 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2802,6 +2802,38 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
>  }
>  EXPORT_SYMBOL_GPL(clk_set_max_rate);
>  
> +int clk_hw_set_spread_spectrum(struct clk_hw *hw, unsigned int modfreq_hz,
> +			       unsigned int spread_bp, unsigned int method)
                                                       ^^^^^^^^^^^^
Should this be 'enum clk_ssc_method'?

Also can you add kernel docs for all of the parameters? I know it's
documented on 'struct clk_spread_spectrum' below.

What do you think about having this function take that struct instead as
a parameter to match what's on the clk op?

Brian


