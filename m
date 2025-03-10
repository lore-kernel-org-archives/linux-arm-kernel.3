Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D05FCC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 16:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wvmdDKCoDaEru8Dl5f0QNShdKE18WMOAWrVkw03H/mM=; b=whV8h64RC20yRUVZqkiRcmOi+b
	aI9CCiEimrGGSbAm4/FyTKIHCM+SIP3R3oNR+WQXJDR0ERyY694ePoPgUoRLOjnu98NpN2giYiAKu
	/UFi7YN2B8GaArdybDCQvEvzzUl8+5BNZSqwej8cqYyhyBczXpCDKAoCtE3f4WRf+ssbSrZp1mFTO
	WI2hVGYbp4y1YcKnI8k9RE/9rioL6iFwD6Y7hP7AOG5LZssjGX9Acbe7cvJXCvhw2so3IjxnWKhLN
	5T/QcLN5EDlFK79AJbwHP5rgDh7PLBmYZG79q1h0ZOjX3UGrj9UrKlCaT16M6Rw7n/nFj0NQkANWJ
	amEANZcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trgG6-00000003Ny7-2pEl;
	Mon, 10 Mar 2025 16:45:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfwx-00000003LdC-0duS
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Mar 2025 16:25:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wvmdDKCoDaEru8Dl5f0QNShdKE18WMOAWrVkw03H/mM=; b=bZS+hZydiDA1XeLZPPyJu41Z7B
	YWE8c3DOqu4JcnhvEpHkQeXc7J++yxNYihSzdJ4J/AQKapI5oK8LW5fLk7OgEw5+8dyrRGFf6imDE
	4dducvRy4B5P6jp6HHeak3vynOYaEzkZod5aQNE69MyYEz/o9hW9j6R9oygBB2pqggDlYGgKXK65A
	wLnMYNEmlVbestgEpYQTkbULIMV9XwU9tfF9mxBYSCOhOXn031dcPl+enVjsbu9l71n2BM96KEryL
	6AhY5UUh/8AuM5MQX5G5j1a6rzlFQmR71hQ50mqCVxOYhmlLfU36jB0z+c6HBeUmgzuY6/4H85y9h
	0pFIhlUg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trfwu-00000001vB8-1L29
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 16:25:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 88DF45C5885;
	Mon, 10 Mar 2025 16:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B96DC4CEE5;
	Mon, 10 Mar 2025 16:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741623949;
	bh=wvmdDKCoDaEru8Dl5f0QNShdKE18WMOAWrVkw03H/mM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XkBokQ9OhC2gPVk+5VQsLxbrKnkd6hnpAJBzbrTPjTKHo9Qkv2ZlOFtBRfkWIJh79
	 439Uil74VB7VwaVNalpI156hOq2CTmlpl+36UHbs5vFrDtjRBTDQpCP/Vqc2/GOr3y
	 Vpsf7rP2BKWXM/TOEUa8lf+Pv6Q9wgECGM+SgN4bSUnQeSLHKyWYuAMFUclWD5pm+X
	 ixex9jj4Y7uLs6j7qVbMirhNG7kI0TL1i/LiNagCm7FBjMjGTlpiT3tGvboUZEyVgF
	 UaG1SY2hr7GsEdN50+QPg+BEWQD0IP8dobwL6av9eClZS+UhXHhvD3YCgjNsZ1XY9o
	 9nJh5lfAezF0w==
Date: Mon, 10 Mar 2025 17:25:41 +0100
From: Jakub Kicinski <kuba@kernel.org>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: Meghana Malladi <m-malladi@ti.com>, Richard Cochran
 <richardcochran@gmail.com>, <lokeshvutla@ti.com>, <vigneshr@ti.com>,
 <javier.carrasco.cruz@gmail.com>, <diogo.ivo@siemens.com>,
 <horms@kernel.org>, <pabeni@redhat.com>, <edumazet@google.com>,
 <davem@davemloft.net>, <andrew+netdev@lunn.ch>,
 <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srk@ti.com>, Roger Quadros
 <rogerq@kernel.org>, <danishanwar@ti.com>
Subject: Re: Plan to validate supported flags in PTP core (Was: Re: [PATCH
 net v2 0/2] Fixes for perout configuration in IEP driver)
Message-ID: <20250310172541.30896e20@kernel.org>
In-Reply-To: <f7072ca6-47a7-4278-be5d-7cbd240fcd35@intel.com>
References: <20250219062701.995955-1-m-malladi@ti.com>
	<415f755d-18a6-4c81-a1a7-b75d54a5886a@intel.com>
	<20250220172410.025b96d6@kernel.org>
	<a7e434a5-b5f6-4736-98e4-e671f88d1873@intel.com>
	<f7072ca6-47a7-4278-be5d-7cbd240fcd35@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_162552_548543_79BD6E05 
X-CRM114-Status: GOOD (  10.30  )
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

On Fri, 7 Mar 2025 15:48:27 -0800 Jacob Keller wrote:
> Would a series with individual patches for the 3 special cases + one
> patch to handle all the drivers that have no explicit flag check be
> acceptable? Or should I do individual patches for each driver and just
> break the series up? Or are we ok with just fixing this in next with the
> .supported_extts_flags change?

A mass rejection of unsupported settings feels like a net-next material
in general. Handling the more complex cases individually and the rest in
a big patch makes sense.

