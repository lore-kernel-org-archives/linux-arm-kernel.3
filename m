Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C2FCA5FEC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  3 Oct 2026 17:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+Mqd6Pqbqln8HeOp8rCuqd0Rbs7qUX/fnfxIBh4nMs=; b=sso9HfgTpmOPrdVdzjl0T57nn3
	VlnYy0eLlW1qG0eNDB3OzeAv1ey4sPyU2DWCxyiBE3omDKvmW4J6Tq4Wq8ugc+K3Isi50cfEZgkHT
	eYER0Dk5/B7ZP7FJM3AECLaxlRrFJjJAo5xgs+uog3LwvpxDBO+BlTXkY07a8aAtnz7XjEYFeGK5r
	m1v+7B4WeQ53SOeO5yifgCdjSfA0FsV3/MRfT2AgrPnA6QlMzsyqk8q8vZ4KhR4FER4eCoVe+Q23a
	mcLRXw+0V8FHfGN4cl2vtjeT4+SXv3HAUZCgJBbpRhvZivVFq+QZfGsJ1Pukr+ntCzK2iT/U2ul32
	8Y+ct7dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD3wz-0000000DslF-1Id5;
	Sat, 03 Oct 2026 17:55:09 +0000
Received: from mail-ej2-x0d.google.com ([2a00:1450:4864:34::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xD3wu-0000000Dsks-1vyK
	for linux-arm-kernel@lists.infradead.org;
	Sat, 03 Oct 2026 17:55:06 +0000
Received: by mail-ej2-x0d.google.com with SMTP id a640c23a62f3a-c2e3453dd0dso138479966b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 03 Oct 2026 10:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791050102; cv=none;
        d=google.com; s=arc-20260327;
        b=TfKJBhDokh4vz+GuxGCdLERdExYJek4b1wV6Y31uB/gFDOGLUa/hY3AGqy/cJ0MY/F
         4PkXQhh0R/QRXLRoJ9U8im5OEBCIP7j1X803F8cgIF/YUoB+BqxCT55uWnDQF8Y7sBoo
         OIx/aIA1hHXX/wckGwni2QjfIqXWUl0dvMmm17AmLc2oQmtb4flHjkOFVqSG58FW3Pt2
         llHAHjF6pYeauTXEfqGQro9Qu3cPJcWhN5nPAxd0T/A1v9oCwy3FwxSzI7m8twnuJINW
         l3pCbSlayGjcXKbpPVSSh8Cc4hTiLwz2Dde/AD06JMkBNVCSSpN+xSuMGfco+vJj6bBd
         A4aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c+Mqd6Pqbqln8HeOp8rCuqd0Rbs7qUX/fnfxIBh4nMs=;
        fh=mpT7gkfoEG5ITNxXqjLh4KPs01UrEVT4YumQmGAROFo=;
        b=ANpKHONMoOURSpgWqnN1uP9B/zJwplAlVRa3hH4xFcS28IUwc28gtpWpbE8edmkPkL
         upgfx7JKeN1zScEC81TQbQ4VfmE9D/tYXFPwJLd9mHz0tANM/RUM1mL4MzpHAfeLFeIm
         WHD5t306qFZjfijVAauvJ3qRkrlWt1Rub8A9fanSybIw0zU6Kf29VV95JbL44V7hX8sw
         mlcFk0hsEgNJTPFaqGbsY74cnXZGMjF5JFTxxEcjgAVlsnHYT6d7xnzE8mf5NoFJYJk8
         9HyCiCAmm2un64cTuCfhDGquNXCmu+zFIuPElnDo58m56XQRTUZwjKXHrgJN/gEww7WJ
         LFqw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050102; x=1791654902; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c+Mqd6Pqbqln8HeOp8rCuqd0Rbs7qUX/fnfxIBh4nMs=;
        b=ptCLuuREXORYCK2MhBqRceSPYD6dX2eM4PFTP2u/NjbxIpDJnYiP+yj6tnn2SJLy9S
         hFxCUc5lDnWbR7GqTk6VwUX207a7xGg9zI36iLvsg5nlnowmX6n7ufIYApB8Ju2YBr7j
         Pc7UfHeHGLu7qC5YUdXfHaaUWZUjqSo8C5dbDjm1SU+gZOWhTcLH6pv3cv4eMMSgzKcI
         GBb+0i/G58QDkmQJoOeaIAsp0eQFZSi2krirGzSw0v9EnNfR5Tgqu661x0G/DoZ4s/v8
         1guZwz56UEDLgsqi0bChRNVbT6iWxsI6zgaW3IEfid07aRg4O4CDxvv1IMhO5V25asDV
         6dfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050102; x=1791654902;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c+Mqd6Pqbqln8HeOp8rCuqd0Rbs7qUX/fnfxIBh4nMs=;
        b=oRMRy2Tiw0hJMERtsH324UskBfmy6DdfKl1yyH7naH4VyzlDywvWOIZgToBgydwqp8
         fd1AMoYsm4PCnzjYxkC75R1WAqkIGp5ZfSEJk554EcBYwRTFVLuwOLzT4X8k7G0KvZEG
         rPnMqPRy5ODG1YpyVHJRJgtv8jO/w+bTtQ6vQS8zW67hVPZmpvF0M04hkJzCaWdtDqVu
         vqitHhRsChusF5Xg2/c23x8g4ZVoVJ8BONymJuu8RP3heUnlHXW6vUMlLRWxPDl9kfvq
         AtTUY7YPy9DpJSnRwOFIRucYqVDsBxd8Pe1UXo0hBIbD1ySCmlk0wwAwEtRpyPeVe0NG
         a2fg==
X-Forwarded-Encrypted: i=1; AKwUvBwXuF3jBGUmK9SQ+2+ZmzFSnid/3tvi8XwJu4hBSk1T53oY08U2QQ6Ea4cAA0r4rOf2Kb+RDoFWh3K+ASte4TZH@lists.infradead.org
X-Gm-Message-State: AFuF++lYFC1e0zJEvqp2IKtETvzLEKuQ3mVIbnJorZKLps6K/8BTRyCi
	PDreejibTjSyq8bOrE1sp+QX0VK9QTHv+UFmUu4WFZKlArE4A4eowO8o2bT9i0TDcIIvpcaNqgR
	Teko+yGQotrFa7yrtC8j6Uk70AsnUA9Y=
X-Gm-Gg: AYBFou3p7LTULMCEzMU2L9OKhfL/fNVQqJjr38WdXBsxatAOyd/414djhpfIIUV/YWY
	SYi/jntduKZAx1Fd7r0Waab1w1G37OdMibYDNKykbW0XDgT0V2kUGK6KgcLzpxt3A0urDRhScRt
	AQgPO9xH1UMHzdWhO3a5SJ/HMLnbScK7QDVeSKtskg6z/gBP0tpIeF/9hZY6tHbhbPZrAuOC/sY
	/hIbDVnkYGrLAnx7YfTy5kTIyqAyqbyLpSmxgBkFoww3elcvwlE+w3ffb1lr3G9jbdDlG9iQ+bp
	i3EpX2jSf11Fz48ECclzLBoEnqizBLySFF//4i3O0/MRh7zj3Ftl05cK/P8vkSk6EkSGItmoT/W
	q9dwhPLya91fWq5vbLBtXvf0QydcgyjjW4ZjuIkPG2reNC+NSllv8cBlJzwNzDrbwUtNKyjOQG8
	kB7uOgecso/zK8YgV1Cvgu092x+ULjIZXfB1tCsQuE7t0l9h/T5Ptp
X-Received: by 2002:a17:907:7fa8:b0:c2e:4292:d26b with SMTP id
 a640c23a62f3a-c2e4aac022dmr541503866b.17.1791050102486; Sat, 03 Oct 2026
 10:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20261003-gpio-mxc-cleanup-v1-0-dad728ce27f2@nxp.com> <20261003-gpio-mxc-cleanup-v1-6-dad728ce27f2@nxp.com>
In-Reply-To: <20261003-gpio-mxc-cleanup-v1-6-dad728ce27f2@nxp.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Sat, 3 Oct 2026 20:54:25 +0300
X-Gm-Features: AclHuK-Tnk4vGYGovhYsTrmL0EszXMNMJq3_DIUiup98Oar2sN_FwV71aRE1nR0
Message-ID: <CAHp75VfcuHPQ3S4LD6OBAMvu=hiGdSU_pji9+8LAGXD=y4C=9A@mail.gmail.com>
Subject: Re: [PATCH 6/9] gpio: mxc: use local dev variable and device_is_compatible()
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_105504_520867_F28C396A 
X-CRM114-Status: GOOD (  11.04  )
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

On Sat, Oct 3, 2026 at 3:10=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Introduce a local 'struct device *dev' variable to replace repeated
> '&pdev->dev' dereferences throughout mxc_gpio_probe(), improving
> readability.
>
> Switch from of_device_is_compatible(np, ...) to the device-model
> device_is_compatible(dev, ...) API which works with both DT and ACPI
> firmware backends. The 'np' variable is retained for
> of_alias_get_id() which has no device-model equivalent.
>
> No functional change.

> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -428,17 +428,18 @@ static int mxc_gpio_probe(struct platform_device *p=
dev)

It seems you missed updating the headers (like switching from of.h to
property.h). Other than that, it looks good.

--=20
With Best Regards,
Andy Shevchenko

