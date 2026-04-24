Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C771FFDEE56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 01:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYR42p7JO/QHsKTGPNBeEQu2D0vGgM3DHEt/tjHMAQQ=; b=WQowRfQ412Xd6ir8s1+kgktjOv
	P233yehAgKrEap2PAysIOFZYMJvPPdNOnmHZVIVjsgKRj4qhOsd53I/P+Pp3PV3dk1Dhp3+i/J1cr
	+zSn9AxGibPfFWFLfFRSPulK77hVcuawxzw3BbwJFpaUsa9sOCTbFVZaz8jdxK/JHSY6HFLQRgfYx
	8VqOO1oOOudYwRVN/fqLYDnFZiNt8V6t++mnr/0D7WA3cDye+FeEfNAPczzQl+2wILFD4V7guLcF9
	Ut0Rr3y8ZcES1DyF1tbf7enDhu20tB+3yY5ZDKKyI/t3P42ebid2RkDSsx1iJEyVv3pY3UkRkMYc1
	wqI9uZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG5Ke-0000000CTFL-0pcr;
	Fri, 24 Apr 2026 01:27:48 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG5Kb-0000000CTEn-13ZQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 01:27:47 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-678a1642a81so915482a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 18:27:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776994062; cv=none;
        d=google.com; s=arc-20240605;
        b=c2aXPTTUp/nZw7lGUCnUaLXlgFmJW8XnAGHZcEICopSqk0DttWNQUrs6RXJ6dRIQMR
         fayEtrnNDNHSg1lR+F8riNvRyUUsrcZ+IxNup7l3kCuzuJti1maLrSeT8YqKikeNhZfj
         Mcj9euHrUG2d0MaNIZRIuYbYp8PDPzseGAsTmPtgFFeO2CCeitOigpoo7AEkSYJV9IXS
         yd4cC95IHgtcc1KxwgByq1iSeTksKHsncMbLR3Zqedvlc9eIWy4esvAEfE/y1hyF5xI1
         1OaO1UyxXBw9UGRtBoQLv6iPOBobh8xrkz57ppv40vYmkUSfD3NJa4S1sM6ioIKnU3bo
         RO3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RYR42p7JO/QHsKTGPNBeEQu2D0vGgM3DHEt/tjHMAQQ=;
        fh=ehSEvq8vCRBiK6lzQzX19zFfehpi6fGyxGGkKI25TeY=;
        b=i8LVuidVfmgiGGnYx2Ngmz252R7CNNLk83QWt7cdrICNiMqvNldR6+QxBNVUTk7pLc
         k2+Tgy9lidEjQpOcTR1kWgAYvJ33bGVY91crZKdgpffPEMaZSXP/E1YOIPTTPZBVWBiv
         SY8WcaluVLGWOUzUDRqQlM4f7tBPhkNzKuu2dZchRc0k1olvyf7vWdH7JyOFse+O49SV
         C7W2ZmP+nMkRnHhA5cBy37FKzEviQrBb/MPLXWEKZDn2GwokR3U1IAwxkYrI+nURNr1z
         0Tr0clejDCi//5bQX3Cf3UX3bdrsuYppQHIEASLeQO8RQPB+KGOG1QUY/JQTvn/X+xKP
         CuFA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1776994062; x=1777598862; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RYR42p7JO/QHsKTGPNBeEQu2D0vGgM3DHEt/tjHMAQQ=;
        b=TAlaAr+GR3UwBfWaPbRn09w0MOx0mWSatnz9149kRsQU0IEPLE3mYx2GNZ34TVHPi+
         RBEMpGqBH+2PMe/XMiR2KFfRvuNFBR+iQlVxJG4yxBcR49GVcI4Nl7CcZYppPeqEHAHE
         nU+hgksNRIO54gaUOqBcS9ChiVcWbld97rWDpkKiCnfINoUcMNFKy7K4SWpFYhBVP8/x
         K6B/BghW7D2iPS+aUEeszroZFCgrudX4b3qkrQNSv6vtRbRqI3++I0SQ0OzHCgLl6onj
         9FYSLNT8txTmNcR2vTr/k6vdeqbIkxbH8Q4meXjMUGH+1q9wBUrD6jFTNyzHWpIcM8V6
         Vlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776994062; x=1777598862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RYR42p7JO/QHsKTGPNBeEQu2D0vGgM3DHEt/tjHMAQQ=;
        b=BBMhPk5XLWp+LRh2kQoLnOBrKyaqcW8Dw6JnPp4q6BXp57oytLqLihR1yPtHUt3iqA
         YTss+WaDtYNlO2bj6W/3OYDOgDIgOP6BVCDqeoZw0C/g2VdvU2gZykr1b9ayEz64D7CZ
         C/czS6CP/9aE2jcHtidlUgwoWeeBQqNffEWKUNeIBFEfv7OMN36gJ96mBTjeL7FpFCIc
         1FKKLlT+hHwf2D7JRkYIVjHe+VOGIovqEwGkefACpEky5n71LLMrf+FYOUvpoj4U4NCF
         /QdijDUQDx5qhz/iTfZGQ4timNosi6pSQebcVpsv3bJalsi6FqJOyClv6481ruCWi9pS
         5qtw==
X-Forwarded-Encrypted: i=1; AFNElJ+ZDntYFYTvOeoScYPkJYbRplEx13sZg+kiCEF9sDU85I6f8Trml1bDucwugrVd55qFc/f1tQQX6CLLv0QRJvWD@lists.infradead.org
X-Gm-Message-State: AOJu0YzaKi3qKd2Wg+aqeCVzgvf8J0UMSOOFi+DJpzcKa8QiTSWi3zA/
	Q9fM75kLflu+r6F1w79AnZX0KuXAz63MGFl5ILekKGTJ/JSBTmIjnr09g06tI6AjBO1scabVZq4
	DNu08i4SDfVmo3sWyGScGi2ar/GajELtQqwHarI04
X-Gm-Gg: AeBDiesd6o16QoGG3ginPI0kUa1O2oGOt86RKsgwj/CkZbREob8C2/GiUCcMd2kcvuh
	i8wPD8u+ATgzzGTYYvhaPX5XHUYGg2fxuEwJCvecDHUhzZ8kuMFQOzhPMqYZ5YRvLUNnHfFvwyP
	gJxDYSq+8cbT4lY+t7AB8rz8pS8UCZOsYpTPjOXH5yr3xLn2rOYANQcM1i9CVuXAczzkfEyGzwW
	VKfK54e4VfPAwBqF2cJ8eXEVaaKu8i6GrMDf6YzhC53/JWIGBZr6+Ox1HZkTHBkFIhMRehHKrwc
	E3dYjMkguQ/e/eOPLns5TiPswePn
X-Received: by 2002:a05:6402:28c5:b0:678:7da5:2346 with SMTP id
 4fb4d7f45d1cf-6787da52508mr2108038a12.25.1776994062317; Thu, 23 Apr 2026
 18:27:42 -0700 (PDT)
MIME-Version: 1.0
References: <aem0SSQuE1e3pGOS@e129823.arm.com> <56a8aab50a3b5ce0a345fc2079fb2abc7d0f1b23.camel@linux.ibm.com>
 <aeoAlVEwzRUPrlVe@e129823.arm.com> <aeoRxWPyOHGJd+Jh@e129823.arm.com>
 <aeoWO2Cwo04YYu2l@earth.li> <bd908e28298d968740d03c97bc7e441de188b7b4.camel@linux.ibm.com>
 <aeokwrC86WI7uT+K@e129823.arm.com> <aeomlp3I0eVE5mce@earth.li>
 <aeotq8nPVu4wvEx5@e129823.arm.com> <e4e242ae5533d5762a3647186a178764881bf9ff.camel@linux.ibm.com>
 <aephL3MzYoqFGaT5@e129823.arm.com>
In-Reply-To: <aephL3MzYoqFGaT5@e129823.arm.com>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 23 Apr 2026 21:27:27 -0400
X-Gm-Features: AQROBzCKchqlqq4fwimM8FvKvU-_em0HAaY4O5iQxKuvqQBuL1WqJdLvyk10CT8
Message-ID: <CAHC9VhRQWHEWQ5NzOPiu8jtYv6UsRm8WVS4fd74AbkOcAd4y_g@mail.gmail.com>
Subject: Re: [RFC PATCH v2 1/4] security: ima: call ima_init() again at
 late_initcall_sync for defered TPM
To: Mimi Zohar <zohar@linux.ibm.com>, roberto.sassu@huawei.com
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Jonathan McDowell <noodles@earth.li>, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-integrity@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, jmorris@namei.org, serge@hallyn.com, 
	dmitry.kasatkin@gmail.com, eric.snowberg@oracle.com, jarkko@kernel.org, 
	jgg@ziepe.ca, sudeep.holla@kernel.org, maz@kernel.org, oupton@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, will@kernel.org, noodles@meta.com, 
	sebastianene@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_182745_742350_CB6E532B 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

On Thu, Apr 23, 2026 at 2:13=E2=80=AFPM Yeoreum Yun <yeoreum.yun@arm.com> w=
rote:
>
> Sounds good. Once the patch is posted, I=E2=80=99ll review it as well.
> Sorry again for the noise, and thanks for your patience ;)

My apologies for not getting a chance to look at this patchset sooner.

This seems like an obvious, perhaps even stupid, question, but I have
to ask: if IMA can be properly initialized via late_initcall_sync(),
why not simply do the initialization in late_initcall_sync() and drop
the late_initcall() initialization?

Does any IMA functionality suffer if initialization waits until
late_initcall_sync()?  If so, it seems non-critical if waiting until
_sync() is acceptable, as it appears in these patches/comments.

--
paul-moore.com

