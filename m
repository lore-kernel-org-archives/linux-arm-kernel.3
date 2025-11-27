Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63347D111A8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 13:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AdkIkPp1a4lcUqs+auKG1YJDLZL7Cw7l/nU2K60aNmE=; b=IlMgot5OJZ+ABOlOHkP/nY4hnW
	MCD7HPqw+wm2pQX8oOJDLOweGItcbrFsxkYBSIT6cCUdmc9wUsNiEA6ltK2d7l6bpWiquwwNeWbdw
	8IZ34wwYkKwEBAarSY/R/ssJILWs+WAy96vS/le9iiWR/KJ2DGGyGiLMEhJuhudP9V/YE2+4xmtIu
	Emq/w0qwPqcO894q1N46DEGEACQoZft6Ab4DdaRly9GnHd6RPLsZVDY+OgEi4SYSklRE7muwXGZt+
	FhtPmIGLBvPEWjfZDhLf4JDwiuiL26DTbPFu5akAP31GdhOdA8tCOo9brAqL2O9EY3qTmymaPuZMZ
	KNLJm99Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOc4z-0000000Ggbn-0WS5;
	Thu, 27 Nov 2025 13:30:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOc4w-0000000GgaC-48SO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 13:30:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E255175D;
	Thu, 27 Nov 2025 05:30:25 -0800 (PST)
Received: from [10.57.43.59] (unknown [10.57.43.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DB8D63F66E;
	Thu, 27 Nov 2025 05:30:26 -0800 (PST)
Message-ID: <5b4f4cf7-75ab-4024-b02f-fb70b3bb151d@arm.com>
Date: Thu, 27 Nov 2025 14:30:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/12] arm64/ptrace: Use syscall_get_arguments()
 heleper
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 charlie@rivosinc.com, akpm@linux-foundation.org, ldv@strace.io,
 macro@orcam.me.uk, deller@gmx.de, mark.rutland@arm.com, efault@gmx.de,
 song@kernel.org, mbenes@suse.cz, ryan.roberts@arm.com,
 ada.coupriediaz@arm.com, anshuman.khandual@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, dvyukov@google.com, kmal@cock.li,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251126071446.3234218-1-ruanjinjie@huawei.com>
 <20251126071446.3234218-9-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251126071446.3234218-9-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_053035_068592_F257FA57 
X-CRM114-Status: UNSURE (   7.99  )
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

On 26/11/2025 08:14, Jinjie Ruan wrote:
> The generic entry check audit context first and use
> syscall_get_arguments() helper.
>
> In order to switch to the generic entry for arm64,
>
> - Also use syscall_get_arguments() to get audit_syscall_entry()'s
>   last four parameters.
>
> - Extract the syscall_enter_audit() helper to make it clear.
>
> - Check audit context first, which saves an unnecessary memcpy when
>   current process's audit_context is NULL.
>
> Overall these changes make syscall_enter_audit() exactly equivalent
> to the generic one.
>
> No functional changes.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

As noted in v7, in subject: s/heleper/helper/

Otherwise:

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

