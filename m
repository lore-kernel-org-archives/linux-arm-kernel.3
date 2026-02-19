Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420FDE9A055
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 17:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZygTY2ica/LpTgBS/Be1mzzleUCxK7jXpmRL8krY1u4=; b=bMv50YkW7J9pWZq9VDItJd62iO
	eDJHkmKHIKMuVKs+rmryzXyunbN8i/zdezBPXjt3lapF3/GYgSdraUFSdHlfLWloV8x4LrHFNetr4
	DfnF2gHUgx+SsuXP6jPmcJ7188DRrDzcysmdWRyDbCmQDtFDvAaL5hFSXIGgo+Uq1QslCkyjrgKl6
	sBsNZpKyKbPaq8Lnj1J0gr9brw0uKtovK7cCm0F3owrce3/j0uiSc7jsfDuIw6fhUaFxphaMNHQWg
	P2ouYSBZwRr11rYLuz0Vp96PoB1EbtD+HtLB4NETM4rCgktTLxtCzJbSO6Cwc1VRu+Kxz7F+8R9Dy
	oMcnJ4cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8Fq-0000000Bjuu-0Gol;
	Thu, 19 Feb 2026 17:55:58 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8Fo-0000000BjuI-0ZgB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 17:55:57 +0000
Received: from omf13.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 193D413B6A9;
	Thu, 19 Feb 2026 17:55:53 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf13.hostedemail.com (Postfix) with ESMTPA id 9F43F20012;
	Thu, 19 Feb 2026 17:55:49 +0000 (UTC)
Date: Thu, 19 Feb 2026 12:55:55 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 07/30] tracing: Add non-consuming read to trace
 remotes
Message-ID: <20260219125555.4952101e@gandalf.local.home>
In-Reply-To: <20260219150307.14538-8-vdonnefort@google.com>
References: <20260219150307.14538-1-vdonnefort@google.com>
	<20260219150307.14538-8-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: xcebk93g9cxu4r4g13r94iuz5okyo7tu
X-Rspamd-Server: rspamout04
X-Rspamd-Queue-Id: 9F43F20012
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+ElNfWeNU4/cCv8EiXEbaqGNcsinTzoe8=
X-HE-Tag: 1771523749-420940
X-HE-Meta: U2FsdGVkX1+jCOpHILfzxNo/oKCU19ickooQWBWqnFc9VpEacNX9ws5ABGTHrB3qZu/8KfQaOB3Rub/jzcpRTSn3Z6Djz+x/LPCDTZpHF5MWB7ulHqWwGhdeU+RG7iM2oGprWeOwvjVK02xwrAbXjVP4NLDNad0zk/JqeYFkubXVJGrdIlIeCMJ6rQeLV5SiNb/+Te1m8FA+bxSd29HuamjZxnDONCFq4DlUGuUdaLgTWbFfDg8IFX9vrgfiDVcI0uZDymjXwOwWDM8dnKcOhrMlYfJVzulnMuu4HoTZOm6Z4LEQ5q3er4jTpUZK8YevPQozxeNM3kbu9PK52LNtwtbSKSfgGrabxKdKZmXpfHnRpO/tQcSKH9iKv4Y5RCBS2CZOg+bCqisqQFbLVhpEIA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_095556_239914_2402CF28 
X-CRM114-Status: UNSURE (   7.53  )
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

On Thu, 19 Feb 2026 15:02:44 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> Allow reading the trace file for trace remotes. This performs a
> non-consuming read of the trace buffer.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

