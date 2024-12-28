Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB254E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Dec 2024 07:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V/bl5wEDeaiNds7u1yM+UwWhWCIetJXMbtJpgY90QJg=; b=y0S4sQ/jvR79YReqXlbPNgdDNA
	WqHIu3CVbTN/XAOS/N5Cs1JhmPATKoYDDO4/69Tk+6fG0LlVcb0ISYJS5fe6HOvJNvnWN3lcp16iA
	aLGQVFxOH0YSWfB/6GmN+Q151Ujrt4qHgZfspM4ZH3K32RHJNwwTsEebxJ1mOjXxsAIRtVAB/WMgV
	KtrKaatCi8U5/aJ32h40920PMvfen8xN6CL0Zp/h3Jk2kj6ogc67BoYgMhK7BBBGK4U1NMPDQFIii
	M5gQPT5KzW9mhwRomuQzvjSlSCCtTCgG7EhRxRUeL4gvVZ5JwreVY/CiCBGriFWWo/2nnP07h9PxV
	jDehPeBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRQy0-00000001Wr8-3mul;
	Sat, 28 Dec 2024 07:10:32 +0000
Received: from out-189.mta1.migadu.com ([2001:41d0:203:375::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRQwm-00000001WkQ-2M9G
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Dec 2024 07:09:18 +0000
Date: Fri, 27 Dec 2024 23:09:00 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1735369750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V/bl5wEDeaiNds7u1yM+UwWhWCIetJXMbtJpgY90QJg=;
	b=OY26m7mDXk5361LiqXd/LFshVSsSJMyikA2h6xS5dDlHIH//2l0ZJs/TSDc+DdqoYDuPOs
	ZAQbgcBPMPcKJNdS4MIrWpp8vKS+IK1st2s5Tf+/QRfxt7QSj8GX8olxBt0VXTdjx2CA6X
	CClxqlO0kz9UX7UdU8mBCxOOqKhYPu4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Steven Davis <goldside000@outlook.com>
Cc: "maz@kernel.org" <maz@kernel.org>,
	"catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"will@kernel.org" <will@kernel.org>,
	"joey.gouly@arm.com" <joey.gouly@arm.com>,
	"suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
	"yuzenghui@huawei.com" <yuzenghui@huawei.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: kvm: Fix potential overflow in len
Message-ID: <Z2-j6ZCQbvfNP4z5@linux.dev>
References: <20241228020119.12379-1-goldside000@outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241228020119.12379-1-goldside000@outlook.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241227_230917_242224_754CA775 
X-CRM114-Status: UNSURE (   7.85  )
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

On Sat, Dec 28, 2024 at 02:01:27AM +0000, Steven Davis wrote:
> The MMIO sign-extension logic in kvm_handle_mmio_return can
> trigger an integer overflow or undefined behavior when len
> is invalid (e.g., len == 0 or len exceeds the size of unsigned
> long). Specifically, the expression (len * 8) - 1 may result
> in an out-of-bounds shift in the computation of the mask.

I don't believe we need this. len is known to be nonzero and at most 8,
which is already being tested for in the existing condition. See the
definition of kvm_vcpu_dabt_get_as() if you're curious why that is.

-- 
Thanks,
Oliver

