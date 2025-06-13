Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EC0BC71136
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 21:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TP8f9H321cpDY7PjjNkFIXkN20w2DjJZC9sAvsk14TI=; b=QQZAjPSWnIgLEmDVCuyhH8rfbK
	QH+oCvzbiXps4p8guZAuNQHRi/M8azwe0SaqJCb9UGZ+YvkEF8w8LoZH+kPv4fDJyDi8T7ChaPnd5
	iK3cdytQDBI1P2FmIOh7xuL0tY/DDq2Fh8+Y5TRME1DLK4xiY2UTkPGcxaqSbvL5+/yAfbYTUqLDn
	XViIkKz3w1Lg2PtJlDeQdbewLSK5RpuWJnMlltxzkQ/Zd5QQ5+fkLPbSnZWm+7xMBUvyUtNbX+9Yq
	roxivlcI+qv0FUIdcfZxJ870kRxha1pqPfamoqtccpswQUeJ0URGHEv3uHAHcYXeBSMZHj2u+3vhd
	GZjv1isg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBfh-000000005tA-2esW;
	Fri, 13 Jun 2025 21:10:45 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQBdV-000000005L7-3IwB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 21:08:31 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-60727e46168so4306011a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Jun 2025 14:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749848908; x=1750453708; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TP8f9H321cpDY7PjjNkFIXkN20w2DjJZC9sAvsk14TI=;
        b=bm0vdm2WCUpdMbk4n8urvrxFpnbJZcKB4QT6kctifuVJRa/NJ1rxyxI0Gw8FOp6DCg
         PODkKx5Odwq1XDTOjX1XGQsOBPVOdvYGod4cBEzZyAwIe4x8EPsxDpK/e9lTvFI4omQB
         W/rt4LLlJsYXtcbEg2PcfI3iLD2aew1oGRFX+SoslfA5EMPQN9urFI75C2PSO6v6BdYV
         KuugV5Eg9DQ30eQxis3pT/uWhF3/N+yFJNAmYz8O/kwH7l0o+bGholnyKktbwZKjywb3
         wSvpq74rNYBw9goPygm+a0FzhJWnsWfq+AqhcMB1dNHRcAZmFg+hsJql2yu0G5K8OVCS
         CLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749848908; x=1750453708;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TP8f9H321cpDY7PjjNkFIXkN20w2DjJZC9sAvsk14TI=;
        b=c9JHv+IBBqA6ErIqgzuYz1TVYxX4dxwihJFS7m191X2NEaI2n3U7ZUWpKLlaMQuM/u
         +rtPZcNuCBLoUDxzvLj7M/zwd7zx0aLXrfuqo1/XGHR75QpPS/9Rc/OHrt4zLQNJ7yIj
         eJVV83GYvp3DQzF9v7kyaHfrTQIYL1yzNh+DYqsV65qYcuoUK40bxNiv2JIwFxvb+arO
         efH8fldX35P5OQp9FXgi+H6d0j5c8ja3+qhokrCI10ozyaIiqnANNEyoGK9vGJKCn5YL
         HU6rw+mvxqWpkccUDzO3Dn1Z7cmVsIvjcnhjD6QKQkdO2IyXvyWkTCrRvTN2snAFAcjH
         HQug==
X-Forwarded-Encrypted: i=1; AJvYcCV2uaf+D1Smdn+hxjr5qwSjwGPwPYarATO+VyzJw182MDwgoZ2Y1pIftKJc69MqaYhMBNTULHWLk6oVpI1qeR8e@lists.infradead.org
X-Gm-Message-State: AOJu0YylHTPq+dsC14Dpk356WWaS/NFuppUJurrzRb1WSnrD2HCGO/lP
	a19BgtFyP4ToK3++70i8N3pLjkAczHcb0h6bdwAuayChjxUnMvU6Du4Jy+XSUu4BiRP9KPMEZB+
	6rJZSu5FpCsh2PF4apFQI6dhGqPIVDSVKxTYn
X-Gm-Gg: ASbGncsZPIIFmH+XCQRhN8rZzwVHgjNymf9vHYwl1D9RY0JKJjcmFDCuXwqS+Wb27LQ
	Pvis9FE0yfZnLrYP8oixDuDUbZFBpkPy1ujHBGfyT7VGLQnwarJADWESgm+fIVNZxTUp7AdlT+F
	tFeAk+zlaQLH5+tW/ymMKvohYLwp4JNNe81m5v7obOiDdYEsvhYs3kQQ==
X-Google-Smtp-Source: AGHT+IFsWY5YZ3lvdRtP1H251UQ0HMURmtDSi0LBfNR1vwvh677WfY0+mwSxId1SrjTaSFF8a7NweFe3vpJ7+cNMcf8=
X-Received: by 2002:a17:907:9801:b0:adb:1804:db93 with SMTP id
 a640c23a62f3a-adfad4f61femr57095366b.49.1749848907663; Fri, 13 Jun 2025
 14:08:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250613181312.1269794-1-miquel.raynal@bootlin.com>
In-Reply-To: <20250613181312.1269794-1-miquel.raynal@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 14 Jun 2025 00:07:51 +0300
X-Gm-Features: AX0GCFsiAqLiq2Z0quLAABeTm2pe1sVJI7AxoQc4QuY0ns9mKyO4ue_CKtpYGMg
Message-ID: <CAHp75VcfaU41FV-uN=82GdUqRadxYc6XaLX2Hr9x-4RfAV8CEg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nuvoton: Fix boot on ma35dx platforms
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Steam Lin <stlin2@winbond.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_140829_823466_C8043B55 
X-CRM114-Status: GOOD (  16.84  )
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

On Fri, Jun 13, 2025 at 9:13=E2=80=AFPM Miquel Raynal <miquel.raynal@bootli=
n.com> wrote:
>
> As part of a wider cleanup trying to get rid of OF specific APIs, an
> incorrect (and partially unrelated) cleanup was introduced.
>
> The goal was to replace a device_for_each_chil_node() loop including an
> additional condition inside by a macro doing both the loop and the
> check on a single line.
>
> The snippet:
>
>         device_for_each_child_node(dev, child)
>                 if (fwnode_property_present(child, "gpio-controller"))
>                         continue;
>
> was replaced by:
>
>         for_each_gpiochip_node(dev, child)
>
> which expands into:
>
>         device_for_each_child_node(dev, child)
>                 for_each_if(fwnode_property_present(child, "gpio-controll=
er"))
>
> This change is actually doing the opposite of what was initially
> expected, breaking the probe of this driver, breaking at the same time
> the whole boot of Nuvoton platforms (no more console, the kernel WARN()).
>
> Revert these two changes to roll back to the correct behavior.

Thank you for the report and the fix.
Can we also add a comment on top of each of these if:s to prevent from
blind change in the future?

--=20
With Best Regards,
Andy Shevchenko

