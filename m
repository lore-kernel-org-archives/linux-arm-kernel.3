Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E57FCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 11:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7i0x0Mh+/8QbCHs8W0p2ZWAuuuE5/Iaw1kmz3sTCjVM=; b=H6FG7L/AljdhpIMHD42lQJPMx5
	g8kk8CkJ8W7IW5JkR7mcUPpZKQbNvL3zyzHBMO2YQz7O8P4OuYR3uamcCDvXXaD0cN6q+YtWJm8XZ
	CLsfyfKWiYs0ePD9IHh4tLREXoH916MR842ot0++8jjEGxUkin6TV5vuuzn1teOcdLla7Rpo+Pb2F
	6IOWrh9dY0BagBzWZ6jPoWRswarWxOU2u0z3dfkepbG99WbOPfiRU7hbpdgblc1xidIJtOAJ3Vk/N
	q3YffjzFX3WXWwUoD06KSSYLP3eO+tdxKn+pqQCNTxAJPUVlnc4YvtdDfD/cIZ0kq7luAQz0C6moP
	Y7iTRcqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSYfr-00000005e6F-0XtW;
	Thu, 28 May 2026 11:13:15 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSYfn-00000005e5X-1bUl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 11:13:13 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-7dc6d090381so6455377b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 04:13:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779966790; cv=none;
        d=google.com; s=arc-20240605;
        b=PJdeicvWYmBeGFwhdPd/AuLOfXH+bLS9dlO/CYf9h4q2Gmx7uimsUpOTrMkOwXq7IZ
         ctqCD8ydZv2VxtzN8e6ec/gvcUolZfU9qvTBzqLXg0Ou57MTvP14i8bLboH4Rrt9hI/Y
         bmbiLINimTD3K56xlv6OlwN9iUYbNvJ90I0y1TAS5e8IhMNcya4ZYxgzOCRzt6vpFnrG
         ZuDgfOwSQigmArM5UnwPLA6w5456ZLBTHE79UzpCY1mPcIY5DuccdFclahG3n8BZPzhE
         8hEntsJmN8ISM86pBHbd+OZvPvr031xSaPqnydnRKmL4YawzukubcgxOoJDzipe0XNrY
         Znuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7i0x0Mh+/8QbCHs8W0p2ZWAuuuE5/Iaw1kmz3sTCjVM=;
        fh=9hV/tKHLuduC695/Z0hDmDhG0VagSXLKlaBfQs7K/0g=;
        b=lreD+L1E2OtD448CWqXUYaYyJXE+P/xvkRIOLeIXxPHyH5TPj5Km2RqPV90vpNw5U3
         jS3yrO9czoMaZVQVNbcm9wAE8sehMH1SOQafZvdx7RrlRNAoW0BxuPTUVtfttHxGpUWl
         6EXQmVsc/ZxI3lnUEBkn4k4fbH36/HmJBXIOUDMV/KKfM9i7PomWE3OpE6nmI6FekBNh
         HLrImtIF+2k9jK64ODDVsjMNQboQ13Qe7OxLUwBHKqrcDOorgkN6xc3gQO8VfM/vfPcE
         EESvW7dn3HFhC7CXX2bLvICxEwbwDLJ0wxQboSPNE1SMfupNRIIXjVfo8w5d0xZUm0nn
         9RBA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1779966790; x=1780571590; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7i0x0Mh+/8QbCHs8W0p2ZWAuuuE5/Iaw1kmz3sTCjVM=;
        b=P77UM4c5GBQYmeOytLvTHEK3SJBaJ53KJIdhjyXi1c6vLNSSihuZ/7UqtlXxO+N2TR
         B68VoCmU4+JAncvAnkbBciIIGI1hRs/EsTjMonKrIsQLQ/7AkvtAsWYWxXsxd/QVisR6
         qlsfWC8yPwwrtMUxTBvL30ByTb9oOTQSggDhx+lLemFBU2lLpYvn6VIp7qpfZuW0t1AK
         P+jcw6sIxhj0WwxutrJsgqRIzAJnpe6R933EsDI7JN0P7Xrtg0TVpBY8oTuBvaQm/XU+
         IxgD647NkP7H6KN0bm0jhJUAlbu1+P0QUHS6iCafMOug01AkjLv2RHcuql+7vOCReWwN
         lcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779966790; x=1780571590;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7i0x0Mh+/8QbCHs8W0p2ZWAuuuE5/Iaw1kmz3sTCjVM=;
        b=pzKDb/179agrdAOLyIxCx1k2SsrvsEYDzWdjtgNZA62vQrLCPlNHfYeLx6FgKmYUOA
         Gs9QV/e6v8HKWuarFtOvGa+W+h2Q7SKlSXRi5RlKbTVLXBDjGx7CSq74zGTiYFwnV/1H
         Qp+NXEdV2IW5X0yjwyxEJdDUbIQuNrS9QT1X3ApBa0WJgy7ppeflfMHH8ZpxMXPrFjPp
         ZknHl0OFyLa56irDeqUiAxUk5I1DggNlXaWT2b+N4hy0j0dvA4xeDBng4NVwX7KTMw7D
         kv+/I7SqFfl3hrh5vdJxlXwtjtD0VktTJLxQv7lAIyJe16JliVxX1qZuYwx3pCudR1rt
         uWgg==
X-Forwarded-Encrypted: i=1; AFNElJ9EL+rHX3kePBXpIDOC/uGyLYXoLQvfdGOMgGQfAliyKIHn2ZhoZTo0UeR84XVrUoT3EMXL2CCb/mZkytHrUk4X@lists.infradead.org
X-Gm-Message-State: AOJu0YzIlQ9ZI0rUDMQXFkTaSrOeWKgpHkv/tYR/Ldqaiw6xbbJi1D6+
	NWiHk0wZFUXNr1dpCLOflnHtgZ2sYCVOrW7B04flz8j/7cjrw4aKSZokZl7qTXvzIdEM2adIAGj
	qdF8Z1XEY29p8hg5yszs9U0nk0iDUoqwooa6JQd7whw==
X-Gm-Gg: Acq92OEajxUkNwoP61avHqg4eZa6RZ/yW3/pfwIB+bABDYqtSdg8L/316kehrDvCM0U
	Cys23Fab8e5cAqidI2an42knv+kd8CSpeR70758dFzrzXLhkvfXK4abh+6rqSiQ6xGbh60sPMJN
	C3p72Eg5bQyivQvSDHgP/ZOi/XT+1MkXh5aZ6O4Ed9zC0BMqW/pPYsihbzvpVbWHI4+uhcp2vUE
	qXLfa584lWvYS8Cwp74qOinyNz4QA+n25O9R435bK1Igq8Z1OTJ0ZTo0620Eqdtg1tCtkDhZtyQ
	HjOksCsFAuBK2ftuwtqW49iFSvkK2I9/UIxBaxnO1mTkzANX+YsjGwTYnTqtB9VccLQF8xM8NTQ
	IkKPdDEsK0kooVUBBXpc337+VE6YcuSz47XsOsbwKyxiR+g==
X-Received: by 2002:a05:690c:4447:b0:7dc:6d08:f66d with SMTP id
 00721157ae682-7dc6d090307mr22734527b3.43.1779966789832; Thu, 28 May 2026
 04:13:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org>
In-Reply-To: <20260522-bcmpipm-v2-1-a3da66cbc9f0@kernel.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 28 May 2026 12:12:54 +0100
X-Gm-Features: AVHnY4KowDmRsRgFHktSHjKbCUzQp1ZjpPkM0_xWGj4qaba0tEAdnvA-m95xscQ
Message-ID: <CAPY8ntD2AWW7xaSL=J9Esx0XoQQdVFUqhNt=dAi6f0jqsLx1tg@mail.gmail.com>
Subject: Re: [PATCH v2] media: bcm2835-unicam: Fix log status runtime access
To: Eugen Hristev <ehristev@kernel.org>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Hans Verkuil <hverkuil@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>, Naushir Patuck <naush@raspberrypi.com>, 
	linux-media@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_041311_560196_E1BF6A9E 
X-CRM114-Status: GOOD (  22.32  )
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

Hi Eugen

On Fri, 22 May 2026 at 16:29, Eugen Hristev <ehristev@kernel.org> wrote:
>
> When requesting log status, the block might be powered off, but registers
> are being read.
> Avoid reading the registers if the device is not resumed, thus also avoid
> powering up the device just for log status.
>
> Fixes: 392cd78d495f ("media: bcm2835-unicam: Add support for CCP2/CSI2 camera interface")
> Signed-off-by: Eugen Hristev <ehristev@kernel.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Thanks.

> ---
> Changes in v2:
> - changed to use pm_runtime_get_if_active()
> - add corresponding put()
> - Link to v1: https://patch.msgid.link/20260521-bcmpipm-v1-1-3eba88d88045@kernel.org
>
> To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
> To: Mauro Carvalho Chehab <mchehab@kernel.org>
> To: Florian Fainelli <florian.fainelli@broadcom.com>
> To: Ray Jui <rjui@broadcom.com>
> To: Scott Branden <sbranden@broadcom.com>
> To: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
> To: Sakari Ailus <sakari.ailus@linux.intel.com>
> To: Jean-Michel Hautbois <jeanmichel.hautbois@yoseli.org>
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> To: Hans Verkuil <hverkuil@kernel.org>
> To: Naushir Patuck <naush@raspberrypi.com>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-rpi-kernel@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/media/platform/broadcom/bcm2835-unicam.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/media/platform/broadcom/bcm2835-unicam.c b/drivers/media/platform/broadcom/bcm2835-unicam.c
> index 8d28ba0b59a3..93815b8ab930 100644
> --- a/drivers/media/platform/broadcom/bcm2835-unicam.c
> +++ b/drivers/media/platform/broadcom/bcm2835-unicam.c
> @@ -2052,6 +2052,13 @@ static int unicam_log_status(struct file *file, void *fh)
>                  node->fmt.fmt.pix.width, node->fmt.fmt.pix.height);
>         dev_info(unicam->dev, "V4L2 format:         %08x\n",
>                  node->fmt.fmt.pix.pixelformat);
> +
> +       if (!pm_runtime_get_if_active(unicam->dev)) {
> +               dev_info(unicam->dev,
> +                        "Live data N/A due to device inactive\n");
> +               return 0;
> +       }
> +
>         reg = unicam_reg_read(unicam, UNICAM_IPIPE);
>         dev_info(unicam->dev, "Unpacking/packing:   %u / %u\n",
>                  unicam_get_field(reg, UNICAM_PUM_MASK),
> @@ -2065,6 +2072,8 @@ static int unicam_log_status(struct file *file, void *fh)
>         dev_info(unicam->dev, "Write pointer:       %08x\n",
>                  unicam_reg_read(unicam, UNICAM_IBWP));
>
> +       pm_runtime_put(unicam->dev);
> +
>         return 0;
>  }
>
>
> ---
> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
> change-id: 20260521-bcmpipm-6c578e73239c
>
> Best regards,
> --
> Eugen Hristev <ehristev@kernel.org>
>

