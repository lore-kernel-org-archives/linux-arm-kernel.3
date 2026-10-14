Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B2FDCC6B1F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nog34Y76Lw4hkokh15p+3vFOIQZmt607Twy4BywhjY=; b=xP/z4eUU9sTiwJGC6otBhVb3zq
	FhobC8T7vlBRffDDIU3yA9dtAVHCyMJKRnSXuH7KFMOlfgdvd5iqah85GrgCfjbm9VEhGRlbaLlE7
	NdBtLNjeklM4M8DvJ8YG8otvHWwrlnAhJxzEHVxKUNMcQ4y8YsyKYfhhzKEOjmgSUOs5DADuN3NA/
	zSY4/595KVQedurIQ46SAyUTOyEgTz1NfeD/+sqy5I9o7QwigDsTVk4P+/q9yEQc72DK+mpULrlCY
	LxqKxMlIrKUCi6gUoFkmq1uSNR/aiI2bfSclG4KWPyNkSMv5rpTyC8HoOOaT0Rmtn26QP0KUWu8F6
	bfXyt9rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGv7S-0000000F0GB-1t2C;
	Wed, 14 Oct 2026 09:17:54 +0000
Received: from stravinsky.debian.org ([82.195.75.108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGv7Q-0000000F0FF-08oH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4nog34Y76Lw4hkokh15p+3vFOIQZmt607Twy4BywhjY=; b=wNSYi3lt0J/hkZV/xLwxq1nwND
	mcofcmDjUS9lOB/NrSXuHuoId+oqZgxTUqegmUbXNDBAjX80T6Lxd/K+WfzvQ7AX4GDdepgP4ngoT
	jgw41g1jNmKYdBJHRADZLnTz/y+bTog+Pmqh3OtwYIJ7tO76iDAlZDGTyhgcyStWvMEsWv01OWvhh
	J6MNcbBfzRWv8Kh+Lx5AL8UUvFHkfbbtCN+xh7jc83d0XatwSRUsxyfKNTiaiPx/rIo4CGQ+Rfnio
	we1habKvanNR8urr+i2nJXXw+G6tUeiCLJBTVQpwCPNHEqkLHAfBbvaKI3bZ2ltXObqEJeGswVdXS
	nzsZKL8A==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xGv7C-004If8-10;
	Wed, 14 Oct 2026 09:17:38 +0000
Date: Wed, 14 Oct 2026 02:17:33 -0700
From: Breno Leitao <leitao@debian.org>
To: Koba Ko <kobak@nvidia.com>
Cc: Will Deacon <will@kernel.org>, catalin.marinas@arm.com, 
	robh@kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, fenghuay@nvidia.com, tdave@nvidia.com, kaihengf@nvidia.com, 
	rupakr@nvidia.com, mohammedk@nvidia.com
Subject: Re: [RFC PATCH v2 1/3] arm64: add CPU prefetch and cache modulation
 sysfs interface
Message-ID: <as9HWuAhOGMfH1Ty@gmail.com>
References: <20260825181701.3-1-kobak@nvidia.com>
 <20260825181701.3-2-kobak@nvidia.com>
 <aru9Rf7BzW3-vcm0@willie-the-truck>
 <20261014061745.40032-1-kobak@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014061745.40032-1-kobak@nvidia.com>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_021752_074064_CC998CEC 
X-CRM114-Status: GOOD (  11.90  )
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

On Wed, Oct 14, 2026 at 02:17:45PM +0800, Koba Ko wrote:
> For controlled performance characterization, is there an existing kernel
> mechanism or a different design you would recommend? Or do you think these
> experimental controls are better kept out of tree?

As a user of this patchset, I am trying hard to avoid carrying it out
of tree, either as patches or as a driver. Out-of-tree code makes
kernel rebases and rollouts slower, and debugging more complex.

Is there a way to keep a generic interface available under
CONFIG_EXPERT, or something similar, so that users who want to
experiment can use it?

We could even taint the kernel when the interface is used, to make it
clear that the user is messing with things they should not (!?).

Thanks,
--breno


