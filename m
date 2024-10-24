Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C6AFCE8E8F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 15:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xk+d7Z4LZ/1qTUjGCbC24ANWAiUATci3sfG2VV3bTQI=; b=B94VFHdvXrxV6S3HdmEgvisT82
	IJjguGRKV3BCayJtMQZyK08NGb6cloW+ct8zakCW5va6HQCs7/S7XSZJ0m6K5/ZdG8C/m+9hkTfiL
	RklsGN5WzE+bKJjHmBr4HWi6hMBY7L71ePR3ffb/SXhmjW7f07WRXCFr6/9zAg9VNrsKJTjqiG/np
	Xe4MbSpUHyRV8djPCYLFJusEaRLQihCoPrla3Saxloxg7e+YrOg3WemLhvv+Lrk0ej/RkTKH2dys7
	OqaoO5cNhbtL3LPmwcgwKL7iuwveEyvZ+qlH+66dRX6RgK5MRZu4BsobTaURH4KSrY/2SJf4tzacY
	VjTI7YZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40C9-000000010Er-38wo;
	Thu, 24 Oct 2024 15:56:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t401M-00000000yiZ-0tsT
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Oct 2024 15:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Xk+d7Z4LZ/1qTUjGCbC24ANWAiUATci3sfG2VV3bTQI=; b=PgJZj8zTj3q4ZFGMeMb5C9OJ9e
	4OwUdf0whXx8UMqb5+uKe/VOG+6r9vPAW6NqS7U1iqXD+TiAsTvjB/aDodphwEmF4w4b2eoBPMxTU
	iGDOh7W7ia6oOZFxAILv6MXI90JNXiRCUB9nUrajQr6Y0ZQ0TIPe6rJKrMXdkKAJd8M+u/dfnXCn7
	06jFGuVWOMouPGs6CePWMOESgE15ByuRMHei72RUOEky7S52rJprmqcuZwC+Dq25b3AVyKfh2ewMt
	jZ+QqDQUOLCUZw/dzwinIEc+O/9O7ou8U+rBmAdxUHXhBjzHJoNw2gdIkzwhkzgveFmOBM2mk1Y+Z
	LeK3XiGA==;
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t401J-00000008hs1-0swQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 15:45:07 +0000
Date: Thu, 24 Oct 2024 08:44:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729784699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xk+d7Z4LZ/1qTUjGCbC24ANWAiUATci3sfG2VV3bTQI=;
	b=s50vYbHVxKPriUbyijJqut9CFyImL7JtJpvwDxKnlDeEWu3JMYeEzlCBWWd7ZMruwnOqpB
	VvDIZ8L5egp9CDD+dEudN1zYCjKmiTOapnHBxzklWRdAQEN0aLLfETohBS6o3AAwYopM35
	7GdUuWw1gJcZCYJU/S3qn5AlPO0oBdg=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Miguel Luis <miguel.luis@oracle.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>, Len Brown <len.brown@intel.com>,
	Shuah Khan <shuah@kernel.org>, David Woodhouse <dwmw@amazon.co.uk>,
	"kvm@vger.kernel.org" <kvm@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
	"linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
	Francesco Lavra <francescolavra.fl@gmail.com>
Subject: Re: [PATCH v6 6/6] arm64: Use SYSTEM_OFF2 PSCI call to power off for
 hibernate
Message-ID: <ZxprcWDe2AXuLhD_@linux.dev>
References: <20241019172459.2241939-1-dwmw2@infradead.org>
 <20241019172459.2241939-7-dwmw2@infradead.org>
 <23C91005-7304-4312-A5E0-F5E6C05B3209@oracle.com>
 <ECD0CA58-2C3B-48F3-AF12-95E37CB0FC48@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ECD0CA58-2C3B-48F3-AF12-95E37CB0FC48@infradead.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_164505_390204_AA30E7F7 
X-CRM114-Status: GOOD (  17.36  )
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

Hi,

On Thu, Oct 24, 2024 at 03:48:26PM +0200, David Woodhouse wrote:
> On 24 October 2024 14:54:41 CEST, Miguel Luis <miguel.luis@oracle.com> wrote:
> >Perhaps spec. F.b. could be accommodated by first invoking SYSTEM_OFF2 with
> >PSCI_1_3_OFF_TYPE_HIBERNATE_OFF and checking its return value in case of a
> >fallback to an invocation with 0x0 ?

This already complies with F.b.

The PSCI implementation is required to accept either 0 or 1 for
HIBERNATE_OFF. Using 0 seems like a good choice for compatibility since ...

> I wasn't aware there was any point. Are there any hypervisors which actually implemented it that way? Amazon Linux and Ubuntu guests already just use zero.
> 
> We could add it later if such a hypervisor (now in violation of F.b) turns up, I suppose?

IIUC, you're really wanting to 0x0 because there are hypervisors out
there that violate the final spec and *only* accept this value.

That's perfectly fine, but it'd help avoid confusion if the supporting
comment was a bit more direct:

	/*
	 * If no hibernate type is specified SYSTEM_OFF2 defaults to
	 * selecting HIBERNATE_OFF.
	 *
	 * There are hypervisors in the wild that violate the spec and
	 * reject calls that explicitly provide a hibernate type. For
	 * compatibility with these nonstandard implementations, pass 0
	 * as the type.
	 */
	 if (system_entering_hibernation())
		invoke_psci_fn(PSCI_FN_NATIVE(1_3, SYSTEM_OFF2), 0 , 0, 0);

Thoughts?

-- 
Thanks,
Oliver

