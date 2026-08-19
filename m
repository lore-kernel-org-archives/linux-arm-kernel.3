Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8CEC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 21:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVGzn/bp+HeoWhJcAlXzRJysNeFi8GSJbP12rbQe8Y4=; b=n3P4mNN7xC/sG6J5UR4yxNaR6p
	7yNiNTQ/EJ+aE4GOwb54jLFNMLL4k3PsqLY9sRqvuShHdQzdY7KiWae0XWaCJvh+vdFIvb4XMxmhw
	Ey/0VF4bfNrISI8oOybTMhkdUlZCi7RACZz1NmS23fIAH20iSCSoJztVDf1eXqhgzbfvymLdhJk87
	ddLrV8YyBDD3MYX0/dbSm+Sbh8El9+7JdXe5aVJcQOJgf8kFqvtaqMTvOA4u9UNdQfZ5bNSNn/Q4A
	ZhQHROv89Mq1UrFDAE4o9vZJmf2MlU6mC0hb0Y2ht80vUn+nCRnze2NtFgrbnQ9TsbaEDdmo5+GEK
	0Y/qWJvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnj7-0000000AYU5-3P3W;
	Wed, 19 Aug 2026 21:21:37 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwnj5-0000000AYT3-3WP8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 21:21:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787174495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pVGzn/bp+HeoWhJcAlXzRJysNeFi8GSJbP12rbQe8Y4=;
	b=N+go3blv3GzyhCHCmjv+XOcrNvCPJp/1PY7q1nw3IfaAgDS4eVdwXNwD8yLX9HImRpSO/R
	xsDd/oBGnaB7pIVSYcW7OHPH/nnoUI+G81PcA8QJSkV0TKlzQcJODfpWHm7daiw4atM2St
	mDYpg+MOp1osOLWXSRrnvb2KZxoQEZ0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-lEhVzlJlPhCQct_-8L4_Nw-1; Wed, 19 Aug 2026 17:21:33 -0400
X-MC-Unique: lEhVzlJlPhCQct_-8L4_Nw-1
X-Mimecast-MFC-AGG-ID: lEhVzlJlPhCQct_-8L4_Nw_1787174493
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52d9cef8d15so24475881cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 14:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787174493; x=1787779293;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pVGzn/bp+HeoWhJcAlXzRJysNeFi8GSJbP12rbQe8Y4=;
        b=TfRiBu81nwCGOW6I8RpaxOhis9kxcXi+ZhZKLiawrX1em9AW1glIiJNSZM2DeCWaZC
         btMQnSbqCf+WzZReTegT9S957OMWxC77/fNqgWVVKuUCjC7ITuklHefq1FssJSHfKjx0
         YVkNioZ7tSvZcCzK8ZeND3h1QCEK9f5iCc6d9qM5mqW/3qK9+dHpetV6W+GMrjxIVdHi
         zkFYwaCSGJFno8jjgNQDYssrHWNhUBpfYtCjMLT9SNiXMZLtlFpf7Zqy459zPjzqjZaT
         aJHohPuajBe0mZsJIe2SRtQz26GAoZCosP700Km7tAaQGRETrs9BDiyxtd0lLEOCAymP
         lNqQ==
X-Forwarded-Encrypted: i=1; AHgh+RowGD6OevKsWZZ+hLprkRk2fs3LcsJWf4AxnNEfzBVmouCoqD2I0O6x6/Hs1sHzG/Qm8duckE9M8ZGG9kHtnmCG@lists.infradead.org
X-Gm-Message-State: AOJu0YzKpv/rdNARJbib4141Rf+W6bh6VEi1WG+opGvobodZqAXVemZA
	qxohrWl/zfdrLQe24qqrvGV1WtbDZczP5X0FqVpOGRyzjbcUHcD14nx+nPKyin7d6vOgJhKvcLF
	rS+En/OmtG/yo7GsihCZZwHIoqeOMCB91gwBWYkfyjci+B2Sbvr5KLwFTEqXRrK16MRmCOfhI2g
	DJ
X-Gm-Gg: AR+sD129K+Bi9R8sh8RUI9yRhkkbRcQv3rUhBDUmbTpuAdqLtvrDRQSk+fd1wlSpjp7
	HPQBb/I4zuuqrGn+NfLpbLy71qPeVGClSPmeIVlO/QbbCFZM5q/6gkfhK0ZRHN3hj75qmgOMxf2
	j/jH6XytcX1Is1yppaJvu2QkIfFtoaBq3SV0/HeyTfElvTIRgQykWjGbSwRdvdxxVNxl5S0IpxM
	J050iPUZAJEgTxUrmNWUVw92MGX28Ipdp3i+DYwXYki06YNFNzrB1Xw81SUWhfxpAUskAH4W1pM
	0QLE1NsqUyWSfJm+U4npHs9487c+EQf4tcwQq5SXaSd5a6JC1LNPfHQ/aAt3jQLl69djQNGuQTo
	GtozmI+YhjhrTW++Ig94a/+//9grF4Mk8ov0=
X-Received: by 2002:ac8:5cd3:0:b0:51c:f8f:13e with SMTP id d75a77b69052e-52dd5cf792bmr79425461cf.40.1787174492941;
        Wed, 19 Aug 2026 14:21:32 -0700 (PDT)
X-Received: by 2002:ac8:5cd3:0:b0:51c:f8f:13e with SMTP id d75a77b69052e-52dd5cf792bmr79425061cf.40.1787174492580;
        Wed, 19 Aug 2026 14:21:32 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52dd8598adcsm18745871cf.9.2026.08.19.14.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 14:21:32 -0700 (PDT)
Date: Wed, 19 Aug 2026 17:21:29 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Nuno Sa <nuno.sa@analog.com>, Guenter Roeck <linux@roeck-us.net>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sunny Luo <sunny.luo@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-hwmon@vger.kernel.org, linux@analog.com,
	linux-iio@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-spi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH treewide 2/5] clk: visconti: Make sure clk_init_data is
 fully initialized
Message-ID: <aoYeWR6H3q-d3yd3@redhat.com>
References: <cover.1787165329.git.geert+renesas@glider.be>
 <42dd7be99acbbea1343e2fcc0ba4ffb91f8517ca.1787165329.git.geert+renesas@glider.be>
MIME-Version: 1.0
In-Reply-To: <42dd7be99acbbea1343e2fcc0ba4ffb91f8517ca.1787165329.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JJZdQRrinisNxFnSQZ83aJb7JJdG6qvgnM-gi-NvaJY_1787174493
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_142135_946597_CDCD6D24 
X-CRM114-Status: GOOD (  15.98  )
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

On Wed, Aug 19, 2026 at 09:05:16PM +0200, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> visconti_clk_register_gate() fills in init.parent_data, and assumes that
> init.parent_names is NULL.  However, the latter in uninitialized, and
> thus may cause a crash.
> 
> Make sure all members are fully initialized, to fix such bugs, and to
> avoid future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Fixes: b4cbe606dc3674b2 ("clk: visconti: Add support common clock driver and reset driver")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Brian Masney <bmasney@redhat.com>


