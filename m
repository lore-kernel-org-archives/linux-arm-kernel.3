Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4485C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 17:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MgMZfjHtJWGskJ7iDZWmY8Oed8R/GMs4VyOX/TuiH1U=; b=YA78ha05hkBqHFtaJL74ujIhOA
	oxmGzoceGuC3j4QlfSjpreSrd5yiW3cq3VRYCwsEX3v22SurmFWbRy6ftfos1yK/f0Dn2Ai5S8rS1
	pZKGTooFIOSbfxMrKJvuwSio7vkpyZqKFIsq0bR37yiLOLazPwxnmdYmM5Popyp2xGLST29z0e25g
	C/RxJC5QCGajwBwzJGjjxDRY5h0kkRfkn3O3xs+MItb+/Ymey2SGWR9tPA0GW4DmeVG6qJ0GHBITl
	AtN6vEzaWlY1TiJJu7dVMG7MmmKAf8e14A2pZ533saQHk9pbIbv+0V1+XpeNZPDR5A3rF1oLZVcsu
	gGOEqdLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2BH6-00000000HWn-2aJo;
	Thu, 03 Sep 2026 17:30:56 +0000
Received: from smtprelay0012.hostedemail.com ([216.40.44.12] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2BH4-00000000HWE-0Lyq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 17:30:55 +0000
Received: from omf15.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay06.hostedemail.com (Postfix) with ESMTP id 3D481A4684;
	Thu,  3 Sep 2026 17:30:48 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf15.hostedemail.com (Postfix) with ESMTPA id 362BB1B;
	Thu,  3 Sep 2026 17:30:43 +0000 (UTC)
Date: Thu, 3 Sep 2026 13:31:46 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Russell King <linux@armlinux.org.uk>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev, linux-perf-users@vger.kernel.org,
 loongarch@lists.linux.dev, Mark Rutland <mark.rutland@arm.com>, Ian Rogers
 <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, "Luis Claudio
 R. Goncalves" <lgoncalv@redhat.com>, Catalin Marinas
 <catalin.marinas@arm.com>, James Clark <james.clark@linaro.org>, Huacai
 Chen <chenhuacai@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, Oleg
 Nesterov <oleg@redhat.com>, Alexander Shishkin
 <alexander.shishkin@linux.intel.com>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Waiman Long <longman@redhat.com>, WANG
 Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Clark Williams
 <clrkwllms@kernel.org>
Subject: Re: [PATCH v2] ARM, ARM64, LONGARCH: Delay HW BP notification to
 task_work()
Message-ID: <20260903133146.07095885@gandalf.local.home>
In-Reply-To: <apmknG55qFAn8EPf@shell.armlinux.org.uk>
References: <20260814085118.OPEA_Ssn@linutronix.de>
	<20260903160710.vVf4gEL2@linutronix.de>
	<apmknG55qFAn8EPf@shell.armlinux.org.uk>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Stat-Signature: q5rtu1fiqy3jfjswxfikew81wiyencsm
X-Rspamd-Server: rspamout06
X-Rspamd-Queue-Id: 362BB1B
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19SQN1/iG251VKiSvCm90J/LH6Jif8jlZI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=MgMZfjHtJWGskJ7iDZWmY8Oed8R/GMs4VyOX/TuiH1U=; b=qqcyYnkg3p5F+UTVr/cgexJ1tZY0fAWBiki/WGjHsZ4h16riO0oLZP/UfGe0xdxU3KW71p1uZSD7oYxxFDSgdWxLofSFJMJqQc/uaEYXNDRZWgh/UmAbFyYg8nP9CFLA5mBn8hJD5OJy3yIsgkoNMnzTnL7skByDfjwMvD2e0vM=
X-HE-Tag: 1788456643-677296
X-HE-Meta: U2FsdGVkX18UDoUfH7MFH18LwOE6g10qW7dTkby7HjdB9X7BAG5qm8DxHVQQTPdtxGKneSZa9RInj6HuOfgU1jrR8yX6yW3K7fnvEf1/MlRgMD8jOUBQx2YsgQNEjrBWUvVSNqdIiYbJjJkh1E2120a+kJoPNZZT/6uir5B8TTX2BRq8V1KcQNPBobM5W6B+YvVAD/4d87POi8pasBUVzpHtLQvIraki2FkTv9BVPzITzzujsbAHvurHpIl46Ow6Cp6gV9QxwlxCX/VatqdB+E3ir7R0pC9W2Vd/V6ov65gCFH6Ja9hHLtsOf44MNChOQq5BQmWAckwdYllkNqTRN9/3dNiQVT0GA4ajriVWf566cpaX5UWqBgeoslbvLntd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_103054_293928_163AEECB 
X-CRM114-Status: GOOD (  12.51  )
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

On Thu, 3 Sep 2026 17:47:24 +0100
Russell King <linux@armlinux.org.uk> wrote:

> What do you expect to happen with this? Which arch maintainer should
> apply this patch that affects three different independently maintained
> architectures?

Looks like the patch should be broken up into a 4 part series.

One to add the ARCH_NEED_PERF_HW_NOTIF code to the generic code.

Then one for each architecture to add the code needed to set that.

Then the architecture maintainers could ack their patch and the perf
maintainer can pull it all in.

-- Steve

