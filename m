Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 717F7CD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 14:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4C7eQEqBOO791XCceqw8Z0xQegoGOJJDuZXVi6UvHbM=; b=MvNCQaJzOSTdMNycx/SZvzHuxO
	7Mk26Ac7Ub0/U3GJYou0463mxVjb1R21YUlMHYyIwNTWwrsySgpwsTPrV+6FzPOlDrMwOvrMdd3yJ
	pi74BN+QWA8+ccVhTke1Gcs4MI+s6je1bwkrRlKTMrQASDFouABQ9lHR+0xFreCfSdG1tCE5q7i+B
	AQiseR3S991rgHQiUQCsKyojMCnitpZYJ97M/KXARWQvkwwG9qlleIw7mzTnxPyjHGnLI+SPhE9VT
	1Yic/9byH7feSzEn+kpLgNqNLAqQ4lMYTQRHiytWr+iHapDWW+pR1R+XJ3ikber06gbENzwnUcyfh
	eJWXcyvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbJ3-00000003riA-0eZ2;
	Mon, 08 Jun 2026 14:50:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbIz-00000003rhP-3JKB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 14:50:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EF8743635
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 14:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62AA91F0089B
	for <linux-arm-kernel@lists.infradead.org>; Mon,  8 Jun 2026 14:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780930221;
	bh=4C7eQEqBOO791XCceqw8Z0xQegoGOJJDuZXVi6UvHbM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Apv/a6CzrFxEHOE/yiae0WfnO7IfzkWtlYLu1TKe8iraFSwDFFLItddhAfC5E0vj0
	 rzo93rpq7as5A+YzSqdocWiCY/zJDmVIvID5uh7xKn+sk0HfFCpxjSTWo9xoRx4c9x
	 EHe6nqSyaiazcOFYQsroQabuw7lT5D+gE34xI/qoSj2qou39mLLdr3AOYWrY1w+iGk
	 XwYNbX/FsZYcPbo+J5RGRaeKtbcL7BOa6lxJI+68Bxt/K2/c+cPAreI0/mbMjB0DHm
	 RYiwJmMnr8kMDqt7NuFqMB2RRhpxhBunTj9u9mdALQl+/HJ7sbQkkXCRGJgq9LHqbl
	 d1rPQHAhgdQkQ==
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-13807d2f898so3160260c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 07:50:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+f0nusjGqRJ8vWYW0mlWRChN2VtNfPp13f7LYI9BqZ06U5Dz37xNWEKLJRAN3SCmTaKKlL6IsUrGELTHkcXa0s@lists.infradead.org
X-Gm-Message-State: AOJu0Yzeh4fiI5zGsIpzMdoJtPcJH7KC39HmkefrBbmq4fDibZw5JfpZ
	WInkOZ9ttOxn2ufyjBcHbb2k/WVo7OxnmetGMw/9mGV64Jgfz/283BUZmj22xcBPM8rlLsAH957
	te9g6gRu7n2ZgQstkR1EKgUYcw9/KoagZmV05mQUwuA==
X-Received: by 2002:a05:7022:6882:b0:138:62a:ddac with SMTP id
 a92af1059eb24-1380671fc24mr7463853c88.20.1780930220886; Mon, 08 Jun 2026
 07:50:20 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:50:17 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:50:17 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-5-mikhail.kshevetskiy@iopsys.eu>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-5-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 09:50:17 -0500
X-Gmail-Original-Message-ID: <CAMRc=McXWg5sitpO-Z7KUbQOAcmnyyisOpYhXq7GuLRVZH6rFw@mail.gmail.com>
X-Gm-Features: AVVi8CdYOVZheZlncuRFK8_OMQQp0mb0en76LtMMGY55th0ffQ5nIRalk61TbDk
Message-ID: <CAMRc=McXWg5sitpO-Z7KUbQOAcmnyyisOpYhXq7GuLRVZH6rFw@mail.gmail.com>
Subject: Re: [PATCH 04/18] pinctrl: airoha: an7583: fix misprint in gpio19 pinconf
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

On Sun, 7 Jun 2026 02:16:40 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> Pin 21 (gpio19) duplicate pinconf settings of pin 20. Fix it using
> a proper bit number in the configuration register.
>
> Fixes: 3ffeb17a9a27 ("pinctrl: airoha: add support for Airoha AN7583 PINs")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

