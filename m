Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27CF0C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 15:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oWOYYEa+6s/NbH3ZPeR9OuuWzJMhNpe0oTscVGP6bVc=; b=GinXczcNJZwl03oN4bkdMczRwc
	gwSVWZ6h+EjoVmlPDOxK+j3zKotrG0SXSKek5gVwuFUH0mNzLeGn/7KZl3ott2rsEv25fPIZadcPU
	TJULiBTtZuCeX8ZdAVHl21zmDT4SYXRosKUlEQWlDFFR5RR1Ii4BwlsNiIIj0WWER6eaUSHr5ODNY
	cE6ycE5qqwrltGJeU+7I0OWaRhbge1KKnYm5K7BMX5Th5J4XEk0O6vvwf1jMipJbJGe51qtgct1JE
	PVzPkjKjg2ILbs+4g4AWYIwFtID2iln5PhJ3+6/PGaxpU0ZNTqW0t8SOV4eH/JGt9YKBuf8K40TLI
	dJkqZi5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsSQ-00000004LOp-2eOB;
	Tue, 11 Feb 2025 15:45:54 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsR1-00000004LDA-2NvZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 15:44:28 +0000
Received: by mail-yb1-xb34.google.com with SMTP id 3f1490d57ef6-e5b4d615267so3235095276.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 07:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739288666; x=1739893466; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oWOYYEa+6s/NbH3ZPeR9OuuWzJMhNpe0oTscVGP6bVc=;
        b=Ay0ka+N6YTewYZqY2gcrIuvF4VFe0a0xsDP7RCBg1SzBtRObSCy4zpYqvBC2a1jUY+
         UAM80n4yma6dCCWwTdhPv1Ns3C/rf5zHaAIjHMRlUrtY6ZODKCz1YKxaNDkrMzvSIXxr
         TbfHBZeQu7VeaZvPcJVBH2X3MxR9wg/Q5zRjBJcuzZXQPGOqa9y2IYX3aZYPk9qvj6zV
         Ig9c0uFN+2liBX2Ttx0vgpSlkNgvwYbJ9lpWY57fjtUOwJctpqie/GXD7L4eniiDInVE
         EMJvEzGJiX+IarXWqb7RHje1EyKkbvmT1O9yvB22ED6FFpJS86s77wcOKrY6ULMZ0qAS
         v6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288666; x=1739893466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oWOYYEa+6s/NbH3ZPeR9OuuWzJMhNpe0oTscVGP6bVc=;
        b=R+aeNK3sS+V/oVEaPPLAMXECDhLKSj8CvolEExEmuQbHMIcEOID+O3pOAmn5wPtLBL
         BtQYPM6hCqM7qsIa9HZ4FavxOOLx8Xr5hC3MhdYh0dclpJ4hIVp+3S6Pf1niAzZ2UrEI
         dN/rS9reXaNOvJ3MRHZ1u3bBND/rTK6POYzztrWehra+H47jvw2dWDv+3g0DVBkHY9JQ
         AJUpNtnp4F42EyFtazslfYQH7GI9ILZiK6XTtsJChTZTZck85oW1vBOsM4nKsHbNzFYI
         gONoh5fQZG22iP/tz2kthwuzgd10P/Gm3Qjtwlxy7Zkn9u3XpIwBFNukNz3XwJNlSubk
         FDsA==
X-Forwarded-Encrypted: i=1; AJvYcCXRSbutfkoJ+oqfZod7gWu4rBc7HnCuYfd3BBDix8W796t5E8RtsU/J6WmHY7junlw6TRZbC/+XYXN6e5z7qTNP@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8kJLzpQAS1vxRLpeoGbKlOp9qnCfy3fAXh8mT9hwLag28YpIw
	18YeS/60GqTHiN7bD9iVsbdNTfKaGOINdAig063ldzGtygfOQcbJFsSc3nDSaxbnyBtOVGeE+Ru
	BWSpUuuWSYHcEdzLmEMvOSnlVEG2tY6uKPgQOVA==
X-Gm-Gg: ASbGnctgE7vu3rdiSrVS8v1cvaM3ZmogkOtK9v11bo8Y3M28cd8iRESXfv+UVX//n6X
	nZLALGZw6MOzTqf66oJIF06uHELUH0sFWMll3q+3sAfL1OPdZwAOmSFSKumZwes8i0YvE5ExEhA
	==
X-Google-Smtp-Source: AGHT+IEcQM4m1pJ4IdDJ7qIHjRli/apzMMJXvuiv/2L0e3P+e9Wvq4PFAeSqHSizjpSv9erR7oFadMvEShJvKH3hjgs=
X-Received: by 2002:a05:6902:1201:b0:e5b:43f5:fa3d with SMTP id
 3f1490d57ef6-e5b461ea0acmr15194271276.24.1739288666087; Tue, 11 Feb 2025
 07:44:26 -0800 (PST)
MIME-Version: 1.0
References: <20250127112715.2936555-1-peter.maydell@linaro.org>
 <44f75f64-4480-4cd2-a907-cf0638568e55@linaro.org> <CAFEAcA_BF_b8r8cOJVsk13qEQZg0BS5F16s9M6NFLQVHZBfq4Q@mail.gmail.com>
 <27599be5-9669-466e-8e34-4ec0831c91cc@linaro.org>
In-Reply-To: <27599be5-9669-466e-8e34-4ec0831c91cc@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Feb 2025 15:44:13 +0000
X-Gm-Features: AWEUYZlLug6vg8uUi3v3dMnBV8jqUW9o3FIS9K-GNtXu8BRkxpQA_ht1kqFKtVA
Message-ID: <CAFEAcA8RX527GvvxKwCViynqyGA+g_wUbtmaaoyz9Sak2brjow@mail.gmail.com>
Subject: Re: Deprecate nwfpe emulation?
To: Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_074427_621154_A74F2FA9 
X-CRM114-Status: GOOD (  17.02  )
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

On Mon, 27 Jan 2025 at 21:02, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/27/25 09:46, Peter Maydell wrote:
> > On Mon, 27 Jan 2025 at 17:27, Philippe Mathieu-Daud=C3=A9 <philmd@linar=
o.org> wrote:
> >> On 27/1/25 12:27, Peter Maydell wrote:
> >>> We have one test case in check-tcg which purports to be checking
> >>> iwMMXt. In fact it is doing no such thing: it runs the test without
> >>> selecting an iwMMXt CPU, which means the iwMMXt insns are interpreted
> >>> as FPA11 insns by the linux-user emulate_arm_fpa11() code. So the tes=
t
> >>> prints garbage and then succeeds anyway.
> >>
> >> Uh...
> >
> > It had me confused for a while, because I'd convinced myself
> > by code inspection that we only enabled iwMMXt if you
> > manually asked for a pxa2xx CPU and not in the default 'max'
> > CPU, and then I found this test case that we were running
> > with the default CPU type and which was apparently passing :-)
>
> Any chance we can deprecate the fpa11 stuff too?

I had wondered about that from the QEMU side, but it's
a little trickier than the iwmmxt deprecation because
we enable the fpa11 emulation by default, so it's harder
to tell if any users are still using it. (In practice I'm
pretty sure it'll only being used if people are running
old binaries that used the ancient "floating point return
values go in an FPA register" ABI.)

-- PMM

