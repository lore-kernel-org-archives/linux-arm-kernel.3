Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9AECC88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 08:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bw432elLmhA4oy2qWRZIhT4M5eB1za1G9hSrgeusNHM=; b=1xupGzjqbWbkxAWmo2vxcz3ugU
	NKyLfu/CX/8M8WBYd6Oi0q+1hIonwh0dHqQJNz//1qu8/Fm0ZNinulYHSSPPRF/wao6S66Z5nklJn
	thGUfm0hphfbOa1RWDVpOCd2B8h0QFrTYs88QtiFo/sGFnxADXMhc4KKwkQKDFJ9AgaENEyBNnvs9
	1Zb1y9RpVXjXnSqciGoCbD3beqLQx7rVgSbZ8JfWChkM2f+CbfXR6cv88z/lXRp9NLX9N+4D1RN8V
	r5lu60jilaRo5CplsQ+ZgNSsIrXKROhOlJPe710RUG5CGE8TgRIzflLasFgHVlK4n5T+AEf6ulFJG
	Q1p4sKPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ktg-00000008hsY-2H07;
	Wed, 16 Sep 2026 08:21:40 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ktc-00000008hrS-1MV9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 08:21:38 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so3324665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 01:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789546894; x=1790151694; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bw432elLmhA4oy2qWRZIhT4M5eB1za1G9hSrgeusNHM=;
        b=WQSC3Xo326XsLU2+mN5PPx53Gt4YMe9n6eANRF9jqaMzkep/uc/KJ4yvAkkOA2i/39
         +1RPjuQIHB3YTTeM9f6N7CRhN14BrEAaqmw01XO/7fHeXjav90FP0s733c5JNwikOTAK
         YH4wDGBRtG+WlWb/ePfl4azo0fd1Q4YQv5lftj8WXwgNp8qvtjuM3kpThtda1ADX6nge
         MEiFCJOevak2tJ3yfEMeh6ObkkhjxqIoYIqGTcCMmTOyMUIkMwFKFKL1c4550WJVR+Pj
         wmScAcn5vIx6m9r1WiWCjGnEKBrhn1Ugz43QsbSeuh0Z6klHRDOaq+FCMU9o/7DFrlP2
         jqlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789546894; x=1790151694;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bw432elLmhA4oy2qWRZIhT4M5eB1za1G9hSrgeusNHM=;
        b=qIEmGMZec6Vd7bB4Kv5xzSaEXbpZj0iX9Vt4mt9vWl63q9hGNN+F9aCC/FJxt00LzU
         yhYlSPRFBG3L8GyHtSOpkx0bFP8egT7Lau37qFcgPw8ioD6xxFkAk4CelO2ZmgzHROTP
         pcnpfVFHSMLNXPu73jJ8LoDIqn0SpDZRGxhYrRdRsBTMo9H6kt2wcg9QsHsdEoPY7RDM
         l6Bct+P+GkpWEm7ORn8G0fYvHnpPGb8pv5aSr1hUsn/NOQ12Yf4BL6sh1TFznhoWh1ly
         rmi0b1AUQYlzian2X7IjtOTD+0ZpW0fR47+fMQzYtrVG+bYTvV/ZpAQqfJDIakxQtuVI
         XLCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxk5lzDWSRYjGol20HvthEnwR+YuymhcXQw1XjxPPjuNueJHZQn+k83rAcC7DniMEVb2kpNmGYn9NEmedQOEU+E@lists.infradead.org
X-Gm-Message-State: AFuF++mvRd1Zq8cLrKQLsk7FZTcjRG9IEnRf04xpIboKObregmSjJHVo
	xhwUbikioDQOo+FQZi1Xvy5N9NrlB1itjj7of5COxd7ByELo1wVUaf6a
X-Gm-Gg: AYBFou0F/yfeMUTbj+4lu06zTEDNwZHsgV5+l7ag5Lba9vmJLLDqyDtiaSrk4BwSu+Y
	sgK+0x10f5Hlrn4+SgcJD0ep+gAXn/4Xn3EcIwblzFnql7/johuLwIf/gGKvnpfgQJi1sNIh9M0
	JAbsPY1tr42XSj4PACQHprZe9q60xLknI+cgYOBhs6yVXdQXiTzK703MJMnSulW60SZzkm1PkFO
	+5XmkTKASEIq42k1y39zoe8QstS6ynurI8ON1KFbDwOB9lzwKCyYaP203V+8ucnfbhG5vz2oGvX
	9vcfw3LLyml8jZkutDjG1H3uPScVSXaSkcpBFNZhr5F0T/Y2TnQCyg1WU4KXJFvw+sWU58vdfUu
	JTIMmuTRBF1GVmCgcywyML6CUtdxv3gPJZu/BHIAvlrV5uUUvTOnFlx4IuHA8AIeczQIj2GQ9yL
	F7ciW87bH3phCITkeEi2rKrpiTfMVxXfk7h0HntUbHvQcEjmzxc/SpJYMpp8odOsnd6DXLG/1ea
	p2uQ0qXUPOcFswEYsPRprLqIdeFvqHojGuFdjY0P+PzMQq9Pe/+uPgYit1uLdJMFRA2zC9aXJr0
	jJtRqNfufzLAE99Rg/b6c3pqZEyYl8rNS31GuwmILRm7Its4Ad+sRzfxRddVL9rEh75NrOcuorX
	kR9VnW7MiF7r9jgEhbvAr/mkAUxebHHYhq9laaWMSIZ0Dl0rLxxe7UseBI4Yht5nm7dSKU4EM3m
	fFfPzg
X-Received: by 2002:a05:600c:470a:b0:49e:6bce:b0f9 with SMTP id 5b1f17b1804b1-49eb732cc87mr17337945e9.16.1789546893641;
        Wed, 16 Sep 2026 01:21:33 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83da071asm73394925e9.8.2026.09.16.01.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 01:21:33 -0700 (PDT)
Date: Wed, 16 Sep 2026 10:21:32 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Johan Hovold <johan@kernel.org>
Cc: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Mathias Nyman <mathias.nyman@intel.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Heikki Krogerus
 <heikki.krogerus@linux.intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/6] usb: core: add missing
 pm_runtime_dont_use_autosuspend() call
Message-ID: <20260916102132.00005129@gmail.com>
In-Reply-To: <aqpOlKtxeROh-G_s@hovoldconsulting.com>
References: <20260915090223.1346-1-joshua.crofts1@gmail.com>
	<20260915090223.1346-2-joshua.crofts1@gmail.com>
	<aqpOlKtxeROh-G_s@hovoldconsulting.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_012136_392542_FE2C6F5A 
X-CRM114-Status: GOOD (  17.97  )
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

On Wed, 16 Sep 2026 10:08:52 +0200
Johan Hovold <johan@kernel.org> wrote:

> On Tue, Sep 15, 2026 at 09:02:18AM +0000, Joshua Crofts wrote:
> > The fail label in usb_new_device() disables pm_runtime on failure, but
> > doesn't call pm_runtime_dont_use_autosuspend(), causing resource leaks.  
> 
> No it does not, as the device itself is about to be freed. Sure we could
> disable autosuspend again here, but it does not really matter.
> 

Okay, commit message aside, you still need to call dont_use_autosuspend()
on teardown as the driver doesn't use the devm_* counterparts. Currently
(according to my cocci SmPL [1]) there are 195 instances of this in the kernel.

...

> But this one should not have a Fixes tag and does not need to be
> backported.

Yeah, you already mentioned this in IIO once [2]. I found several instances
of patches like these being backported however, so perhaps times have changed.

[1] https://lore.kernel.org/cocci/20260915064327.1377-1-joshua.crofts1@gmail.com/
[2] https://lore.kernel.org/linux-iio/aoQEyeHUiTwWenBL@hovoldconsulting.com/



-- 
Kind regards,
Joshua Crofts

