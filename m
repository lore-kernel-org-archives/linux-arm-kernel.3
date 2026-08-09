Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F2BFC5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 15:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpoOGtZKUJbl44PSTEgBUWooLvbSUBKzNBgWzjZO7y8=; b=nYuRc3SgauqSGTUF9YQYBXEsZZ
	zQafYMEoKJ9IqG8h+kr+6c3+0yvmfHHb4JIMWoSxJudyUV6rFkBkRIq+kgLF1am7CarW4rdGHskNk
	kkd3crfNk8N2lPsSkAsfj51mvg7o04S7iq7bpiJQX4NehKC9yQ0F+NY7hhEksJtp+UFgmG4P5+TSj
	WeoqXukL3bQPNuxqEfzxDxS20UswoaZHH9wGzHE+e8ZU63MmJ5gxW94l0TQ1HfP6tUUUe6rjkkHk4
	V34VYlWRZvzqbihtvnvsO5q6d7i+oUJX1OnuRY/rTlBzplnMsRIq1/6W0JqMFAHxaDGDtIxIXJI8b
	JlFOLvoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt57Y-0000000AQVV-2oHz;
	Sun, 09 Aug 2026 15:07:28 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt57W-0000000AQV2-26CQ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 15:07:27 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c998fd549a8so764917a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 08:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786288045; x=1786892845; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tpoOGtZKUJbl44PSTEgBUWooLvbSUBKzNBgWzjZO7y8=;
        b=Qe3KmoorNZ5mx4HCSdmyDyY/Qo6MDadZ7hVc9z4q9rhSDCg3X9d4ibjjKpmynstYqm
         iWMjRqOOR9UERnNg4MHzLsIAYvvYxP15LwVlkzeBypEwyIEt9kT2778mzx0rNDMNmjrm
         NY5f06u7aI4nDDPd71KdfQ1lPuGU99N0l1G9wBUTB+8Njhvj4T5LIunerDGoOnHZr5J+
         led/M+p5vtmAmIEf7r+Bi+oUbACMat8f+si397uokNhXNVJLgH9CzUNPHbssWQB3J8vp
         mW/01d9o/bCcEJjaYLHer0Sa0HBmc6e53HbGmvhV+3I5ZbX1dG4mYX6HcLg+3JVyUPIM
         Rs/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786288045; x=1786892845;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tpoOGtZKUJbl44PSTEgBUWooLvbSUBKzNBgWzjZO7y8=;
        b=QpOU82m1rO0wCR/guCI+YQFe4LU8m9LVo0XO4X1Dy7dzYFbaZYUiT95k9m/gTP5qzQ
         vKW5guHBLDUI8aVFX4jvSJCdBxejMEvPALkfhzaxXhumB296kpA6/Wr2SDUnNvyXP7Zf
         Qq+/j2zzUlGqHPS3DuHz6bwQ/sNsr9fF2mXNW8ZS7mm1hX3r5saNw6iOo/oNtmR2FNuR
         A/2lQjwdpOXWvN+4hSoP+thwbrVMp/2mIKWIMEbN9VAnzgw+T4wnK8SEbQxuhveEMZrV
         h9Hnk54/Kmmt/qaTHheFY7gOWyjN/LoxKs3r1Zp21ZHNajIpU3/FCN26bM/RbuJTf1Rz
         68dA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1tHA1ocwEwW2poU8zLJed8LohilDjiLnwVjyAwFsJKBv1j7H80M1ZB7ZBq2mRZ6WHrp+7iAVkIkL7QW9xn7ri@lists.infradead.org
X-Gm-Message-State: AOJu0Ywswq/QucEKD0Sops2J83yd6S+pVo8ca8oaa7weGKX0mxPHzLOX
	2cc4P7szz52ytnhwpIi/gMA+sFhL1FKiKtyPJaN4n3bwHPl8zxpBIAoH
X-Gm-Gg: AR+sD11YjQzPULYBSjLmN7gIw0qp84FL5T66CTQVLH4tnhKKsbkE4he16OewpBV/zUQ
	tGofjnN2NeozbWDo0c7Fa+bgXNyc/e1psKGClyEM1tUie/qUZdHXTK9G7HzUXkqs+hzVZ8g4462
	ByGEyJOBvf4RkaHqaC59mUxRJLNvZ1E5x39EdobgQV7hmZf7iTTukgWk4ZG9F+d9IZGn1xqN2D+
	O4hv+KxuwHQPouM9FXjGh6ceDqqqf22KGLBHHv5DAimo2VnxbFCuQ1kC5PCO6iBJHEwtwoRYFeN
	3UHf+wgodeK1xcDUtWz+/BdnQ03Lg5sn1UuEBnjZbVYi4WdRPplTIRy1raEsFUpM6SaYzRnhk/F
	xfM5WyYvh6rE7Duemi4BxuFyIZ+B+qpOZH2UUMgWo81T3MtE1py3i1aj1CBkK7Bm653A8MQk1Al
	xkV4DPdSq9YSXpOaq9KYkhtXeXavBUVA2lptHhcNQS0ml5xsUbIEiv2r7418s6wuwoWeEeOxuG+
	aM=
X-Received: by 2002:a05:6a21:7704:b0:3c1:b9c:4890 with SMTP id adf61e73a8af0-3cb85ea4e17mr43246334637.22.1786288045445;
        Sun, 09 Aug 2026 08:07:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec68468sm34471013eec.31.2026.08.09.08.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 08:07:24 -0700 (PDT)
Date: Sun, 9 Aug 2026 08:07:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: phucduc.bui@gmail.com
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] watchdog: stm32_iwdg: Propagate errors from
 optional IRQ lookup
Message-ID: <84fbf9f7-4b30-48d4-895d-efa10cffcfc0@roeck-us.net>
References: <20260807080447.35479-1-phucduc.bui@gmail.com>
 <20260807080447.35479-2-phucduc.bui@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807080447.35479-2-phucduc.bui@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_080726_536424_DB1C6C3A 
X-CRM114-Status: GOOD (  11.08  )
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

On Fri, Aug 07, 2026 at 03:04:47PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> platform_get_irq_optional() returns a positive IRQ number on success or
> a negative error code on failure. For an optional IRQ, -ENXIO indicates
> that no IRQ is available, while other errors should be propagated.
> 
> Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
> probe without the IRQ.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>

Applie.

Thanks,
Guenter

