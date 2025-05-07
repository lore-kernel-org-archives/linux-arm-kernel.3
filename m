Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115E2C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 22:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEkSKNP9rYbUpWYGWC/t+jeH1l3UmEeOY0sK+sIff3M=; b=17egBVtjcc+sD6Z415aGleUp2P
	1adwOMXargtyWkt6/EEQmxC8OMkyV5qpUgn8a4SPTKT6OLJbZLIGMpxapmbHu4gT/BTL81lz2dIOE
	HlZkMqBMkDSdPc5QDZvHa0kkxFcdhIgzNlyU3dZEK5xFp74jtGnquO90OT31sLpYRce5wHdu5/n4e
	p0OV2mvZO2WD3VwMtOAa+9+pL7bquKEva80zJBLk5Tk7Dfk2fUb+TktfZLrze88PNQk9Ld4dOSdMN
	becTOTdhfp7NovvnHNTfwceZ22NP7SBhX7UZY8aJnJIIVhTrbNG/44034sBcNJLWUHaq9OsimSVQD
	VsjCnazg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCnfY-0000000GuUo-48Q8;
	Wed, 07 May 2025 22:55:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCnbp-0000000GuGd-2xTm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 22:51:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CAE7E5C4D50;
	Wed,  7 May 2025 22:49:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE8F8C4CEE2;
	Wed,  7 May 2025 22:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1746658284;
	bh=Bctlw/1fOsJIta1eRL7h91jxm0osjK1lAY09a063p5c=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=A+UhL3sVc5gIJB7Tb/fyR+1oqmCAcyc7DqKW8AC++39/5gLz6Zxq5Hlb3zZeZm0Kb
	 gd9ZOzKBSArNuwDTo1B15ZVeP5lRr/yGP2YCCo65lvrhWPhuz3+IpEgUXUFbDbznO4
	 SFhgXJ3vDLWAs4AP3YYtuBD89dMDH+jGL1h3jwoU=
Date: Wed, 7 May 2025 15:51:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Florent Revest <revest@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, catalin.marinas@arm.com, will@kernel.org,
 tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 broonie@kernel.org, thiago.bauermann@linaro.org, jackmanb@google.com
Subject: Re: [PATCH v2 0/4] mm: Avoid sharing high VMA flag bits
Message-Id: <20250507155123.6ae8ee544182dc9cf1137a05@linux-foundation.org>
In-Reply-To: <20250507131000.1204175-1-revest@chromium.org>
References: <20250507131000.1204175-1-revest@chromium.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_155125_787459_9EB30308 
X-CRM114-Status: GOOD (  19.23  )
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

On Wed,  7 May 2025 15:09:56 +0200 Florent Revest <revest@chromium.org> wrote:

> The first patch of this series is a straightforward attempt at fixing this
> specific bug by changing the bit used by VM_UFFD_MINOR. I cc-ed stable on that
> one and I expect it to not be all too controversial.
> 
> The rest of the series however is a more zealous refactoring and likely to be
> more contentious... :) Since this bug looks like a near miss which could have
> been quite severe in terms of security, I think it's worth trying to simplify
> the high VMA flag bits code. I tried to consolidate around the current usage of
> VM_HIGH_ARCH_* macros but I'm not sure if this is the preferred approach here. I
> really don't feel strongly about those refactorings so this is more of a
> platform for discussion for people with more mm background, I'll be more than
> happy to respin a v2!

It's best to avoid combining backportable bugfixes with regular
development patches, please.  These two categories differ a lot in
their timing and version-targeting.

I'll queue the [1/N] bugfix targeted at 6.15 and -stable, thanks.

