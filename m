Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4D3107BCC6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 16:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LKCi1LdMRa/nTQmsjcvTF7FgMJMrPE2rqGtwqTyCa9Q=; b=2fkdMQg7opcgGSKbdj67GRT4yn
	21pdVhvhhjAxaDxTAEQUnu3wMht+5pcDgGNCZUxeNdoYUnvoI/LMEp1YGGnjB9I+XKVKBO1+khbUf
	Spwmmtd+16sNPI2ENhoWD9VBULdB1y0Kq8ojVkqUq5cwzDohapFpOpNTYxGVfgGkPsv1sVpoDD2MD
	e1ybDppLtvcFim45+gDivLF48YyGcfwpNz9MDOiyUVUBMx7ovn0k4IeLnjJxN2nwT1cQTDvq4DEdu
	OEmgkwqCM6oqJMQouD0LeB433pui1aMB35sPJzMhvkrMmy+r3aVivjj+LE1fIuyP5Nn3QBMtnqnaS
	8bSFcsow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w158Z-00000000cRW-0WE8;
	Fri, 13 Mar 2026 16:13:19 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w158W-00000000cR8-3y2S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 16:13:18 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2aeab6ff148so91145ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773418394; x=1774023194; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LKCi1LdMRa/nTQmsjcvTF7FgMJMrPE2rqGtwqTyCa9Q=;
        b=Ae0i6Q3A5JrQOQhKTFzVe4zC8y4qSze6f7oiUUOgRlYKA1M0EG4CSGIgoDwkcxya3D
         EhV02GRK/9oU6dDZF1OsygUPg4yiymMll3SQU7s7mq7IO62F9QBmr1gfvyNeqWBgsMx+
         55Onqp54Ph+tGgm+6LiVtQaD1kOLUtn089JWoNWoLfzhNswyHP3G9v3VTS0n/IGnE8q0
         hQJ19KEOKHL0+ICcnfHRZa772BaodE8o6t+wCJhvgx3mUXUfBrpZdRey2R09xZPFC3Bc
         ED1/JO50hta8WP0/jnHhUqho/+VwzjDq4Z4bbb7R5DsUJclpTbeRi2B3+pZN1TQvIW5r
         FKQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773418394; x=1774023194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKCi1LdMRa/nTQmsjcvTF7FgMJMrPE2rqGtwqTyCa9Q=;
        b=J/g+/ut7jFzcJngmNmr7njpTyl0Yzhlh0PeyCHtWWNsDRzsz+9Tik0/h3UOWgIgIqv
         ktRS7W8dbxScrdyJLNbolJwrMK/l+KCgE/eTOoQH/ZZnZfyLjGWuxCPejKoXIdFiY95i
         j+FhvF+rBkhMcj5UUp7FTifu9cOQE+Jfor7HKinmhEvMSgTwviJXhhEW2MAjPpBOWcbU
         jzHB7y6cT/SRXhOTJLiHRsGnJ1DMHLi6As09gyX6pVUR2FbeGrkTvtzI22Qqp/bZeUYN
         l/vzAuZ4fCzFzG52naZjW4BA4RJqJXmy5rXyZAcpIxEEmGYepD7ZT24XJIBhwZE/svyk
         ua8g==
X-Gm-Message-State: AOJu0Yw94JMh2c9rfIAKeLDp3HH3FMTvzLOH6QxWDIz3rAw3jp4dhfvp
	mJeGMiJMkbzVRV28mHdTDpzvy3mb/Cwh9QmtsA0m6hwLGqyJCnTgU5yFbcKH4MkPCxQICByurpd
	IzFBs9sQ4
X-Gm-Gg: ATEYQzxFz/mrPyY3H/JrSCKZbhqQk89RgextGuujlDoY5NAhOLq1+RvzzUIA52Wruci
	ik7aoeUOdKOOwWMxpUzkYsnhw2feMPF2gqgJK3vC5gWmaghDsEuIYFdRrOTheWSMkNZYGwrAysT
	VBQ5sC+xOoVjPYvoCB2tyzKy2MgwAMNNBHV1bRkmYZVzzGcGoDm23MN7AnW9LmFT6ZaWWmrkU/F
	M6Dgjv+nAB7Y/4FrZrVZ2g85rMdm73cGFYKYqYyXlLKh7FvQ5Ai4vFngBzJ4xelw5AlhAr3M8bB
	Y+yg8dXrfnm2p0mth0HG0HFY/FxaRBLMJM/xwMSdbEfbY0AKwHt/2S8QpDi135hWj9mQ926uPWx
	hfvYtcXfgL5OptKthg7Sny66u2z3gWObus7Glo704f7Dg6LDFrFFHjOV6nFrcYpcv7Kch1dwcUc
	eNt1Kfw6Tl4NfGDEBHTr4PIohsFuC38jjqfSRClgk4nA7C7gOkD2XqZOZ6q6F2MAt2lbzC
X-Received: by 2002:a17:903:287:b0:2ae:8a37:94b5 with SMTP id d9443c01a7336-2aecd612daemr2630275ad.13.1773418393802;
        Fri, 13 Mar 2026 09:13:13 -0700 (PDT)
Received: from google.com (197.23.125.34.bc.googleusercontent.com. [34.125.23.197])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece5c1465sm38199815ad.21.2026.03.13.09.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:13:13 -0700 (PDT)
Date: Fri, 13 Mar 2026 16:13:08 +0000
From: Sami Tolvanen <samitolvanen@google.com>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH] arm64: scs: Remove redundant save/restore of SCS SP on
 entry to/from EL0
Message-ID: <20260313161308.GA213695@google.com>
References: <20260313123220.29878-1-will@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313123220.29878-1-will@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_091317_008011_36C07E94 
X-CRM114-Status: GOOD (  15.40  )
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

On Fri, Mar 13, 2026 at 12:32:19PM +0000, Will Deacon wrote:
> When returning to userspace, the SCS is empty and so the SCS SP just
> points to the base address of the SCS page.
> 
> Rather than saving and restoring this address in the current task, we
> can simply restore the SCS SP to point at the base of the stack on entry
> to EL1 from EL0.
> 
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Sami Tolvanen <samitolvanen@google.com>
> Signed-off-by: Will Deacon <will@kernel.org>
> ---
>  arch/arm64/include/asm/scs.h | 8 ++++++++
>  arch/arm64/kernel/entry.S    | 4 +---
>  2 files changed, 9 insertions(+), 3 deletions(-)
> 
> I just spotted this by inspection when I was hacking on our exception
> entry code.

Reviewed-by: Sami Tolvanen <samitolvanen@google.com>

Sami

