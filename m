Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C633C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 17:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TH5llxzcucM0N4iq2/3TbPkFRzGjdAKzo1pDD9WbW/w=; b=C/23ji6g2rKc+t2DFoNl3+xalD
	mH2lXo2EHaEKAC7qYRL4eoaHCAAwAuujvtp74BuR7dnpyNEh5/f90SkeRT6gELcI1lkMlV+kCGCwy
	9XxElhx6p4saIKZeOsZq2tRBtMqh/dEb+WaZEWYkAPuNORTrePyVI/Bg+ZL3xgRpXlEbXIpD9DM/z
	cZZLg9CF78OMsiG5Ik6ik3NOv7QVQEFNDIJtIiB46Jwbv3EtRg+traOxac2P9TZQAgxZAq7MXk2US
	N0DHrpa1GnpJ51AQJzdi2icxj4KLJOTlm6TQNKwIIIYkxPZh5ctkNk/Fm5ExAZUo90Jgg4l1x21kF
	5QxxMsiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZuvC-0000000CZ8z-1Mkf;
	Thu, 10 Jul 2025 17:18:58 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZsiv-0000000CC0T-1Xlr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 14:58:10 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-712be7e034cso10925067b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 07:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752159488; x=1752764288; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TH5llxzcucM0N4iq2/3TbPkFRzGjdAKzo1pDD9WbW/w=;
        b=Kf73zp192y8Fzct5EZ5Yk2b7BoD2vIQhv6wrV6Fc3itUhn8BaYDLpp8FjzHbAzYKlS
         3hM8LElN302ubrAEpMXpl+3r8l2HJrlTmtlxCKpCb++njAGEQP0xGXJpobHij2k/uEJ0
         bSvs4B8H+PYMSpLOGr9QZXvuvi6Wgo4b1bAih9gPhsa3Pc2w20NqOVDOwshTnDODX2Sd
         wJSqdXSXG0TVpNyIbuYG4N0H0Cgx4x9A+j79XgYl43cPPhNev9Ul+cHrBvp/s64Sqs/9
         uGM9shO2+fWpsIWhfO8fuTrh/5hZdCSdb5fa52nuoVfwUrozxI2ooNoORecnQnFTCEi5
         eTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752159488; x=1752764288;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TH5llxzcucM0N4iq2/3TbPkFRzGjdAKzo1pDD9WbW/w=;
        b=CWLOWuLg/0rpSObt9a+gjkV7NS3P9Oh8CvIPBp7KQzuOz/wMRWf0SgYMav/eeAzo0h
         gPryEh8JdLiIqDIHLLP71WYpsgrV6qwBjcrhYp1xMBNxwn2UahMkASdbWsyo92scpyOn
         MBZ42D038AEL9Qc8kHtTXs+aL0pXS9pANKK5LWncdB6EpPgSj581+BNrGRrtm0I+B9jJ
         bLRc8zwHiWAbkG/9JlBjihM7K8WwJtC+mOOorMkOi1drxkOJI/S3W9zVID+rC3YLIK/Q
         BIEeDFKSxMIOBBgECvIZrreBWL8bL0QuI/i+5TvLCUbHkF7Px3DLE5Yp8f4olECgcyBv
         zdDw==
X-Forwarded-Encrypted: i=1; AJvYcCVx0QVlMh8YoU99Ksbpn41LRXw0yiR5D1NvqqxjMgTlaBZBKBb9xSsiY7GYI0Ux0Uksem6L6ftZy/zqRdEKSxJY@lists.infradead.org
X-Gm-Message-State: AOJu0YwkmLeaVGwSwLS2K5G53vavIsj1YR8qfvV9jx5d41h2CupZyGcc
	U4cdhw3X2QHaPFlHZtv3sUAgjJz1ovGhnGAMJEa30qNtaRK2avM9BgHqK0gHNxFW7g2RkJmdm92
	QeliVUQsrRVClFCaH8imTab9eb+IDojE=
X-Gm-Gg: ASbGncuwzwtVcZeyogLtYPugidWzjTVJnOUfkrZvMnejT+ApPxQEfEND3MScglTKyKi
	/t6u4eFvQG2EJc+66rdViwyro3ztD1TCyGANukCAm9vOC/Wo1yaRcdvy1IdOP3lRH3503Ffyqcg
	CF/d2dhmq4av2EYNdm9VNzS3WWl2vs0iQaFGfAhYUHag==
X-Google-Smtp-Source: AGHT+IGj0vOjTNls2xWvYdpalcELUUnBFKyAUZgPNeSj8dAPkHAuNVZE1EZsB1saeRuYvsZT8KRFOZRjwuNTc4TRYPQ=
X-Received: by 2002:a05:690c:81:b0:70a:2675:70b3 with SMTP id
 00721157ae682-717c47441b7mr41656637b3.17.1752159488337; Thu, 10 Jul 2025
 07:58:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250709220714.85697-1-stefano.radaelli21@gmail.com>
 <20250709220714.85697-2-stefano.radaelli21@gmail.com> <9b503f65-5c8c-4f04-a1b1-40d7a1202e8b@kernel.org>
 <CAK+owohgk3CkQRv_PBDWXh44X2uN3p8FWBU2t9VtmO-xzOKTow@mail.gmail.com>
 <6656b2f0-5258-4f23-8988-567a7b598497@kernel.org> <CAK+owogfXDNpjT5Ywcvjaegf0H8-pS109039WadhxHXHbe3GSA@mail.gmail.com>
 <bb6bc232-cc3e-4689-952f-88cf580604fb@kernel.org>
In-Reply-To: <bb6bc232-cc3e-4689-952f-88cf580604fb@kernel.org>
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
Date: Thu, 10 Jul 2025 16:57:52 +0200
X-Gm-Features: Ac12FXyzWjUawsZvzzzJnFrsRzKzTAlycLishUEj96n_UCE4I6vdCqmNJMuAVbE
Message-ID: <CAK+owojEmcW7S8oFFjmmeT1uHn2Hyb9=16GDP2QLQ+DAEwtoPg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: ti: Add bindings for Variscite VAR-SOM-AM62P
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_075809_403052_70ADF8CA 
X-CRM114-Status: GOOD (  10.53  )
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

On 10/07/2025 16:42, Krzysztof Kozlowski wrote:
> There are no such compatibles. There are:
>
> variscite,var-som-mx93
> variscite,var-som-mx8mn
>
> and others with exact format how I asked - var-som-<processor>.
>

You are absolutely correct, and I apologize for the confusion.
I was incorrectly referring to our internal kernel tree instead of
checking the mainline kernel compatibles.

Thank you for your patience in correcting me.
I will follow your advice and use the proper mainline format
"var-som-<processor>" for consistency with the existing Variscite compatibles
already present in mainline, rather than our internal naming convention.

I will update the patch accordingly.

Best regards,
Stefano

