Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E69CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 13:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+VG22BX9b132KOlwGJkT1TkRqsiKNGGdHWFySSmdTPs=; b=WTnNE6Vu+lUYQvQ2fIGqR2wkNv
	RIwZdMoOWVJ3SDyOBBmosbCv8A4N7WmbAnwbDqiVVD1atP9KYZu2p2fW20rKFPQ6w1acKvNP70Ov8
	+7ruSKcVofQ0jpp7WUDmVjl8mq0WhKsZ9eBrnc5LGaDmXuPM0CTgAKzP5Tjdj6o1xdAfjT9ZM4iDk
	TN++XPVmiqs3DauD9YsZ5wvJ8m8lTqtDlNVf+Dp+9Ftv7zlFH55L9loa4HZv0oNEzJuDIuT3VWPCZ
	yacMa3730eg4jVBhcKj5zFL6RmgKFFEw2Q57DtoOiOPO0XjTY5OscMrEXHpmf6zLcirpDrPPZDAvy
	Gj37VHRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOc2q-0000000Gfks-12KR;
	Thu, 27 Nov 2025 13:28:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOc2p-0000000GfkW-1KZV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 27 Nov 2025 13:28:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=+VG22BX9b132KOlwGJkT1TkRqsiKNGGdHWFySSmdTPs=; b=c52dvKPfV24RC2/NryhOefKSCm
	D6FiuuORVGRTB900A1dSEjuSl8tQDsQHViHobmw9rpSuiZyFIoaJplBTH22ZXl9f9pdVJprHcHZXD
	ZbRCU1QsXG1sr4LjJ+sG9vABfDdOavUTmQCfi41LhTbe/6o+43RPwLYDCbrxlB1qk6Yx+2WhreW9v
	UghFvjTdLs9iNZWGSjpTK1k+qkXG0UKXJLNTCd/sRVTvvGR+1hhFLNhRrPW+9ojWHFrec51hi9Xe0
	IptR0kdpF+aysLFJVUhuDuSxkcndDNPWyJf5lgcxrHeLllosIzZMWcgKNnPavPvrYE5vVAnyF8URT
	rlBhhMvg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObB6-0000000A9Xo-2v9a
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:32:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0C0821570;
	Thu, 27 Nov 2025 05:28:02 -0800 (PST)
Received: from [10.57.43.59] (unknown [10.57.43.59])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 775903F66E;
	Thu, 27 Nov 2025 05:28:03 -0800 (PST)
Message-ID: <591e2e73-ec24-4ffa-b333-3459b59cd870@arm.com>
Date: Thu, 27 Nov 2025 14:28:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/12] arm64/ptrace: Split report_syscall()
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
 <20251126071446.3234218-3-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251126071446.3234218-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_123255_429563_3D42E3E9 
X-CRM114-Status: UNSURE (   7.80  )
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
> The generic syscall entry code has the form:
>
> | syscall_trace_enter()
> | {
> |	ptrace_report_syscall_entry()
> | }
> |
> | syscall_exit_work()
> | {
> |	ptrace_report_syscall_exit()
> | }
>
> In preparation for moving arm64 over to the generic entry code, split
> report_syscall() to two separate enter and exit functions to align
> the structure of the arm64 code with syscall_trace_enter() and
> syscall_exit_work() from the generic entry code.
>
> No functional changes.
>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

