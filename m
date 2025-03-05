Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6E2C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 15:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SvisxEEy81f8Soxzl6LcxPAISbi6nfCZztRfmoSPzA4=; b=LcDzimskjLr/76q2ye5ByEaMMS
	QCPKOf6JeKYxcqQslferL3XvJXtTpPaNXy656Rh3h/f6TTYh0TgYW0PhVdwDe+w2cH6TBWKAtpAWQ
	FdNc5ZCNtOhQ5a1ieoeYchoyyAEeLD4ukJEHGA7cp5oCxI7syeLymUnoldUMyhQp1zOrgh4pkDp1n
	y8fn8cfbeCnUS9YzJ59XsKVaDgQzcv2cHsa0Dm9SMIdQSgxtiS1x6Ea7nXziDQKyVV28Uoxz4v2nZ
	XfuD11dn6RNfn5b7Y+87rmB4N48Gcia87w3fhRvJXhmH7XpLn/exF/kmh6uynK3QalL7Xgw7vjEEJ
	85/QQa1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqW9-00000008V9r-3F7e;
	Wed, 05 Mar 2025 15:18:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tppLN-00000008HB7-2Ohx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 14:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741183407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SvisxEEy81f8Soxzl6LcxPAISbi6nfCZztRfmoSPzA4=;
	b=S5QJ5AIRMhcg9ENX2TeU/IjJQS2CLud7bRiIiKaWRiNRMgUn696py7bJXm4mJM2xo+15tS
	s3lHoWJmYE0jPR7sHUmVhTRtugb0QSMmgA8JEJzd3l7d5zGP7UDWhChxHT7QqOmLEHg6M+
	s+GPPJocwg5I/lf+iwi2XxNMhGMSKv4=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-379-loh_HRQfNGyVhwp5Ef8Ebw-1; Wed,
 05 Mar 2025 09:03:23 -0500
X-MC-Unique: loh_HRQfNGyVhwp5Ef8Ebw-1
X-Mimecast-MFC-AGG-ID: loh_HRQfNGyVhwp5Ef8Ebw_1741183393
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 12AE01954226;
	Wed,  5 Mar 2025 14:03:13 +0000 (UTC)
Received: from pauld.westford.csb (unknown [10.22.65.55])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 686A41954B32;
	Wed,  5 Mar 2025 14:03:08 +0000 (UTC)
Date: Wed, 5 Mar 2025 09:03:05 -0500
From: Phil Auld <pauld@redhat.com>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-users@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mike Galbraith <efault@gmx.de>,
	Peter Collingbourne <pcc@google.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Kristina Martsenko <kristina.martsenko@arm.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Petr Tesarik <ptesarik@suse.com>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: Re: [PATCH 0/1] arm64: enable PREEMPT_LAZY
Message-ID: <20250305140305.GA51446@pauld.westford.csb>
References: <20250305104925.189198-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305104925.189198-1-vschneid@redhat.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_060329_678552_B9345E29 
X-CRM114-Status: GOOD (  16.54  )
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

On Wed, Mar 05, 2025 at 11:49:24AM +0100 Valentin Schneider wrote:
> Hey folks,
> 
> This is a resubmission of Mark's patch [1]. I didn't end up changing anything
> other than fluffing up the changelog.
> 
> I ran this under an arm64 VM, added some trace_printk's and checked that
> sched_switch's between runnable hackbench threads would occurr in the right
> conditions:
> o with TIF_NEED_RESCHED_LAZY set
>   o at the tick
>   o at do_notify_resume()
> o with TIF_NEED_RESCHED set  
> 
> [1]: https://lore.kernel.org/linux-rt-users/Z2B5y3HiLuRHPfdv@J2N7QTR9R3.cambridge.arm.com/
>

Thanks!  I was looking for this the other day :) 


Cheers,
Phil

> Cheers,
> Valentin
> 
> Mark Rutland (1):
>   arm64: enable PREEMPT_LAZY
> 
>  arch/arm64/Kconfig                   |  1 +
>  arch/arm64/include/asm/thread_info.h | 16 +++++++++-------
>  arch/arm64/kernel/entry-common.c     |  2 +-
>  3 files changed, 11 insertions(+), 8 deletions(-)
> 
> --
> 2.43.0
> 

-- 


