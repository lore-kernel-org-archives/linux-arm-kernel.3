Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE501C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 12:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A73kl0SB+NiLpiwjyBnOi9G4I7dHdnVnHvpg+uGQFGc=; b=4aChrMaNK9DScgHnYhhxQC8uLb
	MEr0j6U2FH1GmQLY4ml/oG7eKn7+7DV3K0OKaALSiYWG9nyw4aL3bpbJvpYKtag8/zeVR+LyI+e6B
	LFNWcpdCLQoHQ+yCg+JV+Tr7Koyg4K9yEhVllc+COi5bCdK3ZKWdyXqz3aqyVgyqsBU8a7pcTkAFR
	9cR/GR5GX97c/e08tjbRqBFFqy+x/PyW/9su9dITWsuJDk6xnXSnJAwGqsgj18ezOvANNSYP9bDeP
	WFqxgCmPO4qGhg2kEuRQHf4+NT9IHWV1LH6agRD9RWDIhhEpATxHnx3iBG3Y7CMfoM0/yH8z1/8J5
	OB4yNVkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNU4-00000009W2N-303c;
	Fri, 07 Feb 2025 12:29:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNSg-00000009Vgz-2QaT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 12:27:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B0380A432F2;
	Fri,  7 Feb 2025 12:26:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA915C4CED1;
	Fri,  7 Feb 2025 12:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738931277;
	bh=KWnPB6zuXy/776k253D59EufsU+hz6oBJ8gyes5fs6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n4k02v/5T98DgihBHBpoSWTjgEhAPUjfe35Yu0xqImMpHlm3lRSGzCuI2yqNXQPpH
	 2XbuaNr97G4pWq1zBq5ztaL31Px0cs66UVmu0NaKM6Py8+ljdmwWnJbmeaTUuqYBKI
	 pmrr0wHwpXV4qe63+Twa76/v43tDEd1vEgU7arK/b5U8877wLthoAhOlGl7Go8AUsy
	 al9CTWC6j4lfYrbQiH+EkJzKXZpADqVHw8MXQ5wYwFg8Q6P30yMRNwkIbt5uxcPVOQ
	 QA3frlYUE71HVgJN5xjSQsTCC4Aiw3Ksa8y8OLJkEorjZbs7hGvD4Mz/X23opWQfOP
	 sgN3Byw39M1bg==
Date: Fri, 7 Feb 2025 12:27:51 +0000
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org,
	catalin.marinas@arm.com, eauger@redhat.com, eric.auger@redhat.com,
	fweimer@redhat.com, jeremy.linton@arm.com, maz@kernel.org,
	oliver.upton@linux.dev, pbonzini@redhat.com, stable@vger.kernel.org,
	tabba@google.com, wilco.dijkstra@arm.com
Subject: Re: [PATCH v2 1/8] KVM: arm64: Unconditionally save+flush host
 FPSIMD/SVE/SME state
Message-ID: <20250207122748.GA4839@willie-the-truck>
References: <20250206141102.954688-1-mark.rutland@arm.com>
 <20250206141102.954688-2-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206141102.954688-2-mark.rutland@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_042758_679595_F189D4E4 
X-CRM114-Status: GOOD (  15.23  )
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

On Thu, Feb 06, 2025 at 02:10:55PM +0000, Mark Rutland wrote:
> There are several problems with the way hyp code lazily saves the host's
> FPSIMD/SVE state, including:
> 
> * Host SVE being discarded unexpectedly due to inconsistent
>   configuration of TIF_SVE and CPACR_ELx.ZEN. This has been seen to
>   result in QEMU crashes where SVE is used by memmove(), as reported by
>   Eric Auger:
> 
>   https://issues.redhat.com/browse/RHEL-68997
> 
> * Host SVE state is discarded *after* modification by ptrace, which was an
>   unintentional ptrace ABI change introduced with lazy discarding of SVE state.
> 
> * The host FPMR value can be discarded when running a non-protected VM,
>   where FPMR support is not exposed to a VM, and that VM uses
>   FPSIMD/SVE. In these cases the hyp code does not save the host's FPMR
>   before unbinding the host's FPSIMD/SVE/SME state, leaving a stale
>   value in memory.

How hard would it be to write tests for these three scenarios? If we
had something to exercise the relevant paths then...

> ... and so this eager save+flush probably needs to be backported to ALL
> stable trees.

... this backporting might be a little easier to be sure about?

Will

