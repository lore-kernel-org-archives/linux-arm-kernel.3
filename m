Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73F1C36018
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 08:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMRcZ/ULlBeIw6/Nu88nHJ/H2X1N046PBmfM1JyXits=; b=gIwXbx7pvpcaEw9Ji04QuKBAKD
	T/cN0MCr7ChRuEgtKFp6CL1jXpanL4FwZ2B41qnFSzRa8ZkUtf+hDvKOR7ROfhgvoPmc4vp+em1Ct
	nzZHz5sAaKsQees/rlYPEGuTqGp0eBMMpB5d51q7dcJeX5A1iX4+7DzMog4v9d/Za2pbvgaI4i/wJ
	A3khl+XhQc3J1KKirGJ4MibauKzuTgBCCTTm/qj3gd/0CyPm8ai5eXcuIYWP3mY/s+294leHGE8kx
	XmMXYQXpeeQ1oXM1LDhUlJYLFCHuTILQp+AG5BsNQ8ZfoZCXNa5xJHRxquguvPlrL+CeTDJXTCIhN
	dA7CjDAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWj1-00000002I34-2kuT;
	Tue, 01 Apr 2025 08:11:59 +0000
Received: from fanzine.igalia.com ([178.60.130.6] helo=fanzine2.igalia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWhD-00000002He7-2AC8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 08:10:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:
	Content-Type:Content-Transfer-Encoding:Mime-Version:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=HMRcZ/ULlBeIw6/Nu88nHJ/H2X1N046PBmfM1JyXits=; b=G0e9nYvryYD/wJt29ZfplPB2Bs
	kVPadTWva/KmyhbGhDMNTzn8it+Hddo1dV+7+mQaKQ9/vMWq38qmUH8lh0yJtoMZbSVpYJfFrZTko
	U1W1DWj59hY8TDts7qck+W6lbouBuxgyZa4rqICB4uD+QDppYaYWTSpnrGHDFN8cSvI+0oaOytMPS
	DQJFzI++uaBR/KUz2ETFaSxHQzK2o5oWaQV+b68b/xjimfZ1m2d2nIj6EXYS84+R8RIf9Zur5sbYf
	G10zdjHba62tdASOd8OWljAOEVdugY2uTmWYDacmEqGBuh0NOkidxTHIWWUVvbRcClenNso9M9D16
	F5Ykir+A==;
Received: from i59f7adb8.versanet.de ([89.247.173.184] helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tzWh1-009Z2d-OF; Tue, 01 Apr 2025 10:09:55 +0200
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Apr 2025 10:09:54 +0200
Message-Id: <D8V5E7FT19GH.3EUO3I50GYF8J@igalia.com>
Cc: <catalin.marinas@arm.com>, <will@kernel.org>,
 <linux-kernel@vger.kernel.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
From: "Angelos Oikonomopoulos" <angelos@igalia.com>
To: "Anshuman Khandual" <anshuman.khandual@arm.com>,
 <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.20.1
References: <20250331085415.122409-1-angelos@igalia.com>
 <17de4426-8263-4ccb-8420-f6913d478ae9@arm.com>
 <D8V3VKNJJI1Z.27C32MUQ1OLYF@igalia.com>
 <c1dc28a9-7a36-4303-a8eb-0e227d866c37@arm.com>
In-Reply-To: <c1dc28a9-7a36-4303-a8eb-0e227d866c37@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_011007_850899_F78A8303 
X-CRM114-Status: GOOD (  14.52  )
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

On Tue Apr 1, 2025 at 9:47 AM CEST, Anshuman Khandual wrote:
>
>
> On 4/1/25 12:28, Angelos Oikonomopoulos wrote:
>> On Tue Apr 1, 2025 at 8:05 AM CEST, Anshuman Khandual wrote:
>>> On 3/31/25 14:24, Angelos Oikonomopoulos wrote:
[...]
>>>>  arch/arm64/kernel/compat_alignment.c | 2 ++
>>>>  1 file changed, 2 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/kernel/compat_alignment.c b/arch/arm64/kernel/=
compat_alignment.c
>>>> index deff21bfa680..b68e1d328d4c 100644
>>>> --- a/arch/arm64/kernel/compat_alignment.c
>>>> +++ b/arch/arm64/kernel/compat_alignment.c
>>>> @@ -368,6 +368,8 @@ int do_compat_alignment_fixup(unsigned long addr, =
struct pt_regs *regs)
>>>>  		return 1;
>>>>  	}
>>>> =20
>>>> +	if (!handler)
>>>> +		return 1;
>>>
>>> do_alignment_t32_to_handler() could return NULL, returning 1 seems to b=
e
>>> the right thing to do here and consistent. Otherwise does this cause a
>>> kernel crash during subsequent call into handler() ?
>>=20
>> Yes. We call a NULL pointer so we Oops.
>
> Then the commit message should have the kernel Oops splash dump and also
> might need to have Fixes: and CC: stable tags etc ?

Sure, I can add those. Thanks for the suggestions!

> Also wondering if handler return value should be checked inside the switc=
h
> block just after do_alignment_t32_to_handler() assignment.
>
> 	handler =3D do_alignment_t32_to_handler()
> 	if (!handler)
> 		return 1

I can see the appeal of that, but I think placing the check right before
the single dereference is a more future-proof fix, in that it reduce the
chances that a later patch will re-introduce a potential NULL pointer
dereference.

Angelos


