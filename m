Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF29CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 08:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jou4Kt+sia0lz+yCieUvpuLa6vFXzVEGmGHpLPFzDwI=; b=KWIUehli3h/cw9a0px3D+WQloT
	VifMgtu+HAjguW0c8I1MrQggcUx/gasxzwTymiRHrKFXswXosEhciAcppJMkncYbS/bRNPxXhOF1p
	U1udVtVbjbSg2eNHoWBNPAsKsLL6AZvPEdDGaV+bJDDNiPF+TKxrf2tUye0Tnss7i56MSg9Zv6an4
	vb3doT+3dc+Y+Lz/14B4YJmm3jXK9xTKEkXsZau0I2ZVv5cRqF+cwFG6gzLtSk2DoYW0ly3PGIq2B
	Cy99WSEbMaesuRbsr2lT+GB1TB02kzzHBmwd91RFU8qrG7vE0tVMOlTR7sqo8qUKpCMqjcuYW37vo
	OWTcRh2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBq2F-00000005UPV-3A8Q;
	Wed, 30 Sep 2026 08:51:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBq2D-00000005UOp-16ns
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 08:51:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 57DBB143D;
	Wed, 30 Sep 2026 01:51:24 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 364523F85F;
	Wed, 30 Sep 2026 01:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790758287; bh=MZWTqZGizf2e4awlEik6xcTG3aUNk25jrVwdTTqUtAw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JVZXWF9xXQVk47nJJSaN6p+8Fx2fMXbO+4U8Qi17EeMFjFgx3/NeFEBN7ngYuVCiQ
	 hMpKiQeTtxY9JH+kfuWM5KCtGZtk2ZJRqF8Chhjo3LBcKavdBv93ov1Bon1ayAvCba
	 LIoeW37n7jkrQo01Y5Gs3B8lhR+sonKW3vnSMNV8=
Date: Wed, 30 Sep 2026 09:51:15 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 03/11] kselftest/arm64: Move exit calls out of fp-stress
 loads
Message-ID: <arzNg0jxDmbEMrJm@J2N7QTR9R3.cambridge.arm.com>
References: <20260901-arm64-fp-stress-kvm-v1-0-31bce995b49b@kernel.org>
 <20260901-arm64-fp-stress-kvm-v1-3-31bce995b49b@kernel.org>
 <arvm8O6kL1I9Plrw@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <arvm8O6kL1I9Plrw@J2N7QTR9R3.cambridge.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_015129_345890_3991F263 
X-CRM114-Status: GOOD (  20.78  )
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

On Tue, Sep 29, 2026 at 05:27:28PM +0100, Mark Rutland wrote:
> On Tue, Sep 01, 2026 at 06:06:43PM +0100, Mark Brown wrote:
> > When they detect corruption the fp-stress test loads print load specific
> > diagnostics and exits with a failure status.  In preparation for
> > building versions intended to run as KVM guests factor the exits into
> > asm-utils-linux.S.
> > 
> > No functional change.
> 
> This is a good cleanup, but I do think it'd be worth noting that some of
> the existing asm was wrong and worked by coincidence.
> 
> I did mention that in the patches I linked you to a while back:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=922d15ef46cb486a79f168949e103f6df26f4fba

Sorry, that was the wrong link; I meant to share:

  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=2db277185f5c252decdf49b25cd461782e890cd1

... which was another patch from that cleanup series:

  https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/selftests/cleanup

The description of the problem from the commit message was:

| The barf functions in the fp-stress sub-tests erroneously place the
| status value into x1 (rather than x0) when invoking the exit syscall,
| potentially returning a different status than expected.
| 
| By coincidence, the low 8 bits of x0 happen to be non-zero for all of
| these cases, and the exit will be treated as a failure by the fp-stress
| harness, which is the desired behaviour. Hence this doesn't lead to
| failing tests being reported as passing.
| 
| In all cases x0 contains either:
| 
| * The result of the prior write syscall made by the puts macro, which is
|   a write of the two character string "]\n".
| 
| * The result of the prior write syscall made by the putdecn() function,
|   which is a write of the single-character '\n'.
| 
| In either case, the return value of that write syscall may be a non-zero
| number of bytes written, or a negative error code. As the relevant
| strings are fewer than 256 characters, and all (positive) error codes
| are less than 256, the value in the low 8 bits of x0 will not be zero.

Mark.

