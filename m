Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03918CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 11:29:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fQILvaHK6HAMF4WWbXGYgrwUATMj459kIP6oFAIBqKE=; b=tq5tAYGqQH5PeBNTRAM59UpF3B
	Cwbaco/r3GGuYQSQG2pGZrA5bvPt/sFtVucLSfXAwb6wvvauX2Mw+yEQBSeK+WCT1Nf8L8ggOKIrU
	VZBnpBvd826MglNliyHCJy0kQpOqVYq1WfqwbnudVz4SbCnreYs5P7ULom7W59YuA9wT4cqNNfVuU
	AyEu/AHM5+iwtopQx5JGCbgZHA/Fwvxl5P3IeDBMOzAK3tU/AQcqnZGgDTGpaZDkWG2XgfB800fKf
	vUBbuOgwjPE43NhTJxnmycCjhnfyj3aoLlvDWodIvoe66y6vfRZBJjKXV5hPU9vYgD/QJBuTopdzS
	Nar9BS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqji-00000008C8L-3l0m;
	Fri, 15 May 2026 11:29:46 +0000
Received: from mail-vk1-f175.google.com ([209.85.221.175])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNqjd-00000008C6J-3rG1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 11:29:45 +0000
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-5751e12c524so3095104e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 04:29:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778844580; x=1779449380;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQILvaHK6HAMF4WWbXGYgrwUATMj459kIP6oFAIBqKE=;
        b=rFClzOBF4mnesgwM/dwieRFmuzFmZQv/8/qUfg29l43lZWJ/rZi8AsJ9cS/34nAIN4
         4kYviOg93MQWUK+TxIyMw/L3l3Y2PZrdhXm5QqV++8vWT280bEvLm3bu/SfQGnwDGi0s
         Emg3RRtDNW5mXbW74fM5Vj/wxntKZ6HWeVIUkKy+lJj1gZNtMfiX7f4mAFu+/oMWKpCM
         yMT580+RUfCWvFShT7+Lx2b0HmPEWhV17XVnKAmWNgDFVIHFnzm+45wPwy7wtImwJY+i
         RbO33GNje+CnJ+niMtlxqY6HVrVFSPZzJmXwY1FaIBAy5y1MSza2hqYExV6Lpx3qfw5M
         rY+g==
X-Forwarded-Encrypted: i=1; AFNElJ8F99LCQg64rwRihcSO4zvKaYWct8RQsBNNzHw29sWLXTwNdkMN695VejbCQxEjNqEoKkC5hTZsUJaFToP25rN9@lists.infradead.org
X-Gm-Message-State: AOJu0YyZqdLB/UA/w1nBmhlw6hIXJ5stHoLl+E/MOv5afT938J4fGYDQ
	K0dcCD+572POXybjMf6/8ufE5H6AwaIbJo2ZafX8Mgix00ajWOKznUdbA3k7E4HG
X-Gm-Gg: Acq92OGPs1HNRFoeWvuwUU3+SbOb7sYem7M7B97ctk8hQA/aPQD4NIqIgYl6iiLQxEG
	tCxJvNst4/QpoBHaUI4FVxex5BxxDTWCP2eMO2OSVa2Pf8TiOnBvegDcwkpKPZBGfIpZgSTQrQR
	SU0N75ZkoMAEqJVtLrr+0STyFbBNcparYoHjBn6VxYzCNLNvQ2wF9MK0pBTTwaZgfL6zRgpgXM3
	FJDXJyhPiGQHk5vi06KRW4xxPlGsN0brKNoXEsiojip8CcWHeLEl/e1AQ/BdjVas3zPdfyr/fI3
	DIWEWijau0yOsPomj+fBluON/T3ssJF+2lAFfOyBwLNCufNRCaWIxkeHzKAnQ74ydbqI47AXqyk
	Ln5L1X62yxpm2tLEsRvYL7E0vYGWAYKhME7m8IeBMN90Lgi6mpUo3cHa2q8s2DmePkd98gv7Dr0
	CEZ/0rf+F7fYv/mIksZK6ut630uHV7ydi6dMezaZiS7flKWvLBTrhHsXG9ypTr
X-Received: by 2002:a05:6122:4647:10b0:56d:b4d1:3c3a with SMTP id 71dfb90a1353d-5760bc668e7mr1400268e0c.0.1778844579968;
        Fri, 15 May 2026 04:29:39 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5760fa5c021sm1045992e0c.11.2026.05.15.04.29.39
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 04:29:39 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94ac7f22d23so2527570241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 15 May 2026 04:29:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/fHGOSHIdl+8sAmZsVTaDkMqQZJNofgyXynKo/kyhh/6ZKx3waBPbzExKi8c/30QYvMjkSxtcpAxoKtMOU3LvF@lists.infradead.org
X-Received: by 2002:a05:6102:800e:b0:634:92c:bdce with SMTP id
 ada2fe7eead31-63a3dc4948dmr1595206137.12.1778844579066; Fri, 15 May 2026
 04:29:39 -0700 (PDT)
MIME-Version: 1.0
References: <75caae28bdffb55199a0bc6cac5df112a966c608.1778838987.git.geert+renesas@glider.be>
 <agb1Q6mrGyDwFdmO@stanley.mountain>
In-Reply-To: <agb1Q6mrGyDwFdmO@stanley.mountain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 May 2026 13:29:27 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>
X-Gm-Features: AVHnY4ILblX8Kc7ouyA5FCpRoUCRbSH433_xQLSBPu5DFSlI9_3oTrxSlb8ISPQ
Message-ID: <CAMuHMdXreO-6xQ+e88AKQ_vSiwMPMnx=t8h5JChBAtuV4UDMEw@mail.gmail.com>
Subject: Re: [PATCH] firmware: arm_scmi: Fix OOB in scmi_power_name_get()
To: Dan Carpenter <error27@gmail.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_042941_961499_FEFB13DC 
X-CRM114-Status: GOOD (  21.76  )
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

Hi Dan,

On Fri, 15 May 2026 at 12:28, Dan Carpenter <error27@gmail.com> wrote:
> On Fri, May 15, 2026 at 11:59:15AM +0200, Geert Uytterhoeven wrote:
> > scmi_power_name_get() does not validate the domain number passed by the
> > external caller, which may lead to an out-of-bounds access.
>
> Is an external caller an out of tree caller?  So far as I can see this

I meant a caller outside drivers/firmware/arm_scmi/.

> is only called by scmi_pm_domain_probe().
>
>         scmi_pd->name = power_ops->name_get(ph, i);
>
> where i < num_domains.

You are right. But this seems to be only API implementation in
drivers/firmware/arm_scmi/ that does not validate the passed domain
number.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

