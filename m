Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8AECCA470
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Sep 2025 12:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BAIE6N/ie1ZesaEiWPTQEN6Rw49R0R3rgXHZKFPMKzc=; b=1q2VeFz4ft8sKpc0IGP25+r8VK
	4eXJTES/oAgMcCi8FbGQh+69AP/JOpAtwhIxmA0MMN7BoIWBqsYotB3Nv4eHGBb6hgJRDkcfvXV2V
	IeKgUdGGFt0fZjiAlVTe3er3qh5n2wdJXaxQtThRn4o6NCGqi5vnABbl3rEFFNe1s4KaNlmxmEPDW
	chQ3UPxac83LJyfDWfXlDNw6uHXZt680EF/x6pY/vVMdAQwNZWJ668AZFzPmKQwYZLYE4fGAPdU1a
	FnsK0uquOhw/g47TFFJCS89RaYAUjeIWAgyOU0kU5p7Rg5r5/0apV6SafQePwFyCJPCskUTFjRtVW
	DkN66dUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZAu-00000005DKb-3HFP;
	Tue, 30 Sep 2025 12:09:44 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3ZAr-00000005DJF-0lHx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Sep 2025 12:09:43 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-57bd482dfd2so6561484e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Sep 2025 05:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759234178; x=1759838978; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BAIE6N/ie1ZesaEiWPTQEN6Rw49R0R3rgXHZKFPMKzc=;
        b=OY0fbAmQ1wVxEIiHvn/S1ot2W2vCXmvgg8RkCHnEWfAxgbABg4ELD9cRKLGCeK0NFV
         rzXxC/yRLTvZaWUr03wjZ62suGbpdZW+2Ug0510gx+UHYNy8dCP//jlUXbthcjgGG7hu
         wITzhBzQX8os8B09XSsmm6PbSW8awBj3PsrXu9BwibJuPEsvtDvHyytX9sgJlgzXyoN4
         8DVxbnAN9FapJ7LvoGSEBrjPQrJ3Ep/DSywxXptqcuGZ07j5sBHKtXmtkYBloxotNgz+
         lAPRNMtUn+nPFtXwcU4pkpgbbK6yRx+QrxOoOuAbONSLavgKTqkqXK4iKl5SZBEqObxs
         k8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759234178; x=1759838978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAIE6N/ie1ZesaEiWPTQEN6Rw49R0R3rgXHZKFPMKzc=;
        b=aTLiB2Q3lHib/GwyX1h4PPhpJUTkci4myU3/5/MHnQhbhm+2/deEens1ThamAAbYjp
         tO9Fl6Z9doD+syQyXbaNVOvDkQpKahj2PoNRQdQlrRdzTXoZ+PLzK9DdMch5sB2PPRjl
         7CYCF5JDrF7Mb0VaE4XhKK36yBH+hdVrDTo8M+HjFB4dAVKrnGLfSWMgp7uweE1V3Wsq
         fKJDH4NptKK5uVjdoTObwTR7pGp6OAIoA1RnjgYh0dy3W8TiE6mPs9+XJYVJtVbBFiaM
         KElHaN60LGG0Ii4JCom8m1m8x4Ng5ajDkOSCJ7f3jhu1dkQF9OeQz4wBWDOkq5XYrhNY
         ibLA==
X-Forwarded-Encrypted: i=1; AJvYcCXHHo5W6hcoJ/UnAbuTF45gWAwNJYrt6BMNML+DmJXEyCPYjAU/1qN7foLrB04KWCLibqk9vq6llMT6ECrF+xBt@lists.infradead.org
X-Gm-Message-State: AOJu0YyLoTGEXZHUrsTVnL7qzA50zqXJLbY3iw9PDGY38n1IwmIlRdZb
	830oZyC62VVJaLdWox4MjDx4q6EKXaZsJGc3eP5+fW2zve5pYWt9Hhsc9qjTIndgoPLVK58Nr5x
	XaKxJEUbCOn7NdVw1QwKzNgmsnJfzXcocQXQHRoBWRQ==
X-Gm-Gg: ASbGnctoceiPASCw7UNW4y5W5d5C4kuKe+tv1tDydckfVNReGQCcvRK56tYKcQdhDsF
	yP4nz5cBgJUrkQydZYVoGUDE//TUX5TvcvgMhMPj7boTGdI9DFtzeUbyhNwWU+R9s53RCNp697+
	f4az+hKGt8H/dBFR7agZ/6DQozhSxjV4fXKVsd9DOT0hoWlmccM/U9M7dxwWa6vW4okNzx/h5Wk
	ULdh5D1ZmcoXn+eO4C4m5UCmIwB3FU6eJueM1xykA==
X-Google-Smtp-Source: AGHT+IFSwW9Wy1FU+esxU7n+NnGnwYqfKtouELxp+NZW+Pi9jueaReG4jfxbaQvtzn5VmiWlJbhIyO1LxFlQl0vytEM=
X-Received: by 2002:a05:6512:2c8f:b0:55f:64b9:3ab4 with SMTP id
 2adb3069b0e04-582d2299c9cmr6543141e87.23.1759234178520; Tue, 30 Sep 2025
 05:09:38 -0700 (PDT)
MIME-Version: 1.0
References: <VI0P195MB2739D000BD1BF18B3B718F93ED1FA@VI0P195MB2739.EURP195.PROD.OUTLOOK.COM>
In-Reply-To: <VI0P195MB2739D000BD1BF18B3B718F93ED1FA@VI0P195MB2739.EURP195.PROD.OUTLOOK.COM>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 30 Sep 2025 14:09:27 +0200
X-Gm-Features: AS18NWAALVNybg-tprH2AdPhVEMvREN5pHeE4UHKDbwJmi9lhCaGcWVtSNrYsTg
Message-ID: <CACRpkdZbwuf2Fgtq+jyqzqspb37-P6X4O9xqkG-mSb+afSjh3g@mail.gmail.com>
Subject: Re: [PATCH] ARM: Make sure CPU_ARM940T kernel can be built.
To: Franz-Josef Haider <fj.haider@outlook.com>
Cc: linux@armlinux.org.uk, ardb@kernel.org, rmk+kernel@armlinux.org.uk, 
	ebiggers@kernel.org, nathan@kernel.org, rostedt@goodmis.org, kees@kernel.org, 
	dave@vasilevsky.ca, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, trivial@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_050941_403638_73BC8F76 
X-CRM114-Status: GOOD (  12.54  )
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

On Thu, Sep 25, 2025 at 11:33=E2=80=AFPM Franz-Josef Haider
<fj.haider@outlook.com> wrote:

> From 33ce5a26ef08199625bc5bb01a176047bfacff91 Mon Sep 17 00:00:00 2001
> From: Franz-Josef Haider <fj.haider@outlook.com>
> Date: Thu, 25 Sep 2025 22:14:07 +0300
> Subject: [PATCH] ARM: Make sure CPU_ARM940T kernel can be built.
>
> Fixes build for this cpu type.
>
> Signed-off-by: Franz-Josef Haider <fj.haider@outlook.com>

Please elaborate a bit on this change in the commit message.

1. What were you trying to do.

2. What stopped you from doing what you wanted to do.

3. Why did you do this change to the kernel to do what you wanted
  to do.

Should it not be:
!CPU_ARM740T && !CPU_ARM946E && !CPU_ARM940T
?

Yours,
Linus Walleij

