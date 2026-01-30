Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFE13D49C77
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 08:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DstjTp6u8Wd7y76xr8vc9Pr66uNL9CypP1+PauCth48=; b=Ia9FbiR1kfqxv3f8spnEtP+1ah
	X59fWM4MVw9r0pLjoYhiUqzJ+ebTz3goJ30+VRiKP9rRnCViR2dWglEfvYTv/Eumc7bUh5WO2vR6y
	fe/R4V5YhMUqxHxd/EsO+E/cKEB9IP6OPKIJi64YeK8bEHCiSh0PRQuK5SaJuU6Cny5iLX9j7P/S6
	KjC5KdWxuhg4NbKse37TV40wLfSnaaRO+Zld8l6pWCgK+IdBcUMFqDKWpRMglkoJ2kcsp+WN6cZg9
	8K4OR84G6kKPim5+89xf0qtdHijnXbo1YGu5mGKYg0E8FVk2ed/Y4EEbhaWDw+3dDV4p2PnfNGGpJ
	zP6UT7nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljx4-00000001Dya-2m8T;
	Fri, 30 Jan 2026 08:34:02 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vljx1-00000001Dy8-3aUY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 08:34:01 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-352e2c59264so1138013a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 00:33:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769762039; cv=none;
        d=google.com; s=arc-20240605;
        b=GeuN4QOj9yGZEYQLOTe3TedgOZmIP+idcbWMUNpNbzxEGzZoPSq0yhn2PCcvaZ6WNg
         uEjfvKd/5ekeTW6Oitx14byyd8r3VYR4JrNEqVn+EjutEwBGZTztESJK8JYt1pzN7BIx
         CEjqiQz5LhDFgJa2GIc5VMWWt7r+uOKa7V0IYM5ln9KUfzq4sSvrmVVxYLJk5B+iuF3T
         J7mJTinHYdH3OvdkgxudStdwf+9FBRw5Jt1o6ciJylk2VhqDwKj3YgqTnpniRv9p5Xws
         xt8oKQT45R+A7ADk3JFh3JUVjoSVl4O2XGOkB11gI4uT2nYQZpZRK00LD8idyYao8XDm
         iltA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DstjTp6u8Wd7y76xr8vc9Pr66uNL9CypP1+PauCth48=;
        fh=bk9C89S6rRzWjdk5aKT9dMapurTkVmZpwftlixTsHaY=;
        b=eSHjaXwSuqbmwrvhSoK1o6H4SXoubTTv8kGo1SfSybJ9Uau9cq/UnMDvWHvMMclV5v
         hGWuW7SHIMH0K9yhSVDGCsZEAVuqvfiT97qFQxatdoTR4qGel55ep1lmAWi33V+Uf5KH
         VEiXaHPsiBT6IgUdH0OZzf9Xu5bIqgNZyYs5qGjtYkURvLHwR3OUju7NdcsnEoRuszsr
         wm5eFenCLZ2MGn6HD+s+rQVyqI/TC876hYOaNbjq7CwnDtUPhOW5WmX3WLhTK1qgYyDn
         qYyLZm+Pbe/DvSc98d+nsR6oAOwSZoqzuh/ywp1RX+G3DIHreOoL8Nop1WQmgm8MaRVs
         UKqg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769762039; x=1770366839; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DstjTp6u8Wd7y76xr8vc9Pr66uNL9CypP1+PauCth48=;
        b=XjjasdLo6QnxV5ndn2QiRv46pWMtMVP+0QFgMemPd4MQft3M5WtGPT/Nyz2b4P80mY
         VKHEOxr00ej+CyJUOCYe4sjkfAdaPF9qu3AXPgo07viYMkckV+Yb4UXnSpfDaBYftWLa
         UaMctBCSDQyYjPr+xpCg0sjtygaHfBZdN3NAIqD+p4YXJCwmMmxTLXBwLUHnWHvd/9KM
         E7B6/wVtuZRSWw7Z6Mjwf4o/am8n0IXOQuRuND2SKuc3+XY9KJs5gjAvHoiRkTd8qZ58
         SYt5wT/9RNMKBp2zCrYoNAFP/tSfAOPYaXyMrh0Sv/zAh4cYzBDTSLYxCYvNnygqVKhi
         60ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769762039; x=1770366839;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DstjTp6u8Wd7y76xr8vc9Pr66uNL9CypP1+PauCth48=;
        b=sHq4++vBRs3Zuf8wkhnD9d+YdTQvFlbSE4MmP5+fNMyJFIGcRNk6QZSPUR3fvbloj0
         UrGrBgAKjW8q0tvjiqUKMGv61utlM9PKVp+AkUO0JcTFmBh2GrmyToucEeVHWfGozfKZ
         SqzKZKpt6oyy8qQIV0jAY67bPWbiDW0OyWpHDJxK4RqrMRCOH9jBodd1/gDEc2e81ToA
         QX6vwQlThgepAXhtaNCpBns/2Twn3r4OWqXbl649uJJ/L6w+0fqmucflBxVBabNOYSGk
         6JCkSGt7InekpDlF+qWcjYOvT8pqlXdDLW1Jdh4SbhFhLuYADR/X5LYzwnqXJdzGl9Hw
         W9ew==
X-Forwarded-Encrypted: i=1; AJvYcCW5i+vx7ALaFPk1JGEmfMyqZ2VTboWE2C2XpRml6QKgmlz/hOt6u7Xy7APs3IEC8v/eOlqft1SiwAkRdW06/i3x@lists.infradead.org
X-Gm-Message-State: AOJu0YydfNSxZoVYVUe+S7AeS2YZ+xGIwdG/amk1xnKkkkDuXYuAQDCp
	L3M9C1Lk+8H0GXYdSzfNFzzjtDCo8hYh8pMmI7suS/0yp6V+UfhU8gLfw5bpFLCzwoxG772UD/Q
	qZZIQ1cKXXR6J9gLe4j/loSOJiKfDddFarpVaDvU=
X-Gm-Gg: AZuq6aIozH6qRCOqZoMGHVZ8JS9djzawq2J++ecWVjEOVvydvLrgs8sRTW8uCSS8wpM
	FVfwiUAqdfdA64Ae6sxu9/TAlHOFe+45rg+XPvBUmc8b2nK4inieHTHsKGmFVgu4o4zhxGH9V/L
	tDmIzBsxydbKXNVCEPQSjt7LiGGyGDAMhYcNvNWZuyHLJu7FyOpbAU472ZTbyvBjypAJpMjs9LL
	blZpgwnJutkv7B0oJNmrRU0zrE7QTm7U265Gvf3hBT9TkR3kUtZWbJSt1J+Cib0f8RVq8aH
X-Received: by 2002:a17:90b:4c48:b0:343:7714:4c9e with SMTP id
 98e67ed59e1d1-3543b2dbfcbmr2065013a91.2.1769762038772; Fri, 30 Jan 2026
 00:33:58 -0800 (PST)
MIME-Version: 1.0
References: <20251219-yv5_revise_dts-v3-0-ca1d5a382013@gmail.com>
 <20251219-yv5_revise_dts-v3-5-ca1d5a382013@gmail.com> <4441e66d607fe442e392b8a82c134adced03a5dc.camel@codeconstruct.com.au>
In-Reply-To: <4441e66d607fe442e392b8a82c134adced03a5dc.camel@codeconstruct.com.au>
From: Kevin Tung <kevin.tung.openbmc@gmail.com>
Date: Fri, 30 Jan 2026 16:33:47 +0800
X-Gm-Features: AZwV_QjbYy8HAFQFUZ1te0gk0l1xAwC-03Aak4VTwnvQbs5Hj8-mYxy6LbRydf0
Message-ID: <CABh9gBe=OcM8ExpEJFYj+cwiohyDRCXrTyeHZqQoyfJAsbmDtg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] ARM: dts: aspeed: yosemite5: Correct power monitor
 shunt resistor
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Amithash Prasasd <amithash@meta.com>, 
	Kevin Tung <Kevin.Tung@quantatw.com>, Ken Chen <Ken.Chen@quantatw.com>, 
	Leo Yang <Leo-Yang@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_003359_897098_10254DA3 
X-CRM114-Status: GOOD (  12.27  )
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

On Thu, Jan 8, 2026 at 1:22=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> Hi Kevin,
>
> On Fri, 2025-12-19 at 16:09 +0800, Kevin Tung wrote:
> > Correct the shunt resistor value in the DTS with the hardware setting
> > to ensure accurate power and current measurements.
>
> Why were the existing values wrong? Why are the new values correct? Can
> you please add more information here explaining both concerns?
>
> Andrew

Hi Andrew,

Sorry for the late reply. I=E2=80=99ve sent v4 with additional details to
explain the patch better. Thanks.

Kevin

