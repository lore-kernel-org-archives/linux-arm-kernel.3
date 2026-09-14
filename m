Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B93FC88E70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6XvL6u+GeoAQ50Fc6P8XNBf2G9Lje8F3QQg71ajqH0=; b=mO6f5L1ByonQkEvyAt1n3UfA08
	o1OW3cym4+C/RMNCsBPSvpKFX04QQNuh8xIzw86Vp25RhTVmN8Asdz2wiKWdzKLryr4kxLlRXqXA9
	UtQrCvRQyOdRkaXJa8a+sbpfxTNpUzER1GlTiQJVReyEtGzqEJf0iPj+Pz0TL30Hru2Whc1AO6PvE
	tRVzGQjKlKjhZ+89VT0uG0WRexXrAlajYvNbWU2cb9CMbSa8MXBYuVP2K1GospQKzhkBTkbprP5dW
	IRDkFPAbJj1/NppO3Tg6A/HdK8FiLT8gbrEOxF0gIhUSOuXoarFp8xtBA/cVe5YDDG78Y90Gym+hY
	UASDcLFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x673V-00000003rB1-3ktp;
	Mon, 14 Sep 2026 13:49:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x673S-00000003r9Y-2GZu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:49:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2331B1570;
	Mon, 14 Sep 2026 06:49:02 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FB7D3F882;
	Mon, 14 Sep 2026 06:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789393745; bh=yvGmcSwid2FCTbXP5Uf/xb5RvxMjo4RD4diMW2HJq/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CA67/KbytAoqlBWscm0VmXJ9Jj8tm8EW8t7A73nylnoZl2hJBUQPBwpOl7PeH7Dpb
	 g1Ji2wSR+YOzc2jTe747Vti4pM3pvB2q3ErSh0WGMvDu1Gq3fDet6l7MQL+Eh6IbBJ
	 LyxZNAEvMN54N25TiURLa4b/ZSKlAUOu+eWeYZ/4=
Date: Mon, 14 Sep 2026 14:48:58 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v11 7/7] coco: guest: arm64: Replace dummy CCA device
 with sysfs ABI
Message-ID: <aqf7Sr2VvzV3lLhN@arm.com>
References: <20260914060511.277948-1-aneesh.kumar@kernel.org>
 <20260914060511.277948-8-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914060511.277948-8-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_064906_613777_0F9615AA 
X-CRM114-Status: GOOD (  12.88  )
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

On Mon, Sep 14, 2026 at 11:35:11AM +0530, Aneesh Kumar K.V (Arm) wrote:
> The SMCCC firmware driver now creates the arm-smccc platform device and

Nit: we now have devices on an arm_smccc bus, so this first line doesn't
make sense.

> instantiates the CCA RSI auxiliary devices once the RSI ABI is discovered.
> The arm64-specific arm-cca-dev platform device stub is therefore no longer
> needed.
> 
> However, userspace has used the arm-cca-dev platform device to detect Arm
> CCA Realm guests [1]. Removing it without a replacement would break that
> detection and would also leave userspace depending on kernel device-model
> details.

Well, removing it would break the ABI even if you replace it with
something else. But I think we agreed it wasn't great for systemd to
depend on the old interface either. Assuming systemd can be fixed (and
the fix backported) and no production deployments are affected, I'm fine
with this.

Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>

