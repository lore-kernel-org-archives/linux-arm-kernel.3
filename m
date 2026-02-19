Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 154C2E9A055
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 17:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loN6yGfmFWPlS8NpxJ32Cwf7L/pfyzuMh4Jv3SYmKVI=; b=mKYhw7eTAg2HWtgjWnOHQdxCUz
	NsBqB3Ja0oGjVG+LM9zyMHkXfn6O2xPTV2WpWgh5BW1iOjWR4TWOkGkQPCNsLd7yNyuDPVcSdcjjD
	lrcHefhw/y4vCCk0K8mfwA+pZeDTmLLX+Ap8KBWiYoi8efVMmde72rBO7YJpOaceTW6DQofD/jleU
	lHGxcQ6vEFcqNkfW6MhAnulLr5h5OorF62E+s6FtTGwCh7QUEp7ET5+Tw4ll1sN94OpHsFgxt08ro
	sLUiGYwtp1Mrx+OCXJdkt5Z4vnsf1tzE3/4rtgIVB5dzEgqHO07NHa9lDRWd7dUM1u5+A61frzQ41
	emh7S3Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8GR-0000000Bk2H-1gSP;
	Thu, 19 Feb 2026 17:56:35 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt8GO-0000000Bk1I-2Mgs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 17:56:33 +0000
Received: from omf14.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay02.hostedemail.com (Postfix) with ESMTP id 7B90813B6AC;
	Thu, 19 Feb 2026 17:56:30 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf14.hostedemail.com (Postfix) with ESMTPA id A7EC730;
	Thu, 19 Feb 2026 17:56:26 +0000 (UTC)
Date: Thu, 19 Feb 2026 12:56:32 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v12 15/30] tracing: selftests: Add trace remote tests
Message-ID: <20260219125633.61b46621@gandalf.local.home>
In-Reply-To: <20260219150307.14538-16-vdonnefort@google.com>
References: <20260219150307.14538-1-vdonnefort@google.com>
	<20260219150307.14538-16-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: A7EC730
X-Stat-Signature: y5x93jyjbxih3r5a8uoi88tic3k5dzi3
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX191EZ947KRGRihnOgbmtLmncn/2PlnjI/Q=
X-HE-Tag: 1771523786-358500
X-HE-Meta: U2FsdGVkX1/3kw1qj0Ocms5uM3wPQ/pREmBbxB19FdKcABvf1PtXK3rGfPO18dwRu14FJsjHM+XaQSE5es9jqaOx11PwyozWKss8/eUet+nh4LBUmysxPUhZmmY7Z90kiWZLVavzF0FrzrNMRJt840+JqnKkMsczxgWiIia06fxKqMbEAAlAcPfiPxyLqzSr2C0Z0kgsTgnEnB5bAwEbvSksfImlMFxIQxroCmGnbquO0JuJF/BevVXhIoeosaCJPq4En8YFIX/Av2UW8yMUwJFvZOkniRqLxKOYexR236nQQDUZyQsPjsCqeZuDgbWkIFxWetl6WwN2sTFsBG7u4x3N85IBIQ+uBL3HItTy2YTICl6KYO28syo4hcr64RDQPG9P6FbCOwLqd0fpnzLupfV62kObR84+iSn/HI2NWxAFUCsnvkuZJNrUAzNU4tzURGyzZUz1kcJ0/22sZbqCdQ+WjGR24KxqF2kU7Ps0fC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_095632_665026_F4747572 
X-CRM114-Status: UNSURE (   7.67  )
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

On Thu, 19 Feb 2026 15:02:52 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> Exercise the tracefs interface for trace remote with a set of tests to
> check:
> 
>   * loading/unloading (unloading.tc)
>   * reset (reset.tc)
>   * size changes (buffer_size.tc)
>   * consuming read (trace_pipe.tc)
>   * non-consuming read (trace.tc)
> 
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-kselftest@vger.kernel.org
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

