Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8C6606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 10:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x8DmQENW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jYHnvV4I
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Md52We6EawhTcuECQ8x+adEJlS+dU9v2Pis/Pu6Ub5A=; b=x8DmQENWnLMNKIqFF8dy5nz7t7
	JP+LVlLM7Xk3QR8fEAGWQ3gLwdYIfD6cvtLaRp3+n9+9ceGQvAYuE1ujOXaJhrMisKVTaghubSoP5
	JEyiqT38Mg/PotzKGtQkl2Kuze2gGbaC55p+55LKKKOsc606g/lk0yd7Y+f1Xct8rfVKPajF4OGvK
	wFRREPuqayFyL2jiHYEV6BynlWNKKZ5GdwHqijbJYCpVPbLY7WaUkHa0bqxOA8iunJuoSlf3jl8oY
	Rw+sKhTdNIOnqZzSIzNih7x4bc8qURdjl1jdvRVgaJ9qnEz797wD3VDMDSiLkM4pmQNG/brVwBlkI
	kZ4hLuHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOY5q-00000004yhh-0K2B;
	Wed, 04 Nov 2026 10:19:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOY5o-00000004yhN-37Z2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 10:19:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 27F2942489;
	Wed,  4 Nov 2026 10:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6191F00A16;
	Wed,  4 Nov 2026 10:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793787584;
	bh=Md52We6EawhTcuECQ8x+adEJlS+dU9v2Pis/Pu6Ub5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jYHnvV4II77lPPk5cOSgv9l8j+UyOfgshMlcd60x60lvpLzogv3+5DEClbxxvT6hh
	 wslnToi5rCVDwSJP+/utVblFObqgj2fBaYCwsxaDg8H45nsHJ2JuFWyvsoeBm46+hK
	 gm2n7HZbCRxOZISGv+TuMkFqcR5O8m9Coz1Nk+qvCngxRcqyjauYjll1wO0V3Dorli
	 Si3Miqlv4YmA4cXcs7gZdGz94nLbD1qNaYK6fJEQVWpc4HnncJsJpGrp3TylRFoxsW
	 bv6RYCEJSMlxCSUYAdaCmd/BlA+yLDtoXZCfhwCSuceISSo4/1iqy1jeIB758VqoVb
	 RmtU3qcLDKiCw==
Date: Wed, 4 Nov 2026 10:19:40 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Cc: linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Jamie Nguyen <jamien@nvidia.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Dat Mach <dmach@nvidia.com>
Subject: Re: [PATCH 2/2] ACPI: FFH: Support FF-A direct request 2 calls
Message-ID: <20261104-effective-wolverine-of-novelty-4e49fc@sudeepholla>
References: <20261103173907.1996118-1-sudeep.holla@kernel.org>
 <20261103173907.1996118-3-sudeep.holla@kernel.org>
 <20261103145335.000026ea@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103145335.000026ea@oss.qualcomm.com>
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 02:53:35PM -0800, Jonathan Cameron wrote:
> On Tue,  3 Nov 2026 17:39:07 +0000
> Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > Arm Functional Fixed Hardware specification v1.3 defines FFH
> > OperationRegion offset 2 for issuing FFA_MSG_SEND_DIRECT_REQ2 calls.
> > The arm64 FFH handler currently supports only generic 32-bit and 64-bit
> > SMCCC calls, so it cannot implement this standardized interface.
> > 
> > Add a standalone FF-A path using the existing SMCCC conduit. Negotiate
> > FF-A v1.2, discover the sender endpoint with FFA_ID_GET, and use either
> > the receiver supplied by firmware or resolve a unique receiver from the
> > service UUID with FFA_PARTITION_INFO_GET_REGS.
> > 
> > Convert the ACPI ToUUID representation to the FF-A register encoding,
> > construct the direct request, resume interrupted or yielded calls with
> > FFA_RUN, and return the defined FFH status codes to AML.
> > 
> > Register-based partition discovery avoids RX/TX buffer ownership and
> > keeps the FFH implementation independent of the Arm FF-A transport
> > driver.
> > 
> > Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
> Hi Sudeep,
> 
> I was curious so took a quick look. Some drive by comments inline.
> 

All good point, will be updated accordingly in the next version. Thanks
for the review.

-- 
Regards,
Sudeep

