Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 135A0EDA69A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 04:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07AH0O8rOQrtYR1vEgFaL79Z/GhmvxKal7S6yeZHNhg=; b=Qgsoaph773MVgHIzA8b/Zt7gMX
	uLD0Zh+DRTSTE7KaS7SM3XEy1TgUY5VGji6P9oC9w+7PZ4PakgVKwOkoGNYCXqJO0xFGGo8AbDtJZ
	UTlquTRR0eSBvIiAEhj5YSehRmw8euNY3hVhqGiKn2QigRllI0CFDRJadWcToP+JilaLIm2hy2YE6
	w7wlAwudVMXgNCGlOMc5MwJISAX3HioMsYY5H7wZBXVN5biMgw5nkE13I4h7sL5BmiC19Ctoo6w7B
	z03x+JcOZT97mRB2GAVMs4l9wvXqXL6kcbLCkOaMlsPyxbcDJ5+GWabYSbsrgUPcrx7zwjnlzN/na
	dmnCZ1/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy0Nb-00000000uJK-1ckQ;
	Thu, 05 Mar 2026 04:32:07 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy0NU-00000000uIf-2IlZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 04:32:05 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-6610bd5f322so2141374a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 20:31:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772685118; cv=none;
        d=google.com; s=arc-20240605;
        b=JYvT+IwscLj1JpleuxTfeaIofYwNQrrvV5JOUv26C+wkGRCRyqf3+ofDLz22beF9cJ
         hLWSl38dBeRD/mizD+YJfG3jL0zUtKeCObJteGClzPLmgB5j9tRmRJblSVkODQmOyVvq
         RPUt5o4SfYFMt7gYU6ZfCO6Z01FCtmbRrGyNFTn++Uh+ft9rpMwWbIIKVCzW7lLw3Zl2
         FWt5IY22vnxwl5BfCjG/aWK8EJ/pmTrUqLqvp2aMh8vF0QVBpZmLzau0fyHC0J6pR3Ui
         0aNagbICduG2+Tg3y98ZmFUCVHJ+vx3KIgpGBsGQzV8CDZvXj7z6E9h0HXtr+GzgQEqP
         bDwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=07AH0O8rOQrtYR1vEgFaL79Z/GhmvxKal7S6yeZHNhg=;
        fh=JKHMpW5ymyiyJfc5tvmw80m8Kcth62nCT0Q3NjI1+k4=;
        b=Vz4X0DJIyjYYI/efhxqhKggX7jjcw2bHHzpMGlX2HFAbRffJRM5mmGSOyacPGZRAHt
         TFnyxzqnevKWB9pQsGCk+332DYY9gaCUkPn0bPXgB+ERSBTSCDFVjUjULhQqLNBh7Dzo
         6R0ki8RyUAHJ4CiHToqmc/3dKf3bVpd1421QMG3jE3si0nhoCIU4bWubxCmo9WSP8809
         P8G7M9sDqepHY9MzthgSWCO6LH0NR4E5e4ZJt/d1nJdIMRTC/IXqmCgt0M/fq7RRigEe
         jY1SnPSrmISjRTrlfIHcVZQB6tyiwS+AqpJ9bU+Eisqu+ZlXr6BqBVfehu+Kf51zw/f5
         dIyg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772685118; x=1773289918; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07AH0O8rOQrtYR1vEgFaL79Z/GhmvxKal7S6yeZHNhg=;
        b=pbpjofoN4ONHRynmRcRZDpfVXQ7lgeq3HVmuvS6hfNEbktExDlzbjBgLZjCFoHhft+
         Jto01NavVEbqGlmVRw29AKnNKgKyPxdEsvOh8QhnEyumThYPPR9sFBXpKpD3MCBVYd4x
         0Z+8dpSrRNNSaBZcgXHeWSbAsbjWJKvJPiUWmOlhgpZc8OkJxZ2HLvft2WiGfNVGc+i1
         9J68BTcvYfEvBW0kTJxNFcf5XmpTNj7F3tx0lZnUi+z4PK2Koak+O6GIJBdZjleBWbW0
         1cTd/xHsYbu/02EBfY8Z+yKKGxa/pyxFzPvJbhj8/HSfge555TBh7G1uJN+vYYqiti/7
         vpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772685118; x=1773289918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=07AH0O8rOQrtYR1vEgFaL79Z/GhmvxKal7S6yeZHNhg=;
        b=b7kLAjUWbQz/VJOn/Q+TUaw6esy8wKM8WpO+XlDGCbNhstq9PmNk/uihsKzYEt+XNT
         Xe7ZsZzfeRTRCfQvLm6uA2WqwuS6XF9QOGf8IArQ3wK1tuejhvFn6JAJIe7Dw962R6UC
         FtUO6NQQ68E9vTKbeDijcBneoCMckzhy3ccbPcKK0nhmXwegvqkUd2Pwu4PiTf2UAhzl
         UpoIO4F1aKjnVS8usQMT6IUdNI19n9QwVs5xaOxM1A9755S4VRzJDePbfij5c8HLYeVy
         mbunW5cTSanRx9roi38Z70r4gMRMD0KQOR1Iv7/dAcPZbdaLpvcWjS5Y1lnoL18zGfBS
         /JSA==
X-Forwarded-Encrypted: i=1; AJvYcCVdRDPzKkB7DPi+xs7MzGVTw6pPE/17yMgLgZDslkbyrRa5MD21cMX8ABBAU7MA67cBPWDn+1Be5nvD2b2kF4l9@lists.infradead.org
X-Gm-Message-State: AOJu0YzPG8BEMsaJfeWFpFCT0HKeKHQmDpJfbCUS0RINEByfnVmaFX2J
	VAH5EtAYIZsQiqwhqi/UmANjNa5m295gVOlGRVcCdjEourGniygb3Q1IYxpHJJVbuqJfm4VbMKY
	ZdlgIY62JBrpVcWYKEdpELOz2AvIIhTzPvtZ/O76y
X-Gm-Gg: ATEYQzzSDYtVCgtf2nxbbgH+QIsZMHQVmJV3mPwXPwT/55vEYCe2N5f//mhxwsDKhIx
	ha7grCjxeZB8L4uo+lTdGreD/G284Fovs0/2Ttr7xgSorAeFGaRSn/mAEB3UJrhigedvaOl2wtk
	MVEX2jtQq5VlGPajHlqEiDwMloTEq+shw8vCL8wqkUZ2LpaDMrNwrPrqMpFCE3TKQPyXM/YD+jo
	U+O44aWN55HBQEE2pXQKnTTp76cEx1lqaP835LNKfvW+C5HucNd4M/K9y3JEDqUcRV4gDPjbP5I
	64R6kIKDn6PRzVkHINm7f6+a2BD5OLtL1K1vQHVbQz+l0OIVKFFESdoi/elkxi9KTDxl7Q==
X-Received: by 2002:a17:906:208f:b0:b94:898:7bd2 with SMTP id
 a640c23a62f3a-b940898a1f9mr26074666b.39.1772685117464; Wed, 04 Mar 2026
 20:31:57 -0800 (PST)
MIME-Version: 1.0
References: <20260303063751.2531716-1-pjaroszynski@nvidia.com>
 <CADrL8HXaTz-TS9rYiQkZ6NoRWhHm0t4Tv0t=TtDXS4purLnDJg@mail.gmail.com> <aadTuvCBxiVimDZA@box>
In-Reply-To: <aadTuvCBxiVimDZA@box>
From: James Houghton <jthoughton@google.com>
Date: Wed, 4 Mar 2026 20:31:20 -0800
X-Gm-Features: AaiRm53dJeRWd8Nji1GYa5e5Z900_RBsGxiHxN9h3vB4MZepaklzjxRsMiu3r_c
Message-ID: <CADrL8HUHQDta2mv4TG=f3nYPx5-S5nrywGxQwx78KSe67yjYVw@mail.gmail.com>
Subject: Re: [PATCH] arm64: contpte: fix set_access_flags() no-op check for
 SMMU/ATS faults
To: Piotr Jaroszynski <pjaroszynski@nvidia.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, Alistair Popple <apopple@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, Zi Yan <ziy@nvidia.com>, Breno Leitao <leitao@debian.org>, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_203200_606316_9F00109A 
X-CRM114-Status: GOOD (  17.58  )
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

On Tue, Mar 3, 2026 at 1:40=E2=80=AFPM Piotr Jaroszynski
<pjaroszynski@nvidia.com> wrote:
>
> On Mon, Mar 02, 2026 at 11:19:46PM -0800, James Houghton wrote:
> > This is similar (sort of) to a HugeTLB page fault loop I stumbled upon
> > a while ago[1]. (I wonder if there have been more cases like this.)
>
> I see that your commit 3c0696076aad ("arm64: mm: Always make sw-dirty
> PTEs hw-dirty in pte_modify") from that discussion was picked up and
> it's very relevant for the hugetlb exposure question. With your patch,
> do we have a guarantee that sw-dirty implies hw-dirty in all cases? If
> yes, then there should be no exposure for that path. But it still makes
> sense to make it more explicit.

At the time, I was unsure that the patch made it *impossible* for
Linux to ever write sw-dirty hw-clean PTEs, but, after that patch,
such a write would have to somehow avoid pte_modify(). That seems
unlikely; that was satisfactory for me at the time.

I thought (and still think) that explicitly fixing the HugeTLB path
would be a good idea. I think that patch wasn't taken because it
wasn't necessary to fix the bug I was staring at.

So if you want to take the patch to the HugeTLB path[2] or improve it
in a v2 here, please do!

Thanks!

[2] https://lore.kernel.org/all/20231204172646.2541916-2-jthoughton@google.=
com/

> > [1] https://lore.kernel.org/all/20231204172646.2541916-1-jthoughton@goo=
gle.com

