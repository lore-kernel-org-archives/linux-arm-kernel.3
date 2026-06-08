Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C69CD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 16:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U87KOvIaXEfWkmCPdpDSCM+l7v+E+UTZwehM8drO+VA=; b=iI9tBK7v4DBPUH0F4PJtW6AiRq
	gnazADLbIx3EelCIA5Sy2Lo0LzbUZYI6qRvSZzssLx8wfv0/0bu0HBhU2yWxn9fiUw4ZtwVRM4ofx
	RRg56S5PpiS1QCyu/fAkby++BI+RJvMVbfltGKONQb8ow4QZU8vm7mWDzGpLQcAdSFBbBSxlyKdA4
	M2/cyssCWaJa44ZM+DYpc9ZWHQicMGgKbCvfQ5YHz+ki/GqzU125zQihdwTfstYUJJBuPM1A2NVLi
	eoFNQLAcJ2dADUc8USlx0LWrasO0OwCdEoTeGLG77G9YCiljvypT4WVNWy/89MSZ2kNtVJ7ozcYm6
	pki0yOrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcdj-000000042jc-0ZJt;
	Mon, 08 Jun 2026 16:15:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWcdh-000000042jM-3hFk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 16:15:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 00EB3444FB
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 16:15:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB8D81F0089B
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 16:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780935348;
	bh=U87KOvIaXEfWkmCPdpDSCM+l7v+E+UTZwehM8drO+VA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=MuVHfKC22FODBS6u/A71jx9ELs6buKcJ3Yjtdf53DXsqi5nvblC765j6NVUFKm2qu
	 0Ri+S0hFnisr8L2DMFBoaTrJXfa8gFNN/ULKNeUFELPEUgxaArlJQBfWbBuyRlqVVn
	 gpn08G+2CRZibqN+/1vJlrx0hss5BQdUnvY4YET82UyNPHYjvDBiYNvX9+AZocWb7q
	 pk/Vn4Regm5HQilzqb6cXdMD7QOeenRhlc795utbsfn/Nnj4/1Uo3CGfqGPc/uwA8H
	 4BIl2i1LlY+kE6DswScuPZEsjoLe9rS9L0/Gk9BUO71w1UnrDf24DvK7rAde9/qd86
	 8a6gP9jA4+8Kg==
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-13810b63a1aso786380c88.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 09:15:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+8h8oQNiqEfSbv2AFCDgLWm+yhuMRDzuqJ78r+Tutyxeu6zllZSSzdlLp2ZSQ10O5yYi9g4Qwpp5FxPw+751oM@lists.infradead.org
X-Gm-Message-State: AOJu0YwqjtHhgbg/SzwlfDBYq9lipvgMXEGdDWlZ/hZoSGLAvayLfdXg
	9BMaqD9V2vhP5fch24nHQeS2IiLE/Nt/montbuvhiSoWCNjYgfDiyPBt5fdLlZkUXPTMGO0bPDK
	Ihmbvo3HvudA1PsCK7yh514XybM9FNc4KSgVkkYUwww==
X-Received: by 2002:a05:7022:3d04:b0:137:eda3:e5a9 with SMTP id
 a92af1059eb24-13806720e38mr8578839c88.28.1780935348033; Mon, 08 Jun 2026
 09:15:48 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 11:15:45 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 11:15:44 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-18-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-18-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 11:15:44 -0500
X-Gmail-Original-Message-ID: <CAMRc=MdG+Q+7p7r9t1qTAVBPEP4UWx98g6igSnrR9MBGx4+WbA@mail.gmail.com>
X-Gm-Features: AVVi8CeehSwizvVfI-4XqLm19u4Xy3rLoafM6ZSuZ51yo6ba5Mu-K9LrhjWFHnY
Message-ID: <CAMRc=MdG+Q+7p7r9t1qTAVBPEP4UWx98g6igSnrR9MBGx4+WbA@mail.gmail.com>
Subject: Re: [PATCH 17/18] pinctrl: airoha: prepare for en7523 adding
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

On Sun, 7 Jun 2026 02:16:53 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> en7523 a bit differs from an7581/an7583. It has different register
> offsets and slightly different bitfield masks.
>
> Let's adapt common header and existing drivers for the future addition
> of en7523.
>
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Looks good to me.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

