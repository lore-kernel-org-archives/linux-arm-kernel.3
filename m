Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C63FC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 18:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ChLEr86ZFedRuooYVXm+1oKgwf+je0INxoHyO6ITtYI=; b=V4xzCeQEokjsofvfv4DfU2cyM0
	/Qlw7ZK3x1T3vj4yWiY/ZPSYncoHy9be2PCE6vqA21sY1hprHr1XKTndsHcgCdVIHgbPm7cF5syTQ
	fcrLwvdMQM1S7j1CHqOYT0b4Nm2TVPX38w6ttmgQao+IEKOmC709zQM2t50GNxcqWB5IIDQroLIka
	I7Epcbd79rgfR6v0vCdBRCi+rkWV68Wyi6bXiDVtRKcoKuKsbG7t3Y1hjVpEgO/OoR+ZS41XmpCsn
	0aWa3+8X6cqXxVHAseKCYFv5YoJrx7UM7Ycn3NAe9xSslpfB2QnYifyml5G54ojOOJ7eCLusU2+49
	LmPqUOwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH56Z-0000000A7hh-0DUi;
	Mon, 19 May 2025 18:20:51 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4Zw-0000000A0Y1-3Bca
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 17:47:10 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7304efb4b3bso3068902a34.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 10:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747676827; x=1748281627; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ChLEr86ZFedRuooYVXm+1oKgwf+je0INxoHyO6ITtYI=;
        b=BCvbtdvoAQmS2sWYw7hDn51FFXhpgAOLsbVyOYYsH0yPZDaJ0KZl39or7QO+bEj8eT
         Ht5DfmxAU3GmFBGr15ASr+PIWAiYbWOZtXMueg+Okc2z3qmaAlVljo7/iDtrBlPcdGvQ
         X5W+qLgj7zwiyKX1z3cTb8sFg5/DlVk/Scdq6Cr7vSB3v90wQ3BWeaohQOgXcQrzvpdp
         XKgmYtKRQfSGASYAksr0v/LDNxazPreikaEsH1fKyna+DepMdjg6dteU20Epcspc/ur3
         o1BHqkHlyaAK68bGu4xd0ULn4PDc711zpzLHYzNULirV4KpIE/AsvDGs43I1xKshC6RB
         TKVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747676827; x=1748281627;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ChLEr86ZFedRuooYVXm+1oKgwf+je0INxoHyO6ITtYI=;
        b=VD87gODSkG/E0imF1VhnQbE+7oBZoaToxJUidZi7gFWd7ChwYk37SqcxgC4B9qr7Bv
         UWIS/Ms3R3RmB351UvDd3laNZ6o9fAriIvMJfKgM9RwUG+wPzXIaRGJ8Rt4FHp/GekqF
         dOSZ+NNl4MmGBoW9VYciw4D1YbswiEEIhrt3irAyLab6zMoEs6Ww2p2ZxQLIED5hhn21
         87oFXcezMtuPLXgi2iH2B7BcTHdKbCSmlQeULSUecLavlkc2/s+nYcgWKJFCjC2cha47
         nBM3BwhXMshJZqWFo62/TGo7nxTMHTsZko0jKEz+LY0n4iUqnbCzOj+pMGytAR9Oj1+l
         PivQ==
X-Forwarded-Encrypted: i=1; AJvYcCXM5VmZjKsNJ3oxrr5XXmZ2eInPdBHWJwPY1G4Dw4LQPpXBk437B2KjMv2zloCgLypUU4Vga0jsXAnZApmnMWgW@lists.infradead.org
X-Gm-Message-State: AOJu0YxzItIXui+IrXQqvM7cyoZwBw3HUQrM2ujWBfaYOxaZcAZ6ir3t
	cSrYd2SGXRO8W0BLh0mlkDX7YtnCtPKUBrQpzAeauUFkTpNScfRXUbpQMlwUXutmBuPUic6vSl2
	BtTZSDEO96dvEEiXW6TbJBFDp27DE66A=
X-Gm-Gg: ASbGncvxHliPQkVClg18QubalUFiurhrIxTnbg5XQYdMc2IffB5wQ8YfRVM2BREZDg4
	xMQlACNuMTN61OIe3I10MFue6MxBsMDZlDXLtpYYcdIjbmMDv8n+bkYohBLmVsAIoPKWwq+VR1K
	vn8o6b0M8AF8wrk0Tjfs2ely8IWRyFd1kbdg==
X-Google-Smtp-Source: AGHT+IEnVUWDSHozz254hL30P9c6EGyyee0LNYouexPzbQED3hJ2ptthmdDRcsit789Wt6mIUbjJZ0ZsBECK59uKEsA=
X-Received: by 2002:a05:6871:d302:b0:2d8:957a:5164 with SMTP id
 586e51a60fabf-2e3c1c0489amr9135265fac.10.1747676826966; Mon, 19 May 2025
 10:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250513020327.414017-1-peter.chen@cixtech.com> <20250513020327.414017-6-peter.chen@cixtech.com>
In-Reply-To: <20250513020327.414017-6-peter.chen@cixtech.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 19 May 2025 12:46:54 -0500
X-Gm-Features: AX0GCFtqWXwTFFZgneO-96euSqh3v7WYcX1AxmZ5ENB9ZjD1grFsFnZXGgF2UB0
Message-ID: <CABb+yY2fj13YDCYD9B-Hwta47=+CLy6eGSOOc_ez2HrR4-xbjg@mail.gmail.com>
Subject: Re: [PATCH v8 5/9] mailbox: add CIX mailbox driver
To: Peter Chen <peter.chen@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com, maz@kernel.org, 
	sudeep.holla@arm.com, kajetan.puchalski@arm.com, eballetb@redhat.com, 
	Guomin Chen <Guomin.Chen@cixtech.com>, Gary Yang <gary.yang@cixtech.com>, 
	Lihua Liu <Lihua.Liu@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_104708_798278_B73AAF9D 
X-CRM114-Status: GOOD (  20.24  )
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

Hi,


> diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.c
> new file mode 100644
> index 000000000000..c2783dd7d145
> --- /dev/null
> +++ b/drivers/mailbox/cix-mailbox.c
> @@ -0,0 +1,632 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025 Cix Technology Group Co., Ltd.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/io.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/mailbox_controller.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include "mailbox.h"
> +
> +/* Register define */
> +#define REG_MSG(n)     (0x0 + 0x4*(n))                 /* 0x0~0x7c */
> +#define REG_DB_ACK     REG_MSG(CIX_MBOX_MSG_LEN)       /* 0x80 */
> +#define ERR_COMP       (REG_DB_ACK + 0x4)              /* 0x84 */
> +#define ERR_COMP_CLR   (REG_DB_ACK + 0x8)              /* 0x88 */
> +#define REG_F_INT(IDX) (ERR_COMP_CLR + 0x4*(IDX+1))    /* 0x8c~0xa8 */
> +#define FIFO_WR                (REG_F_INT(MBOX_FAST_IDX+1))    /* 0xac */
> +#define FIFO_RD                (FIFO_WR + 0x4)                 /* 0xb0 */
> +#define FIFO_STAS      (FIFO_WR + 0x8)                 /* 0xb4 */
> +#define FIFO_WM                (FIFO_WR + 0xc)                 /* 0xb8 */
> +#define INT_ENABLE     (FIFO_WR + 0x10)                /* 0xbc */
> +#define INT_ENABLE_SIDE_B      (FIFO_WR + 0x14)        /* 0xc0 */
> +#define INT_CLEAR      (FIFO_WR + 0x18)                /* 0xc4 */
> +#define INT_STATUS     (FIFO_WR + 0x1c)                /* 0xc8 */
> +#define FIFO_RST       (FIFO_WR + 0x20)                /* 0xcc */
> +
> +/* [0~7] Fast channel
> + * [8] doorbell base channel
> + * [9]fifo base channel
> + * [10] register base channel
> + */
> +#define CIX_MBOX_CHANS         (11)
> +
> +/*
> + * The maximum transmission size is 32 words or 128 bytes.
> + */
> +#define CIX_MBOX_MSG_LEN       (32)    /* Max length = 32 words */
> +#define MBOX_MSG_LEN_MASK      (0x7fL) /* Max length = 128 bytes */
> +
>
Move these above register defines where these are used.
Also, no need for brackets around numbers. Here and elsewhere.
....

> +
> +static void cix_mbox_isr_reg(struct mbox_chan *chan)
> +{
> +       struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +       u32 int_status;
> +       u32 data[CIX_MBOX_MSG_LEN];
> +       int i;
> +       u32 len;
>
cosmetic: tidy these up by merging and sorting in reverse christmas tree.


> +
> +       int_status = cix_mbox_read(priv, INT_STATUS);
> +
> +       if (priv->dir == MBOX_RX) {
> +               /* rx interrupt is triggered */
> +               if (int_status & DB_INT) {
> +                       cix_mbox_write(priv, DB_INT, INT_CLEAR);
> +                       data[0] = cix_mbox_read(priv, REG_MSG(0));
> +                       len = mbox_get_msg_size(data);
> +                       for (i = 0; i < len; i++)
> +                               data[i] = cix_mbox_read(priv, REG_MSG(i));
> +
> +                       /* trigger ack interrupt */
> +                       cix_mbox_write(priv, DB_ACK_INT_BIT, REG_DB_ACK);
> +                       mbox_chan_received_data(chan, data);
> +               }
> +       } else {
> +               /* tx ack interrupt is triggered */
> +               if (int_status & ACK_INT) {
> +                       cix_mbox_write(priv, ACK_INT, INT_CLEAR);
> +                       mbox_chan_txdone(chan, 0);
> +               }
> +       }
> +}
> +
> +static void cix_mbox_isr_fifo(struct mbox_chan *chan)
> +{
> +       struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +       u32 data[CIX_MBOX_MSG_LEN] = { 0 };
>
Is it really needed? Can we do with just zeroing the byte after valid data?
At least move it under "FIFO waterMark interrupt is generated", so it
is only done when needed.

....
> +
> +static int cix_mbox_startup(struct mbox_chan *chan)
> +{
> +       struct cix_mbox_priv *priv = to_cix_mbox_priv(chan->mbox);
> +       struct cix_mbox_con_priv *cp = chan->con_priv;
> +       int ret;
> +       int index = cp->index;
> +       u32 val_32;
> +
> +       ret = request_irq(priv->irq, cix_mbox_isr, 0,
> +                         dev_name(priv->dev), chan);
>
Can we do this later just before returning from the function? Or
atleast free the irq before error returns.

Also please make sure you run scripts/checkpatch and have all warnings cleared.

Thanks
Jassi

