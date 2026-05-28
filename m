Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833ADCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 14:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ytYEFhaLN6HaLt0gL6T4lILTXFZlEypnvkeXVfXpShA=; b=N8rOKig0MmoAJME9Dg9/3Wz2VX
	EG/EnuSYXC3WoQCOttHl8P05fX7HUncust5q/5puVCjH6ac1zkYHG2n9pUv5LJqCSCt8I/onBv2kl
	/qQKg2UQGSEjg/j6eZgorblMIvFBkG9NyH182EXlBJCrJryP4sfh1TcfDjFAIc8vdsNi8W1KN1yf3
	k8rDMnHOI0TVA4xCrB2clH4drAz0kbaTjumwrS76m3cQryaZ8fMe0fMplemmWGj31JH6NfX0gM0Bi
	11Jz0z95rePmT3Ueqcgtp4prpy85LIwWF2MlFs4xJa8EkmWjTCvhYoiArytvXbaVcL++Zp0fkQVUA
	iM059qgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbu1-00000005ryX-3V7S;
	Thu, 28 May 2026 14:40:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSbtz-00000005ry2-43Io
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 14:40:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A149C22BE;
	Thu, 28 May 2026 07:39:55 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0AEAA3F905;
	Thu, 28 May 2026 07:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779979200; bh=FPxL+Y4CDV+4Xb+Gsr7Kh4lp4ilrQJ5GQvNmdDy2MJg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IFMN3XxQ1OYeUKhOpN0qN/tjsPh+ECPdeOrPsG/e1OJT2Az0vjnKh+vSZIT5pdiAy
	 fjdTwIP/FM1jJmGkrLBhdvH4f+Wj0t1+OlxqLY5KoWxQuTkgSiRrHNU42xCZ06sXrO
	 5B/ECxbjB9WZxCVcIrhCX4J4Ak958quTDmPB39MU=
Date: Thu, 28 May 2026 15:39:54 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	broonie@kernel.org, catalin.marinas@arm.com, james.morse@arm.com,
	maz@kernel.org, oupton@kernel.org, tabba@google.com,
	will@kernel.org
Subject: Re: [PATCH 17/18] arm64: fpsimd: Move SME save/restore inline
Message-ID: <ahhTunyXYeU8gjEO@J2N7QTR9R3.cambridge.arm.com>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-18-mark.rutland@arm.com>
 <eea3a8de-c9b0-4cb4-9364-b3f9659f5278@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eea3a8de-c9b0-4cb4-9364-b3f9659f5278@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_074004_068302_789BC48D 
X-CRM114-Status: UNSURE (   6.89  )
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

On Thu, May 28, 2026 at 01:30:27PM +0100, Vladimir Murzin wrote:
> On 5/21/26 14:25, Mark Rutland wrote:

> > +static inline void __sme_load_za(struct sme_state *state, unsigned long svl)
>                                     ^
>                              Should it be const?

> > +static inline void sme_load_state(struct sme_state *state, bool zt)
>                                      ^
>                              Should it be const?

Yes in both cases!

Sorry about that; fixed locally now.

Mark.

