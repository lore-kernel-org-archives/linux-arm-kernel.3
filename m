Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E38CC36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 07:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfpXQZwCXbJzhjggqSYZGkJOxoJNUGWrPnGQqBunZoA=; b=rJ1Lk9X0tQ/OivtSl6/lXaDRGK
	Vll9GtmVLiGY8Xw0hjACX6+ekXeeUjS/PEOYAlVMONNxjKloyL3oRZVRhcZxupHG2cGbUtyqfUEvK
	HXOIUEIGm28Ob38Ka0cQT6LB/cqlGMW5bMYhbqtoESa2NgAtD6l1puE5S0yRJDEJ9gFcCvQy+O6VR
	eDkRETbS2LFY+jkDhopmDVFgT/Zw1ThT58F+mLGTcxqEtljVTR6Td53GlY1NaUnC0cIaH14cMPbxf
	0ibW1UgGAlMPJfh7erJ5L2vGOURN++pdZOJAJ461ip7mNLO+gTEOKMb5fomk0+zWHvMkl6Faydru+
	cilC+eBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzVbq-000000028sx-3BZP;
	Tue, 01 Apr 2025 07:00:30 +0000
Received: from fanzine.igalia.com ([178.60.130.6] helo=fanzine2.igalia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzVa2-000000028hk-24UR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 06:58:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:
	Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=BfpXQZwCXbJzhjggqSYZGkJOxoJNUGWrPnGQqBunZoA=; b=JCqji5+Mrkx5vb6yVqSHhFKzta
	pvmane6DfwlzDs/pTEDz5Elqy32nPUy20jV/aQFUQMY56XHPQaQOH0JN9kfCAFJcoaUE0me6AnRcq
	QHKPUMB0kYEOZlgug42Fdn6zPhsY7FwjBU6kJklVo2A8qf0tNMDY1JocmGMS4TW8jKjhJ14k0msAM
	fzjI3HgLOtAATT8odEeZ2hN6PD62jNYzsqmA69fGuZJbx0jX6k1SdxSxrP64mDtFBO0RiFYVuMqQ8
	YYe4BFaIcSEl1UNfIJnKAdD+uZQ/gO+VuctwuzqLfbL7Zl/Nr5bUkYIkFkTmquIqyRKlGcR/wNkAF
	UCOvqKxg==;
Received: from i59f7adb8.versanet.de ([89.247.173.184] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tzVZz-009XOO-4i; Tue, 01 Apr 2025 08:58:35 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Apr 2025 08:58:33 +0200
Message-Id: <D8V3VKNJJI1Z.27C32MUQ1OLYF@igalia.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
From: "Angelos Oikonomopoulos" <angelos@igalia.com>
To: "Anshuman Khandual" <anshuman.khandual@arm.com>,
 <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.20.1
References: <20250331085415.122409-1-angelos@igalia.com>
 <17de4426-8263-4ccb-8420-f6913d478ae9@arm.com>
In-Reply-To: <17de4426-8263-4ccb-8420-f6913d478ae9@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_235838_822520_66C5DEB7 
X-CRM114-Status: GOOD (  10.42  )
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

On Tue Apr 1, 2025 at 8:05 AM CEST, Anshuman Khandual wrote:
> On 3/31/25 14:24, Angelos Oikonomopoulos wrote:
>> do_alignment_t32_to_handler only fixes up alignment faults for specific
>> instructions; it returns NULL otherwise. When that's the case, signal to
>> the caller that it needs to proceed with the regular alignment fault
>> handling (i.e. SIGBUS).
>>=20
>> Signed-off-by: Angelos Oikonomopoulos <angelos@igalia.com>
>> ---
>>  arch/arm64/kernel/compat_alignment.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>> diff --git a/arch/arm64/kernel/compat_alignment.c b/arch/arm64/kernel/co=
mpat_alignment.c
>> index deff21bfa680..b68e1d328d4c 100644
>> --- a/arch/arm64/kernel/compat_alignment.c
>> +++ b/arch/arm64/kernel/compat_alignment.c
>> @@ -368,6 +368,8 @@ int do_compat_alignment_fixup(unsigned long addr, st=
ruct pt_regs *regs)
>>  		return 1;
>>  	}
>> =20
>> +	if (!handler)
>> +		return 1;
>
> do_alignment_t32_to_handler() could return NULL, returning 1 seems to be
> the right thing to do here and consistent. Otherwise does this cause a
> kernel crash during subsequent call into handler() ?

Yes. We call a NULL pointer so we Oops.

Angelos


