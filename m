Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EF9F506D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 13:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A2q9pnOophLnn6caR9j1SFOoQuXMepZD8MjFyVMsVzA=; b=t7W1asGNJ2xaHQ3TbTYmrr+okV
	pgxsWa5tiF3z0N8DYcXR0VCkHyZs7HnFB6sh0jayLjIQHeMbcS6dkH4E6CknYGscb2n1t8g4RX3sf
	Pdf4dgT/yBYn0bHgY7NVSU99VxmvJeTsPGgTYpnFKbJYjinHhOeTR36MQL9S1lbDtuA/GB246IjPj
	GKiJf05NopePj/gthp1HdMFWNOOv/Jre2mCscKCbV+Z9OMzApIN7v1XcpUZB/l8TO+uNyKadnRrNz
	/SHZrnFIs9m0hAy8/ebYsVCR8xmfUdx6FjAHBz5znJoU2xc9n4GAeIGsvNDnzDr2jvObC8/BSvsp4
	6vIXzBDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28KN-000000046df-14yy;
	Mon, 16 Mar 2026 13:49:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28KH-000000046cf-390p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 13:49:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 61241443D9
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 13:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A1E6C2BCB4
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 13:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773668985;
	bh=A2q9pnOophLnn6caR9j1SFOoQuXMepZD8MjFyVMsVzA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MUX09udDrhOlLsC8/Q3l+9f7i6j0nw52cG2VBuQE28c0gsMbj/8yPFpkQlm+6qxO7
	 2nwinoqGoDsFAJs6AwnP/BJBlnmpHp0JbD+DDuq3iIulxhKK+Odb/+aKge9jNKDBhh
	 dHuXK87osW9hgYDFcPob13pEGM8QCPS+L8mw4AyRar4BUMhKg1qfF2pNQjd2nyKoN+
	 dDETEbyC+jOHoLgXeCG9I6IKpGPo/YHNaCd+pftyQqQFeKOMf/3SItoyecyJjbrpCZ
	 9xRKsijTcDS430vNPwngFADTRe7LPlJxz67BLKrDf2INqrfy6Aiy3CFrfWPwViujsL
	 2U+USy9pozMzQ==
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64caaacb9bcso4781520d50.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 06:49:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWRZSPKVK32dHt50O8ZBZWVDkJ5+eXMTmOIzEXDJn5h8mF2Nk3ffTIPu8p8Zvsa9QRiFdrcu04fXRKD8LGiqJBO@lists.infradead.org
X-Gm-Message-State: AOJu0YyD+gBO3Ab9TzKF2sic6xWvyIresvVS9bgBVqq1K+GNXAM+PQdq
	9n1rVkzQPeSLTXpyTaAl5wDJqkKN1vvd1OjrRZyxqDoz1EHacdvBSKIRHBpa2cDk47godmkYCqD
	59u7l5tsyglKhRjrkPQwMdbXI9joc9Yk=
X-Received: by 2002:a05:690c:9a03:b0:798:58be:324d with SMTP id
 00721157ae682-79a1c1ddd1cmr128701907b3.55.1773668984415; Mon, 16 Mar 2026
 06:49:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260312113040.68189-1-eleanor.lin@realtek.com> <20260312113040.68189-6-eleanor.lin@realtek.com>
In-Reply-To: <20260312113040.68189-6-eleanor.lin@realtek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Mar 2026 14:49:33 +0100
X-Gmail-Original-Message-ID: <CAD++jL=9J8p7sjfaFN1W_AoDuvJ+6FMXk=Mz6TMFN54VAPtTUQ@mail.gmail.com>
X-Gm-Features: AaiRm53YgIbgRT6duHd0On12WaicPrmfX8KKe4MLPMA8yK6MYMjttB2TeXiF5i8
Message-ID: <CAD++jL=9J8p7sjfaFN1W_AoDuvJ+6FMXk=Mz6TMFN54VAPtTUQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/7] pinctrl: realtek: add support for slew rate, input
 voltage and high VIL
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	afaerber@suse.com, bartosz.golaszewski@oss.qualcomm.com, 
	james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
	tychang@realtek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_064948_176739_8CB632FF 
X-CRM114-Status: UNSURE (   9.07  )
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

On Thu, Mar 12, 2026 at 12:30=E2=80=AFPM Yu-Chun Lin <eleanor.lin@realtek.c=
om> wrote:

> From: Tzuyi Chang <tychang@realtek.com>
>
> Add support for configuring slew rate, input voltage level and high VIL
> mode. This involves updating the pin configuration parsing logic to handl=
e
> PIN_CONFIG_SLEW_RATE, PIN_CONFIG_INPUT_VOLTAGE_UV and the new custom
> property "realtek,high-vil-microvolt".
>
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

