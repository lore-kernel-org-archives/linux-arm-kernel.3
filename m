Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698D1FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TvOzo8RjsLIaVVajzywOgjFrzZwCgL5apopPTnfRjy0=; b=ErEBa0EPQomiKPnmsMj4N6OWfr
	sAskMLmbXCw8jXE0xKgIzu1S2w45Okt/1ZSt23Uu2NX65KO9lHuOWF5+BrC6rGaSW3mxdxKIQRVj0
	eWWyscQRVbzZj7zIziTKAYBDcU+Vzy8fT+UOYPVwJC94DLRP1DIbyf08li+5bKjXr+mzFUtVmj+Yr
	uWy2YdJ+mT/6Ye49N98PUshwt+orjaMd6bsKPWFFBemkFeMzyAJGUlzyWiy7wqvwQ8PUSGXK0Ze0m
	aPn31ACYwhlHDoP0+nzpJUlgRyf+CKreQKEfleS3vIVOdOJ9SBJMqPjYm6FJatsU1c6ihllP0FiV6
	i+8uowZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeT7-000000012no-1aQO;
	Tue, 28 Apr 2026 09:11:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeSz-000000012jA-436m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:11:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BCEDC429E5
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 09:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B4CC2BCB8
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 09:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777367452;
	bh=TvOzo8RjsLIaVVajzywOgjFrzZwCgL5apopPTnfRjy0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YN0cVSjBhpqxw6QKrKuxWUGd11SDdOBA7ABeXT/kOAoepwMDJDSxLRF5wJQo5lmAP
	 PSuUNffzGyUujMFAi+ZvFWFsQSoZcLjM7nxpc0Up75sWfxrRjGBebrtFdIxP6OGCDo
	 pkpUQuOt67WzOzVgBAt+S/e+k8LPQh7RI7z4l3usttSPrYRukOqTNkcoWGJIWwWMAq
	 tHin3fxcpQQsW0FTtXaqUyDnD9Rhmwo6JG0oA5MlDDZCKjaIL2158mr5VKncs++iS9
	 Xn+8aXW/EkwWjC7/iUFZ1fVl0woDNBSBjUgLj7NRrdY1nnQFuSYkMr4X8piUWhPF8w
	 5MXRvYG/B0hGQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a1307438ddso10027845e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 02:10:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9NekWcJqKlFzOovs7uxuH9Jsk926K4fo7mhMD1Sr3vjNlEdnC1SQH1DnZZTyFcNfLYJsPG2z7a/xDpcX8+4Emf@lists.infradead.org
X-Gm-Message-State: AOJu0YwazGcfFNeRs3Yh608tgXhSLC4VZ1jgYqERmx7seFoHfC8lTXE8
	Z5af3vWRUrhEG5/vI8hwqC+sWB1ZL1r2GgnrQSDhvVQAAUbkpX3OGW8wyMHW7Ltla7Xpb/lNkfD
	L5httfU0dZI9FBKSW9Ujiq3xVq/WK0BQ=
X-Received: by 2002:a05:6512:3f28:b0:5a4:505:f633 with SMTP id
 2adb3069b0e04-5a74662df1emr1039066e87.38.1777367450963; Tue, 28 Apr 2026
 02:10:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
In-Reply-To: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:10:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLmeH6Hy1tm-uTV7YP9gHc7vk+-vaYNT5cqZPU75Jyt-=w@mail.gmail.com>
X-Gm-Features: AVHnY4Lt1Nb-eIUW4vHkvKpaNVPQodgCRHtRa3BH6rlTVPd0JsgyLmESZ18n1Jo
Message-ID: <CAD++jLmeH6Hy1tm-uTV7YP9gHc7vk+-vaYNT5cqZPU75Jyt-=w@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: More compile testing
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, 
	openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	Joel Stanley <joel@jms.id.au>, linux-realtek-soc@lists.infradead.org, 
	James Tai <james.tai@realtek.com>, Yu-Chun Lin <eleanor.lin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_021054_043573_E5150476 
X-CRM114-Status: GOOD (  10.12  )
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

On Fri, Apr 10, 2026 at 3:05=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> Follows https://lore.kernel.org/r/20260410103005.163128-2-krzysztof.kozlo=
wski@oss.qualcomm.com/
> but should not depend on it anyhow.
>
> More compile testing means better bot coverage. Plus having ||
> COMPILE_TEST and obj-CONFIG_ARCH_FOO is kind of pointless.

Patches applied, early in the kernel cycle so the more build errors
we get from these the better, we have time to harden the patches.

Yours,
Linus Walleij

