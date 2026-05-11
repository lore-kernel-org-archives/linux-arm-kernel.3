Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4827CD37BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 20:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0T1y41gsuJUzACGoRDlevBaHaCBq9uhq73rg/Jmuv0=; b=fdT2fuhqnakLj61h8zc6jfGrcM
	KfjdoDuo9oOZyb8PQFOA+ZciYxqwnDDQUQJ1fDm0c8E8cQKmkGQnod6YN8xpiRqH7+URayCivqepk
	YrUSMcPN0WXePLtgfLh3IJCfMTIO2S+Wc8FoLypMJOPdPNpdBgTiB4UTBanHz9VNRzG48uU6FsQ/c
	DpnhsmDOy+mEqgzVj5h9NskpEKWZeuZCz2viJT9Jmy0kAtHcAN+mrkokwxItnYB+5Ka3izHSsaM+i
	PuL92Gn89HqLjahn3/veOaKb7oBRYzjIeot9burIK/gEGGPjiTT+d8sdtqsD64ffZq6A1NeL/4A62
	+YgdjRNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXCx-0000000EhxU-0PUM;
	Mon, 11 May 2026 20:26:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMXCu-0000000Ehwe-3JY1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 20:26:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 279D142B21
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A92BC2BCFC
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778531188;
	bh=p0T1y41gsuJUzACGoRDlevBaHaCBq9uhq73rg/Jmuv0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LldN6Z98cIgedoQ1TaLfLMP/zwRW1yu3s8fnf+NqB5fpUaJErnQj/LdGUHUIbsrw7
	 fQJSFVSA3VbmVbWbuzpebSy3C2ayRDTjSSVskDWEdZcE5oZNLVgN3hKYpMpiwAndkm
	 njYHMEK3UlEaazRrFCPyKJGvCOsbaMUNRoAX2hc8n3Pud/3BuKD40vr4gzZqcZMnp9
	 nXDo8nlYrOMj8wD5YeGWzIox+ALVpNi8mr6c50USXyVzOVrO98I7GC9UraE9JcZaSp
	 DGGVXsYe8iMsscqoWnr798QNy375S5qz2GKMaz5KybayrdoWwTHEcEQMtNv3JA6cyA
	 JEnFk+dVB0gig==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a8d1f43432so1879628e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 13:26:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8P1Sa6F8qcKIs3vk5egDqtyN60IHCjY/Fe6i7L2z3E2FBpg6CeNMBjTBYF7yEImpA3IzwiYkYm9dItL68SJ7nH@lists.infradead.org
X-Gm-Message-State: AOJu0YxBJeKtO4h96jM12FZYTeBTdXuR+FiRXMeL3Ie9/D4+qIeUr3zj
	lhqb5iA0748/oLKRpmtw5JffFyo1Dh32kfKiS446Ith0N8pxZ3664wf7oeqb+Pmap+nEmLlYVE9
	6ucObkvG1pI2t5I/TQ6vd7Rvg9k+xLQg=
X-Received: by 2002:a05:6512:3c9f:b0:5a7:46e6:74c4 with SMTP id
 2adb3069b0e04-5a887adfc92mr8322271e87.9.1778531186735; Mon, 11 May 2026
 13:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260507-a9-pinctrl-v2-0-49774feff2ef@amlogic.com>
In-Reply-To: <20260507-a9-pinctrl-v2-0-49774feff2ef@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:26:13 +0200
X-Gmail-Original-Message-ID: <CAD++jLmGr_UOja2yHjCHv7xRcGqit_TxKk7A5YzSoviicJrJUA@mail.gmail.com>
X-Gm-Features: AVHnY4LSYvXrv4DsxJcvRd4oAMpQx2wvvbKBiUjGdIh3JcrN5btqHfX-VZZ23tw
Message-ID: <CAD++jLmGr_UOja2yHjCHv7xRcGqit_TxKk7A5YzSoviicJrJUA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: add support amlogic a9
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_132628_846129_2A19A7C1 
X-CRM114-Status: UNSURE (   8.48  )
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

On Thu, May 7, 2026 at 10:21=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> Add pinctrl bindings and driver about for amlogic a9.
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>

Patches applied!

Yours,
Linus Walleij

