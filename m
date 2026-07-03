Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D4D3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 07:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VYkuNdTognQIs2j+ybtTEz5f3IFZB3kjG5rBVAxVSaM=; b=IyNM+wrTimFwFNlBGUzIr17+xz
	fQrVDLSvcpb88OGq7+1T1T9CCE3yNqPN9dKxa3qxSlutYWfR7ozVN0XcfkqComw6YS3GHiVNUO2R8
	d106sJ77k/s7zE4kU1kSglPpxcy5iYLoPgoWzXR1KSiCEnFgR74FEKho5OjEUyETECoC5j6wZK2Nf
	kDo5F2FgCBDiE/2PsumGIu2wByOTVlP/ukG7IxlLoBWhYD0WkJbK4sIQ5bFEIuVlXMV1zyiycWerz
	r+9u3PZLiorkxxwNSQLj+8xXIoLDf8SHt+YfhEpYziYVLWkOvHyrIryWCHGKAiOoH/Nebf8sWQuFH
	WBOivJaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYcA-00000006IaV-1Nbc;
	Fri, 03 Jul 2026 07:47:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYc9-00000006IaI-1IUL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 07:47:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 49E8E4334D;
	Fri,  3 Jul 2026 07:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1F631F000E9;
	Fri,  3 Jul 2026 07:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783064826;
	bh=VYkuNdTognQIs2j+ybtTEz5f3IFZB3kjG5rBVAxVSaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XDQnTspIWcNXp/iZYRnAdTmyF2+BZNOIsb2B0d6w5ZGv6rTiLrS06GVstEJsx2H+z
	 Gh1WrKQnTkmAaLbBhn90LC+oQvA8JigS9iZYvP33VMNde1iU7EaEtVXwNLol/UTtPt
	 +ltMHM3ngQKV9+5hT5hsQNDTtkF8cYOpEB0mpiMlMTloJCM6PFXxMTQEzTtQakqrGP
	 /ZUEWYaHzzeVIkGuOqt8rF5dB1QjLVIGmK7KTDvxkltjk3HlzWg2CDtwyY5hFA7g53
	 Fu+TFtzYMUhDrf7FtRWTl6EGc0aqGTTRz80jpUo8QGM9zbI8bCkX00JDUwU7N4QMK7
	 9ocyd5BaU9jUg==
Date: Fri, 3 Jul 2026 08:47:01 +0100
From: Lee Jones <lee@kernel.org>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: stm32-timers: depopulate child devices on populate
 failure
Message-ID: <20260703074701.GE2108533@google.com>
References: <20260615063042.36397-1-pengpeng@iscas.ac.cn>
 <20260701214250.GD2108533@google.com>
 <20260703065016.97181-1-pengpeng@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260703065016.97181-1-pengpeng@iscas.ac.cn>
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

On Fri, 03 Jul 2026, Pengpeng Hou wrote:

> Hi Lee,
> 
> Thanks for taking a look.
> 
> I checked devm_of_platform_populate(), but I don't think it covers this
> particular failure path on its own.
> 
> devm_of_platform_populate() only installs the devres cleanup after
> of_platform_populate() has returned success.  If of_platform_populate()
> returns an error after creating some earlier children, the helper just
> frees its devres record and those partial children are not depopulated.
> 
> For stm32-timers, I think we still need the explicit ordering used by
> remove: depopulate children before stm32_timers_dma_remove().  The child
> drivers get the parent drvdata, and the PWM child can call the parent
> stm32_timers_dma_burst_read() helper, so releasing the parent DMA
> channels while partially-created children remain would keep the same
> ordering problem the remove path avoids.
> 
> I agree the inline unwind is not the clearest form.  I can send a v2
> using a normal goto unwind label and a short comment explaining the
> partial-populate case, unless you prefer a different shape.

I'm not concerned about where in the file the call sits.  Calls like
this that fail usually do so cleanly.  I think this deserves a wider
piece of work that ensures that of_platform_populate() doesn't leave
dangling resources when it fails.

Also, why doesn't every call to of_platform_populate() have this?

-- 
Lee Jones

