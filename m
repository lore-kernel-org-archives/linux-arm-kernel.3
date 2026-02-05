Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E350EECD992
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 17:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/LS3lUGO+4ouQug6HpMqW6/fUeA8WfKFd8lz4WsKeo=; b=aDfqrsf9EEq66DEyHJbDVt/Z6+
	CNpnzuhghBRg5TtFWiMAsDi15OTOdWnDYtSLgK9eY5fEhyH2MrERw/B6flmNMs9fhFNjFsjv45VkH
	3mcLZWxe9CrCcN5V+Kqn5WMWAA+6O/IeGiLeCk2F1kmvL+O45p9RJM41+CGIPvtnx3T7KmJnHAoBd
	Zf2nGljmCJP1kR/DYaKzf+8ZWoO063WI0uc1gtgkhOLQoCNcsItaed9/gNWCzuquQgNvRAC6+oGHT
	JqifP2O3xgsr4/5JsrDDL2xMgLh583iMmPGWnRqC2ZsPwcEYlQ9nW6y8Rl4eMUPlPPKdvWF720W0W
	KcVDmGHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3Ro-0000000AK1N-3WM8;
	Thu, 05 Feb 2026 17:47:20 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3Rm-0000000AK0d-3wjU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 17:47:20 +0000
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 02A9AC22AF;
	Thu,  5 Feb 2026 17:47:15 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id 78ACD2002C;
	Thu,  5 Feb 2026 17:47:12 +0000 (UTC)
Date: Thu, 5 Feb 2026 12:47:47 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 17/30] tracing: load/unload page callbacks for
 simple_ring_buffer
Message-ID: <20260205124747.2d20e7dd@gandalf.local.home>
In-Reply-To: <20260131132848.254084-18-vdonnefort@google.com>
References: <20260131132848.254084-1-vdonnefort@google.com>
	<20260131132848.254084-18-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 78ACD2002C
X-Stat-Signature: hcgabi74er6wow3x8o97pjfpgrkmg37b
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX18+scA38KKadGgltS/q7U1r26QpHyVI9KQ=
X-HE-Tag: 1770313632-94438
X-HE-Meta: U2FsdGVkX1+D59E1RF9ThltX/RloR0giazvzIv/7B7wQmgBGSkXaUl/ZuPCQOuOIKOI+wzY9JWfvFh7G9CWgqY7vQDV9YHmkUdqOEh4iQqUa5yCGrLqmHQg/FMxyK5B4pzRA95fQMVkpP0kRtIdVBv+1dS7pkGiykDUMw4HpH0XRx2w2U9HlBr7Pct9V/8j4XGNgBkp6yTSKncEj7ZjIPCOkZhpQlfnS5Wkr771qh1QYb/a1Z/FvyQRTT6RW4VSptVyRHbDExfvKgxbQM/caL049dLajA7zBAbmpGc0jXFXUvUxqp/3yiU88cAyl1N1ezQkMki5EN/jpAGQJPmumccScBsqUD98P5DvDhTkQFe/CDt4I/CxutWKNmucMZ9T2aJqWc/7JvRKanRo6ZTza2g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_094719_041582_66A38AD6 
X-CRM114-Status: UNSURE (   8.14  )
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

On Sat, 31 Jan 2026 13:28:35 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> Add load/unload callback used for each admitted page in the ring-buffer.
> This will be later useful for the pKVM hypervisor which uses a different
> VA space and need to dynamically map/unmap the ring-buffer pages.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

