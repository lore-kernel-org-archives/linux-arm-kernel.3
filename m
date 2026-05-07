Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F98CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TCndMd4yxjbHbIEJCX2AjFS4eFdSECDFSht1Q6asNeY=; b=tCe1+JhC9+P957r0vSMX+uzb6Q
	k9aie0cOkxHelIWviA45LtJD+CzUnoxogb5Bw5E0bQvts1P7PtJakfZ0BtDkt8/N4CgMef1tuieCD
	TDhi5bZT7L3UvimkSvoBZgpDr44BzmhsAkgFtThQNAW9kQbX5lXB+a+cZY9VCBkfeLZqii7JVvItW
	i3ZbU+35ln8Uz1Fv9s8njSoRdR0ZullmcMHvrvtNAI9Etys9orhGkYp2N1di8akV2mBuxbsPFswZz
	EpbEqM6by+SErCICvLN1XHcfqL+8upp3C5RVk3dvzL3Qy+BQbmg2bRZNo/zEJurqZb2HMTS8rep1j
	Zer+xEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuxo-00000003KZi-1DlV;
	Thu, 07 May 2026 09:24:12 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuxl-00000003KY3-31cd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:24:10 +0000
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-95cda04cfd0so181490241.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:24:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778145848; x=1778750648;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCndMd4yxjbHbIEJCX2AjFS4eFdSECDFSht1Q6asNeY=;
        b=X3TuJQrJ3aNZY6b4JrtC5+v+8pq1S2nVyWOUORf9NBl4Y6lT5VouvsDhH999tNrvHL
         Z1Fz7HW31v/o5hioob1AwofL1TEtDPmWRc5DzhRwaPU9igKTKGHsFAMHnnt68O3pqfCd
         37/2BS6lr4+Q+DyIJpEJP9mr3XpS3SazHUTfQV7aVz7fOCcovZhDcQEHDjVjN437G+ar
         vgsuUZ9+WNrvjV80X0U4mVllWOZ5C6NUsbe/I3ncEPRXQqj5fUjEG1rCIyRo6y4exwiz
         gICzIpX2j0QHR4wWN4CZiI3L63TjRD7yBlq5RiZitsqTS6dnFYzuJv/Fgxyw7W65FY8s
         p/IA==
X-Gm-Message-State: AOJu0Yz/tiOHLP8KKsZr/l+oR1+0IANXDXdT1e7Pm9tx5PinZjKqq7dp
	7mRZ8dTynjm3CzlxoSZeubWwp7Clh2ytoYfdMgUgvfwqxE5UsVCV4y+1eVsHJOH0EQY=
X-Gm-Gg: AeBDies/qRe5g1m7sNBIlGRda8fHqdVfSzFYZQYceDPGzF9I51xhYY1+FBZboevs/Dk
	MchKdlue4McBIdtrnzqmJShgImwKViS3NqQ30l4oVdbNdNFwKdNGdcVJa1ZSR7+axPaRwJcNXLB
	GvzYpz3e3MutV2z69rvyoQQG6RDzeKloGVtrpdKeIVZMEcFXfTx5Tp7CyBVQcUpI56X/oMcKHY8
	gWWvRq1B/FmdRCcDQ7tVEczgXMfKerxE4rwkhh/n2bavbmwi0VZR3fyx+xZ9XiOnXg5uA7NZCT0
	mGk24U39NM5wM1h+ak6o8syp+JoT6IL+NYIkoAGZtqCWgEv1gAuLRIYG7lZZ5Wq/ucbc6OF3b1q
	TqPpltGAaxrvKFN3HT8449Kh3UJ3pGd3OVGKJsWMnmHQB4PM2aHoJwMJqUntOW6GqMpGtDyy7W2
	3O+yIa1CIHqippyyiMRtj/BVRuq2izfUekFd8dfpGw5zu5QCIuJ0A/S/epnHFx3E8VkBamXp+dC
	r/cunqX8A==
X-Received: by 2002:a05:6102:32d0:b0:62f:522f:5b2a with SMTP id ada2fe7eead31-630f90237afmr3092182137.22.1778145848098;
        Thu, 07 May 2026 02:24:08 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62bfd8b5aeesm10860897137.7.2026.05.07.02.24.06
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 02:24:06 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-6312a0d556cso33410137.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:24:06 -0700 (PDT)
X-Received: by 2002:a67:e703:0:b0:609:af4a:371 with SMTP id
 ada2fe7eead31-630f90266e4mr3464284137.23.1778145846187; Thu, 07 May 2026
 02:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260504225428.114959-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260504225428.114959-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 May 2026 11:23:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWUwpeZocbQimvLwDTGXPyPJCePfLLXxXFF7LhJATbNQ@mail.gmail.com>
X-Gm-Features: AVHnY4Li4IX9mDo-taz0IkcBUseN0_iOnoFKhnadIj5uAaSwC2Mm4fb9GuMco_0
Message-ID: <CAMuHMdWWUwpeZocbQimvLwDTGXPyPJCePfLLXxXFF7LhJATbNQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: gray-hawk: Fix AVB0 PHY node alignment
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_022409_763612_9E44C144 
X-CRM114-Status: GOOD (  16.75  )
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

On Tue, 5 May 2026 at 00:54, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Trivially fix PHY node alignment. No functional change.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

