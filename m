Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C9CC3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 21:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6PkgIJPex60C+gZATQdAd/3vCD1f8TCEvg3gYXQa0Q=; b=t++mOEHFWFR6K5PSyqwhlmdpFL
	Y09qysExnsaD8WIkic0WeHwaS2hRtWix2fWURBj/kj3eKO0KbcnlWP7SqtCJ/CRnkzJoAyPDX3dOr
	ME9k5tNOI3SsHtXXZ3hJ3NK5d3RA9l5krDqJomN2drRwm6EH9lZ/f/AykeIWzneYbaQJ++BQn4oWU
	V34kgXyAEnKhw69jKUnji6CF5TNfIR9IghKhK/JGF1C2N3pIQgtdN/yVW+ODKNKo54aWQVrBuTEf8
	m7/UcrsG2LXdumvMrbzBq6ulHPivDik9mmlHKDtTUWSUleMYG6Q29dy0d221PfTU2vPYETK64OAH6
	OwcfR9bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUxk-00000004udQ-1Wqp;
	Fri, 09 May 2025 21:08:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDTnE-00000004hmk-1GVL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 19:54:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BEC9D40C2F;
	Fri,  9 May 2025 19:53:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4BE1C4CEE4;
	Fri,  9 May 2025 19:53:57 +0000 (UTC)
Date: Fri, 9 May 2025 15:54:12 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 kernel-team@android.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 08/24] ring-buffer: Expose buffer_data_page material
Message-ID: <20250509155412.03c89196@gandalf.local.home>
In-Reply-To: <20250506164820.515876-9-vdonnefort@google.com>
References: <20250506164820.515876-1-vdonnefort@google.com>
	<20250506164820.515876-9-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_125400_364339_573C6B27 
X-CRM114-Status: GOOD (  11.81  )
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

On Tue,  6 May 2025 17:48:04 +0100
Vincent Donnefort <vdonnefort@google.com> wrote:

> In preparation for allowing the write of ring-buffer compliant pages
> outside of ring_buffer.c, move buffer_data_page and timestamps
> encoding functions into the publicly available ring_buffer.h.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Let's create a new file for this instead of adding it to ring_buffer.h.
Although it's being used by remote buffers, I rather not make this
something that people may think they can access anywhere.

Perhaps: ring_buffer_types.h

with a comment stating that these are to be used by the remote ring buffers
and the ring buffer internals and should not be used directly.

-- Steve


