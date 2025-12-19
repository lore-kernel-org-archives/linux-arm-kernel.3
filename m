Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06926D78785
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 14:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QphWmS/ZYzZbH/S6YvUllBIpTg8sOwtjoCLv/NTnnrk=; b=UmLoyJlu8zYLlmXui8TSRln5R3
	c8xosvcpQ1pw2x/RqH8Km2Voo5ysAMTMSWsKcNqh9ulxkPOY2hCQCOijaolvJOmJ2ksQmXA2tSvjf
	o11FlG2RvnGA3TzclLsk0Qm+P/sguy4V6PQbmC83cS8tlDjfH0yF2rlYujRPvhQm8ER1TTlnNHC8j
	CRjoQws33P6d8yohEKtgbP3QSdpCnMuAZw9U8Z+azwmi8i0HtHopR8TzMM6TCbSPLxizCcFqvPM4G
	3PYTDVrOO6K9dXncJPkhhSBTjUHFhmo3tF1NvzHVgE1rCAwb8HS8tiKw7QCMsGG8zxxDhRQD5tIdn
	HbjQIuMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbmw-0000000AS4q-03I8;
	Fri, 19 Dec 2025 14:49:02 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWbmu-0000000AS4e-1bxd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 14:49:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BBF2F60008
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 14:48:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73809C4CEF1
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 14:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766155739;
	bh=eniGh6DTvWohh9mk2+UnT/ZdmNg6vUqU0Bss+l3hteY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bMoPDTYZuXwKnlWgYq5uX3HcNGUGt07tus1CYLBl+Ip34PUxR48wDS8o/ALXLk2e7
	 27CRiHUVn6q6R0KXnYvkzaU82WbIHP3UCifluiMSo/l1ANE9AEFlsBWOvsEaT2DX5y
	 Fwx6FjYKurjN5vjD8GL+RkP+r3JdbZSiKipGqNw8IVtOuCKsFY80SaK875GxCpT0Ew
	 /laGcRa3tClA5iJhmaXeqCUfBxPibuqsyRcRM90epLorhHiwzaVhzKCuS0BKjjkmgN
	 O9m5+nVuceMinHZ/45u6U8/xzLg7MtGUVhk9xtyeRW6crU9kBszJRXrqtwOrgDXiAs
	 8wEGegOW/SWCw==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-64b4f730a02so2810495a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 06:48:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV7SFB3ED4+FatDXu+RzCpJMbZM9TlA+7NPyGYxZozEXu/uM+279pInmDEKIkUDGFKIKUre5QX16QKjVSrA0QQh@lists.infradead.org
X-Gm-Message-State: AOJu0Yw57NKVsMjO678+umQDhTE7syFR57LqlYkH4+I+CFh8Sonb+DGP
	b9WhgPAeTNM2kndz0wV9IMhFF5yZWW4lUi4WC18k+CyMDtOcMb9VlDOphtUPTfCdyd02QbVLDUh
	uH5WQsAWzPfwdnKv6Qf9/LhSPMANO6g==
X-Google-Smtp-Source: AGHT+IG+ykC6NOPLfFYyOlnaz6J9tC59ZbJlxBoiYkTe4mOfwTOi7sU8iMh8LX5z8dvxYbzWBLGPpJK5OYhgFYOnw+Y=
X-Received: by 2002:a05:6402:b15:b0:649:aec3:a78d with SMTP id
 4fb4d7f45d1cf-64b8ec9073dmr2296246a12.15.1766155738023; Fri, 19 Dec 2025
 06:48:58 -0800 (PST)
MIME-Version: 1.0
References: <20251216175914.2791200-1-robh@kernel.org> <aa064ecf-1714-4d40-8658-19952392cae8@amd.com>
 <CAL_JsqKdrN5UpUWQVQXpJjbTy1gN9_FhhwOoX6zVpG+zZVAptA@mail.gmail.com> <29b45cc2-e0df-4411-bfb9-cfe51ec4ec67@amd.com>
In-Reply-To: <29b45cc2-e0df-4411-bfb9-cfe51ec4ec67@amd.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 19 Dec 2025 08:48:46 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLYz8ZyCGGB_NjyrPdq0P-wjeSfwWPxu1kqCo0qbYFgbQ@mail.gmail.com>
X-Gm-Features: AQt7F2q5Nvw93FL2VWWRbBK2CqqdK6rBwdO2JDLlNaq512v7LrM-rPvX532g8Ew
Message-ID: <CAL_JsqLYz8ZyCGGB_NjyrPdq0P-wjeSfwWPxu1kqCo0qbYFgbQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: xilinx: Drop "label" property on dlg,slg7xl45106
To: Michal Simek <michal.simek@amd.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Thu, Dec 18, 2025 at 8:15=E2=80=AFAM Michal Simek <michal.simek@amd.com>=
 wrote:
>
>
>
> On 12/17/25 21:41, Rob Herring wrote:
> > On Wed, Dec 17, 2025 at 6:39=E2=80=AFAM Michal Simek <michal.simek@amd.=
com> wrote:
> >> On 12/16/25 18:59, Rob Herring (Arm) wrote:
> >>> The "label" property is not documented for the dlg,slg7xl45106. Nor i=
s
> >>> it common to use for GPIO controllers. So drop it.
> >>>
> >>
> >> Correct it is not documented but it is at least used in Linux also by
> >> drivers/gpio/gpio-mmio.c:810:   err =3D device_property_read_string(de=
v, "label",
> >> &label);
> >>
> >> which is also not documented in DT binding.
> >
> > It really should be for all GPIO providers or none of them. IMO, it
> > should be none of them as we already have "gpio-line-names" which is
> > essentially per line labels. I can't see why anyone should care about
> > a label for the controller.
> >
> >> I don't have a problem with it because I can't see it used anywhere.
> >>
> >> But there are other devices where label is the part of binding. And IM=
HO this
> >> should be more generic property.
> >
> > "label" is the generic property. Not sure what you are suggesting here.
>
> That schema should allow to define label in every node or some class of d=
evices.

I don't care to enable it everywhere. It's allowed in some classes
where the use of it is well defined. I don't think a GPIO provider is
one of those cases.

Rob

