Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EEACA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 00:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5U+goY9HWQ27/P5JEY+pmtiYgDqF62fvXL6YUIqRfek=; b=RkxtFIV5TSodohLMSDHT9DxLyi
	TfJdnEIc1pzmQ3ySQSl53ccCav+li+H3vjB4JIMfbvkkdN0Rto7FGEGvCirUrXA1pTkUz31ID713/
	48iWDJ65rB2rx+Im7EvvXERd93CCUIR2t8KpC8n4VKs7vcvSeJ5u1yNs1dlXxK1dcMLEGmmSojQtV
	D8sRePvUqjq7gopl4hp56cc8/9nhB16gHd7sNqac+74v8EXWFZzTylx1aRp3mdPdh/walQTdaQMoG
	Bz8soQPGjV2o+cc3PlooYKxzyLPlXBVpa8v/q5rM1O59czmSwaob+g05ImibaBGfIRd0e1bpWhUJs
	s8YGIFmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9oc-00000007Cje-3Pcu;
	Sat, 30 Aug 2025 00:51:34 +0000
Received: from smtprelay0011.hostedemail.com ([216.40.44.11] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us7L4-00000006vri-1EPO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 22:12:55 +0000
Received: from omf12.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay01.hostedemail.com (Postfix) with ESMTP id 3F9C91DE8E3;
	Fri, 29 Aug 2025 22:12:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf12.hostedemail.com (Postfix) with ESMTPA id E18871B;
	Fri, 29 Aug 2025 22:12:48 +0000 (UTC)
Date: Fri, 29 Aug 2025 18:13:11 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Luo Gengkun <luogengkun@huaweicloud.com>, mhiramat@kernel.org,
 mathieu.desnoyers@efficios.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH] tracing: Fix tracing_marker may trigger page fault
 during preempt_disable
Message-ID: <20250829181311.079f33bf@gandalf.local.home>
In-Reply-To: <aLIFRHcsEo2e2GE7@arm.com>
References: <20250819105152.2766363-1-luogengkun@huaweicloud.com>
	<20250819135008.5f1ba00e@gandalf.local.home>
	<436e4fa7-f8c7-4c23-a28a-4e5eebe2f854@huaweicloud.com>
	<20250829082604.1e3fd06e@gandalf.local.home>
	<20250829083655.3d38d02b@gandalf.local.home>
	<aLIFRHcsEo2e2GE7@arm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: E18871B
X-Stat-Signature: c6a9kj37bdpft57yro8x4x8gytdtbg61
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+BzqdLgt0UUBPnn0bUVIRcLzHPfZXhaf8=
X-HE-Tag: 1756505568-420285
X-HE-Meta: U2FsdGVkX1+14SMITpDCqwGTTTH7u0ktZr86FlAwNfKMViAM1uVorStxHxg11gX6GdOLBRu2vlQ4xdJkmMqr/kU+y6jRplHrVO6FKm5/xCTVupKlj21B55P9/239Ph4KAg7piebRvoYzfvpmWdh73CYiF9GDVXIS6AsG36AeDl7MA11cHJx+KQl7CB05DS7uf5OeA46zbfRfB0jkQ1b9lHGdHXgPj7lT8mpIcUiLZRmDDaebBdyTa3H4A2MpDf/AhLsQ6HYnUkKrsD7DR3NW4TVog5jibbaUF6510386z0o+mr7p5el21WqVcmSS32KyBFviWF5hdcpJXO25vdTSofz/Fxy/jL39Bk/pMYZXKc1UaQsG0vIIkFErOrK6toaF
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_151254_397591_A20E01F9 
X-CRM114-Status: GOOD (  13.23  )
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

On Fri, 29 Aug 2025 20:53:40 +0100
Catalin Marinas <catalin.marinas@arm.com> wrote:
valid user address.
> 
> BTW, arm64 also bails out early in do_page_fault() if in_atomic() but I
> suspect that's not the case here.
> 
> Adding Al Viro since since he wrote a large part of uaccess.h.
> 

So, __copy_from_user_inatomic() is supposed to be called if
pagefault_disable() has already been called? If this is the case, can we
add more comments to this code? I've been using the inatomic() version this
way in preempt disabled locations since 2016.

Looks like it needs to be converted to copy_from_user_nofault().

Luo, this version of the patch looks legit, no need for a v2.

I just wanted to figure out why __copy_from_user_inatomic() wasn't atomic.
If anything, it needs to be better documented.

-- Steve

