Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EEAC5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 11:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YyezoFoFPCNjT1JLWsn9kc+dgYlM/fAe8KTcnpWOz3A=; b=JwTB5rVjSj3S5NgpbIzRz6iXre
	76ugnOg5DyWPvn0SGn+wbih0RmZqdJgS7h6t804kt623ih1TqmXn1JqCsKAnclFn0wE18NAKEdc6/
	maVCgQm+r7Ws1EP5XLdY8VXGowOJGQdrwmfdf1aJ90FWWEbl3tYVYweqXYTZe+/WfYaP2kcV52VH/
	9E/a/YSUbSvluUZDzgZzFDptBa2H+EQRpMSiH1Irm+4gbG9QwPLtgPEkDcnPzbtYZA+1deuL6fkZW
	7xP+xezgKb4C4LYLtSIx2axw1riZzlDDcKA3VGcM1o16fpEW90EngqxYUO45F2e8fyaqKMYGLBSBX
	hQF5mtvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwe8o-00000009dE3-1rSy;
	Wed, 19 Aug 2026 11:07:30 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwe8m-00000009dDh-2Yw3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 11:07:29 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4954dff6536so7392725e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 04:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787137647; x=1787742447; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YyezoFoFPCNjT1JLWsn9kc+dgYlM/fAe8KTcnpWOz3A=;
        b=n+OReH6mZN6TyjbEGp3vGi58uUWRusj8VBycilTrpgNj5NkYmL8PTRhLw5W1CI2Y5v
         78mk7FRvNSEF0S6xMzMhcJr1cekDLenAEbl8EgeDXLlcXszF5JYneuWKI8WCNhUYUk2n
         xm3Y/lMstWTKhuDjSfITO/XWMeQOL6ucoSvrJe/2Mpds5qVYZKieF3HvlebKy+waTbwn
         t31n1jbkYwbvU0CU9u/tb2/AkVnTStx7GZLSwAXebjheMI7jFsuPY604FJ/MiGrOQnFr
         Q/oRui7ZqHNYzJK9v+SrEKK5Rc4hWv7BCrjFtNecXUohIgxU2fXwTLVLcUXE92AEJyJ+
         6gUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787137647; x=1787742447;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YyezoFoFPCNjT1JLWsn9kc+dgYlM/fAe8KTcnpWOz3A=;
        b=r2XKX1DdWw42vKs1dapjHTNJCpUI90X6BJIQbxs9WtCqAlHEbWHCpkLCRM+S0SyF88
         KYFNspjRwaqnEtn+uz+4aX/WFVXG8pZhkiTwtmWids+0mph8bwz+LcV3ZwBXW4bE0G78
         GHR+aiqc0WD17a390kB9IO+TicVuiKaP8lZEkee4/lzhvopy/cqNww1GywGbTfQVQxpT
         afjCYnkhnJ7yeSqiwum+mflFBTxQS2qV6Ldb60XoKbh23kNj7YBRGM/bpZ/iepYuKH1X
         UqHMra03sByULcUVlfOr0Q4+sAiyX+g2Z+T3f5Fl7Hp3nHXPUxfjQr2JycYEcCkoABA/
         FAGA==
X-Gm-Message-State: AOJu0YwceV39qkjNPe1TqqLRgQXpH4k6vdJcu3IgWs/0gwUm0wSXdCOM
	UhMV0lH3IiZHcGbiVQ8lyF10WsbsvOw+8iBb54AbSP22x/qLQrok+iUk
X-Gm-Gg: AR+sD1194GLqerAOYB5zoBeScBZlZFiOAPZKMypBeP3lBhoZy7Pj/JNYuvF/H6vWTnK
	aW9ANf0KqxmnQcUlzQXh8/I+g9BPw/q8CylNT4Wu+X2g7VX1ha72nVMAgDOiM5dr6qrp9bl8kUz
	kIPCgT0aEldQZT8K4tLJIrra9mtd3npeYMYzTNCpsOfR0cJuPvBGrpaUzep+L+SXKox9VtEDPUq
	M6MSF+OBBni42l7J5W53y/YGnYrpkGnpE8YO/7aTCbPMgRpwM7X5BSrbYZhzj8uuKYyknUahqu7
	lfUGGy/4Q5bg0zJOxC+BKUxm36jj9+YRBPh57XEtm+VmWylVsnvgP/YkIbkDLM7FthvVVV0r1G/
	KMxJ3rvdZL6G3TIof0ZuQuGPt3QNoCOoEDCxDDc2YtUjXcnByMyL1PjCyXkJirkP7MkWCHF/Z4y
	urPBFb9i2+TKjKSFTSnD9SIPykQgxxZGCKDkaxG37A45uyxMSpJfMmUk/S
X-Received: by 2002:a05:600c:4fcd:b0:499:8b13:3a98 with SMTP id 5b1f17b1804b1-499aa15c58dmr52405265e9.4.1787137646552;
        Wed, 19 Aug 2026 04:07:26 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa0d6721sm70976455e9.11.2026.08.19.04.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:07:25 -0700 (PDT)
Date: Wed, 19 Aug 2026 14:07:22 +0300
From: Dan Carpenter <error27@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm <arm@kernel.org>
Subject: Re: [soc:board-remove 200/200] drivers/mmc/host/sdhci-pxav2.c:318
 sdhci_pxav2_probe() error: we previously assumed 'variant' could be null
 (see line 305)
Message-ID: <aoWOakE5pmsnu9Ki@stanley.mountain>
References: <202608191405.jP6epa63-lkp@intel.com>
 <e45c75c5-70e3-496b-8885-ab0093234d3a@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e45c75c5-70e3-496b-8885-ab0093234d3a@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_040728_708006_0A896FB6 
X-CRM114-Status: GOOD (  21.53  )
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

On Wed, Aug 19, 2026 at 01:02:09PM +0200, Arnd Bergmann wrote:
> On Wed, Aug 19, 2026, at 09:54, Dan Carpenter wrote:
> > dfe9746aed2d12 Doug Brown            2023-01-16  304  	variant = 
> > of_device_get_match_data(dev);
> > dfe9746aed2d12 Doug Brown            2023-01-16 @305  	if (variant)
> >
> > This assumes "variant" can be NULL.
> >
> > dfe9746aed2d12 Doug Brown            2023-01-16  319  	host->ops = 
> > variant->ops;
> >
> > But later it's dereferenced without checking.
> >
> 
> Hi Dan,
> 
> Thanks for the report! I've fixed it up now, by removing the (now)
> pointless NULL check.
> 
> As you may have seen, there are a lot of changes in this branch,
> and I assume there are still many things that smatch will find here
> as it is still work in progress.
> 
> If you have a list of possible regressions that smatch has already
> found on this branch, I'd be happy to look through the raw data
> for actual bugs and fix them before you spend a lot of time
> processing the findings.

These are emails from zero day bot and I just look it over and hit
forward if the warning looks sane.  I'm re-writing Smatch like crazy
so my own results are basically useless right now.

regards,
dan carpenter


