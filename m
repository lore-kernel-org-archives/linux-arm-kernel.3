Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACBD606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 14:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YWYiAbcn;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=SPv0wxjd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GikeMcL0RrnlrjkigfHn4bmphngNDtuGpxDpa3/PnB4=; b=YWYiAbcnAH2WtngKZHilBHTV0P
	Yv3XBoecKMwBSINcNsjN+roeMB8hg9dFY7mmggAUZydRzSBE9+U8owniQyfsMCigPDTlyUZguMDLz
	RSwuTaBiMlgpGr3Mey+e08Js1D99zWCLnX62kQ1bweDSxQkhkoN9tHQD5iUCTMQxrtsik7i8uKfsU
	AfWG8PirVxw1LGbvzQ+tDx3DQnJpkvRb0HC3GYyBWqXV/UkF3MH7OcBa3izUFzQrr+Bk1VV2GJHOe
	MilIGz7kSfe0EmvPOvXzl3oof9rEv5h+2+MiaNYy1TZ5QX+Q6svbjIA7RPKD1NL1VrAoS6GNUktFI
	gXLR45Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAx1-00000009xvG-0x9W;
	Tue, 20 Oct 2026 14:36:27 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJAwy-00000009xul-14km
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:36:25 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-5363c8de563so28774061cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 07:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792506983; x=1793111783; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GikeMcL0RrnlrjkigfHn4bmphngNDtuGpxDpa3/PnB4=;
        b=SPv0wxjdzwDeHiL+0yllJTw1zNU6GvY5PGVFQv/2KxJyqXXqe2pWBgtECFS3r1XKLI
         hVSCtyHrIRGIsPK8uHvwzBq3vYsnjfbGc72LaJu00dalZuSgmcS1QINjrfR+H1fgmmmA
         nBBBafvvOSLZHziVTp94e+bcglFiNwYIOYDF9pSareCX1wTAZD2dsq03Cq9XII1s2jX6
         r7MQrK9jWDClcaMroYRTn4PTOOnfYb6Q3fcVbOtd7PVo4rJQCNI18TjmE6rG1n9844/c
         V1YSe+Vwyp8ObXpZ+ALzfbfZ2NJ9XPmJRo8UkZn+X/3K2xGnz9BUe9k1MV1wOaydrFOM
         V2tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506983; x=1793111783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GikeMcL0RrnlrjkigfHn4bmphngNDtuGpxDpa3/PnB4=;
        b=VMdxDMMbZzvqrlWSNvTUtyzeZCubLReD1e3VMAiCSIxMdZTObZsrbpzDqlyfzAAKe0
         aIXz+VQM1UKBQH53aX4+bpPB7v5IbC6gIPohu/ROAUC+8PlvAxqVokRJVUbu+f/+u9a/
         1TyITAgjJQsPRhdY3tHRHCP+gyf139Z3m7l+vjh4hUwzcuqyDpcjcy7odtRJMKPprg8W
         xaedHQUpGNzfB7L5CRmtBV11O7IBF29vRP7lR4JaPWlXYNGECxVy9al5dUI6jexc7CBg
         r+mQaMx2osctSnAaaxWzUqZpFaNlrt2xUx2m1L04SD9xOap5QB9N19+gAVxruf7vVhZ9
         14tw==
X-Forwarded-Encrypted: i=1; AKwUvBzWxIhr6McedlAQTclW3uockht8TtX+c+pGGT8cUlZ8OxdVa5A/z1OcEU0kOAwzItkt+O48iHs9P/AQBT89LCSR@lists.infradead.org
X-Gm-Message-State: AFq9FYIGhClygnT557ncd9Y0JM5LJXw2B100eNaf0Ab7sF8RtDePE+Jg
	2OGCASvnKHMvzkvIx2UkTw6KP1p0xmEWURFprhsrdiQuAXCKe2u9oP7bRxPgUDCrDX9h3ABqJ99
	We+WP
X-Gm-Gg: AYBFou1bTkiN3p/KKz6ZE8rhLNidHlUge1RPrONsPpSNO2xsOSS+6v2+U3aRGRFDWVs
	K/swi6UdndHCJDaT1q6MNHfIKRXZBtMEgs5by9A1GCxCJqjkr1ttVaCtKV19E+tQADafcimcZj6
	T/oTn1k3oQrtk3iCGsfbkrY3nN/Go9eLAJKke5bDhY9DsbWvRH57s63yFdLf02Zn/o1elxJpUec
	es+HULFcGcgXLd56Vrtw3Cx5Q7uy2oYshI2jyGQEDnWI4Y48U49Q3dn/ps7u0mcOHgXaJFYrv3m
	7aos6TcNqU/ND/wj2AqfgJTL6HZuhvFtoPAh00OeSh/paGdneTORQXOf24oV4YE35oaN05rfhvB
	Xh1jbNOL1vYU8/Gy+vYcup3DZgFlAEuoKZ5b1OvY3AgDDu4klXHQKePGSnzeyuA9FLtpcfXOkOI
	lf4QHvn07pBU2Pt1EUlKB4K4YHk0QrPpgjAH/8D6kP84MTPW7Lj/g49EeFVp5CRdz2o+1lP98AQ
	IcdmzYFPaasPg74cNJyBVdFBDQUHVqhLA0wJD9lKCxg8PnRzZseYhjW
X-Received: by 2002:a05:622a:2615:b0:532:e4bc:b80f with SMTP id d75a77b69052e-53646074ce3mr154755381cf.60.1792506982644;
        Tue, 20 Oct 2026 07:36:22 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53636731fcfsm111546931cf.19.2026.10.20.07.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:36:21 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJAwu-0000000CgOq-215N;
	Tue, 20 Oct 2026 11:36:20 -0300
Date: Tue, 20 Oct 2026 11:36:20 -0300
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
Message-ID: <20261020143620.GP14213@ziepe.ca>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019233532.GL14213@ziepe.ca>
 <atcUoSdggT9eU8YE@e129823.arm.com>
 <20261020124536.GM14213@ziepe.ca>
 <atdvnMJuHUJlqX8t@e129823.arm.com>
 <20261020135006.GO14213@ziepe.ca>
 <atd2_9Q2wTv_3MXz@e129823.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atd2_9Q2wTv_3MXz@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_073624_304994_C8161DC8 
X-CRM114-Status: GOOD (  16.11  )
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
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 03:13:19PM +0100, Yeoreum Yun wrote:
> > I wouldn't over complicated it. We already have smccc bus to do this,
> > we don't need layered stacks of busses here. Just change smccc bus to
> > be able to break up the multi-function SMC into several devices.
> 
> I think my explaination was poor. Apologise...
> I'm not saying another bus making but just wrapper of smccc-bus APIs
> for firme specific and definietly, this would separate the
> multi-function SMC to defien each firme device (attestation and IDE).

I don't see that kind of complexity is necessary.. I think it is
better to just have the root smcc bus spawn them 

> But, the *base* is common. and I couldn't find any proper location to
> deploy *common* code unless making arm_firme.

What common code excatly?

There shouldn't be? Getting an attestation is entirely orthogonal to
set link ide, for example?

If you can identify what you think would ever be common that might
help clarifgy what to do..

Jason

