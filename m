Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229B9CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 12:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Roa/R3xKoyx9d1QsB+LkhjgOO/Ewqs+tzAO6wvLC2sc=; b=gSIladisKM5QL93MKE5qCAVbE2
	0eHJOohKS8TKx5PiJNhfiNOqjYaIG0h9ekG/swIvnID0eR2JWwo2xe/VOcq/8xUG9pk/pt6mawN7M
	b03hW0P9FyW42epjoyxXc4YhS5KEuLRsWS2WbkxquCDgGNu9049dMOMFmgbgTMKmtpQoOAGa1Erfk
	LO2QbwZodXjL3CWX1y8B41T4p/azcekhne2SN4Dbpk/aW+U0GrPUpuBMOmoujS6tv7Rgn5sjMNrf4
	VxKPHw921QZJht4MBFmDrHzhN8fk8djNYZ/B147r1zXaUzR6MVK49lYpbYE1ybsKWmyQO98AAaz4M
	gRxI3dEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFKI-0000000GFgx-3DiV;
	Tue, 05 May 2026 12:56:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFKG-0000000GFfg-1Vkj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 12:56:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BCB9342E4F
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 12:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9BEC2BCF7
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 12:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777985795;
	bh=ZUs4wo3g3+7GpdmJ7ncT0CXa7bmF1VEsrvwglg4jLoE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hzodQ2NCG9zoh2XqXyjZl5yyYhCcjuWCm9xc/oDTNJN1WJLwwL4HFEEMw9c8vQxSB
	 //Xl5vKkviuGByHP5wUr5ppSPYKuYFZ9OO0iUFN3H3myUY7ktL+tolifDlitP26ngm
	 P2Ng3zfyVql6y1Oc8dn9tQA25C4f7gJ1V3P6lr+Dy5b8QDs61od9yKdadTwEqofx7E
	 Iux2b2dydeMXEVmqSYTJjk9HGstHpKXAO8vFfXpOiEYdHQ91v0SIZi5qVgvaVmyMys
	 EbFAso9I0L52rHJC+2erRMZ8fQaDgGu0r7ZbzddawxTG6n08oAPfF2l+Dt5FJRIgUN
	 IED1yLyvleX7A==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39393c1b5aaso24205771fa.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 05:56:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+SCvxoM6TFcWhleInVQEY/GAcr/3OZZqtgz4e5sn3x7cNH/huhtiINdX4q/9SbTNZGMgk6LawIqCRLGa8i5+lw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0rjcDYiaN+cxZ3B6ijh/iidKwqXTNEyj8QD3Da9qLul7c/G5J
	yURRpjCsPJYfj9lfzxa9hwoiTt2/EI2AWdKAq7lDBLheNU+sZ/ldTGeurPMjc1so/qH2lkROFMb
	dCdzLhNmOPwR2COYlMtUNW64jEek3rOM=
X-Received: by 2002:a05:651c:324e:b0:38e:aeab:9ba6 with SMTP id
 38308e7fff4ca-3937850065bmr44277651fa.24.1777985794358; Tue, 05 May 2026
 05:56:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260505094321.75040-3-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260505094321.75040-3-krzysztof.kozlowski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 5 May 2026 14:56:23 +0200
X-Gmail-Original-Message-ID: <CAD++jLmzzcp+CUKmr6-WLcDmB2zaOki_DTkvADOQ6V-1g710HA@mail.gmail.com>
X-Gm-Features: AVHnY4L5pGyidj4m0uJSds10p3ObB3yt2OdQMJ_NihpEGQGZ3UJKnYpGnOY1ZG8
Message-ID: <CAD++jLmzzcp+CUKmr6-WLcDmB2zaOki_DTkvADOQ6V-1g710HA@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: bcm: Move MODULE_DEVICE_TABLE next to the
 table itself
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_055636_417451_070B641F 
X-CRM114-Status: GOOD (  11.50  )
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

On Tue, May 5, 2026 at 11:43=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:

> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
>
> Most of the pin controller drivers already have this correctly placed,
> so adjust the other drivers.  No functional impact.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Patch applied.

Yours,
Linus Walleij

