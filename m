Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DBB1CD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 09:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=; b=Y6stavWbLRu7ydHL+lmI5SbCpR
	RvR0JrZqQqNi7XykT8TotkMjU0nDV7mS2Uy5IaT1cXYkOwHtBEmTfiNYjLEjMGqP+6nTeLgOOC0zH
	Fbnj6N6+DZqp28KsCWJkBXp+nZFA5Pl2GJk4f/qSUmSiyQ5bm5/7XT5UXW4zrAhK158I30jenMRBb
	7ztT4qw0r8p+fwvfQ2dgd8l9CWAcIiIgHpYt9mC3xP27gOQo0dYEgP8bjPQ3uSQ4xGIJjhk320xg3
	pLJYnRopoTfTFHcrK0wWzf8LYfHomLRFPk3djfpUi3Bdat++2qI1v5OnQYv1MlAgAITVVj9ba0s7i
	unjKQs4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXy1Q-0000000Aeev-0CGS;
	Fri, 12 Jun 2026 09:17:52 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXy1M-0000000Aedl-2VnT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 09:17:50 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-7e1c3f47d78so8231587b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 02:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781255867; cv=none;
        d=google.com; s=arc-20240605;
        b=l0SbOPXvDo22SWxUO/R5o7DCUBomRwWC/26zA1XlTkGtGkIBMRPdyHFKl/35+pog/6
         aTUtpLcWcxukYztfpNWug36zmZP/9gRaoCWuM+xHBLlfDfEk4cEAYE8guFRz6NtfzwYr
         //JcJdArXuJ35L7SewO/+6vTn+HMzeIYhzA7mcJ5ux+IdQsgtyhVF6GbbfkokB8dvI/p
         2rtuyW5L8/VbKZDCRUzXGggpbqB+wBeSs/A56KFijXiTHsB+7CZopX/ChpBgQo3PJXyU
         hTh+6Rax6u7TgEJyfH+t25o9/jxk4NotWiOqYqaO6JZF6YmD+6rg5y3lNGE+ARwiEDC0
         3kaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=;
        fh=z+b8holnlvEIOd3yncTXjv2H7vjhqQ0nOGeGWF+DT2A=;
        b=PEXCZ4xMB+/awcH+5Kcks+ho7oSbdSlPrkW30fkQi/fIzYNCLg7I9tEXY1qRxi4uZH
         YEIFyCeBG6TSa4Rg52Tdo/pIhWcSv4gRhBkwxDp47B1cmpJVxoPH3tXMG3lIMGF1P3lo
         9uPbCPBfAB3XygSrldB8/EuBq/1WyGKSTWGeJysrl1EcgGai7Mj4w2zZRs/cX8RtuPw2
         RK+GTv8KDFJQCXULLxeFMMAIkBFp9whMO2/ueik1yNmzIYmyVZdVQYO+g+uamiIl8YR3
         0iJWkg70hSBfOKKXmCMVHNq5IPuRmRUrx1lrzEme3jhHawSMdUt+FM/jGk6P+yDTtzZ/
         ZdfA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781255867; x=1781860667; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=;
        b=PmP/oXhtHrSfkT0f57kptGX7kFCbeW7QARvQQY4m0q5+Zog3wsolwqqUp9egT6ojue
         dEYxiVjfsINQ1psyK1iKYiGLGy/JSDDCImFtFIGtFFCJ+lJG6WsiZMThRn9SvZH4OMZB
         a/KSNg06outJgRm16vmZUx7F0sapFrYnhaeuU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255867; x=1781860667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hhcCFioqMSZRCk/5HvD/sKp69EwBtqpgSp4Ql/r2CVc=;
        b=pDTgwAw3un06FKANkX6s2dBEQ9DH8yos4tvLen5M4RNcqx89sWcU4JHhzZhEOxZ7uJ
         0YdrZURJTmfkXkbHbUylZ01e4AF/lnG2Ju5u5lTFV7xgxlf4isVtH17E6V7N6tgwDB6q
         tIv+DoiNl5aCwaAg6HrSew5c/fPZitCynigYQhLyQWUr7URa8PZGDU0MNzPIdy5gob2u
         egS7zNjT1tgQWNm3g/KDRe1MS1mmhCWdYs44lfhRj7eyCcVrcG9oCGRUkYcYpqGRrNna
         3+0VarKMYm2sIgrKcqvPVrh/n0FcdBzqwlsdJh7QD4bdmzlAvvXdgDOpovnYj9BdiB5e
         /bGg==
X-Forwarded-Encrypted: i=1; AFNElJ94PJco5bUqFUBDUQC7Dsp2SOdBbIgHSkZ6x3C/wLBZhiuYBXSahwfEn/30HEL/3XKLvUF7EuisWNhMhuOUGL0g@lists.infradead.org
X-Gm-Message-State: AOJu0YyX3+VHNaYQV+Ca85939hkJRv7RGE0HJtGPRXb3SK/LvVWOQMim
	MbaROVSR+rGjUvCgWuEoVNMQKpeNO/sF7uCsce68ydBi/UgeUKPWmXH6i/AUvm3r4B78MnxcdYb
	3WpNvGpD70ZSfumu5regFGxgCMcxc/SIIRnOi2RXu
X-Gm-Gg: Acq92OGn6wx/qinsN4+bcHMjc96MkNSYWcO0nfeSp+/DPe6pz74LjJltmlDpa/aJv8A
	qUpPNgaJt1GW48w04gv55FQDIlaAKft4R5Ornwpf8RnAN9JPCS8k9BbRKieAKdd3cSaSbio5Dry
	LpyswlOz4AwZ2Cg2exQYBSie+Fuf36jOKgCxTr9VaN1JKyXxccFClZtdVMeTSBlc9MRAUPbvtQu
	Npz/hl2FHG+0Pjyz+42qyxaizzvgxyXtuy20aUijiJfeJ54hvBZFdt9f3l/AMCV40B8LLMOpXGT
	FwqiPdVk
X-Received: by 2002:a05:690c:3a0:b0:7cf:af41:50b0 with SMTP id
 00721157ae682-7f7b8d248damr20618557b3.36.1781255867482; Fri, 12 Jun 2026
 02:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260610084053.2059858-1-wenst@chromium.org> <20260610084053.2059858-12-wenst@chromium.org>
 <ail2VcubjT7HNGUC@ashevche-desk.local>
In-Reply-To: <ail2VcubjT7HNGUC@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jun 2026 18:17:35 +0900
X-Gm-Features: AVVi8CeDuG6qw5zFxFcHgtnnMaKWsSajO4ZT4D-k-SPwtRIr1WJR_hE6bMB1VZI
Message-ID: <CAGXv+5GNfWFinO1E=5X46xnBsQpY-_i45mq60eeQu=U3Z0MtDA@mail.gmail.com>
Subject: Re: [PATCH v2 11/16] power: sequencing: pcie-m2: Add usb and sdio
 targets for E-key connector
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alan Stern <stern@rowland.harvard.edu>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_021748_670866_E5AC7F51 
X-CRM114-Status: GOOD (  14.97  )
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

On Wed, Jun 10, 2026 at 11:36=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 10, 2026 at 04:40:45PM +0800, Chen-Yu Tsai wrote:
> > The M.2 E-key connector allows either PCIe or SDIO for WiFi and USB or
> > UART for BT. Currently the driver only supports PCIe and UART.
> >
> > Add power sequencing targets for SDIO and USB. To avoid adding a
> > complicated dependency tree, rename the existing power sequencing units
> > "pcie" and "uart" to "wifi" and "bt". The existing target names are lef=
t
> > untouched. The new "sdio" and "usb" targets just point to the renamed
> > "wifi" and "bt" units.
>
> Why can we do that? No breakage? Only internal names? No ABI affected?
> Please, clarify all this in the commit message.

Will do.

In short, the target names (which are not modified) are used by the
consumer, while the unit names are internal only.


ChenYu

