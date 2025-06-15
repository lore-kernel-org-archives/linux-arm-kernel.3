Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82CCC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Jun 2025 19:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FlPzMKu4igdnQzEXLhlv+B8h95JnIJGKPzIiOmsd940=; b=b2wPZ/bAws5jat9oSkSApT0wsk
	zVAt1262HRysTXAUGxo+i3gZOWnZqWlkL0811D9ruFshBmrDeGw+GNfWa3Vy/4tydtnC421Dg6oJR
	Y34YJ8ndQbbQESAOecVro7WPTPPLoNU1I7Leg0v4gTbFUO4bSa/HmMrWvxnGxnvwIhbwOpsXAscL1
	lor811Pel1pe0DgEzbCCZ+IdioDc3DsjRyNYmn0njXxWiCwY7ZAWfb6y5T2U7FHuGtwy1PEkz9SHS
	4sTjaiZICn5ZeMKP+hg0pb3PHozm0xbT7iPLBjvo5xMAdvTLtC7tiwnG4AYUxMn78TzOYjM+tMORF
	cQgpaXHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQsrF-00000002lkp-1zbZ;
	Sun, 15 Jun 2025 19:17:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQsp2-00000002ldk-1yhA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Jun 2025 19:15:17 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-441ab63a415so43444765e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Jun 2025 12:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750014914; x=1750619714; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FlPzMKu4igdnQzEXLhlv+B8h95JnIJGKPzIiOmsd940=;
        b=h+st97jmGG98BMkFyYpyVy/TH90T3iAqzEAgGtnsAuyp4MR+p7u5zMc0BwPfrof6G6
         Cv7UFCog48+TNW8Oc6EOTOTQwumMbCmY3dFH3B4vslQD+FtLZhEEl4EyEYj5IH/YvxGL
         c9B4Ds38p1z23xU3ppZCHMXl1l7UbBAtl+WHyq3iiXXM7BkvXeE7gVSfQjARudEL5TSs
         0xPMUnc2CAQ6RkKwOemHT6fdwsYHO16dg8z6ErMsKYL9yrgP4qnCqFb7X/DyK0YYNF14
         3DWmpsYeCOfTdbbCdDBOnVmlTCzAvt7M6ERDuxRYDT+lWPWAcxJOa4RyIg7e20FZ7PbW
         Bs6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750014914; x=1750619714;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FlPzMKu4igdnQzEXLhlv+B8h95JnIJGKPzIiOmsd940=;
        b=vYepaECag9GXkzL3WlPAZnSHjM1S4Jc5IV1x3DNcEwn8d3uWimO+ALfXkXAstro3Q7
         O8SDzG2CIRKJlPjfrb8ojSlUN3aoRNPwJhUbb+ecQt4HKGX7Z9YTWRbw+5Kyh4n96Bi8
         8WaOPniaPkxqiLy1VTmFDtDRr1dZ9J21l+cSQzIXcK9xeQnDZR9X9lyYPPnKuH7HcKSk
         AMKtg/XO+T5On37IMxENm4CHCxCgPBc+of48yoH26LM0QnmzsnARpz74HOVKD6g80pKM
         iKu+8IsNjVjHlaGPBQCQJ5WsYVBi6UMykKEMVOjEIqs8Zn5V2oW7pxVUIMfrdbtiJcBm
         PFAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLZzjNmxP4f4DLhL+z878fCzxroYpN1SNlqWpSOpUv38LLLnxzY9zbvnayCtctklgiCCuNMZh4gaEkzLGP8m5Q@lists.infradead.org
X-Gm-Message-State: AOJu0YwJuxC/LkTSaUHHx6mzvNuKMeuc0v4rRO5sADxF5R6K/wRBrpzt
	1TOVk2Xv0U7zxtH5CDcFLmFuu/q4BVKNFAKa8ZBbqWXq8dX0Ao9eZoIj
X-Gm-Gg: ASbGnctZrF4J6lK7HrkCY2zGuHRCXpwWl/4KmRYPczcdzDtVr+yRvLswDgJwTuXA7l+
	wsB3RAoGoiM/nzLc7QccDCYCMK1Z+U8eHgvwhbjdKwPJBC4hAETNxZGiu4FT+ZQY3k/pVZlVv60
	FSccH82NvUrWu1jPs6SsGepfzQC+OIsLG4Mvdzrl/fd+8P/VMBXSNZwYnR5zT116/1RV5zx6KCm
	fmeHNSrZQbichL294RraqT4woLGz6RQ+HYIC6NlVxJhW2B8LVrhlxtAkVoq73m+uvoeziS1pdU+
	h+EQ5sxz42vuYXFBiFPHXVwzbW4itjNf35zVKSfaF+Ms1nmIfE9oWioTww==
X-Google-Smtp-Source: AGHT+IH2bJWppEAVzSL6erEhSao6ZwWSsziOevhXh5q8BLnlA4Nj/np4851kfzIOx/I/qjbdaicjSw==
X-Received: by 2002:a05:600c:8b65:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-4533ca6e6a8mr72032075e9.15.1750014914236;
        Sun, 15 Jun 2025 12:15:14 -0700 (PDT)
Received: from gmail.com ([2a02:c7c:f4f0:900:5194:623a:df1:d4bc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e13cfbesm118671195e9.22.2025.06.15.12.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 12:15:12 -0700 (PDT)
Date: Sun, 15 Jun 2025 20:15:07 +0100
From: Qasim Ijaz <qasdev00@gmail.com>
To: Sinan Kaya <Okaya@kernel.org>
Cc: Eugen Hristev <eugen.hristev@linaro.org>, Vinod Koul <vkoul@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] dmaengine: qcom_hidma: fix handoff FIFO memory leak
 on driver removal
Message-ID: <aE8bu2woUe96DVo-@gmail.com>
References: <20250601224231.24317-1-qasdev00@gmail.com>
 <20250601224231.24317-3-qasdev00@gmail.com>
 <3c6513fe-83b3-4117-8df6-6f8c7eb07303@linaro.org>
 <7649f016-87f1-475d-8ff7-7608b14c5654@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7649f016-87f1-475d-8ff7-7608b14c5654@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250615_121516_516478_87710225 
X-CRM114-Status: GOOD (  19.54  )
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

On Fri, Jun 06, 2025 at 09:35:44AM -0400, Sinan Kaya wrote:
> 
> On 6/5/2025 9:04 AM, Eugen Hristev wrote:
> > > diff --git a/drivers/dma/qcom/hidma_ll.c b/drivers/dma/qcom/hidma_ll.c
> > > index fee448499777..0c2bae46746c 100644
> > > --- a/drivers/dma/qcom/hidma_ll.c
> > > +++ b/drivers/dma/qcom/hidma_ll.c
> > > @@ -816,6 +816,7 @@ int hidma_ll_uninit(struct hidma_lldev *lldev)
> > >   	required_bytes = sizeof(struct hidma_tre) * lldev->nr_tres;
> > >   	tasklet_kill(&lldev->task);
> > > +	kfifo_free(&lldev->handoff_fifo);
> > >   	memset(lldev->trepool, 0, required_bytes);
> > >   	lldev->trepool = NULL;
> > >   	atomic_set(&lldev->pending_tre_count, 0);
> > Is it possible that the handoff_fifo is freed, then we could observe
> > reset complete interrupts before they are being cleared in
> > hidma_ll_uninit later on, which would lead to the following call chain
> > 
> >   hidma_ll_inthandler - hidma_ll_int_handler_internal -
> > hidma_handle_tre_completion - hidma_post_completed -
> > tasklet_schedule(&lldev->task); - hidma_ll_tre_complete - kfifo_out
> 
> According to the documentation, the way to guarantee this from not happening
> 
> is to call tasklet_disable() to ensure that tasklet completes execution.
> Only after that
> 
> data structures used by the tasklet can be freed.
> 
> I think proper order is:
> 
> 1. tasklet_disable
> 
> 2. tasklet_kill
> 
> 3. kfifo_free

Hi Sinan, hi Eugen,

Thanks for reviewing the patch and for pointing out the correct
shutdown ordering.

If you’re both happy with it, I’ll send a v2 that calls
tasklet_disable() before tasklet_kill(), then frees the handoff_fifo.

Just let me know and I’ll resend.

Thanks
Qasim
> 
> 
> 

