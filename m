Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D69CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 18:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6CbIhLUvQTThdoICsMWRSSR0Iec3/FBIbVrEelyvw9w=; b=F6w8keZBjx+9Kr/f9rz0oR45Nx
	T0HYXC5YxAsvGOTQ7/rrswPWrxZ7LEmU0r7NJcrjlc+fHg+1snidd487Gwlj22IXbJ9nuBXTm6cNy
	MIjqKu6GExaJUgaK8qS7iBYZwpAAj1vU6aqYiN1gPIiBRJrL/wgpwp0Ef00dQ5uMTRKnK4x/avXTE
	LOaM5iDybAUIryqoOcWl6pSpym47Vi2DfsDIDdLrs/hjgxyPYWZTjBKU9xrUqAsEob/ovVD/1LDpy
	ekC2p1zZOgxeY+cR9coh/IBGTOjKb5ivlnXA9fDy14pVuSYPSjIG6asefuK/UO1U4KK7X06W6hylE
	FYCpxoFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw3Rd-00000009XVN-2o26;
	Tue, 09 Sep 2025 18:51:57 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw3Rb-00000009XUA-1KP5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 18:51:56 +0000
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay07.hostedemail.com (Postfix) with ESMTP id F2317160720;
	Tue,  9 Sep 2025 18:51:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf13.hostedemail.com (Postfix) with ESMTPA id 7B67F20012;
	Tue,  9 Sep 2025 18:51:48 +0000 (UTC)
Date: Tue, 9 Sep 2025 14:52:36 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 04/24] tracing: Add reset to trace remotes
Message-ID: <20250909145236.69192cd0@gandalf.local.home>
In-Reply-To: <20250909143948.420bfb1c@gandalf.local.home>
References: <20250821081412.1008261-1-vdonnefort@google.com>
	<20250821081412.1008261-5-vdonnefort@google.com>
	<20250908193757.079aae76@gandalf.local.home>
	<aMAZMaZJ1_Eny5Ku@google.com>
	<20250909094028.3265b751@gandalf.local.home>
	<aMBSa29ev0BNgr5R@google.com>
	<20250909143948.420bfb1c@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 7B67F20012
X-Stat-Signature: 6jcmoe7kyeoer8m9umxo4ko1reffbtxx
X-Rspamd-Server: rspamout02
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/Tp3xCEgkAFI9W9nCgXIN17UPOUbr/RZU=
X-HE-Tag: 1757443908-581386
X-HE-Meta: U2FsdGVkX19lVud6y51xD4pMo2ZnzH0+UrCZC4hG0ICafd9IutkjFFOMtBXudM1zmBAVN/ESckwodi3a29EU01Len6FKTmVk2tjNG99glyZ+QI696mxRxOxD2bUPYF12N/hHUtbTx6vVRZCXpWAb/7xweUx089qM/JRxCOCfk1eA4id+quq9lOrlkLW9+L2+dle6GSfGoW9IwFgYvjLbC4ZtzLIlYJA3uH0qIqcJwJqThsDREqcMQCssMntZzpGq5l0GJHyAy7fi4dCWAcWK8H91UnGqFFzUOmr9Yo/BbOFYTy3NVlTEEx5rX1M42WuDEufQlOM1JvbO1zjYLsvHPI6FqzaraTfe2/fIxIwCHJC+xQ9246RoD9BVWgA5Vh6t
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_115155_416548_9B36E714 
X-CRM114-Status: GOOD (  16.81  )
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

On Tue, 9 Sep 2025 14:39:48 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> But anyway, I think it should work for the remote buffers too. Let me go
> and fix the current iterator.

I thought it was broken but it isn't ;-) I did it properly, I just didn't
look deep enough.

So yeah, look at the rb_iter_head_event() code. The ring buffer iterator
has a copy of the event. It has:

	if ((iter->head + length) > commit || length > iter->event_size)
		/* Writer corrupted the read? */
		goto reset;

	memcpy(iter->event, event, length);
	/*
	 * If the page stamp is still the same after this rmb() then the
	 * event was safely copied without the writer entering the page.
	 */
	smp_rmb();

	/* Make sure the page didn't change since we read this */
	if (iter->page_stamp != iter_head_page->page->time_stamp ||
	    commit > rb_page_commit(iter_head_page))
		goto reset;

It first checks before copying that the data it's about to copy hasn't been
touched by the writer.

It then copies the event into the iter->event temp buffer.

Then it checks again that the data hasn't been touched. If it has, then
consider the data corrupt and end the iteration. This is how the "trace"
file works. I believe you could do the same for the remote code.

If we are gonna keep the "trace" file, let's make sure it's fully
implemented.

-- Steve

