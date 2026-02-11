Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E68F9ECD6EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Feb 2026 21:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCAnNXBnTPnzrp0yT2aXgF5x6Gf0n0VlTsKCX3JOXEw=; b=GoaXlzcIeLlCTLg+O+5qs1ULMD
	q5qxeYhf9aZVKEpwvt0RvPjQnrfOPHRiqIZNTfHZbbjzKlHB+BIbDPMbQQ8YuZSWZGJoQP9ySsNrC
	1mAC+SjN5cGfRL18aOc1jOoP9KH1/VbCWsiwhBlue4a+yN6TkOtD97mRqkmEkzdcuCWclQ1ulA5kG
	HHAWmN5dEobFREj9khbl9562rZ7P6iZhWZ5JJ0WAFdGzImMI+iCTw+5S5wfvpccnxaUgRc/wMaHPc
	6zZzBaZPVkDE7vDzNuFRNQRQBBvsGkh4JL+O/7hD2LFUdHEPQ0JvK9IL2eu4uhfRIOebSIjoUaf5N
	5CvdSf5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHx6-000000015n6-1yqO;
	Wed, 11 Feb 2026 21:40:52 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqHx3-000000015mY-3AG9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Feb 2026 21:40:50 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1271195d2a7so6449753c88.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Feb 2026 13:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770846049; x=1771450849; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LCAnNXBnTPnzrp0yT2aXgF5x6Gf0n0VlTsKCX3JOXEw=;
        b=H0PE5joeXgxu6tc3tEZHjkoKAp8NIVhcv6rgOvtUF9BwRn12NwbH/CjJnTQFWvpygT
         gthaMYTis4iwwBV7cWxA9CxDL9B5vZB/JFq8+vIknPnEsA/ixsmjHQoPAI0e+sFoH87T
         /x2qr1VJWRlUx7ZiYYbi/rrNh9NfX7bUG79CjOc8aw4MZBISPqmgPaRlkWOin+SYFa/p
         HrJ15M+dPKCiWE2bn9UgJhbKVwIwpS6Fs425Lh+BvkI7ZLN4Sou578ajjDu56dbGVlFq
         MZIFF2s7BnOHBBi1rADirDV+Cb22qvp6geEFfbBOo1cso6I83OeS3WhOF6mIxe/hFPfx
         Pe5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770846049; x=1771450849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LCAnNXBnTPnzrp0yT2aXgF5x6Gf0n0VlTsKCX3JOXEw=;
        b=N40N0liFsCJrud8ejmqvV6KP2XXL2VJwPNX++x4Nzz5x8flwghp1Ah573oiP+ZlMzD
         ehKB2n0yZ+5LzFqNNH/i40ji0rtc4X48qov1npeiqg8bZTzGNzfdb1zy9jP+/gKZ/mAB
         YO7LyM/UdUL3iMEQwPM+NUgaPpcdc07AS+g19iQT4cPoddZfXZbzY+4ieQNMqg1/50Wq
         Ar4tx7b8rEhaW6qdZavufPPoL9ez3MAuK4VcdaGl4JeiE3x4opooa+m2Wzwuwo5ZWv+e
         u+4JWNFp/tv0pm3XRIz1KtwDszxGMaHQTYI2ylD8rDRFKMGrRQgSGKo2dV5fKcKFd4Fl
         Uq1g==
X-Forwarded-Encrypted: i=1; AJvYcCW/akPN3opwALKro2EElccRD98S0Rhjv06svT/827rKknkAl8/Loyzt7QgVz+mGVPhC2BlvVnieGJIdwMzIL9yt@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq9Iyx+u2lFEnMZQsh2zqEei0MaFF8vswiKAIaA9QSG9NC9uX2
	URYE5PudDPofJJz+lh/s6twD7+/NIea1eccOlmhyYZigF7j+0cXysVfQGCoFgQ==
X-Gm-Gg: AZuq6aJGceGu9lpRyREhxrtAt+NVpv79BiczyDw8HeiPjCCRGCZueAfFMXzB67DuT2p
	5mc3otErC3wrgw1ucuCsDIS09UVWvtdUtaLJDWAbufazsCsvADjuJZZ29h38sfpVSaYeSXXkyT6
	4xurcbgztg/zU8GNavCI/UmIoV0zsvGAOSIEnvJ/dVYLIMrh+6c939zrGBNS1Mg9O96xojbnGDz
	s8UEI9xF9LXGPHtPtzwAPzRtQJyAmDldf/X6SnOvMXYk6aOCdrXTFyauPYcRWNkqpBjeBiSin5K
	/TDN1uuwdqmFlhDH0K3fQCuYirkK8eyOI4B5gU1Bc1ldT50D/kAdMpkK76aoORJEYZB7Nwgvc3G
	Xp60H0iuFEd675DrFNU85TDeYZt2GYAKdyuzuWfJgVlzQoGfQgzOzS00NnuWcp3NA+3fXdo09bS
	EHkIp3GY1YXxTeKY78eW38bbfJB2fOlu7jLS0W7sC7jslr03re7srHUx1k+YFbW/4=
X-Received: by 2002:a05:7022:6b85:b0:124:9acd:32d1 with SMTP id a92af1059eb24-1272f73bb5dmr311282c88.9.1770846048437;
        Wed, 11 Feb 2026 13:40:48 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:f5e:c935:ddee:63d0])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1272a636095sm3392820c88.0.2026.02.11.13.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 13:40:48 -0800 (PST)
Date: Wed, 11 Feb 2026 13:40:44 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>, 
	Hans de Goede <hansg@kernel.org>, Linux-OMAP <linux-omap@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [RFT PATCH v2] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
Message-ID: <aYz2_pE53G67vv0v@google.com>
References: <20260211131350.126966-1-bartosz.golaszewski@oss.qualcomm.com>
 <213b82de-fee8-4ebf-a8ee-d8ca783ce403@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <213b82de-fee8-4ebf-a8ee-d8ca783ce403@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_134049_799589_6086450D 
X-CRM114-Status: GOOD (  39.72  )
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

On Wed, Feb 11, 2026 at 05:31:52PM +0100, Arnd Bergmann wrote:
> On Wed, Feb 11, 2026, at 14:13, Bartosz Golaszewski wrote:
> > Currently the board file for Nokia 770 creates dummy software nodes not
> > attached in any way to the actual GPIO controller devices and uses the
> > fact that GPIOLIB matching swnode's name to the GPIO chip's label during
> > software node lookup. This behavior is wrong and we want to remove it.
> > To that end, we need to first convert all existing users to creating
> > actual fwnode links.
> >
> > Create real software nodes for GPIO controllers on OMAP16xx and
> > reference them from the software nodes in the nokia board file.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > ---
> 
> I don't see mistakes here, and I don't want to throw a wrench in
> this patch, but I wonder if there is a way to take this one step further:
> 
> > @@ -244,6 +263,14 @@ static int __init omap16xx_gpio_init(void)
> >  		iounmap(base);
> > 
> >  		platform_device_register(omap16xx_gpio_dev[i]);
> > +
> > +		ret = device_add_software_node(&omap16xx_gpio_dev[i]->dev,
> > +					       omap16xx_gpio_swnodes[i]);
> > +
> > +		if (ret) {
> > +			dev_err(&pdev->dev, "Failed to add software node.\n");
> > +			return ret;
> > +		}
> 
> I was planning to go through the remaining 'static struct platform_device'
> definitions in arch/arm/ after the planned board file removal and
> try to convert these to 'platform_device_info' or similar, using
> platform_device_register_full(). Since that function already contains
> code to dynamically allocate the software_node, I had hoped that
> a lot of this would just go away.
> 
> However, I see that your patch creates pointers to those software_node
> instances, so  think that would become a bit harder, but I have not
> actually tried it.
> 
> Do you know if there is a good way to do this without using static
> platform devices?

I wonder if something like below will help reducing boilerplate...

Thanks.

-- 
Dmitry


driver core: platform: allow attaching software nodes when creating devices

From: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Extend platform_device_info structure with ian optional pointer to a
software node to be used as a secondary firmware node for the device
being created. If software node has not been registered yet it will be
automatically registered.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/base/platform.c         |   15 ++++++++++-----
 include/linux/platform_device.h |   23 ++++++++++++-----------
 2 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 09450349cf32..2abacdf714d6 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -809,6 +809,9 @@ struct platform_device *platform_device_register_full(
 	int ret;
 	struct platform_device *pdev;
 
+	if (pdevinfo->swnode && pdevinfo->properties)
+		return ERR_PTR(-EINVAL);
+
 	pdev = platform_device_alloc(pdevinfo->name, pdevinfo->id);
 	if (!pdev)
 		return ERR_PTR(-ENOMEM);
@@ -824,17 +827,19 @@ struct platform_device *platform_device_register_full(
 		pdev->dev.coherent_dma_mask = pdevinfo->dma_mask;
 	}
 
-	ret = platform_device_add_resources(pdev,
-			pdevinfo->res, pdevinfo->num_res);
+	ret = platform_device_add_resources(pdev, pdevinfo->res, pdevinfo->num_res);
 	if (ret)
 		goto err;
 
-	ret = platform_device_add_data(pdev,
-			pdevinfo->data, pdevinfo->size_data);
+	ret = platform_device_add_data(pdev, pdevinfo->data, pdevinfo->size_data);
 	if (ret)
 		goto err;
 
-	if (pdevinfo->properties) {
+	if (pdevinfo->swnode) {
+		ret = device_add_software_node(&pdev->dev, pdevinfo->swnode);
+		if (ret)
+			goto err;
+	} else if (pdevinfo->properties) {
 		ret = device_create_managed_software_node(&pdev->dev,
 							  pdevinfo->properties, NULL);
 		if (ret)
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 074754c23d33..ef5b882d08e0 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -117,21 +117,22 @@ extern int platform_get_irq_byname_optional(struct platform_device *dev,
 extern int platform_add_devices(struct platform_device **, int);
 
 struct platform_device_info {
-		struct device *parent;
-		struct fwnode_handle *fwnode;
-		bool of_node_reused;
+	struct device *parent;
+	struct fwnode_handle *fwnode;
+	bool of_node_reused;
 
-		const char *name;
-		int id;
+	const char *name;
+	int id;
 
-		const struct resource *res;
-		unsigned int num_res;
+	const struct resource *res;
+	unsigned int num_res;
 
-		const void *data;
-		size_t size_data;
-		u64 dma_mask;
+	const void *data;
+	size_t size_data;
+	u64 dma_mask;
 
-		const struct property_entry *properties;
+	const struct software_node *swnode;
+	const struct property_entry *properties;
 };
 extern struct platform_device *platform_device_register_full(
 		const struct platform_device_info *pdevinfo);

