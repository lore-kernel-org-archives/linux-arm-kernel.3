Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A149D3B98B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 12:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cPTLukRRkvaGSB00X3hsgqrDjbaD+cNjKIgDNOefcOk=; b=T2An4Fhf25LCiB2QXnri5/uo2j
	E8AeQYCYa4CTMbuWcaIa0sYHaauiY65YxIlpN+zjIL9g48DfT38BziQbH4zidktoBlnnhCa0FCkwy
	G3hf1xkEG85HnbK2v3ylkoQ342xs1huheBzF4K1vMxaYtQQ/G7/Djte0FuuR3DFqKSm66VKSmsLNS
	cNOKUl7X3dFtE/R96I4X4mDZ9xJwCcJsXbrAthPXYrzGcWHO1vAYw2xg5lAezycyvU9//yRlticYt
	jYyiM6WJeIXZNTXELLqEljIvjPNIg0qh5KOtrfTPOzev0sw438PI/1N7Wj/kh2H/5PLrYdcey+/TY
	fFQ9gKSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFutu-0000000Aanx-2lix;
	Tue, 26 Nov 2024 12:42:42 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFusv-0000000Aadd-1kMm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 12:41:43 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-6ef0c64d75cso21673597b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 04:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732624898; x=1733229698; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cPTLukRRkvaGSB00X3hsgqrDjbaD+cNjKIgDNOefcOk=;
        b=f4NJIYVxel6rurv8yP5CnLDeoSSBlE9F2FO8JooQJXOeofa1ZHJFDWcwgGmYQh/O5d
         EXhsc4SYvgjMFl9cYykR3i8rR9sa/Q2TP13KmGPciQQ7UZeXmXHV/1BGRZHlnOfvVmDX
         lzzSK4RkclVD3YSURwwtTYuQ47uzf7+75YC04oWWBnnWgN+ZSs8TYmWyXryblGEEGGRT
         Tw3VevTWMm/CnedMVukLLAtCtKOWs/iPw9fcM2bpaEFLFpvoeKpHT/b/x7VfCOgNjzfK
         5SHmaI/S9rnqLmyIUqJ68OsYn7kGDsiYQgf+4sah5+re61IVsaFw8VTUBMk93hdChHfV
         Lv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732624898; x=1733229698;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPTLukRRkvaGSB00X3hsgqrDjbaD+cNjKIgDNOefcOk=;
        b=VPRq50XJOxVP8KCkyOd5PpIp9jYwAXCZTC3+s3jPRnzBIIzTavdClExWW05sSX+K3J
         XcUTS+8Q5xnKkTE1iCiYZtgeb0QfQ9EgB1kb0IJ+EKKWizR4Kw0vOZ7a38K6GJNIK8pW
         mUGZ++8o2V51nKxWHz53xycmQlfNLRjb3IrRuOaE6j1AP++89kl0kI+J22TDD66Fnc4s
         e0Usfo9A/tLQsGkVvcvtZ32hOaD9F5SuJ3Hl0FyAYTNrhW2kYVqpV+cIYZE+x4Ee8oJ2
         MmVtT7zb3tkadoWN7iYYniFPcJmZjSq9FhdjBf3RWpUgUVoRjOiXCFyicBO39LpeFLRa
         1Wzg==
X-Forwarded-Encrypted: i=1; AJvYcCUHUpE5zN3AReeobFhe1HLeIenmEOlfwdsFTAp9rOpTM4xEptE8v2rHCtwhZwPs5qhD95jUg2uuIlydaFj4VV/w@lists.infradead.org
X-Gm-Message-State: AOJu0YyeKVAz5CKP5L2hevruMQ02airD1URFpYBh/Ii72VfRhKM454qz
	1XqOfYSlYAv2p6N5woSd072LkjD+4uLriL3VrjBORnCTqapfgWU3OET7anKMrPqjiWqLeQJznpU
	Kd5HNJPOfNbIs7DKteuz2hfgJooMeCCZtwSQMHw==
X-Gm-Gg: ASbGncs9tFh1l77NES042st3sHmWpXSIJMo60yTg0+4b3LxBkWySPd6XYkxOHUc/Lc5
	cLdcHkgnm9+Qhy1iXbdepLntvr6sbPQGtqStlCcE7uw59ur5yygHj38cfw+BnwOo=
X-Google-Smtp-Source: AGHT+IF6l4+hBDV+putwVYiDk0qugPERHe+upMe++6V3UcZ5/+gbIZmfJ4RQdC8Lpth0bOqnEm38/6mER962cgmW0UQ=
X-Received: by 2002:a05:690c:2504:b0:6ea:8d6f:b1bf with SMTP id
 00721157ae682-6eee0779a6dmr182254577b3.0.1732624898603; Tue, 26 Nov 2024
 04:41:38 -0800 (PST)
MIME-Version: 1.0
References: <20241124124919.3338752-1-sashal@kernel.org> <20241124124919.3338752-21-sashal@kernel.org>
In-Reply-To: <20241124124919.3338752-21-sashal@kernel.org>
From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Date: Tue, 26 Nov 2024 13:41:27 +0100
Message-ID: <CACMJSevZVPcHaEfromwLu1mM5kXE4sVz6f92u5HKLpM65ypbeQ@mail.gmail.com>
Subject: Re: [PATCH AUTOSEL 6.12 21/23] USB: gadget: pxa27x_udc: Avoid using GPIOF_ACTIVE_LOW
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, daniel@zonque.org, 
	haojian.zhuang@gmail.com, robert.jarzmik@free.fr, 
	linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_044141_454483_861302E0 
X-CRM114-Status: UNSURE (   9.38  )
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

On Sun, 24 Nov 2024 at 13:50, Sasha Levin <sashal@kernel.org> wrote:
>
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> [ Upstream commit 62d2a940f29e6aa5a1d844a90820ca6240a99b34 ]
>
> Avoid using GPIOF_ACTIVE_LOW as it's deprecated and subject to remove.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Link: https://lore.kernel.org/r/20241104093609.156059-6-andriy.shevchenko@linux.intel.com
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---

All these GPIOF_ACTIVE_LOW patches are not fixes and should be dropped
from stable branches.

Thanks,
Bartosz

