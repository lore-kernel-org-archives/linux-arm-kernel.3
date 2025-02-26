Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054BAC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 19:41:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zH8iv34AbyqAaxKoCQuGOxbqeiGftA8PAFOKItXXOUU=; b=EfuaCdESyJ/gk5/RhsBtFZIO1C
	bVBtWy94yL6OfSpe1NPs0lU9cVGVGCVaZQsQK+8CMQw4pinIUf8hncMxNqA42fwZxZHsunHWZggWB
	/uWM1Kxe405KCLmPLzHhe1qHuoE6b2lQIwyUsYYXL5PORtP/LsFS7JzGjH81LtT8XIUVX+JwK7/J7
	pt/AShph6MD9zlHZymRX14XmoBT2a2jvaqjxeGc/VQhnWz5djx1QZu3elK0ae0Q/DPzegLsPgOPwl
	cgXr8K9aY5TWGWrsZz/dlNAHrFFT/30z9yVBvubrvqH1LRK6ih/GLfhRGN0OPtFILtY367rLSj1Rz
	ejd24pCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNH2-00000005BgI-3apQ;
	Wed, 26 Feb 2025 19:40:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnNFW-00000005BS1-369X
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 19:39:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 15BC861129;
	Wed, 26 Feb 2025 19:39:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01BE8C4CEE7;
	Wed, 26 Feb 2025 19:39:14 +0000 (UTC)
Date: Wed, 26 Feb 2025 19:39:12 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: kvmarm@lists.linux.dev, maz@kernel.org, oliver.upton@linux.dev,
	will@kernel.org, mark.rutland@arm.com, cohuck@redhat.com,
	eric.auger@redhat.com, sebott@redhat.com, yuzenghui@huawei.com,
	wangzhou1@hisilicon.com, jiangkunkun@huawei.com,
	jonathan.cameron@huawei.com, anthony.jebson@huawei.com,
	linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com
Subject: Re: [PATCH v8 1/6] arm64: Modify _midr_range() functions to read
 MIDR/REVIDR internally
Message-ID: <Z79t4EEC4I5CKHAX@arm.com>
References: <20250221140229.12588-1-shameerali.kolothum.thodi@huawei.com>
 <20250221140229.12588-2-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250221140229.12588-2-shameerali.kolothum.thodi@huawei.com>
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

On Fri, Feb 21, 2025 at 02:02:24PM +0000, Shameer Kolothum wrote:
> These changes lay the groundwork for adding support for guest kernels,
> allowing them to leverage target CPU implementations provided by the
> VMM.
> 
> No functional changes intended.
> 
> Suggested-by: Oliver Upton <oliver.upton@linux.dev>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

