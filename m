Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563B1CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 16:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SafgsW2IRA6WTSEU+2dyVS8RtXUiMl1s4I/by4/b5o0=; b=T41WtgjgVVlQACbLkUC+JqKZng
	vR/+n9OETz5BfaSKeUSQhFJbjiKj/Um7AavypbGQCWp0+3l7kEwukrq/W+0i3dtRjAMhuYi07K7MG
	UQrDR0epYxVBytM/IYiyM/UmMtdNFj+TaphFYhQ0zhSy6a9cpxZ6c2K5AWeGhyslmM9H8Ave8j4te
	/O9eCE+V7HR4NnXhtNrAlbhizpePgjHBb2BGbPyBPgsRQoMMfBYbrEzFMrmXoqwYECFz294TXYDDt
	rSfbIp3chv8kMsTh6Ytx8dFylFgfyQc6lJswHJHGWikgD/R7jo8yyKQMTVIO85IElTq65a1YMXRQf
	rGCES+eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP13m-00000000caV-1YDG;
	Fri, 28 Nov 2025 16:11:02 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP13j-00000000cZe-0XuK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 16:11:01 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so16489795e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 08:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764346256; x=1764951056; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SafgsW2IRA6WTSEU+2dyVS8RtXUiMl1s4I/by4/b5o0=;
        b=UyojkC/AN9mqxi7ncFi9fmJtxf4Ctftmi0pLHoMl/0f6TuPFycdjmyel2/pK6QRV7h
         7x9Q6hbyQzhn+ryWwj4lQSjgiLqYuCwwWq1dudzivuJelmU1jiF/4f688qLNYwX7NE4t
         cbLrhzCDHOHq3C5bWf9h26h+FGLYjHlarGHPcLetc3fQrYBId3xSMuy8dEZQN+mNyDvf
         n3lyACQ6khhT9JjrGtFHuieE+rLZHOeaFNAafmQejPu8XqWaym5jb30b4BH7u2O6JX2j
         CCahMPoqXmMe9Nrxs+HOpEsKmWSjeKV3W5RX8WGe45/o/xW1b8UYYc9vo2p/kWqDjfl1
         EWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764346256; x=1764951056;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SafgsW2IRA6WTSEU+2dyVS8RtXUiMl1s4I/by4/b5o0=;
        b=BU6go9AjzcdjeLo1YAYHHOLxolocCohgG2noItlBk6WIWiqw9eXAxnOQ2UjyyGZC4I
         T/vyNP/Mn5kN8S25OaR+XZp3JOKJEZ1u2lhB9INLAdMYPno1xs1Tr/EN+i+V9g+bLycv
         H0K6FUcfcAg4jcrwOW/1oFMkt+EXgHKMmBN8aSUf1/7dOS2Ipm1YJxa9TBYQQMGtR/bQ
         eF6z3N+dGPAc7vcceanLHLYEPzvJezixvTAx4DBfw3q0NE0FsDukTdPsq5SsqigWJEm0
         A8FqJYzPOjUhy3Tjbrpq8J2bwbOET5UuIvPoSrwKZjFCRVIpcov5lwU/gp5o58ZoMiDI
         6YIw==
X-Forwarded-Encrypted: i=1; AJvYcCULmOLg9UR84FIXyWM31uSyKB2P00Plzw4OZsrcdaG4zK8yuQBvTyjk5o3ckTcJreIfCqyldieKZ+fOvHKYYxSn@lists.infradead.org
X-Gm-Message-State: AOJu0YxgU6wCvSR/fkBVM9FJWRMoFdPudJDwqOkLbpv6BYiR8xU4kEHJ
	POUscuxWEDxiNZYfb/OrmnTuLsYQbTx+PUZr12Xz/6cx5JTaPZhdgQkk
X-Gm-Gg: ASbGnctSAW3nBBPk+djig/S8zMp8LM92IPLRxjWp+meeAfuA6ut8TlRfEswmfXbnetm
	KGwquifOyoKhfe7vGa0BWGYJKmJJy/FeJ27oDsJEU7NWva/Gmfp+pyTm9p/7srYP97V71CZHeyS
	XPUm9yPqu8i0JO8T99h75iiqyyhaoAYJaNbvBGcRu+jZqosto8ET6uu64xPm3uAn2c6zoM/R9io
	j0B0PY5mcondmNbMYqgG/a4FeVXxzmyedZgbyJPquEgIA0tHKuEqFRlLmRdBKiXpPhxF+i/nLwx
	nbVUIkT+HjrtXiq/y7qfhNXCBvrOXaQYTdooDq8YicGslMSHj5OLs/WUWk/nK7gWW6lF35oK+Gc
	TFDslPvlfpzJFqE3UxraLPkYx8j/Uk5mmZKkVQJ7dTMJFUUGGSmnGhiaTFR7MPsgHUjY7z93L/n
	gyXs1Ng0coc3Y=
X-Google-Smtp-Source: AGHT+IHjyNF8iOU+mMUdK19w4k4iEX5kJnFstbBKruu1Tqmp3pL6iexbL2j/7rsrms+bo7Pp0U8qZA==
X-Received: by 2002:a05:600c:4e8e:b0:46e:6d5f:f68 with SMTP id 5b1f17b1804b1-47904adb12bmr165437215e9.12.1764346255858;
        Fri, 28 Nov 2025 08:10:55 -0800 (PST)
Received: from osama ([197.46.139.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm170210155e9.1.2025.11.28.08.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 08:10:55 -0800 (PST)
Date: Fri, 28 Nov 2025 18:10:52 +0200
From: Osama Abdelkader <osama.abdelkader@gmail.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>, mark.rutlang@arm.com
Cc: smostafa@google.com, catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org, will@kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: Remove unreachable break after die
Message-ID: <aSnJjNk272pCDubc@osama>
References: <20251126222620.215245-1-osama.abdelkader@gmail.com>
 <aSgX-br67x5Y-kBZ@J2N7QTR9R3>
 <9900ca30-4d57-4a38-b319-b76d57038e52@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9900ca30-4d57-4a38-b319-b76d57038e52@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_081100_134399_53B82E9C 
X-CRM114-Status: GOOD (  21.71  )
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

On Fri, Nov 28, 2025 at 08:01:22AM +0530, Anshuman Khandual wrote:
> 
> 
> On 27/11/25 2:50 PM, Mark Rutland wrote:
> > On Thu, Nov 27, 2025 at 12:26:20AM +0200, Osama Abdelkader wrote:
> >> die() never returns, the break is unreachable in arch/arm64/kernel/traps.c
> > 
> > Is the break causing some problem, e.g. a compiler warning?
> > 
> > If not, then I don't see a reason to remove the break.
> > 
> > There are many other instances of "die(...); break" throughout the
> > kernel, and this doesn't seem to be speecial.
> 
> Agree with Mark. From switch case semantics perspective a break is expected
> here regardless what happens to control flow.
> 
> > 
> > Mark.
> > 
> >> Signed-off-by: Osama Abdelkader <osama.abdelkader@gmail.com>
> >> ---
> >>  arch/arm64/kernel/traps.c | 1 -
> >>  1 file changed, 1 deletion(-)
> >>
> >> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> >> index 681939ef5d16..81dd2d7759eb 100644
> >> --- a/arch/arm64/kernel/traps.c
> >> +++ b/arch/arm64/kernel/traps.c
> >> @@ -1003,7 +1003,6 @@ int bug_brk_handler(struct pt_regs *regs, unsigned long esr)
> >>  	switch (report_bug(regs->pc, regs)) {
> >>  	case BUG_TRAP_TYPE_BUG:
> >>  		die("Oops - BUG", regs, esr);
> >> -		break;
> >>  
> >>  	case BUG_TRAP_TYPE_WARN:
> >>  		break;
> >> -- 
> >> 2.43.0
> >>
> > 
> 

I see, I agree too.

Thanks.
Osama

