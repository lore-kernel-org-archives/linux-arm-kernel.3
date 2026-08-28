Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6765FC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 13:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7aHFohDYwXcOP7zZuVMn7W5BMSpOSC48205QwYsUq4=; b=3Y+h8Im830hjoUGe/uk+WXxHty
	yOf17w8/zm+42uKtgqlg4esWr5ivefq4lejz17YNgJJQpYexFZBrdyQI/OIDQfbQr5PWJxy5PRdJM
	4xzsIvmf2jhR3VB8FrvKLH5gs2EEWAnTalYOJXHE8dERx5nOB64K0Fc3I+66I98XvhuOvjGvMV4Ng
	NKyIdUbUtMTZWYLqJLBNaxixJD5HLxSoyhEHO1Nobji1hSDj73AA8J7QBRsec7cIiYKXvY6g8q52I
	BOL4xPZykBpVCRbvjQosoWuxqzf6xtdYI9sVBcsPo1ACjn0YxPK0pLj0uThOL8L1kXb2ZVRsqKAZu
	gzIyp3dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwIw-00000005myz-3aaa;
	Fri, 28 Aug 2026 13:07:34 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzwIu-00000005myB-3Krn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 13:07:33 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so6895595e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Aug 2026 06:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1787922450; x=1788527250; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E7aHFohDYwXcOP7zZuVMn7W5BMSpOSC48205QwYsUq4=;
        b=Gxd/IDSkUufIr1/O/eqpxm5hjEgf1TW2T3PLzpdTkxJqx7kmscKFQowSAM1KgviA/F
         MF6irSV31Gx7H/ual/93ZO/dxweHCA3ijEe4XVV1OEjWt+ce/QLXe3BBIRYpINb6cGuB
         cTpI6NSwS7q7gsDSGlGM9mcQ/oFLcCu2GyTRZh9pxJgrvI2+31nLM8q1iqn0chUEpiOI
         LswOl6cIX+2j7UuFyp1sPNi5kaKT3zDlal90L/vKO1I/eduE/XRhLUcRC1OtBzz+G+cB
         b5oGoDpI5xupZqMSvq43eAXqExutCBkMxFnNX1VafS0fSUERJSsXaurfS+foh6Kfzyr0
         BNIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787922450; x=1788527250;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E7aHFohDYwXcOP7zZuVMn7W5BMSpOSC48205QwYsUq4=;
        b=a27SNejczNPeVDigb04axBihgYPtGsfYbPgRDC5U0Oi1ONdyo9teJLaF+OTbHdgYAM
         4lyDi0MupyVtWJCmcP0t3akr6CqEXNebUJklWoFG0VokKlVeqAmJ2DFLEYYULfB1cMTD
         I4ARCPwEd/eoWQ4wzBbgNGC+5ori96mN0ykLnbygZ3gwoC91gDWYGjZhxFEhmTEOExEM
         rk1suA2m7Gkk4Px3BNjdm4rv6znUHB7725AL2FhK2+HweXcZ/PAu/3T6D1lmXd7M8395
         QyxYTODxGMmOQ/9RWIZSG/axrmwEajdry9mybKyESRBajUBpyvU9fcdHGdrHWprY2Vst
         7Aaw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0O1XyLjcCeQxkifmk8f0iQF62mv8LB0kqCJrZFQV75g8TDw5UFqFoDAlzwxwEJORhUGU3+3whcH5C5I+1duH4@lists.infradead.org
X-Gm-Message-State: AFuF++lOUCbA5Xt7c9m9u9yht3693AJyOxEWClo7fA46P/xW/9+1xUoB
	PO5FbzD7CeZgOzlfHZyNc99dJfEYyDDaNKRRxzDN1Zz8kctcLIy/wi6ArjxXP7MUvjw=
X-Gm-Gg: AR+sD11G15s4i0kr/frcvTKsupzWmSDV1dVXcrPqCnV757sg/9Rf6yAHIISUB2tEUvq
	xgSldC/381I8O3vQxBjImL9XVCP6nhasJ6E68SFyp6JD1k0wgnlTnUWcOysj1+UlKwAKsI3ixn+
	85kJewQFegjqyBD7/UmB6QA7IOOkf7r+vhdC+aTdw4D1TNQ8BYeqi4MzN8XIwY9LsgrsjDo5SXK
	A/lGNvDrLLzQlxRd2sMoyRSpjGmXF1nJKnWFhqjleQ+jdG98eW249mSBhCx1PvPxglKS1hR8zLx
	xDSuxf61HhOPhR9/KsV59wt6yev9mghYGdhk+x9tcBiyFttfgi5uZYzrLnNu+p6ViEAQnXgxb29
	soxhqmgB4Ka0C+WppdBweK3BDm/sG8F+EI1c7WmB6nZBuWbiqIDx8jjjtY7wJnmfVDYo/YQckkN
	cc7VWKaVIDm5Kdfi3g7lyLLUZXLVzdTHmlWDO39B/zHtUlgmnoNDtiGvpWcT/v7KoPLYqwXQS7h
	mEt4S5Nwrhbui4l5psU1M9Hfw==
X-Received: by 2002:a05:600c:8885:b0:49b:909e:922e with SMTP id 5b1f17b1804b1-49b91c4884amr87957605e9.10.1787922450172;
        Fri, 28 Aug 2026 06:07:30 -0700 (PDT)
Received: from ?IPV6:2a07:de40:8100:0:fc6c:f9a2:4a0a:6354? ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b9500c80asm56272005e9.9.2026.08.28.06.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:07:29 -0700 (PDT)
Message-ID: <524b5817-c097-47cb-b301-4a9c0f1d2947@suse.com>
Date: Fri, 28 Aug 2026 15:07:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/9] arm64: Allocate .text and .init.text together
To: Ard Biesheuvel <ardb+git@google.com>
Cc: Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>,
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 linux-kernel@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20260822135323.795946-11-ardb+git@google.com>
Content-Language: en-US
From: Petr Pavlu <petr.pavlu@suse.com>
In-Reply-To: <20260822135323.795946-11-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_060732_859557_DE84EF37 
X-CRM114-Status: GOOD (  20.60  )
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

On 8/22/26 3:53 PM, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
> 
> The arm64 module loader has to deal with a couple of corner cases that
> may occur when .init.text is placed out of direct branch range of .text:
> 
> - ordinary direct branches from .init.text into .text may require the
>   use of a PLT entry (i.e., a trampoline aka veneer), which means not
>   only that additional PLT entries need to be allocated for
>   cross-section calls, but also that .init.text needs its own PLT
>   reservation, as the one in .text will be out of range as well;
> 
> - dynamic patching of the ftrace handler into .init.text code needs its
>   own dedicated trampoline as the one in .text may be too far away.
> 
> - recent compilers may omit BTI veneers for static functions that never
>   have their address taken, and so additional veneers will need to be
>   added to .text in case cross-section direct branches from .init.text 
>   require a PLT entry (and therefore a landing pad at the target end).
> 
> This is unfortunate, because it is actually somewhat unusual for .text
> and .init.text to be so far away from each other: only when allocating
> either of them (but not both) exhausts the 'near' (PLT-less) module
> region, the other will be allocated from the spillover region, which is
> not in direct branching range, and therefore requires PLT entries for
> cross-section calls.
> 
> This series addresses this wart by allocating both of them as a single
> chunk, and freeing the .init.text part along with the other init
> sections at the appropriate time. This ensures that the two regions will
> never require veneers for cross-section calls, allowing the arm64 module
> loader to be simplified.

It looks like this should also be useful for ppc64, which currently
merges .init.text and .text because keeping them separate would require
stubs between the two, and consequently .init.text is never released in
modules on this architecture.

-- 
Thanks,
Petr

