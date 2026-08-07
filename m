Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75AEDC5AC7A
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 10:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRsC4nvT6Z/jvHUPDRb5W5WWvK9c6aIP6vBj3rnYfTc=; b=rhInqDgBw1lY9NPBpVU17MbXT9
	0bLNdRKH5WfIezNwnyR5dpwMAME2LEbmG4J31e6phitA6VZH9IcsB+GWgs6dVKFxzdSB+XUw0xhul
	JIpSW5k+k/ZB7YSvKmuHw/euJR8zZyqMzAQrcrDOUhpG4uGZHlfzqQnMLaOMN1YtWrwrhZQfR7tkI
	Hbt85S/2tQ7kwkZDMUjl6Teli4+nNYTca9h2v12FruHFjpcBGD7JAJkOcwIh3i1u5SVMjK+UmtE4F
	pmY+HS1Ds7iP2w5j9tf3pzXJ/LcmFJE6S/2Lqpjh8GGf9pBxpcoWJye3Px92U9pfWI3GfiZyuzDh+
	fuiecB3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHYV-00000007aqO-2huw;
	Fri, 07 Aug 2026 10:11:59 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsHYS-00000007apw-404z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 10:11:58 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ceaf8a1265so46888825ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Aug 2026 03:11:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786097516; cv=none;
        d=google.com; s=arc-20260327;
        b=ql2P+Q9l87pEHcNcvZHHyZXD0kBFfkKyaCtmiB66feG6cxITVi7FtSgP0gTSGau3g7
         /sY2PS9eHv1S1CSXR+kBhMsOro9E4wZ6sb2keV8aMEh0Re6XbHPzNb7xGDAZhdIvUDi3
         Vp7CM5QD/C/M7AX6hyjK/8wMHOjbsfHbD261HoI5xzZFtX5bulyVNjNVWyEitWTCcD+0
         ACUoyKDhYLj/djzJcRuUiqkjBTRPL18e7RcNopj/pbHISpr6WYuL1txLqBo/mFZMQvaO
         JJwnOGvPjfmQHdWqBNWwIheqPXwolVv0KSoigyPaVfXyKj0aP/y4toIEFwlsjQaZP4Z8
         4zEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gRsC4nvT6Z/jvHUPDRb5W5WWvK9c6aIP6vBj3rnYfTc=;
        fh=siv1/fVR82gCGtMkvL1t5qiLjb/ZgyPhaZT9GIwEToc=;
        b=ktiWrKnf3s0szIxAPhhaT7mTdMonTzBS7fXNR6GLBMjWLy7AjLnNTCW6yuKYBOj4Fg
         W7dud7XD+pDKoFydS6+N+XWI+kGbfi97lKDFeY388KDPEExOGtkXwdgGpV680r2O+Iuv
         uUVnaeSYp9NSxYHQYjuPmVZaxnZIR71d54lpwmamtZJ5gNgIzl/oAMteaqfT3XaLxaV0
         CmMhLcHtuM+QKbRUpNs+lVYvbbxdiRbRnYMJjHQXawfqh27iHIXxABIG5Lf8QNUsp4my
         EZMcnKCE93yEaT5it2nzi92clzHLkq98zcFvVKEmkJ4l8plNDYs+EElWzzLX43rZY39d
         NccQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786097516; x=1786702316; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gRsC4nvT6Z/jvHUPDRb5W5WWvK9c6aIP6vBj3rnYfTc=;
        b=RsFAJtMb0jwpTyneuV2Qn3aoJCN7rf2wRCGDCEhGdWFsPyFFj7cU0lqo8d81S/6H2b
         p9HOiNwsSfKCo4ECNwa1vduL7bowjonm147uj2/nuvE4VN3KEOPAXFJIh2spawv01hXz
         cByHn2RTDarWhFEQr/c6MRLz4H4UuthsrpHaq01WOfjXHaM2BiBGTUiqWJBHNCfzZqDH
         6T6i/5/vd07EGB1yR/V2PmKx3dUaYCYOlgnPebg9vdNA3qJE7+Jbgp0Xj87pzbVEmdpP
         aj4ZO57RYd3qod+KQ+buug+5s0mQ3huq9a/3h8awzecz6oCccyS6mOQZOBHIGGU3VFWr
         YVqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097516; x=1786702316;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gRsC4nvT6Z/jvHUPDRb5W5WWvK9c6aIP6vBj3rnYfTc=;
        b=KFy4ynDxk9DN2hFHUXMJcBZWFxH+kp7qkps1JyPRB7QLUPeLUV6O7x/EXCx02TnPLo
         Xn/7V7nB/5rU6nCz21aMI//WqAkhpnzBhuessTEpNZWb/eXMBg6Iw6g7cQf6XTlIIvPp
         hITTxsNLuDA9lX7wVvU76t9czryo9GwEQK0Ktm/xca1yK+6euvhw9VL7I9nuXuZ3TMTq
         qk9Y9lHSZWPSbptWk1J9x1apwmjDpZQUC5ZAm5EEDCubwtauMRDOuJX/EgeS6OwWG2sL
         +SWDOMc1fKXpiG9Ca4aiyYN1QwPTg+1Z7iA9MTYVfduu78M8A0grvjNue/xuyn0g/jhu
         zXkA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+c2nSXJ6XPSpODHe5WO1ke8PW0fqZ55pZTX5MWEnzH6Ixhf6uBaBkmkruHm2YbLVHzq5sG8/+Nh/bygza7O3r@lists.infradead.org
X-Gm-Message-State: AOJu0YzUvvyreh6kyWRqO1wUFhEsLIyLnmnprk+YaTrGmUM4rbcT+Sa5
	120SV5+zaqTQ9cWZ9ZT/IswAw8iCaYWLMp3r1uw/ffcqCI54/gGfzr120wHYBQCYIGEA8SByxnJ
	1PHlU78xVh8theKKeumPk1nRGJhC2WmU=
X-Gm-Gg: AR+sD10W7D94cQedKdTe8xmzNgH7GbdV2t+dFCl5hKXg1sqkLy10FgkQueAuImph65V
	2t7v+QekGs/BG9JT+1GW5ZoaS9bk2bNCExmYClC79drfYYbQGnuP6UNSD1WqKYa6PnmZ5qKKXFv
	YSlQOD+AxYj/DH7yLPAddFCPwpEQxS6H8zAk+Vz18HJJ599l2PCiEpW6oRYiucYWpFkunmcwrgr
	7non2xEEU4ysyebi23SmsfVDiEfdmWxtNPAwkh5jhi8cTRTyGgVpPZpohaO5JWgxo+T+dv0mSO3
	mk5AsdS78PRXQy479XqkHsqcgrdYv8LyfVq17ATTawI8o1Yr53wfKs4B3uqeZsDH/llHWNARlYX
	7NPXccta7CNC1/w6cFaznSYqL6J7XdvgeYzlDtpXtyRoVE3D451sow2U6
X-Received: by 2002:a17:903:2290:b0:2c0:db23:4c4 with SMTP id
 d9443c01a7336-2d0ca78d505mr240111405ad.16.1786097516111; Fri, 07 Aug 2026
 03:11:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260807093058.42840-1-phucduc.bui@gmail.com> <CAMuHMdWJ3W2JKmxaKaa-A-Zk633cf4UwbESi+F1_h4tX1AhRng@mail.gmail.com>
In-Reply-To: <CAMuHMdWJ3W2JKmxaKaa-A-Zk633cf4UwbESi+F1_h4tX1AhRng@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 7 Aug 2026 17:11:44 +0700
X-Gm-Features: AUfX_mxB2Z6rKGI0C552xtBhSaQUfWGeTqpz5g_xI9L885nyvRhIV34A4nRBpYo
Message-ID: <CAABR9nF7sAT4C+W_qE8GVKhrtTjdm=DcpJH548RzFaYLuED+3A@mail.gmail.com>
Subject: Re: [PATCH 1/2] thermal/drivers/rcar_gen3: Handle -ENXIO from
 optional IRQ lookup
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Markus Mayer <mmayer@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, rafael@kernel.org, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	niklas.soderlund@ragnatech.se, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-pm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_031156_995840_DD358785 
X-CRM114-Status: GOOD (  16.10  )
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

Hi Geert,

Thank you for your feedback.

> >                 irq = platform_get_irq_optional(pdev, i);
> > -               if (irq < 0)
> > +               if (irq < 0 && irq != -ENXIO)
> >                         return irq;
> >
>
> So the code may continue using -ENXIO as an interrupt number (and fail)?
>

Yes, you are right. We should probably handle it similarly to:
https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/thermal/renesas/rcar_thermal.c#L422
and only assign the IRQ when the return value is positive:
if (ret > 0)
   irq = ret;

> Why is this change needed at all?
> The caller of rcar_gen3_thermal_request_irqs() knows how to handle
> failures, as IRQs are optional.
>

Regarding the caller, I only found rcar_gen3_thermal_request_irqs()
being called here:
https://elixir.bootlin.com/linux/v7.2-rc6/source/drivers/thermal/renesas/rcar_gen3_thermal.c#L530
It does not appear to handle the error return there, so I don't think
the caller currently handles these failures explicitly.

Best regards,
Phuc

