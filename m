Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B83CCCF9F6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 10:40:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZUu6u0wS/jzGzdskNddkgJJVZ/zUOBXcp7YDEWrGzU=; b=1UVOjVQbbtGpgHHQ8sW42lgazA
	JZLWzbfGtzKUXXr/YUKnamWZsb7+wo6FpiQCQsz3LzWuSVsDKY8qRem6+SHYGJGAd1Bi0asgX+Voi
	oiMZeNI0WbyOVJJhTQW9kRCloRLY0OaVS84vuYUCxoPERuYecIekTgJ/8mWso/0KyWQ8BEZkk3eo8
	rf7JtaCOfpuqBM/uXD2ncE8/QpC90UuwrXA/mDwkCBxQoLC/9iALLw5F3lmLvhvbVWM12ktqIjb7q
	hTPJ6P67T6MkIyAUpSFKeksAx3sU0CMFnRfzBMEIoTF2PXfY8mAl6z013P7glRpVcoah2S7vn33YQ
	vhAkLjog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3as-00000000oVe-3arJ;
	Wed, 29 Oct 2025 10:39:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3ar-00000000oVR-2IJ1
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 29 Oct 2025 10:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kZUu6u0wS/jzGzdskNddkgJJVZ/zUOBXcp7YDEWrGzU=; b=SIgVUAlT8IWHG8MX3ZLQrqvjyc
	3wG4MM8TdGPGqO+hk6Pk+xBtTDMMQirVLs/t3jRp3ALpu3JfxbWjz55froatPBQiDoMsp27LTDGL+
	eT+HWzNbc7zS9m3oZ3yWBiBBdnG8PdxMYTQLk+aDizVpAWVRs2sycWxAaGmgf1lorsVW1zpwFUAbm
	vG4yIkNresOj+6BmwfOasFEUWv5M/VZscUZj2nYPiRHb06XyNs6Bb1dn4p7RQ+SvsFJor+fzY2Oeo
	yIOtzw2THUGLTbZaxhlAAzEEW60hOscWXB5mwgrj3oIKHV3uZvO4dBgcfY7j3e5zJEP7Cwoin2BFq
	VUDdz2oQ==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2j4-00000006U2R-2Y14
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 09:44:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 9C8A14E413BB;
	Wed, 29 Oct 2025 10:39:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 71CBB606E8;
	Wed, 29 Oct 2025 10:39:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 09BDF117F2875;
	Wed, 29 Oct 2025 11:39:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761734380; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=kZUu6u0wS/jzGzdskNddkgJJVZ/zUOBXcp7YDEWrGzU=;
	b=cCXLWuOmhtnXCME378SD2JQmZ9xc/7GArt0Ev2MulE9BiAetQ/bWt8OiSIJ/dP2joCxafq
	89QX752TatfoKXx1MAhJW0iDyT+24HvM09VK8OEXdell//K7pNrTIWAwuC3UXRBBe8KpVk
	lW1fVwyOm0w2wMNqpRhfeAdmqKBZh4A7cMWyVJll59MmzTGpxrQ2j/9RgAFHnn/ceslGhW
	eq91FHU0eO265JvjO+phla676d+wiYJ2w6TOQ3HYQTmEKd2MSVEiYqhzJMIMKFWHDBVydH
	2BclGKojql2K0e0UVKHoDTz6quFI/UL3VLtaV36g0Vvxe87dpaf411rPignZWw==
Date: Wed, 29 Oct 2025 11:39:38 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Esben Haabendal <esben@geanix.com>, linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] rtc: tps6586x: Fix initial enable_irq/disable_irq
 balance
Message-ID: <2025102910393819d18ad0@mail.local>
References: <20250516-rtc-uie-irq-fixes-v2-0-3de8e530a39e@geanix.com>
 <20250516-rtc-uie-irq-fixes-v2-4-3de8e530a39e@geanix.com>
 <0aae5643-9276-4280-8b1e-27b8fe73fe99@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0aae5643-9276-4280-8b1e-27b8fe73fe99@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_094418_751645_D163A936 
X-CRM114-Status: GOOD (  22.06  )
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

On 29/10/2025 09:20:17+0000, Jon Hunter wrote:
> Hi Esben,
> 
> On 16/05/2025 08:23, Esben Haabendal wrote:
> > Interrupts are automatically enabled when requested, so we need to
> > initialize irq_en accordingly to avoid causing an unbalanced enable
> > warning.
> > 
> > Signed-off-by: Esben Haabendal <esben@geanix.com>
> > ---
> >   drivers/rtc/rtc-tps6586x.c | 1 +
> >   1 file changed, 1 insertion(+)
> > 
> > diff --git a/drivers/rtc/rtc-tps6586x.c b/drivers/rtc/rtc-tps6586x.c
> > index 54c8429b16bfcc692b1f4d5404f0c42f720e93b4..76ecf7b798f0de22aa89a552a263b473ab3065ef 100644
> > --- a/drivers/rtc/rtc-tps6586x.c
> > +++ b/drivers/rtc/rtc-tps6586x.c
> > @@ -258,6 +258,7 @@ static int tps6586x_rtc_probe(struct platform_device *pdev)
> >   	irq_set_status_flags(rtc->irq, IRQ_NOAUTOEN);
> > +	rtc->irq_en = true;
> >   	ret = devm_request_threaded_irq(&pdev->dev, rtc->irq, NULL,
> >   				tps6586x_rtc_irq,
> >   				IRQF_ONESHOT,
> > 
> 
> I have bisected a suspend regression on one of our Tegra20 boards (that uses
> this driver) and bisect is pointing to this commit. Reverting this commit
> fixes the problem.
> 
> Looking at the above I see that the flag IRQ_NOAUTOEN is being set and so
> now with your change we never enable the interrupt. Hence, the wake-ups are
> now broken and suspend testing fails. So it would seem best to revert this.
> 
> BTW, I looked at the change to the CPCAP driver and that driver actively
> disables the IRQ after requesting it and so I am wondering if that will also
> have alarm issues? I don't have a board with CPCAP to test.
> 

That's right, I guess you can send reverts.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

