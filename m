Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530C8E8FDA7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 18:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wczO/orN1VlH2Seh0WXoVnsHaqWTfM0O2/W++PndTpA=; b=J61vvy1KmYULTWsEiHOcBqecNm
	N01xgvsJppGviNN0bHpz+9CFbq41Vp2hK3jsCwfy60yXNzLqOA+8K0Jf53/N6vRclCSm0IahDnPxf
	Me66STzA+jn2n13iQDdsVjxNFffH69COIgG+mS2U1WFkmBvy9aGpqQsOusYp61pP++icaObY66m1m
	Z+ODkU2T2CXlJNgSu2NNTRgq4iL0JujzP9JULAuWw/0T0Ax0H5olEyF7+Ha/kPcqWhlDjD3YNzalE
	UcEz7AzwGf5dAlAA6ltM4IeC6uvkuijbba2D0mvQiUcbcAa9AJhVpK9Rlr9tNO2EPLBpU2w/+MMIl
	6e0zMhcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZCLG-00000001Mlc-0rU8;
	Fri, 26 Dec 2025 18:15:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZCLE-00000001MlG-2f6F
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 18:15:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 672B160018
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 18:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8B3C16AAE
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 18:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766772907;
	bh=NX6RIM5/8L8qFW+YvFD3wCwe9QDXgdbVg5kkPCGn5CA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=N0s+bXAGNxzxRKjv6pFkLvYrSjV9ypoHkicrHxazdV+q4sKLpR9pHK13MxfltzC50
	 +/pcZql6nTDxImg/U1Yu2IQcrmy61tCJa8jPe/bLRYL/F3+VEqRdQvfqo9R1kmHH5Q
	 KmXW3bBOzNl3CXeugufCjTWx9k3N4JEAFtBqVMVHHor6a7Tsysvu09ck/O357aR/I+
	 o6WTA+A6LDtpYnui6+YYVIT62Nzw2pEj2Iy+ERdWyzut66C1K6wIOz/q45SaVzF4Lz
	 3FgmSkDDKVGRRdkdCQvOJo28xiKki/8aA5cQBK7jfnHOZBHMBB5ZWDuCHnC1Of8DgO
	 OMnNfs/XHJ1Zw==
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-64467071f9fso5680228d50.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 10:15:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWgjkFEoR9xiRC5c/TAqVi2mHEbzTO2FCboMnhKP4CpvNy93SAzKj3Z9LLD67UQtLYNPyRZlybiXFKAdakqtynA@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2ejUH4qtpo8dw5PGq3dbN17mG8VCYorUmE4KI7yLvAdrqEOj8
	G4ckvs0NJ8bB2AmEwAeLIMPuxJlMXI7B9shtVSX7HMER2rjwIWEMlh9+aYrXPYDa55g7oMDsFHa
	HNsRYmW4OULGFGGDRZRqRFteY+oizqCM=
X-Google-Smtp-Source: AGHT+IFL/eFQTSATZ2Bf61DWomlLriB5LN0ipSM+U2txIu61j0knFv4Qg7uMaWLBJDkrxYOknRLWJaCqm2IE7jOc1mY=
X-Received: by 2002:a05:690e:dc4:b0:644:60d9:7531 with SMTP id
 956f58d0204a3-6466a8dec8emr16296223d50.87.1766772906452; Fri, 26 Dec 2025
 10:15:06 -0800 (PST)
MIME-Version: 1.0
References: <20251209100217.167581-1-buaajxlj@163.com>
In-Reply-To: <20251209100217.167581-1-buaajxlj@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 26 Dec 2025 19:14:55 +0100
X-Gmail-Original-Message-ID: <CAD++jLmHWkmOm9nNbchNNoWG=TYPs3nZmB-fUEwb6fuspiTd7A@mail.gmail.com>
X-Gm-Features: AQt7F2rA_AcCIAiUWMktXnkp-AqA6ONVXV1t7NBRvWnGYZATyRI-vw1nTZCoxHY
Message-ID: <CAD++jLmHWkmOm9nNbchNNoWG=TYPs3nZmB-fUEwb6fuspiTd7A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: make devm allocations safer and
 clearer in mtk_eint_do_init()
To: Liang Jie <buaajxlj@163.com>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"moderated list:PIN CONTROLLER - MEDIATEK" <linux-mediatek@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, liangjie@lixiang.com, 
	fanggeng <fanggeng@lixiang.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Tue, Dec 9, 2025 at 11:03=E2=80=AFAM Liang Jie <buaajxlj@163.com> wrote:

> From: Liang Jie <liangjie@lixiang.com>
>
> mtk_eint_do_init() allocates several pointer arrays which are then
> populated in a per-instance loop and freed on error. The arrays are
> currently allocated with devm_kmalloc(), so their entries are left
> uninitialised until the per-instance allocations succeed.
>
> On a failure in the middle of the loop, the error path iterates over
> the full nbase range and calls devm_kfree() on each element. For
> indices which were never initialised, the corresponding array entries
> contain stack garbage. If any of those happen to be non-zero,
> devm_kfree() will pass them to devres_destroy(), which will WARN
> because there is no matching devm_kmalloc() resource for such bogus
> pointers.
>
> Improve the robustness and readability by:
>
>   - Using devm_kcalloc() for the pointer arrays so that all entries
>     start as NULL, ensuring that only genuinely initialised elements
>     may be freed and preventing spurious WARN_ON()s in the error path.
>   - Switching the allocations to sizeof(*ptr) / sizeof(**ptr) forms,
>     avoiding hard-coded element types and making the code more resilient
>     to future type changes.
>   - Dropping the redundant NULL checks before devm_kfree(), as
>     devm_kfree() safely handles NULL pointers.
>
> The functional behaviour in the successful initialisation path remains
> unchanged, while the error handling becomes simpler and less
> error-prone.
>
> Reviewed-by: fanggeng <fanggeng@lixiang.com>
> Signed-off-by: Liang Jie <liangjie@lixiang.com>

This looks reasonable to me, so patch applied.

Yours,
Linus Walleij

