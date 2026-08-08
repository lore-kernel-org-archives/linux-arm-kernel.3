Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AD25C5AD48
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Aug 2026 12:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7Z80X9FpgglIlhnFzOdLw8386r1jX4AyfOgEB2R9U4=; b=C9h/Dh/frAhqasUijq0lRnLicQ
	T6qlZQNBFCDhpqmOI0MWDYCfWNNHgO/664EEi9PznXVXdw9vgdRuCfdlJhwspfvYAAhdhWiEmlsSH
	b9Lw8cdHVecN8Bgjl1CMUORq1YYQpexbsiFJHvdpG/UzStOR3rY51R0AeQUmS6cMHHoclh5sk401Z
	zxw9cRKyv/dGG9gQ3vfpLTPIbyiblSDsxl3Ll0U0QOYLH3zTw8Txpw2D+xYJ2DB+ha/N6TvWdJpQP
	U3z6qW99xypWw+Spy0YY4tgUE8/4JMitVbCqJcgShAZKON6HObg8Ghd899RiVo8Vep+rRSRsuu9eG
	gI7er3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsgLA-00000009MSE-0FtO;
	Sat, 08 Aug 2026 12:39:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsgL7-00000009MR9-2X4t
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Aug 2026 12:39:51 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4957952e0f8so454495e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 08 Aug 2026 05:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786192788; x=1786797588; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/7Z80X9FpgglIlhnFzOdLw8386r1jX4AyfOgEB2R9U4=;
        b=GpieTRhOZAFyuQlUkTeOCvgxSbjAPFKxDZL9J9me90K7WhpaSXsu4EdtkhQtKe1q29
         zywiyaxU6cKUSlvj3kYJZRd3IpGIIz8nInTOfK9wnAmHKpeBB7CENDkguZqxffnkhFgg
         XHvaufRi470FRfRaZ14DYIufORelM9DBgt89FgUQvHegibjxw83kpTF6H3j9JBz1UjZW
         vf6DXzC4+DhPWFEvfqzWYCirZTIvD98S99shrJEi3BwZA9lhmZJv4S7clvIyvj1Edls2
         7iiMKl6gw+csegORkeJwb2qPrk61smYbwS8Dmd4bAXjwFdlihA9F6nuKgRmgcjXOz3Go
         LOVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786192788; x=1786797588;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/7Z80X9FpgglIlhnFzOdLw8386r1jX4AyfOgEB2R9U4=;
        b=SsBRz0CrzN6m1Z3IMLLHl+hVEoRCpQPHgKy145mf9H7YgRwz2jaGoyCDrKkhIbUBD+
         Xr9nv3OCPOjzsBdvo/keSUo4Re6SmiTEkRyZklhlt9jsZx66bBX7j2bU3Ei39lxlfB+d
         62q7DY75raIUsWO/SaqQbkr7Aq9c+yK6KOAG2p6bikEY29spXhezZZcY087Ndy+n7yFb
         sykWGfAzoYG/7C00EJR2ovsg7s0oYh2Bzn931P653tb5Sq63rLcMUwtHJFKcnB1SHJxg
         4shLoxHw1qiivl9UiCOCiHTVnP1TMkp7GYMJIuZtf4rB2w0acOBbcoosInErYT78l9TP
         UBeg==
X-Forwarded-Encrypted: i=1; AHgh+RpduQ1rsvIgum37AQ02AGjQQuNgWQUnVSEth1W/ZDeMXppTARoKNFFpSKCWivP8Qep0td+OB4RaUSW6fHS2CWQA@lists.infradead.org
X-Gm-Message-State: AOJu0YwuKSDqOnB3wvYZiXqwDdBS+hMnAvc6Z9ye/l89sumFy8zVOgeY
	0L443hHMfKBishI1Z7AfjqfKeXbj4gC2KyKeYsHriQg6plqCqdEk9OPR
X-Gm-Gg: AR+sD10rM7AfqIg7LPZKz59vp9rHkH8/0nnBe6MFTOeU+1gRxEYjbraLN0GN0DMzIG4
	u87NWDcZvvwDhmJOEONIVrw5BAsWD6ySFb19U1cbXwUEHQ1hJDCJg0uOV6uhrmlnF0xfShPIFtD
	UFtFS4XCnhDxYZlwMOJvQ08q6LWViTk9Cd1f9d2AwEw9oW5gH5MDbLlvYJRlxTitIzFZW9wqL9X
	OPGLqf7VqK+AYljaFkwBywDUM9rB2z7YryMy5PFgJXxP8BR3fea92q2zLYBBCPM6hr0wdy74+DA
	ITZ0c8G6mUXllsq0AI/h61vOTaz0T+vPdX2bkUQ7EaVInLFHvZuhRLOFIdoxcJOQ1QwZjr66yYH
	DUSCBbZJiZTd1V+8arj2CiBKMSlmgn0tzRgN9N8gaI8+ymHkCMHu7lEgMjc6Ky/vDKTYeNyFpv3
	ui2XPaomYpEunUW9smN7T0KFQdq4s0vDV7sTY8LdcA4O0BzG8euzz7TsGcBWQrcVSkT09T3TNhb
	R77VPhed5ngEQPL0aXbZgTZkYSOAPVsMSg3IuCdeTmUZpurjdhIJuogvWdF4bt9hV3NOA==
X-Received: by 2002:a05:600c:4ecb:b0:499:59a1:96f7 with SMTP id 5b1f17b1804b1-49959a19770mr126652915e9.1.1786192787600;
        Sat, 08 Aug 2026 05:39:47 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8E20009911270F4BEC2300.dsl.pool.telekom.hu. [2001:4c4e:1b8e:2000:9911:270f:4bec:2300])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995ea2e038sm115426525e9.14.2026.08.08.05.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 05:39:47 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Heiko Stuebner <heiko@sntech.de>,
	Alexey Charkov <alchark@flipper.net>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v6 7/9] accel/rocket: add RK3576 NPU (RKNN) support
Date: Sat,  8 Aug 2026 14:39:24 +0200
Message-ID: <20260808123926.23903-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260807211629.1573228-1-gahing@gahingwoo.com>
References: <20260807211629.1573228-1-gahing@gahingwoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260808_053949_659213_570D9D1A 
X-CRM114-Status: GOOD (  19.70  )
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

Hi Jiaxing,

No need to apologise - you found it, and you found it properly.  Diffing
an ordered trace of every register write against the vendor driver on
the same board is the right tool for exactly this class of problem, and
a 12 bit versus 16 bit field in a header derived from another SoC is not
something a reviewer was going to catch by reading.

I had gone through v6 with the RK3588 side in mind and had a list of
comments on the poll path in 7/9.  Most of it goes away with the
polling, so I will not spend your time on it.

One item outlives it, because it is not part of the poll machinery.  In
rocket_core_init(), the new multi-power-domain attach returns without
unwinding rocket_job_init():

> +	if (core->soc->multi_power_domain) {
> +		struct dev_pm_domain_list *pd_list;
> +
> +		err = devm_pm_domain_attach_list(dev, NULL, &pd_list);
> +		if (err < 0)
> +			return dev_err_probe(dev, err,
> +					     "failed to attach NPU power domains\n");
> +	}

The path immediately above it shows what is missing: rocket_job_init()'s
own failure path puts the iommu_group reference back before returning.
If the attach fails here, the scheduler, the ordered workqueue and that
iommu_group reference all stay behind.  Since RK3576 still needs the
attach in v7, I expect the same shape to survive the rewrite.

Smaller, and it may disappear anyway now that you are splitting 6/9: the
commit message says nothing changes for RK3588, but struct rocket_core's
clks[] grows from 4 to 6 there while the two extra names only arrive in
7/9.  Either a line in the message or moving the growth to the patch
that uses it.

For v7 on my side: once the poll is gone, the only change my hardware
executes is the job_lock move, which you are taking out of the series
anyway.  I am happy to run the series on all three cores here - probe,
multi-task jobs, all cores in parallel, a forced timeout and reset, and
runtime-PM cycling checked against a bit-exact oracle - and report what
I see.  I would rather send you results than a tag that covers less than
it looks like it does.

Igor

