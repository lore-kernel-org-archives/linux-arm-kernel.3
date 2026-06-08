Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75763CD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MOa88SxjOKsDcxBM1x1qf03zZlmO3uexj6iAoLQ40Ak=; b=E9gElcabxj28Lg1QLlQOLNyOEB
	KVK/01FKBkd/KTL5Z/zN7dgf9T32ICAHHctKd30pemEzcYSfk6t9eiHT7i3O3XBlDlOwB4A/JvASP
	B5ruAtu9N8V0D1UU/KeFDCmzcGEx6gCc/9HLerc0q65NGAO0lPINGlUaoIvruFLeAu5ObUPlrjCs6
	v6kOmV/tjlZnrBOk/1WxPbAmumly0FAWZ5Ta411lPsn7L4yK43dB0dSbFC/ANZdXuHJFM4XsVRMYR
	nXus6vTVZVTJf7frH8OxUU6MZa44NCNeQlkHRUCYh5xjVaPMLonJ5o/+aLz0whDLDV+G57xtMNheB
	3V+WLuOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbHh-00000003rMf-293N;
	Mon, 08 Jun 2026 14:49:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbHg-00000003rM3-00D4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:49:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4EABD408C2
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 14:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2754E1F008A2
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780930139;
	bh=MOa88SxjOKsDcxBM1x1qf03zZlmO3uexj6iAoLQ40Ak=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Cho9weIglofwCTFPqholTctD0YJ5WjWSAIjPHolLggvT8hW8NCwrShNfE8xntZd5X
	 xzhAY2Cv5KAJZSCpTetious5RYbaNa1zVzQYzLULsauY6PwDTNLvic3ngCYMe+UZHk
	 IJvOQ3uqzOzRFbb3hMQ0dFXBABq77VqYnW3GYsRibopj0O8iE+650WQCN8y0QxHMfG
	 sesAYViO3O3+j61OW0lbYvAUABpOuKpARGpMh6lUqhrCN+cG68A9WWlFUXxjMuwhHQ
	 1ZCGDfrRvrY/XJScpL9XTHthV9jomkLcldJAX5zKKvSMbZsKVs6QwspXvAV7eLqq69
	 bPqIrqVGzsdKQ==
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-137ec563a95so5268885c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:48:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+9ZYupHPOOyBHmhmfQnFWEZhhYmGFJjiZfMU1D3+X1XYyf1T6HRi2wdkEn0h2yRoiLj7Y4ZJx+Y1R/OMUPZvYq@lists.infradead.org
X-Gm-Message-State: AOJu0YzFnhUe7pWlJjrvkzi2Q3doU6mQpSD8orDR/iqGNQ2qudU8QteP
	e+uBpIgbZ0XaXQJU/3eZFPIW9nvhb1/dKQ+xqlEt96FlJjVPiCqMg2MZWRJCZLcQ1S3ua+evXmZ
	yyKq9oAPKaoPK6pZt0ZEO0VvH5497tPx4Pjnvn9OPaw==
X-Received: by 2002:a05:7022:60a0:b0:137:90d5:9530 with SMTP id
 a92af1059eb24-138067241e4mr7386691c88.36.1780930138605; Mon, 08 Jun 2026
 07:48:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:48:53 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 07:48:53 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-3-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-3-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 07:48:53 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfZp=X9SgEQ7zVtFVBy+akzmX7G-8d+HbjP6uiJjo2VTw@mail.gmail.com>
X-Gm-Features: AVVi8CcgfBZvM7zQoT-kfXLyQwfvhcRHrvvZ5dE9sWyMbehP1eCvnbJHHVQktnI
Message-ID: <CAMRc=MfZp=X9SgEQ7zVtFVBy+akzmX7G-8d+HbjP6uiJjo2VTw@mail.gmail.com>
Subject: Re: [PATCH 02/18] pinctrl: airoha: an7583: add missed gpio32 pin group
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

On Sun, 7 Jun 2026 02:16:38 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> gpio32 pin group is missed for an7583 SoC. This patch add it.
>
> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

