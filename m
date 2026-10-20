Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A745606A319
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lh9/8PSv;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=Flm2RA8p
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tszaJSkqKNg/gD6sLTsFGX7FDn5XDitEJB0LfKIiqEg=; b=lh9/8PSvbteSWAJSRateOnAR4J
	OjvpUQ4JFaEWJ2vw5JFkjDng/R22MZiIHgUfzoQlJb0mrBycB7R6rE+Z3RruSDDfY12C91plcg0eu
	jpaX+wTu9cvUF9XvNJ2JnIRFC3FFRKu8Y4/6tyYnadqVRSrAyXeNgaFY1XP28GFwcAZNIR1Q1+AIK
	cu9+Nk7zja3MqCbk2cADth52So4U1YGyzwFkW1i8B0immVj3HeyS0cKS7NbIgMhiTHbmC4fQKHa2J
	VLM7QtgH9PWgIc0rF2XX/aX8mSwcZQpHnSyAcaoivlM1NjumMY2abRImVoegz1u9Ggsh69eJ44Bt1
	2yIhitKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJB4H-00000009ykr-1mPZ;
	Tue, 20 Oct 2026 14:43:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJB4F-00000009yk9-1Q5Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 14:43:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6DA5C2103;
	Tue, 20 Oct 2026 07:43:48 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA1943F7D8;
	Tue, 20 Oct 2026 07:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792507431; bh=ai4CxfHeJGRIqDqehiHXoYeWahRJlQGznfMvaCHUgDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Flm2RA8pFqaKopRDXQeefae7/VimisOEoCJEbluSS7T0/WgQQcubrPzP/h3Yw9KEL
	 5q1JvjnnsBBEg6nJtiSbWugJId8gxKKYKAvHk7SYJ0oTT077wcke/d3oArCP654MkW
	 Y6jPeUkZtobPsJudSRBSP9WRwTZy7YhpEw/5LZFY=
Date: Tue, 20 Oct 2026 15:43:47 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH RFC 0/3] firmware: arm_firme: introduce FIRME support for
 host attestation
Message-ID: <atd-I059nHAwcZFE@e129823.arm.com>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019233532.GL14213@ziepe.ca>
 <atcUoSdggT9eU8YE@e129823.arm.com>
 <20261020124536.GM14213@ziepe.ca>
 <atdvnMJuHUJlqX8t@e129823.arm.com>
 <20261020135006.GO14213@ziepe.ca>
 <atd2_9Q2wTv_3MXz@e129823.arm.com>
 <20261020143620.GP14213@ziepe.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020143620.GP14213@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_074355_417354_4717ECDB 
X-CRM114-Status: GOOD (  22.82  )
X-Spam-Score: -4.4 (----)
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

On Tue, Oct 20, 2026 at 11:36:20AM -0300, Jason Gunthorpe wrote:
> On Tue, Oct 20, 2026 at 03:13:19PM +0100, Yeoreum Yun wrote:
> > > I wouldn't over complicated it. We already have smccc bus to do this,
> > > we don't need layered stacks of busses here. Just change smccc bus to
> > > be able to break up the multi-function SMC into several devices.
> > 
> > I think my explaination was poor. Apologise...
> > I'm not saying another bus making but just wrapper of smccc-bus APIs
> > for firme specific and definietly, this would separate the
> > multi-function SMC to defien each firme device (attestation and IDE).
> 
> I don't see that kind of complexity is necessary.. I think it is
> better to just have the root smcc bus spawn them 
> 
> > But, the *base* is common. and I couldn't find any proper location to
> > deploy *common* code unless making arm_firme.
> 
> What common code excatly?
> 
> There shouldn't be? Getting an attestation is entirely orthogonal to
> set link ide, for example?
> 
> If you can identify what you think would ever be common that might
> help clarifgy what to do..

I mean the BASE service of firme and typical example is shared buffer
allocation. I agree IDE and attestaion service are orthogonal. but
in case of base-service is not. it could be used for both service.

Therefore, the firme_device wouldn't export all functions. In case of
attestaion, it's enough to export base-service and attestation-service
only. for the IDE, base-service and ide-service via union.

Also We don't need to export base-service firme device as part of smccc
device. It's enough to export two devices -- attestation and IDE via
base_ops. But, to share the base-service opeerations to both devices,
I think it would be better to have current arm_fimre layer.

-- 
Sincerely,
Yeoreum Yun

