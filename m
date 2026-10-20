Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C557A606AB01
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 13:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PMuC7K6t;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=kpms2rzl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L4U5UYLlAya7jsMhIje74k036UH7Y9HqJ+sW7JwcvH0=; b=PMuC7K6tIEMrw/MlNQmIvfX3+2
	5lCK+EqNt7odZ/zC+h4WvqvzYgCJ4hCDCLxTYMUMSw1ngM0k1PsyNpBNYLnIi8wXXIUErx8YWTKKI
	czKvKsFvIRCyzBKSqQHOU/vQqP2HWLt2JRLHbsEgzKgGi+EdbVQlyY+NCdJe93e+jFxDae8+M5GkG
	ctrBWBtTb421vw2umxE249JYBdeQHPls04h+iEhSytvhnfKRx36Xy4zLESiUsnxd6higodxDj91mZ
	XgjcgsC0O/toAy8zWlh8e68vRxWEGts+8DVq/940DMcMaooEdsoakIcdalBSML7mwQscOkEj3cQRU
	tmLro9nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAEH-00000009pcr-1qYF;
	Tue, 20 Oct 2026 13:50:13 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAEE-00000009pc5-2YV7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 13:50:12 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-93efc0452b5so209266085a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 06:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792504209; x=1793109009; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L4U5UYLlAya7jsMhIje74k036UH7Y9HqJ+sW7JwcvH0=;
        b=kpms2rzlFXD1Khz6pFQT99sUGFRubPh0bMW6ISW2Yz68Z4Mg8sb9EJnSt/Y3l3m5a8
         hgGEylsVU9C9or9OSzYyJo01bfXGEBdAREEvao1M0e45UdP4mHibY7IpppiJay/GP0Sr
         o6d+Xjzxt8LJuno5jerBGcjsW5s71U7wxO3AMXeBg9o078BXSo58VeKWgqIKIkIW3Ysf
         HXxlBCNGn4woZiphRJnvEfb+MAbWNUaYTmd/rorBowwKs2gz557Q+xNQSSZNSAO2boxD
         WODhD02szg1oZFn8lCFDIHjlY/NBOrD+ASvw5X0uUwq4ODFa3t7Mngky5guJEqYEKyhg
         K6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504209; x=1793109009;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L4U5UYLlAya7jsMhIje74k036UH7Y9HqJ+sW7JwcvH0=;
        b=1qX1/FMxPP3WmFrDxB/HJ98m20BGL6zNd3j2RUJK1sqXUuJSuiodgL0VvwaRJZWfYM
         aYDPXcAdMClXIvOQc8OvXaeJxI4gldJff7HCjmrqKDlUwOHQE5GRf6n3oQSljV4a9bi4
         yio5yDUBJXF9OhWX8k2Pel1pSeUIgYcAbBjpIS7Ve1Z6aY6vNGC3GOpbLEPDQ49MrAJs
         tYWzkQv9ANgK4x4PYJrvaF2HFiZNapR0JUCKrbEDRhGzjvHB3A1MFbfcktyYQCdVcRtw
         MNe2PuGwLloCsw9Q+Ikfk3Umc1bFX6FMZe2QSykQH4XRE9DjKdbPvcKWNjAy3E0SlRDl
         ePjw==
X-Forwarded-Encrypted: i=1; AKwUvBxVWQo134Ipo8kqqucmYh7FPrvXS91KLiccz/PLW7a2AtcD+C2/zLvwpmvm0QhdlMjhotRg+Lh9mPktmHninKpk@lists.infradead.org
X-Gm-Message-State: AFq9FYJ2uHcudSTyi8NOyj52lkVbf0EVsxDxPtZTRSr922qtbis6+IJS
	4sgN1Y5eUFAA0i0o5Jrr6FmtQ3dCxk5cQNM/KGfzuIyTHylTapXpQOQd6DiQzmjuiZg=
X-Gm-Gg: AYBFou1H5TArn5SexdeIxdaRVJE++DSCWXenIgMA3TWm4sdvkv1sFWq3fdr+0M/7tfn
	YHz1VpbIR3apLinOWD+2z1UKKw5YAbrRDg/zZMT0eqtMMaW5oGhVlXILRUqhAOnzOEVjxe85V7u
	M06h9WxPG6EbmtgXPuzb1c/ff4fXII/AW8cD+WxyrnjBrDk7pVdqiXcOIqx8b/gpNYVxpBFF727
	Z95c7q8oKWfUd+qriIF1unpsThDtCYJu5EXA7lOX9y6RxWJbtk6uohb+/4pyNh7CkeyYly77E3l
	I//Hb15Uhr5d1so/K6ir8JzFbXR9H+8uE+AED6Yc1PfubxbUl84Z89xsWu+Nl2Fm5668ZpsRioe
	32K4hzTCzubLT4h2YRnayWCjR3VmwSouXCHcvcU0w/CcGtlRotFtrpjr0mySLzbjvRsHwIP2fXb
	ssh36t/fFbq4QpyWp+tccuMZeEhJROQ6iV5ZH50rWV/io3EDN9VTNaNnPThI6gscJqY/b5gm90/
	ozHMwa5nCucXEO2njU9Y0tUPFwZtb6yJ6G5cKWWnzw7JS8eK+6h6Hva
X-Received: by 2002:a05:620a:4689:b0:93f:3646:7a5e with SMTP id af79cd13be357-93f3646a313mr1474410885a.64.1792504209082;
        Tue, 20 Oct 2026 06:50:09 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f4b082ec5sm224944885a.20.2026.10.20.06.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:50:07 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJAEA-0000000CabA-1he9;
	Tue, 20 Oct 2026 10:50:06 -0300
Date: Tue, 20 Oct 2026 10:50:06 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH RFC 0/3] firmware: arm_firme: introduce FIRME support for
 host attestation
Message-ID: <20261020135006.GO14213@ziepe.ca>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019233532.GL14213@ziepe.ca>
 <atcUoSdggT9eU8YE@e129823.arm.com>
 <20261020124536.GM14213@ziepe.ca>
 <atdvnMJuHUJlqX8t@e129823.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atdvnMJuHUJlqX8t@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_065010_660214_339DBE58 
X-CRM114-Status: GOOD (  35.70  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 02:41:48PM +0100, Yeoreum Yun wrote:
> > On Tue, Oct 20, 2026 at 08:13:37AM +0100, Yeoreum Yun wrote:
> > 
> > > > Also this is weirdly structured, it should just be one driver under
> > > > drivers/attestation/ that does the measurement register part of firme,
> > > 
> > > JFYI, FIRME's platform attestation token doesn't have the measurement
> > > register. ploatform attestation token will include the firmware
> > > information (e.g. firmware hash) and verifier checks the firmware
> > > information. the meaurement with RIM/REM will be part of Realm token.
> > > FIRME's PAT is for host attestation and doesn't include Realm token.
> > > 
> > > Therefore, in the new UAPI, attestation only have the evidance
> > > interface and MR interface wouldn't be used by making mr_cap as NULL.
> > 
> > I'm aware, and this may change.
> 
> Yeap. but current, it's enough with evidance.
> 
> > 
> > > > it shouldn't have two components and some weird firme_get_instance()
> > > > thing to link them together. That isn't how to build HW drivers in
> > > > Linux..
> > > > 
> > > > Since ARM has bundled different concepts together into one SMCC FID
> > > > range, it probably make sense for the smccc_devices to somehow spawn
> > > > multiple smccc_devices for the various internal software aspects
> > > > rather than have one driver spawn aux devices to split it ..
> > > 
> > > If FIRME were intended solely for attestation, I think your suggestion
> > > would make sense.
> > 
> > The FID are largely orthogonal, AFAICT there is no shared
> > infrastructure between the various functional blocks.
> > 
> > SO it needs to be split into proper narrow drives in the eventual
> > kernel implementation. token goes to attestation, link ide goes to
> > tsm, and so on.
> > 
> > > However, considering that FIRME may be extended to support other services,
> > > such as IKE key management, I think having FIRME-related code scattered
> > > across different subsystems would actually make things more complicated.
> > 
> > Nope, it is the right thing to do from a kernel perspective. We always
> > de-agregate these kinds of multi-function devices into proper
> > per-subsystem driver.s
> >  
> > > I initially considered introducing a dedicated FIRME bus as well,
> > > but I felt that would be overengineering.
> > 
> > Nope, just use the smccc bus and split up the 'multi-function FID'
> > there. It doesn't need to be over complicated.
> 
> Then, I think the arm_firme layer could simply wrap smccc_driver and
> smccc_device, with an extensible base interface shared across services.

I wouldn't over complicated it. We already have smccc bus to do this,
we don't need layered stacks of busses here. Just change smccc bus to
be able to break up the multi-function SMC into several devices.

> Would it be better to post based on Jiri's branch [0] for next-spin?
> 
> Thanks for your comments! :)
> 
> Link: [0] https://github.com/jpirko/linux_mlxsw/tree/wip_attestation_pre_rfc_draft1

Lets give it a few weeks?

I'm confident both of your attestation drivers will go ahead at the
fastest possible speed once we get the subsystem settled :)

Jason

