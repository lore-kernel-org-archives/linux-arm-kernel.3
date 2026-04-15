Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C88F9D0F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 00:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L86pgMPaGWjmqPOMQTdb1uBGsJLkOLipSbIJUcawm7U=; b=eZ9fJTLHqLi91/50QmsU7Re3uz
	wqSPql/zhFcLHLErh6U5S5pm3b0RiAGFOWpbEBhlDq/58k+SW7LtONgMho7R71RHXVadU/RG4SQyB
	zKiImIwqRv4rsbwsIJRVWiDPn/O7xQTzgnEBTQYB8fkZWZbQsopotnEhV4cYtrvpTzsNqbu+TR0oK
	7/iodcA1HqCGa851jZeWKdr/XQu6PrHUPYPtCOImtY1pE8cuZ901kvvupA4b64TwEYEtGuiARI8iA
	rR54+ikargrY1XbDVyADR6PRrLiH+auGBikWfdyqgg8+lJzRZ+oVHTb+fvxl6JumQhc69YSy5x/sh
	5w349TUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCnip-00000000M4S-0ehl;
	Wed, 15 Apr 2026 00:03:11 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCnim-00000000M3y-3N4a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 00:03:09 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b982b0889d8so887412666b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 17:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1776211386; x=1776816186; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=L86pgMPaGWjmqPOMQTdb1uBGsJLkOLipSbIJUcawm7U=;
        b=SENmzCpDA61swjM/z8zf+eZSUU/x6rGlDCDF3sFTcSkPSbeqfhklzQtF7ZRFjwe3fR
         m+++CzCKO/5HnCOpEVFpurZUKrsu0ej9ohWp2knxe593b0intpsa05IganX4fNw2YJPA
         /F/BZxdkW27RXa9PFhlgcOVZg3IVnnpfT+Nws=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776211386; x=1776816186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L86pgMPaGWjmqPOMQTdb1uBGsJLkOLipSbIJUcawm7U=;
        b=cvzdrdwg29QXNPnazxSpdCJEublFl8pTsCCJN26928CqOHKpiXQsPZc2e9wttSEQSg
         oIdGnNsv8UYH5zW8beqdKknAJnOmDkQfN+bs+dAAx9s9sHxEkgEQ6nRT2PFr3WpiRUPd
         8X7soO3V/LQFzJzSUEIJMAQ93/RUEtnw7tS5vsS/M8r4h9ZCS81Jy0lWBxneE9i2HHVS
         7nfSB4w08S/NQcDTLVGqAxKrof7JCvnUoekoERaQQHnlWVTZVHIVHDcbxaCwDbfVOHUG
         eseYuiyLezZFCXCQaSs7rhDBOXV2eECtRrluNIAbJFyXxX3VhecvVDsymRC5YKKEDrLX
         ZaQw==
X-Forwarded-Encrypted: i=1; AFNElJ/DjN6Ps/U2dAfubzrWOn+JzgBMjH8uQ9qNO32SvNpubFQmTftMsDpMZk490SZtGnanXh6vzcZBVPSWguo39bsa@lists.infradead.org
X-Gm-Message-State: AOJu0YxMB91KNvuwAVCoKKqASAJ8cGgbp1U8oQuWqCujLgko/sxlNmNt
	uIOciu4yy164i9RvKBRXOsZ4Tqeiq8x0VeeSkQDbUjgg5q9GqILFUDQ4SFAIetDyzyV+EqG/xep
	CKIzjEYo=
X-Gm-Gg: AeBDievneibdx9CKE5sftSyVOOLJyX4wD6CAVr6SgGnMrkuF+Ff1Z67q5LHf5VMkX9s
	+RpoZWtQWYOm6I5WSCeFiu3vuQonua+krheNEB4qUwU3v6LOLPM1whbrPx9CUZTvHyU77FvIAf6
	xT75UIU/imUgio6+70aksiSrBDat7TAsQSSiXsMqOAGNtxz/LODOOr+dd7VCS6oZKmBVCDRAMUe
	JVApWPPW2im8zuAl7os8SvyxCZvaPW+mbAW/HtdvSWzbHyhpfuAo2QlY8SpjQl+S0HamBmNJtRC
	IO9vEiOM/eO7DXj5QxGq2vrRYi8KmeNgYn3UUZSltYKMSpjmdkO7bBAhwJi2swr8NzPQqiBkiHv
	zgkmBxhMOYM8PPizWIsHwI/qo1t6LauSdy+SGLPmI+wxKxQz/0AVxwcJAOngbM0KkEQ/Es8+DOn
	RMxitoLcmTrMeBldU7ojII81h+zBR8N1QyCFhX9/0loMG+VgI4Xbq9Hqh85lxfdCQeQwHL3Dh8
X-Received: by 2002:a17:906:f582:b0:b9d:6109:f1fb with SMTP id a640c23a62f3a-b9d72440757mr1145859966b.11.1776211386141;
        Tue, 14 Apr 2026 17:03:06 -0700 (PDT)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1784a656asm214066b.62.2026.04.14.17.03.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 17:03:05 -0700 (PDT)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-671a901584eso3403935a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 17:03:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+bSwv+qHCt1S58ZkKbmzDVpoHl8vJVB+vp1U7RO5UE92N+pEf2dRZdDi8HS6GSk0MDZi+nev5blssJgLYgaJE4@lists.infradead.org
X-Received: by 2002:a05:6402:280c:b0:670:64fd:2301 with SMTP id
 4fb4d7f45d1cf-670795162d8mr9495589a12.15.1776211385010; Tue, 14 Apr 2026
 17:03:05 -0700 (PDT)
MIME-Version: 1.0
References: <ad5Fh5JUqptcYkrp@arm.com>
In-Reply-To: <ad5Fh5JUqptcYkrp@arm.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 14 Apr 2026 17:02:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg8+BER4VyFKG3rnPi2gXxbf-jbHS=EU+xhFqGVQfbutw@mail.gmail.com>
X-Gm-Features: AQROBzBThzQrw4bmeV6J1wQT7THcBE8GVty-3tqf4UWTX2lNKJUVf31HwlF4DBQ
Message-ID: <CAHk-=wg8+BER4VyFKG3rnPi2gXxbf-jbHS=EU+xhFqGVQfbutw@mail.gmail.com>
Subject: Re: [GIT PULL] arm64 updates for 7.1
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_170308_869585_5CD6B2A9 
X-CRM114-Status: GOOD (  14.25  )
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

On Tue, 14 Apr 2026 at 06:47, Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> The generic entry patches touch include/linux/*entry* and kernel/entry/*
> as they are based on a tag from tip. Not sure when Thomas will send them
> your way, so sending the arm64 pull request in the meantime.

Ok, so the conflict with the irq changes is something that I want
Thomas and PeterZ to take a look at, because it involved two calls to
hrtimer_rearm_deferred() that got added in the meantime - while in
this pull the call site then got split up and moved from
kernel/entry/common.c to include/linux/irq-entry-common.h.

In my initial resolution I placed the two hrtimer_rearm_deferred()
calls very similarly to how they were placed before (just in the moved
location).

So my initial resolution was the fairly direct "that's what the code
movement would do".

But then I double-checked what linux-next did, and it did something
quite different. The linux-next resolution isn't the naive direct code
movement, and seems to be a smarter semantic resolution with just one
call-site.

So after having stared at it for a long time, and convinced myself it
was the better resolution I went back and fixed up mine too.

It all makes me go "PeterZ and Thomas should double-check me that I
didn't miss something else".

I did the builds on both x86-64 and arm64, but I feel it should still
be checked by people involved with that hrtimer code.

               Linus

