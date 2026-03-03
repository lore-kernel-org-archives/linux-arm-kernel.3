Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C0AEDA6BE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 17:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3gh6OPP1SfbtM4zzcnmhkoH258hG46mk6Jg8fqb3lEc=; b=epFA9QercMTlsOGSLIOMMOPZhX
	Yt8OCB0f3wjegy68D9PTwIg92h3pCRRY9bAdNmrG7eyCedwtgljlAbGubuNrwuNG/0TzuF9wPbGPh
	AxFH+bIILScuBs++KzIT2iEtLMFqb250mdhvy8Nwpxv3gjpSBLU8v+AODJXzuY3SvZonf7gfF17F+
	iaH0uLKzrkZj4E3iuvMz2v3AyyClFHwvGQ+tHEovA6vnnSuXgm5KYpCPz/RMLgFdsse1VGQ8y17iT
	uxpDI49gyPxQnqPaUrziBHt5lcLBS8oTK1pRAyuc5Mn3KGLKUemqtx8cPrqBqo4RN7U4LEnNGtc/W
	5UahQyJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTj3-0000000FfTS-3BjP;
	Tue, 03 Mar 2026 17:40:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTj2-0000000FfTF-2ywa
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Mar 2026 17:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=3gh6OPP1SfbtM4zzcnmhkoH258hG46mk6Jg8fqb3lEc=; b=GdsDj8UXslmGnYuXB5clpeDqkk
	oxR6uVkodHNCEu2UIo+K7/jUrwB7B2N95P+aEKtYEOlf5FyP2WLrY4f5EPpYYpC+cpMcwpG6Zw4Ia
	xnfsLXCby9NdPoa+Qt73+5WH+mZYG+tiITSzTZVtVGtcORu6zvZYebi4eT6n0g6WPdtycgid+lG+l
	u/qqlWjwUwjZBhpynGUudhRYVfvzBXx57AkFxgRBvIJDLlKN+tJwUwuoJSckz5MUX1031SpdTYaTn
	/ohntOyZw1AoOKMWYkRXjU+bxTZjUUbxl4+YlTwHInVcpMc6J3vYS9F95rxIZBK1OsznZbTaIep8q
	euM7EJ1w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxTiz-000000031vj-1X6t
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 17:40:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B85C339;
	Tue,  3 Mar 2026 09:39:52 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EB383F73B;
	Tue,  3 Mar 2026 09:39:58 -0800 (PST)
Date: Tue, 3 Mar 2026 17:39:56 +0000
From: Leo Yan <leo.yan@arm.com>
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Yabin Cui <yabinc@google.com>
Subject: Re: [PATCH v2 1/3] KVM: arm64: Disable TRBE Trace Buffer Unit when
 running in guest context
Message-ID: <20260303173956.GI1098637@e132581.arm.com>
References: <20260227212136.7660-1-will@kernel.org>
 <20260227212136.7660-2-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227212136.7660-2-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_174001_613498_34D4BDDD 
X-CRM114-Status: GOOD (  16.45  )
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

On Fri, Feb 27, 2026 at 09:21:33PM +0000, Will Deacon wrote:
> The nVHE world-switch code relies on zeroing TRFCR_EL1 to disable trace
> generation in guest context when self-hosted TRBE is in use by the host.
> 
> Per D3.2.1 ("Controls to prohibit trace at Exception levels"), clearing
> TRFCR_EL1 means that trace generation is prohibited at EL1 and EL0 but
> per R_YCHKJ the Trace Buffer Unit will still be enabled if
> TRBLIMITR_EL1.E is set. R_SJFRQ goes on to state that, when enabled, the
> Trace Buffer Unit can perform address translation for the "owning
> exception level" even when it is out of context.
> 
> Consequently, we can end up in a state where TRBE performs speculative
> page-table walks for a host VA/IPA in guest/hypervisor context depending
> on the value of MDCR_EL2.E2TB, which changes over world-switch. The
> potential result appears to be a heady mixture of SErrors, data
> corruption and hardware lockups.
> 
> Extend the TRBE world-switch code to clear TRBLIMITR_EL1.E after
> draining the buffer, restoring the register on return to the host. This
> unfortunately means we need to tackle CPU errata #2064142 and #2038923
> which add additional synchronisation requirements around manipulations
> of the limit register. Hopefully this doesn't need to be fast.
> 
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Oliver Upton <oupton@kernel.org>
> Cc: James Clark <james.clark@linaro.org>
> Cc: Leo Yan <leo.yan@arm.com>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Alexandru Elisei <alexandru.elisei@arm.com>
> Fixes: a1319260bf62 ("arm64: KVM: Enable access to TRBE support for host")
> Signed-off-by: Will Deacon <will@kernel.org>

I tested this on my Orion6 board in nVHE mode (kvm-arm.mode=nvhe).

I launched a VM with several threads running sleep 0.1 in a loop inside
the VM shell.  Then, I collected TRBE trace data on the host side:

  $ perf record -e cs_etm// -a -- sleep 100
  [ perf record: Woken up 74 times to write data ]
  Warning:
  Processed 4798137 events and lost 4 chunks!

  Check IO/CPU overload!

  Warning:
  Processed 9608 samples and lost 100.00%!

  Failed to open /proc/schedstat
  [ perf record: Captured and wrote 42401.333 MB perf.data ]

Tested-by: Leo Yan <leo.yan@arm.com>

