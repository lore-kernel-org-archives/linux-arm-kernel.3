Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9530C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 13:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HARc2n7GY/N2x7f6bMrbNdeynxw6URCRU7fKnVfDbzM=; b=VM2+QkFb4uJid2BKSi1Qq3uy1P
	prq4soevGmEK5v/Dre5WP7n2YgXKIlh3zdtA44Nfl9CaxUHcQqTk15Y2jIiqeEQ/5klfSGwjUuIrR
	o4zwnWAzfUUWYjiTOSPcYEggrYc2hRUNXuvuppbj9+rqK6iJK3eG3pju3UfNtFfmMxX7dm9qL51g6
	13Q/AJiTJpbmc42Fn9GvBqOXC1XuoMsW5ZSLYwwCFbSH+hCCyjUP4PISjJKztlhhbcMtiDo8wXZc1
	VR15mQQaRDnPAnY4Wih3Jou1HINOwzkMqdODfPcBubFh2f0Ndghn1aKcnobVKkpZMGQoVB4SJR70G
	bS+LybfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51YW-0000000GmQj-3fO3;
	Fri, 11 Sep 2026 13:44:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x51YM-0000000GmLj-2qMq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 13:44:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 70E844012D;
	Fri, 11 Sep 2026 13:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C401F00898;
	Fri, 11 Sep 2026 13:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789134270;
	bh=HARc2n7GY/N2x7f6bMrbNdeynxw6URCRU7fKnVfDbzM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bzP+UXvxG2EhT8V8HiCrLslfuzjCQ96o7LbZhH50LxPHnZM0mX9WM89UFWzci3Gtr
	 cDgE4isxrzSMIQTaiR+/hYgAi6u9unyvYgGSg8Z+z976pJmATUH59IfUIc5sc2J1aG
	 E+lAM+HZotrtgmhUpL/AzX3gRYN+zS8KC8WGclbCe7c13SUflENJgEH5xpXGu6AdOj
	 rtq1yaBEPE0Y20E+GKBW8hVnkQ/PXQClUL9twZ21MmKhy8ONtqqWA9VB9n1CRdmdRo
	 RuPNPQBhCgfDPmsVDSUXYUSMLZlgoFRiaReDciVay/GejvV56HiAzMW9XYz2o2YA3y
	 S9pMUVpZlEAMg==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Huth <thuth@redhat.com>
Cc: mark.rutland@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kselftest/arm64: Fix size of thread_data values for pthread_join()
Date: Fri, 11 Sep 2026 14:44:11 +0100
Message-ID: <178913088317.2458205.17622266384307064211.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260909155707.161121-1-thuth@redhat.com>
References: <20260909155707.161121-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Wed, 09 Sep 2026 17:57:07 +0200, Thomas Huth wrote:
> pthread_join() stores the thread's return value (a "void *", i.e.
> 8 bytes on 64 bit computers) into the address that is passed as second
> parameter. However, the entries of thread_data are only normal "int"s,
> i.e. only 4 bytes. The additional 4 bytes of the return value clobber
> whatever is adjacent on the stack, i.e. other members of the thread_data
> array (which will be re-written in the next iteration of the for-loop,
> so that nobody noticed this problem), or another other local variable
> on the stack for the last iteration. Use "intptr_t" to declare the
> thread_data array entries with the correct size.
> 
> [...]

Applied to arm64 (for-next/fixes), thanks!

[1/1] kselftest/arm64: Fix size of thread_data values for pthread_join()
      https://git.kernel.org/arm64/c/3d1ba5cbfb62

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

