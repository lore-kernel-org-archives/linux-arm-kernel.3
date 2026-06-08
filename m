Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164C6CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5lGP3/ostS7IWs7FEHqpfbph9BewklK8a5lfeoNbOyc=; b=SJVlwmeZ4uSeRI+y6qRkixsd1Z
	xWjzAYWPnsEFtZPTGy86DI/tqA0xQaLDF3M8MUFecOsu8D6bBM+sSmzn7HS4DUKpYDNpOhIF6Y6bR
	fsX1S38r+iMQLuMm/xUAAnJTNQO3wW05Bkk81c3NN9KYVtFx3uYJmQNzv7tI6JqBchRj4f1BZyGMy
	Er5u3PnnkPO1/fwXVLwS0hohOV2gGQgQy2He+nNH660CLoxCzjEoASvkJTxqYerM0tMEhGkSJerfR
	0mk89+dq68b4ukze06Xf7zIaLxUCsQPZBRUWqh6k163ejOmZc/fN962cQtcGvhh2JnFVm6deaY+Wn
	e3Xm7R2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbHQ-00000003rIY-1Txo;
	Mon, 08 Jun 2026 14:48:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbHO-00000003rI9-2ArZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:48:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D6AD601F1
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 14:48:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53F201F0089F
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 14:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780930121;
	bh=5lGP3/ostS7IWs7FEHqpfbph9BewklK8a5lfeoNbOyc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=EaPjqcqfHbxSLtCeCTcHnFclG+rMMj+sQjJ+vEUOEnrrWoblCQhYycOj6m14GsywA
	 k4H0zNOKg/uqcg5qMY1P8Cdyjvq/5m+IZy3dtBpqNxCHPEexpdMzWK9y9ION4tHADm
	 BTVlAcGC61NYnskMTP0BXwAfwjc9swF5H3EqwLVTDHrhlj42rNgWAXkAaL+L+6F3tG
	 l4+M7jGpoVY7fdNwwvP24lBNCghFj0znsf5/EAF+E/geh59ElqG83Zk77N4jsIIS3d
	 L7gj3qo2vP7aUBZoukF/Ho/eI+/3+/FoXTSfh7uiQsQHXydQ03fOk8Hc5qhBRtq+Ps
	 kCwBdZI3QKCJg==
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-138129a622dso455136c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:48:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+kiwu8vvXtA015vvNjDmnv4lbFSq0xXzDqhFfXxCZMWhuA+YT5QPqj+dwlqff/yBdPzCChY2ypSv22SN2pZhEG@lists.infradead.org
X-Gm-Message-State: AOJu0YyOOz2IiGt/uvYa7CoDTkBymxdPiyOqDOb05wLxvYSBqF4YeDAm
	Jzrl3lF5MpYzvVId5M87HI9wQpxhLl3pjP+52hZSzCQalwPUPlTADG6FieTA7aJJqP28ScJza+d
	W227Ze+/HLnTn9TtnDddYHQYoE9a82FxnlZExAPc70Q==
X-Received: by 2002:a05:7022:ef18:b0:135:6914:87e1 with SMTP id
 a92af1059eb24-13806668735mr8054742c88.6.1780930120738; Mon, 08 Jun 2026
 07:48:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:48:37 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:48:37 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-2-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-2-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 07:48:37 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mdci2vfdE80TLraNy0DjNs69S9Th6Q5fhhgv4p-bfhMVA@mail.gmail.com>
X-Gm-Features: AVVi8CcuP8Dr1_dPLmL9CvfG28eBzYqrPwOmm1jHbG3ZnAxVnqAPm-cMGAviML8
Message-ID: <CAMRc=Mdci2vfdE80TLraNy0DjNs69S9Th6Q5fhhgv4p-bfhMVA@mail.gmail.com>
Subject: Re: [PATCH 01/18] pinctrl: airoha: an7581: add missed gpio32 pin group
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Markus Gothe <markus.gothe@genexis.eu>
Content-Type: text/plain; charset="UTF-8"
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

On Sun, 7 Jun 2026 02:16:37 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> gpio32 pin group is missed for an7581 SoC. This patch add it.
>
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

