Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF70C98318
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KVgyAnZgVnQ6WH3xmOABIdkKqXbg5sR4YfTNaADNdJI=; b=RAJJDpWoW9mb6s8xbiktFKySS3
	OmW6sICJ8dVWfC1C2SemCBKx9UvMxN1J2rgJtsZst4gS3uZYAVyFBSGpVHgtxqN1EaqkQD8GYTCJO
	zceG9BUXkc7dwX5Kk/1kbmz22aTZrAPI/y4n5Sx/DWU53L8Pyq6Kx7BgHzsq/Uq2xmx1xJfh9EJsV
	AAbfid6Gruv3jjGJyydufy7G0zJG6awI5YkVw7rcFUhjoxPZlX+insNDkT9J6LWMg9g4p5BhRC496
	KOYVFN6veMHJ193bhC6VsUh0B8Wppy59IhZk4WjmiH4fY0KvfBep9dr88krlwhGisrAs0n4leCqYT
	U0aBpDUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mBk-0000000BaOM-2H7K;
	Thu, 24 Sep 2026 16:20:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mBi-0000000BaNx-1BGd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:20:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 016C3497;
	Thu, 24 Sep 2026 09:20:41 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ECCA23F86C;
	Thu, 24 Sep 2026 09:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790266844; bh=Pe/zNtEpCcy1McYVhFRzIjTbk04DgTe7ite2+ZGUsnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qBhabypID4ejayZoORGRa0QqVCZ74MT0qol8kkbDdKqzRo6plOuNZigFbSpt1/OV2
	 wwHY8tQYzR4DZxbj+Rtdgx7v2O7WHekeP09NJqp38PFXbIeu73JuestUb5ihi1tuXQ
	 esuvnghGt/9e2ulRtg10zxb/ejkCB/o1uDB8n/Ds=
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: Will Deacon <will@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Olivia Mackall <olivia@selenic.com>,
	Russell King <linux@armlinux.org.uk>,
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v13 0/8] Switch Arm SMCCC firmware services to an SMCCC bus
Date: Thu, 24 Sep 2026 17:16:25 +0100
Message-ID: <179026658584.3654431.7189876471375206962.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
References: <20260923140405.1111554-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_092046_441360_B2E15503 
X-CRM114-Status: GOOD (  13.01  )
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

On Wed, 23 Sep 2026 19:33:57 +0530, Aneesh Kumar K.V (Arm) wrote:
> As discussed here:
> https://lore.kernel.org/all/20250728135216.48084-12-aneesh.kumar@kernel.org
> 
> The earlier CCA guest support used an arm-cca-dev platform device as a pure
> software anchor for the TSM class device. That platform device did not
> correspond to a DT/ACPI described device, MMIO range, interrupt, or other
> platform resource; it existed only to make the CCA guest driver bind and to
> place the resulting TSM device in the driver model. The same pattern also
> exists for smccc_trng. Creating separate platform devices for such
> SMCCC-discovered features is misleading, because those features are not
> independent platform devices.
> 
> [...]

Applied to arm64 (for-next/smccc-bus), thanks!

Greg, I think the latest addressed your concerns in the past with
abusing the auxiliary device, so I queued them for 7.4.

Olivia, Herbert, I assume you are ok with the hwrng changes in patch 2.
Please let me know if there are any objections.

[1/8] firmware: smccc: Add an Arm SMCCC bus
      https://git.kernel.org/arm64/c/fe7f2a805443
[2/8] firmware: hwrng: arm_smccc_trng: Register as an SMCCC device
      https://git.kernel.org/arm64/c/d8263a131bb0
[3/8] firmware: arm_rmm: Move RSI support out of arch/arm64
      https://git.kernel.org/arm64/c/4cd849026e2c
[4/8] arm64: realm: Move Realm memory encryption ops to RSI code
      https://git.kernel.org/arm64/c/714153dca3a8
[5/8] virt: coco: arm-cca-guest: Rename TSM report source file
      https://git.kernel.org/arm64/c/07005b64d72a
[6/8] firmware: smccc: arm-cca-guest: Bind the TSM provider to an SMCCC device
      https://git.kernel.org/arm64/c/0d5be76b6086
[7/8] coco: guest: arm64: Add sysfs ABI for CCA Realm guests
      https://git.kernel.org/arm64/c/d541df166d18
[8/8] coco: guest: arm64: Remove dummy CCA platform device
      https://git.kernel.org/arm64/c/bce57945f5e7

