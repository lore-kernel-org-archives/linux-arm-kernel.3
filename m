Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E05CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 16:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7wSiq2/Zm0HC0kiDhTY7nb7SJGXcV4ocg6c7UgxtaHs=; b=uvNWf4P9o/qhTTUKYfJlwY+6SN
	XHxqeCJrhawCs38kJ2dy0ogdHBxdhCxvVCOSCHVmwSZuGAOntVg9FgyP/KRGrQ52hfBoC2aHfJACh
	m2ZNBL3TMryINr2yGBGNsNgKWpCtS87eP+XLOKsuBGgIyIDr0XfNb6J4/7AvzLPE8s/9gDVJJRhWj
	6HSj1HtmSJ6uFdX0qev49Nw21SgKLtONRmqgfXZVwkr7dtpU/sqykdXcM0tdMC0amg4RtRZodIh6t
	T4slLkJARKI8gjz3P835hsffQMljA0J8gD0bC3rKJWjcE9kYFM2pf72kdCiEDbUfecOF71QFCS6JS
	7wfzIZMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLklK-00000009HNg-3cB6;
	Sat, 09 May 2026 16:42:46 +0000
Received: from mail-qv1-xf43.google.com ([2607:f8b0:4864:20::f43])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLklH-00000009HN8-2QUV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 16:42:44 +0000
Received: by mail-qv1-xf43.google.com with SMTP id 6a1803df08f44-8b5232009a6so29975756d6.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 09 May 2026 09:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778344962; cv=none;
        d=google.com; s=arc-20240605;
        b=FPLjtJr+aTT79xuz9ahkmupt7fxiaTR+llMXBcql3Na92xyB9O1rHW6RkHV6Z02Z6m
         6QBGelMHxsQt+xz4RZty5Kt57BHVXdgnM37MoIc25HyxK9Ia7w+ol68plafUAuimHds6
         /en/S80WacLT6zwd2aq0V/1HgQPwV1/Wb+If5M4/tFp4NjO7GPrJutfvjmtchesdv5lg
         8AfG/9Vw5luTawvi1+mU/JK3gYTPJ28R2drp8Ny95UUk48GKO6g+rB2u2tDszHDUX95D
         xQhmS6IvKg68dkd285llMhiRAW7RZwvj3uIlWt6GRlIlJL6yPwQnTXFqCHTtqgtDxrNv
         mRUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7wSiq2/Zm0HC0kiDhTY7nb7SJGXcV4ocg6c7UgxtaHs=;
        fh=MYjHQUOzSDcxPyWqUGwMKLjkrGbJDuhHsgYwri6Ad24=;
        b=F5Wv8S6kwfq3nvaElyY53gS5K6haWCAnw6yaoelQ1+2lDmpnpJUQ5qYkNGKA9EF37G
         pEN9gxT4DmwW1bQWsD6QdUceqoSZ5O+1E3QI81Yq8VttGpV4nUimFO/rJaGoVwxPBIi+
         1L1S7oClRj25iNdS/pby+30RtlToGDhzeVb49eRStP/BxGGAefqoeIyKVFGO/SZECOio
         AGcB+L+5N16uOdyDhwAZeKUUuEEkyHsCZ9WjZ2adiCNiq5+pt9rkx8tXoI+Pn1wSTom3
         9DgaoZMWbMsg7+o926RnhbtIpA0oNSGumIsuKvlyxznCX+mYXPJRHJeoKFIT/AvH3U4N
         R7IQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778344962; x=1778949762; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wSiq2/Zm0HC0kiDhTY7nb7SJGXcV4ocg6c7UgxtaHs=;
        b=q4ZyojuPJM3PsPqyrxK+BRhD6i5us/4GafuiFyqdQKRnPsDu/BnIl9Dm8uISGUFC3e
         2G9dFRGF+QW5OnedGPE45/pTgKU9MShaNgtJgYZHIec9FH0EwQr2nxk67IKgtyCduVLC
         CW/LqEH85MNFCvpprFsNHtp+2AhzMcjVLs6fvOxyJpiK33dS+YS0UJrjvnxrd19j3W8O
         APidDe/GF0Oc6CHrEbrUZ8S/1wFWWYzmXcFBGpRnpcSncDOUQaVhmoqM9J6wA7cClo8P
         DFdkkk7g9siX2N1sCty480KaiGXRC4z/PY6JAsuy7KvRZWRxTfglZlEquwjxq4v9Ldx0
         OUrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778344962; x=1778949762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7wSiq2/Zm0HC0kiDhTY7nb7SJGXcV4ocg6c7UgxtaHs=;
        b=pVqOJSHWK8et2RazOyPsxtgOtJg21zdj/MLI7Z5DM3zmXy/GkVhEaobawlXSyzcxqH
         sc/0pAm+kwd5G2wRM1K+ab4KxxtFgiS4Sb6x/3uKmfwonCJAI3KA8LpEXUEYsxEIPcMo
         DgNSaEYjq3smeqGacorH3+hlOAPmg0IVFFVWjaGda0vMJaGrVJowqVAvkW1DMjuwEGax
         pPvGOBGnk/L4LVZq0PA639D3SEsiTZjDsrHT4q3vlZEmNU+oIMzPGE9Hd4geIkcHp439
         AgjDBcbshaCSxrG8ARwdDNAiCJ5XL+x2C+Zv1PjCkv8xCy4Toc7abSIi3st+OaY4YnVa
         agDw==
X-Gm-Message-State: AOJu0YyknAWzJLM6AsVsaxhPljJ2Con3Qx/gArTfwaFBOC1pGW/09+SU
	pSpuelJ/DJr7S4DkECsb75eXv1gU2hbNeXBzTpiM3eOXK9wLEeIzykjtwZiiKTZjttos6+2+f8o
	GN4LqRlaa3VXQ1/9rZn9UD4vCKIuw8P1JxeJr5qYNgA==
X-Gm-Gg: Acq92OHzkdgf8S2oyGlWC/gIzLO9Z3sxqfw12/AY6xMpJcWIs0BTeI9rUPbQttILaPT
	Eh4OyhwB2tiA6Rk++Q28rWHMnwrgHmdeYSdwYtW3AeFpuTh8wpEZdTs8saVpDU+a0WPqz3aRcmO
	qu2kbhswV7qgq5nbDwk9RgGQO9Ssxquqmx7lYEg8L50ovDcDfT2535AgH/Gq0Psey6HMOH/Hxhb
	hxGjb6ztudhcuqjbGFx9Fv1vF+pi9HRY0B+BeVaF6aVFUsbdjMnE0mm7X0QzucX1Gi/o89m9dd0
	Js3lgT5fH/aBlANjawbu8ihlRJTUPS2R42lcjOu6//AynKdufLbLm5ms4bCdln16RLXW
X-Received: by 2002:a05:6214:2301:b0:8bc:6d05:34d4 with SMTP id
 6a1803df08f44-8bc6d05399cmr252564126d6.1.1778344962425; Sat, 09 May 2026
 09:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260509021935.36898-1-enelsonmoore@gmail.com>
In-Reply-To: <20260509021935.36898-1-enelsonmoore@gmail.com>
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Date: Sat, 9 May 2026 09:42:29 -0700
X-Gm-Features: AVHnY4J1r1kZXtU33EaBQ-rMZpnPJxJ1LEMcFAPFyRzi-_XHkPw00Xna6Ax4laQ
Message-ID: <CADkSEUjre6bw62NpOw-YnR=DnQznFmj=iPD5Kg5npSFV+cQq6A@mail.gmail.com>
Subject: Re: [PATCH] arm: orion5x: correct machine ID check in mss2_pci_init()
 to use DT
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Russell King <linux@armlinux.org.uk>, stable@vger.kernel.org, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Jason Cooper <jason@lakedaemon.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_094243_628591_F62C2F76 
X-CRM114-Status: GOOD (  13.18  )
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

On Fri, May 8, 2026 at 7:19=E2=80=AFPM Ethan Nelson-Moore
<enelsonmoore@gmail.com> wrote:
> The mss2_pci_init() function contains a check for the ARM machine ID
> via the machine_is_mss2() macro. This check is incorrect because the
> machine concerned now supports only FDT booting, which does not use
> machine IDs, and therefore it will always fail.

I have been informed that this is not correct and the kernel still
considers the machine ID when booting with FDT, though there is still
value in updating the check because it allows removing the machine ID
from mach-types. I will resend this patch with a fixed commit message
after the 24-hour deadline.

