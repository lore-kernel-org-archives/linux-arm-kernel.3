Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A402C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aNXvnIajDX/7w3x9F5uELFST7rm/QC00IWx5n1LjaBY=; b=kWSvgl+aXqV3VrJs69RxqaeaEx
	mythB3TTWWZidEVTQIqhflX+09dVABxaKt28LK18hJGC5MLqOzmdEfJASCzctvxCfCWhtr76Fs7fV
	57xVjaDfzoFdhvfrpYSyphaJpeZiwunQwzQbWgwTdjRdmCSiKk5ek1Chw3yYvq9aJkXO1+uYu1nPJ
	fz6FRY2oSvHhuQIw97e4Vu/V44t290ERfVZeknRQOqb5Md+4oM7TqZUt3vFW1DrJpVL0I1cn8pEqz
	vGUfHXXuWTgTKZ0jppoafzvYfn9rqYgPNSthDQnXC9dUXsSXCWYNyUsUcu5DhfCkIh41Ogz2QPAZU
	JjAR7d2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8je-000000023lZ-0G3m;
	Wed, 26 Aug 2026 08:11:50 +0000
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8ja-000000023kL-3oxU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:11:47 +0000
Received: by mail-yx1-xb130.google.com with SMTP id 956f58d0204a3-66c7127a73dso881799d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 01:11:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787731906; cv=none;
        d=google.com; s=arc-20260327;
        b=HtVkbqHhMRxP/5/V6kH5r58BXFJT9cirDjzpVLaazhYiMz0ZgmMF/s3OTPvsxMigEP
         HUpFNbBeoPnQxkUFdS6N28DdQIIJFcM1iJwd9nBRdIFTNfb4S7yWwiEZ1kjBu6AkvLr4
         6ayLlbYPBiykIqvBPINxs3ZfjcggOMcQ3KmKkP6+VlGDa5JjaRN/fig8W5yHFMMBz2YP
         qNtBYDLID1ex/lNNqIhZEkMYZCAB32Kpsxq4HlOvAuDGDAkyffFjp9KaNVyrfSwCTUO4
         xfQ6EzM4PesIjkRna7GNaz4JAr6djMyYXZDp52rMayL8v2vVuwNnUcTjH8DZPIy1FauV
         OlEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aNXvnIajDX/7w3x9F5uELFST7rm/QC00IWx5n1LjaBY=;
        fh=kJBqm3GtkG5OV9yTZ6m/m9ZCDiM73KS+/PUcSR6rNhk=;
        b=ai4QbfvWWeTGBMHHmrkWDu/mdP4Uk99NzJOsLpGj7uk2SMsrkavahBloaWWbOFsj5Y
         r6U6eHwJpbqcVsJk+hiX6KBVxTRKNZxPmvg5hJCz6w2amlrxDc1JH+r6+P6WvwVMBxNp
         fP+K9M4lpME1AGsHzd/ntmx+T+Ml1YaOha4gJkdcaTOCcVGMhdRenXSOXf6u3YmpUo5S
         TfucOYl2OFkgIyFTJmnoT87P5oq70rSzCwI/g9TJgvEM0uiSm9ojq3WSGZyr8ETMng8b
         VT78MyLJ1eSiuFMLdsLxpA0v0Y5ar/NdoSzsb2QgBGlbfDwDokqXjoNTLFPBNJGD/oOU
         N/fg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787731906; x=1788336706; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aNXvnIajDX/7w3x9F5uELFST7rm/QC00IWx5n1LjaBY=;
        b=cV/ISqRHiLo3U7rgD1f+PFbp4WdB6gr+NzCT/zNFNLGXL1VD37F2+zloh11LfNHKTQ
         X72VtUt303XxJ78wdc9XqsfVat+DSOjZs5UKyk8acRGrFlXAi3kcPmqh9cWqD1sYZZIY
         V+zqSyAWbYt4tSUgRiv9+JkKioKFY9LZNq80xNARcGK8Dp1X00t3TERRjKNUP4zfdgSv
         jPpyr4WMLqghb7sKHND8P+ucFR3sPFgfKlOO4J1FeCuCQZiqLLaY57fxcJxjoMVM5Nw5
         RkbUKtE9ntjR8HcgYAEXnPcUOD3Bm6fv1uk8FLNGzFj5cv9kJdCYscfkIXaYlT6QJIt9
         Oxgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787731906; x=1788336706;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aNXvnIajDX/7w3x9F5uELFST7rm/QC00IWx5n1LjaBY=;
        b=ZisAe3sfsiNdj1J8tjMc+Mbj5not3P7gcYK4XZ1R17yDH4aXhKVeieRflqcWgdNjVZ
         7emgseOn4ahZewUT3okxvBCU8MhzJAKaL0GCzamOt1UXenUMclRLYbrhYpWCcaI5+9+9
         ZQyvafJbK8lBwBREpWzBU6dm2OKY2k+FkVoMnhQiGLQgmFE5v5H4AINbbymYNCbSRfRd
         1VnD0zg67SYiwGWX6VPGdJTo8swm/lRYISIn2gBUeC5+zIcP2cHBAP9486u5pTyzrvRv
         CFZlXcDfeF1yynGwEKTpMlOiEu0RutBsBbjNzJKHMye0MvktDK5nFKKFyM5mWQ/C6u/l
         lcpw==
X-Forwarded-Encrypted: i=1; AHgh+Ro/jRU0C/MeicNph0tHQJgRsyl52veCnpK3PC4Uml/LqMRVoG1EOX6MQRxFEuJCQB0DBCnRVRhAsUs5cluL9eFY@lists.infradead.org
X-Gm-Message-State: AFuF++mtTm9if6eRT6IMZtYUMrelajDcic8KHO+nlb4fkBKGBRAC0lDW
	3l0Ez+gt3pW3iP7eRU5T8fuwLAGTQgl/WTKpuNPH0L6rvuMNJrxcGBoomzmOBMhtIg9Z2B+4FBG
	giTzV+eQouyDPsiQWaddlLcfThhp30W4=
X-Gm-Gg: AR+sD12xHnO5Tfx8OLAi2r86baAmvv9YpE6rh7iiZ3LV4O74via6LE5QmqsXoOFavFH
	zfAVJ64DH1qo1tbNvNdXOEnIo+pg2jL7hAsBNWcM18wzbnGoiM620EUiU7ltzQhEXxsYYOm1+1+
	D3km0xO6/uZI6yFW68cC0MCd6W7R9FgC63w7Z/Lijz8W640SQrn1zuO5ETbCXp/I/BAG6QX0K85
	tFsJWTj3SA6voa4EaHhKuix4PrXBCKW4HgVYykbF255I/zuRkB2k23t3gLC/vnUG9/zKm7RI9dO
	L7rLUZirVEv054qPqXpXIAfKZPC+KaXa4dGQPin9T1UUQUY=
X-Received: by 2002:a05:690e:1188:b0:66d:149e:a901 with SMTP id
 956f58d0204a3-66d256c264dmr1479589d50.21.1787731905567; Wed, 26 Aug 2026
 01:11:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260808105657.2762974-1-lgs201920130244@gmail.com> <3ae8e5d0-4677-48de-bd2a-3315f99650c2@kernel.org>
In-Reply-To: <3ae8e5d0-4677-48de-bd2a-3315f99650c2@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 26 Aug 2026 16:11:33 +0800
X-Gm-Features: AcwNN1X38av1r3fQHAr6_E215JsX9BX5UoU7-6ID8IrKi7kZhsgC4YYykT0ACvY
Message-ID: <CANUHTR9GnWwDbPK-Hmnc8TY1Hrn5tnV81ytb=wpxogCZY9XTNw@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: ste_dma40: fix autosuspend cleanup on probe failure
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Srinidh Kasagar <srinidhi.kasagar@stericsson.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dan Williams <djbw@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_011147_018682_647C3DA4 
X-CRM114-Status: GOOD (  19.02  )
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

Hi Krzysztof,

On Thu, 20 Aug 2026 at 22:50, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 08/08/2026 12:56, Guangshuo Li wrote:
> > d40_probe() calls pm_runtime_use_autosuspend(), but its error path does
> > not call the matching pm_runtime_dont_use_autosuspend() before
> > disabling runtime PM.
> >
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during cleanup, this reference is not dropped and usage_count remains
> > unbalanced.
> >
> > Add the missing pm_runtime_dont_use_autosuspend() call to the probe
> > failure path before disabling runtime PM.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: 8d318a50b3d7 ("DMAENGINE: Support for ST-Ericssons DMA40 block v3")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
>
> You sent vast amount of patches, all separate, making it very difficult
> to track and respond in efficient way. Do not do that.
>
> Group your work per subsystem.
>
> You were asked to clarify and respond to incorrect fixes statement. I do
> not see how you clarified and responded at all.
>
> Best regards,
> Krzysztof

Sorry about that. I should have replied to the earlier review comments
explicitly, and I also should not have sent so many separate patches.

I will group future patches by subsystem and make sure to respond
clearly to review feedback before resending.

Thanks for pointing this out.

Best regards,
Guangshuo

