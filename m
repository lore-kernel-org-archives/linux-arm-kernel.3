Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EAC5CCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 09:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rPr3C8MPAG0KuWxSSS7iUR1OVZK1Y00np5V5F5knBiI=; b=HvT2igTNeCnTkjfYLsqfZ8whJC
	yOTtcq2YuYDHy3YVLD9b3cYF9evIFsSh2C6nzQIv2zvpGvsS5GH86j9AkswLU7mmNnHR/ibaeVslq
	PCUMQ40N2r4CZmc4ByHY702Hsj+Ec6/l9llb+IK+r0P3HAkcUFgMjvSvs1IGYauDZUzrKdsBJ4L98
	VeBStbqU6CbE+rqKMnjloO/lq0LDIj+97e56cj6OnJap9KZsxm9hSe9QskeaLUOXx8ZKSKXXunPYh
	LGQ9KDq+27vahDnBHQ/wTjRiGqhL0HPitygbgZnRbW0XCHyLFbn4D8fadWhpIYUA//9oe4rgIiSt4
	O1rbMxWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPOL-00000003uLP-2CfO;
	Thu, 30 Oct 2025 09:56:25 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEPOF-00000003uIf-3kEE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 09:56:21 +0000
Date: Thu, 30 Oct 2025 10:56:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761818176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rPr3C8MPAG0KuWxSSS7iUR1OVZK1Y00np5V5F5knBiI=;
	b=2RJT8VxYwMSo4k+Yh5D26jbLB9gwIoIKFJ+SPes0NxkcrU9atRcM+MjbMQpA0Fxp3VN1qb
	XsOh0cxBd4KDVR7HE8U1ylCzdce6tA8VzKn7YtyyxA4LVxyTI3al+q8C/1O46duS7nMye7
	tBUPxKAfXQAUz3g3br7cMoWxN16XHV1kpRwE4aa1Ml22CcWBEbQSCjFSoAqSQEMtjjmBTp
	B5aLfEdm8ljk1UJ3cjCQNCxmkT4uR8NngGyar1xxjwGPWG3KZ7S3K/rBrIEVjx7DiG+t+j
	OhAMI0/VItQuI1Q3n6p+SWnUKIgNqpNRZcEe/NkKyi7FAJCH5JOwXaJQMWlVng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761818176;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rPr3C8MPAG0KuWxSSS7iUR1OVZK1Y00np5V5F5knBiI=;
	b=lY2xibEsqFq2SKol75sefz3hqNB0vVoec3X+AGGU8q8+1r4knzPfmmBkfiNsxen1sXbjzs
	Uroc34JPUgcGtQAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Xie Yuanbin <xieyuanbin1@huawei.com>, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev, linux@armlinux.org.uk,
	tglx@linutronix.de
Subject: Re: [PATCH 4/5] ARM: Disable jump-label on PREEMPT_RT.
Message-ID: <20251030095615.ae7bck5m@linutronix.de>
References: <20251030072339.63vdFNo3@linutronix.de>
 <20251030074507.33863-1-xieyuanbin1@huawei.com>
 <20251030075558.sUBj8_6U@linutronix.de>
 <20251030054626.7a897b29@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251030054626.7a897b29@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_025620_127278_059C879F 
X-CRM114-Status: GOOD (  16.21  )
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

On 2025-10-30 05:46:26 [-0400], Steven Rostedt wrote:
> On Thu, 30 Oct 2025 08:55:58 +0100
> Sebastian Andrzej Siewior <bigeasy@linutronix.de> wrote:
> 
> > You can't really control when jump labels are enabled/ disabled. For
> > instance this happens if you enable/ disable trace points.
> > Arm64 and X86 replaced the stop_machine() logic with something else that
> > does not affect latency in that magnitude. If Arm could something
> > similar then fine but until then I don't see a way around it.
> > There are other things that are disabled on PREEMPT_RT due to latency
> > reasons such as transparent huge pages or expedited RCU.
> 
> But transparent huge pages and expedited RCU are not user controlled events.
> 
> Enabling function tracing was known to cause huge latency for a very long
> time and it came from the PREEMPT_RT patch set. Heck, printk use to as well ;-)

trace events were an example and this is used to enable tracing in
production or development to gather information if something is not
working right _or_ on the edge to investigate. A latency spike at this
point would be a timing violation forcing the system into a safe state
an so not allowing further investigations.

I hope I made it clear that using jump-labels at this point is not
doable at this point and a warning does not improve things. Improving
the implementation on ARM as it has been done on ARM64 or X86 is how I
would compare the situation to printk. Not adding a warning at boot
time.

> -- Steve

Sebastian

