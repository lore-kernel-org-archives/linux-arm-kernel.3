Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5109CC5DF85
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 16:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=77AfpPuYjDKx/5NnMNRhA3lWjDKSF1kXAbYDxJAMzsQ=; b=EMuLpMjq1ahPj5dmVVW1Ulq1aM
	Tgq0T1pEoqgawOMUEiIAtt8gH9DJXp443Jug2lIYsyFlrbJjyxp/Laq2cJbHgdOWFgEU0J7awmRvp
	sR8KOi8CzFnyzLdgcWPbts9q3aXBGo6eLo0df44SI8fWR2Ao7aD4TBDDrjpFDMzgntMdFJYBbPh0f
	/jn12DCiuWgCkj7ARJpyePMMy+IGN7Uq7fGMbc+cZLCJ6UW/9CstbSf86po066wpj2kHzaOUPyRYn
	oNukfOL87S9IC/lhVUNXVKz3joMvip5B5xTLcMV73AhBHbu1bu2Nk6VZpMAU7dZ+iuYmMWkVMQKDE
	zHFVxQPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5Gv-0000000BrKm-3qqi;
	Thu, 20 Aug 2026 16:05:41 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx5Gt-0000000BrKR-0EnS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 16:05:40 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c9e7391839cso74457a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 09:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787241938; x=1787846738; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=77AfpPuYjDKx/5NnMNRhA3lWjDKSF1kXAbYDxJAMzsQ=;
        b=EkNwWOfoZArj/W/qfG0EYpHnVuMp90/sFgsyQYOU5rk1AMB6bFxngRIB0LubehvSfB
         J2ggJEBnqAc98yT1mfawpqdAVfG/C7tNkw1N1XlwBB6Jf9RmCbuH4hZVyK7HWuCJPtvH
         zFhrmYr/3XZbXP2GRdBaOcPR1zSwrPMbpwUWTGwadH2XRl1duPOpGHtDEY/MdZ17JO/5
         9PZ9rEq5INK3IopIDJMbkGgSeHYlUTbSPpsVysOXy+I1QHoaGtf/3tiYXs/I4G44zUiP
         5S8zUTu7zKBxLupIwqe97Lx1tuw9Sz/3LqouO7jPgmmwtbPN75c/GgoRa/8mOzZV4vtC
         aUwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787241938; x=1787846738;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77AfpPuYjDKx/5NnMNRhA3lWjDKSF1kXAbYDxJAMzsQ=;
        b=h7nb9qArsvRUYFSIHiG6x7SfLZ/LniktY/iVRvmcIRwqPfcD5yqjh8uyePivgFyIn/
         H7Kz83CP9u/y0aoS/RXGEbryI6YOj+6+rqcl2z6MzRRNm+/QflQ6xrS6bRgXvQyOAj9A
         H+xY5NYq18F1q8Xfm4ZkUEk/6TlPUTFj0TRa9W6nkhFJu3hEi8ePjjpYcGh50GDZQRw4
         akUtTRDYoNJhyKEsvp8dJUl45ds92lFdbBb00yrxqfs06lTVSN0M6wvTgmjH+ufrSpdP
         oeFGPTWdrpKG8764HuCG9h5EWus9KYJqdT8wE59MySY243Q/4tkj7tVrUFY7j38h0x+X
         RSsQ==
X-Forwarded-Encrypted: i=1; AHgh+RrwmCE7lzneAfiLcEjDimabukZiQdG/k275ODRlpgF6KHuUH1oKQAE/eFiCUxJT/EoZRhS6iBKM+BZTShnnoT5g@lists.infradead.org
X-Gm-Message-State: AOJu0YxeE9/PQF6KjPkZdz/5UqcfVEZJZplUOByecpg19/CFrrjLAtd1
	Ax5m60uF8X9CB0Xcf7+T1UTl77A35NvR353btRo6Bs8zUEMD8WNzSOloOWagtw==
X-Gm-Gg: AR+sD13AerfIZcJvw5kPTUYp5VIm1Q8lMFKJRdl6oscSQ909hVUYLKT5qJ35cGlmwTp
	yo6KaQiY5kQ9C9gJNHQphkMHj6QqL5M8t1tY8+Qj4fsFbjk24zzqUcl9pjq8wAgzA3QCSCBKGdC
	fScV4n2nOe66NBFeml+ZtZxDFrDD040VX8EEflQ+0z8PCyVy56xaf7TZG845ye8OcddkcE/P902
	YriWImZvaYsdM5nQc54BahF3o4x5D8WYWd1TBxXPBInLkEF0XCNHOPG1GG5pWjsBVSW0kn+jRi3
	7v1BRWFkz68gdDZN6Kuyq4/v6Y9nrUeelpDeXWOmfd/q1Ebc7VJTnwBVE4BL5LRCyv4imrtiFbG
	E4RwKo6OAZ3078KyuPE6XUNzdYUSPDx4zxt7/GZbMcY6Y3fBR/IIUN+4z0DlOjcnHttgP1Li87y
	JCAoNO/aXYXGg9Q7zEXh21iG1rwLL0q0qkdn63/ymejPQj1PuKzbDXX50XC5YgJEDZQx893LQX6
	A==
X-Received: by 2002:a05:6a20:e607:b0:3c3:89ce:b5bc with SMTP id adf61e73a8af0-3cd01213941mr29600286637.15.1787241937892;
        Thu, 20 Aug 2026 09:05:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf1970b0sm18397918eec.29.2026.08.20.09.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 09:05:36 -0700 (PDT)
Date: Thu, 20 Aug 2026 09:05:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: linux-watchdog@vger.kernel.org, xt.hu@cqplus1.com,
	wim@linux-watchdog.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] watchdog: sunplus: fix sp_wdt_restart spin loop and
 timeout
Message-ID: <5f3534be-ce81-4c16-8391-c42b3f880b57@roeck-us.net>
References: <20260820125304.1583383-1-ag@ffroot.co.za>
 <d37eef21-a877-4500-a280-493e98c68701@roeck-us.net>
 <sa6wltkx1v8.fsf@dev-ag>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sa6wltkx1v8.fsf@dev-ag>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_090539_099269_21EFAA74 
X-CRM114-Status: GOOD (  19.71  )
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

On Thu, Aug 20, 2026 at 05:12:11PM +0200, Andrew Gaylard wrote:
> Guenter Roeck <linux@roeck-us.net> writes:
> 
> > On Thu, Aug 20, 2026 at 02:53:04PM +0200, Andrew Gaylard wrote:
> >> sp_wdt_restart() returns immediately after writing WDT_RESUME. The
> >> kernel continues executing and the watchdog kthread could pet the
> >> watchdog before the short timeout expired, preventing reset.
> >
> > Is this observed behavior or just an assumption ?
> 
> It's an assumption.
> 
So you habve no idea if this is a real problem. I am not going to apply
this patch.

Guenter

> >> Add a spin loop so no other CPU can pet the watchdog while waiting for
> >> the reset. Set the restart timeout to ~1.5s.
> >
> > I understand the first part, but why delay the reset by 1.5s ?
> > That is a functional change which needs an explanation.
> 
> I had a printf there to confirm that it actually reached that point,
> so I needed the delay.
> 
> -- 
> Andrew
> 

