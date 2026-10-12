Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3419ECA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 09:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RDzCL2xabPYSUwu/5d7RPJ+k+ygaIBXDpjnjlx7KGzc=; b=PbaUZ4qfcP+aGuCqajup3Me8T6
	vmosa7kw+6DJYYFK1H4/ghQaqI6WLMWofYIMswx1HjrbAs4Ne9w7RDXFi6mve2NZgWA37UezE8wYM
	tpC0jZaTDAfiulknuIJLPKyi1HjP/w0Kiz7As+SSTqAMA8hNUYDDKxoaWQXIfBkoMb8jGL06+P3xN
	7Yd9K/7R7jJdM6K6OWmfT7HKy93xj301830n1hx8mUesKgvXc9MD/nmJOKnPP3NDdI46W1Z3KYDaW
	wqjTH1qcqreKUr9BBjOWncsADapeuqENcdwQtRcZ6ngmN5Xe+qXsGHdhXaG+TjAcmRPdjuuR90ziX
	RRlqnT/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCBe-0000000A2No-2g2m;
	Mon, 12 Oct 2026 09:19:14 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGCBb-0000000A2NS-4BPF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 09:19:13 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c315729ad50so290120066b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 02:19:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791796750; cv=none;
        d=google.com; s=arc-20260327;
        b=E2LqZyVaydGCCKPAzR1E+3XtO1G4VgFOw5ZWhqmwucv0+lpRTBNMBKSowI9D7d2vX0
         yIo2tGfTCuU2e0G2pRZhbvX7XfMmN2OCei7Lx4FwPh1xW4aAPgMAGAZl4cQCYJkDtVvK
         iba2iiqzQmNjhbh2YHd/JtxtEPHcXCn8w3YBgj2coVITEWdO2s2R9NV6B5RFcRgc1+l1
         1AsjSlt/ENmnhgIeXFmFPeP2N/lt1Qr63S5V23H7Vd0ASAgmcRHaJR4Wgh5c1O7zFI1Q
         vrWitFn/cdiGXl8+EU8rUaiqR2eupe8NXC8p027iEv2yTt6miAMtMeCuk/ipGz3ujzap
         VxXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RDzCL2xabPYSUwu/5d7RPJ+k+ygaIBXDpjnjlx7KGzc=;
        fh=3CRa5qzg5Md7G+bURVzV9WS34zCC0LvKdjl2aXiGkts=;
        b=lvwkDx/KtmLbXYqCp2XDkfxaVHinNIa20upsvCTxdhINyQ5Sn5s7kQsTBhXH+KR483
         nQOQEeX8qg06U1fs+YoV2Hlvpgv0H5rtq+Tr6s7ml09czE97L1wEJ2EHK1P83Leroz6v
         o/k/tW9n6bvOpHW0D2hCwBtiuAbzSgIbq2kcDOqklqZgdwa78s+hJA55K7WSrgFM6nLR
         XcsPmT5aNMOGjYp4KM319MgX5TCCi38VDLYSWdeCyp00fzlVUgzyvRWJxRgdQaxfIpoR
         c6+DyUAP/zuA9d8sgjh62X6xIm3NZnZyCyBxp7m4CsGIa+4yYDb+55EdLTON2+LBoX1g
         cSHg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791796750; x=1792401550; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RDzCL2xabPYSUwu/5d7RPJ+k+ygaIBXDpjnjlx7KGzc=;
        b=E7CezV83vTHtqriW0uC9nXDZUW0kajGYherY2vANJpN1YayfgBvXmoE18P8F6v747i
         L1hxtS54ekFDMIgsReKeRHpq2DAqHopRvxUmleNSPzVJ55kzT7eZpLbYvp3gQnDgzXA4
         EZ0736K2ptE447s+JXCxkKCqOPpNv3Mz8iU0zqeRmxbzDJDplslKo3ICyfLUQWB51KqQ
         L++cQrAvFGybKYECU6pzctCEJgWmphP75slh9L2olpXnXPKYb/b5/u8h/bOrGrFxV6O+
         i4VJPWciIdJ7Zk4B6Tt0CFZp/U3w0LQK4BbIMyJtRS9hBSnlMQMLpCuehF2RGSU93rzI
         CIoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796750; x=1792401550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDzCL2xabPYSUwu/5d7RPJ+k+ygaIBXDpjnjlx7KGzc=;
        b=NTDdGPEN5zJtdI1H+ker0K5i68Ql2Q3+5p/zd7htozkTme0BigzSO30z5RHhAHV+04
         xHZi1nKN0/TaPpUZuzourFG4FQKk6gUifyThNG4pHSe6vddh0kUg9k7o/24li+w2CO+l
         5AF4iGSm1KWsI+s/akuGCH9cvvHamQPry6M4KHwweDgk0RvzFEyM8OTlIArXG8YK2l2c
         4zZ+Z8OgDxpkaAUHNmKXgJjmDFJlj8tCBAliBfFU2DXls+eUFB8nx+YG4W+FVcR98tdD
         NbXcK5VfpdDhAsaaza1DjVNoTUOfTn61LylyrNbO++9Lq+TJDjFu9snHhr9oYfHe2YRT
         /N+A==
X-Forwarded-Encrypted: i=1; AKwUvByS6RaMoBwzXCysaXh6sQFAzmZBgE+ampbSjkk3WV7ABiaeCKVRfOoReYe7nt+A7bK7B9TbmM1ofIURjj4UBjJW@lists.infradead.org
X-Gm-Message-State: AFq9FYKQ2H/Zml7ITdewAF46ji0iLKm6najxs0tCYMlUR/HT4ru2ZXSq
	kVCesRmM0dZRfEdpcIocNy4LKkgc2a4TyFqr6ouVN51LEC9CzM+8ISiFpPtA2EhPixzG2Qhf4iD
	r+d8aQ75WH92IBZrD7ww7/ATP5oJtK8g=
X-Gm-Gg: AYBFou0ti2S1Blcerc/SbyHxSqKCujkpFodCzviMTKj1uj6xv6e4d2FS8YqABQg+EaD
	cCJrNrUR+tOaOWpxf6CT5QNkdRe6I8dRscZmkyNGh0dZsJHjgcy8L36p2ZRat2+cn2W0wG13A7B
	t4sG8M8IYwR1an/ZzY7g4HtJ4pQYIZ868wywgb93BZohbGZDXSD+ZDxUKQMXcvxpBFQWBuCf0Bs
	CO1eVxXOZ9PuNE4Ll9VwKxLCVCm4XNXc57y8u513ZtVAEYB+oDENWneIg68yjb5jSEPgw6pJ06S
	JfkkZ/+HSXWGVmnOrNKDI8oB445OGZ0JjmAAi0GBhWk3IWIcIOTjG9pZ5/49datRkgZjpyPRHom
	/pMKqrQkpYGW9Qt1KmOIfKk0Ziw0qsbN5vnZWyCPDeQ0AzLgNJw1zFXYmakI+y1cnjXasSYkg1w
	nTag+dFBa5wlvVh3DSxGGf8/Qri5BKRsUgA0cyfFTY
X-Received: by 2002:a17:907:e109:b0:c31:e19c:fc4f with SMTP id
 a640c23a62f3a-c31e19cfeb2mr562736966b.14.1791796749871; Mon, 12 Oct 2026
 02:19:09 -0700 (PDT)
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com> <20261011-gpio-mxc-cleanup-v6-2-cb47ce2ad758@nxp.com>
In-Reply-To: <20261011-gpio-mxc-cleanup-v6-2-cb47ce2ad758@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 12:18:33 +0300
X-Gm-Features: AclHuK_t7SCC_fNqTJ9e7JfRmqFuaCbc-sDfdo-4CcqOLhnBhkL21_Jo8x7VqS0
Message-ID: <CAHp75VcWZSoMRvdBECyD5AM29+JWX=s0PORFM-QSMCNPD8wkCw@mail.gmail.com>
Subject: Re: [PATCH v6 02/13] gpio: mxc: fix both_edges bit operations
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_021912_076064_BFD277F7 
X-CRM114-Status: GOOD (  13.58  )
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

On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> gpio_set_irq_type() can be called concurrently for different pins on
> the same port.  The IRQ core serializes per irq descriptor, but
> different pins have different descriptors, so on SMP systems two
> concurrent gpio_set_irq_type() calls for pins on the same port run
> without mutual exclusion.
>
> The read-modify-write of port->both_edges is performed outside the
> port-wide scoped_guard(gpio_generic_lock_irqsave) section, so
> concurrent updates for different pins can overwrite each other,
> causing missed interrupts or stuck IRQ lines on dual-edge triggered
> pins.
>
> The original uniprocessor MXC SoCs were not affected; the race
> became reachable on multi-core i.MX7 and i.MX8 SoCs that reuse this
> driver.
>
> Convert both_edges from u32 to unsigned long and use set_bit(),
> clear_bit(), and test_bit() to make the modifications atomic.

Is bitops.h already included?

--=20
With Best Regards,
Andy Shevchenko

