Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191C0C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 16:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVQO/etdAW8haAAARVR4LNY3kInIlCvn9+r2nwljM48=; b=EUA4owMS/8ATkPgrkti7CpNv1V
	uxlf2sc4/2yfzUFmmqYFIsIZHWgh/lCNJiSk93lwRKH02LZLTiW/6TGgqgt+c7RVl4b04afCd8r2C
	MvGcW8XD7vbISxx14WZ2Jh3qRXUBjTwRAKbZ08jZf/aGYqYDYHqmBIZEqt+5Xacal9w45ojsDDP7/
	7dyF0adglFxD44ouRwMyvdEsiqJQXmYnX7viOX2BSVWxQbNA2kvXvUbHnxA7grwsY+hRzrNYQi+N6
	zRIAlfTFjh9ZfJdgD7Jz7gUpcvOJRneoKqbQWSZPFIPD48xbz1vovw+SBVK5lo0Mdu6pxN7ioItcq
	vLpLC2Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDxP-0000000BSRU-3fjk;
	Thu, 06 Mar 2025 16:20:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqDvm-0000000BS8E-3svp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 16:18:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7A5675C20FE;
	Thu,  6 Mar 2025 16:16:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8BE4C4CEE0;
	Thu,  6 Mar 2025 16:18:40 +0000 (UTC)
Date: Thu, 6 Mar 2025 16:18:38 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, arm-scmi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [Bug report] Memory leak in scmi_device_create
Message-ID: <Z8nK3uFkspy61yjP@arm.com>
References: <Z8g8vhS9rqQ_ez48@google.com>
 <Z8iFeEWq16pNQdMa@pluto>
 <Z8mCbc2Z2QGd3f8M@google.com>
 <Z8my4MZ-In0ibxVY@arm.com>
 <Z8nDj129ZVeZBVSp@pluto>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8nDj129ZVeZBVSp@pluto>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_081843_006375_9DE4FB8C 
X-CRM114-Status: GOOD (  19.44  )
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

On Thu, Mar 06, 2025 at 03:47:27PM +0000, Cristian Marussi wrote:
> On Thu, Mar 06, 2025 at 02:36:16PM +0000, Catalin Marinas wrote:
> > This loop in scmi_device_create() looks strange:
> > 
> > 	list_for_each_entry(rdev, phead, node) {
> > 		struct scmi_device *sdev;
> > 
> > 		sdev = __scmi_device_create(np, parent,
> > 					    rdev->id_table->protocol_id,
> > 					    rdev->id_table->name);
> > 		/* Report errors and carry on... */
> > 		if (sdev)
> > 			scmi_dev = sdev;
> > 		else
> > 			pr_err("(%s) Failed to create device for protocol 0x%x (%s)\n",
> > 			       of_node_full_name(parent->of_node),
> > 			       rdev->id_table->protocol_id,
> > 			       rdev->id_table->name);
> > 	}
> > 
> > We can override scmi_dev a few times in the loop and lose the previous
> > sdev allocations. Is this intended?
> 
> Yes...it is weird..but by design I would say :P ...
> 
> ...because this is called to instantiate one single device OR instantiate at
> once all the multiple devices needed for a protocol: in this latter case it
> returns just one of the created devices to signal success or NULL if all the
> devices' creation failed....we dont need to keep the allocated devices references
> anyway here since on success those devices are now referenced and kept on the
> SCMI bus, so they can be searched/scanned/destroyed from there.

Not sure why the pointer isn't found, device_add() should link it with
the parent. Unless something else fails, the parent is freed and the
linked devices unreachable. I'm not familiar at all with this code, I
just saw kmemleak and thought of replying.

The loop is still weird, scmi_chan_setup() seems to use the pointer to
scmi_device for something more meaningful than a pass/fail check. Also
the overall result is based only on what the last __scmi_device_create()
return value was, irrespective of the previous iterations of the loop.
You do have a pr_err() but no early bailing out of the loop on failure.
I'm curious if there are any SCMI errors in the Alice's kernel log.

-- 
Catalin

