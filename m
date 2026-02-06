Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19C0AEE20A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 13:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=QC0qEoIgNdVzf+DU7HTFpZWfSSy5BNhr3750S1v0f68=; b=LTP5mHc2MWMvXX
	gIXvNQDHP+MJObBWjEICv50jsgJz8x8go/2lNIL54d/tT+dEyfbqyxjJf9F1ndiC465YDnvbqvUmM
	KYpjhfw4HG1j9wHX15uNeFG0Ux7beO1e95ws/mGy5/MYRf5cRF1WA6cRpnGW3XsaJ+zhHqmXKu2om
	byl7nEO8mzHFFcjVbAk+EQgyqWI6JRn1z/4sqj+AKLHacjcMncDaY2y3+wyjXCaiOq1CSjy9CFmoR
	XU7YC5xSzDHugcdJtaYg/80MDKFyAAnm7sIIzTPAzD0LarCa3WJ2Gc17HSyu9us5cdeuiyP2smQca
	tr1J3wQi7+HLJgwKcCvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voM5K-0000000BNcu-0WOx;
	Fri, 06 Feb 2026 13:41:22 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voM5H-0000000BNbb-1Mx7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 13:41:20 +0000
Received: by mail-wr1-x443.google.com with SMTP id ffacd0b85a97d-43591b55727so633134f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 05:41:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770385277; x=1770990077; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QC0qEoIgNdVzf+DU7HTFpZWfSSy5BNhr3750S1v0f68=;
        b=WZZYe+PGzVOm2ZoGEb2iMTpiUdAYwZgjnKV2lT0O7vJ5ZXV8J9SR70u4WBwnYgmILl
         q16KO5OJF6tkI0if2Zp6Z1/tpKFc7k8Td6mFZM3bmv63lR05AIFaHXP8OE0sOBGzuyFy
         BaAETZyLo58tth5ahYzMdpQ/JvwLKwwkf9/bjcaU71PLhkO+YEFZNic2DHaJA+k6ImY5
         CkluJgOaxaWRZnMdfruQFDgU8JawWvZ/+iuGgLZsHEBeGevWAQa6Eg4h9WFUP2Lln9bu
         qIzyOK/dXUWkjQKch6wgLdaBnWZLwige87TlliUu5qPxQqq/iW0tmXSJ9PO4V237c1sU
         Fq8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770385277; x=1770990077;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QC0qEoIgNdVzf+DU7HTFpZWfSSy5BNhr3750S1v0f68=;
        b=g/wsagd8VRJOgd0KxJ87JCPBfnT5Ld38o1Wu7hjBCuK4zRA4xJG21c+dsir+aZ7eSa
         5IvOu6ocdAZQogYfWDk3O2mNxvnhGJIO7uWZhE4YzGbvpyRrmoN1L6gXpA7FiMWKizOt
         bI4P0TckjF6cwyASwqoSDWF7mNengO3KQ4dCWZ8FQ9f9DyXdizjm9voQ3Y+BvatTwn0d
         N1rKXVA6M2H1qm1aU4srj9WoVHjU7/DfqgbvuOFVAD0m6T7SzwuH2AxgNMh+d/C6ssIv
         o/Vf/x09ATFE1nQQKBjhxRdp/C+4+ongZJRhIM2dBmj6rT38NmOrxRZTOBVyI/0FWDlK
         oUsw==
X-Forwarded-Encrypted: i=1; AJvYcCXhXo2Go5M4UjDDA3OpsaoolJrNFogOGZFMWoBdAFvytm8Dk0C3+rviUNXnieisz1q5dHuV89lhjlPeCwXY2ruy@lists.infradead.org
X-Gm-Message-State: AOJu0YzxUteCHTDBHG6yLJcqqjcSpa8eZwiyIxxBrux5VfMgP7slEUtW
	/0Z2OepVBm/2LlEyj5hihO7KrrciQRvjpd0CLW80F83gu2wNHaPx/FKhLRJszBB9ySg=
X-Gm-Gg: AZuq6aLO0ZrP0gsc/EGr4QEHSEod5KQTenVi1oR6ze8pJlwH4171BZ9ITUXZta43IvL
	XnSTO5GFoTDc14R+3aBxY4sbpzVut/bhV8pHAdyjC6ktMgB0xuOudUKI4ID2BW31/N+9tK/cR9F
	o3lAlQC/xf0n5TUBcQcFre7qz/sf8zt0NXgWzUnj3NC4q/xgCKk8R3y1KRboDf7N00QxGelZeg1
	RPJQqlwVvqEe9CV3wvFGRHmAEgzGS0VjPyGbTlBD70+SNx12490sqZDJxmCZfXZKi54Fo49XjZM
	f1XTdMe8sFG/5VOAMsYTEBjoABpxu2z+VQKS3jpFZfblH5RstKZ6YMMf/1ebBivCcxHRbjmMF36
	cjMlMriUgmNS8+903S71GYVegbJC+pNeZNJ6NCa6C45qom+QHSzXkIFqEPfAE4MdmoKiVSNIu8h
	68ZhZJM4aT7bnWr4Tr
X-Received: by 2002:a05:6000:616:b0:431:369:e7b with SMTP id ffacd0b85a97d-43629341e83mr4341944f8f.18.1770385277209;
        Fri, 06 Feb 2026 05:41:17 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296b25casm6297355f8f.4.2026.02.06.05.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 05:41:16 -0800 (PST)
Date: Fri, 6 Feb 2026 16:41:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel <linux-kernel@vger.kernel.org>
Subject: [bug report] remoteproc: imx_rproc: Introduce prepare ops for
 imx_rproc_dcfg
Message-ID: <aYXveV_Y1gT73JoK@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <caa37f28-a2e8-4e0a-a9ce-a365ce805e4b@stanley.mountain>
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_054119_378507_522D8284 
X-CRM114-Status: UNSURE (   8.03  )
X-CRM114-Notice: Please train this message.
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

[ Smatch checking is paused while we raise funding.  #SadFace
  https://lore.kernel.org/all/aTaiGSbWZ9DJaGo7@stanley.mountain/ -dan ]

Hello Peng Fan,

Commit edd2a9956055 ("remoteproc: imx_rproc: Introduce prepare ops
for imx_rproc_dcfg") from Jan 9, 2026 (linux-next), leads to the
following Smatch static checker warning:

	drivers/remoteproc/imx_rproc.c:648 imx_rproc_prepare()
	warn: ignoring unreachable code.

drivers/remoteproc/imx_rproc.c
    605 static int imx_rproc_prepare(struct rproc *rproc)
    606 {
    607         struct imx_rproc *priv = rproc->priv;
    608         struct device_node *np = priv->dev->of_node;
    609         struct rproc_mem_entry *mem;
    610         int i = 0;
    611         u32 da;
    612 
    613         /* Register associated reserved memory regions */
    614         while (1) {
    615                 int err;
    616                 struct resource res;
    617 
    618                 err = of_reserved_mem_region_to_resource(np, i++, &res);
    619                 if (err)
    620                         return 0;
    621 
    622                 /*
    623                  * Ignore the first memory region which will be used vdev buffer.
    624                  * No need to do extra handlings, rproc_add_virtio_dev will handle it.
    625                  */
    626                 if (strstarts(res.name, "vdev0buffer"))
    627                         continue;
    628 
    629                 if (strstarts(res.name, "rsc-table"))
    630                         continue;
    631 
    632                 /* No need to translate pa to da, i.MX use same map */
    633                 da = res.start;
    634 
    635                 /* Register memory region */
    636                 mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
    637                                            resource_size(&res), da,
    638                                            imx_rproc_mem_alloc, imx_rproc_mem_release,
    639                                            "%.*s", strchrnul(res.name, '@') - res.name,
    640                                            res.name);
    641                 if (!mem)
    642                         return -ENOMEM;
    643 
    644                 rproc_coredump_add_segment(rproc, da, resource_size(&res));
    645                 rproc_add_carveout(rproc, mem);
    646         }
    647 
--> 648         if (priv->ops && priv->ops->prepare)
    649                 return priv->ops->prepare(rproc);

This is unreachable code.

    650 
    651         return 0;
    652 }

regards,
dan carpenter

