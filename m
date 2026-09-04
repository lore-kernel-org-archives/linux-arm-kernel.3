Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C24CC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 05:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yB4YVspeMwk5ODtt2RBRRIPWz9juTE1sf3B03/H5mtM=; b=2mg/DFBRBEy0jE6IjVQsK0EHl1
	qmYkbpsnklCfQAKHuBcK5JiEQUFdSLsqLxAcEdIqmgh/dseQ1yKozjVora44zWlFHy/a1cqtjpWSZ
	oZAul2cb99havcYFuMSJ86mvaTiqUkwzOWcjv0BiukrGBTsoHc9tT+PETfhYx+WcqjL15vp+H19FS
	gVYzhi1Ay0nsrjx2pQCqvzJxjEX0BXOPo6LnB8/WXWzDHtqcPlQ6q1tzqdcE/Qqlhf7HiTdwaNPsA
	ThaW9j1KRWRdWhl1lEjR8bJGccMgrTc0b5jBMWP9XEGHfAQem8DnBbTMtxKKRenRUddYc70gpkjch
	6Y8BpR+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Moh-000000015KJ-41aI;
	Fri, 04 Sep 2026 05:50:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Mog-000000015K8-1FEs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 05:50:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 941104389B;
	Fri,  4 Sep 2026 05:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A7301F00A3D;
	Fri,  4 Sep 2026 05:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788501021;
	bh=yB4YVspeMwk5ODtt2RBRRIPWz9juTE1sf3B03/H5mtM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=XtJFt5QFVxE1zso0J5EkYlk8qd97baPmE6jweS96sWdeGCMMMbvFLsYx+3j+JsOS9
	 9BOMeWFyxqIbFnrrq4qeenzwt7dOnYolWd6oMywsGmmUC3k+bbIhXK1FW8jKxhjMQ5
	 WEciqsGrP9CozS/IhTb92INUxZvzsnUsj9KlkTaTzH2ijGNjURdQ0GsYkdwHuwqKYT
	 9XcJ/BtjZWpAegLhbu2RXjylkAFswPlcxOvrGlKRonkkCl5JIl96S9xHajuq8cRqir
	 dN3/ogc6Dgt03dUnL6j3z4upeJ7/4YlN6oAyoenbVn09NizgTmss/E3KCf3V/ivN9v
	 v5W6sOXwH0cPQ==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>,
	Sudeep Holla <sudeep.holla@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 1/7] firmware: smccc: Add an Arm SMCCC bus
In-Reply-To: <20260903182152.GN4157646@nvidia.com>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-2-aneesh.kumar@kernel.org>
 <178794567779.4159892.8785590655735217125.b4-review@b4>
 <yq5ay0diyavw.fsf@kernel.org> <20260903125718.GI4157646@nvidia.com>
 <yq5av78mxv0j.fsf@kernel.org> <20260903154626.GL4157646@nvidia.com>
 <20260903-nonchalant-capable-parrot-539c8b@sudeepholla>
 <20260903182152.GN4157646@nvidia.com>
Date: Fri, 04 Sep 2026 11:20:13 +0530
Message-ID: <yq5ase3py38q.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Jason Gunthorpe <jgg@nvidia.com> writes:

> On Thu, Sep 03, 2026 at 05:18:16PM +0100, Sudeep Holla wrote:
>
>> Oh yes, we need this whatever you term as "duplication". I would argue
>> against terming it as duplications as if you look at the various SMCCC
>> based specification, we have zero consistency in how the VERSION command
>> is expected to work.
>
> Okay, then that pretty much settles it. Nothing to do
>
>> > Missing a check means FW upgrades might become Linux breaking. 
>> 
>> Are you referring to the SMCCC bus code or RSI in particular above. I don't
>> see any issue with SMCCC bus code check as that is the least we can do and
>> must not change with future versions of the firmware as well.
>
> Just in general, SMCCC drivers have to do something smart with the
> version.
>
> Like, is this OK:
>
> #define ARM_SMCCC_TRNG_MIN_VERSION	0x10000UL
>
> static inline bool smccc_probe_trng(void)
> {
> 	struct arm_smccc_res res;
>
> 	arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_VERSION, &res);
> 	if ((s32)res.a0 < 0)
> 		return false;
>
> 	return res.a0 >= ARM_SMCCC_TRNG_MIN_VERSION;
> }
>
> ?
>
> It means you can never publish a version 2 that is ABI breaking
> because linux doesn't check for that. Was that ARM's intention with
> the version API? It's basically a completely pointless check that
> doesn't effectively do anything.
>
> My broader, more general point is that if SMCC is being made into a
> discoverable bus, that's great, but it would be even better if ARM
> could find a way to progmatically enumerate all the ABIs present on
> the SMCC interface to populate the bus. That would necessarily include
> some consistent treatment of versioning for consistent
> interoperability.
>
>> If lower is also set at v3.0, then I would argue it is firmware upgrade
>> issue expecting old kernel with old RSI version supported to work. If
>> that returns v2.0, the driver must work IIUC. Aneesh, hopefully I got this
>> right ?
>
> There was many long conversations about this and I think the
> conclusion was RSI will broadly not use versions for any kind of ABI
> control. It is too coarse to really work in the real world and we must
> have strong forward/backwards interoperability inside VMs forever.


Even if we take RMI as an example, SMC_RMI_ABI_VERSION returns the
lowest and highest supported interface versions.

After a firmware upgrade, either value can change. Unless the existing
kernel supports an interface version within the advertised range, the
upgrade will break compatibility. Including the major version in the
modalias does not help with this.

Even with separate kernel drivers for versions 1 and 2, we still face
the same issue. If the firmware initially supports version 1 and an
upgrade raises the lowest supported version to 2, the version 2 driver
can handle it. However, that is functionally equivalent to a single
driver supporting both interface versions. If the current kernel does
not support version 2, either through a single driver or a separate
driver, the firmware upgrade will break compatibility.

-aneesh

