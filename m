Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4DA8D46C01
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 00:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8/YJY6o18MbkcPs6Gum3LlPmIJrHry5deh3CowhHd7I=; b=JcU0BJEPdZ+DZpqPPgfJIfiEFr
	UELbfVeDvll8wGDMAMwT8J/1Uw0MxCc+D7N+Wmt8u0C+buKKXelwadZhn+pTKia2VSY2yVay2vu0I
	J6EJOPWVMS4Dndn1rR3Vt17UFLrSjyDjy1zkaqceR4MENPFOe+YvVH4gH7oxDlEPfWppr6DWYjbIn
	GKtxTMAffJH3NNefwOha4rFC/OpbQn5U78rLi1TzfAGfllMPBj0X1Mo8j0HYle/kmUbwnASCD1AqG
	bbL1BzG1wsz0BB5pZgkI7WNSGLyuNHtf5z1ZOoRyp981MMPshJvFkm5sO6/McBXQUH1m1hhpei9N0
	bmXQdEQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFtA-0000000GyhF-09wd;
	Thu, 29 Jan 2026 00:28:00 +0000
Received: from smtprelay0016.hostedemail.com ([216.40.44.16] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFt6-0000000Gyg5-05cF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 00:27:59 +0000
Received: from omf04.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id DE4D71B149E;
	Thu, 29 Jan 2026 00:27:53 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf04.hostedemail.com (Postfix) with ESMTPA id 6AC482002B;
	Thu, 29 Jan 2026 00:27:50 +0000 (UTC)
Date: Wed, 28 Jan 2026 19:28:00 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 10/30] tracing: Add events/ root files to trace
 remotes
Message-ID: <20260128192800.409ec6ab@gandalf.local.home>
In-Reply-To: <20260126104419.1649811-11-vdonnefort@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
	<20260126104419.1649811-11-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: 6AC482002B
X-Stat-Signature: d56eazhnzchtmr5apwfo1hw6zon5ix9p
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18rEWWb0ZDp69MvLdiK2KcNAtsch65RVjc=
X-HE-Tag: 1769646470-745762
X-HE-Meta: U2FsdGVkX1/rWDycGaLfdk0c9iaKzyedIZG4k2BKj5NVhUuCHcUKQHGmZhJvTRHSbUN5/Ux/1C0mKiNeONsSGzV9Bh5l9sZ5+Hmtc1ytkZ6J9ALOY+p92RqmWLkTxdBLqdqhWAEH5PjxNG3o60y8n31CgWHskdEDQV6CEB0icw9ANR2QxtrAOYaXD9CWzei/L9Qhmb1KYFBNFSz98KvpdqSRV73q5s8HTJquUgVYW0HVmx9OtJjmll+H8XzyVXIBtKprfrzDlar5v/ncgJ8u0TQdjKbTfNOIwzdALrpEpSJ5ky5+Eypt0Rz5yPaekF9zU5wX/48C+Oxpxz39aDLbuXzcCB/IgHsfjyb4EKLHnm6vgSzSu1E9JB409B4xPztCse2VCOoOA7kyB3Kfymgihw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_162758_279308_91A22883 
X-CRM114-Status: UNSURE (   7.99  )
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

On Mon, 26 Jan 2026 10:43:59 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> Just like for the kernel events directory, add 'enable', 'header_page'
> and 'header_event' at the root of the trace remote events/ directory.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

