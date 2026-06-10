Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BAF3CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YZTUwD5334qhMn45Nv6zFjWXwDHnBznaVHmh9fHzOkw=; b=Eauv1OmjyZrALuMOgRyiWhgCSo
	HZqRJIvo4uGnKE7yyrRfMsPUOjaQ2cIv5LvurD5DMAl16P9Ehn8MB5fZEj7vVFjluRVhw+5G4OBUq
	CSYVTwB2DC2WoKMdk0Us9VYqmVKACQ1lX4cE12BKckclpg2b4qqO6VW8hj8h7TlMQiDE/lWxTm4D6
	FP1+WW1XvsxZYvWC0f8eqc1nhMTpYWaNN+1SMb5oKBiFZTk2g2uWGL77vzfLnrwVQRJdm3hXO7+OQ
	WsWqKOefSYTns2HRlpXxD3IjCpZFxMgPEu2kZX5fMfKrPLs3Kk2E692F45X2CT1kYFq01111cs7LW
	qrj66MvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEf0-000000077vz-2agu;
	Wed, 10 Jun 2026 08:51:42 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEey-000000077vI-2lyU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:51:41 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-36ba706ab46so4412809a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781081499; x=1781686299; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YZTUwD5334qhMn45Nv6zFjWXwDHnBznaVHmh9fHzOkw=;
        b=FOuc64jSKAddwownFH1MZWGbqyHJfj/+HZArNTv3PxFYfYtOlnLcyDPID4IiBrHBMs
         QlNgt/SBKGLgXK9sCmdHH7hBl1aq2oLoat1P7XPXxUmLK1wmtUo8aJCgiZ3zORHARUdc
         BWPTIyaO/MrIE7LXu42CSrvqMNpmTRirteViw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081499; x=1781686299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZTUwD5334qhMn45Nv6zFjWXwDHnBznaVHmh9fHzOkw=;
        b=I6DBxtVYME0odLdiEY8fTW2y6UoM2/fuLBvs7TTy8ogaN2rQVWf+eo0Vw1x3jZJ3QD
         qYOb1leIXkHAzS9oGImS8ie0XykGHSVJrAmkHBWDjjvdJxNlFtZExcTHRP59m4OQNLmL
         +dGxfxV5h1PRLmUUVYCQI0wRaN6YshZM4rGzEMByvH+LhwweCzjJ62r/UiSmCL/gG8PT
         NVaHU4E74mqmYaT7NNVgva2ZimCMzSKeG44vp7WE2qfQm2SMCJDYSAISAtUjR5S0lmnR
         FzoqdXWdw4093reMVS+S898I+aammoRwE2tWD0mEcl1JPTA/pH5PCeNffcQThNJfO6rG
         eh5A==
X-Forwarded-Encrypted: i=1; AFNElJ8lbVJJUhaVGDzh3V+1usUGqNHzhTf01DZcZr9buXXInrQ/23bSwcKziVKtu/ziGkSJBZtktq0xKwQtIvHRIsvy@lists.infradead.org
X-Gm-Message-State: AOJu0YzuKIbJVrLYvvBGfJJxn/+pXDHWqIoyxdnegwhw3rGPgh4toiVv
	UiLU7RUEf2F93EQaiOXiiRI9b6v22i8HXXI5jhVFbi8I/Wth3WR3CRZjQ/r0RbRJTQ==
X-Gm-Gg: Acq92OHs+pO60JrE2LT9rLFnO8rvJeumqg1ZlugYK05CngumClGKEuUbheyZ3TcnbJd
	jGzadHEIOAQft773eI5zHajklyoRKlqVwapO85RcVacL2eqxZHEHwiPDVkZGEn5NOgO8vA3rd0a
	cvo21yqrMXaIrCLPthma2E2mOzCw8drqw6iXH6QE8nxWHrIABMqo8cKJN+qp+J0NrfGfw1ugufh
	EVpk4L7uwKl1xt5v1hWexKYrinrgX7pkqJEcOHDPfSb0Ye/wntFXDaZArHhh2NQl9Qnew0eh/wM
	8GPYFhrSUtEBpuMuf8cbVVpx3WBBjRu/RM9cuguCsrByUu8AZyMt9mZLVhKqsT5yTMO+b9DXPVW
	wg8WBJLpksamZ9kV+M5HQ7QGkn4F2l/LZepmfmdSCeEP0+QYHGHL4+OcCYWdz1Gu+g/f35DHbbK
	zpe034bHSEC/5YRmAjTsa5ZJqoBfMc9F65+X8zys6vqCac+rQIoQ0VnG0bMPeFHO7DJL+DoEqE3
	A==
X-Received: by 2002:a17:90b:390e:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-370ee82f93cmr24837129a91.3.1781081499588;
        Wed, 10 Jun 2026 01:51:39 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:8717:e062:7cab:4cbf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a285a1sm21900817a91.9.2026.06.10.01.51.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:51:39 -0700 (PDT)
Date: Wed, 10 Jun 2026 17:51:35 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Mark-yw Chen <mark-yw.chen@mediatek.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Tomasz Figa <tfiga@chromium.org>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, stable@vger.kernel.org, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] Bluetooth: btmtksdio: fix infinite loop in
 btmtksdio_txrx_work()
Message-ID: <aiklN2uHqmJNemws@google.com>
References: <20260609121329.1262170-1-senozhatsky@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609121329.1262170-1-senozhatsky@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_015140_696979_4110649A 
X-CRM114-Status: GOOD (  13.72  )
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

On (26/06/09 21:10), Sergey Senozhatsky wrote:
> Every once in a while we see a hung btmtksdio_flush() task:
> 
>  INFO: task kworker/u17:0:189 blocked for more than 122 seconds.
>  __cancel_work_timer+0x3f4/0x460
>  cancel_work_sync+0x1c/0x2c
>  btmtksdio_flush+0x2c/0x40
>  hci_dev_open_sync+0x10c4/0x2190
>  [..]
> 
> It all boils down to incorrect time_is_before_jiffies() usage in
> btmtksdio_txrx_work().  The btmtksdio_txrx_work() loop is expected
> to be terminated if running for longer than 5*HZ.  However the
> timeout check is twisted:  time_is_before_jiffies(old_jiffies + 5*HZ)
> evaluates to true when old_jiffies + 5*HZ is in the past i.e. when a
> timeout has occurred.  Using OR with time_is_before_jiffies(txrx_timeout)
> means that:
> - before the 5-second timeout: the condition is `int_status || false`,
>   so it loops as long as there are pending interrupts.
> - after the 5-second timeout: the condition becomes `int_status || true`,
>   which is always true.
> 
> When the loop becomes infinite btmtksdio_txrx_work() loop never
> terminates and never releases the SDIO host.
> 
> Fix loop termination condition to actually enforce a 5*HZ timeout.

Please hold off this patch, this change alone might not be enough.
Let us look closer into it, we'll come back you.

