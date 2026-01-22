Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4884C44500
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 07:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNL0d7QhHFBGNXNa6G1OZ6wYSQh8Cjk4oVuGSla53Lg=; b=W3B5wnLSju3QBx2PBVaT6Ddx1y
	byGDjDFSX9nCzj8GLoi3n7eBWoc3WFgCwPuLgqBzT8TsjFiYvbRV8snAbjwmFaR9bAuX0gsGbHjEU
	Vy11yyBuZ2RLnFSLB+aadAHvM1Ro3eIUF6WyJ4ZUnZ5dJg7ZxE7NWTAWsmBp4UTwS4sy5Gv/Xff82
	rqxb9jRyMcojOqjyoe5IT1bxcMbYs1mKdoLyJh2Fe+EQU0eDrvWzpJkKLaM8bcJWJhS+gldWyNZdh
	+TbGunzj7LK++RgGgEd4fu5d5+i/TCX4YCDCq78L/T8UaN5gwh17luuogf1AfsXKpekR63xxZr8HD
	UxY206Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipOw-00000006bZW-1RtF;
	Thu, 22 Jan 2026 07:46:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipOv-00000006bZQ-1PMm
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Jan 2026 07:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FNL0d7QhHFBGNXNa6G1OZ6wYSQh8Cjk4oVuGSla53Lg=; b=EOW/TjOltdlbCg/WwTYi951elk
	v8xJByinzLzonSxh/f3qoy01MGf9RtQ0ZtGzHgJXPlfMgfrRKtq/pwyjAMz8o0sVLZq87dTyrgvfi
	62fBrl3P73SZX0BMWLLsQjiKja1fE9epJSIQKj/5Ead8EWz4LEbcdOA2zlSUqoqC/WFdQO+W5NpzU
	mZrQhW9vsUZKrby/BwyN4A8YbRHThNSImEHALasMSAXo5+3YFWpoo/ObGydBA+kctyLVv3NLY8Kq+
	P2ZPPPuX/g+SBfIQHilB4SVljvEiptCT81LhPkajxpTyUasknq/zp8xrkjC9CAP8/H4QT3o6liNe+
	SnGkfCYg==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vipOm-0000000HTvx-1Wem
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 07:46:38 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b879d5c1526so128784566b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 23:46:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769067994; cv=none;
        d=google.com; s=arc-20240605;
        b=LQsPUUZsHXSQ9zzXDieUs+eu8l1goy/IfQf40cC1TMeul4JhyHiihrG8XgRdzPSDj5
         NxMjtb8MU3AM4fjUAX+ketPh13Zph3dXYCjrpUj3gUTqzcpxsKeiOGXb+9XMCHfLyG9s
         xJSTLAOSFrOHhsHJbtZaIPwgTVpRG6Svf37n+dQubf8KTmEraq6rLwHdAGt2cixVzN0D
         Xol5kY96HNNUxGpQIVK1k1iph2Nxp81eovzybNjuW/1YjUM2ZaCG4m8lTEi6N3hekSNa
         wLnjDYZphEhG14OvwRAykyfMyn9OHURK1BwCdqvoKRkRdUPIHO/eO291I4MCSeZh54de
         SnNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FNL0d7QhHFBGNXNa6G1OZ6wYSQh8Cjk4oVuGSla53Lg=;
        fh=ty74bPTjfmHggXsFWuITtFDxQ+mxgIoydqkKuxxqa5w=;
        b=YwQbIw3HUpjdEsvNtkxUbl/ZoXxfo3/zUhA0DXe+HXz0mxN0fyCYsTcjge1encDEJ+
         tIGzGIM65UzDXnTFrK2O0Twnj4c+BPPpsa6Ev2sXh8jAjj7kmiV+R7XYNL8bLhJd80+h
         sSvPO3xEztdkv7uUTgIXcyhe9K909Z/KzizdcDsXSq2LybU+SjWSVWq2tHQCotrG/CU8
         l1s2cwGK6y2yNYOKPVakUqk7MB1pcJ+vCDsA0NVg3zNlYvfTWrA68clYtKuHaD+Gyrqz
         yUCLnHvJ6teA7q0I/PuQcc4XSmnGQYjIa1c7WlINmXdLLstTtG5OwGTPEKsYHItL5yb3
         e5Jg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769067994; x=1769672794; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNL0d7QhHFBGNXNa6G1OZ6wYSQh8Cjk4oVuGSla53Lg=;
        b=jAuTc9qV7VaR7/79wNZl5ncbpruguWAp0M+sgoDboQMuuGoEGRkER3mqgebWFXRv6k
         l+q9eDXcWV9aWIdlORwxGumGjHy3oGdi/ADIhkmzXy9G/ylIzLFqzXrGXsAP7IxRMqNe
         a/XpNUqb9kUY1/CuqOBbfU3edBQnZI8I4Ncgi91yewBbgfQMBlKt+WjKC4l9Q94hnkGP
         8pEF0LsvDr+SFJ/FAbNSspbLCiiCghMBkhEyVgxbZWHfBMeP4VivGBX8T7CS8TElH+Fo
         AVc6/lDCj/E89Xmme1B7QRINZhDKpYGz8hu5leKOCaKllFQk27A+b0vdwmINlZd+nd7L
         FJgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769067994; x=1769672794;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FNL0d7QhHFBGNXNa6G1OZ6wYSQh8Cjk4oVuGSla53Lg=;
        b=cO/i0+HYyjTf9fx82+4ztmcxU7jtLQs/c12NJtDwRokA4HHLUL/kwqStQCbPQQB70n
         MiG88ZmdfvFonrW01h6TppLpKHy39Eav+Tnvrk7MmL2Dk0Oe2LBFB6IY/1xcPOQTv4FK
         CqMD8OMEN3N0IXxKi3jCr+UwTzAfX+Qheg12T59e7SujsSwlp8ougEZfoZRQqptrFdKJ
         NEZ/7xGdvMPChxSHBEQBtLbt2PvXuZyrKHMepL16HmuX90nEl9xEmzyTct9lC+o2AJky
         amAOPnFY44o2bk0WinW6Y99D6JDvQU5OUK3kyJafLwnUEh3y+xXI0gsfq0/QhK7xLkC8
         +KBg==
X-Forwarded-Encrypted: i=1; AJvYcCVaLHd2yxLjXyIVymkQR+UnmQAHfXEznADtJTBADEdkZ370dZDyVxQpptVatusl7+pYKW8syaXkAT2C+Vp7o60U@lists.infradead.org
X-Gm-Message-State: AOJu0YxQWGxo4ZYUvZEvZHB07V27BUBU5yrcIgnf86Hru1Hlzn5XIYCW
	FEG97t9xV4faqNP5Wd8q1NtltZhSbxSZHOXmcp5Verx1l0hA2b/6oFIc+J+/2cg85vyDh16MeVK
	nNM09e2PXCPFEPF63BNpKqiC0oLLNf8g=
X-Gm-Gg: AZuq6aKy2VxwrbeMBHfrcttppoZmfdsaJ5WqdyiqSLhXnXmE1z+0zYDbCz5xPSiGkv7
	LFYGuDoYS3+cm4u4f9ayYD6mShq7HZoRv3x5ZCCZQVt0rDg7AYVmBrBav+YwFuuyMgTznRTNjFG
	uB/KPsVv07g1lElLJwk5pig0fZ8qytQb5Lu0CG4P/hpBsx5KmLqeh8x33+yVmGnSQiHtL9IHEoC
	UXSHGhvz6MLTxYhKq8YQpKbrNXfnfnERO6/d+qmV2Kr2GRpWC0xpsl3PqdUZsmZnGdFRe6usNil
	eIi7v7kFFZW7NOP0m2LfyrdWky4z10idoIHG3anPcknsGuXCUsucgXIi5Cm3oXOPq3k7r68=
X-Received: by 2002:a17:907:3e93:b0:b87:2630:e67b with SMTP id
 a640c23a62f3a-b8796b83edemr1815379466b.50.1769067993696; Wed, 21 Jan 2026
 23:46:33 -0800 (PST)
MIME-Version: 1.0
References: <20260122010516.1200630-1-florian.fainelli@broadcom.com>
 <20260122010516.1200630-4-florian.fainelli@broadcom.com> <CAHp75Vdyfq_9sCY0t8TXst6XhcOM079y2zYprSZDX4_GTJL6AA@mail.gmail.com>
In-Reply-To: <CAHp75Vdyfq_9sCY0t8TXst6XhcOM079y2zYprSZDX4_GTJL6AA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 22 Jan 2026 09:45:56 +0200
X-Gm-Features: AZwV_QhyFWfg8ea6FhZDCZQ9gQRL963lr5eJZKYpigdLJ823CoaZ4X1140v_9r8
Message-ID: <CAHp75VdrWp+RosNFP+S+1iSYrM9KmZ6hgn=bLV27+26C0GKH+g@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: brcmstb: allow parent_irq to wake
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_074637_024714_F1B4D928 
X-CRM114-Status: GOOD (  12.74  )
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

On Thu, Jan 22, 2026 at 9:44=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Thu, Jan 22, 2026 at 3:06=E2=80=AFAM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:

...

> > -static void brcmstb_gpio_quiesce(struct device *dev, bool save)
> > +static void brcmstb_gpio_quiesce(struct brcmstb_gpio_priv *priv, bool =
save)
> >  {
> > -       struct brcmstb_gpio_priv *priv =3D dev_get_drvdata(dev);
> >         struct brcmstb_gpio_bank *bank;
> >         u32 imask;
> >
> > -       /* disable non-wake interrupt */
> > -       if (priv->parent_irq >=3D 0)
> > -               disable_irq(priv->parent_irq);
> > -
> >         list_for_each_entry(bank, &priv->bank_list, node) {
> >                 if (save)
> >                         brcmstb_gpio_bank_save(priv, bank);

> One more thing, how is "save" being used? I can't see it other than a dea=
d code.

Ah, it was a preexisted parameter, I was under the impression that it
was just added without use. Sorry for the noise.

--=20
With Best Regards,
Andy Shevchenko

