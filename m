Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6577F46101
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 13:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eUs/WH+iF/Mc5fiyurmAjkDuoXeS0bDsbt+XqX2OPxw=; b=ZtgC7cB1iws0cVl2CY9y0kmrOd
	c699whpP6qmKPOBn5YNdtqaWeMl6MnwJnXtJhNXClh7k3F9YPmoMrmEHU2r87W4Q51/2T2ddIME78
	RgUydNx4B5NtXLv+ZeTVHEZcu+/O3HQxE5eHrYc2j1lc08OD6CLBys296FoNJleApttz4Hza33T5m
	2RZ9ypvgMzmpF1aJ9JEOPpE7X3mvS3TeoiaWUlkWZYurimSPsXmzpj0JefOv8coB0GmXEm+tHav4D
	qSAtFx45xJJp6gM8I8kEqnpLX6dKwhXMcQKriKpFcLqOHB58LyhhYAgKsS0jlHIdcIb7XnrX8JwVT
	7An+7VRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fLs-0000000GpQa-1L05;
	Mon, 23 Mar 2026 13:29:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4fLq-0000000GpPm-0PZH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 13:29:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 86FAF4189A
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 13:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67CB9C2BCB3
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 13:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774272589;
	bh=4ALTHeR/nNtas+TDhmepd92xZJjPlPAcg1f9T5Oy/uk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=BbLaED3CAjWVtLICPIXk7HRfAOzZMYev+4Fa67GGJwgDZUSnf2h7plQi2hxda3A7T
	 EokkWtXxAJXS9FqEd2y7KVt42JoG9xy5lhq7vJovoRSluYicA6Rub2MW2u4izAbdFO
	 MQEN3WySzN4LsB7x1pPikZXom4Ye2MBnM+y8ocsZpMmU9w9YxMx+nc1vS+EffMyL4+
	 32Rkmi4s/6Rlcm44DpRmNcb27ie4AfKcgCNfBtwU25uK6scWTuhl+s0kvEVId0yDvc
	 jpd0VUCbanej6ji5XvOQtqmxzTCgdAvv3LoAFJz1glK8UyVAPjXttCJASIdfu9WtLi
	 rfbZz5LTnKhsg==
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64e8c7f5082so3707865d50.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 06:29:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWW0KEukEgWXxsg2ZEjbqI3RoXz6sq3wDCYlV4qVbaVyeLJkK5g5pXPtPGyOZclZ/LWoOyiWkt5wHRydZaMH7h9@lists.infradead.org
X-Gm-Message-State: AOJu0YwFJiHZxQiB4jbL9OcCMF/xJ3dU+vf740CcP1fObf/EpoYFfwtG
	o/H1utuvheu3I7345gcLZ5SLoMwhPY3ln6zqTsxXS0aZJ21kK6VeXSdun1AYWvQSBfcYPoEHfvy
	g9xE62cZDZRdYNobh7blkYqi/8Zer++U=
X-Received: by 2002:a53:b465:0:b0:64c:cfc8:6baf with SMTP id
 956f58d0204a3-64eaa6a1fe0mr8465672d50.4.1774272588715; Mon, 23 Mar 2026
 06:29:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260321105940.8143-1-kexinsun@smail.nju.edu.cn>
In-Reply-To: <20260321105940.8143-1-kexinsun@smail.nju.edu.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Mar 2026 14:29:37 +0100
X-Gmail-Original-Message-ID: <CAD++jLn9MTbJjLh27U37w_Jj_GEZkaEztdPTk8T0y8ZQxqJ+aw@mail.gmail.com>
X-Gm-Features: AQROBzA1Eb81EhPJamujnyXMjjtWiy-G55hD9WEFMzQ9Pozas-rkYtdPkHd9Eag
Message-ID: <CAD++jLn9MTbJjLh27U37w_Jj_GEZkaEztdPTk8T0y8ZQxqJ+aw@mail.gmail.com>
Subject: Re: [PATCH] spi: pl022: update outdated references to pump_transfers()
To: Kexin Sun <kexinsun@smail.nju.edu.cn>
Cc: broonie@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	julia.lawall@inria.fr, xutong.ma@inria.fr, yunbolyu@smu.edu.sg, 
	ratnadiraw@smu.edu.sg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_062950_155732_09A974B5 
X-CRM114-Status: GOOD (  11.90  )
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

On Sat, Mar 21, 2026 at 12:00=E2=80=AFPM Kexin Sun <kexinsun@smail.nju.edu.=
cn> wrote:

> The pump_transfers tasklet was removed when the driver
> switched to the SPI core message processing loop in commit
> 9b2ef250b31d ("spi: spl022: switch to use default
> spi_transfer_one_message()").  The kdoc of
> pl022_interrupt_handler() still describes the old flow: scheduling
> the pump_transfers tasklet, calling giveback(), and flagging
> STATE_ERROR =E2=80=94 none of which exist in the current code.  Rewrite
> the kdoc to reflect the current paths, which flag errors via
> SPI_TRANS_FAIL_IO and call spi_finalize_current_transfer()
> directly.
>
> Assisted-by: unnamed:deepseek-v3.2 coccinelle
> Signed-off-by: Kexin Sun <kexinsun@smail.nju.edu.cn>

Impressive use of AI and impeccably correctly tagged,
this is exactly how I want AI-assisted submissions to look.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

