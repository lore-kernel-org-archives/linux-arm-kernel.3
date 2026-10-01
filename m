Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D989FCA5FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 14:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dil0luGlEj2skgdgBYsBMLakh1zRrXCw1B+zEJ9jPY4=; b=voUds3s6pSN03/2pj5eYLPFHKv
	tPJv1FO8nV1lJDqy0/Z5fuXtvQSsE+h9d7YDi8dDqZfMEZTlSNA4dod3voYFpiXa4qy1HgArfHOl4
	N0td9IOk2Mguu4SN1aX0rwhqGAr6ms6wM1CXGb5J5Cqa5cKbGAk2IJ68sESOqZUwf7/6MpRrX+NR/
	PYV0UgcLRAAhdFNFQlkkT1oEZ1P7OErBqCPQiPz5bxGMzi9uGk2oQ6LtRgQZhiMn4sWHmEz5Wnlat
	wvHeLBzJT/FpWDAMRNRQwKtX4/8xgWlZdi+ADTK7jjlnVozpfsygdgWWpS3FmIIPtKgmYTNMw2d/H
	NZm8AafQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHzX-00000009QQn-2I5G;
	Thu, 01 Oct 2026 14:42:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHzU-00000009QPJ-0QG7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 14:42:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72335497;
	Thu,  1 Oct 2026 07:42:27 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D92C83F85F;
	Thu,  1 Oct 2026 07:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790865750; bh=L1X+aSQgTpevDtKgf3igo4ZbONRtN9Jmbh5rvE0+7AY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JCpNOy2Xjltm6Qc3UpPgw4WUoIgP7FJad5cJXaiHBs0uevpNhfD4qM0765KhBb3R3
	 7sHQ70+QbenrikJHpHq6c/+5iUHSV+TiBLfrSFYQIbnGXQDxbhTZYZxVQqa7mWGgke
	 nw2WxCU189mCRGVbi6jut3tZeu01/y5ICn7Dkd0k=
Date: Thu, 1 Oct 2026 15:42:24 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	stable@vger.kernel.org, will@kernel.org
Subject: Re: [PATCH] arm64/fpsimd: signal: Forbid non-streaming SVE payload
 on SME-only systems
Message-ID: <ar5xUENHCvhAnUX3@J2N7QTR9R3.cambridge.arm.com>
References: <20261001130836.1410888-1-mark.rutland@arm.com>
 <51351e42-60d1-417d-b61b-6011bfe5d2b5@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51351e42-60d1-417d-b61b-6011bfe5d2b5@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_074232_218892_5D2554FA 
X-CRM114-Status: GOOD (  14.53  )
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

On Thu, Oct 01, 2026 at 03:25:03PM +0100, Mark Brown wrote:
> On Thu, Oct 01, 2026 at 02:08:36PM +0100, Mark Rutland wrote:
> > @@ -443,19 +444,33 @@ static int restore_sve_fpsimd_context(struct user_ctxs *user)
> 
> >  	} else {
> >  		/*
> > -		 * A SME only system use SVE for streaming mode so can
> > -		 * have a SVE formatted context with a zero VL and no
> > -		 * payload data.
> > +		 * Non-streaming SVE state may be preserved without an SVE
> > +		 * payload, in which case all state is saved in the FPSIMD
> > +		 * context.
> > +		 *
> > +		 * On SME-only systems, non-streaming (FPSIMD-only) state is
> > +		 * always preserved without an SVE payload, and with VL==0. On
> > +		 * such systems, only accept non-streaming state without an SVE
> > +		 * payload.
> >  		 */
> > -		if (!system_supports_sve() && !system_supports_sme())
> > +		if (!system_supports_sve() && !fpsimd_only)
> >  			return -EINVAL;
> 
> This means that this function will now accept a FPSIMD only SVE context
> on systems with neither SVE nor SME, but that check was redundant since
> we already reject anything with SVE magic in parse_user_sigframe() on
> such systems and should never get here anyway.

Yes. The commit message explained that:

  As parse_user_sigframe() rejects SVE signal frames when neither SVE
  nor SME are supported, it isn't necessary for
  restore_sve_fpsimd_context() to handle the case where neither are
  supported.

> Reviewed-by: Mark Brown <broonie@kernel.org>

Thanks.

Mark.

