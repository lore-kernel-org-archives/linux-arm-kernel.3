Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB6DC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 14:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SXuWvCMPHuA58AjXtFE+LgWsCi3knhvI6g6+wWexqKo=; b=mL+6l+pCLNl+sQPWdlF421Y1ZO
	mpnvTmXJDnke63C18jx8pqfyq+IWj4ZuJEJFLyejmwn0Im2S9VRoxmvKGUShM6rXMDQokVvrJrHMQ
	d3UdpO2UkPV3qx6lw+pyWZoIfcS5wC6pbYwefT79IRQ4w1n4CSGUZKpiAReyKh3wIc1lY6H8l3Du8
	H1oMEle8su/Sm4XP5g3TQnBiOgFIdq8ofAinWCte7UpRvzzNOUf8h3aTq7aegCNW0xirFvGHGaXUC
	P4IRQ7OA+SAb5weLuIbkwoPdabP7EaJWIpvXvwIEgo9s0km1/YD8dVqJk5QsRm5N434ZOd1UUvici
	X07JsYdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrG1P-000000024CZ-33Ks;
	Tue, 04 Aug 2026 14:21:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrG1O-000000024CL-1uL6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 14:21:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE3A560A83;
	Tue,  4 Aug 2026 14:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B384E1F000E9;
	Tue,  4 Aug 2026 14:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785853293;
	bh=SXuWvCMPHuA58AjXtFE+LgWsCi3knhvI6g6+wWexqKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MxMkUlSEMSyl400fcanujca9MerVDMrD+X4oLiAd/6QakFTQntELana5HEO7gRi5t
	 XPEM85RdN1R3ZTnD/xvim7V6SOf2UZqnnggSVctyn4EfUhZzpcfNfStR3eD3uDNTo8
	 zMkbXlqd0+y59qG8qIzuHUI3csXqxDbSUIxGMUISLjL5ypbS7U0qJYx/hWBt6tcl9F
	 ulIR9jO+8mNGR9T1zgyBFYI0PJA8q6N6vzOrhfDLY9YhGXFv5LFCK82qWijBGNJ67L
	 fwuAB44t/3WlDi1dO/cxpa3c87H044QW4vqNNJyx1/Gy9bQC24JrJ1nkmHOJt188el
	 jjGOjgbxXcdGw==
Date: Tue, 4 Aug 2026 15:21:14 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>, 
	Mark Rutland <mark.rutland@arm.com>, Yang Shi <yang@os.amperecomputing.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org, tj@kernel.org, urezki@gmail.com, 
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org, hca@linux.ibm.com, 
	gor@linux.ibm.com, agordeev@linux.ibm.com, linux-mm@kvack.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
Message-ID: <anH1CgpwS3PHeDRq@lucifer>
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
 <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com>
 <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
 <amCPBrdltFSE_fEf@J2N7QTR9R3>
 <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org>
 <anHuLy52o5S9Nlwp@lucifer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anHuLy52o5S9Nlwp@lucifer>
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

On Tue, Aug 04, 2026 at 03:15:03PM +0100, Lorenzo Stoakes (ARM) wrote:
> Since this work seems to be very much arm64-focused, perhaps it's therefore
> worth looking at an alterative solution that's specific to the arch, like the
> one suggested by Mark ([1])?

Oh I hadn't realised Mark had already posted the series here:

https://lore.kernel.org/all/20260728123859.2911495-1-mark.rutland@arm.com/

> [1]:https://lore.kernel.org/linux-arm-kernel/al_DpFJFcmVhxpvW@J2N7QTR9R3/

--
Cheers, Lorenzo

