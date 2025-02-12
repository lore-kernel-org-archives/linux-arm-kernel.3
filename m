Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2610C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 18:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CjsVUAUdVujGQUiELdebsFrLy5yWUBlJmj2oZbQCURk=; b=V+Eplp/plVXopS9cJ3lkvBArbo
	EDiufG6tF2E+QHHt7H28wLpNUpfdg6iQe4IbG3GXk+UePDHx0YHPW8qKkA6vhzvgKxE4Y8vHU+T7Y
	TxTDCHALXD+8dR/hRhRp9z61hd/Pe6lPH9gcU4kpPqXe4iu1KTZ2IE71Vj7ZvI7JOdKJBu61J+k3D
	HtbNVjslM0p+p38UQXvxw5Bz1cQ5Tpchzoy9BwQtkUODbYluUYr07seEiZK2obbIkr3XSDeu9SA1X
	Ph8hkgpvDbRENkVxtrIRwbHGOYgtyBR3B+tjBYXJ5DtYETC2yvFN13cNYdHMGf6E7lo5JtuydgGzh
	v4XLKqmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHuq-00000008YbJ-1s5J;
	Wed, 12 Feb 2025 18:56:56 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiHs8-00000008Xm3-37YZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 18:54:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9A74CA410E1;
	Wed, 12 Feb 2025 18:52:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 856FEC4CEDF;
	Wed, 12 Feb 2025 18:54:06 +0000 (UTC)
Date: Wed, 12 Feb 2025 13:54:14 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>, Heiko Carstens
 <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org
Subject: Re: [PATCH v2] arm64: scripts/sorttable: Implement sorting
 mcount_loc at boot for arm64
Message-ID: <20250212135414.785e6403@gandalf.local.home>
In-Reply-To: <Z6zqHY0a5CPEaTCN@arm.com>
References: <20250211141139.03d2997e@gandalf.local.home>
	<Z6zqHY0a5CPEaTCN@arm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_105408_852404_B88F8AFE 
X-CRM114-Status: UNSURE (   8.71  )
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

On Wed, 12 Feb 2025 18:36:13 +0000
Catalin Marinas <catalin.marinas@arm.com> wrote:

> > Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>  
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Much appreciated!

> 
> (unless you want this to go in via the arm64 tree)

Nope, I have more code to add on top of this that is related to function
tracing.

Thanks!

-- Steve

