Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 851BBD167EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 09:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOPj6csaxqSh/pD94Xiow8fswoPt4epubaYlDPDsNMI=; b=Tc0FcOTQKa2mV2chh01Y2vmOJS
	DULx4fXi8LaWgPH87SZkXk4ZJgJK0QxqXkWLxMWgh8bQMhkcdwa1Da29wZkAFWtz8dp9eGNVQteVd
	BmMywdK8T84DJ5eR7aHMiOuwQd3m9rTkUD6l9jZkM8g9x8RUpsGZk173F5DBtX5J3PvVxS7AzWyT3
	Oh7O262xA4yVKFhOz6YrvDbSQ9g1EaW+9cG4FlZGdDZsdyUVJ4VaMZtBCPb5zBw4uL+oiKRjN1ENn
	JHJ15Lc3UXfU5kgE0sApQTEIXuc5B5wEoeaHJa03gXBxINXVHHJH5swPUKKMnY/wIzSsj4g0dDJBW
	2NT+hfmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8si-000000021kv-0Qry;
	Fri, 09 Jan 2026 09:34:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve8sf-000000021j7-3MtX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 09:34:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E49D44331
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 09:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E0C9C19421
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Jan 2026 09:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767951245;
	bh=eOPj6csaxqSh/pD94Xiow8fswoPt4epubaYlDPDsNMI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lR79fTbkQsjgiDlA6fkXm7nFk8wVuLWHxfCcZhKMCzk6nFbpiobQdH+19xNX1Edq8
	 Xu5QeqrJLJmlalUk0cX4DpHpHY9k1VxZ9yB7U7Fe08DVHs5dkYebQbpdDXSk1uGuMs
	 3NYEBRMjDXEQ7EyKut2fYDHiQqGOmhTyuFTWnsUWJnC8lAwsVSYvpIYCNB7FLTDCS9
	 C4J4iJ2k1oQ1yXqnsNmHma70GA7ZUgrFAVWtMfhy0tgm/5HSq9wirt4ixPTU16Mu2c
	 +lkpNLrYinmglFCoxuv5/Pzb5FFZDnCN4e5KeD4MboWw+Xp6Yv+qC9MI6/n5qR1hfs
	 PV1vQd6HCvjWg==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78fb7ab7562so35832657b3.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 09 Jan 2026 01:34:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWyl7s1jihbKKZ4YuA2WrjWIvw4bagrBsBm9G4dTKmOdwhGwdeA7d5j3JqoBad8XChRhYfKaTx5V9Y7bQV1JYRu@lists.infradead.org
X-Gm-Message-State: AOJu0YwWBmwufLGQuSZqX4WHCJ0PAw410BaxO27ugY+2ywXq2Pt2Sop0
	JAK85IcZHyJhxQhzSrN2nn9dtYII0SscKGvWirgWsXglBG4vH+2cMTdg1PWetTXzlRYqJ6vpRNy
	zUVaH/QGR7r+xjSdjlUUHTMTbqGUh4FA=
X-Google-Smtp-Source: AGHT+IEn0vqdkw8bEaFTh2evg/3/Gk5M0wvdcElU6mMy3Wg7wsSj3AKZVzV8/gWPdmB4yzqWtFjvi9yu72g/ac8yxEo=
X-Received: by 2002:a05:690c:18:b0:789:2be7:ae80 with SMTP id
 00721157ae682-790b582a8f8mr187013807b3.54.1767951244425; Fri, 09 Jan 2026
 01:34:04 -0800 (PST)
MIME-Version: 1.0
References: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 9 Jan 2026 10:33:53 +0100
X-Gmail-Original-Message-ID: <CAD++jLkaKgGDTbzjdWNPFSF85VDx3HCnOdbF8GSeEZRp3jDbCQ@mail.gmail.com>
X-Gm-Features: AZwV_Qh3gljFKlGTGVVG8Mveu2qlxxn_p3yMb-Bc-OOzKbAyx_Ef35y9X6nAS98
Message-ID: <CAD++jLkaKgGDTbzjdWNPFSF85VDx3HCnOdbF8GSeEZRp3jDbCQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: mark the GPIO controller as sleeping
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_013405_889760_E4E10C8C 
X-CRM114-Status: GOOD (  10.43  )
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

On Tue, Jan 6, 2026 at 9:53=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> The GPIO controller is configured as non-sleeping but it uses generic
> pinctrl helpers which use a mutex for synchronization. This will cause
> lockdep splats when used together with shared GPIOs going through the
> GPIO shared proxy driver.
>
> Fixes: 6e9be3abb78c ("pinctrl: Add driver support for Amlogic SoCs")
> Cc: stable@vger.kernel.org
> Reported-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Closes: https://lore.kernel.org/all/CAFBinCAc7CO8gfNQakCu3LfkYXuyTd2iRpMR=
m8EKXSL0mwOnJw@mail.gmail.com/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Patch applied for fixes!

Yours,
Linus Walleij

