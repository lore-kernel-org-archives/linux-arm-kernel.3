Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6D25C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 14:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIbrDqfRfXUnfKDfVIMV9oKurLdvBqc15gjqf1+FoWU=; b=MqixJVl7xZZB/GNUWJPbARYCKl
	9BdL/hrfr7pmZ2D08+vEm0KWzMGs56ZHTt7h2/DT02p+JyzU2KYR9wAW9YicFb8wWuGyYIFFtt27l
	koKLOrzHlzwENRIs3YSgi3bd9iJbRQHH/4F6kaEXldVu6ee/6SVRB31mIOssA35/GzABU4m/Sj6vr
	3HUso8kKsTHyMIRdo91UqzSSV1NinbRQYzbmWHXjcfOWPOF6RzY9hSpfDYztaloB49RjNjlxZERrX
	4eXDioJuBAzo/aiVM4rwl7rTb5sXHdsUQ7FYE1YWHkc0V9pPlHw7W4NGFJ3enYza9T1JXzIqi4vru
	rJN/wEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2Yi-00000000zdf-2YgB;
	Thu, 08 May 2025 14:49:12 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD1s9-00000000r0b-2gNP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 14:05:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CB0355C5F6B;
	Thu,  8 May 2025 14:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113B4C4CEE7;
	Thu,  8 May 2025 14:05:10 +0000 (UTC)
Date: Thu, 8 May 2025 10:05:23 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 01/24] ring-buffer: Introduce ring-buffer remotes
Message-ID: <20250508100523.750dfbaa@gandalf.local.home>
In-Reply-To: <aBx1EBa6QFH7dmqs@google.com>
References: <20250506164820.515876-1-vdonnefort@google.com>
	<20250506164820.515876-2-vdonnefort@google.com>
	<20250507194722.263a8d1e@gandalf.local.home>
	<aBx1EBa6QFH7dmqs@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_070513_721891_8223E00B 
X-CRM114-Status: GOOD (  13.68  )
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

On Thu, 8 May 2025 10:10:40 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:

> > Hmm, I wonder if this would be worth adding to the user interface?  
> 
> Would trace-cmd have any use for those fields? That said, even if it does not at
> the moment, it would mean the meta-page has a single version between
> kern/user-space and hyp/kern which is probably better?

I was thinking that it's better to have the consistency than user space
using it. I'm not sure how much overhead it has for the normal buffer to
update those fields.

-- Steve

