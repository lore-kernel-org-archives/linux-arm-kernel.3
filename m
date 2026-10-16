Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98A1CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 06:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Date:To:
	In-Reply-To:Message-Id:From:References:Content-Transfer-Encoding:Mime-Version
	:Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CfbTlnpulMZSnkTZ0v/+czU1W90GNJRnt5mWzrYoJog=; b=mlfcANXPJCNbWMUObM+O1SKMre
	a2GTqjSloi02sIgezOSwxi2VWay8dObBjNdjlXPn8KmU77Knw8e5DZXehK02W2Fa+IKrSB1FwAcqx
	OUZ6u92Rhl8wpBqTHvgidcL87RapGal5jQSMwcas+NNytHc/GfQi9PEuvbXp2W9s5CZl0VZt3+Vgg
	4ai8gUZXxIF7z2/aCGrF8B/tO2QfwdVurZKnQJe1Ta4+La5iqGxgGLaNSK2Gn5us18uWTE7O4VESt
	4UdAyaBwkgWnXA/3pWXHRO0nlG7P01F36KF+3h4vMMngg7MLgZmzkGBoRdRHZ6ePx/iCTeuzDfAMu
	q9mqMF0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbH8-000000026eu-487s;
	Fri, 16 Oct 2026 06:18:42 +0000
Received: from va-1-112.ptr.blmpb.com ([209.127.230.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHbH5-000000026cT-3ayY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 06:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1792131511; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=CfbTlnpulMZSnkTZ0v/+czU1W90GNJRnt5mWzrYoJog=;
 b=PEU+PT0HYC+D9Wexd7ivowvxB5PD8hbFpiYGbh1DaGdlVLuvmeJkn5RZsx74J7Rmc26PuJ
 zhOH6LJ2iqUbsoRofh4/iK5Z1HdGz+jn+LS9OtvEDXYT8lxC+XXRXZvZGgaA/ddlm4xUrb
 kpnCZttysDRN0Qc10wXI9W10Qrtq60kn5XWHwKAzmC/hAnSlPHicHOaEYcxuvyTGaB0/fm
 8s08mtrMK0jcY7sjq/JHZPt2iL4dhLUyGtEtYdI1A1QVicsuXwNrI3scnmt34Gv1FXU6Ox
 FGQ7Mo7otS2EYcpDeWD3ofr8XgDKiYk8QCIgtU1pvoKM/c5d+M9MWiWbpd52Fg==
Cc: <will@kernel.org>, <mark.rutland@arm.com>, <ardb@kernel.org>, 
	<song@kernel.org>, <dylanbhatch@google.com>, 
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<stable@vger.kernel.org>
Subject: Re: [PATCH 2/3] arm64: patching: Fix instruction byte order in aarch64_insn_set()
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <20261010084721.2197683-1-qirui.001@bytedance.com> <20261010085055.2200241-1-qirui.001@bytedance.com> <atEGBsR3eI3cXKay@arm.com>
From: "Rui Qi" <qirui.001@bytedance.com>
Message-Id: <e8020121-d771-4a23-80bb-aff20b21efe4@bytedance.com>
In-Reply-To: <atEGBsR3eI3cXKay@arm.com>
User-Agent: Mozilla Thunderbird
X-Original-From: Rui Qi <qirui.001@bytedance.com>
X-Lms-Return-Path: <lba+26ad1c1b5+d1f4fe+lists.infradead.org+qirui.001@bytedance.com>
To: "Catalin Marinas" <catalin.marinas@arm.com>
Date: Fri, 16 Oct 2026 14:18:13 +0800
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_231839_993514_10EC7D1C 
X-CRM114-Status: GOOD (  11.29  )
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

On 10/16/26 12:57 AM, Catalin Marinas wrote:
> On Sat, Oct 10, 2026 at 04:50:54PM +0800, Rui Qi wrote:
>> aarch64_insn_set() passes the host-endian u32 instruction straight to
>> text_poke_memset(), which memset32()'s it into memory in host byte order.
>> AArch64 instructions must be little-endian in memory, so on a big-endian
>> kernel the written bytes are reversed and the CPU takes an UNDEFINED
>> instruction exception when fetching them.  The sibling aarch64_insn_write()
>> already converts with cpu_to_le32(); aarch64_insn_set() does not.
>>
>> This is reachable in-tree: bpf_arch_text_invalidate() fills freed JIT
>> regions with AARCH64_BREAK_FAULT through aarch64_insn_set(), and arm64
>> selects HAVE_EBPF_JIT without a big-endian guard, so the path is taken on
>> BE kernels with BPF JIT.  The direct-fill loop in the same file already
>> cpu_to_le32()'s the constant, confirming the expected byte order.
>>
>> Convert the instruction to little-endian before the memset, mirroring
>> aarch64_insn_write().  On LE the conversion is a no-op, so behaviour is
>> unchanged.
> 
> We are just about to remove big-endian support (in 7.4).
> 

Thanks for the heads-up.

I'm fine with dropping the big-endian-specific patches for mainline if
arm64 BE support is going away.  The remaining patch, however, is not
related to BE: patch 3/3 fixes late PLT/veneer emission into a ROX
module .plt section in the livepatch/module relocation path.

Could you please review that one separately?

Thanks,
Rui

