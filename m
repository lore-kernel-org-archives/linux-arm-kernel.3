Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB16CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 13:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5CS+1WddC9LU2dBRnyvoTVR6p6QDTIjDWTeJO+ovyZg=; b=Ig9uEt77/hFipwI/LVV66Y33V/
	6nhfHYrsCVSnVQmZUoPsWvGIGGey8X+9OLhD7ek2qEgbay6Hst2Y6wb1CORLVQOoac4OXIK5Ds+Bx
	JUlUChhyOALrxUaafRcrlLj3fYH/Hb7NILIG0Nhbff/uXhmlEUIi1ZWA3WchYU7pb/MSKQResD6w6
	Rvy7rXGqtTkGjy81iw6jlmDGh46kxq+gcLU9HWwwzOCkgHeCopQefDLjCASWqqiZ+Yl5ODmtM0p/N
	4BQYfTQ0ennGdIyTfLf+jsPzOXaKLjzJ+pMKDE2R3SjuCC5MWf9GPfuty9WsbVLRTbF8LDoMxWfvg
	wukAnwGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdNJ-0000000BfhW-2bSw;
	Fri, 02 Oct 2026 13:32:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCdNI-0000000Bfgy-0DyD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 13:32:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B17C243A5A;
	Fri,  2 Oct 2026 13:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 487A81F000FF;
	Fri,  2 Oct 2026 13:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790947951;
	bh=5CS+1WddC9LU2dBRnyvoTVR6p6QDTIjDWTeJO+ovyZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GwG7mW8qhr86CaqjYE/Yd2RsfCqwMsCXI1iDGRoNkU4pgH6lUy+JL0qRaqhYUBG6E
	 zl1APCpFBz4sEk0HnkVUwCVe1/xIrU7ttHBmyJ6P4B5SorjsGlEFBNe6193ibDRnnU
	 j6nUHNrUC3NQCJS5fFiDDEyjyP1heho25GZBHmlyAjzJdeJI4iVbh3WP8e6mdRDH6B
	 fmktOK6KbL/vwdzmLlp7dkWpn6MeJ3Y/7RcoE0Ft3eTFc5jaCl8r8P/Fm80rO41m1U
	 Su3Pmj/VsRAGHjDwyCaduNE0dHjvSg5nTjpt2K3texfLOytpg0mSoBamivZMOo+b8Y
	 FVGaLt7RCr3VQ==
Date: Fri, 2 Oct 2026 14:32:25 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, maz@kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, will@kernel.org,
	catalin.marinas@arm.com, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, steven.price@arm.com,
	aneesh.kumar@kernel.org, oupton@kernel.org, gshan@redhat.com,
	joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
	linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com,
	jonathan.cameron@oss.qualcomm.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v22 07/10] kernel: hibernate: Add an arch hook for
 preventing hiberation
Message-ID: <20261002-sloppy-tremendous-guan-30cbe5@sudeepholla>
References: <20261002061507.1600269-1-suzuki.poulose@arm.com>
 <20261002061507.1600269-8-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002061507.1600269-8-suzuki.poulose@arm.com>
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

On Fri, Oct 02, 2026 at 07:15:03AM +0100, Suzuki K Poulose wrote:
> Add a hook to allow arch code disable hibernation. On arm64, with an RMM active,
> there could be pages that are delegated to the "Realm" security state. Any
> access to them are fatal (e.g., hibernate save image or restoring an image to
> a delegated page). pKVM host also has its restrictions on enabling hibernation.
> 
> Add a weak arch hook to let the architectures have a say.
> 
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Len Brown <lenb@kernel.org>
> Cc: Pavel Machek <pavel@kernel.org>
> Cc: linux-pm@vger.kernel.org
> Cc: Sudeep Holla <sudeep.holla@kernel.org>

FWIW, it makes sense for this RMM use case:

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep

