Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A17CCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 15:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h166zH557nDu6KXjKDDikPqDNydwEXPbG2tc2cnGUQA=; b=D+FmJaBFYZ8kmU5iGHeqyzRy/A
	Zw6BuVo+JGpEhICUOkawXUrpHYE/rVwaatwFRYYtJwNNjoSFKHtotIsx0mWmNIh+7wB2VH4yPpqOi
	bW0Qd8/uyCDEevpLJ2uaWRRpHCCFgpKGAhOawuUp+gQ+jHVbXCZcg5gYTXSiXevzACQlfRARSPwME
	B1bsTm4fUKChbiEPN1VkUxIkeEzcXqPE5/UbejrAGUUyn9NrWh1252NdD4vxSNVC8Xj5azdXih4wJ
	m25V3rGNpoqD3RJoyA86Iua0BRGCxF/g19hf5nBVXiGuRRhg+mWFDKi256k6J6o3YWvvt0wvsAKN3
	9WIdpSGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwivn-00000003m3Y-3GFU;
	Thu, 11 Sep 2025 15:09:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwivl-00000003m3O-3nEU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 15:09:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CBC3601B3;
	Thu, 11 Sep 2025 15:09:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F2FC4CEF5;
	Thu, 11 Sep 2025 15:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757603388;
	bh=gBDmezCMu/2OkI3KT860YnQjdQW9Blm0iG3vh7MOde0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fwul0kJi6q74mGU5Dqukf5JEmtODC2NkyMLIdTjXljA7qbeJj6mIM5DM6y2vBfH4d
	 suNiil4MVNnU/HJN42xo2+eNpsSS0tKlwA8yGJgwTex6OH2OHz4lZxT4ZDNFVu7hjW
	 YgRRChvuX573cN4nRIHtJsu67KZqy/UdGDAHkpWkyFJ/WwQngxIsnO2QyujxjSvd1l
	 EkXWCIL8O5IclKEzb8fUUAd2nJd9V40X/OiEqeKElYtHqbZa+hYCvB2ajZj5tgZv7j
	 j+/bMVLheV9VFI6ItJ96j1idNA4g8c3DEbf+UGyC52SycLwaMJXMfCbZGRwFo+OpUa
	 BuquWy/GxJYzg==
Date: Thu, 11 Sep 2025 16:09:42 +0100
From: Will Deacon <will@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
	ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v7 0/6] support FEAT_LSUI and apply it on futex
 atomic ops
Message-ID: <aMLmNnehYX6gqEIf@willie-the-truck>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250816151929.197589-1-yeoreum.yun@arm.com>
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

On Sat, Aug 16, 2025 at 04:19:23PM +0100, Yeoreum Yun wrote:
> Since Armv9.6, FEAT_LSUI supplies the load/store instructions for
> previleged level to access to access user memory without clearing
> PSTATE.PAN bit.
> 
> This patchset support FEAT_LSUI and applies in futex atomic operation
> where can replace from ldxr/stlxr pair implmentation with clearing
> PSTATE.PAN bit to correspondant load/store unprevileged atomic operation
> without clearing PSTATE.PAN bit.
> 
> (Sorry, I've sent wrongly for patch version 7 and resend it.
>  Again, sorry for mail-boom).

I tried to review this but I can't find any details about FEAT_LSUI in
the latest Arm ARM. Where should I be looking for the architecture spec?

Will

