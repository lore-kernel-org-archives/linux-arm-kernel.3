Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEF61D5B17B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 15:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/S+MkuXW2RUNMhk1k2UCBwhsYOX0AgvmqjnXZswu97I=; b=0eUK1rsBPb1roUNlaLUmvmKXuM
	IaUNfeate9HYyylNDHG/uhLcNYtujOjbVp05mlmylTigaUYB/QIX101FLsdjzgGuIfgYycQ8BSsfB
	2eMtUVtweYJV7LcrqQs7L4oYf3WjC7Gsvcfp68Y+kiZV4v7hA2jDtBfNeZpYzTe3ba6QW03FOAKKB
	YIs5C0s/QJm6sVAqV4xNJ06oevkiG2ne2prN9ZV9QH+kmrC0xldjsYMTpMJgacYmIFW8UPvanGMV+
	i3uPiQN97TlM7UBkZj9VV4OJqrmM5uBMAthqjk2UnNOALpjwChdGIez3q7oApherBDMqn+KC0QsaE
	IJsegeIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVARH-00000003tXT-0ivi;
	Mon, 15 Dec 2025 15:24:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVARE-00000003tX2-0jxw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 15:24:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E79E7497;
	Mon, 15 Dec 2025 07:24:31 -0800 (PST)
Received: from [10.57.44.51] (unknown [10.57.44.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF76C3F73B;
	Mon, 15 Dec 2025 07:24:33 -0800 (PST)
Message-ID: <9f6fc1db-5579-4aef-8deb-808ae83f3266@arm.com>
Date: Mon, 15 Dec 2025 16:24:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/16] arm64/ptrace: Return early for
 ptrace_report_syscall_entry() error
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 deller@gmx.de, macro@orcam.me.uk, charlie@rivosinc.com, ldv@strace.io,
 mark.rutland@arm.com, song@kernel.org, ryan.roberts@arm.com,
 ada.coupriediaz@arm.com, anshuman.khandual@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, dvyukov@google.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251204082123.2792067-1-ruanjinjie@huawei.com>
 <20251204082123.2792067-4-ruanjinjie@huawei.com>
 <52f63e40-541f-4ed8-9d05-626eab4b39cb@arm.com>
 <051fe45b-f158-85be-3f8e-60c830fb47a2@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <051fe45b-f158-85be-3f8e-60c830fb47a2@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_072441_371880_5265BD25 
X-CRM114-Status: UNSURE (   9.57  )
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

On 12/12/2025 05:00, Jinjie Ruan wrote:
> On 2025/12/9 21:46, Kevin Brodsky wrote:
>> On 04/12/2025 09:21, Jinjie Ruan wrote:
>>> The generic entry abort the syscall_trace_enter() sequence if
>>> ptrace_report_syscall_entry() errors out, but arm64 not.
>>>
>>> As the ptrace_report_syscall_entry() comment said, the calling arch code
>>> should abort the system call and must prevent normal entry so no system
>>> call is made if ptrace_report_syscall_entry() return nonzero.
>> This patch is now in the right position, which means that arm64 does
>> abort the syscall already without this patch. What we're changing here
>> is that the tracing sequence is interrupted. The comment you're
>> referring to says nothing about tracing so I'm not sure it helps to
>> refer to it.
> I think “must prevent normal entry ”means When ptrace requests
> interception, all subsequent processing, including audit and seccomp,
> should completely bypassed.

Fair enough, let's just make sure the commit message doesn't imply that
arm64 performs a syscall before this patch.

- Kevin

