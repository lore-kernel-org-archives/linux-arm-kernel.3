Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586BBCF394D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ns4j4RIwbKPHEpeqvUPwTPGh7I+0wclJE3dPKxiT3aU=; b=TArrOxfg4hXo5IY6LvVAQvPV2Y
	PHH5ISEQEn9H9U4xeW8RSDLj4xFzdseGhOMBMQcBHkXpaNsbsqvFzf3g46ec9EOFVYBlV3AHpBJ5G
	2FtslZIulepdVZA25E9FC6BGNLnnxUCJTQ5j1wiO6SyrJjXA+AYy+PT7cAacDZ1LO+AwcdIwUarg7
	X3i7wx67EdddZR12Q79dQTVcVGIEurXRj7UDmY5+2pN4lLIIYNpSGv2nEQtuXTaL8TjL9K68uGHhM
	kwmScbfgrRZa096VBKPmgLze5v9wAgYseJAh+3mBR54KoUDSr8M5URO3Bu5T+P/NtTeqqPyvl+kss
	auc7DAVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLknK-00000003e94-1lVa;
	Wed, 19 Nov 2025 16:12:34 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLknI-00000003e8T-22JC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:12:33 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so1040011866b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763568750; x=1764173550; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ns4j4RIwbKPHEpeqvUPwTPGh7I+0wclJE3dPKxiT3aU=;
        b=YEZLYSHQS0MjyVLsU+MtOAWQ+ASDk/ZlA/K3T/u+pcOycxouth1sBV2U2KHBP1AzwL
         +36InvKad7vV1l3E17Foqu+GwLnW+nNsizIMo5LgHFwuTR18DoB5kg2e5pgSPDrbk/C4
         APS+QPyiIf3aF5t6ZVX9oqBuaq+d4w6tKwG25x3xa8AtwlsuyzofLfgPaykZpUYeUxpY
         2EFh1dOWgw33g4CqCi+V4TIPuLQNeMAx0aoLt1ksTAayVbIQ/IwfvKc5TbaJ4/Amrbsc
         T/MzOvVvlN4Wy8kz8X6FU2k8ok+C3WXi6dAAeIDPC7+EWBuVmWdxX2/JHWUYVQgEpcOe
         MbJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763568750; x=1764173550;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ns4j4RIwbKPHEpeqvUPwTPGh7I+0wclJE3dPKxiT3aU=;
        b=bcuE94Qila5b+UK/T901BW2aXQZd5TQxMveIU9Tw3QA2YTMlXWJlXltVkWZBIetFzI
         Q08PBXVc3srWQIz+9fjCVowIEkaWaVd9WXWDIyQzdq8uTVtqNVnT2AocezFdzGmvw4P+
         am91UbxogHL9qQdjLv8EtUw78gzI4Fz9Fcc6RVEq/Uix9wICnEIVaw4RAnGEwjw1uK59
         wXmiP5mpDGk+/V1tzFwstjrv08wLaXlRYmKNIyQPCuGhaTUh02CqaJHs3rUpLUITXww8
         rOXJYqYSJEnWcY07Vk+urGn06vEe08P4FvxHTGwzjfrTkuyLd/knN6YBADdR7MIAuuSC
         zAdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXEVeVkTJlz2AjvwzW/jH8BYMVHT1w/FQZ02WeSKRPDUPD4zJ2bzmHYxISm++T7d3ep90eFTtQ6/2VwJVqcYiR@lists.infradead.org
X-Gm-Message-State: AOJu0YwzdAvoAZPc3qVLuIaqWgYBkSZdjAiU3vM2B/+ZM6FpOa5o4HKY
	+0zNYuSFgTDAnas1kkAnGGti6t3gP/annm4blktsghqMSH+5MSjYt6wKKDMlBINPE7r3/Y3wusQ
	6wvsqixxMMXNn+x3XvX6LserQlqq7veE=
X-Gm-Gg: ASbGncu4WekTPvjZD3lQ7e9v+yNVFRtF65wN2PXZjLb93pZQkD48vZMXIaQ1J9WlRT+
	uK4SUHEP9tqpykhC5FOAqzKx6H839wlWvOdANC5jsvsNf34putmqjMdmE6PkxYjatiUL+1TT/0B
	qkIEeX9qDErLbRyRQ1gCeVYeZv10js0RgxQQN5eln8ZFo6z4bPPMp8XR/vfoF/0c7/GdWow3frF
	Sa1wuKjEGNHloj6UvlnFr0wTdVyrRNl3N/jQxerDcDMFBZvqTjJPcLZ7XtHcb0rZ6gqBwICP+2t
	t5zlb+IKBa5+oapwSQtN0r8+jEL51tX5MrSuQx+gouniEpBO01RY/QXzXwSxpHS2NfTBx+RMxEt
	5FOlQEw==
X-Google-Smtp-Source: AGHT+IEXnOnIcDL+WQPyI15HzjNbUj9gMlbunsDk2m6BU1IUUvprig6gWCBeiXxf00hfMEvBu2U3Puz8te32xqRBXh4=
X-Received: by 2002:a17:907:97d5:b0:b73:b05b:1f9c with SMTP id
 a640c23a62f3a-b73b05b204dmr1059457366b.14.1763568750356; Wed, 19 Nov 2025
 08:12:30 -0800 (PST)
MIME-Version: 1.0
References: <20251119144327.13345-1-jszhang@kernel.org> <20251119144327.13345-2-jszhang@kernel.org>
 <aR3lg0aNaoT-_7SM@smile.fi.intel.com> <aR3niy7_jwzQSJ33@xhacker>
In-Reply-To: <aR3niy7_jwzQSJ33@xhacker>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 19 Nov 2025 18:11:53 +0200
X-Gm-Features: AWmQ_bnLpUh6jMo81CBBtcjYva5xbsqWCBG913Ja6bqzpLYkudT9viHeiSVVbZs
Message-ID: <CAHp75VcLjknMLZ60b7mUPqL2miT_x8EexQPhCFueua5vDg6uxg@mail.gmail.com>
Subject: Re: [PATCH v3 01/15] gpio: dwapb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_081232_533105_D523F5A4 
X-CRM114-Status: GOOD (  13.15  )
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

On Wed, Nov 19, 2025 at 6:09=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
> On Wed, Nov 19, 2025 at 05:42:59PM +0200, Andy Shevchenko wrote:
> > On Wed, Nov 19, 2025 at 10:43:13PM +0800, Jisheng Zhang wrote:

...

> > > -#ifdef CONFIG_PM_SLEEP
> > >     struct dwapb_context    *ctx;
> > > -#endif
> >
> > But why this? For the PM_SLEEP=3Dn cases it will give an unrequested ov=
erhead.
>
> the pm_ptr() and pm_sleep_ptr() can optimize out the PM related
> functions, but those functions are still compiled, so if we keep the
> #ifdef, there will be build errors.

Is this an expectation or you can share the error, please?


--=20
With Best Regards,
Andy Shevchenko

