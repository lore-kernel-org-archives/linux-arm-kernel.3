Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43D7CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 12:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qyrvhlE7ALt0w7ZGlx0St+b9OxdpME7Sw9W+x9BvzqU=; b=fgOROKS4yP7z9Kr5+Q/PnAcR4+
	MR1CodJzyenvh8AXjx8EB4VQ5AYfCJoonPVdWy3+Dr+zNbLD1eueSOSpquYr4ogJKDZCQm5ZDCKHX
	F2nXz78NiVErwQUKWeHJGp1+FCo8HtIiHaknti8mKuOQgl6aiJU8Wme/65e28wHqXSBHp9lwq1S7v
	tUTJn9aoCJMStxizofI85TuOFQmWakUlPeylWNIIKaXKjq8K4M50y58LxJyfQpYTVPut6Hsx7yvKY
	jSn9/UYZC2zWenKWCxlw+2rNWZD/hgVc6IWhiOyjOrJRrJYaKup2kRiqeeuGyYGyHHulMQEkVVDds
	Ao/Xh8iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRr3t-00000001wBe-1kgd;
	Tue, 26 May 2026 12:39:09 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRr3q-00000001wAt-1EHa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 12:39:07 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-8b4000e51fdso119081546d6.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 05:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1779799145; x=1780403945; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qyrvhlE7ALt0w7ZGlx0St+b9OxdpME7Sw9W+x9BvzqU=;
        b=fXNT/ZAJ+eaG+zq3nc4pRizh6XhmDTl39PlwsnM4Irzdrxz94hOQV4DD2xBjMUG7O0
         3j9IBw+Zuc5vAy4wh0qxYRNJ/Ri+STiM6JKT3jOxWBaadme9ywdDp6lDToaOugHSG1Gu
         VXIToFsSeYdvFfZQ0dnoxHyR2riwWBCMRsKhC1u8fsg/YwQO+ilfmD3WUULwrfV0owB8
         oSt7iwk+u35BlLh32yoishRhHiO2u0z6ANpCY3DPfUIPJmXroGw+/ZbfY6geaMO//Lww
         C0huU7IFG0XedZbggKWBsJ61MEgoeJSukgUeS10Nk+yjie105ph+n+556y/ku16k9qlJ
         3bBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799145; x=1780403945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qyrvhlE7ALt0w7ZGlx0St+b9OxdpME7Sw9W+x9BvzqU=;
        b=qW155VLSM32piOC2xJBApCHG6pS+sATqGhs5/v+nXscQSYxqwBSdJBuEhXPWuLLj7D
         cnWuVjIciclVkX+okkgeGEX7unGaNwRhMc98oafUcHPt5xoSrG/vrfu3r2VDappdbyo+
         38vHTLsjGBsN06LQAzPDVFS8WeqUdOG2zlNFZNIaz2Xk7rRXEJDMCQeGTIcaziWGuxLX
         MbcA/n1CyCzII5H01O5jxU0tjMSSEwomABxiEu8t+3KYNS63otH70gRjcwzMai4jSSy8
         C1lsAP29ZGWSwc8rBInnJsO6iByNv/WnfzjZ89fVhagQdKCsOzPN9Cke+jS3rohZX3jW
         vK1g==
X-Forwarded-Encrypted: i=1; AFNElJ9VeQ3UxrGJJcSrjU6u8ySpvPLpD6sFGE2X3zs0XakvOgRlhrQ+IBTv4rr6E+9kTyYcN4z1oCQZ2p5q21zdGxkg@lists.infradead.org
X-Gm-Message-State: AOJu0YyYu805HHxs7R2F0R+VHGiJwy9GFARGWeeK9oPYalLxaAGrz+Ny
	18O1VWfAPs+o6QA8UhlsnsfxStYUONjTAGVY6hp6C+1NKjTLoMBrvoM1Zg2KDszSwic=
X-Gm-Gg: Acq92OFPDs/s/TK/7lf7Me83ATQroUHk4qqm2g99ZcAfAruKt4E0lQXHpnQdnAxWaCb
	9VzCyQffredGUwwuWbqWvvL57YdruehtSigSh2yiVn6UuNB4ryBdDtjiHGfyU6aWZjRQ9dWskHy
	CazSDvZqwsNYXgMQwNhYTXM9RjVmGEwq6eOLwLqXhjOiDZmhzaafuDk2HUZ19PFdX1cVT3iq3b9
	h8xFZUx/+eu7Rt7up6W/bOgYNG87QvHy6wBsi4Ln4IgDVj8+XSmdOOTJywcqVPAU94rRp8EhD4b
	cHccytJCe2A3R+dhJABikNiTJCEHGXnW48MvdpmMuBhPDhxyrZH/7IWsdoK3eAORzOHWo2Fjzvx
	xwmUp72O2P9mqbHct6ZkULNa/n4y6n7kQAsAn4JF+q9ktv0wyKhlSrC9ZlTShDSgiqZwKj0G5bE
	U/BK9v132+vX/SLySuxIU0PCl4Exz/d+LTihHhtv7OrP1nMgiT4aAwLMsBb2/X0qW8EpLREToX2
	C9NvA==
X-Received: by 2002:a05:6214:262e:b0:8ca:ee3:6e99 with SMTP id 6a1803df08f44-8cc7b6a504amr305513016d6.44.1779799144630;
        Tue, 26 May 2026 05:39:04 -0700 (PDT)
Received: from ziepe.ca (crbknf0213w-47-54-130-67.pppoe-dynamic.high-speed.nl.bellaliant.net. [47.54.130.67])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc8130a1a3sm139020606d6.37.2026.05.26.05.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 05:39:04 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wRr3n-0000000DPQA-2CBd;
	Tue, 26 May 2026 09:39:03 -0300
Date: Tue, 26 May 2026 09:39:03 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Joonwon Kang <joonwonkang@google.com>
Cc: kevin.tian@intel.com, Alexander.Grest@microsoft.com,
	alexander.shishkin@linux.intel.com, amhetre@nvidia.com,
	baolu.lu@linux.intel.com, bp@alien8.de, dave.hansen@linux.intel.com,
	easwar.hariharan@linux.microsoft.com, hpa@zytor.com,
	iommu@lists.linux.dev, jacob.jun.pan@linux.intel.com,
	joro@8bytes.org, jpb@kernel.org, kas@kernel.org, kees@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mingo@redhat.com, nicolinc@nvidia.com, peterz@infradead.org,
	praan@google.com, robin.murphy@arm.com, ryasuoka@redhat.com,
	smostafa@google.com, sohil.mehta@intel.com, tglx@kernel.org,
	will@kernel.org, x86@kernel.org, xin@zytor.com
Subject: Re: [PATCH v2] iommu: Allow device driver to use its own PASID space
 for SVA
Message-ID: <20260526123903.GF2487554@ziepe.ca>
References: <DM6PR11MB3690699A3178F1559D4BE1CA8C0B2@DM6PR11MB3690.namprd11.prod.outlook.com>
 <20260526123606.2488278-1-joonwonkang@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526123606.2488278-1-joonwonkang@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_053906_443456_FC518BCB 
X-CRM114-Status: GOOD (  27.15  )
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

On Tue, May 26, 2026 at 12:36:06PM +0000, Joonwon Kang wrote:
> > > From: Joonwon Kang <joonwonkang@google.com>
> > > Sent: Tuesday, May 26, 2026 2:58 PM
> > > 
> > > > On Mon, May 25, 2026 at 03:29:24PM +0000, Joonwon Kang wrote:
> > > >
> > > > > Currently, the only known expected user of the new kAPI is our team.
> > > Since
> > > > > I test if the patch resolves our problem before sending it, I believe it
> > > > > should be good enough. Do you mean more than our team by
> > > "accompanied
> > > > > users"?
> > > >
> > > > He means you cannot send patches like this that only serve OOT drivers
> > > > to the mainline kernel.
> > > 
> > > Hmm, it gets back to the chicken-and-egg problem. So, do you recommend
> > > deferring the patch submission until we find a new in-tree user of the
> > > new kAPI? I believe we will not make our module in-tree anytime soon.
> > > Or, is it like I still can send the patch and get it reviewed although we
> > > cannot merge it to the mainline?
> > > 
> > 
> > It's not chicken-and-egg problem. Just always send them together.
> > 
> > so let's wait until your module is ready for in-tree review...
> 
> Since adding a new kAPI has this limitation, what do you think about the
> idea of adding a new boot parameter to enforce disabling ENQCMD at EL0 and
> using the non-global PASID space in that case? This way, I guess we could
> resolve our issue without having to wait until we have new in-tree users.
> Do you think it should have the same limitation?

No, you can't hack up the kernel for OOT drivers.

Jason

