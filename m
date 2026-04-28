Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93362FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 09:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uGpC8OFfJjEvHGP90N4kTx5472dBbjEkP4ZjjoHaizA=; b=CJw9ka5oCZ3D75yovEf6BD9EKY
	TOw8Rw/1R4sYQAaDjjr6Cu6B9/aNFZYIkYVtV5tckCKMfFIj9cNTWuoI0OCdrsItIHBJAjHDpcnMx
	mROpeDpuYmdXBj5XF+mfkhqudeyWtjXDP3HkLlAQYQFgu9Tp0kDmQbggaCERvvPCxgPC+peRc5VuP
	EG+U1Bd2OIIqViKGQKTMAd/jEDWjnqN9jkvLhP9xBZEB8K/kpEYL/LmM0Bjjfa8qx/tvZL5Zk/5Dz
	7F7zQs/c1qHn+2rQfG59aSqUDwtI7g5Aq2PoDqopIp66bjYdzvHUvd8B+rLRq8BWCXsjNpGUuZ/WR
	8LwE86GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeUS-00000001332-1IHd;
	Tue, 28 Apr 2026 09:12:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHeUQ-0000000132B-2Co5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 09:12:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C82C44971
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 09:12:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE0E5C2BCAF
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 09:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777367533;
	bh=+vV1cq1FE3OBlSf+VVLa+jyUyRoJrEi+/2DabEYx9HY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=IRmGXFgSvCF3Yu7x4FvWQDcCfcF7Uwqf/IZmGl82fj2/WeDWxn/pgObJKt4DQMzpU
	 QKLOgAxg/wzYxmTWB5XpS5M4H6igwy0ANhBCnNK4qLQ6OY8lkfwQJ8JxHbnrBxeO6U
	 FhdgQs0Xf5cx9Hlwuzw0fMk8buKjpCL16Kkl3D7UIDZiLjMhpiTe1v7+WL4PxIRBaO
	 6RtJ9t1uUjUH0p8HzcPbX2Kr0KZEXjew3tzqcbGHR7UwG1KUzwDdS0hf31uPu53ccm
	 z1pgh2L+o1a/9G3lmV2sDmbXiwtSUkfU8Ofen7fKzYF/3/CSrS9AOGtfVQ9cYAdxKu
	 2KsFSmz+NLn8Q==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38dd575bca3so107587861fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 02:12:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+2Iue1W1ore9XiD5qBqZ4zDO2jWSOdzqzXmEOntWvoblMnicdSNN4gciL2H4N1+aIc/7G4uUl53EJZsV+qSMaL@lists.infradead.org
X-Gm-Message-State: AOJu0Yy69+WV0bi64/tkQW+VUItul6QXXvKrTQZzIskq2IwKNS3HN9lj
	iTvxq7ScxHcMzCadVgyhkvmxrOjIF6B4IvnMwoH71kUrkFoqWlFDjWTktrZY6g77Y3KcuEvbLUa
	q1GcEA9Tlb+QkXc+A3CepDD7A90x0wL8=
X-Received: by 2002:a05:651c:f07:b0:38e:8357:c5ae with SMTP id
 38308e7fff4ca-39243147e32mr5888901fa.9.1777367532541; Tue, 28 Apr 2026
 02:12:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260410-pinctrl-testing-v1-0-6f708c855867@oss.qualcomm.com> <20260410-pinctrl-testing-v1-4-6f708c855867@oss.qualcomm.com>
In-Reply-To: <20260410-pinctrl-testing-v1-4-6f708c855867@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 28 Apr 2026 11:12:00 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Ee=BdLarnwFxM6A0+G9rYV4NJTm2go4p91ArZy-YLDA@mail.gmail.com>
X-Gm-Features: AVHnY4KEPMN0rWMtFgqCeeIxS-mVWtisiUNAOatuMw1puUfVBGi-Zw3AeUL_BJk
Message-ID: <CAD++jL=Ee=BdLarnwFxM6A0+G9rYV4NJTm2go4p91ArZy-YLDA@mail.gmail.com>
Subject: Re: [PATCH 4/4] ARM: realtek: MAINTAINERS: Include pin controller drivers
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
X-CRM114-CacheID: sfid-20260428_021222_602946_F393BB9E 
X-CRM114-Status: GOOD (  10.77  )
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

> No dedicated maintainers are shown for Realtek SoC pin controllers,
> except pinctrl subsystem maintainer, which means reduced review and
> impression of abandoned drivers.  Pin controller drivers are essential
> part of an SoC, so in case of lack of dedicated entry at least cover it
> by the SoC platform maintainers.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

I didn't apply this patch since Yu-Chun says it will be applied to
the SoC tree.

Yours,
Linus Walleij

