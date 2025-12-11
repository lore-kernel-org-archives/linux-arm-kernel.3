Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AACFD41C12
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 09:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ShyQdUrLPBAZ0jmMVP8BT9u1QAUAVpOqsZkPi86HuaY=; b=nL7fi7vvkPUMdjWcRHYfvLZRfL
	HBCOPBuYaXUnKWIdEmR1vLpQBtPfg95gNsdxyI2e0VfvRDSPvvzI3K3iz2Iu7GmbpQNIlrS0jCYd3
	ryopSJ734DeD/LXqu1OtBCvi/xF5IGIwAG8UQUkPx8DL50v27OBs7sRG0w8n3TbmVNf1TmyxBgxGi
	AW47ptiNwUMmmTOHpvgT5l7tuyuIgPSay6pB9oAEBa9KYOHY+cQcDvXhZE7uK2aBk1rDCh+UbvRRB
	lLNLyM3/xaYj5TE/uxbZb81a7Am3urbs+y14+fvW1JESU/dT2Gbn9IAGW1iSa2IAw8GmDMRaLsH8N
	ndPXq/6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTdLZ-0000000GSkX-3REK;
	Thu, 11 Dec 2025 09:52:29 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTdLX-0000000GSjR-0dJY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 09:52:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49E78153B;
	Thu, 11 Dec 2025 01:52:17 -0800 (PST)
Received: from [10.57.46.84] (unknown [10.57.46.84])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EA7A33F73B;
	Thu, 11 Dec 2025 01:52:17 -0800 (PST)
Message-ID: <e55e9aae-1d84-42a2-bf6a-edc73608733a@arm.com>
Date: Thu, 11 Dec 2025 10:52:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 15/16] entry: Inline syscall_exit_work()
To: Thomas Gleixner <tglx@linutronix.de>, Jinjie Ruan
 <ruanjinjie@huawei.com>, catalin.marinas@arm.com, will@kernel.org,
 oleg@redhat.com, peterz@infradead.org, luto@kernel.org, shuah@kernel.org,
 kees@kernel.org, wad@chromium.org, deller@gmx.de, macro@orcam.me.uk,
 charlie@rivosinc.com, ldv@strace.io, mark.rutland@arm.com, song@kernel.org,
 ryan.roberts@arm.com, ada.coupriediaz@arm.com, anshuman.khandual@arm.com,
 broonie@kernel.org, pengcan@kylinos.cn, dvyukov@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251204082123.2792067-1-ruanjinjie@huawei.com>
 <20251204082123.2792067-16-ruanjinjie@huawei.com>
 <b382cc8a-3ce9-4fb1-bc0a-a3d9796251d1@arm.com> <87345hfqyh.ffs@tglx>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <87345hfqyh.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_015227_235903_016DC913 
X-CRM114-Status: UNSURE (   7.63  )
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

On 11/12/2025 07:55, Thomas Gleixner wrote:
> I have a suspicion that it is TIF_NOTIFY_RESUME. If that's the case
> you're seing the RSEQ overhead, which should be completely gone with the
> rewrite that got just merged into Linus tree.

I don't think this is related. This patch inlines syscall_exit_work(),
which is called if some flag in SYSCALL_WORK_EXIT is set. This includes
syscall-specific stuff like tracing and singlestep. TIF_NOTIFY_RESUME is
part of EXIT_TO_USER_MODE_WORK, handled in exit_to_user_mode_prepare(),
and isn't specific to syscall handling.

- Kevin

