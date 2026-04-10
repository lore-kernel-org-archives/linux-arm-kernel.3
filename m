Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 535E8E9904A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 07:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prNhPUxjlC9KTZLbbjkr41gU0WNMiDfRO5w2mPaA3+k=; b=HjENrJDYrzUaV2MB+otW7Wq4p0
	Xt9oQYzG/d4N1jr3XQMLnzfq6Y/ma50pEm16V8/VXD4GIRxjIaQ/csNa4tmtWsK69G6wnTqAL3XWv
	l8zPNFvQS0WN5YqtHn289Z0TSNyC+Q6naJQCah4xsydDRi3ISRzo3dsX8lX0epQhJP/XyMCJDX0Ne
	bFsQPOuBo2CKK0NWM5ZQ4P9Dcs52fI3WgphhwlXf6U+HAOSEQo5gs/FfeZZeecmgWkhi9CIeW2zOF
	pqZPhPP0WjCc7jrGLy/QYGeMnUYC+9bm3xWFRbVPyzKuf59Yefhmu+StH6XIxeJxzf+wq67nla83N
	5JuFyusg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6R4-0000000BkW8-4All;
	Fri, 10 Apr 2026 07:37:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB6R2-0000000BkUc-3jQG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 07:37:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7302143D8C
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 07:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56864C2BCB1
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 07:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775806668;
	bh=prNhPUxjlC9KTZLbbjkr41gU0WNMiDfRO5w2mPaA3+k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f0/Zms55ickfGRIdD6cuuOLeTsSWaROWdDBArUkbLFVWONI0jUcE0SCw2LWLhhJ8M
	 kgmEQw0WOvkJC39OXeX7qYeQctvGNeR5nzwCIx9eLUyL9JbgjsgRbJGQt30RVoHbCS
	 rmmG908ZLTWobBWk2UcfU5SZaKtPACW2S0LKmGjV423Qeko6Rn80gVadk44R5ItidX
	 NU8v/1yLCPinSQO90GlwS77i2Yj7vOdToguSnj9yWXLr41fxVr14x7hh8BuQzZWo+/
	 AUpS/cEcF4MzyGOKquBmTylaOrE+XKSldeLfLEPk0ZKKUhIX5aaBgh/ydgNlJIW7Hf
	 Z8KS8WstxWfwA==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-6505ef94043so1770079d50.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 00:37:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXdwlVlkdizEdsFJBs5xLPlBbRRQ1oV9vQWIs0yf5HpBD/1IfkpRhvFplIpZUIj0xIBrkbQFsLXJOW8lKyTsQwx@lists.infradead.org
X-Gm-Message-State: AOJu0YxH5HrueK6BJY4PpeqFnMHfb+Qywafbpl8XnkYfxspmQnxnG1xJ
	EVcb5W9Zqje99d+yFSqTKuuQWJZ61esyce4QRrSdm2YYg0W65w+0H+58ZD0kVvzLNMKRHa9V2df
	tUIL+HVLXaROm1z5h9MDl6Ix6OxxbMoo=
X-Received: by 2002:a53:bb84:0:b0:650:38d9:a0a7 with SMTP id
 956f58d0204a3-65198b9b922mr1436588d50.52.1775806667759; Fri, 10 Apr 2026
 00:37:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Apr 2026 09:37:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLmCrqa_eMCCPPnAKTDug0Bj1ZktrEckOfs-H6+FzqtZcg@mail.gmail.com>
X-Gm-Features: AQROBzBQm9AmJG_DbEyKwcRWAwaHWROrcg26pOOQhOFD9Ipr2DjT-YjcixGXSLk
Message-ID: <CAD++jLmCrqa_eMCCPPnAKTDug0Bj1ZktrEckOfs-H6+FzqtZcg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_direction()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Frank Wunderlich <linux@fw-web.de>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_003748_945548_32A9B995 
X-CRM114-Status: GOOD (  10.83  )
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

On Fri, Apr 10, 2026 at 9:09=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> If the gpio_chip::get_direction() callback is not implemented by the GPIO
> controller driver, GPIOLIB emits a warning.
>
> Implement get_direction() for the GPIO part of pinctrl-moore.
>
> Fixes: 471e998c0e31 ("gpiolib: remove redundant callback check")
> Fixes: e623c4303ed1 ("gpiolib: sanitize the return value of gpio_chip::ge=
t_direction()")
> Reported-by: Frank Wunderlich <linux@fw-web.de>
> Closes: https://lore.kernel.org/all/20260409132724.126258-1-linux@fw-web.=
de/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

LGTM, but it would have to go into v7.1-rc1 right now due to timing,
then from there to stable.

Yours,
Linus Walleij

