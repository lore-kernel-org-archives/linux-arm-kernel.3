Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1846FCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 16:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H0xSjr3/s1klHevj+Rk+NoDkA/+B2Ij31Shj5ijEvbc=; b=TTiKXJuw8UnPmtAhZuQw4fVTLJ
	umRgyOR5eILQlwPmfdL0D58i7yue63ld2I15zLDgfK2zYgQvmzSkZYEXU+HSFUf/NHbsbArhcGsjL
	dZeI7Q6ikSpjnqAZG3NePHjqFKZmBXugdSJB9yWQiTUhnxoYtZgnbZ1DPzbcLF4Fx8q7XQtreY+UR
	YfmL99DybRsdTFFUPriLJlIxojb/3UDzrapkGKTYCgkJu2tzcy8i5/f6a71KXyj/CKEPC4VQ7MRkW
	4GmcL1lOiAy/WzbOy/iy3l7fPEVMA/yX0ZQOxttbYryQKaBZe37Z0t0oEqLvEmpm027KXUIG1NOdz
	SH2ONj9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUomb-0000000FXal-3nl5;
	Wed, 03 Jun 2026 16:49:33 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUomX-0000000FXaG-3BNF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 16:49:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780505366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H0xSjr3/s1klHevj+Rk+NoDkA/+B2Ij31Shj5ijEvbc=;
	b=Qvo9g6W/QKPZhv7cBenQWJPZvlPCI2mQe4J6ezR9yRs3FDuw6isjGrxqKN3sZ5wexnpFyi
	xrJpy2i6dKFbJCCxISBPnnvelwVGyXklX0W98APxAsVUk+XJ5iKHDwqOEa05Gls3vBRaBZ
	VF3gCH5nBBMwJuoQHElfrizXWxN7At8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-CbfbPxjROvKIhQe4UBsk1w-1; Wed, 03 Jun 2026 12:49:25 -0400
X-MC-Unique: CbfbPxjROvKIhQe4UBsk1w-1
X-Mimecast-MFC-AGG-ID: CbfbPxjROvKIhQe4UBsk1w_1780505365
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-914f037b7dfso1825699285a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 09:49:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780505365; x=1781110165;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=H0xSjr3/s1klHevj+Rk+NoDkA/+B2Ij31Shj5ijEvbc=;
        b=DAYFDk7Z/oxGNImT/hSiYl0Y8y9KMMiNpcbAU5NUGjDUvfY92aNZoydWyIxqysvo9G
         OUWmzze3jPfY53d9l6ZuxCsb/0ay+C6bhF0xffJDHavmq54hfGlR9EgiX7HOuiwPwnI3
         Ma+wcL/nk7VQ3El/kwCr+iYeT67fuKp5U3UbILh2GnwLgLu/BYgjOPCmz5efwGW8FvIV
         Ii1UJh200q+2o5emFFxsbtPwk7lohYT6BGhLtLchILuo20u4jmyo1nc+oRMqeeRjIoCN
         OtPMjoNuB/CAP3UqZ1IO8mG7rgIZOGAuBadMKFmx6lrxQ2ExfUB2mAa+svfTWW+vs5Wq
         D/uw==
X-Forwarded-Encrypted: i=1; AFNElJ+HvwdUy8yVycYwwu4GYC4eCW2rnflsCa2Wq8+4Tx9G/GgCSsOufEPE21jUnbt1jrt3KZ2Hc13Y0S9SZ0FSMvgY@lists.infradead.org
X-Gm-Message-State: AOJu0YxcM7rHTiIrbve9ynVgzGCI+nq1LIsxzWWFDIcJAcQaudbeeL5h
	sys2xZY3eic+v/OuRcj5Z8c3Jucc6X37XmnsonhJBRULjX7xj0YZc+1bBe7j5HU/pltjkFmS2eM
	GSZ5ahPypQwrvxMSWTjvoh9fipIg9YK57IZn6fctsqMK8xDLLH0mxlHIym6i3t44yO3D99weBfj
	gXdYI24wSX
X-Gm-Gg: Acq92OEaBaXQuYe8QVcis1/xHbHi9uBEYZQjOV6doIydolrZOvc2EwVd+MS/21X8/dG
	uyG7RDqsyNdSjv7WeVzwyS8VlglWZbkIgyNr3xUDMDYR8uxTdcYbm+8oyGQ+QpieO6CVBO+cxds
	oWN4Gl/TFQDBUnSBq3BTVnhJscCb0DrG7GDMOJMknDdizQlElNAlI/ygEi5FU1E5dq4+5RJfPei
	OREAlFoX0joegtHfSNg88DcKEkKxGJxgu0vaEzf6dEyvOqFfJ+OOOh/3AzHMh0TDRrLfYipU9Yo
	akSBtDIFEUYBP+RdxxJABEMGUpbpYHkEdev8aOWGc5Yd+/V6o4C6PlUfew5AvFMfxe2ltOWn5K0
	6HRbmjFOf3YLuwWtwF354w369kg==
X-Received: by 2002:a05:620a:294b:b0:914:c8aa:34ea with SMTP id af79cd13be357-9158a83cd2emr683498885a.56.1780505364650;
        Wed, 03 Jun 2026 09:49:24 -0700 (PDT)
X-Received: by 2002:a05:620a:294b:b0:914:c8aa:34ea with SMTP id af79cd13be357-9158a83cd2emr683478185a.56.1780505362817;
        Wed, 03 Jun 2026 09:49:22 -0700 (PDT)
Received: from redhat.com ([23.25.77.22])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9158a37c50bsm294228485a.24.2026.06.03.09.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 09:49:22 -0700 (PDT)
Date: Wed, 3 Jun 2026 12:49:19 -0400
From: Brian Masney <bmasney@redhat.com>
To: Nishanth Menon <nm@ti.com>
Cc: Stephen Boyd <sboyd@kernel.org>, a-christidis@ti.com,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, Michael Walle <mwalle@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>, Randolph Sapp <rs@ti.com>
Subject: Re: [PATCH v2] clk: keystone: don't cache clock rate
Message-ID: <aiBbD2Y6s-1NKnhT@redhat.com>
References: <20260507-clk-sci-v2-1-38f59b48777a@ti.com>
 <agHpYnkCgGfZp2-E@redhat.com>
 <20260512104848.4axgjeto6i7ejvli@retorted>
 <agM-VB-ToGFNphfu@redhat.com>
 <20260512171604.5ntgq65bmedb7jpc@stinger>
 <20260603160034.fbemt5n6pqyrmwke@strode>
MIME-Version: 1.0
In-Reply-To: <20260603160034.fbemt5n6pqyrmwke@strode>
User-Agent: Mutt/2.3.1 (2026-03-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yJ89kPbfL2LHpuVLQg75ApKb9NiFJRw_E_FMwnh8v8w_1780505365
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_094929_878381_D88B9DE3 
X-CRM114-Status: GOOD (  22.92  )
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

Hi Nishanth,

On Wed, Jun 03, 2026 at 11:00:34AM -0500, Nishanth Menon wrote:
> On 12:16-20260512, Nishanth Menon wrote:
> > On 10:51-20260512, Brian Masney wrote:
> > > > Could you clarify if I need to take it via my tree to arnd or if this
> > > > patch will go via the clk tree?
> > > 
> > > Sorry, I'm not sure what Stephen prefers here. An argument could be made
> > > for either approach. I would just go with whatever you have done in the
> > > past.
> > 
> > Thanks Brian for the review.
> > 
> > This usually will go via Stephen. Will wait, just trying to make sure
> > there is no change in expectations (given this patch missed a window).
> > 
> 
> Stephen, I'd like to clarify: would you pick this patch up directly,
> or would like me to send you a PR after collecting sci_clk patches? I am
> OK with either, would prefer to not have wrong expectations.
> 
> I see two patches pending to be queued:
> * this one
> * https://lore.kernel.org/linux-arm-kernel/20260512110028.2999471-1-nm@ti.com/

Since Stephen hasn't replied yet, I would just include it in your pull
to him to make sure it gets in.

If he has an issue, then it will be straight forward to make a v2 pull
without this patch.

Brian


