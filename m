Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97917D46C01
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 00:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+pblDk436sHJ0njvk9X9e5m4llKpGqHmqJjdLVA224=; b=pYwAQP6Y4LZ/R5IoXooDl5PFhL
	3+7urjN3xeHEzV5x2XzLaWQIPx/cOtFvCko6dFKBvE6j/ZagIZrHug7s0iytSyfQ2Fq/To81mlIO5
	KAXiuM/EWF6uh4KT3Bv05y+f7uJVbyCafcy4ORdKJrT9FoKjsy+EmA8EyIAecQpK8HZ4HsH7+cloh
	8jg0Ebo++IcLsdBMUWhN+thf5T4q+CjMRcz9GxJVhUorCgh6PzBiC3jih5aTYnv27+Ef3GU97avdP
	ocb84pai87yjvt9ZtfFun20PdJYJ4zqBtdxmO5sZmNIq84Nhtc6ZAOK2eDOG/505VAZ7p42kTKxgu
	hXJIdmxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFr9-0000000GyAS-2eAl;
	Thu, 29 Jan 2026 00:25:55 +0000
Received: from smtprelay0014.hostedemail.com ([216.40.44.14] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlFr5-0000000GyA3-02rF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 00:25:52 +0000
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 7892F8993C;
	Thu, 29 Jan 2026 00:25:46 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf13.hostedemail.com (Postfix) with ESMTPA id D35942000D;
	Thu, 29 Jan 2026 00:25:42 +0000 (UTC)
Date: Wed, 28 Jan 2026 19:25:52 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 01/30] ring-buffer: Add page statistics to the
 meta-page
Message-ID: <20260128192552.4412c237@gandalf.local.home>
In-Reply-To: <20260126104419.1649811-2-vdonnefort@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
	<20260126104419.1649811-2-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: fudyp3u68omqjtrjwctued9i7d45kszb
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: D35942000D
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+Vb56e76rRVvcfu17HINZb47lehiLr1pU=
X-HE-Tag: 1769646342-895400
X-HE-Meta: U2FsdGVkX19JBi9xRS5aP0vJ4+vPJDTT+uwueSCUhMwDCfiNNtLUx0bg5BBggBzmvytIjc8pmbfeH+eXko+zuvQTqD/UhiZjiYg0MKYwG8BQz4h1hoUPtmt0HzUOAC/wetsqCfSLgImrTwJx7/XNIvnFL2W94oyAvRXPxhLUyEBf0DaSauYlljdMuwPHe+wRBfDnWhuSOD5bLH6Kzr9okdLX84HcYFbc3Vs+pc296UnuxWy8uBXbITlhn7Q1TK9cwMEKNOuGg56yT5hjXE6cZQpr1B+b0SRSougPBIM4DE05oUY8u6vlJR6/L0iiWNWi9ZDSB3wa+0l5JJ6nCHCEBBMvbISQ3iHM2x1YRHbKArVhkcvDD6bnlvxcfiUXvw/rNZH7wA65EQMTNVRBVBuDcQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_162551_113387_B24E10EA 
X-CRM114-Status: UNSURE (   8.07  )
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

On Mon, 26 Jan 2026 10:43:50 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> Add two fields pages_touched and pages_lost to the ring-buffer
> meta-page. Those fields are useful to get the number of used pages in
> the ring-buffer.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

