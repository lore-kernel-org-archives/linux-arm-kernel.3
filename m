Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F39FCD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 09:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbX/u0YvILlswAD20c2Nb16wHxkRKuf6rWkIOztP9mg=; b=LD15WK4TUxg21F9O3E0U9aS3b6
	EZvjf1FZoI+aKWLe5of2rFU9fihdE4lun7EGqUS8DKJNmdE8wfyS3wYisAzWqLuC06/HrviFw6jqd
	dW7sIfxPmIHg20fsHZRWo6iWEUmHPYYlCbhC988CX5+H/pOQJUbKEsBYMoHSr24MvwjQCXkQ785os
	vdqzmRB6WDrlAa4wY/8nercCzei6ert5KfOLXZj9ZsSe/aPcj/S62cwl3L5aTQxnkZdwHvpJEBoVF
	QQHht0wCa0sRRBk2vN4UP8BMKEj/TDgwgx+Lrh5fOoZH2Vnb+OQdByyljApo8jsZ9KdldGFMCIwAU
	3vArUo/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQiD2-0000000Cykz-2lve;
	Sat, 23 May 2026 08:59:53 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQiD1-0000000Cyks-0xvo
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 08:59:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A36E6020C
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 08:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10D381F00A3C
	for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 08:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779526790;
	bh=qbX/u0YvILlswAD20c2Nb16wHxkRKuf6rWkIOztP9mg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Sh97Pd4rC9Iw7hEt+aYcJxtxh3NCQBnvhR2MNf3CpOy+/pYI4LijnchZCBTUaGlEA
	 t10izqgfqkncdc+rUWlHo8gaM98FryM/Uh3CgCpeR4+RymfjXRr3xlJzdndLG4cpCH
	 3KECiAVgoq/PQcUmBMo0tYpoGq3wGSfjplf27AkrJ5kEXgcbBAOjt7uvI0+vvKUPbo
	 XBuBbtc0Y4R1kv6BJ5eEnaq1qAcRxIDk5hGEUQrq4L+TfcIut9oxX/GbEn8s3hWVr9
	 mIzyPN7yNmOXU8ZCGKiyWc5Lmn5/bkd30L4KBk2YgcffzgbiPAZuCfaxHNmaYRNd0U
	 iDiiXyja5GkkQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5a8d1f43432so13298897e87.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 01:59:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+65GEtmlk1b8bcnkBB0eDZq0dM1jyVXeoplBJN15QEzFUmW1a1fMrmE5CfwHBFqh9sKZJP0ACLsqAX9Pstn3Bc@lists.infradead.org
X-Gm-Message-State: AOJu0YxZJ9+G7BoWzJ3C88yuh/6PktzcW+xC6nbWGj9Z/yMhqPVMp6ot
	xA7X6u5RQ5Ahv8bddCffwvs2/SGM2FkHlv/GgUc7GLOMyxCPhQnLAmg6Wma+wsBj+rXhozxQG5b
	ZFd+UQkUdK9whS++tVt2UdgwJS1/9LRI=
X-Received: by 2002:a05:6512:10c5:b0:5a8:9756:f6b8 with SMTP id
 2adb3069b0e04-5aa323cd97emr2082906e87.35.1779526788895; Sat, 23 May 2026
 01:59:48 -0700 (PDT)
MIME-Version: 1.0
References: <20260512060917.2096456-1-shubhrajyoti.datta@amd.com> <20260512060917.2096456-4-shubhrajyoti.datta@amd.com>
In-Reply-To: <20260512060917.2096456-4-shubhrajyoti.datta@amd.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 23 May 2026 10:59:36 +0200
X-Gmail-Original-Message-ID: <CAD++jL=iCJpKirfc0GqUuKjrLjeEyWMvcmDx26+hTFtcYz0uPw@mail.gmail.com>
X-Gm-Features: AVHnY4JF7lnezv7m1tQlOKAjlmVpjnjJD07jbsl29OKRAreK5EuKH4xjhiad3wk
Message-ID: <CAD++jL=iCJpKirfc0GqUuKjrLjeEyWMvcmDx26+hTFtcYz0uPw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] gpio: zynq: Add eio gpio support
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-kernel@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Tue, May 12, 2026 at 8:09=E2=80=AFAM Shubhrajyoti Datta
<shubhrajyoti.datta@amd.com> wrote:

> Add support for the EIO GPIO controller found on
> xa2ve3288 silicon.
>
> The EIO GPIO block provides access to multiplexed I/O pins exposed
> through the EIO interface. Only bank 0 and bank 1 are connected to
> external MIO pins, with 26 GPIOs per bank (52 GPIOs total). This
> change extends the Zynq GPIO driver to support the EIO GPIO
> variant.
>
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

