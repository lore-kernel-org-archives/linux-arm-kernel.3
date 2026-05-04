Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9F76FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 06:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGJ477HuI1WPg+LRgbwSNS5n5sfdYQDEeJHoHa7Wyzs=; b=KkC0MQbcDaTcK+c27LWLCn5SQR
	bhshTAZpPUv9drHX2yd18htAO2QToPGj41D3sA/otU5VUa7GxBBCIB0ipX75DcRT9SvMa0ivbVuRK
	U2SLrePbAo4/tYw+bZ56EVOd9MhJQjqw7/G0r8AeUuWuLdnzMrySMjUhy5lk12/Ein/uYZF47rRZp
	etFhstcZuxrserZs1zY+H/EBAS6aF4oTbF2vkzVavNx/QIutYt3RxmzRwyRTrYW3FS0yvkF5ClYHX
	rDsmpRep9SLpZL4QI/nYkik7KKNWiR9iYojKNBNL2abbMdDFbl+kh/fEVwTwliwXw54fKV112K1yJ
	tfupEKAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJn8e-0000000CXae-0klE;
	Mon, 04 May 2026 06:50:44 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJn8a-0000000CXa4-3YiT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 06:50:43 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3650a4eb605so1299629a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 23:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777877440; x=1778482240; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dGJ477HuI1WPg+LRgbwSNS5n5sfdYQDEeJHoHa7Wyzs=;
        b=KEwwFXYB+wjI8UXgb5ZN74anpWdgKZwooJMiwKiTrYg1unceXJwEx6iGJYs1qro29g
         WujyTPRid3vIYWEJgXiNlvFUe0rE6wzM6pWxiQ5KziIX01gih5Nsr+fIyL+mAub84bGe
         7DUNzTwdDwoSi9WRSQ1t2krW1FmSLBRpAhXWNjMqsVsBv0GsUKw+fsmdcMW/gJIIgw33
         cTKZzA6yzpiH+JUPe6aRz6oMyZoywLmJHd4xdU4hDalcczWqXQrLBOTCXROMJUoVu2tM
         6F4OKbSBYCc0Fng3SDKG7kp5Z7y21IjlEpF+BlP1pUrcwm11ICUT5yhHjybes30whMEc
         jwgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777877440; x=1778482240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dGJ477HuI1WPg+LRgbwSNS5n5sfdYQDEeJHoHa7Wyzs=;
        b=Axf8gFJsTS8nmvSJC0D4oEaHV6B2WqbMBzJzhNclyLqRFdUy2Ou8JALjEzQQfynke3
         AHaGvA3DWzkwNyBdbrOzruhtDkz0uqDqdW6dyiSPFSpkbkUcLJ/urHHRU6JOBoUIMNlO
         M1RV27HggCzcDUu4f7KfB99VUWbsHnj2N8uhnm8l4C+PtL/0m8oN0TdOBvAlevCkbKBJ
         0MrTtFgBR9Dv7/c5573wZg6INR+fMhtARU+97thiA+e2JVqIF390qhxZsH/cuTl9EUqE
         NMXYAV7ojjbZ4Wzp6QRtgusISYKHho0OI2FxzLTsC43CP4bkWuAJy+8rBTQH2UKRn0C9
         iWow==
X-Forwarded-Encrypted: i=1; AFNElJ8K2mrmXh+8OhsIBizHYiHD6M4Hkd6IpYDE5WZV4o6+dXQdjd1+mdgt3JWJttZfA5aqwyCNY2s+ZTvHEpWgHuWd@lists.infradead.org
X-Gm-Message-State: AOJu0YwsdXazWGI9zk4iIVhGXlxEwY3nLxgJctdcdPS0t6aQ+MqIJF6F
	vZJ5DguqNaOgjzrxqWLYzoZMIXOUoiMqkz47KgGI9cQl/OMV1ncD+rUF
X-Gm-Gg: AeBDieu5jDksYMxOa3gxoQDlOSPyy3SxQ+op49Zxbaed07qcg/0s5oKmzXP4zdm97sf
	Uel6drpW4Q+6QW6o2WhRHi2AMEEu5gblnTVyoxWPaqPzXTO/fB+e9O79nYUbraz8Bmwhx1ismWb
	rnOgdnC8a+vz6CVIj6ljGNW5N7A7PT0J6qXPui0kofma6XAD4vroPfx/38wEVtTY8ipRoJO6bDi
	PO79e5FRvWckbxrllREoZhzY4HDPZYP15ruh0fMsLmWQzPpM2cEgEqHgC31LRlRF9iFYmlDwJb0
	gxMqXLU4huznhP464VEs+w7N2gsC2HNKUldsv4IYTYl61/y/CzaycbTBSr3MS1BHpF+Vccu0wSd
	EV9k6QJNceswMX/BtxXtGeqQVPtSOqBjP7l5THPny09XpsF3zDk3FrqOpuLMAJ1pe7MBIFU7Aw6
	0O7cVnTL7j81HJcVGSKuP1AoadDoAaSv5WkhEpWMBwUcRnAlb3cKACOiYj701vdEiSOWxYS2fq
X-Received: by 2002:a17:90b:5808:b0:364:d994:da00 with SMTP id 98e67ed59e1d1-3650cf15bf5mr8689925a91.25.1777877439686;
        Sun, 03 May 2026 23:50:39 -0700 (PDT)
Received: from localhost.localdomain ([115.110.225.242])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364f4859530sm3918712a91.10.2026.05.03.23.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 23:50:39 -0700 (PDT)
From: Shitalkumar Gandhi <shital.gandhi45@gmail.com>
X-Google-Original-From: Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
To: gregkh@linuxfoundation.org
Cc: Frank.Li@nxp.com,
	bhuvanchandra.dv@toradex.com,
	imx@lists.linux.dev,
	jirislaby@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	peng.fan@nxp.com,
	sherry.sun@nxp.com,
	shital.gandhi45@gmail.com,
	Shitalkumar Gandhi <shitalkumar.gandhi@cambiumnetworks.com>
Subject: Re: [PATCH] serial: fsl_lpuart: fix rx buffer and DMA map leaks in start_rx_dma
Date: Mon,  4 May 2026 12:19:41 +0530
Message-Id: <20260504064941.3460658-1-shitalkumar.gandhi@cambiumnetworks.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2026050410-frozen-fondue-5476@gregkh>
References: <2026050410-frozen-fondue-5476@gregkh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_235041_418796_0EED51C2 
X-CRM114-Status: GOOD (  12.62  )
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

On Mon, May 04, 2026 at 08:24:20AM +0200, Greg Kroah-Hartman wrote:
> > Any update on this? It has Frank's Reviewed-by but I don't see
> > it queued in tty-next or tty-testing yet.
>
> What is "this"?  I see no context here :(

Sorry for the missing context. The patch is:

  serial: fsl_lpuart: fix rx buffer and DMA map leaks in start_rx_dma

Fixes three error paths in lpuart_start_rx_dma() that leak ring->buf
and the DMA mapping. Sent April 20, Frank Li gave Reviewed-by on
April 21.

Lore: https://lore.kernel.org/linux-serial/20260420135903.2062024-1-shitalkumar.gandhi@cambiumnetworks.com/

Happy to resend with Frank's Reviewed-by added if that helps.

Thanks,
Shital

