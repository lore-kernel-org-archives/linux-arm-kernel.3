Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C476E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 12:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CH9JqyAostxBgadcpnNFkn/qPVAr8UqXnCcpMCOo3Zg=; b=gnsvQhbPTrQDWjQaS+AkNp9U/g
	CScefW7obL11DEW/ilDAkEd/ASMxU+Lqgb9r0ai7a8WjwQOCClcOyq6scnMuy7WKo9LjQjcWOjJBl
	NX8IhqMBJ862nzNVElyf46hQhdvOqe5cyv50rSXMrapB100Qk5iwWSu55B0KQv/mbIrYKJZ/R3j0y
	1DIiIIHxpRKuV5XRXOnCd/L+zWWNpfU3PSkyRW/WVWQUw8BBwo6LRqffBeYmZphf1QRhdVRntjqBU
	V6aJw9C15Dvd6xGKfbSfVDIKCKvshbUisZp4NzQX9mbj2QK6D9njWqN+bxbCHFoPsXa36xHCborui
	MyyhqMZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAdJ-0000000FssU-12TK;
	Thu, 05 Dec 2024 12:07:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJAOK-0000000Fnq8-2BA8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 11:51:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3D91EA43738;
	Thu,  5 Dec 2024 11:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2281BC4CED1;
	Thu,  5 Dec 2024 11:51:25 +0000 (UTC)
Date: Thu, 5 Dec 2024 11:51:23 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, Sami Mujawar <sami.mujawar@arm.com>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Subject: Re: [PATCH v7 10/11] virt: arm-cca-guest: TSM_REPORT support for
 realms
Message-ID: <Z1GTu1kAV3J1cnJc@arm.com>
References: <20241017131434.40935-1-steven.price@arm.com>
 <20241017131434.40935-11-steven.price@arm.com>
 <6750c695194cd_2508129427@dwillia2-xfh.jf.intel.com.notmuch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6750c695194cd_2508129427@dwillia2-xfh.jf.intel.com.notmuch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_035132_634730_36ADFE00 
X-CRM114-Status: GOOD (  18.27  )
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

On Wed, Dec 04, 2024 at 01:16:05PM -0800, Dan Williams wrote:
> Steven Price wrote:
> > diff --git a/drivers/virt/coco/arm-cca-guest/Kconfig b/drivers/virt/coco/arm-cca-guest/Kconfig
> > new file mode 100644
> > index 000000000000..9dd27c3ee215
> > --- /dev/null
> > +++ b/drivers/virt/coco/arm-cca-guest/Kconfig
> > @@ -0,0 +1,11 @@
> > +config ARM_CCA_GUEST
> > +	tristate "Arm CCA Guest driver"
> > +	depends on ARM64
> > +	default m
> 
> I am working on some updates to the TSM_REPORTS interface, rebased them
> to test the changes with this driver, and discovered that this driver is
> enabled by default.
> 
> Just a reminder to please do not mark new drivers as "default m" [1]. In
> this case it is difficult to imagine that every arm64 kernel on the
> planet needs this functionality enabled by default. In general, someone
> should be able to run olddefconfig with a new kernel and not be exposed
> to brand new drivers that they have not considered previously.
> 
> [1]: http://lore.kernel.org/CA+55aFzxL6-Xp=-mnBwMisZsuKhRZ6zRDJoAmH8W5LDHU2oJuw@mail.gmail.com/

Fair point, the pKVM driver is also default off. At least with the arm64
defconfig, VIRT_DRIVERS is default off, so this wouldn't be built. But
an olddefconfig will indeed enable it (this reminds me to add the coco
drivers to my test configs).

-- 
Catalin

