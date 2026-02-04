Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D73CE8B38C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 03:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C7fx8jMgzpNF2mehVNjN2GmNexljYnni5J1NsYsG5GU=; b=TdermmD/qcEvjj/ZUl6SnLKNEN
	8Cz+Vei7dhG6fY6viHrpeQj4e0IvhkZEtGN4HdekKKpw/8c8gfBEXmVvoH/NWPdCNEtDpa7cBAhBz
	ELjw8LenrBPdYjUQuFDiX/iAqlzOHGzXUjRecqBsTyTDMZoQ2kgnprZzUT8yoqHZc/qLkEWZ8dZWV
	2NmJN7QDxCvoAY6gveQhN832q/i3DVvSAEg0Ck8QXxxbDNWuoC2WoyJc9x3nV5WzYzB1qRAb2yHxr
	OhIdIIdFVUYp6vg4JB/PVY2fRrmK/+fkUlnOOZre1iNenrg6RTqjkSOuNewSR1X4bbxjIgmUEnoUu
	piYcWxvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnT8Q-00000007nsT-0wz9;
	Wed, 04 Feb 2026 03:00:54 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnT8M-00000007nrz-40CN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 03:00:52 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-b87677a8abeso51950966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 19:00:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770174049; cv=none;
        d=google.com; s=arc-20240605;
        b=P0PJlAf3maDPspFyrcveBdSoQBl2cuSTKERO2+yUf/bK9CgE0lRe0yGIzEhDniHXl8
         H2iEue0GQg56jEW0bjmxIT51MjJFAUwy7wAvpYDh/oVQdLcNHFWOLY2W6BFxyZ0zX3lY
         +V5CKArPQ2K0p3CwEZm8TaWePQA2+Vhv6ta7YTGvuJZJdAEcTZxQXAYwmMqmuxkJAD9l
         vZASeG2zbcAXY/Lilgk11d66XTZYcP7sXqDuMveb2vOx47xChBe9T31DKeuouRGfmyRx
         qxaTSOCcvMMLciNz/QU7dPctNBCXrpKH5+RmlpN2nPkStbHrvQwT5I6tFY5pd4ZV3Xq3
         5URw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C7fx8jMgzpNF2mehVNjN2GmNexljYnni5J1NsYsG5GU=;
        fh=jHfkoBOp4IfmIn/X7veNmqnQK/Uc3facwVzUItapPfA=;
        b=Xl0Lt8eZ6Lo00Fln0OeVvLQtF1q+UnkLF/P1IS6WP5xAZI9LuGSiakio7Gs9viXJTL
         X34FHYNQserJHkny2wwaj8FdDZ6VLbwSopCWO7ZVmXsmuJNEuj3wF9aAGizOdFgsT4+j
         9ohFopCgmzXERWpEUhnXDicrzXqky1evoIhtTC2pOmmrwnU4reSkT1rsORfEDwRCCuul
         eeamc4XKWmpthTsk5T/fWRAU9LALPmEF5/F873RsbUac4fnNbhbv5nbNnvIoDqhZQXeg
         sK4f+fLOWT24SQW8N4hx/9BgRjpYddXcUnYBB3UsbwZMikU4PRAtdd6VEaNVKrgAyshg
         +cVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770174049; x=1770778849; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C7fx8jMgzpNF2mehVNjN2GmNexljYnni5J1NsYsG5GU=;
        b=TiAXz6nUCPSm2GH9qwLbsjtDdyL0Ih14TRwZ5cuNi+JL2kkAhQ5UNsz0HA6yaZnnH9
         GjHWWn++mcbuHBLkXLNrwoveZUJm34RJJbGdcDAUWqeHBMr+pyH46fSKj0owVrzo4uaV
         KH/GvGyevf2OKS8jybnzaD4LcExBeq7FOgl8rjhROg7oZK9YFnGOKxcazknHm7ocbyw9
         Iq3V63vBO5WHBUvqQspYrmXaZ5YG9KONocwFnCYg/A5jNJTuKw3H6ci+Utpmxi2ESKJu
         sTCQsL4l7z935s9GQurvztytk9yuoMK4kvPURzLs6LrML5JpxAsPG8hBaxkAaMPKvMG2
         lxVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770174049; x=1770778849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C7fx8jMgzpNF2mehVNjN2GmNexljYnni5J1NsYsG5GU=;
        b=pvU94mpCTS/OBXJ4nyOaOPaJu+xmjZGxrOYFFWv8m79dOMIlz+aXby/nr/nkwz6F+z
         CFvk6ANjEfsU7A3nkU5aiWPJiXsPWpBn2VTfSYN44PylnlCon3N1HYK64flF9c2NcFy+
         afHtMm53Tu45tEGyg7kR/opDTjI6XC4ae7shvPKeN3RwHLIHS3K/hZMs2UweleyTFsBy
         Vz61IK+itY+cvSarco4SOX42pHaZRRFB2M4t7GCkZDuwEjAKk0hrFunfaeUCUs/kYx+T
         PgiWKBfxy4O7OUoV28DauF3x0Bsenj/q5ZpgAl03NGpqhjqDSaeeudQ+7AZWEvJwqmTT
         aHBg==
X-Forwarded-Encrypted: i=1; AJvYcCUpz9f9++B2fF5vnTOTzK68JPbLmX9Bu8fuFaR0e2AYNmJ0SU4hw6luVAz/d9l1nq2FDMzF3/Mgr1ngvMYxzkS3@lists.infradead.org
X-Gm-Message-State: AOJu0YxPdmLjpuzYmKX0d5r36dpLnCnSukr+4UomcD8IjXCvrkD/ZMDP
	OJSo5t6H+MqJ6FRN/gXO9e97cerHwxfNe6fylO7RKIQO7wRqRCY8Ro4lQWuhXi/WcAgzhBgvMb3
	Y5p57C1+DGuF2CUq3MrrtaKEuEodEktI=
X-Gm-Gg: AZuq6aLThpsfOWhsv2myv5bfQvMc/UUKU49p/v295Qok+819NI5iGMOBPQlpkrljjDD
	58wTTbswQrCj6JVTEqGORKFF0h31fnHeWNAdFXszIIMWi9m+A8Q6qUzk3OvI+AmxfxW4cRyH7sr
	7Uink4jlvQOK16SZ1M+5mkHWdPwewC0o2PwBI4FrzEcK7ppRZ5e8EiFJMbOXb+0KcV8uP+/L+k1
	0SS8nfrNCOk1OeZbW+E5l+JzWwVjT6k39Vaw7+h2vlDDADM/yyrMEi7VpLcdiT3wQGZUO00Ne82
	TwYPNSy6xrOSMJNrE5aRGFyvvqIkHNnjM/9L9tz7ylw5RKuaFrcYdckdiPqhSNw2D5GF1Z4=
X-Received: by 2002:a17:906:fd8d:b0:b8d:be68:bc21 with SMTP id
 a640c23a62f3a-b8e9f075e7emr93593966b.21.1770174048812; Tue, 03 Feb 2026
 19:00:48 -0800 (PST)
MIME-Version: 1.0
References: <20260203234529.1081148-1-florian.fainelli@broadcom.com> <20260203234529.1081148-2-florian.fainelli@broadcom.com>
In-Reply-To: <20260203234529.1081148-2-florian.fainelli@broadcom.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 4 Feb 2026 05:00:12 +0200
X-Gm-Features: AZwV_QiGFKMWwrztGAXLjrUqQwSlkrLCB-kI9MW-fVpb9MUu9JhiJ0o-I1SvDYE
Message-ID: <CAHp75Vc_KutHDNtUNem1JAj4BfcXBwBSgKVnLY3+haPuE6N7dw@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] gpio: brcmstb: Utilize irqd_to_hwirq(d) instead of d->hwirq
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy <chleroy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_190051_499003_B493BFCC 
X-CRM114-Status: GOOD (  10.72  )
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

On Wed, Feb 4, 2026 at 1:45=E2=80=AFAM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:
>
> Consistently use irqd_to_hwirq(d) which is the recommended helper to
> fetch the hardware IRQ number from an irq_data structure. While at it,
> update the brcmstb_gpio_set_imask() function signature to use the proper
> type for the "hwirq" argument rather than "unsigned int".

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

