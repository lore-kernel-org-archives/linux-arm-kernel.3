Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC59CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 13:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/DcnQTeZI4YKYnANsuOLP3ExlPyT4WtsTA72OsrRERg=; b=tPzn+yJz+sMXwp0eQEBH43x/Jt
	3hy7poGaq/kV7Mv/q3Ea1FiEL7UnZs0JtL4BsvG/xKQnygGEZYpwmDRMdnv88Mc2klwnP7DcmugyS
	jv6DOsMeEqz0/s1TKcQ4PUP95kIqhW7iXmt9KovCpqHKeO/Lsz5C6J/xia5F0SHgUt3t0UQjBShyG
	w3VuSQjcz561ow+JKjzYXnGu3RGf9WqbaSTJb6ABBc2Y46z3lIjcghapbUq4DmTxI2QrttlFzWK7M
	/9UlR0aU9605fDyDvy9zlDIhe3gIcgxCE/Un2KXCmW7IBbGKaV7+DLKm4AczQjd3xCaz7bOfD9s5+
	CVpBgZ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux487-00000009eS8-329V;
	Fri, 12 Sep 2025 13:47:59 +0000
Received: from sinmsgout01.his.huawei.com ([119.8.177.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux484-00000009eRg-1qYB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 13:47:58 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=/DcnQTeZI4YKYnANsuOLP3ExlPyT4WtsTA72OsrRERg=;
	b=Q8pLkyYP6XMLOWfm0UEEdNgeHC6ZXfaCemitYMnvTcFKWHImQdcBRA4C4p7bQ3TevArIMHvOy
	jE1m7zqlkBek2L3dbxELIo4lledWmAravBzacMis+yV1DrtVPsFvdSqEIAPlsKjXYy1xmdnf3MF
	rGA09i4tPOxEglnLUUJj1zE=
Received: from frasgout.his.huawei.com (unknown [172.18.146.35])
	by sinmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4cNbK13n41z1P7Gn;
	Fri, 12 Sep 2025 21:45:09 +0800 (CST)
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4cNbJn3zS2z6M53n;
	Fri, 12 Sep 2025 21:44:57 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 015531402ED;
	Fri, 12 Sep 2025 21:47:39 +0800 (CST)
Received: from localhost (10.203.177.15) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 12 Sep
 2025 15:47:38 +0200
Date: Fri, 12 Sep 2025 14:47:36 +0100
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Will Deacon <will@kernel.org>
CC: Yicong Yang <yangyicong@huawei.com>, <yangyicong@hisilicon.com>,
	<catalin.marinas@arm.com>, <maz@kernel.org>, <oliver.upton@linux.dev>,
	<corbet@lwn.net>, <linux-arm-kernel@lists.infradead.org>,
	<kvmarm@lists.linux.dev>, <linux-kselftest@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <joey.gouly@arm.com>, <suzuki.poulose@arm.com>,
	<yuzenghui@huawei.com>, <shuah@kernel.org>,
	<shameerali.kolothum.thodi@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <tangchengchang@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: Re: [PATCH v4 5/7] arm64: Add support for FEAT_{LS64, LS64_V}
Message-ID: <20250912144736.00007673@huawei.com>
In-Reply-To: <aMLvtpaCgRqPAU2Z@willie-the-truck>
References: <20250715081356.12442-1-yangyicong@huawei.com>
	<20250715081356.12442-6-yangyicong@huawei.com>
	<aL7Fgx__LeLfbDyU@willie-the-truck>
	<5d2ba565-715b-9b17-951b-f805dde5988b@huawei.com>
	<aMLvtpaCgRqPAU2Z@willie-the-truck>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml100011.china.huawei.com (7.191.174.247) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_064757_105824_BF9A3D7C 
X-CRM114-Status: GOOD (  23.87  )
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

On Thu, 11 Sep 2025 16:50:14 +0100
Will Deacon <will@kernel.org> wrote:

> On Tue, Sep 09, 2025 at 09:48:04AM +0800, Yicong Yang wrote:
> > On 2025/9/8 20:01, Will Deacon wrote:  
> > > On Tue, Jul 15, 2025 at 04:13:54PM +0800, Yicong Yang wrote:  
> > >> diff --git a/Documentation/arch/arm64/elf_hwcaps.rst b/Documentation/arch/arm64/elf_hwcaps.rst
> > >> index 69d7afe56853..9e6db258ff48 100644
> > >> --- a/Documentation/arch/arm64/elf_hwcaps.rst
> > >> +++ b/Documentation/arch/arm64/elf_hwcaps.rst
> > >> @@ -435,6 +435,12 @@ HWCAP2_SME_SF8DP4
> > >>  HWCAP2_POE
> > >>      Functionality implied by ID_AA64MMFR3_EL1.S1POE == 0b0001.
> > >>  
> > >> +HWCAP3_LS64
> > >> +    Functionality implied by ID_AA64ISAR1_EL1.LS64 == 0b0001.
> > >> +
> > >> +HWCAP3_LS64_V
> > >> +    Functionality implied by ID_AA64ISAR1_EL1.LS64 == 0b0010.  
> > > 
> > > Given that these instructions only work on IMPLEMENTATION DEFINED memory
> > > locations and aren't guaranteed to generate an abort if used elsewhere,
> > > how is userspace supposed to know what to do with them?
> > >   
> > 
> > per ARM DDI0487 L.b section C3.2.6,
> > 
> >   When the instructions access a memory type that is not one of the following,
> >   a data abort for unsupported Exclusive or atomic access is generated...  
> 
> That's about the memory _type_. I'm talking about a supported memory type
> (e.g. writeback cacheable) but when the physical location doesn't support
> the instruction. That's captured a little later in the same section:
> 
>   | If the target memory location does not support the LD64B or ST64B
>   | instructions, then one of the following behaviors occurs:
>   |  * A stage 1 Data Abort, reported using the DFSC code of 0b110101,
>   |    is generated.
>   |  * The instruction performs the memory accesses, but the accesses
>   |    are not single-copy atomic above the byte level
> 
> and I think that's a bad interface to expose blindly to userspace solely
> as a boolean hwcap.
Hi Will,

Nasty, so now I'm curious. Any thoughts on how to expose what regions it is appropriate
for?  I can think of various heavy weight options but wondering if there is a simple
solution.

Jonathan
> 
> Will
> 


