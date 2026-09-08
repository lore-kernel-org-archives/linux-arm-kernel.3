Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B779C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 12:43:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KO3kIc1VAMjPhAEaclJXkC8aa4/+237lrdumobzVsjA=; b=486TjFZJtSYDFTXvJEOVBjCPyn
	WfXmX38VEk7hbGyP56VHa5NzPwWARZTXRjFd8cZZCtmbgOq1aYfpwml3Q51oWEiDTJ1Smocc4Pea0
	UAukaSrutODyNzFfe7KFQQu+CE4sV1nbQL+yRN4MwLuxwdlF0er7OZb8uO6VO63B9UIcwYGPL151t
	ca3bdG0sukhMI6M7PSD9akq5eQhQMthC/mBPg45wHcZbTTKzqKdswMZ1jruWW02gFGuAx35A3X1mZ
	wO+I89AVDxha/dLbk6++rz4eonVxS/di/1mZfTOG5urvbOSRqb+Y/kL1WL+M0gcWOS3YCHVxcY1Dk
	SoeVfG8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3v9z-00000009325-3M9D;
	Tue, 08 Sep 2026 12:42:47 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3v9y-0000000931C-12ts
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 12:42:47 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-90ccb6102a1so35916656d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 05:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1788871365; x=1789476165; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO3kIc1VAMjPhAEaclJXkC8aa4/+237lrdumobzVsjA=;
        b=aPgDyhpmyqytXzxlqoaIsctMQec9SzTp9DSUVvIe0pvvBEtklzQIQKkcr5wOVli4sh
         mIBfm4TzoEXPPj9Hib+sY3FjLxSmFicukOTkCaNQ6hJAJLO5gba94FV5nAtTErv//Lz4
         AnOGvzkG0sfllMYEOmlqWXgovSDLSNW0qJTcnlpZC8tMBprS+odKsty+XV4SjuWYlwWW
         bny3oKVXoMnamIxl8wlyJkae8AGSVt/Aqa3pPh2uFci1PGjQDxlohf+1fZvtlPBPOUeP
         neA2oh58V8152LdhvMWShMshCgEwG0aR9Pf9c8YZMHjOLQYypMxMJa+hfjXADTnz6RA0
         wUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788871365; x=1789476165;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KO3kIc1VAMjPhAEaclJXkC8aa4/+237lrdumobzVsjA=;
        b=HH+gL2N77oHDbhD4TITg2mm8F0QJFj16vbjECO0ZwJCshk0+hLKqYMHPR57mR1NZ0u
         +THDrS0L9f7oeEqehXbX0YLAtRAijJ1bRA8DQpsz36L0PcLryPmDB5o+Z+M++89ctQxc
         ewVP1GxggUFYMJyHE/r3SDetpUZ3kRq0RtaFFcnCformPcdDTlXMiENz/l+zgWMTWXH1
         MI1lzcLrUBbdHtj2EtyMwER2LFP8Q4ZFIUB2tHY80e5SnZRwjwFyrXk0Eu+Ku6CjDz3p
         8uOsGTuiTBRXlMCUA27iSb1y803xZMOHLxo9/iopgXInHC43qmEz1fPYHc7zLHSOlSfv
         O1PA==
X-Forwarded-Encrypted: i=1; AKwUvBxE2+nYeN2BUUgCNHOJJHV9UxKsbd0KjHsxz0TbX1CAGVwCr5NzyIz3uiLlNuvJEhdDBapVqtd00MsN56dDI9+a@lists.infradead.org
X-Gm-Message-State: AFuF++luFySbzBlo/9YJ2kwAgjFRWqXYaPRJEa1xt63Wa0T6jTLfjLEP
	WYRKaiCAyhFbE0oey9w8I8zfCTxxih5aOFj5wbeyWtoAjuhBXG03OKQmYYR85hO4Sso=
X-Gm-Gg: AYBFou3clSgz8C3zuwyykmHd8qiHlPbhXZhPR1W7QaGfKYWx9xPRImC8XtD3Q+Tu51U
	XjxBF8R9JkJDqCj3J3zut7Lze/ABU6GPXGZleUw4b66AeXdu6Kyq4P6FVoek1PpPpeCgE57B6sr
	Ydp1Il8S56MPojumijECvvFBfckDm7YFR+qZsehp8lmnA7pfYsKy5+j64JxK8dOm1X9SPv0El2u
	VWfzaLm4zKXhGxB1wEKiURelZJQizUxg3HSa3rcjHnbvoppBxdrac8unlqJnd7o0+tntfZpvmjr
	GF9NlI6qPNrzTjpAZWrOoP/6WOa5GnPe8O38uPBtFXc8lsgYCcu9+xVyoOpdzgJOYnpLIOY+Lz5
	2IVCGxEKtnLTfTtGXrWAeBnGAT4u/L2PW6Xiahd7SvcdBKMei8tzgMLA33GIaqu6ZokwOTBLAG4
	UwXiwVASr+SjnXk1UstWVIjfwU60J2HF11HkDZrKHsG+Uc3ksQfU5dXQq0guJRZ0Ezjcw41Kx52
	qqxVMpkHuH8WxXYk4EaeRDfJw3mkBqhOL3BCDiOWLlTxw==
X-Received: by 2002:a05:620a:a108:b0:91c:c20b:a135 with SMTP id af79cd13be357-939804af44amr2957913285a.40.1788871364777;
        Tue, 08 Sep 2026 05:42:44 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-910406b0f51sm115856516d6.42.2026.09.08.05.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 05:42:44 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1x3v9v-0000000Dgue-1sWF;
	Tue, 08 Sep 2026 09:42:43 -0300
Date: Tue, 8 Sep 2026 09:42:43 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, jpb@kernel.org,
	will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
	nicolinc@nvidia.com, praan@google.com
Subject: Re: [PATCH] iommu/arm-smmu-v3-sva: Relax ASID requirements
Message-ID: <20260908124243.GB2543240@ziepe.ca>
References: <20260907154928.4012151-1-smostafa@google.com>
 <20260907184513.GA2543240@ziepe.ca>
 <ap_JokRTsUHtF4dN@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ap_JokRTsUHtF4dN@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_054246_351782_327E3D9D 
X-CRM114-Status: GOOD (  24.57  )
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

On Tue, Sep 08, 2026 at 08:38:58AM +0000, Mostafa Saleh wrote:
> On Mon, Sep 07, 2026 at 03:45:13PM -0300, Jason Gunthorpe wrote:
> > On Mon, Sep 07, 2026 at 03:49:28PM +0000, Mostafa Saleh wrote:
> > > arm_smmu_sva_supported() have some residual checks for ASID from the
> > > original commit d744f9e6c222 ("iommu/arm-smmu-v3: Check for SVA features")
> > > 
> > > As DVM was used for TLB invalidation and the ASID of the domain was shared
> > > with the CPU process.
> > > 
> > > However, the commit
> > > d38c28dbefee ("iommu/arm-smmu-v3: Put the SVA mmu notifier in the smmu_domain")
> > > removed that support.
> > > 
> > > So matching the SMMU ASID space to the CPU is unnecessary and can be
> > > relaxed.
> > > 
> > > Remove the CPU ASID related code, and update the print for the SMMUv3.
> > 
> > It is OK, but maybe this could also be but under an if
> > ARM_SMMU_FEAT_BTM?  That is never enabled and is a placeholder to for
> > eventual BTM support.
> 
> Yes, otherwise SMMUs with BTM would regress in the future.
> But I’d assume non-BTM SMMUs will still be supported; falling back
> to SW invalidation?

Yeah, there is no idea to make BTM mandatory, just some people who
built BTM into their HW would like to use it because it maybe performs
better.

So the thought was if the HW supports it then Linux would turn it on
automatically for SVA.

I think we can land "vBTM" support upstream which does not require
solving the ASID problem since in a VM there would be no S2 at all.

The main issue was renumbering the ASIDs of already active
domains. Prior to the invs list this could not be done correctly
without races. Now that we can invalidate the same domain multiple
times in the invs list it can be done race free.

But, I don't have any BTM HW.

Jason

