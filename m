Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C3DF9D0CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 12:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dJMqO/MtamYrx+eD9k7vgpIEFfxi+YyFS8+euIM3MYs=; b=ONnnvDtvkVfsXsEhBUJdtd5eZF
	oMUv1Am2YbbLBFbsOhGPqxa6OHLb/1MiOoixFaj8VSNRtdU0SfYHz+5vZZMt1V/YvmhZRhzIrhc1i
	tVn2gML35Elioz1NVZkjdLbzuyIiQymmkiwYsv6DXuOVXHo6UIkpQ/DYiUVfUnMidVsHFxmyI4mpr
	scj2ZIw3+eR/tPP7gbP703xMsT44JhVjvox/sGBWlSUzhFti7INlSvM7rLSf+du6ahUll85s0+niW
	AoGSucroZwdCIQWrI6faHqjD6cLoecFIP1NG77Z67ztBTQ8kVUbfo+tYzlWKXP2CkurPUGSeV8GUt
	6LdcZm+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCctv-0000000HIWG-2D8y;
	Tue, 14 Apr 2026 12:29:55 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCctt-0000000HIVv-1hwk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 12:29:54 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-8d68f702851so855265785a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 05:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1776169792; x=1776774592; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dJMqO/MtamYrx+eD9k7vgpIEFfxi+YyFS8+euIM3MYs=;
        b=EvP0PL9K6a3L4qWqWe6fjEPkG0Fm0PutZMjo7ZjKBGafORnwzAje0hHqDu8kM9tqkv
         p+PvoHYMSLOfUpWbuoO1fIUqu9XctMwkIk/9/YEEgNH4JPoFr1IlddQC6tv07pAIFkSC
         On6XH/7EXrNns0y8nlSX+JdDwynkK+J0l+jPXAV8WTMoKn0mv6+lvdhFVFre9OvnRcqR
         c6XK3j+aaeB0LZgH/PnFBeqjimTmO3zjHpITjjDaSOtq2FfItQqgPoNaOHU0Om7sRfwO
         w7Szytenn28nfpzCHT7PLplxIVGyew9m7nFPblLamJ5T0A+vqSV168GpHgk0/3/+iXPF
         /EYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776169792; x=1776774592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJMqO/MtamYrx+eD9k7vgpIEFfxi+YyFS8+euIM3MYs=;
        b=s8o9DAlfBpWwT/IGG93z4Ma5lhI1gK6D1YRlxiFEGJaaJxi8Qu4FB596EibG4A8TyI
         u6V4BlzevlWEvy7cVS+0ThsLPXqxqDmnNoIlrOqtXvzMnXR0vQmbWlMSosAzseJMJWP9
         jIdKoveKvjvm1gbyG0qLKna+wEMawv+0pSwwtznDYv/pPbQhe+f4y2faf0BzKjyKN09Y
         D9/Oi3CQ5a/gkQtUT+dt3z0WLxvxv2adN4++gPpOpQqqRBZhbZdejD8I6NdiS252Z0jS
         s5F77rkFIGWZ7ufUzT5uoUUyqdzu3y3qY1fOAlakeZOCMj9UoB8dnjcSBfjAOj/mfR7W
         UvvA==
X-Forwarded-Encrypted: i=1; AFNElJ/1REJ2gh2FNMH+3KvqabBZaSzwqkibeD7PWBkaz6yjfP0wz20oM5QxtRBIkScTC/qvycg9c83OuBlE2AmTN0HD@lists.infradead.org
X-Gm-Message-State: AOJu0YySY+n34NIpe57rQ4tYYxkzkKATozVI9VNBFFkn6OLmInd+kosc
	qnOZy/zKBZff5KktIyRw3LgWm6Qjv/JQCZyOf10dyJqNPRvUlzJEZnbHss+Q9Wsq4SU=
X-Gm-Gg: AeBDievBy+9QYtuPKD45v8q4vWeJTwm87lCYfetUry7sezb6qnmat2rMOamewfQXmrV
	V7D5E3WcLmArH9qVT+VAbXWiDHLuI48CjMhhJtRujvPsyCtZMpNwHokbb/mphn33teUQWpkpszC
	AZckmpl3ZPvD3jVS2ou6FlVAqKcTENWo1lvO41iGCOC0YT5rJFqF0HRYAmM5TfVPZImmj07ODs3
	1VyxAclZc6JAZ5MdaoebnYy9G3DJtwQDDCXHOOOLmOmKwF+7nWzeS14xMQgI6F07HEohC399WAn
	cPHVfrQHDOF8dDYGMEaJDToZ3YzmRSvSZRm8RAF8rJHw+i+HSbUO4ObweEomr00RoBa/gqBgFou
	udl7T8aFNsxv9Bo5odvYuXSkEky2UP3G0Gb1kodCPqeUV9eXje9D0rI3vTAXbT6k/0dhwBFwnr3
	YULvYEzV8r1I3ej0cX/EtLGQgBBgjBsmRv5lUfHeoSuBENauwa7yMZBKtxQrNUKDqmnZUTuk7Vc
	aUPMbnf1EcR8XWO
X-Received: by 2002:a05:6214:5504:b0:8ac:b46d:8543 with SMTP id 6a1803df08f44-8acb46d8cccmr95904756d6.9.1776169791555;
        Tue, 14 Apr 2026 05:29:51 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ac84cb0474sm121526396d6.40.2026.04.14.05.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 05:29:51 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wCctq-0000000Afc7-2XTs;
	Tue, 14 Apr 2026 09:29:50 -0300
Date: Tue, 14 Apr 2026 09:29:50 -0300
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
Message-ID: <20260414122950.GW3694781@ziepe.ca>
References: <20260413084957.327661-1-sami.mujawar@arm.com>
 <20260413125925.GK3694781@ziepe.ca>
 <514ddb27-137b-4223-84fe-2152737db3a6@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <514ddb27-137b-4223-84fe-2152737db3a6@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_052953_456173_A0241906 
X-CRM114-Status: GOOD (  13.32  )
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

On Tue, Apr 14, 2026 at 11:10:51AM +0100, Suzuki K Poulose wrote:

> > Isn't this also sort of incomplete?  Doesn't anything serious need
> > signed measurements? Isnt't there alot more data that comes out of RMM
> > than just a few measurement registers?
> As mentioned above, this series adds the support for Runtime Extendible
> Measurements (REM in CCA, RTMR on TDX). The RIM+Platform Attestation is
> already provided via the TSM_REPORT

Okay, but what actual use is this?

Extendable measrements with no log
Measurement read back without signature

What is the use case? What do you imagine any userspace will do with
this? Put it in the cover letter.

I don't think the raw rmm calls are sufficiently developed to be
usable directly by userspace. They are less capable than TPM and even
TPM has a lot of software around it to make it useful.

Jason

