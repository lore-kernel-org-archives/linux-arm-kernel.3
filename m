Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8277CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 15:30:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=thHtO2n6sNZWx1SbCy0fCNK9DuaQMmc6UdcyydBr01s=; b=De7VeL42HGjE3PZcDPlJBs5m3l
	aNPUBoUIHxnQxN+WFXw3iyBiggNyndruyZNHXJStNxSJnyCbiWsOa+xxR4X0xBp7WDGWy+LYm+h1X
	dnN/fmnyeTIzFRrUcqxWbygIIztx5o1X1oQkEoa+iXE28copAght5OlKQIVYpUuYuKCOQ7EVAQjOd
	LGBcowBAFJpJTpGmONLTnFbAfFUIei12e4OAnEkmrod9A1kzBD8mHIgnZQW1Zqh3awCc5kFQ8efLJ
	dt+GHP5mIlkiom5kYBEQVNhMPQQIFNdLP85Ou7+Z60oJ4OEUcVpiQeeUqU4y1f9cXndsz4G76fQgF
	QNY2vtJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7FE-0000000HMqf-1cbU;
	Thu, 21 Aug 2025 15:30:28 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up3U2-0000000Gl99-1lHE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 11:29:31 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-55ce510e769so841872e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 04:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755775769; x=1756380569; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=thHtO2n6sNZWx1SbCy0fCNK9DuaQMmc6UdcyydBr01s=;
        b=WXGmOMQUnG6IyGL415NgUpOdHXUrcgyk6ONrvwMwCxpcCs53xzzP5di7y7cqES5geB
         EWs/BQe6GRVdgMIBDyK/dJmqo+B2skgdOTHMKekjBJSTYRGdM+vBHkJ8pYyVwjR0d6OW
         WQoskO6DBo9RaCFNusSY5o5yN5myX4n7alKtDXz+iBeLEcuEgOQGdsXih0a6rf9boIJy
         v1044q6DbzKqYoUQ0uGBsqShdsrbJ2TTT9sphLuz/ZsHFNObFJxqGjFzY3rd/addL1Cu
         CaO+2kfjzCwlZ1bPhTMANxPXxhDMiJ76QZdICfocm1+wNsUGkzfuHYNqC9ZWcx+6EKFH
         d2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755775769; x=1756380569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=thHtO2n6sNZWx1SbCy0fCNK9DuaQMmc6UdcyydBr01s=;
        b=GEN/kua6m4S4DM5dVdZLPAbyw1E/UsV2aMjl31gMhCGNL2dKZ+VmMHLuT9mS38yNPH
         VRFzuto/9Hy3vijPw4DD2O715I7BYRpf0rqV0mYyTf34oI+E5cCqMBQZIk+CEB59Zhas
         ZBA30XY0CULwzxEas08cP1h61cvxQ9CeVX5iCwcWaUkzWjlhtK9fQ97jXAG8vpPalxEK
         k7HSfpdXBmwuhBllK6z4zLIaSurZgD6Lbyu1TggFJIQspplcK3rOgiQlYjWr2QC0Fcm8
         fJZykkGc9v+DJfNOE8RxbbUWBukTEW6b1hkFpVX7dYCxxZot5YYUKIB/nfiAzRWFH+5e
         KEnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiMNnZlPrNy750Vw+GSKoqhxUlb4D8dE9dlAJgNYMKlotyMBP/M8raswWBJ8H0Ed22oW07cuMbgtv82a9PRWMn@lists.infradead.org
X-Gm-Message-State: AOJu0Yxdi8WxJseiZ5eCg1LWHkHma2cWXULMY+uimGu/xtE7/7IC5IzQ
	wLY0WC8IpkFN3o93csEnFeGxWlYxtgc2qM8pRTliVJxq1PetZEfR0eQ6QUbZC6yluZbG5/CJw8G
	0Y/hGXVVD93BbQMXneNOrrirCNlqHj5+kWWRGRnXLYg==
X-Gm-Gg: ASbGncsM4vcv0/Oulvzeg/x+8NuzawWmHglNIgCp0oCcckrmbNnjSJsOaz1wYmyj/fa
	CqUDnzJLAOLznXulkUkX+oScrg55KgAo+Xy/yqK81yLYEJ6A3egdnPV1xLrPohoQOp+QPM9NW4A
	QAVgsPBmuV9Y1ASM8HEdacbV3LIhT4lIEElXAuvaRhOOi2c3EHMydhbwFGGdyJihk+rGwZRmP2K
	ow/iK0=
X-Google-Smtp-Source: AGHT+IHQpbI8EfP56lsdQ7upknLdRczUpIad68ohDd+RyXmgnTMqsII7yK6Kd5DP/t9BtkAowd9rcI8Mod9ChuDrSAE=
X-Received: by 2002:a2e:bc15:0:b0:32a:6b16:3a27 with SMTP id
 38308e7fff4ca-33549fcf105mr6386421fa.35.1755775768541; Thu, 21 Aug 2025
 04:29:28 -0700 (PDT)
MIME-Version: 1.0
References: <20250819143935.372084-1-rongqianfeng@vivo.com>
In-Reply-To: <20250819143935.372084-1-rongqianfeng@vivo.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:29:17 +0200
X-Gm-Features: Ac12FXyxvIa75EjP0r9nO3EJkEnBx3tdsuFNWsnV0Q0Q5_jZ7NS8Y38A1xB9ZIg
Message-ID: <CACRpkdZrDRH9figXST9G7QbJbwSJqg4E3eXmXQ-+2z=k2+jYjg@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: use kcalloc() instead of kzalloc()
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, 
	"maintainer:ARM/Microchip Sparx5 SoC support" <UNGLinuxDriver@microchip.com>, Michal Simek <michal.simek@amd.com>, 
	Bjorn Andersson <andersson@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	"moderated list:ARM/Microchip Sparx5 SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_042930_456419_C3984F0A 
X-CRM114-Status: GOOD (  10.13  )
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

On Tue, Aug 19, 2025 at 4:39=E2=80=AFPM Qianfeng Rong <rongqianfeng@vivo.co=
m> wrote:

> Replace devm_kzalloc() with devm_kcalloc() in drivers/pinctrl.  As noted
> in the kernel documentation [1], open-coded multiplication in allocator
> arguments is discouraged because it can lead to integer overflow.
>
> Use devm_kcalloc() to gain built-in overflow protection, making memory
> allocation safer when calculating allocation size compared to explicit
> multiplication.

All patches applied!

Yours,
Linus Walleij

