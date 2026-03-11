Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CE09FD063C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 06:51:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zvEX0IAkMa6oXnGfx3rdipMmH1BF7wL9zhJ+aTV/NY=; b=IjYKLrLnIqrLsKJepP8iOs44BD
	cgW8ooYTrrLl3h489psAJugkEYnYd63OmriVEKrhyX4ObgYb5PWZJGHv5XQqVtnkZllmOwLN1WPXm
	SbroHeyigbc2yECuY6c3NfUlEdtyllwt6BGut4bsprG6YCqh/RnOmnT+/JXFcgReMdoxkANPT7ymT
	eUESQisfzFQ4RZh4rzF81W5kRs9q9U25FfXptbdzTvloi9SCpSjj+mOsn3u5iSvbkE7XmbXII7xJA
	uYFdpMSBaYjfblm3diubcVif9604I4tlzbwYASg7PZ3yM/c7Arz7Rk4tjTphYrbXV0u3cANT/pqo0
	f/uwOU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0DPm-0000000AxKC-0ewC;
	Wed, 11 Mar 2026 06:51:30 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0DPi-0000000AxIj-40Ov
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 06:51:28 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso43321835e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 23:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773211884; x=1773816684; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7zvEX0IAkMa6oXnGfx3rdipMmH1BF7wL9zhJ+aTV/NY=;
        b=lg/uRwd0+XT/yoFMs1uG69Y9zljo3OS1kU6wBEP+FFy+Zuxi3yCSx8u0odCAw8BPEe
         Ud6mk9U3o7e4LtmCBh2kVJSK/QlRaJCMFctNCzD3OEu1ZxLf8g1fLVvX/8TX+qwMofnT
         5amM6h+9oYHtvRCu+Hqh0Colm3iy3GIjMWtNTJr8xJNyhFrULtY9frPH11Z/FE/40FXP
         4Lw7TU+2JMtlzJ9sDTyuuCUCAZPNfLyiWMyArkfZg6hvOE2RdPnzjNuvwwiRbj3/aHKl
         S3P+ARtmJC/36UlwfORbKyYcFaYp2Dc299lJ/N/0TbN0nwqN433txYuMv2zVgR/fFyOG
         7efw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773211884; x=1773816684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zvEX0IAkMa6oXnGfx3rdipMmH1BF7wL9zhJ+aTV/NY=;
        b=ko+WyKt5brs2hXejZeX6M3xjv3fuNsfyqyxpDVXMniYcrs0AgVrCsyc67jp7P9ADkl
         CgTKv7+l/jBOTr9uWC2kLMX/zBNtmDs33r2Wg0TR2gfml+HLJQGzRO0H6GUqVewr+T3R
         Z09WOgyZV9RUzt0yQI+UzBtUQcFYp4huPrLCeBc2UPZCXsaFybk0j0Dj1OI1gj+7cF5r
         X+cuAqUY5q7NtL1T7QtxMwySlBw9/ihbq4CqQYXzxsiVEBRN/5W0cvLw6rPA4ZGszj98
         +pltMWMzv0tYnPABwniblfia23f7FcIW07wdAFGUkj0vI44rZE0bRT0vbZSObVLyDN/K
         oaEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFqgVBy48NFxa7wUxZ2wCS0L3WaQ0JttHS7Ii4d3SDouckjkG1zeaw7j5+Njgn/37Z2NqKzOdQS7XS5m4It+p/@lists.infradead.org
X-Gm-Message-State: AOJu0Yw73q8t1aLMG/tCYDiLhpf7ifGxZ3LvdS+8nv67onIYBG9FI0gM
	WGYngvGwMIl+vxG3+57tjigDouWJUlSuGrUsavwrS41qr2bKJ6FOgZ23FpwiD99AfSQ=
X-Gm-Gg: ATEYQzwdVDWeUxTN9fekUb5ogpKT1vPNZ3lj5WV2iRqZHFRX7oVqMDYWtLcTk5sczLB
	UcAJ/rlUTSg2Cls6+ZD64eURs2YIYNY2EeYCS9WcFDcBW0mQV4HF1qjis1xIMOoEgIg5hw1+OmR
	LqNBFdkd250WxAWarVEOiLr8xiu6T0H10O7JsL1iTqJhhfnslkHHJdHQhfWk3L7I8O5NayBXKjn
	tsQzkadUFm6OkFsBiVwuhtP4Fg+jRxnUHh1liG9TrY+rRSkJuMdvsxhfzGZo8nguTYqxdvDEGMi
	xUzITtmEQnytchWc54pMNxbH5EXt0uofv4uDceNm/k7Mue+SMjh/E5af3rqXRpxeasBIemrNcu7
	rAIR4e1wTRItmC9FIMZbRnNQxSNZLelRL1J5f/PZCnQlk0v4Kt5k+5uTcvwICIfGGaklEGYPe5u
	WVBMRFG0LeJIWh6lMq8FWmtCZz19lF
X-Received: by 2002:a05:600c:1383:b0:485:2fe9:3375 with SMTP id 5b1f17b1804b1-4854b0bff59mr23795475e9.15.1773211884113;
        Tue, 10 Mar 2026 23:51:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f820a2f1sm4090148f8f.30.2026.03.10.23.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 23:51:23 -0700 (PDT)
Date: Wed, 11 Mar 2026 09:51:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org,
	m.tretter@pengutronix.de, mchehab@kernel.org,
	p.zabel@pengutronix.de, tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de,
	kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org, ribalda@chromium.org,
	straube.linux@gmail.com, lukagejak5@gmail.com,
	ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org,
	mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH 1/7] staging: greybus: simplify cleanup using __free
Message-ID: <abEQ6HA0CGGCyV1B@stanley.mountain>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-2-sanjayembedded@gmail.com>
 <abCIBPZzZBfMoOtm@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abCIBPZzZBfMoOtm@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_235127_001845_AC2BB639 
X-CRM114-Status: GOOD (  14.70  )
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

On Tue, Mar 10, 2026 at 11:07:16PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 11, 2026 at 01:35:07AM +0530, Sanjay Chitroda wrote:
> 
> > Replace manual cleanup logic with __free attribute from cleanup.h. This
> > removes explicit kfree() calls and simplifies the error handling paths.
> > 
> > No functional change intended for kmalloc().
> 
> ...
> 
> > +	struct gb_camera_configure_streams_request *req __free(kfree) =
> > +	    kmalloc(req_size, GFP_KERNEL);
> > +	struct gb_camera_configure_streams_response *resp __free(kfree) =
> > +	    kmalloc(resp_size, GFP_KERNEL);
> >  	if (!req || !resp) {
> 
> Now this check should be done in a better way.
> 

Yeah, two if statements, right?  Drop the curly braces at a minimum.

> > -		kfree(req);
> > -		kfree(resp);
> >  		return -ENOMEM;
> >  	}
> >  
> 
> >  done_skip_pm_put:
> >  	mutex_unlock(&gcam->mutex);
> 
> To complete this, one may add a prerequisite to use guard()() first.
> 

I don't think we're encouraging people to re-write existing staging
code to use cleanup.h magic...  It's unclear if I have to review these
patches or if they're auto NAKed because we're not doing the conversions.

regards,
dan carpenter


