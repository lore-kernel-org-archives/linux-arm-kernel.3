Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C718CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 11:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8BoFCt0pkUBMnLRpJ4UVI49v07JwiXpXVvsRBKBXi8=; b=Aa2vGqtKwUYDLB
	PlbQKhTGnyMS4/IaV17It+VK0xfN75uKW7f40DrjEX7bJqUoJAT4shJsnTymD8msZftwfoTJfcv+o
	4d2wMgyeRyQKeJw56HFg778DhD5YFx3MhRE67c+c16WSh1T3lgArIyLG2oMlyVffw5p009emO6oK1
	IAhycIvlC44za1kJ96prmGk+YLwOo0fPeAlOiKN2lElGUCF591lgLiloaob6aNWEhA/kUPZkbHOx6
	v5fcPHBYB8XT0xQsJH9Q0GOqNDSvfUnuMKzaJCqV8JMamH5DiIxDAUIxLWeTTzULNTZZj/lhOduPX
	ecboWiPV4WSsAQa6mwnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPf1u-00000004RNN-2PTV;
	Wed, 20 May 2026 11:24:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPf1s-00000004RMa-3eDP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 11:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779276239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s8BoFCt0pkUBMnLRpJ4UVI49v07JwiXpXVvsRBKBXi8=;
	b=bB2o1a2KIFIiKwBE3Z1zsrMtasLqz0KwBy9fRFrAqi2Ai/aCXGl2GeyT+Bk1Arw3j+kRmO
	jKD8GLzHKL2pepC47Lmkj+y6HcL8OoP/DQxL13qdevP5KT2SMN44lYG4H3cwDTaSnA142r
	QBBr84BHHPNOmcp8+OI6dveyvoEDlI0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-517-J6PPBFReMm-ii0ZMEBLQ7w-1; Wed,
 20 May 2026 07:23:55 -0400
X-MC-Unique: J6PPBFReMm-ii0ZMEBLQ7w-1
X-Mimecast-MFC-AGG-ID: J6PPBFReMm-ii0ZMEBLQ7w_1779276234
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0AA031956095;
	Wed, 20 May 2026 11:23:53 +0000 (UTC)
Received: from localhost (unknown [10.22.64.8])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 4FBD630002E4;
	Wed, 20 May 2026 11:23:51 +0000 (UTC)
Date: Wed, 20 May 2026 08:23:49 -0300
From: "Luis Claudio R. Goncalves" <lgoncalv@redhat.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH] arm64/entry: Don't disable preemption in
 debug_exception_enter() with RT kernel
Message-ID: <ag2ZxTA9YR-okKrU@redhat.com>
References: <20260519222524.886454-1-longman@redhat.com>
 <20260520061920.XCqBHe0x@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20260520061920.XCqBHe0x@linutronix.de>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: J0-QtM5542ss-KKqLN2UzgWh6ZylmszNHOWr0soFoNo_1779276234
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_042400_976629_08D4C35D 
X-CRM114-Status: GOOD (  11.83  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-rt-devel@lists.linux.dev, linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, linux-arm-kernel@lists.infradead.org, Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, Clark Williams <clrkwllms@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Wed, May 20, 2026 at 08:19:20AM +0200, Sebastian Andrzej Siewior wrote:
> On 2026-05-19 18:25:24 [-0400], Waiman Long wrote:
> > Commit d8bb6718c4db ("arm64: Make debug exception handlers visible from
> > RCU") introduces debug_exception_enter() and debug_exception_exit()
> > where preemption is explicitly disabled. With a PREEMPT_RT debug kernel,
> > the following bug report can happen.
> …
> 
> What kernel is this? I have backport (which is being tested) for v6.6
> and v6.12, the patches are from v6.17-rc1.

Sebastian, hardware breakpoint and watchpoint handlers still call
debug_exception_exit() and disable preemption on aarch64. That should
happen on v7.1-rc4 indeed. The suggestion was to mimic what x86_64 does
with notify_die() -> hw_breakpoint_exceptions_notify(). In ARM
hw_breakpoint_exceptions_notify() is a stub that always returns
NOTIFY_DONE.

Luis

> Sebastian
> 
---end quoted text---


