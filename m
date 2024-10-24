Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90629D0E415
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 20:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8BK0ZcosXDoOXzSbDL6svDcVkcl94/C1ybPNkAKv7is=; b=Y0MdDtFimVKEBZegL2SsXZnWzU
	+4aNF0QisL8Vpwt/yzDr5v73wEuClbTuXRp61KiNWbWWZcyYqKPBzbcbn7oQZN90wGb0AnI3tC9gW
	6RAG0TcuNzAREfyvs8mxeN5DXTLB5FOUzS4c6MdQma6vXOLwYp0Mq+233pVFFDoBq5djp0JjJAOp8
	tPtbld8JiX5cVoHwZTAmMBCNM8qZqHe3biVKzYawSLXmleFVy8glvUs7rIc3jpwNmL8IvmwAwwGnn
	yGWI5uWJ3DaqhJEnVtqPltCUD54wPfDacVoH6DtiRbBooPjzJJZMqikuTymvmVw3a1D7e/jrINQqm
	0Nr8h0Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t44LF-00000001ifl-0EBU;
	Thu, 24 Oct 2024 20:21:57 +0000
Received: from out-175.mta1.migadu.com ([95.215.58.175])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t43xx-00000001fWm-0QcR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 19:57:55 +0000
Date: Thu, 24 Oct 2024 12:57:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1729799868;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8BK0ZcosXDoOXzSbDL6svDcVkcl94/C1ybPNkAKv7is=;
	b=tPILtAAXE+IgUeUPC4X+luEap2SlsyS17q2HLFknCMik+U8I3s2RvzCZUnSAzQqNJDKt9e
	M/MTZyMVUnCKCJYUBNzj0u5ZsYLzm6ShCLECXJkxN//oG4dDtOWhz5P9RCDzSDwfta6E2h
	1b0NgK8VyuKZarNkmkLJPSv4ZjfS/hI=
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
Message-ID: <ZxqmsiXV6ZYTANKY@linux.dev>
References: <20241019172459.2241939-1-dwmw2@infradead.org>
 <20241019172459.2241939-7-dwmw2@infradead.org>
 <23C91005-7304-4312-A5E0-F5E6C05B3209@oracle.com>
 <ECD0CA58-2C3B-48F3-AF12-95E37CB0FC48@infradead.org>
 <ZxprcWDe2AXuLhD_@linux.dev>
 <691447A1-8F3F-4890-B00F-8068A14CA126@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <691447A1-8F3F-4890-B00F-8068A14CA126@infradead.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_125753_666890_7E5B74FC 
X-CRM114-Status: GOOD (  20.55  )
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

On Thu, Oct 24, 2024 at 05:56:09PM +0200, David Woodhouse wrote:
> On 24 October 2024 17:44:49 CEST, Oliver Upton <oliver.upton@linux.dev> wrote:
> >IIUC, you're really wanting to 0x0 because there are hypervisors out
> >there that violate the final spec and *only* accept this value.
> >
> >That's perfectly fine, but it'd help avoid confusion if the supporting
> >comment was a bit more direct:
> >
> >	/*
> >	 * If no hibernate type is specified SYSTEM_OFF2 defaults to
> >	 * selecting HIBERNATE_OFF.
> >	 *
> >	 * There are hypervisors in the wild that violate the spec and
> >	 * reject calls that explicitly provide a hibernate type. For
> >	 * compatibility with these nonstandard implementations, pass 0
> >	 * as the type.
> >	 */
> >	 if (system_entering_hibernation())
> >		invoke_psci_fn(PSCI_FN_NATIVE(1_3, SYSTEM_OFF2), 0 , 0, 0);
> 
> By the time this makes it into released versions of the guest Linux kernel, that comment won't be true any more.

Then does it even matter? What is the problem you're trying to solve
with using a particular value for the hibernate type?

Either the goal of this is to make the PSCI client code compatible with
your hypervisor today (and any other implementation based on 'F ALP1') or
we don't care and go with whatever value we want.

Even if the comment eventually becomes stale, there is a ton of value in
documenting the exact implementation decision being made.

-- 
Thanks,
Oliver

