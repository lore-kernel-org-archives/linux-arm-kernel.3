Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B260C44501
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 13:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5HCZAcclosWUynw+gIE6OLmOTVWR8tes+S5wt04CaM8=; b=V4sr3ovD/YHkfK/IQkvIVTIaRf
	Mk7wYWXv5ZUtaPRaqYF3dUV5Dbx5oG8fNpEh+PsIjf58DHh08UI01SbQ5cQ9JtRyywJY2ucCGiEES
	xGduZVf/wbm4I6rii1o5Y6FYqdFm9wiKGyynwSCdLOoXpQZ2I8N0nrE4e6Cc0q3fPy+4wlmeaoHLN
	Kb6VboetylE4AvXFxbri6rp/irlwRHvQ9KLMc8oC0qjZv4bV95wNdmqqqivRmKYpgW1rRTQ47/eMd
	ZCQefNBkilejGthzJSBHNiAR0o7VK3d5Gh4lWHx5k4Z7u7hnHErYxbyBHORwbFSGegDYVFuAAVFgw
	uAUXw1mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFLH-000000096aU-4B44;
	Mon, 13 Jul 2026 12:01:00 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjFLE-000000096Ys-43lp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 12:00:58 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-92ea24a2dbfso228918485a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 05:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783944055; x=1784548855; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5HCZAcclosWUynw+gIE6OLmOTVWR8tes+S5wt04CaM8=;
        b=ipk0Aw3BZoRLObAWQ+f32rf3XFvJMeSBTuIop3vUvGhZFy51J0LxnPwVptXy5uwig0
         q6XsivUChFATpN6yu0eiTr613+VhJXubScg+lGokD6hVw55L+A0XHC/qrEMi75olhyjS
         ZfSMuYvLrSWRmbzUxKBweSJOVXHpZ8xCDDhfBA9ggZgMRAdmUeHyDym0Wh7bnLSLQ60f
         JQGTOVrYNIdTxMtMjeDSPfYpH9L6VuRmX6CIyVD5PtForgsfbu5Fw6+iE6m3BZo+LcW0
         fPbI3CyfDgL++Cytha95QrErkIQwggQvYUPI4KPwfVk8iRuNRkg1zPRazZu8VZfbkOVB
         sE4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944055; x=1784548855;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5HCZAcclosWUynw+gIE6OLmOTVWR8tes+S5wt04CaM8=;
        b=DhgO6flaKVP3fBLayp2o/AQzQ6lIN87F09q9+WqTmXSBwqvvdQQ2wg04a7W5HpHTfE
         tN1vx0HlIr/r6TS+18iTRSOKCLWwvbRwsnYoTWuG4usTK01sngaQOlnNyq5eBuph9J5S
         BMFUQEvfOpASrSyOg6krWQuTNXkdCkI9/uWAawL/wZx7ZA/1Ny9keuBm4qAHemrQSvta
         +69VXoziiGs55HN2p331mdyeHwYEW28MLnTf08/e4Pgg1eUg603emwrbePwR78OceTAz
         brsWkVmiI+HWkp3l3xtNWHSiUY0m2b9ebTzFD6c617U/ZbbYbJ91yv9snrXj7ZbHUkuk
         +cpA==
X-Forwarded-Encrypted: i=1; AHgh+RqexmM0wQCcPDkgF1v1b+a2WxzMwfZqxOj+APAjnYD4n3TdJoggG8Lbc2vXL/NR9UqCdGuyKyQkRIogqs02Uz2G@lists.infradead.org
X-Gm-Message-State: AOJu0YzL+bwvXa5SshzGv3rcCXwes5Oom8TQzWddyObmzSLWzOOcz4eg
	6HzIA8MgcBJHN0pINeD/FPIPX5WlGBaj7qAPCAsCSe8RCWeG8bBqNAf/YqYCIYAKYqk=
X-Gm-Gg: AfdE7ckuEE1FM9KAueVqF5IrhJaO4LwTg/LOqjA6qOcsL8y4wCF4mIzJ3Ytv0PARnhk
	pKbsI4mV1rUQsOnvKqWYxOB92NUorYf+MnYY2lA2n2KEoRoKRnneeyTuUOJH74qJgrEFPEaA4yd
	Ch/lTsUSXc6HUF8U0JgpEYKXHQoPqKetnrt3ooH7tZnE6ghVExxMwykqmI/CH/HOCjaWNT/HnqS
	lLSJIdnUMBeLtKfSm4+JN27A2bPIrVhBntkkHf5RmhzjRw+raXyxsnBC51kv+jN6EUCTuuh1/Yl
	Hd/AqUoqM2mdFnNzsT5iETh+9tNbVKpD87jx/HmfV6trEWiM3igPw5B3RBTrF8uh9OO6lTVLHbH
	8xQRiIaenM1lNt+b4DdzHaCGat66YpLaVTdNOdv4ryEJY6YcdE47W1SQhfK3dF7i+sUYEJuU=
X-Received: by 2002:a05:620a:1712:b0:92e:5612:ba39 with SMTP id af79cd13be357-92ef2cb1651mr868484785a.44.1783944055161;
        Mon, 13 Jul 2026 05:00:55 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5cf9b7dsm1066306685a.23.2026.07.13.05.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:00:54 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wjFLB-0000000Cu4e-38Ps;
	Mon, 13 Jul 2026 09:00:53 -0300
Date: Mon, 13 Jul 2026 09:00:53 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nick Hollinghurst <nick.hollinghurst@raspberrypi.com>
Cc: Daniel Drake <dan@reactivated.net>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/6] iommu/generic_pt: Add Broadcom BCM2712 page table
 format
Message-ID: <20260713120053.GE1835788@ziepe.ca>
References: <20260712-bcm2712-iommu-submit-v1-0-80e10cdde2ea@reactivated.net>
 <20260712-bcm2712-iommu-submit-v1-4-80e10cdde2ea@reactivated.net>
 <CAPhyPA5CqCzsDZg1_Sfr=EP5G6uLnnvDmdd_REZPX_VpwS=VJA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPhyPA5CqCzsDZg1_Sfr=EP5G6uLnnvDmdd_REZPX_VpwS=VJA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_050057_083014_23E0D189 
X-CRM114-Status: GOOD (  16.53  )
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

On Mon, Jul 13, 2026 at 11:02:15AM +0100, Nick Hollinghurst wrote:
> Hi Daniel,
> 
> On Sun, 12 Jul 2026 at 22:19, Daniel Drake <dan@reactivated.net> wrote:
> >
> > The BCM2712 IOMMU implements a 2-level page table format. It is relatively
> > simple, with one unusual aspect: leaf entries can only be installed at
> > Level 0.
> 
> I should admit that a single-level huge page mapping is possible, but
> I was too lazy to implement it (and haven't much tested it).
> 
> It can be done by setting bits 31, 30 and 28 of the top-level entry
> (all other combinations of bits 31, 30 will point to a  next-level
> table). The page number is in 4K units but must be 4MB aligned.

Let's do that instead of the weird full level contiguation page thing
please

Jason

