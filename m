Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D810EC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 15:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=crAu+rO/8jjpMeszBXQph4x7yIoYqyBep9PV7qmQuK8=; b=MC3/yg7KpRSrop4Hkh1o5xblkN
	EA2+Vh/lpti0QAVCt1/6AbNRDYY7og1U8TID96Bs7drLZyLdwUr3D9koPDNg1ZzxS3B5NA+OghZfw
	6lY92MSteN2TLf79YdeEVuxZepBKIEwSv4PrJrUImfTVczW3GrYl0oBM7Hu8Lh7xpxBFQanwm5vnF
	O1rOsUQeJfWMDExdUZcPJzHr0018MBxhcycnMW6eR8Lp6aWKg2EZKdf/csz9bvmBIp4mB2AqJ4/6a
	kyqtEy3MXMEKPvcWB6VBszx3x1Ct+RBlBSlfqFN9OcTEmvH8ISqu/V1cRgIJmGKEmbE2HmBMe4JEP
	aR0K2FnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fut-00000002bhx-1xi0;
	Mon, 21 Sep 2026 15:26:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8fus-00000002bhH-192d
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 15:26:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B5DB340F3B;
	Mon, 21 Sep 2026 15:26:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B931F000FF;
	Mon, 21 Sep 2026 15:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790004409;
	bh=crAu+rO/8jjpMeszBXQph4x7yIoYqyBep9PV7qmQuK8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=kXOCMPeOABC3WIWc0m2aMa53Wy1vci2Ph1we34tBe20fflS/kwx9hhp/Bh2Uo+id5
	 e6dy3zdJ14+pNdpep6sBKlIMjn3Khyu9Fehxt5yHD/bXdzQ+/hUEwmutBQ88ho5LXl
	 9OPClu0cxwjagvWcavMP05o/JjEt3lVfuRCHGM0taw3BZXgz/On7tIzHebY2HeJ9q+
	 EMbKmUEBXIWCO++8CrCDYqtnvfwS9etcFOBXWgmLW2TFA3sVnOSVHEy/Oxl26bbs9y
	 A4Jxo92CBcSprJG84NCdVoSDEbokDxtFGJwV4uc7ucTkSfhbPPRtSbgjRca+9MgtQY
	 qJVNPaTSiDWrw==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	"T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v6 7/9] dma-buf: system_heap: Enforce shared-granule
 alignment for cc-shared buffers
In-Reply-To: <20260921123725.GN11599@ziepe.ca>
References: <aq1V3oeDdvXobt8J@arm.com>
 <97c30fce-9bda-4c61-b1b9-10297b89c8d9@amd.com>
 <20260918153642.GD11599@ziepe.ca>
 <d8123f21-d5ce-415b-a05a-392d97b8b57d@amd.com>
 <20260918165315.GF11599@ziepe.ca>
 <6115eaf7-21bc-49ce-8a74-08fd37a1e2c9@amd.com>
 <20260921115141.GJ11599@ziepe.ca>
 <45dd7a2f-8474-4388-b383-2dee3ee62206@amd.com>
 <20260921121739.GM11599@ziepe.ca>
 <cd2b32dc-5a80-4ef5-82bc-dd41ea96dc01@amd.com>
 <20260921123725.GN11599@ziepe.ca>
Date: Mon, 21 Sep 2026 20:56:41 +0530
Message-ID: <yq5a1pam4ocu.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

Jason Gunthorpe <jgg@ziepe.ca> writes:

> On Mon, Sep 21, 2026 at 02:24:21PM +0200, Christian K=C3=B6nig wrote:
>
>> I also don't see where mem_cc_shared_granule_size is added?
>
> Patch 1:
>
> https://lore.kernel.org/all/20260904103452.1197239-2-aneesh.kumar@kernel.=
org/
>
> Aneesh, please be sure to use get_maintainers on series like this so
> everyone gets cc'd.
>

For v7, I included only the maintainer entries because the recipient
list was getting too long, but I added the mailing lists.

-aneesh

