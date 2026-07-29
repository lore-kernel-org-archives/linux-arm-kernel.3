Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D6EC53219
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 05:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/09h4JafWA6BTqjec/Vv8SutmyeV2+BMV1t1G7T10o=; b=tSh6abErvVQ4R/W1Ai3P8dpQjU
	udrxPg4iofYBoxnuAEWwpIVj5pfMjOpgBBGsBV39S4zNV6k9E+XVMOPCIVKCBpbnBLT7Ts9yF16ul
	uuYJ1dmjrr8oW4v6LXLIGsAIMI/xsVdm6Zji4w7iiee9faUoGTcchoW6bTEcy0t+9VWwMad4TMWgA
	TC3baiXfbW3Y13Q8+n/0AQUpWeIT6pDOQpDOnMTAvZYORbweYrD3XXuZH3E+zOsy4Min8cuF210gy
	UmwIG7/PgdLWAvBfuHmw6hsKUCvKEGf5QaIwScGeaPmGS730pVKCtETdD5Vcwa2frj7vg4WwvVi4b
	MchUp0+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wowUW-00000006uAc-0EaF;
	Wed, 29 Jul 2026 05:06:04 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wowUT-00000006u9u-3zVQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 05:06:03 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso620712b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Jul 2026 22:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785301560; x=1785906360; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7/09h4JafWA6BTqjec/Vv8SutmyeV2+BMV1t1G7T10o=;
        b=QT9aYGz4b39f137FduNJJSdrPu3qRNQ2Suo1hwmMMvhPBkIoMMgoPTHhfhQi3wMbjB
         DCL28pRr2+5UrGTxwoFKlqQ3BKLF9mc/pmFmmA+AzBf1s+1PXlScA4MgM1aJI0dGTQuu
         LXdEaTM7vY2xO0aaOk/XX2wXM54aEMnkE/OW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785301560; x=1785906360;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7/09h4JafWA6BTqjec/Vv8SutmyeV2+BMV1t1G7T10o=;
        b=U2AjKbnplzcYgCMThQJ9MmSDg0kuJlwKf1/c6ghQNcn1vYVrh/nv8LIBcuhFazGlGP
         bHJlKSmzeSgSNyFH853Vjuj77xB/3yBH/F7rWdV5i55loHlomM9CkSS2+6iyL/50uNcr
         yS/Zr9GCgLblVl/dQQs+DqlhW/LNsx54Ik6jDSqlhGFhm6iWippjnqvrJeIrH1tyjrob
         /wF53PTtQ4coOmOMhHqrLd9wm7ZTqjA5fMFrJTaCbnhT/06g4cMtP8w4lBO13Bzp9ZuK
         rdygcAzu89OYhHEtHPMchcFl6pgPL6Sx86BbB77Yv97dROmZbdQVFohsIcwrnP3zva3b
         ujGw==
X-Forwarded-Encrypted: i=1; AHgh+RrZfqksaMoT4IAz7ZOxpbmppvi2OewdshhW3YvvixIxXcmw5dyaOItErT/QCc5rzcrV37Mllr5Xww3j6tJYdRZ7@lists.infradead.org
X-Gm-Message-State: AOJu0YzNOlVwDHMHtf8x61fvJv89iGkIQU42x3uYGCM7tWM4lVUI0M0Z
	ixCP+7h6dOIliAUiv4gWp7F6rgfaEMdf82knwwhjjItJNfD7Fnp/4FlgeFfjx/XVag==
X-Gm-Gg: AR+sD12W4NSodZxzgxanK8gRpCH+Y+baYcVm8/FM+I0LIZk6b9T1l6Ytj/drTcsWZFd
	be1Um0S0R95ozs5t/jHmJzuD9WTk0sVvakk9tCC4rK698pTiB2wlbjeXWa/yHDgib9mhR7yyT9C
	7pg0b+B7pkn2aIMdFri2cC9Ef6E5z48J4z5zgJApI4iBxyi+TuvFulZRNFgBsVbfiesSnUccpk+
	/bgMlF3a/kpdJxBvWuzIQlhZAe+ScucXjNjJ5PNXZQZnN5q2hDRkk/fINkYS3f0M8Qn9UX/+YU1
	LH8cRy41I6Gi1UhJ76Z7YGMttdbx/SS7ci288BKFK+C8ucspD5Kc0AdMTh/EyDARi5b3DHU0NNW
	7VkteTsQ0FMbvOXwMRLyITDSrzWbilspLTm34fDcgKUfU+reh4kiqSvatH3pOEVg+iUzekyEI6v
	1V8hd2Ktq3bcWLZfJ+Ou1F2G0XZquXWuERWFB+6jp7Hf/jiWqSX5WM5LLvheJW6XO+ar0IJGie0
	RlTATmAsSwrfFeTjJ127z6jTd9HPR/dZf37jdE=
X-Received: by 2002:a05:6a00:2daa:b0:842:3a3b:d6e7 with SMTP id d2e1a72fcca58-84e931eeeafmr5750213b3a.23.1785301560519;
        Tue, 28 Jul 2026 22:06:00 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:65c1:52a3:f6d3:37dc])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0055dd5sm741877b3a.20.2026.07.28.22.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 22:05:59 -0700 (PDT)
Date: Wed, 29 Jul 2026 14:05:55 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: Tomasz Figa <tfiga@chromium.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH v4 0/2] Bluetooth: btmtksdio: teardown fixes
Message-ID: <ammKA77-UC1Ie5V3@google.com>
References: <20260618031338.1011410-1-senozhatsky@chromium.org>
 <ajtoXTaBEMSyGADX@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ajtoXTaBEMSyGADX@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_220602_211593_56F702E7 
X-CRM114-Status: GOOD (  11.63  )
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

On (26/06/24 14:19), Sergey Senozhatsky wrote:
> On (26/06/18 12:13), Sergey Senozhatsky wrote:
> > This fixes several teardown issues:
> > 
> >      INFO: task kworker/u17:0:189 blocked for more than 122 seconds.
> >      __cancel_work_timer+0x3f4/0x460
> >      cancel_work_sync+0x1c/0x2c
> >      btmtksdio_flush+0x2c/0x40
> >      hci_dev_open_sync+0x10c4/0x2190
> >      [..]
> > 
> > close/flush can deadlock when run concurrently with btmtksdio_txrx_work().
> > In addition btmtksdio_txrx_work() re-enables interrupts regardless of
> > close/flush being executed on another CPU.
> > 
> > v3 -> v4:
> > - fix commit message linter warnings/errors (tabs, subject line over 80
> >   chars).
> > 
> > Sergey Senozhatsky (2):
> >   Bluetooth: btmtksdio: test for BUS IO errors in btmtksdio_txrx_work()
> >   Bluetooth: btmtksdio: call cancel_work_sync() out of host lock scope
> 
> Do the patches look good enough to pick up?

Gentle ping.

