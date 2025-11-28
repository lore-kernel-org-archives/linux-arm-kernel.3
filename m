Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9F1CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 15:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UwH/Z08zpOJH9Qx3rP2VNmvvcp1bC3Ils5pFe8gHrVg=; b=FMAptZlJE1JEh1kS58fY2hv++M
	K3GBjTi02oqq0nzTfQCElfV5B5cMMZdIIWr2D+JFSX7fXyOCz4NaH3cdkJppZUXiWISXep49cS+rU
	y3IgOQ4Z7a4dkM9cJi/yi7HCoFC52kF4zL0oCdpx5DJ3SLwIN7Dvo9uLW/LUs4TwHYgh3GvxzW5z/
	aXQPmOgcTFl+UH2+uVS6sSKLKng1h8t0ufNslW8Yh6tarxMMH3uJJGir7/3xknJzpkQg4ySEjQfra
	PA1ndMU746Bk0CUJ4Ym8QpqRpmapnnbBiIQGVE6Pfj+R7qLCykW0UT+zC5qEQFTuoweGprb2ff8xe
	GOe7+Mlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP0mP-00000000bTU-484z;
	Fri, 28 Nov 2025 15:53:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP0mN-00000000bTB-35xx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 15:53:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B91D176A;
	Fri, 28 Nov 2025 07:52:55 -0800 (PST)
Received: from arm.com (arrakis.cambridge.arm.com [10.1.197.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4CB6C3F73B;
	Fri, 28 Nov 2025 07:53:01 -0800 (PST)
Date: Fri, 28 Nov 2025 15:52:58 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: will@kernel.org, Dev Jain <dev.jain@arm.com>
Cc: ryan.roberts@arm.com, rppt@kernel.org, shijie@os.amperecomputing.com,
	yang@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64/mm: A fix and a documentation bit for
 change_memory_common()
Message-ID: <176434515969.1525176.17062774390340624126.b4-ty@arm.com>
References: <20251112062716.64801-1-dev.jain@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112062716.64801-1-dev.jain@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_075303_819773_37933F4E 
X-CRM114-Status: UNSURE (   8.42  )
X-CRM114-Notice: Please train this message.
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

On Wed, 12 Nov 2025 11:57:14 +0530, Dev Jain wrote:
> The first patch is a fix to prevent suppression of error encountered during
> linear map alias permission change. This is needed because the rodata=on
> security measure requires us to proceed only if we first do the linear map
> alias protection change.
> 
> The second patch documents why linear map split failure during the vfreeing
> path isn't problematic.
> 
> [...]

Applied to arm64 (for-next/set_memory), thanks!

[1/2] arm64/pageattr: Propagate return value from __change_memory_common
      https://git.kernel.org/arm64/c/e5efd56fa157
[2/2] arm64/mm: Document why linear map split failure upon vm_reset_perms is not problematic
      https://git.kernel.org/arm64/c/0c2988aaa4d3

-- 
Catalin

