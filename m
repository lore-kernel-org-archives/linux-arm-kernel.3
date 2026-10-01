Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116D7CA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 09:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vYNfNqLHkMdvHAs749vvVhbZflan3bjWqgzofQ0smdo=; b=eBF/pFiZhqyN0ejnemBfPeC7vP
	x3vC279paCbWbjnlM+iqYiDwIX+MdivR2Ny/8Wg/S9MSz06GO3SBdTJQUoaL3p1HaYHdppF6/enqF
	cssKxO8ZCfAd4hfYgVl+rjUBFtqt090PM0+IEmSQ7hr9hgmke8C3fCDMbx4+pOXYInO6kG6pnZvvK
	XYFM03/+oMFvEnXa0vbKk9GjzvAkBQOSJxLbB0mUcb999hDw2+Cks/0B47H4GFJJbOJC+/9S0Nf9+
	fDCBZUvcwejgY6dVDlm8qDdOjV+Ixs2JH58XA3I5gEx4Sa9PpbWZLxsWx2ML1D0IY6oCdbwNPRBym
	/imk5zEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDC8-00000008NuY-2NGo;
	Thu, 01 Oct 2026 09:35:16 +0000
Received: from mail-ed2-x0c.google.com ([2a00:1450:4864:33::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCDC6-00000008Nsw-0giA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 09:35:15 +0000
Received: by mail-ed2-x0c.google.com with SMTP id 4fb4d7f45d1cf-6acb8b78d6cso4171994a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 02:35:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790847311; cv=none;
        d=google.com; s=arc-20260327;
        b=sYSEdYr8VPHAzUIQeedqVr34d/bRI12V/O3ys2uVSI9ciqcsA9hxo14KTNUizwQRw3
         KztNlr6GD8O0P69z2lBYGtXBIQYDPeMWH6eVb2WljaiUea4wVYzlvrN6OukO5Dt0EmLN
         34Fugw34Ddre+AR+DilOij0QtUsmSOhwpZgQfVcBlUBxKpq0SYoteapblqRBui71Ctub
         8A5QrZnGVOtiSEjgaqyDGkUkEgjI9v5D0w+z86cRaQojSX4sXzTdhwYntU0fiwipYH0N
         ohBjWXAeLYgAg0qkn+vyDjFsi77YdslmEhF9XzBTyNcBSJb6YJRCwt5CZs0kcfgHp0lE
         w0ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vYNfNqLHkMdvHAs749vvVhbZflan3bjWqgzofQ0smdo=;
        fh=/mJAT2udrbZx1n7fz7JLxMW43ss2fW4131uinpKGS6k=;
        b=E/DIH4RbJbh/O8eFZ9x0LKbsdlIhHfarwUSzYre9y7xnG4UFocVqwerlpzVycrVj9H
         lf8feOak6T1iLuAtmV3tPzN5QYFprUXuxC7LppcayrTUGcsX8EDzU2YqKPTvtSucbeLG
         LItACGmCRoqchXdTp9QbplqbN++FWWc89Unmb6qcaVsjkXGQYD02rBv/yQBcEA4eJMHq
         5XEs187uoSQWfqRv3SdMxiJbW4F5QKPfVTjLpLvkw0JJCghUUT7qQ6MFDStOwCXNROoU
         9NL+t61z32zG0jl4My+oi08rZtlEULXZ+5qj0dBThkuUxGVKI7yvxmMQMtDw7/gjszl0
         qJZg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790847311; x=1791452111; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vYNfNqLHkMdvHAs749vvVhbZflan3bjWqgzofQ0smdo=;
        b=t/3SlqWbrEq5S32QeSbocHG4FUrVocmb3EkF85OAd9eJeIbeGSyiGbJECiCmE1pPgt
         jaeuJUMk5JKxXN0fJPjz743hfXbLfDRLKtrCLvdiLyzphO141I+W4dWv4yMX1ucm3kVZ
         PMepLCzfQR1Y5u5dc3fD6GxQ9W1s0InDZSro3748ATtsUuKP2uZjKtjMIkFzpioe8lyY
         JJRJTlgMyAFp5XYfHJkUGJvLCQ6SWrmIyM4rQqBWisgsS2FteN0zkDq5bh/AaYOt4euM
         6eaHGiT9C43dbPsGHvmW4uJzlsb0tsyPBaOutC911HcRt4nBu00Y49ufjZDqSwMmkUkb
         yePA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847311; x=1791452111;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vYNfNqLHkMdvHAs749vvVhbZflan3bjWqgzofQ0smdo=;
        b=1TpobSrHCc2yF7I2FO9nktLUXH8NTDbYvAdi7tvjslBzfEnbM8WXVOQyNgqXuGRL2a
         u/Pkk3B3kbL7ZVUyloiIZeLXuFq+njz5OXzp8b2CC6Sp2zcUWuHHKzDhIZ1WFbaSeLKb
         XbnJOyYB2aurh+UjojSeipueukJ4wNcPbw6TTylj3y0/cIeJfiJ0kjkbccrmp2gmdJjM
         I2DLB8rcSlEXymptjzRo0j4lgv8Bvcjo18FTl3JqDz6YK1qjRZ54Z+iD3EhFgtK32cpl
         oYbXO2vat+pTysdG0y/quy/ATyI+cD3FQ5a1b4mO4dBCyiHqYoJ3e22eEJh1TLUSlyFD
         ZLdg==
X-Forwarded-Encrypted: i=1; AKwUvBxIqUA0KN0OdvOiO/wEpAVJV1B4mygPma0kjMmgQ+uG53aNPQfCytqcawJs6SqDbBjJNZ+f8+u+eJDGGdr8qu32@lists.infradead.org
X-Gm-Message-State: AFq9FYKF7/aoyyhFrNhY3TUCnKxzkIAp+DNOB43Sf8XgnZHbkezio+aV
	8YntLVA3Xu1YI3k6PEBxCBxXoRGvOlit1Lku6tMHyoZJEUWo/BKLAZ2CiqwNIjQChuqiZwAZa1L
	NzJpe47pchvCQDQhlhe0Z9QVVv7dXDqUrPEJHG7J1oQ==
X-Gm-Gg: AYBFou130bCmk+w7Konm9k3znF7WSsy3THRiNa7hN/tQ3fm8UePQmhIRlVLu9ICP4ej
	jM7yxymNvXNUUWKpuwdA4n2Xs7KCKGh7eymnEuwk4ZJRpmRaVNm5rwOp/ABMc2WNm36Fx0SqVhy
	ZiLSYzE2wiRIzcUQaZAaQ4THl6DudBGA8i9Sk3PoJyJfVu767pjKwagUSdXbqizS9XDMESdzBL6
	aAgF+QFB3lUmXgnKb68VgWYCGuRNdzjmqOdmQEw3HB1Z2nLpPvWQZCilpv+pOZl7nAKFOmQ4PI5
	A0awvtoFzyJ6PHNS2rwJwHdY30heCM2ha/P4aVKe/hguqRP9d2zQgSR2cLQttghKZ9xGaA0ZVkF
	hy0+WINWwWjmY5Q==
X-Received: by 2002:a05:6402:c4e:b0:6aa:490e:5506 with SMTP id
 4fb4d7f45d1cf-6ae1996fd65mr3129163a12.39.1790847311405; Thu, 01 Oct 2026
 02:35:11 -0700 (PDT)
MIME-Version: 1.0
References: <20260929-pixel10-initial-dts-fixup-v1-1-b304868cc3e8@linaro.org>
 <CAD=FV=VAiHf0-9sPvgGKji4j47rL38Ja3S2yiEfztubgZqBpjw@mail.gmail.com> <e58235f1-2c9a-461e-8231-8729eb3e9c46@kernel.org>
In-Reply-To: <e58235f1-2c9a-461e-8231-8729eb3e9c46@kernel.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Thu, 1 Oct 2026 10:34:58 +0100
X-Gm-Features: AclHuK_YpgKbBYxkFtRgH6bLpQ_dPXQcVCNkRBcwgfpIDgIy_RrFnu-Dzk9rMWU
Message-ID: <CADrjBPoppW+tAY3QXgawcCx7nvvSvWkQDKbP9R4r_4zAU3vWGg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: google: lga: fixup #size-cells DT warning
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Brian Norris <briannorris@chromium.org>, Juan Yescas <jyescas@google.com>, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_023514_242142_DBDD6783 
X-CRM114-Status: GOOD (  13.66  )
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

On Wed, 30 Sept 2026 at 06:22, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 29/09/2026 17:47, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Sep 29, 2026 at 4:11=E2=80=AFAM Peter Griffin <peter.griffin@li=
naro.org> wrote:
> >>
> >> Fix newly introduced DT warnings:
> >> Warning (avoid_unnecessary_addr_size): /soc@0/interrupt-controller@588=
0000:
> >> unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" =
or
> >> child "reg" or "ranges" property
> >>
> >> Fixes: 80f23487d554c7 ("arm64: dts: google: Add initial dts for franke=
l/blazer/mustang")
> >
> > Is the above git hash correct? In linuxnext, I see:
>
> Yeah:
>
>         WARNING: Unknown commit id '80f23487d554c7', maybe rebased or not=
 pulled?
>
> I'll fix both when applied

Thanks Krzysztof and also Doug for noticing.

Peter

