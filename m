Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30682C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 May 2025 21:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pm1jMlXCLFReGUe3UakIYYmM8+KuW90b5lgWvldoqqM=; b=ytGT8KOUDHhOz7UXz05Jzoyrt/
	eDgbWKQxJdzQv5F2C223MZUwrAs47T1JentUZUzhTQmHQpRQhIhNyGZo9ZEWk8eXIdr7BcqWeRgoN
	oASOJdFaNo1j6SHdAaqUKPUgrr6nAHowCQdMsVSCwpFXfn5G3y1XbH6IRDzqCbuL0U9ad0rTgltop
	egz/tmKYHeBDxzHdOheEOH3FJ5GArFZv4fTRC+GPdjx2NXeV72skCD94qpAYAstgB33QX9tBvmHx3
	zqME5qAvJrwS679XnrjuO4+N53LbyXNvHhZPXdtvE6U9LcZ3zcboJALN1/ttLuZWP44Jgm+rIp9fl
	Ck8dBLtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJJGl-00000007jsF-0omQ;
	Sun, 25 May 2025 21:52:35 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJJEb-00000007jjf-1zxC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 May 2025 21:50:22 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-476ab588f32so18507241cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 May 2025 14:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1748209819; x=1748814619; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pm1jMlXCLFReGUe3UakIYYmM8+KuW90b5lgWvldoqqM=;
        b=QFR/8tEJt1f7G2J3k9uwx5yK4EI/vCfn1SheMsi+TyUrusMcGK/a6Sm4U7bFxiz2MH
         D/akpLS/iKSYAhcHZaraeQMwVsYkRtwlBjF1HhwFuXytYRzlE4w9WbhyZ9VII1c7iBV/
         vnZURRkfZ3CsYPrXsad5v3XOjKycZ5Gpu4+FLEMLbl9vYtYM6aVoqGI+XKvxBwAkTXQ1
         AUEJqY1e/PYPEmfJS9UpoLubCgYOvcSUVfR2PgvYeJRqHHFULmxNt1tB9qeCvs//j4rs
         M6oZERLSYOo969wDe96yOrZxZc1eApNt7lxZSZKKFDdvBE32c1e3fn0TISKxoYGN4bU9
         pwcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748209819; x=1748814619;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pm1jMlXCLFReGUe3UakIYYmM8+KuW90b5lgWvldoqqM=;
        b=UqUld4bj4/1AhBUUQFWBsven7CE9hNUHb+cRxKhsGdulLtayDe3Ki2SU8LHnFI3niP
         ZpntbP1CPinTEFhR48VujmNnEWpj0n6KUlgSeD21krNjSoRKdiUQZt9pjGvHU/Ul7Ijo
         YfITY9mP6qhk0UMxYppCCWWr6x1jbazCPORQ/xsUztfkT1hJ0lM6sUTEooKOdNgzLRni
         FB35ARXW0wpK5N6Mbg5fHShI+T9SOPItk306OXF2I+F1KjmWIPj6fjhE9eC6vrMMNeVW
         +t3+OlZbMW4Ls/nuLTDt8shk7NqnCctXIxArTjB87vsXa1u72nlZdCKLqH+g8KNn1ksK
         Qd2A==
X-Forwarded-Encrypted: i=1; AJvYcCX6HfGscFYyvW+69pvqeg/3/0bdzg+/v5d8IOtPf0aJ8ekh0QJvwUWxZL/xA4//vSl6BcNXNq8HScU7tU82wz6t@lists.infradead.org
X-Gm-Message-State: AOJu0YzUTPza9+tdF9AmS73uamTuMV2/2Au8F6CyVnNkq3vxDt2EhCAY
	3rfDQdhw7EeXXYD70O/N7bIW0Zsbi12GUn4m99aPS7YEDgcLWZh29rTmUmuKYUCkQ54=
X-Gm-Gg: ASbGncuN9fpIM9YJXL6a4XXy5O98IFuuO8vopducncq3c4bDXKwaTooDbt/HJK5sG3E
	j3JR9gxwxtAZ+F0FadhlH28X0pvU97ngtEK1/728fnSrUBGSHWMdmaN/JamW/JYwI+eussEWiBk
	qAQXpSu1ORG4bUQ9CxQ8tAcOEcD5/olbTmlmDvtrt7/g5eTy1AbJ3LJeKmGYnKdWJLLh8l0CBnw
	EQHdoO9kxI1ZCJmYEOo869jS/TOgYLwB+DR5CzrfGbm/Aclk+wfuSyHiNi9Zc/DMx+U6EOljqf7
	QQGAvdHy0jaYAzUaXfJ+uHN++fS7YkSry9dM+5agI1sHTSvFccsb0m+9
X-Google-Smtp-Source: AGHT+IEVXwnSdTnPicIT3RqwyFuAzwpnXOpDvgI1IfPNgR4J4NsTJDMjpLuTDjjhVBcT9a1O+PZ5Wg==
X-Received: by 2002:a05:622a:5148:b0:476:8e3e:2da3 with SMTP id d75a77b69052e-49f46e43961mr130428731cf.30.1748209819399;
        Sun, 25 May 2025 14:50:19 -0700 (PDT)
Received: from ?IPv6:2606:6d00:17:b2fc::5ac? ([2606:6d00:17:b2fc::5ac])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494b8fa2cebsm133817721cf.34.2025.05.25.14.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 14:50:18 -0700 (PDT)
Message-ID: <86a27f47a72a2c2f9a7d15250150743c5c43c0a9.camel@ndufresne.ca>
Subject: Re: [PATCH 3/5] MAINTAINERS: Add entry for allegrodvt Gen 3 drivers
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michael Tretter	
 <m.tretter@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>,  Michal Simek <michal.simek@amd.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner	 <heiko@sntech.de>,
 Junhao Xie <bigfoot@classfun.cn>,  =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=	
 <rafal@milecki.pl>, Manivannan Sadhasivam
 <manivannan.sadhasivam@linaro.org>,  Kever Yang
 <kever.yang@rock-chips.com>, Hans Verkuil <hverkuil@xs4all.nl>, Joe Hattori
	 <joe@pf.is.s.u-tokyo.ac.jp>, Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=	
 <u.kleine-koenig@baylibre.com>, Gaosheng Cui <cuigaosheng1@huawei.com>, 
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>, Wolfram Sang
 <wsa+renesas@sang-engineering.com>, Ricardo Ribalda	
 <ribalda@chromium.org>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Date: Sun, 25 May 2025 17:50:15 -0400
In-Reply-To: <20250523134207.68481-4-yassine.ouaissa@allegrodvt.com>
References: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
	 <20250523134207.68481-4-yassine.ouaissa@allegrodvt.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1 (3.56.1-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_145021_783681_4F4BEEAD 
X-CRM114-Status: GOOD (  17.59  )
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

Hi Yassine,

Le vendredi 23 mai 2025 =C3=A0 15:41 +0200, Yassine Ouaissa a =C3=A9crit=C2=
=A0:
> Add my self as maintainer of the allegrodvt Gen drivers
>=20
> Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
> ---
> =C2=A0MAINTAINERS | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e59011a36e6b..9285bb2f43d9 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -802,6 +802,7 @@ F:	drivers/platform/x86/dell/alienware-wmi*
> =C2=A0
> =C2=A0ALLEGRO DVT VIDEO IP CORE DRIVER
> =C2=A0M:	Michael Tretter <m.tretter@pengutronix.de>
> +M:	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
> =C2=A0R:	Pengutronix Kernel Team <kernel@pengutronix.de>
> =C2=A0L:	linux-media@vger.kernel.org
> =C2=A0S:	Maintained

Be aware that I do not endorse Krzysztof style of communication, and this
does not reflect Linux Media values. We strongly encourage both new comers =
and
contributions coming from the hardware companies. Please, don't get discour=
age,
simply focus on the facts and the way forward. DT maintainers don't usually=
 deal
with pre-silicon drivers, so we'll have to see what this means for
bindings. But having drivers contributed before the hardware is a clear win
for the Linux kernel, so we should all encourage this and find a way.

In general, don't assume any of the above is known and document it. Its qui=
te possible
your reviewers so far have been thinking this driver is for existing hardwa=
re already
running in a known SoC. They cannot guess, you have to make things really c=
lear and
transparent.

Meanwhile, a better approach to maintenance, and the one I expected initial=
ly, is to
place yourself under Michael in the hierarchy, and remove yourself from the=
 bindings
path. Bindings should really come from the SoC vendor in practice, so perha=
ps we should
not provide a generic one. Hopefully we can get proper feedback from DT mai=
ntainers on
that aspect.

I'd like to see a focus move onto the driver code, which is at this stage m=
uch more
important. In parallel, spend time to re-read the guidelines for submission=
s and
check some automation tools. 'b4' is really my goto, and will help you avoi=
d some
of the common mistakes.

regards,
Nicolas


=20

