Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB6DCF9D0CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrpH3O/UC588LGlyijfHqwmmf8Fc2A9hjyYsMCvb23A=; b=zhIct983+UIFGr9yR5Kwg/+yCL
	7XEOfRiDRJ9sRGlU4EqKvgCbv8DwXT2Jr4FxQbb8LLO6k+k7Y7gP0LuPtcxnCTVtUwmAO5GsdyU0W
	TkrNmtbGHVzipZlK3M1Og4p7qBqLnNbgLqgc/buMMe4+2JPFOpXJVfbiy7y7OEQBN/GS+kWgA9SW1
	LcQtQQtAvcOV3SoWpSqMTXowfFZvQUB3OQrrcSocV86D6d3yBfD+MCt/SvuNLTPO8vw+Oo9Vk518e
	+oH0bMh1vIDJya+5yyBZ0junvpD2G+yWDxAcqeor/sFZOyTnzTbZaP4DEfHJtON9QRCEL6Z3jzDVN
	nLjt7Rcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdvR-0000000HO1c-3oXu;
	Tue, 14 Apr 2026 13:35:33 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdvO-0000000HO1G-2JXH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 13:35:32 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-8a5800772f3so45545196d6.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 06:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776173729; x=1776778529; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MrpH3O/UC588LGlyijfHqwmmf8Fc2A9hjyYsMCvb23A=;
        b=Bl+OZD7qynua4kAniGwuwRl2Oka1CrGeuvqSTt1BpcxhPE4RYaEpaSGKMOy0zkpmoV
         7jafwVgAdGoaFnPUhfgNMz220e3wbZIzl3VpqczYYk6YYRAp1zF7HoM9dhx+PUKGgjng
         OjT8YisDXctzbhnTSLbtrnIBaXaHheR7eTzhj5Xputnr6tyss+l3LTqZNVzjdoqw8+xj
         EuNzOWhxJYEAMXML6DegtcuXAMPelqcQBOX3u2xO84fT4sRPf3fEMnoOzZnVdt38xdnl
         tg4BAhXIM2hzuRUKqun3T/Tj/yGTSLoeVf90NCdYjRHcdlTDuW/OYOILU3vEBsq/z56w
         YBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776173729; x=1776778529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MrpH3O/UC588LGlyijfHqwmmf8Fc2A9hjyYsMCvb23A=;
        b=Go0OniygFT8Mr6kw9zTum6SrDIDrVJQ1nOPOoL6nZ2zZnXV2haPFSv48MPhft1Efwj
         AXpcrgm5MWFS4ADFQZKxOT8C630mtka7GXiIjHUbWP325gWAE7ZWQfxcFT21IkVq/0dI
         su60EicuMVAh2HMFT/CC/CJ7A+GmqY9EN+FMOr3BKJXwAYSyyz6McxsL478TUh4krqK1
         T5G90aPMcuzPxcT6Pc63/l6qkhuhIULaizJry6apaDGDeDFKAVjJ5s54xO0Nr+9jikLD
         4u8FxyHnbz8AOt3hL12n0rV5D5WwvEhjZOnPJ/PmhoLznebopu4sirAgw/VVhslLwSVB
         Qldw==
X-Forwarded-Encrypted: i=1; AFNElJ8h9T9vmyK3mSJtEtZ7LsXrPfFh02uODI/Lumn9otlZnJKY8CxkiPH6OmAg1PgwTmtV1RHKUW2LGpq8oF0zZFhQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0qsNvfKJVy5U7n9ZbkmiukjuAGOQKXv83fP9R3Dbkiy0UhDH2
	lyuhRjQhusiOHHenHPBwTP6L7gfITpBXo7i2e21X6XRGnglXZa46skadmsTS83pKHjM=
X-Gm-Gg: AeBDieuruWYnO9F5S45gkmdyU9tFN7QvECRAQjZ3V0ZoDMkQ2bv1qK/QKBujkWaotXM
	kTtV/p3S3i86ez08VHH5Q/NF2f3XkZUhaanhWeqXUN/NbdEKoU2M2oatj0dit7G8ZEFYj3dZKEm
	opSMpw5iWJpW1nFPsgpHVoUZly9QPiL7rES1Ml1q/0ufGIqiLfq6RBL1KfqPZOrtT/yr1azC+fU
	IKn8Msugsq9eDGKHd+Ptd7tloAHuZCRAoCXMnWXNOCO4RpsNqkI9Q5LGUsgSHjmy2iEV5CwGKKH
	Hc7sGjgZxZl0o1oAbR+m5M0aYDfti8Qvz3tsHX7Q8jpsrme8XdcdNitNciEhvOTuWeRMk6n4v58
	gib8RzsE9ldOAwA1DZuM7HLH4dioOvI2Y8uqQXjJzK047JMp13zKUywLqlObFseG9m2bDRJfU5R
	9nN20gejVoQXviNN4MWSstNhqALtYngpCu5RPkscAEb1ahECxfWvyAFICzXqoaBQhgL4b+PV/7M
	AXKvg==
X-Received: by 2002:ad4:5ce2:0:b0:8ac:b1ce:3244 with SMTP id 6a1803df08f44-8acb1ce41efmr112063456d6.19.1776173728649;
        Tue, 14 Apr 2026 06:35:28 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8aca259724csm71335146d6.12.2026.04.14.06.35.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 06:35:26 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wCdvJ-0000000Ay68-2r97;
	Tue, 14 Apr 2026 10:35:25 -0300
Date: Tue, 14 Apr 2026 10:35:25 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: Sami Mujawar <sami.mujawar@arm.com>, Dan Williams <djbw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, thuth@redhat.com,
	steven.price@arm.com, gshan@redhat.com, YeoReum.Yun@arm.com,
	cedric.xing@intel.com, Dan Williams <dan.j.williams@intel.com>,
	Dionna Glaze <dionnaglaze@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	"linux-coco@lists.linux.dev" <linux-coco@lists.linux.dev>
Subject: Re: [PATCH 0/3] arm64/virt: Add Arm CCA measurement register support
Message-ID: <20260414133525.GA2577880@ziepe.ca>
References: <20260413084957.327661-1-sami.mujawar@arm.com>
 <20260413125925.GK3694781@ziepe.ca>
 <514ddb27-137b-4223-84fe-2152737db3a6@arm.com>
 <20260414122950.GW3694781@ziepe.ca>
 <a1831d3d-af31-4fa7-b107-f4001841f051@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1831d3d-af31-4fa7-b107-f4001841f051@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_063530_600503_5F1BB846 
X-CRM114-Status: GOOD (  16.91  )
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

On Tue, Apr 14, 2026 at 02:26:58PM +0100, Suzuki K Poulose wrote:
> On 14/04/2026 13:29, Jason Gunthorpe wrote:
> > On Tue, Apr 14, 2026 at 11:10:51AM +0100, Suzuki K Poulose wrote:
> > 
> > > > Isn't this also sort of incomplete?  Doesn't anything serious need
> > > > signed measurements? Isnt't there alot more data that comes out of RMM
> > > > than just a few measurement registers?
> > > As mentioned above, this series adds the support for Runtime Extendible
> > > Measurements (REM in CCA, RTMR on TDX). The RIM+Platform Attestation is
> > > already provided via the TSM_REPORT
> > 
> > Okay, but what actual use is this?
> > 
> 
> Good point. This REMs are planned to be used for EFI_CC_MEASUREMENT_PROTOCOL
> as described below:
> 
> https://github.com/tianocore/edk2/issues/11383

So this is tying it to the same FW event log that TPM uses.

I think that strengthens my point this should all be uninform. TPM
drivers are directly exposing the event log today, but I guess that
needs generalization if non-TPM drivers are going to present it as
well.

How do you imagine getting and manipulating the EFI event log to use
with this?

Jason

