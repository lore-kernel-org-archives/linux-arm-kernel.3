Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D41F7CD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 06:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+oQO7RLNuJDf4qUq9ZXkKu2kJNnmahDIWX+FfPHgIE=; b=fPtheLaH/UvKlcc5b41I9QsE/r
	ObuBf6HpFajVpWfMDkFP7t9QA5givudHHwsgju06fldd9+BNe98CmXUiYKj2S+bUqSqsGyCn1FyFe
	oHm3d2NUFg6VlhVNbG+fAy+3QuAaVcRuT/mkfdJvUpjAHVyiUh02aOjiep3oAvoPhMs3rpZG9GAgO
	/G+QWEBi1aLQHLJ7H+mQSPuJSWsv8eX2sd31Yjr/jsC4FFTmPcUyrTZKkmVwQPI8H3QSrVZtyeGJz
	6jjg7OE8CPkvb/0P9+b4mcwaq4+Zf19GMIRfh2CXfH2ziH5P4633ySG8WhE34TgmHSg00wGYRgQge
	V8B4ZAHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPaHP-00000003dm1-0ioj;
	Wed, 20 May 2026 06:19:43 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPaHL-00000003dkJ-0eUD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 06:19:42 +0000
Date: Wed, 20 May 2026 08:19:20 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1779257962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y+oQO7RLNuJDf4qUq9ZXkKu2kJNnmahDIWX+FfPHgIE=;
	b=P6+oqLlL4bnQTSu2n0zKK01Ew7ScsATyYZvIYVSe7ttHWoUMDq8DN68cf29PQU8Dq5HIiI
	lpSMQlDfJsnMzzx0r14lx9+E5PN8eqKBM3Kn3SfaSrLMJ6tVurPphfqFWW5s8Hvc1cBZfB
	U2KQVsG9AKP1zrqc6C3guqgeHrz+ncPTf14QOWQbwTbrSl3RnZJSLszx/+LCXgZaPendB2
	AuUoBugOIKV4ZbtALNiu8WcYxlvIn23LgeN0fjb/uYDcToCfPBV6vt9G1AGJqMB1qIp0ni
	eZSIx0RYgIH0TGCn5LiuN74oVABVWLe9v8FukHDFoWfGE/NtO0tfjMuS2WdwUw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1779257962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y+oQO7RLNuJDf4qUq9ZXkKu2kJNnmahDIWX+FfPHgIE=;
	b=m4pxxi/41Ii8jM6hXoGv89KCZT+zmgpcacIXgXgpsf5uav74mKO2geuwbKby8RWX+wkAms
	orxgFruU8Al/CoAw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Waiman Long <longman@redhat.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] arm64/entry: Don't disable preemption in
 debug_exception_enter() with RT kernel
Message-ID: <20260520061920.XCqBHe0x@linutronix.de>
References: <20260519222524.886454-1-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260519222524.886454-1-longman@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_231940_266787_36065359 
X-CRM114-Status: UNSURE (   6.57  )
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

On 2026-05-19 18:25:24 [-0400], Waiman Long wrote:
> Commit d8bb6718c4db ("arm64: Make debug exception handlers visible from
> RCU") introduces debug_exception_enter() and debug_exception_exit()
> where preemption is explicitly disabled. With a PREEMPT_RT debug kernel,
> the following bug report can happen.
=E2=80=A6

What kernel is this? I have backport (which is being tested) for v6.6
and v6.12, the patches are from v6.17-rc1.

Sebastian

