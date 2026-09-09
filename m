Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E79C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 14:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wm2geJlbtGbU92IZqu+eW8m0JT5CwaWOaBBT2z+SwHo=; b=lcdhRj3Mnr9D+vLIxg9CKXzshr
	gRSJMYr7bRrsxvFXv9aGo8FAcXSZzgt3VjR8VukBH3jklsYdQ9pb6IAE6IBRY2pFTpwWSsNjkTpGU
	dHvHAjdrJAnxgmsWXYsgtnIA1UVj73JyQLEuLkQF1GDiVEse3j6VeV0ajOis18r2dsHTvlfOGvFrx
	OjWbnidInI2YluNSqOXOvhlPjAApQTRFJH4syA+6Pe4IFsrQ6W44g2SABm0erO4t5bha99i0jO5qV
	LGCrrvCNmAQkUXz0nSS4MSah79nwYs48qWGkRXqaaP0kdfWv2UnBmtpz7dtEPf4NrXRiLL0IyEuZA
	dvTSTROg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JYL-0000000C2HA-3dIl;
	Wed, 09 Sep 2026 14:45:33 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4JYI-0000000C2Fg-3WnO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 14:45:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788965108; bh=Wm2geJlbtGbU92IZqu+eW8m
	0JT5CwaWOaBBT2z+SwHo=; b=rwXItU7pH72zB0D/BX831s78+axJv8WNyiUVJbPbmr+v+ca0iv
	Kp3yNZgIdQmLiSgld1J/BCxtgtSxeME+4jWvWsc9e+X4IlgoXcgBhQXU+cL0tnlaoTVAd4ySEQx
	i06xtXV6G0oYdk8QxofW096Z4J8JSwmJ8AVo36GkwYATG7j61Vm7Eda4NVACexD0LtomlsW1hIF
	8Qq9kgOD9J7SY4OkqP1fCO/pUHVqnpqCZ/khJ5czQdZGWVCIOj1eQuNERQYnx+nwDZzz7NkdSzB
	kGVG3vBcyQzKTifgKzF1Bzg9+xptPOAkeXlbv680MmFQ/89BcTeW460/mE65Mjpbpmw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1788965108; bh=Wm2geJlbtGbU92IZqu+eW8m
	0JT5CwaWOaBBT2z+SwHo=; b=eQ332XR52iPJulGnX5vlJ+6ddc6RAyiihpHC5U83VmpXXhWnrn
	P9cvLPGuSD7cYw9NHLY7KpxQ8o5zk6ULRXAA==;
Date: Wed, 09 Sep 2026 15:45:06 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>, James Morse <james.morse@arm.com>,
 Marc Zyngier <maz@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] arm64: hibernate: dust off the suspend/cleanup rework
In-Reply-To: <aqEhTIPqoKj98TRS@J2N7QTR9R3>
References: <20260825205839.14571-1-brads@mainlining.org> <apgpnjnJ4suhHh-v@J2N7QTR9R3.cambridge.arm.com> <B23E199A-2D3D-48B4-A7E9-9664371A7361@mainlining.org> <apgsm92KtXA7xh6H@J2N7QTR9R3.cambridge.arm.com> <aplRx8f5NprO9dSU@willie-the-truck_quarantine> <aqEhTIPqoKj98TRS@J2N7QTR9R3>
Message-ID: <CEB74969-03F2-4F98-8FFB-625A39EEAE7D@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_074531_032495_1BF7F5B0 
X-CRM114-Status: GOOD (  17.23  )
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

On 9 September 2026 10:05:16 BST, Mark Rutland <mark.rutland@arm.com>
wrote:
>Hi Will,
>
>On Thu, Sep 03, 2026 at 11:53:59AM +0100, Will Deacon wrote:
>> it's worth noting that Bradley's patch _does_ fix one of the
>> hibernation problems and has been tested by Vladimir:
>> 
>> https://lore.kernel.org/all/20260809213615.11646-1-include@grrlz.net/
>> 
>> I would prefer to take your complete set of patches, but if you don't
>> want that then should I just take the above for now? Prior to this
>> series, there has been no activity for nearly two years on your branch,
>> so I'd prefer to get _something_ in, even if it only fixes some of the
>> problems.
>
>Sorry for the delay.
>
>I'd prefer if you picked up Bradley's single patch for now. I'll follow
>up with a respin of the rest of the cleanup and fixes shortly.

Oh, so I didn't need to do all that? Urgh..

>
>Could you add a note to the commit message as to how Vladimir was able
>to trigger a hang with CONFIG_PAGE_POISONING=y and page_poison=on? It's
>helpful for anyone testing a backport, etc.
>
>With that:
>
>Acked-by: Mark Rutland <mark.rutland@arm.com>
>
>For context, when I originally wrote my patches, I hadn't managed to
>trigger failures at top level without additional hacks, and so this
>hadn't been a high priority. Given that Vladimir can trigger this
>specific issue with existing options, it makes sense to pick that up.
>
>I had a vague recollection that this specific fix lead to a secondary
>issue, but digging through my notes I can't see what that would have
>been, and I suspect I had just gotten confused w.r.t. what KVM was
>doing. If I find there was a real secondary issue I'll follow up with a
>fix .
>
>Thanks,
>Mark.

--- Thanks!
https://lore.kernel.org/all/EE579805-42F2-4C58-B752-F28779EEB717@grrlz.net/

