Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B8BACA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 13:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yz+AmtpMSXf49Wc8NGAPY9zG51ushhh9j5lCBM7ilRQ=; b=TMLkntFPsMBoc5Na/FatJPUgXV
	irgSz0X8fgto8W+iXpXgEcLS3aCG0Ww6qCV3oDe8NpF7g2x5LkwOqeVfAnCHAR6hb1ec02FtcdnST
	DmV8/bu+6C8YCbY0kX8gwKnNLTqCuSYs83u5Qr+Oa0+e2psieU27hcSAF+4fHTnT/UTmCoESvzj65
	yw/vaR0CFhMs3L+XCFyDDc5BT2pBD70JHv+TZJnUnTQ1k+8z6IvOrFvlyImLv6+7pxv4tjlwBpfdH
	Ihvg53BaXEK2oS/XEo7BfvkVNzsbGIyoTHqMwfFDQgx8ze9yrTbWYFnVIAz912r2aOro4HDP3EYPF
	UfOWI0dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtYu-000000093Jw-1QNS;
	Sun, 11 Oct 2026 13:26:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFtYt-000000093Jq-33fg
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 13:25:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DB4B0600E2;
	Sun, 11 Oct 2026 13:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F65D1F0089C;
	Sun, 11 Oct 2026 13:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791725158;
	bh=yz+AmtpMSXf49Wc8NGAPY9zG51ushhh9j5lCBM7ilRQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=FfoYErzPAo3nBNxODxNfjOBo4mB8dvYcW43SVvLU7xAqqf8vgc4Pc8dQ5RjjzGj8r
	 dz4Yu1Ik0lyDkPK5Q94t8YFiMu/3YAtuqG0ibIrfuueXSI5bzh2Va7IgOAs4v7eyFx
	 JMl0DoChCLxng6g3PfWjbT+ci2++HK7LZzu0/p78MEdD5GfFJphX7zAXvcmFaB1RRN
	 OZ8r08ejRpThQirlhattSJ3mgYE5tCYW5PGolEfsUBT2OXoGTinr4QzUquziBHsiqZ
	 AbbxLSI+bbUQOPqJ6sK6scEkqj607Fe6QvuV2pqP8EG6MTAAtgg09lyNmORq+Iazwe
	 VSoJbiI4bKGTw==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] firmware: smccc: Pass only the required device probe
 arguments
In-Reply-To: <ebb8c99c-5f76-4c36-b3cd-c238b53b3d8a@arm.com>
References: <20261010100249.643327-1-aneesh.kumar@kernel.org>
 <ebb8c99c-5f76-4c36-b3cd-c238b53b3d8a@arm.com>
Date: Sun, 11 Oct 2026 18:55:51 +0530
Message-ID: <yq5aecdwcqsg.fsf@kernel.org>
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

Suzuki K Poulose <suzuki.poulose@arm.com> writes:

> Hi Aneesh
>
> On 10/10/2026 11:02, Aneesh Kumar K.V (Arm) wrote:
>> The device probe passes zeroes for all seven argument registers to
>> arm_smccc_1_1_invoke(). On ARM32 Thumb-2, this binds an input to r7 and
>> GCC 8.5 reports "r7 cannot be used in asm here".
>> 
>> The current smccc_devices entries need at most one argument after the
>> function ID: TRNG_VERSION has none and RSI_ABI_VERSION takes a requested
>> version. Pass zero for that argument and omit the unused arguments,
>> avoiding the r7 constraint. Check argument requirements when adding new
>> probe functions to smccc_devices.
>
> Is it safer to use x1-x3 to 0 as they could be the results that we
> get back from SMCCC v1.0 onwards ?
>


I'm not sure I follow. Passing additional zero arguments only
initializes the input registers; it should not affect how return values
are handled. arm_smccc_1_1_invoke() already declares x0-x3 as outputs.
Since these probe functions require no inputs in x2 or x3 and we only
inspect x0 on return, why do we need to initialize them to zero?


-aneesh

