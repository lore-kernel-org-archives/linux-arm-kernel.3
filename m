Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD05EFB816
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 08:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h37SoXxOAox4YOdzJyW9JzMBrcM1QBrBBjEPpKj+7G4=; b=jYdlybgOMMlPg1CnsDUKkvly+a
	Q4DEY3Zt7m1I20Iv0ZZ9wg8AoGt4X2mP8vq8WPEVdQ3K5p5ohVhwX4qoTEacZ3399tzwlN8KCvZoR
	ZrocPYzs/iN1EqAgvOJEH25z7MD5UfQig9jOUqVIVAURR6bYkPyVKHgb7CIv53HhmfsSpd7LNYT/d
	c7wnwIa4+HMshUoWjS/YlC17Zx/WNuuC2NhWJAjNyaIpxDBtUOPld9LhgzUHZiXg67l627MoNnGbw
	Hl3Df3I2ZCSeaC6aExCXBox0Z5+Q17LcYVIYjqDM88B+HJGtsfs3AeczXslTGFpjGInfTJRHxc02V
	misq69IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuo9N-00000001fnF-1gHZ;
	Tue, 24 Feb 2026 08:52:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuo9L-00000001fmc-1OdN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 08:52:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A7A0743A05
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 08:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84067C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 08:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771923130;
	bh=TxC+9CwQPZaQ4eZ8FYnf/MRlHREBnO/JfF0+/m7jxIU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DeK1+tcojVaf6QVywu3aN3pt2jTLUQJu0i99eZvTkRaRPYZ25g7dN85erlfiObexi
	 sBKH6lBcbvBusBaQ4gA6d0RAtzEGeBUZs4WOhYS83oXyXaWG/xSkuKm6XRTXynH7os
	 UqjNuiCBajKp1ct+I8Cbfp2KNyL6N5WP14aloLQziMnsl7xNT1jn889pS2KwhUv/iu
	 qAPRaJNt2lT/UJ+tDAB1B6Ad2sgz4QFF/JBFVsFQh05MjI7tXeKamHmnS/aTs+fJfA
	 nPpJrb/Aq9QGyrXSHU79buKui8S3NNtZKNWtjtnBb5AHrODfkicqEw6KJxq16ltH0c
	 RS1/idD0qC/rw==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-79495b1aaa7so46659907b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 00:52:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXZPsk3f7PzAcgti3pg+DfWQwr0p5KfcNtWnKd7qIghzbIdPdtIpsIvswrjwSF+Zf3Fel4t+IXmbc6W2pRpS7zy@lists.infradead.org
X-Gm-Message-State: AOJu0YxKUFR+fg2rAo0srqlQg+yju1PlwdQsetb9HSXFWwP8wsoM7DES
	m9VpPGfTvhF2S5oWSJrF7uhmFXUY7I4mhJ3qq3ApPg0yvEFrKB55am8aYIpFDwPFvvS1HHs7OHL
	DRTtc8ng77Ze2xS2ii0XhBRrPfEK0ZiE=
X-Received: by 2002:a05:690c:883:b0:797:d8ae:df49 with SMTP id
 00721157ae682-79828f3643cmr96216547b3.26.1771923129899; Tue, 24 Feb 2026
 00:52:09 -0800 (PST)
MIME-Version: 1.0
References: <20260216085838.71518-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260216085838.71518-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 09:51:59 +0100
X-Gmail-Original-Message-ID: <CAD++jL=0WD3993xkwt66KGaZrKUAGK-E6Jt1DHzzTXHcrjJeoA@mail.gmail.com>
X-Gm-Features: AaiRm52_C2vP2l5LPBno5Xd20xzBqjDefpIpOf3B39RiQDyRTkW0Hul60Mk_ABo
Message-ID: <CAD++jL=0WD3993xkwt66KGaZrKUAGK-E6Jt1DHzzTXHcrjJeoA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: amdisp: Make amdisp_pinctrl_ops variable static
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Peter Chen <peter.chen@cixtech.com>, Fugang Duan <fugang.duan@cixtech.com>, 
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_005211_400773_5FA80437 
X-CRM114-Status: UNSURE (   9.70  )
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

On Mon, Feb 16, 2026 at 9:58=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> File-scope 'amdisp_pinctrl_ops' is not used outside of this unit, so
> make it static to silence sparse warning:
>
>   pinctrl-amdisp.c:83:26: warning: symbol 'amdisp_pinctrl_ops' was not de=
clared. Should it be static?
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied!

Yours,
Linus Walleij

