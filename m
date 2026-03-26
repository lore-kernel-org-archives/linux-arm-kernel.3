Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C10109E535
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 01:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkQDhqxdu/VghGhiJbxfiIKUvNi36C2xoIdqMy2/5jc=; b=S54oObMrfV9kq4olHuAlGOVmEM
	5IMP387WsxAF7Vfs7JBPYuAHFzr8U8GDSDQKkZRjlgj4VlAXrhilWyCuUoESuNJFFF1vrNCFmU09v
	KwlmESXMMu37wEE88fOPO0A7b1a+mwF77hpAzc/kO42d1RWLDHLxM4nTrXh1WyQe6HW5O/wF7iuKO
	U24QIviztaRWROzfFUcZ9RXwJweak6AUwTX1xi4K7CFkZWAg9xNnT+G4K/IuykwPr5OTsSCNeieYR
	tG6MQgRxuZpYw5gLZ/FYklkk3B2C+oA+A9e2Rg1dzlZGFow866dd/jEpf1dWOHv18L4ho21ReY9l6
	gbd5HrrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ZuU-00000004Y6M-1Eh6;
	Thu, 26 Mar 2026 01:53:22 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ZuR-00000004Y5e-1o2b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 01:53:20 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b97f9587e6eso59372966b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 18:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774489997; cv=none;
        d=google.com; s=arc-20240605;
        b=T1mqTSLozfxCDhIrDrmjJqPUmU/lq5uq/IYOPxD8eR6JDDz9vAHgUeeUHwYggL9Bpz
         XntX06GP4HVzpJhh9uRF3Tt81eUm0qWIk8KFCY4Wov+8iuevaGZi/uxyZPdI5cSOtnUz
         bM3Dm0CTUwseAbXCLOyDwQKJfoJEPmZQUgEWVRBPJZDDiMxgrzGvvXfi/I+AoyQFGWsq
         /gLKW6BYRsdJolnyZh6M6g812UqPvX6XmVjNPJigJjVO0ER2h7btMAHZJ8zHYxAMbJic
         0Ea+FBRV8cPJg2QeU8C+sSPX1IhTSFvY2Wvr6TkGo+zkHZLGe6BU3uhzALtNLvkU2K4L
         6M2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OkQDhqxdu/VghGhiJbxfiIKUvNi36C2xoIdqMy2/5jc=;
        fh=qFd9LqQgPQrdtEOzNTavOVjFp0drl4iXpNiUxF+7Dj0=;
        b=b5y25/BwoLOAHAyqcI1NtMxwVbn/LNnYPpP7lnqUh8aLNoDKy4Q+xHs2ZQF3UlrxqO
         Vlir1WGg8soL/wgiwe9F4+ZuoR4q8JonpArZQ8Q/+gdDlJ/2c8oMobcEDMoWuC/Mtzq9
         OmldS7yFjYsjEn0W8kWe79aKMsOu+a01k2+vtDxklqrIrU5v8oV39RzqMfL9B/sPxLqj
         Px77ILUS0XLTv76J6u3uEGZnWfohcFLl1sDhSXPk0W/HvvV3cSkSN9NIl7KA6bav41/z
         9kmy6YOGZsh+k0izvlV42PY48XKgCpJaugUYIKN+L2u/NVwuER0GyP0Y42WVpSS963yC
         Lh5w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774489997; x=1775094797; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OkQDhqxdu/VghGhiJbxfiIKUvNi36C2xoIdqMy2/5jc=;
        b=kpjimEG613aRxiPLMFUBgCiihLNmNQyDlMVfFfnlj/m9G4dgGEQ6IWzQFW6XbwGnRj
         Se5oEoxHhEFcj0m7EdT4FI0vpXPeOgwLRO3HKOQYhsz725JeaQaXNZdl8ahngOJFoUd3
         wKzaK1vNvTnLIv5yy1QdgZhbL2QJzphtM03dK5/xpiqVEsYJnf5eszbOiPmKg0Yrh+0b
         7DPgnT6gd+uSP/d83A/hgiJN/nm3AY+5YnGg1V00o+yB/fkoveThe7yz1GEUKPLuj4mt
         8bD0aBUAdoxM44QQNaXjMBcJaSzW+bhTMkn6QfD9R4fscuPzwFt8SuxzTAfuTes1L6rE
         WTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774489997; x=1775094797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OkQDhqxdu/VghGhiJbxfiIKUvNi36C2xoIdqMy2/5jc=;
        b=jubqhOPIPd13lUfJWfabeM4gWUgRtG6SCihLmdJBE8TmXblJ1mRvJFpi95akyFfGub
         pJgDZ9czhIGcdxempsCTPXeHy2yIDtsHBqCUj2ee87rF8htOYJdnJ8xTZGIIZgS2duft
         VIfxzVFNoUWL4QBRJHxDtYdjjT+f8w0efo6sdCWfzfs1bvB7dbrrbVLrFj2MPJTFMtUB
         otKTeJIwxXKXuksQqitCRDhKINeDON9m/TctzNfOEHtjwplme37+8d1cwPkOhZXo3DW8
         /afE67X3yrQ6798YdNIl6D14mK6VuyVA98idMPW7+UqG3NAQphR6Uz7N9qHumWjI3QC8
         XOdA==
X-Forwarded-Encrypted: i=1; AJvYcCWZNy9xAb5xZ8H0OmFhQ2OoP70H3uSL6pbsid78tfDlrd3k2VAGPK1CzDzuXOshPSF/xWQvDLf1nofaqizuayWa@lists.infradead.org
X-Gm-Message-State: AOJu0YxmhMYdkAXO0cXXtC3klgnMwGISyHA2p8MVzxaoO7S2vqxdwf+p
	QBATzXXmMq/hBkuYRS4NSZZTUgEIakXCJ7LBnGG6Bp8fZ7l8K5+Ulc0UJeo65DX/OOZ9gEMT1Lt
	9xBbbsXtWTaXmFPYBqqkvw1tVHukM1iE=
X-Gm-Gg: ATEYQzzanWJaXr3ekkYPP0fXLjm42PXMtrZ2AtesMn2Nb3cGZWqemgd7jN+5o0steoF
	EtUYhkIDH9KWeExIwAvXUg214R6Z/UG7dunFExlWf19rKtfkbDcMKHLya4veUNItzKNvnglEU2E
	7RU0Ke0AY8p7f0os3W20+pqe8ALRPmA+S8aujkUdM4iyqNxWrxYS+bvEMxIE9zFhj83lxrPGF+s
	wPz2rgxrTeVeQ3yNXEcsX4lZsZLKXce1szz05lWmTXS6HoQ6wUZbN//ax/krWeh3Sw1p1jURE7W
	b30m3IwsnSEP7/FOh0ooZJ87C5yE4pV1QOWtMYOnK8b2pB9c9euv+iMjNgmI/VFmLeDSFLqx8I6
	gbZThsA==
X-Received: by 2002:a17:907:3e0f:b0:b9b:155a:6f92 with SMTP id
 a640c23a62f3a-b9b155a77ccmr272420566b.7.1774489996810; Wed, 25 Mar 2026
 18:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20260306044536.149204-1-rosenp@gmail.com> <20260319220901.GD950375@killaraus.ideasonboard.com>
 <CAKxU2N856yYXURRf3td-_RCpe9hyX=zAy3qtD3ki23RjgO+a4Q@mail.gmail.com> <202603201114.9A02FDA977@keescook>
In-Reply-To: <202603201114.9A02FDA977@keescook>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 25 Mar 2026 18:53:05 -0700
X-Gm-Features: AQROBzBSJyDOFvefMdXxKt78jroAsA-q-37591igukparmS24ZzPgm6s7TLFqAI
Message-ID: <CAKxU2N-eVyzunEC1PivSmRF9xctOF2NZHDJyoVUMYHHXCN6qoA@mail.gmail.com>
Subject: Re: [PATCH] media: nxp: imx8-isi: remove kzalloc_objs
To: Kees Cook <kees@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, linux-media@vger.kernel.org, 
	linux-hardening@vger.kernel.org, gustavoars@kernel.org, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_185319_484429_55B85D9B 
X-CRM114-Status: GOOD (  12.20  )
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

On Fri, Mar 20, 2026 at 11:15=E2=80=AFAM Kees Cook <kees@kernel.org> wrote:
>
> On Thu, Mar 19, 2026 at 05:11:22PM -0700, Rosen Penev wrote:
> > Technically kzalloc_flex is simpler but I assume a devm version of
> > that will be handled in another treewide commit.
>
> Yup, that's coming. I wanted to get the "first pass" of the base kmalloc
> family converted first. There are a few classes of "kmalloc wrappers"
> like devm_* that I'm hoping to convert to type-based allocations. devm
> is next. :)
As an aside, I recently noticed a pattern of kzalloc + kmemdup_array.
As kzalloc_flex is basically, kzalloc + kcalloc, Would a kmemdup_flex
make sense?
>
> --
> Kees Cook

