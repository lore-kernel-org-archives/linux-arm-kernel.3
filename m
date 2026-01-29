Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BA5D73E80
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4eeDZYqedG6a//apNfRq8r2MY+Q3O5UivFyaO8WY8pk=; b=OVn0clyD3Gbm3AYsP/prb9wghr
	ROJ4UFiYOShcNwGbNwCqNNj51rQlCHbMRrlsaegzU1EhCQ6VxZvoN7PZX4vBBUlVvlQuUFOXnlYYm
	9vg3hEeVKSRffPzU6y1c3wh3oiD8ypi0YZP28HrZSPz8pOiyk8wwJpg/CB09YmsdEFb8bxa5KopCN
	DMq459C8gMIjgd0BvdbWKMJuG5SMzQZ2HBGAMGSDCTJIBGUNlaZDEEWISaNaD8rKiHjg8B3l5pun6
	NCkYXVVboqV+Jpy7XMFWbgNC47yRQIoRM/xAejElA8fvf7mTt9IzHkqXULNJRfn4lw7O/m05gRFSy
	rXDYOG5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVxY-00000000Rzo-1skR;
	Thu, 29 Jan 2026 17:37:36 +0000
Received: from smtprelay0017.hostedemail.com ([216.40.44.17] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVxW-00000000RzG-0sxP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:37:35 +0000
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id AE01A139C2F;
	Thu, 29 Jan 2026 17:37:30 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id 5AA6F20023;
	Thu, 29 Jan 2026 17:37:27 +0000 (UTC)
Date: Thu, 29 Jan 2026 12:37:39 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 00/30] Tracefs support for pKVM
Message-ID: <20260129123739.3c00155b@gandalf.local.home>
In-Reply-To: <20260126104419.1649811-1-vdonnefort@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: i3e386p3enc1g8khetg7zqh98gwfm6e5
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: 5AA6F20023
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX185SGLFWxWIIlWNPuU6R/rO9OX07ZYyhBY=
X-HE-Tag: 1769708247-604006
X-HE-Meta: U2FsdGVkX198IRJKBSNSZOodhqNxXkheSfTthyLQw7U19dwAdwvMwpStvYWEa4sQ8Yvve+aOpKxKCVCiuCa2tjJahjSjiQ8QCncyJ4OPNR8ui/MoeIz16e93DG1M8yodziKTBffwGLWLWlqCkyvZqe4m2P7tXhHMaPH871jux+BHugFnpaCMcj1dsFqjDHJ42WhPZFSey+iKvbBWKbLFnf9f4thildlYt7Gu9oH50rV3mRjkiDuebl12UfMQER311199ZIhINQcMOMVBqjq3jia+IfaUndGgTtHcyW7+apjJflVQOLLCq8pxYnN9Ju5VaPmzs5sso7DYmlF3/Pq437jzz5utuaCa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_093734_313145_70C7778F 
X-CRM114-Status: UNSURE (   9.91  )
X-CRM114-Notice: Please train this message.
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

Hi Vincent,

I finished my review. I replied to every patch (before the KVM ones) and
either made comments or added a Reviewed-by tag.

When you send the next version, if you don't modify one of the patches I
replied with a RB tag, add the tag to the patch and it will let me know I
don't need to look at it again.

You can use b4 or download the series from here[1] and it will automatically
add the tags for you. Just create a new branch and apply the download via
git am and work from there.

Thanks,

-- Steve

[1] https://patchwork.kernel.org/series/1047043/mbox/

