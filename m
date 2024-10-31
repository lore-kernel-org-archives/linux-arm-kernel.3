Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79988E6897C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 12:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ygt+6jsBRDhjxME8hFA++MkWwLJLxiUed5K8glrgWvg=; b=wJrFo3BMG1LJ5/hTBIT+XG54RH
	NxzuQ8U+GpQ56kREO07WUGA4f6J6OkJSWzRBh2m6CihhqPqT+7GnVKtU+4ZxYpKTsBxB73hs9V+n6
	rcg3Hj+5VDf/9Enxd8tRChTqP0ans+Dtyjjr9pkCqDC5RwpyHbQefwf03Zo/M9x2E0HtWWw2KUkZy
	BU2EHhVYbHBFnsd7MHb7F+5MMEjeH8+BHvJlKFIW5/PI3NfJDZw2bLuD2cfcw5GhM3F/pBZMwd2sZ
	Rj7FnTAzgJC/4bTaplABX5LSsWrMFppmJMahPsFZIHo8GammqJwTtBPrstfnppmY+jox0oijiwB5t
	AjKSqPEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6TzJ-00000003UGT-3Us9;
	Thu, 31 Oct 2024 12:09:17 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Txf-00000003U6n-1yKh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 12:07:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CFE55A44119;
	Thu, 31 Oct 2024 12:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6D23C4CECF;
	Thu, 31 Oct 2024 11:49:08 +0000 (UTC)
Date: Thu, 31 Oct 2024 11:49:06 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Joey Gouly <joey.gouly@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	anshuman.khandual@arm.com, gshan@redhat.com, james.morse@arm.com,
	shameerali.kolothum.thodi@huawei.com, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jing Zhang <jingzhangos@google.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v6 1/7] arm64/sysreg: Convert existing MPAM sysregs and
 add the remaining entries
Message-ID: <ZyNusiQFI9Kh-Zqx@arm.com>
References: <20241030160317.2528209-1-joey.gouly@arm.com>
 <20241030160317.2528209-2-joey.gouly@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030160317.2528209-2-joey.gouly@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_050735_591593_75CBF34D 
X-CRM114-Status: UNSURE (   7.25  )
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

On Wed, Oct 30, 2024 at 04:03:11PM +0000, Joey Gouly wrote:
> From: James Morse <james.morse@arm.com>
> 
> Move the existing MPAM system register defines from sysreg.h to
> tools/sysreg and add the remaining system registers.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

