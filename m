Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60CB1C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 11:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oyuuH1Wtyfod3sQmeqjOasemMV+03bK4/IyWGgNrZfQ=; b=N1nGjqpUHEK4UnTUR0VtDLWljH
	Cr39F4pQE21M1/s6fluleGdDxId6Vk6Ea3MfIM3tTuXf5geQCsSyixDZGjkm0Gj9v+qGB0k9v9ruL
	x8PKeX2FLV2ezRz7klMT7GbasFxImr265I8ysxn3ApD3c73LYTcDL/PoGymvyDC0JppH++/cFOL6k
	fM9R4IKyz6m5t0XB6JqfaGXn5th1CS5ZqzPLHw5DzxUHnr8eZSdHhdRVmlmqoHQdUVwp3wtAsP+Nx
	586jN/c3o5TASNtyfDKzoxuFKLuk1Uf0/3mCiSJG2ZFz2CN8PqqB/JzPEZNxG6AxKOWLX7G4BT5iw
	Bs7u8GwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnBH-00000007u6e-3Dcy;
	Wed, 05 Mar 2025 11:44:55 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmKJ-00000007kB2-2ObI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 10:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741171809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oyuuH1Wtyfod3sQmeqjOasemMV+03bK4/IyWGgNrZfQ=;
	b=MfHQXWJsW/FseJETHpxfV0KaShSPXOR1B99Q9Jg+V4vojXXJKB5v4jVEpWKqaSzn0iB/xe
	013W3G9QHJtQwhSmDCmDGfOCR6Ygg1yuLT8HhsoKMK05ErxQv2mPXzBwooHmo+OCd4FIoD
	36trP3EhMBQKtgm6bHc8oamYARg49fc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-106-z4bOYVHsNB2mtiR9Wm03Uw-1; Wed,
 05 Mar 2025 05:49:58 -0500
X-MC-Unique: z4bOYVHsNB2mtiR9Wm03Uw-1
X-Mimecast-MFC-AGG-ID: z4bOYVHsNB2mtiR9Wm03Uw_1741171796
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 57A8D1955DCD;
	Wed,  5 Mar 2025 10:49:55 +0000 (UTC)
Received: from vschneid-thinkpadt14sgen2i.remote.csb (unknown [10.44.32.95])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CAE451954B32;
	Wed,  5 Mar 2025 10:49:48 +0000 (UTC)
From: Valentin Schneider <vschneid@redhat.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-users@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mike Galbraith <efault@gmx.de>,
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
	Juri Lelli <juri.lelli@redhat.com>,
	Phil Auld <pauld@redhat.com>
Subject: [PATCH 0/1] arm64: enable PREEMPT_LAZY
Date: Wed,  5 Mar 2025 11:49:24 +0100
Message-ID: <20250305104925.189198-1-vschneid@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_025011_682710_2B759CF1 
X-CRM114-Status: GOOD (  10.76  )
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

Hey folks,

This is a resubmission of Mark's patch [1]. I didn't end up changing anything
other than fluffing up the changelog.

I ran this under an arm64 VM, added some trace_printk's and checked that
sched_switch's between runnable hackbench threads would occurr in the right
conditions:
o with TIF_NEED_RESCHED_LAZY set
  o at the tick
  o at do_notify_resume()
o with TIF_NEED_RESCHED set  

[1]: https://lore.kernel.org/linux-rt-users/Z2B5y3HiLuRHPfdv@J2N7QTR9R3.cambridge.arm.com/

Cheers,
Valentin

Mark Rutland (1):
  arm64: enable PREEMPT_LAZY

 arch/arm64/Kconfig                   |  1 +
 arch/arm64/include/asm/thread_info.h | 16 +++++++++-------
 arch/arm64/kernel/entry-common.c     |  2 +-
 3 files changed, 11 insertions(+), 8 deletions(-)

--
2.43.0


