Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0359FEE4C9
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 12:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YH8/n97vsAqRvTzgx5109fU+90/7iudpKQTfhUrv+MI=; b=K3EiM2uW2ScYkMiT9qbseh0DFQ
	VIRTmtBqHQ5p/nPSVDtITnY7Z11eK3fsnaz8KzEoHqjLMKhHP1quVJ9QzEYKy65n2YWx5J7AWHhTR
	8BEq/8DpJkWYk2fbracw680hhqsjHCHX0jWkOhr2tNMSEuCBzaYX5imfZB1xOY9EeioZjN1K/CYBv
	myeV9c+VunIOw2brl0r/KzBKwMyqEkfuY6K8xQ6CO25+/Eq16o+486391yR3NMo14Zolxkwl6FIMw
	kmeQUNgdNLNgFijZg1GmUM8Ac3mzRLsx1WqGz1285gWLt2Ddy9Z1q9Nj9s43SbQ9uwFlIOLAjESo2
	hwTmPO9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwJEu-00000009orm-1KMv;
	Sat, 28 Feb 2026 12:16:08 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwJEr-00000009oqr-2bba
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 12:16:07 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-3870cbd6c40so39264041fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 28 Feb 2026 04:16:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772280963; cv=none;
        d=google.com; s=arc-20240605;
        b=ST1y2LUL2h2vqBXWkRMo0NxwbXyPTTTJ94BdCYYlTjKOScVGMXD8ztLeuQBC4txE6D
         coMnN/qkBLQ6wdxld3T1ECdbOWuedQJ6xq0D2xP/qqxZTnp09l6ot89kRWa8CghSaKIX
         oiH/d1Mq+pw2ieyAlxa3LwkaIdx3U1hT9r/NLXSQXKiz+XtwkpyL/teR1wAwi1lW3FDS
         Rt73z61isvkZMO1nMYJBIrwgnMvxj5EWp0NZrQQzitHEBEReJL3F0owa3km66vcUtBp5
         CmEjBfDJxnu67/bYe+zbY3UvzAMmN4xatAmNz5k7pOTCmfCCiX5FrJ0ZKtB2GHh3HRqS
         Q7dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YH8/n97vsAqRvTzgx5109fU+90/7iudpKQTfhUrv+MI=;
        fh=6APAXpAWfwFlWKgp39R3bU5zWckuSZyQCujTVG34FPg=;
        b=bRZZey95fKFvBGZEjyiSgy0pz7mBiXj3wqQacohp5h1arCQPXZLwodRvtJlTgcnzEE
         cmWH1CwbqHD9JuQKus6nO4o34AjDrycjf4D5pXfLHNoNC0b19RQrVXTX0VmzlPmr3bzg
         1kP7XHqK0zrVPReghJEOtqJ6LCW/jjoksjYq8Py/uhnFG2prgifhgOVMd3FrRlKB19cU
         mVtyFoCdGx6jCj2buyUxBtWbB9UM4iAAQRRl1IsNlTpvclD24G9Nf9RoUSIKigK//8yg
         LGjgNFcgRQLpkDn60N0l4V2nKGDSd0bFh8xpG+D9lZCMWyR2w0ZoGhbg4XJ+EPX3drQ7
         MCgg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772280963; x=1772885763; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YH8/n97vsAqRvTzgx5109fU+90/7iudpKQTfhUrv+MI=;
        b=AdD6x39LTIQg1X12o7B0Bw6RzfBnvzqtPOSs5fKi9EyjI9jfLOMn7Ru7DfattlBpup
         OiGapLiBoGpKYZAeL/awTb9BZWG6y6PjfL98xTLqNm7sB85vzCuXdRqlV1cX2IiZ/4rY
         DFE2SYkRBngfa/SaJRePgaWS+eueC6d85CMBYWRK+TeLx5LdNMGP5mzO7tl8Ho3vskwM
         DqlU4sVsDAYnrw9A4I5Hmz39M99DD/AHLGHhSskuoLO+N7lqsPh9564SHcgdnUslgbt5
         O/m59Dg6ts5tUkdjz82QYyi3yBMl/uL+Ydzd5R8ADj0tbDK98O535xgBabSVB419r5tT
         sStQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772280963; x=1772885763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YH8/n97vsAqRvTzgx5109fU+90/7iudpKQTfhUrv+MI=;
        b=D1eIanfe+NKo+RxiByHQ0XvqJfBK/vFrSo91CG/dnL9ICt0Lnoelvyl2hQABwN/YlL
         Ng+sKAYr8KAfY18/TPqWS5mf07yd0L6tHoOigtiuf1WJkJEnYwAz6pdBWVJdCDA8I0tr
         TXspiogN1HrzoOAxqPmP7P1jkcLjiTOfPKu24tC7QO/s4msBQeG72FxUgjtoAnGwrmSY
         xd0U0jk3XB8HDhg6lRgfnhSYKlVQIJ6uHC+q9db6BL+HdjyLHJ5oOfK5trwkYTrh/Q+M
         ZXAc/aeDU/8QiGEnBUQbuY4zWPClkX84wKfV0oxSciIpMSM2kFIUDDyeLu+PL2trSKbv
         v5iQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSGOHHXNi0dOegWvhGeGlD0VBHede/WTDDjRtkJG+DKcrczAAnZuF6dRZHeO8EC4y3Yae6at+hYBlUxFBHPxSs@lists.infradead.org
X-Gm-Message-State: AOJu0Yw05d49lXtRstUp+UqFAVvF24ZPl9m3wHXBASL+JVCHe+4mBn4o
	ouBkN8T41a6T6N0GNV7fZD6nfhW2k5WsSrNPBrmjmaonAqj4IEIIVfADpgcwkaZ9ap+DEmvap/M
	ePLZSovD8YgyXa8hxfkuMrStuMygbV84=
X-Gm-Gg: ATEYQzwzUYneFkAktTc4b8vO9lJVVv8dMzkfv4IAuSRRKp5zJY1zyrhSOYAIeR6EhZ9
	uG/VbXIl0+NYWBkgQRN6D9WyUawbRiVIiyNyotQ0fn+B2U4AaEq21mQKAcv/Ek+uHe5qX1HIdC3
	6df/lb5BOkvYWdGjOw7flBpxKGDbx3TyCa4VHoHALuhxzTdQX/kXQMZSYgRVZNpPvQhiSDy4dPm
	xBAHZfN1H3DiVlr6vFt+LbDplhlEoAmH/6Ubk+CPdaqFF697fVIXB5l4mtrgQ4CkgVtq1KgSqnj
	vFXto1W3DXXRLPPoO1mEalU7TJLxUjy2bjKmSvauObzeacn0GewXxNXQr+wQKzweb2q6KiVU
X-Received: by 2002:a05:651c:25d1:20b0:385:f235:51c9 with SMTP id
 38308e7fff4ca-389ff363773mr38322271fa.34.1772280963065; Sat, 28 Feb 2026
 04:16:03 -0800 (PST)
MIME-Version: 1.0
References: <20260228013257.256973-1-festevam@gmail.com> <2819870.mvXUDI8C0e@phil>
In-Reply-To: <2819870.mvXUDI8C0e@phil>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 28 Feb 2026 09:15:52 -0300
X-Gm-Features: AaiRm50iXphLt7SQaVdrv0ixM_J83T886mNYRbF7vgl6z1M99dJ7PFfQrxlgUko
Message-ID: <CAOMZO5CfmS2UEd8JwbR7WHRhTVR4m6cOZUBxhXWAf2zxNhY-Fw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: rockchip: rk3036: Move PHY reset to
 ethernet-phy node
To: Heiko Stuebner <heiko@sntech.de>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_041605_682293_FE3CF911 
X-CRM114-Status: GOOD (  11.75  )
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

Hi Heiko,

On Sat, Feb 28, 2026 at 8:40=E2=80=AFAM Heiko Stuebner <heiko@sntech.de> wr=
ote:

> please don't send patches that "simply" fix devicetree warnings.
>
> As you can see in [0] the driver uses these properties currently.
> So while this fixes schema warnings, it will break the actual boards.
>
> So first of all you'll need to adapt the driver to handle the "official"
> properties and also provide a fallback in the driver for old devicetrees.

The rk3066a-rayeager board describes the reset-gpios inside the
Ethernet PHY node:

https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/rockchip/rk=
3066a-rayeager.dts#L155-L157

Is this broken?

Regards,

Fabio Estevam

