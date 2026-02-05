Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8E3EC1EB8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 13:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYA1Duj+cRq+IJF4FOr3z/OpYboiXpeOFw6+rn+iPOc=; b=hzcRadspJhJtQI3Oeyg+4EwTUl
	Bo236bQnAwiykx/JGGYdjEj4EetUGuXdV4vP4Mkkh1P3yhccrYHUG64+McrLSFTuEhW7ahhpygwuM
	otW4HiJqmNXbgNkRkpR3hwX52uast5tWcWgEIuXd07jlOZW6p/C9L9We/5yDOTMob0lXJ4qDt4k68
	IaDH5lZiUyS15RoBC0LymSz+WgD01Wo1iO8pKHeSHDeoQ1bQAjpaV2Y8/X1onUym4XtTQ0zShuQIU
	M61/hGt1AZWW2nC9tzsGj/jDNo0UA3lAu3jux8cRa96tUeV8vVO7p+kZkLi9ZPJNNXRna1Xz/IGC3
	A6dMTomw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzZi-00000009xVH-0VpI;
	Thu, 05 Feb 2026 13:39:14 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnzZg-00000009xUw-0UAC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 13:39:13 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-12460a7caa2so1280584c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Feb 2026 05:39:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770298751; cv=none;
        d=google.com; s=arc-20240605;
        b=jOUD8o1qMq01PdK2uxhA2wIYyDoBRjOaHDzrCJYptyg1R3GAIvBIwMYzcQAgW9kbSh
         ZLwd7xJY8TcimrcWyhW5LnFueoVmF2WS6Jjk5hvBhk1BBdvHYAJpYc5cLkVLRstRiyj1
         ezkgaWyO1C7aKlEHhDhS2f5INXjoQh10GLKFO+MdEoHlyfx/kLQg3kChJekyzRRM7WqA
         +DwbENllBYYIvfIyofei9MKKHk0TW87o33FL4mGzc2mRgPWKGzVdKFjLO9nRnza5Vspc
         PUJmVW7jVBswmlVZfkjqbG//BvICTrH2AgfK/93EP/8pSwsvnpS0ttSirdBTS7CDsEn7
         qj8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jYA1Duj+cRq+IJF4FOr3z/OpYboiXpeOFw6+rn+iPOc=;
        fh=K4KjY+mTAFsBqDthoIUa2WZoNE01K2NuQQgU4g18Yvw=;
        b=C+bc2O5VBKtu2vNL19f7HKINJbciDx/TP/0arf49fyW2QsAmv8ib/vjL9whHxGV3v5
         l8QRavRkwu/ZpjQBuy9fQroSvcNszSrCi35GUaoqkxHLafdfxi8aK4HDEdGPGTdIcuNp
         7Vu1tXsLyi3fKutnXrEo4bsu/AMgZAWEW1COL0kcvFelbo6YnnjPckqsZF9zCtbl42Et
         gk7PUpz+IcZj9eGSxTYNbByEYaU7tLEJd6Ao/6n31wgTyJzuOQFkPlbQ8BZZx12m3Vua
         Mk3+eyUXbi3XF+nUD/UGhR9gYr/Yre+krIMTG1LeHpK9tMkU95S4JEO9wqVUJnjlbyvg
         08DA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770298751; x=1770903551; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYA1Duj+cRq+IJF4FOr3z/OpYboiXpeOFw6+rn+iPOc=;
        b=O0TKwkWkAr94yMDomiEcQVs6BBIfEH6xK+jgIDuoAjU1dp42c88Y0WzidGHwnIjnTZ
         HVdhIJnxQkkSn6+UGOffO/wMDotzwmJjrv3kBgUYqcJ5JsMgMA89ZynU/gAgJrWSeM1B
         CuuFLIEEMIF087zZ9PAogHOOyRn9eDakaK7pmh2isXRkELZGvcvG4mRvi7ttCj6UMW8f
         f5sjQk/FtUIuhQchpYCSQkO+t19yzqx4c/8Rh6Fd+94qF6CO2I+9oOrji7a6ZJ650Dnu
         GZc8fzJA4Dd79irM87YCoE94bptiPmt+MJvGkhLdLxqAACMNnsLJh1sA++rLG8tOzMiY
         eSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770298751; x=1770903551;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jYA1Duj+cRq+IJF4FOr3z/OpYboiXpeOFw6+rn+iPOc=;
        b=wmT6dPJvuMOYWrCu8r4/ZiSW4f1Sj2THcEX2AM1LFSOiTdUnLEflUeVAoR68Q9YZWa
         GeENQ0Uskw14TDP3oB1nYLg7YyOLrtTyXJh/aYabBKOVNl+h4gQ3oGdIwEY1gTqo0eWi
         6zQ9mWSUGvyk0n7kt/esztkyt8TgZEClwP8B9M3J3NampKQyzq1lF5Lz3TQ9qLnvcmFV
         E73MkqgdU48xGhMw/NqH7pjP/IGFsm5EeTIwHaxSlptEQ/3ntMkFEh17WalBZcyV+rw6
         +kmIlKDRzyOYyiWqD6PxVu1f5lcb2SboukHIDk227Fsvbdl2yRBxbfPjki77d5WRsTcT
         EjTg==
X-Forwarded-Encrypted: i=1; AJvYcCWpYh84Lin8B1jAXtWsmVh1xZ0k3cfnk1KVbejw6BUGkwnhc7CSCUiumrD8WlerVZdgSbnyyhAw0pJzbRyoBeHY@lists.infradead.org
X-Gm-Message-State: AOJu0YwIqU0uGMMcG0raTP1zRTmAb+/jFZx40iL5iEnlIGeffHn+sxS/
	0I85iV02gohktDkcU7oJvz3nysnDeXdifM/zoxEKYM5e6yWjfC+zB1MjCAWCGGcE4EazunEfmOE
	OeJ7k6SpSitNCIb78dQamm02DJfYVYmY=
X-Gm-Gg: AZuq6aILflg/NK8GexeuP+63ITzcfGD5ckD7g/aSM+swDnoPxxCAOSwGeen0p6RoTif
	WIdvIcsnLhdU6fqcODusmWbdqCJAFZIP0V3NxChROJoASmk9P2lngX/ubW2WqHpYeFpOwoAaznr
	j8Ro1Hu2sqsryY4Bay87HhsMPsFkg0GVu5s276IYPXNL3HiRKu+vx0DMWSaOWwPZouFwmQKLUTX
	U54uIPmzwS11VXn9XBpXf9mJBDSfQRn5BOXh+PJm0GFNSWOxaUFQRRtUd9cq+b4KRADUbDnslEB
	Litf1XZQTMVM8vuMjRU4uH9TcP1BAHXNvXP/oHxlBYzdxtlWa7hfb+ugNb9wj9GoxM8dg1YEKJs
	RAqFgZHINMw==
X-Received: by 2002:a05:7022:a94:b0:123:3364:2cad with SMTP id
 a92af1059eb24-126f47df434mr2985042c88.40.1770298750680; Thu, 05 Feb 2026
 05:39:10 -0800 (PST)
MIME-Version: 1.0
References: <20260123-imx91s-frdm-v4-0-1bab038faee9@nxp.com>
In-Reply-To: <20260123-imx91s-frdm-v4-0-1bab038faee9@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 5 Feb 2026 15:41:57 +0200
X-Gm-Features: AZwV_QjtTDQuyjSNcHW5ldGYp4M24kdWeqjPp9n9pJY2oppr5gGyiiOIFo49TGU
Message-ID: <CAEnQRZBBM6y9Ux8ytbYEY-hQ_D8t+aW1+8OczUpX4=p1gmxVQA@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add NXP FRDM-IMX91S board support
To: Yanan Yang <yanan.yang@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, qijian.guo@nxp.com, 
	justin.jiang@nxp.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Lei Xu <lei.xu@nxp.com>, 
	Xiaofeng Wei <xiaofeng.wei@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_053912_164455_28C3A2D6 
X-CRM114-Status: GOOD (  13.77  )
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

On Fri, Jan 23, 2026 at 8:43=E2=80=AFAM Yanan Yang <yanan.yang@nxp.com> wro=
te:
>
> This patch set introduces DeviceTree support for the NXP FRDM-IMX91S
> development board based on the i.MX91 SoC. FRDM-IMX91S is a cost-optimize=
d
> variant of FRDM-IMX91 and differs in several hardware aspects:
>
> - 512MB LPDDR4 (FRDM-IMX91 uses 1GB)
> - 256MB FlexSPI-NAND (FRDM-IMX91 uses 8GB eMMC)
> - Single GbE port (FRDM-IMX91 has dual GbE)
> - PMIC PF9453 (FRDM-IMX91 uses PCA9451A)
>
> This patch has been tested on FRDM-IMX91S board and verified for basic
> functionality.
>
> For more details about the FRDM-IMX91S board, see:
> https://www.nxp.com/design/design-center/development-boards-and-designs/F=
RDM-IMX91S


Hi Yanan,

Just got my imx91S frdm board and tried to test this but the patches
failed to apply on linux-next.

Can you please try rebase and resend?

Thanks,
Daniel.

