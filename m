Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5385ECA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 17:36:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+bCVSyhH79TQYhJfxbH7MyZvPdnkAvvoBzk8H6SCls=; b=UGQbystXOfPuzSRNWA296BsUwU
	XGHxODzSacOM8+76K7jXEYvs3cr8vXsd9N9a4hr6Uj9dgbetLe6Dy581d9AoJ2fj6suUD+0Cklpsv
	ifKa0ME0rSZZZ5dh9+e40t6zxDq4ldvCbl1VD/YWDBtc8YlyqyISkxGsxaAOcHtmXTyXWmLd66Flc
	HKRZMXpdxHMXVk2obK4i6rnPZON2TovIl00ejlUXn20kXQF4DMXQuktywZfot4wj8vVdYCC0Jz3Xh
	GEjRHTwQ+/flZ9NKevkj0gi+tzSuEuY9omqdSFxKJD4MJGCDaxQVlNfVIt2lEOVHJpIYXBZlHAMDS
	rDaju6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD3eq-0000000DrZJ-1osR;
	Sat, 03 Oct 2026 17:36:24 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD3el-0000000DrYm-15rK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 17:36:22 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-c2dc8cb0decso68302466b.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 10:36:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791048977; cv=none;
        d=google.com; s=arc-20260327;
        b=XE6HAj/iQ7XjcSaGcTg+8HU8otTbjhMggiwDuUHLQDVRT823VKxjfPKslLdyyN9NZK
         djcr/YG+lxIOYc1UlYmcsQz7pFRy6AC8325e51l2VgOINb8LPOwGalqulhVyhSOusgET
         Tg70n7jLYKGe20ZHpnvEubZbgCK6SzTKWIq4CLz5W8T3gxd5oTCOn+LqsAL1MN46MRXX
         eikzJEwMfxaBg3QmWu/4EiRvPrBkO/6jK2QHrWL3LbfABqhoN1xFiVbr5KapDro1mA0c
         6P4oc9ytwWNkFU2X2xr/6J43nJPtvhTe5GJarfLDqFRLPfyEfyKIM/lYu4fJ1XPtB2Ee
         w70g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z+bCVSyhH79TQYhJfxbH7MyZvPdnkAvvoBzk8H6SCls=;
        fh=W/mS2PR8/iUJwYEhgoNZhpoSn2TYvqBxhqLRHifJTFM=;
        b=CqrV3gp56qco5PxTH7xp3gkENPQqZolzMz92TifBUCXQUEH34/q3hfs5BIyBQrxNLx
         EamiPGPmt2DO6dMPm73KcJCOfeAynWZuYjPRJeHTladqR25Z2XsvViNMnnNT3XHRv/xZ
         M8RrdbnK4U8g4Ir3JwCSLwmLVmdPiK5xRMekZ7Q73Jtmxh/yczKW6FYyYomSb/oo2xS/
         h+mVEQNzP0IAcc5KYh3gH7dFnoNwzZpt5+c6d1JU7eCx5AW+RKJ/nbS86nBqi6ed30QQ
         2lAwSHrozFsFHt2dx+F1SzbN8AK45KglOdgcT044BZs8u7IAsfcK1VvsqjkjqcilI4Kw
         8Row==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791048977; x=1791653777; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z+bCVSyhH79TQYhJfxbH7MyZvPdnkAvvoBzk8H6SCls=;
        b=jvjJjuRDHqQB1Y2hc2Nu1TplICq8hzZBSisKfz7UibWvVzWBjpusWC6Yv3Uh8EUdzx
         7ttyJqzQDKf7LF9TXj/rNlmspMo8/jAn4H2oWkghZ2vIq6tFM49ikJj+2Be0T7gcByMb
         5YV+mr9LOlViWhRkLwIZ+1qKOW5xWn19pFdwK9k9JNyoMGJ7wEZIsVZxHodx/uLXgLa1
         GVL8IzTTAIBM7BQTNXBFug8j6Q1FJQ8QV3lsAMGMsnBsMx3s++OwJF3Urqn7/NNC/vUL
         mb4jdk5YRC30MVWX5C7YRSg/4TWjaoQXsztmX/oYCEx/6DUBn93JmRK8EzFSxh7zyrmL
         ZbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791048977; x=1791653777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+bCVSyhH79TQYhJfxbH7MyZvPdnkAvvoBzk8H6SCls=;
        b=NWYd97D8hfXiq8rpvS5SoYaO8dSTXH7BkTpS8CDB0W2TAToOOD7Q9pFvR5kPmc5ULl
         oc/KcJTpMptlaVTOzF538N5kgTORytOfDSVNpaD+TCqqIbVcpV8GBlhV9R0Tv5FLk+wz
         om//Wn+qyGvJ8BGf4Su44XL56a0jVkQPMdv9Sx+BagOuRW9BCGkiBD8sX0xGRc9AgG3e
         DquxN9cZuA/Kvs7CpqQHYrTxANOA5tWgA/x/hqnBzsUlX+Hg6eTxr+2FJIq/7Syj0pmG
         akeXwxA8XYgahVLTZRzbRSVa1tlE9EGdhCMEFa7P158wHvUB1fhG/j7uKmwiYKhzKqn7
         FHQQ==
X-Forwarded-Encrypted: i=1; AKwUvBxomJglxoyWtiEQ53YXcf3K1aZeqD5tEfimSf4mhaiZ4MarWKPlRc1ojH/udwiAli7r87sifvngqoxQyU+wMe2f@lists.infradead.org
X-Gm-Message-State: AFuF++mZqu02Fh85USZLwVda5ynxbVdBubWAQ2T5FBLmoRafLBQ37Oe7
	Kc+O1w7gnQ+zr8f12tGKczMUZkQUGVr5q6q3x67OKl74vqOmdIeEJBTGpb5/YB+D+ibLIFB1kjh
	EkaYYnjlsNd0Go9PBQbdj7Ebl6IIYeC8=
X-Gm-Gg: AYBFou0KFxAlUf6e4200OSCpcJCBRZ5EaIaykWLekjCDGzYD3DSFLDKpBr8Gukjn6WO
	OfxN7dAF3MVo3+FxO+hk2uwUO2OoeP0T9r7T0hWyrahfKg74wIH8psJELCwfvKRT2IS6zZQ6kyx
	/Trpa/obHojq9lQkvjUi0AoDwvQcGjTj8wxClIzelbvL2TDOD9Lsh7X5f5OH1AVwOnHlIhlfJXJ
	jefGm8SZHgTA/F3MdYCxXU4zmuAJxLXFXd5EKR6OmI6FOqDhtq/eZykWtnX9rwJ4J8PbN57IcfR
	8gG+O92LZYSTYwE88XAuVYtuN/7kxrh2MFqsW84rBvQaox8G+qhdI5cWou0V8qsJAtegprfg2/V
	oR38VQgd4Urzw5SRZAkIEL8lnUgFQg7XuKme6WXHE2v0OKmcv0q+ovGH4mIktstn+RWzH5ITrf9
	kdUQ5EDjAgy5LQ/EkO4qWiAWeGTPBeYvPZBXEQvf4V
X-Received: by 2002:a17:907:7b8c:b0:c2d:fc0b:551a with SMTP id
 a640c23a62f3a-c2e6e7ce8femr227244866b.0.1791048976875; Sat, 03 Oct 2026
 10:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-1-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-1-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:35:40 +0300
X-Gm-Features: AclHuK9bpapDMgc469XMoVwaBwPajoR_JzR60Owqy_i8pAhthfGXkoi2ZLHq1Yw
Message-ID: <CAHp75VdWQZSsign6YBM34UAtis=Jj5ENqKcNzkhW4vS=v-bqmw@mail.gmail.com>
Subject: Re: [PATCH 1/9] gpio: mxc: fix race between chained IRQ handler
 install and probe completion
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_103621_505845_A1C975CF 
X-CRM114-Status: GOOD (  14.16  )
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

On Sat, Oct 3, 2026 at 3:09=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:

> mxc_update_irq_chained_handler() is called before the IRQ domain, the
> generic IRQ chip, and the port list entry are set up. If an interrupt
> arrives in that window:
>
>  - mx3_gpio_irq_handler() calls generic_handle_domain_irq() with
>    port->domain still NULL.
>  - mx2_gpio_irq_handler() walks mxc_gpio_ports, but the port has not
>    been added to the list yet.
>
> Additionally, if any of the subsequent probe steps (gpio_generic_chip_ini=
t,
> devm_gpiochip_add_data, irq_domain_create_legacy, or mxc_gpio_init_gc)

We refer to the functions as func(), like you have done above, but here...
(No need to resend just for this.)

> fail, the error paths never unregister the chained handler, leaving a
> dangling handler that points at freed memory.
>
> Move the handler installation after all its dependencies are ready and
> after list_add_tail(), so the handler is never live while the data
> structures it touches are incomplete, and is never installed if probe
> fails.

--=20
With Best Regards,
Andy Shevchenko

