Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573D1D609CF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 10:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fSJTAgyeYc+QWUZ61yvf09McHxYqrafftIlfPhoekNI=; b=rB/WVnhsEPCrthm63ezhZqhqmJ
	Oe3sxxvUGu29UjCk19kP79XDS86X3rC0HHxJCmPwrmdjSQE6p+o9PwkyKy48wW30LMb/n1mSJGz5C
	fqyJDFsNVX+r1nZROUMxDqYSw35WcfL2XoN7bY5TWWuGr01S9txQFyE16WpLAor99cpuAdIOdqXW1
	RyV7R7jwR3VSffdNkD6lT/sVo715Jawu5lrQgj6BmcGlYwgnAq3Kbq44zHqiQoCrWziVQMrPZtDau
	KtOD81+8JNErT5CUMFRZsRnno/1xd3w5oZU5gq0TfRixo3kv0aucGVi1BsfDCl+Bwt0Vfp8mD0EXu
	gEHtuRhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFH0-0000000CqNl-1yoi;
	Wed, 27 Nov 2024 10:27:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGFFG-0000000Cq71-1A5r
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 10:26:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4C295150C;
	Wed, 27 Nov 2024 02:26:35 -0800 (PST)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8372C3F66E;
	Wed, 27 Nov 2024 02:26:04 -0800 (PST)
Date: Wed, 27 Nov 2024 10:25:54 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Subject: Re: [BOOT-WRAPPER PATCH 3/3] aarch64: Enable use of GCS for EL2 and
 below
Message-ID: <Z0bzmYuVweIT-5L5@J2N7QTR9R3>
References: <20241126153955.477569-1-mark.rutland@arm.com>
 <20241126153955.477569-4-mark.rutland@arm.com>
 <154929d3-c46b-42cd-9785-c48aa1b08d33@sirena.org.uk>
 <Z0YNFCfisiCqU3lJ@J2N7QTR9R3.cambridge.arm.com>
 <287e6fab-e858-4a7b-bc21-687c36742e24@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <287e6fab-e858-4a7b-bc21-687c36742e24@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_022606_403075_83459EB6 
X-CRM114-Status: GOOD (  23.22  )
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

On Tue, Nov 26, 2024 at 06:53:03PM +0000, Mark Brown wrote:
> On Tue, Nov 26, 2024 at 06:01:56PM +0000, Mark Rutland wrote:
> 
> > GCSCR_EL3.PCRSEL resets to 0, so the HW won't push to the GCS for BL/BLR
> > and won't pop from the GCS for a RET. That menas there's no GCS value
> > for a return value check to compare with...
> 
> Oh, good point - I'd trusted that the initialisations were required and
> misremembered which of PCRSEL and RVCHKEN was which.  Sorry about that.
> The values on reset follow the same pattern in all the GCS control
> registers down to GCSCRE0_EL1 so the initialisations of the other
> control registers are equally redundant.  We should be consistent here,
> either initialising all the GCS control registers or relying on the
> architecture defaults for all of them, and the note in the changelog
> about them needs an update if the initialisation is there.

Hmm... that's somewhat unusual, usually the architecture has a "minimal
reset policy", where _ELx register fields are only reset when ELx is the
highest EL after the reset, leaving it to SW to initialise lower ELs.
It's not clear to me if not following that here was deliberate or an
oversight.

I can drop those for now. In future the boot-wrapper will probably need
to poke those (and many other register fields) to properly handle PSCI
CPU_OFF -> CPU_ON sequences, as we currently don't reset anything, and
that should really involve a true reset.

> > That does raise the question of what specifically happens for a return
> > at EL3 when GCSCR_EL3.{PCRSEL,RVCHKEN} == {1,0}. Can you enlighten me?
> 
> RET will attempt to load and use a GCS record, the pseudocode is in
> LoadCheckGCSRecord() which isn't EL dependent other than the selection
> of which GCSPR and GCSCR to use and setting the access as privileged if
> we're not at EL0.

Sorry, I got the bits backwards, and had meant the case where:

	GCSCR_EL3.{PCRSEL,RVCHKEN} == {0,1}

... where I assume the RVCHKEN bit has no effect given we don't have a
GCS return value to compare against, but wanted to confirm that there
wasn't an architectural edge-case that we might need to feed back to
architects.

It *seems* like RVCHKEN has no effect for RET when PCRSEL is clear.
In ARM DDI 0487K.a, C6.2.291, the pseudocode for RET starts with:

| if (IsFeatureImplemented(FEAT_GCS) && GCSPCREnabled(PSTATE.EL)) then
|     target = LoadCheckGCSRecord(target, GCSInstType_PRET);
|     SetCurrentGCSPointer(GetCurrentGCSPointer() + 8);

... and RVCHKEN is consumed under LoadCheckGCSRecord(), which has:

| if GCSReturnValueCheckEnabled(PSTATE.EL) && (recorded_va != vaddress) then
|     GCSDataCheckException(gcsinst_type);

... where GCSReturnValueCheckEnabled() is:

| boolean GCSReturnValueCheckEnabled(bits(2) el)
|     if UsingAArch32() then
|         return FALSE;
|     case el of
|         when EL0 return GCSCRE0_EL1.RVCHKEN == '1';
|         when EL1 return GCSCR_EL1.RVCHKEN == '1';
|         when EL2 return GCSCR_EL2.RVCHKEN == '1';
|         when EL3 return GCSCR_EL3.RVCHKEN == '1';

AFAICT GCSReturnValueCheckEnabled() is only used by
LoadCheckGCSRecord(), and that's only used by the pseudocode for
RET/RETAA/RETAB, so it looks like we're good.

Mark.

