Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F596C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 10:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CdanhhwoJQXFk6JeXS8F6vwZ9u4aPPztMzpjTS0BSP8=; b=qphx3ApcAFjZFbRcIQskQxYfHw
	M52s6reuG7aDosiZKA3zeWO9KwF6TB9lPVKSQjK0ZVB2km5g7QPK5rycJGmxeZ3DE6XfK1K0ykMlG
	y5B/6jgEA1VyY33Tjh9QHe5hA3ZdV/rZZNvu51wjs4+EILcVcSwGZj5/bOSRuVM+NFTSWfEoJaRir
	t0dn5MQYrxRCP0REqXQFKxPIEiP3hvB1m8AMZWjxLfcJOJ/qA7U7fhe6EQ2X57xrA9/yld/CxpX4v
	9b9vprhwuf/1uQHoq7vABQg1adp+xK4XdTVgf/jtOqEFBj/YCUquV4kMJiZ/WJfPdFPtDekQoBL11
	PfPVJvdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2T4c-00000006uTr-0B93;
	Wed, 09 Apr 2025 10:54:26 +0000
Received: from verein.lst.de ([213.95.11.211])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2T2o-00000006u9U-0zIi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 10:52:35 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
	id 689A368AA6; Wed,  9 Apr 2025 12:52:29 +0200 (CEST)
Date: Wed, 9 Apr 2025 12:52:29 +0200
From: Christoph Hellwig <hch@lst.de>
To: Roman Kisel <romank@linux.microsoft.com>
Cc: aleksander.lobakin@intel.com, andriy.shevchenko@linux.intel.com,
	arnd@arndb.de, bp@alien8.de, catalin.marinas@arm.com,
	corbet@lwn.net, dakr@kernel.org, dan.j.williams@intel.com,
	dave.hansen@linux.intel.com, decui@microsoft.com,
	gregkh@linuxfoundation.org, haiyangz@microsoft.com, hch@lst.de,
	hpa@zytor.com, James.Bottomley@HansenPartnership.com,
	Jonathan.Cameron@huawei.com, kys@microsoft.com, leon@kernel.org,
	lukas@wunner.de, luto@kernel.org, m.szyprowski@samsung.com,
	martin.petersen@oracle.com, mingo@redhat.com, peterz@infradead.org,
	quic_zijuhu@quicinc.com, robin.murphy@arm.com, tglx@linutronix.de,
	wei.liu@kernel.org, will@kernel.org, iommu@lists.linux.dev,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
	x86@kernel.org, apais@microsoft.com, benhill@microsoft.com,
	bperkins@microsoft.com, sunilmut@microsoft.com
Subject: Re: [PATCH hyperv-next 5/6] arch, drivers: Add device struct
 bitfield to not bounce-buffer
Message-ID: <20250409105229.GA5721@lst.de>
References: <20250409000835.285105-1-romank@linux.microsoft.com> <20250409000835.285105-6-romank@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409000835.285105-6-romank@linux.microsoft.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_035234_465023_0C0DA11E 
X-CRM114-Status: GOOD (  13.10  )
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

On Tue, Apr 08, 2025 at 05:08:34PM -0700, Roman Kisel wrote:
> Bounce-buffering makes the system spend more time copying
> I/O data. When the I/O transaction take place between
> a confidential and a non-confidential endpoints, there is
> no other way around.
> 
> Introduce a device bitfield to indicate that the device
> doesn't need to perform bounce buffering. The capable
> device may employ it to save on copying data around.

I have no idea what this is supposed to mean, you need to explain it
much better.


