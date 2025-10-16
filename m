Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC63CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Oct 2025 22:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kmEYRnE9eYaFqXKORkJ+PIJAmcGX5bvGN7hsJdgH+6A=; b=QQKlkwW3Deak6hgpq9Zuh3G0hX
	a1ZZjk+LdjwbTCbLryF2aPPK+W4q3fpYDU1f5k4poOb1yZZLf4TIfRkots8BD8NQ+trQezvKbnG3a
	GBMdo6gJmSFd8QR9r3jYyYpi66wK3ptbAm9FgbDeC+eoUjG72qI8bzx7sh9rRKLYTm5vflbWgmQPy
	Yv50VO7rK2zCS/RVInRhrz1FlVyHHHB4yAmbHe6h09UFEX5Hcxb9uPQGIb2TNiY7ADZQQ1LmipZV0
	EdB3YdSVy+7rCN3/tSCTi9DKMWUwZhp4QhVCEii3iWgPVTzk8C4drmlQs8Ukgnq3I8YhIH1EJglVR
	HTffa92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Wob-000000065oa-1Vo3;
	Thu, 16 Oct 2025 22:51:21 +0000
Received: from mail-lj1-x234.google.com ([2a00:1450:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9WoZ-000000065nl-1MZc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Oct 2025 22:51:20 +0000
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-3652d7800a8so9462981fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Oct 2025 15:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760655077; x=1761259877; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmEYRnE9eYaFqXKORkJ+PIJAmcGX5bvGN7hsJdgH+6A=;
        b=qC6PO5eGleQlXPe4Wgux0UbL9yxRb8JUwlNID7mE5zFj6G7PXbvKL84lsBSRLSoPUH
         bvi09cTtNdGVsSIWAkpA0ciuNtTGf4uxSa4Atykg46FO/03etZhEHlptucG5LG/FQYTB
         qBPGybLUJ03whlIwI98woM7OgR9R97NQkVKfMuGj5LjFosCZ8xFOaQRsVA+Yg+DUlEQv
         SSMEaIPndeP/sbCrkYv+DPOfErjKFy5BzC+QEriLWMmzlRdUKi9b3pMGAmXlYSxPLKMC
         HEM4qZ8fQB0xKRKsqA9gcWFNnmbLDJKfqoyRI5AeHXa1gohgz9Sm2wPGENPyq+uV0xe/
         9kYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760655077; x=1761259877;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmEYRnE9eYaFqXKORkJ+PIJAmcGX5bvGN7hsJdgH+6A=;
        b=Mjlr0QYuOC8q4JqrRv2DuZU1HuJDMLWBhwKcoNaQyv6PvMCJOIHDj/6Bb41W7n2RCw
         aTWjWR0yjx2zIL8e43dZhQ3VgP9qfuW3JQHuBIIBaA5LZdYtP8n3qGf/wyEaN9B50VwH
         2j9PuJ9ojCPL3E1hSyICcpU+x3Fzg23Z/PoTOYwqiZUBW/hSgZDXlDqzlNWJ6PJaowOc
         cXNkEP/MZssDgNxecLM2wS8nydnsiK7jBFJsBsM3gbRAQoBmTqSwFtnXQ/06alUr1zgf
         l1YYmN65tPPiH7krS4U+fSlTCEsnEp4zctPrBQU1O83HXN18iZMbGZF9DnQpd7ESex93
         ++7A==
X-Forwarded-Encrypted: i=1; AJvYcCWqg8OuvHHu0FtvyxsIX9dl4f8iX57sGyL/7iqFh/AChuUJpbTU+cZww+19X9Q48efgBbodCRv+ecsgIXVKGf2a@lists.infradead.org
X-Gm-Message-State: AOJu0YzhEXxPlRjwldGkWwZmhUtA0eYXGZrAYlHexdWthtSzqS0tu5Y3
	rYgAoxXCSySRhKnE/nonkgnyi9dqp326q/CGjnIXNPO9hQr/P46IcH/5sG17TGtN7oqQW51VY7f
	tJmkvf+M6fjqkzXT2O31m/Bzcdka58QQFLp45fnSLWiq2Tb3VKgfFADY=
X-Gm-Gg: ASbGnctsbMDoaxipp35sNg0ancgpFrHKDDmmFBm/uu4f/8BwynlHceGZc4hOve1eCq1
	+GKYxVo1qDSc6bPXvkLxlDhrDC8BYQsu/LRNg7sUCfD9sz2V/kIEYpArdxdxRzWuUqn7cBRJZgA
	Vkt0GOHbja0xud9ZmOAq45/7vYGg3r3kSBjoGfFytq/nmWqmSDbtALrAZJcPRQey74bSIH3LTRR
	XJU3huvDSQFpZy0MNE2IBXomvTIEuxlCHV5QAdN0OLnBukXdoz2xT4iWy2V
X-Google-Smtp-Source: AGHT+IF2PsArzf82nnnIcXMKJafhbORBWTmQjtEV2MVSW4tFFx2e5kaE7Rul4euIEnksQA36PN7ysUqEvFRBOXSjgk0=
X-Received: by 2002:a2e:bc85:0:b0:351:8d16:d0bd with SMTP id
 38308e7fff4ca-3779791150fmr6358721fa.19.1760655077092; Thu, 16 Oct 2025
 15:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251014015712.2922237-1-gary.yang@cixtech.com>
 <20251014015712.2922237-3-gary.yang@cixtech.com> <CACRpkdaXW-BFM=HvqLiSY-Mkmhso2ETmkZzOX328aSadUEBdSQ@mail.gmail.com>
 <PUZPR06MB5887BE1631D6D6959067FDA5EFE9A@PUZPR06MB5887.apcprd06.prod.outlook.com>
In-Reply-To: <PUZPR06MB5887BE1631D6D6959067FDA5EFE9A@PUZPR06MB5887.apcprd06.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 17 Oct 2025 00:51:06 +0200
X-Gm-Features: AS18NWAn7wwy003ztU4tRuoGojKRToh6fuepHCkeLH2yGuI4i-eeI2-SuJ4p_pg
Message-ID: <CACRpkdaOuih=CVuGVgpfwP921g5KSd1Dm5v8oyyYq0pJdrzgHw@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] pinctrl: cix: Add pin-controller support for sky1
To: Gary Yang <gary.yang@cixtech.com>
Cc: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_155119_374709_52958594 
X-CRM114-Status: GOOD (  11.09  )
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

On Thu, Oct 16, 2025 at 7:41=E2=80=AFAM Gary Yang <gary.yang@cixtech.com> w=
rote:

> GPIO IP on Sky1 is Cadence, not Synopsys designware. We wants to do
> it when upstream GPIO driver in the future.
> Are you agree?

Yes no problem. (I misremembered that it was Cadence, not Synopsys...)

When I look at the Cadence driver I see it needs some modifications
if it should work properly with GPIO ranges and interoperate with
pin controllers. It needs to call gpiochip_generic_request() and
gpiochip_generic_free() from its request/free functions, and
preferably also gpiochip_generic_config() which will extend
the gpiolib to call down to the pin controller and take control
over line properties.

But let's do that in a separate patch!

Yours,
Linus Walleij

