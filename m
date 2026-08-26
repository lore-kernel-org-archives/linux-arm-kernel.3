Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE4DC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+6xXHiRfdSp6lX3gT2enC0bPRKFuLA/vpd3A/BvOkk=; b=k6Qkyc3pag0l6LxJRlKnzB0/3e
	i00uU4XotJbWODAZo5wm30YeJaPNi6qp7SB7T+OD7SZvyiHGKxiDRa/Bkrv6QcpUunE9foWksJ+bv
	OHXfNXuBLNhwP6PcYd0NTq17bQnTEXMYBiH2IaUbyHH76xp+ZoRyD+ZIvDYSkyG3ZuKfwegK7tNof
	S3pC3uQ6EG4DmRpHTHSaxn3r0Aa/tDtuICF2mAe9dY1hsNzv3lSstx3mP3fZwFE2OTn/BwYWAtjmh
	cShoY3j/L2tHEDZNSclPCp/Xnf60GJh85o9c0Q+L4doI2cSh58K0W5+6phiczIEJpK5cw59nZb5Cu
	DzTf2MTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8mw-000000024EA-4AdJ;
	Wed, 26 Aug 2026 08:15:14 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8mu-000000024Do-3UOu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:15:13 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-66c71239c48so1128258d50.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 01:15:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787732111; cv=none;
        d=google.com; s=arc-20260327;
        b=DkG6PkyneHc9avCBsKGLWEYz0/lwvJBAzEMApqDUCokCgPUqUuByxpgeQqdVjoMLaa
         E6A0p9seGgf6vCQEXnDOYov51Gz0jU9KKX5L6A0Gnq14BApZhTJw/hD/oibq4DS159ep
         6cRzggDCaOTWR/3w9ZDZI/a70bs84DuS/n8AkrRg7md/TVjRbombSdmIYWT0QbELoe2M
         SNX+DFa3tfhfD5ZOZRe28nHW7vQMXjWN+BzjTK9RLqGCRbcSogUnN1A+tY+7co/PhF13
         37dXqpWxl1AAtMZfsq1rp9EW4h8tHUenAmrebHqorH7I/UaFqIEeMYqkCdiyaaLKLE5U
         YSUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=J+6xXHiRfdSp6lX3gT2enC0bPRKFuLA/vpd3A/BvOkk=;
        fh=CM75G48No0erkI+gXTHF6opF8UoQsciS7xHhGYDLZRo=;
        b=AjhJkRhDMoqgJ5iXwsy2ODJO7Axkm5LoR81mkX8hbPqQdcN3xQ+NUpIjNgfU20P0rg
         eo4nHfZ6bvkVSPROmf8E9/RE7o/FFhZXtxrtnEY2Kpf4DPS4EL5Htt/jYO5d894siOT3
         NzWHCpuG0B4oveFRGEWTl6qWRqksTFJagOsTSxA+02UihuXLBxgAF2e1/QzIx7SLOQhV
         Ifr7UCCcMHuwRDyQxx4siPfEBFuxA5CzTqInhM9EA4JOXWVfF92zH8Mc/UlxNdWUwP0h
         DOp2YDTgx90tLzcnQJXOUSsOBiJh1hEd5fxhiKS2TR9P2QbJGduxOSB4ypxsr2Uyqh2E
         JSVg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787732111; x=1788336911; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J+6xXHiRfdSp6lX3gT2enC0bPRKFuLA/vpd3A/BvOkk=;
        b=KKehLPshkMBKFj4cdlqopi2ILAR2HwFheinJsr0cVl+gVUeMmnk3h0opTXoSv2pdFT
         BUiWBOOVzvqjux5OkILstuPClLf96xkh9kMr3MrO4ue/LdduOaVggoaYMmZ1KTr647ka
         5J0w7R+mWJlFMla90JkJQb6vkfI9LTAOehCqLm72X9OH+8oMYR644TtiJBprNMXD2pDU
         OTzOd+aQRtpon64psJSkg9V0U32bzxlRygM3RWpfRb6aMbcQYsjvn49b/uM9yeMvYxxJ
         nbkSuZh08cfUky306nqjIGl8aMBfYqg9RJBicf2IkM4UyfbKsJW/8tPZ1c7HhhtVYEA3
         UMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732111; x=1788336911;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J+6xXHiRfdSp6lX3gT2enC0bPRKFuLA/vpd3A/BvOkk=;
        b=QDuUQCmwNApoCpTAAhPb4xAUgFBFlHH4EYDnosM1KoAMSx6vZgxLE/EcfnQLn4z3G7
         QlY5ue3J0PChODZOd6deuNAm/T7V0ysDkWda4iFUJwnnyLK63ch+OisaUA+bj3xPUF96
         vFnsM2nKaw1xYX1OlGVdlQdkJ2xoH6MatY+RRrDYUCuAgxmxgb370lA3l8NK+l3018YJ
         zZGmDRql1g5wPWcHKoHAgg+c89vtwaIFQtUf+F+SBbHJjqCciZVsav0zhzJsv8iMrcdE
         oCh+VREDRtdaTrNVeodYRvN6ZlEkHPt6t6ZfmLKLeshvgQbg0fCCC/phs1twjVwaSIJQ
         S9aA==
X-Forwarded-Encrypted: i=1; AHgh+RpS0MZxJIqlm9CvQZO0K6gzbH+ADrWkDe0TGMxxEFjNNuLKCiYQF2rr+JNqNe5ImNVFXdw0e7gGg3CxgcydCDxo@lists.infradead.org
X-Gm-Message-State: AFuF++kJt0oJjbVRr0fH8E7DUuDrcwGmiW7kJ42o9hYNrOm6OlTbcOsA
	vfh6qRHded1RfrCiTxBvcpIXXkkPccl2LhgA9kW36LROPVPFaV3qnJaNbfrAjAQtm7WkvEbRncF
	Kog0UCqDw48xTnKrG0tNyCte36ChM9rY=
X-Gm-Gg: AR+sD10+oHKFdfaCxPTdDa0UWj1DZj/QkpkheoFUr2gwbSLTDr+RdeQ9PZW1LD4JhpA
	U8q1PoN7tOTHK/9qnPs6HXx8QdXl1W4TcDhDBAftpxbqJ8NMbMAwYDJvGBYQtLCBkshAdBy6K4y
	FHmbmCs5jOTdiZ7ZQGftChczx9B1qvGl0uHkEv0nYA8jicfQyH0DWlu2OCUxe+y6IgVwNwAU72y
	gU9GabrvxZ78XTQDrcj7ApyyLlUsovpvFoe0tAhqLEVcfpBPt7Z2Vzz6jw24ZssYXTPVPFl2N5y
	o9EIbn90ZBFueQI+El1fNORtk6fEnoLB0roQFQiFe4YMF60DIzwE6cbxsg==
X-Received: by 2002:a05:690e:454b:10b0:66d:273e:117a with SMTP id
 956f58d0204a3-66d273e1bf5mr798137d50.39.1787732106713; Wed, 26 Aug 2026
 01:15:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260808115228.2798481-1-lgs201920130244@gmail.com> <e0a9f6dd-f32d-4ca9-b907-51d8893ecbe9@kernel.org>
In-Reply-To: <e0a9f6dd-f32d-4ca9-b907-51d8893ecbe9@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Wed, 26 Aug 2026 16:14:54 +0800
X-Gm-Features: AcwNN1XvjLCGn-p4IXW7KpCPSyocF03h16h7C3wgzdyHtcsVEfehoAO06tMV-5o
Message-ID: <CANUHTR88n4vtE1_nvaAf2Fpp9u8szu72o+z3O4hefP0C5LySCg@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: xilinx: zynqmp_dma: fix autosuspend cleanup
 during teardown
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Abin Joseph <abin.joseph@amd.com>, 
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Kedareswara rao Appana <appana.durga.rao@xilinx.com>, dmaengine@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_011512_899157_0DAAD2C7 
X-CRM114-Status: GOOD (  20.81  )
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

On Thu, 20 Aug 2026 at 22:03, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 08/08/2026 13:52, Guangshuo Li wrote:
> > zynqmp_dma_probe() calls pm_runtime_use_autosuspend(), but its failure
> > paths and zynqmp_dma_remove() do not call the matching
> > pm_runtime_dont_use_autosuspend().
> >
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during teardown, this reference is not dropped and usage_count remains
> > unbalanced.
> >
> > The documentation for pm_runtime_use_autosuspend() also notes that it
> > is important to undo it with pm_runtime_dont_use_autosuspend() at
> > driver exit time, unless runtime PM was initially enabled with
> > devm_pm_runtime_enable().
> >
> > Add the missing pm_runtime_dont_use_autosuspend() calls to the probe
> > failure and remove paths.
> >
> > This issue was found by manual code inspection.
> >
> > Fixes: 64c6f7da8c2c ("dmaengine: zynqmp_dma: Add runtime pm support")
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

