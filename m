Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93A0D3ABFA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 23:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9eTJgef65FJqEqrDDdD4z33gUAbRA/4vY9wtlAAEJd8=; b=Hq3hD/EwUv4PnG9b/cDehSGgtS
	VEOF8lbhzkWA28f5KH7pmGtzc31w970JJ0klJUUojwnYShynU+VkCJ5qPIR+n6N5r4CGLyGSu8sw5
	CUYTmbksURoPi/cLbnrO6hvmGaiAfJtky0PlNEgDetxKdGsth/jirPW9emUxlce8rhIZox2obnajr
	TqETVtAcAM8BPjqgiYLFjYc40vev3s/2sqvNvrTxD7Kb3GuuY4FivaP7qffOISIeqWd3PMezMXrVu
	HFpM9dduZYzbzub6fEJdKsYCPCoN7uxTeaOkFDVU8XSt4TiB075sMunJfuzj8KudPc5Wxf68rKWwK
	eMj6pUKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAdwy-00000001dDn-29MD;
	Mon, 11 Nov 2024 23:36:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAdvD-00000001d6d-2UQv
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 11 Nov 2024 23:34:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9eTJgef65FJqEqrDDdD4z33gUAbRA/4vY9wtlAAEJd8=; b=oxA0xX9qHypO6XMKTVBo5l58mg
	vcTCASxyXYz1jDjuwBL8zNozUaYJiP/BdyDohJNcKPgi/y52Agu2aZHSQwI9WJwYUkYF4Dcv2Y6v8
	8MPYGZqP5kEsgItjaNEL4acDOzMKRRZCMSyiwFvD9vz5i1+6teghMiXXRTfqYGcrjtHEYCWfi3wXQ
	R4mrCz11zjfDwiV4tlBaukifquYhW74FctncL5nQeZXT63lRVaHo6fwgBlN//UFIT2VrgpaQB29R6
	vDl8AszNqVQ9+OYeBhy0rZH6zv2Kn4Rg+torPPmy2Md+oSboKUDLfWBxgk2UhqOzL8UQkT+26bLDb
	rGGSUPxg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAdvA-0000000CxQ1-101H
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 23:34:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2ECA1480;
	Mon, 11 Nov 2024 15:34:35 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2A9563F6A8;
	Mon, 11 Nov 2024 15:34:05 -0800 (PST)
Date: Mon, 11 Nov 2024 23:34:02 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/4] kselftest/arm64: Use a define for SVCR
Message-ID: <ZzKUaqv_K-MRTti4@arm.com>
References: <20241107-arm64-fp-ptrace-fpmr-v1-0-3e5e0b6e3be9@kernel.org>
 <20241107-arm64-fp-ptrace-fpmr-v1-2-3e5e0b6e3be9@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107-arm64-fp-ptrace-fpmr-v1-2-3e5e0b6e3be9@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_233412_512313_C29618B4 
X-CRM114-Status: GOOD (  15.19  )
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

On Thu, Nov 07, 2024 at 01:38:05AM +0000, Mark Brown wrote:
> For some reason when we're accessing SVCR in the FP tests we use the raw
> numerical version of the register name rather than hiding that behind a
> preprocessor macro for readability. Since we already use the generated
> defines for sysreg bitfields in other the KVM selftests let's do the same
> thing here, also replacing the defines for the SVCR bitfields which we
> have.
> 
> The build setup for fp-ptrace is a little fun so we have to manually define
> __ASSEMBLY__ in the source code for that.
> 
> Signed-off-by: Mark Brown <broonie@kernel.org>

I get an error when trying to build this out of tree:

/home/cmarinas/work/linux/tools/testing/selftests/../../../tools/arch/arm64/include/asm/sysreg.h:132:10: fatal error: asm/sysreg-defs.h: No such file or directory
  132 | #include "asm/sysreg-defs.h"
      |          ^~~~~~~~~~~~~~~~~~~

Probably sysreg-defs.h has not been generated yet. Too late to figure it
out now.

-- 
Catalin

