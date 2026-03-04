Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3958EF8FF5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 15:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vxSWH/2v55NAFblNv9fIFlXwxWEhhmnEpCtyuAZg0R4=; b=VWvsXcBmJ4oMJxDWkhExzkpHfn
	BxEdRd5Ws44Wh0tFB+T7XPEVtv6VvWzLzxhs53o5V7FV6h2HTwj0tmf2Si2nLBKKwTNGNA65V1xUa
	MNwwHc/OrvLmdWCLu5y/TKLWRvmnVWundzOj3edXJ5SKAHWOhDPeF6AXSAzwro0h/gJCZfwIymmD+
	ON7/iD/7k4XZGEte4C93Yp8afLaZ+tr2e3tOQLUS478d5wpgX3r2vkUTkDMZMqApjkOT0uw7pT3u1
	SYL7taTEZoMrwSB5dHI4EPKj3Wr/16qhf8ZoutxooV53e3qV/0CrmxpNSCMP0VVvDC8DVb0HU5fCt
	vyrRY0rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnrC-0000000HWBB-2eMH;
	Wed, 04 Mar 2026 15:09:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnrB-0000000HWAf-2swp
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 04 Mar 2026 15:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=vxSWH/2v55NAFblNv9fIFlXwxWEhhmnEpCtyuAZg0R4=; b=Tg26dCR/IKhxG5BxhOfTDwwvhn
	ZCsJ28ILM7CL7aSjnAw76jMUeESXRUxnB6Xqt33mZfd+IIaTKsoGrZM5PMrvmK5P+WLgZ/UgifP1/
	uoX9ssw+ykmiQLY/xPCEjpbJJ2mHrr+vtybtIDr4vcMoC6KcgSel3AjNCX+CSXgfOqOT0om8ou9kH
	0+vTU2FSCGZ2XGxgwzUAAJehGm3A0/ItMZ3RJ83xk+YAGR2S4ACISuW9qwwtji5iaDMjA0WeZJnJl
	Q3KQ+KS09hftGCnUOx4rSjGTIiJiVtA9e1VwA1/nOi36OjXWQaaXeoyznqVqlJkic5H0jXyCDAHgp
	sgteUukw==;
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxnr8-00000004sw2-2bfg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 15:09:48 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-56a9a7e762bso5269026e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 07:09:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772636984; x=1773241784;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxSWH/2v55NAFblNv9fIFlXwxWEhhmnEpCtyuAZg0R4=;
        b=QeXDhgE3mlEpo/sYP+71hcDaFJIvJ+ouwvN0I9FApejgtSaMhMj6Vi2uUCeSoKXBUa
         W3s/QmpUOxa2g28nD1/M7T41BWqKqh79du/1ho7HdfAcdJy8Ya4qkZRmORlkC41e+7+V
         gA7CcMKy2qXxkUrWJ2THPJwVtQDvsg56GRZJ8qXFEloGpiExWwVe9ZwlpY9Vh1nGdFTV
         gklF9XfEo1Gp/5uxpCeXmpWS/f1NlyhQvESMsSE06WLct940dYX4YKofYPwLUp7gFVDG
         46N98zF1JeeVFV1dAvsKZg4A1hy8kbZUhDAVFKBD2tTLn/KrHyCT2k9kVQyt8fu692lW
         lZpg==
X-Forwarded-Encrypted: i=1; AJvYcCV1nlOWv8P49Oi4Q+yrgZCdkbf13p2RVS8JNxSyjQ2zxf4oLFPgx57qIc2n7BdfmliIxWmF2ZElv8xpL6aMOPcM@lists.infradead.org
X-Gm-Message-State: AOJu0YxooDzJ5RYM1ZLwzP9gmB63hlEyMWoJc7KxO5mdbi+P7PCnWRPF
	HdOFSbHjZ2rXWz630cqbBDgHBLn81qYUTKN7UjG4mD2cp+24PPocTgVElAAlG1pA
X-Gm-Gg: ATEYQzw6GxEpt6hLn+3/9VW2/ODDTsNTbF4finQk408kwMh7rMoGgZ6++DMTS4LRa3h
	504TFRrMOF2lu+2jqO77t2DYsXcK631eTyDlbj4uZ+16wMu9K9FVVczOj0lhh+e1qtfmJna9ns/
	7GYCDxzskaJnZ5N1gHppRNoU51Esh1CmS5Nwhuach1AwZ54EbbFpRRB0wTMb7UyTgOGsawM6uZa
	uwVOuoKSk3s4f2toY+hjnJnFcv/QIslzDV2jpTrO8MFUxAcz7KWIztZLRdPbfHOLhoRQlBM2MbI
	xRAxHnTkr1B/wLuyKhaCaqfY/aOyX2xmrZoepShtmrjjJ5LEi91fbE6vhDTMoB1N4oajnVTYn5S
	TmoAavENGKQHEApSabwoFvWEwuK3k9xh+XPK3TZOQXzOzXMzTmx9W+dyt9tX/s9e2b5Pz+HDdw5
	/yu2RWn00skyuhqiE/SFRRJAxH/lFOxCz+piOGWaCK3r14w6WI69ZFJrCVCIWK2a8d
X-Received: by 2002:a05:6123:82:b0:566:2fc9:6c89 with SMTP id 71dfb90a1353d-56ae7791cc4mr1059478e0c.10.1772636982974;
        Wed, 04 Mar 2026 07:09:42 -0800 (PST)
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com. [209.85.221.181])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56a92175e87sm23216244e0c.15.2026.03.04.07.09.41
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 07:09:42 -0800 (PST)
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56a8e0ea02aso6869487e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 07:09:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX2DBMZejOQ3o/zVD0dRGMOznCla26EZPjrGRWH6dunQFjeFDMXuq0176VusSnxebwUIW1yTI+Dlvqrs7BXqmAN@lists.infradead.org
X-Received: by 2002:a05:6122:250a:b0:56a:8c20:2d9b with SMTP id
 71dfb90a1353d-56ae6b97c39mr1061719e0c.0.1772636981170; Wed, 04 Mar 2026
 07:09:41 -0800 (PST)
MIME-Version: 1.0
References: <107183629106ad392e17fdf539a3d79873024377.1772632987.git.geert+renesas@glider.be>
 <86y0k77jhs.wl-maz@kernel.org>
In-Reply-To: <86y0k77jhs.wl-maz@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Mar 2026 16:09:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXwd-k79EyU=gs8sWFSO=Ap62kbmb7UX3MDUir986GvVA@mail.gmail.com>
X-Gm-Features: AaiRm524M_lVDqJeLtLCIplagqZCSJvYvhbt7bK9RL4CkdtLzJuotoXm9OoR-Jo
Message-ID: <CAMuHMdXwd-k79EyU=gs8sWFSO=Ap62kbmb7UX3MDUir986GvVA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: arm,gic-v3: Fix EPPI range
To: Marc Zyngier <maz@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Thomas Gleixner <tglx@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_150946_825574_BC6E6351 
X-CRM114-Status: GOOD (  29.18  )
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

Hi Marc,

On Wed, 4 Mar 2026 at 15:32, Marc Zyngier <maz@kernel.org> wrote:
> On Wed, 04 Mar 2026 14:04:10 +0000,
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> >
> > According to the "Arm Generic Interrupt Controller (GIC) Architecture
> > Specification, v3 and v3", revision H.b[1], there can be only 64
>
> v3 and v4?

Doh, no one is immune to hallucinations ;-)

> > Extended PPI interrupts.
> >
> > [1] https://developer.arm.com/documentation/ihi0069/hb/
> >
> > Fixes: 4b049063e0bcbfd3 ("dt-bindings: interrupt-controller: arm,gic-v3: Describe EPPI range support")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  .../devicetree/bindings/interrupt-controller/arm,gic-v3.yaml    | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
> > index bfd30aae682bf3f7..360a0643a0b567a4 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
> > @@ -50,7 +50,7 @@ properties:
> >        The 2nd cell contains the interrupt number for the interrupt type.
> >        SPI interrupts are in the range [0-987]. PPI interrupts are in the
> >        range [0-15]. Extended SPI interrupts are in the range [0-1023].
> > -      Extended PPI interrupts are in the range [0-127].
> > +      Extended PPI interrupts are in the range [0-63].
> >
> >        The 3rd cell is the flags, encoded as follows:
> >        bits[3:0] trigger type and level flags.
>
> Duh. Thankfully the code didn't have the same problem... Thanks for
> noticing it. With the above fixed:
>
> Brain-farted-by: Marc Zyngier <maz@kernel.org>

Is that a common and acceptable tag? ;-)

> Acked-by: Marc Zyngier <maz@kernel.org>

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

