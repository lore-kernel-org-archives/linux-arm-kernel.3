Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9804DC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 22:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ikg7uKNlFxdtInhouVVjlX/eWNb/Iocaf0FOoIsWq04=; b=PZ1LODiIJ+WtYGWwIUfI7LeYJV
	u/8Asx/Wg0HGzziqbREv7Bau7Qb4UZN1B9Z/XVwEJVAG7xl40gcV3ZjU/LZeicx9Fq4tDrh4kr1Uc
	TPOAqTusPPgYKQwVLy5GV5Wma5iDCITWWpvbNvwLimLtnDM64wj+AHZrKhy8nDtgllcQ8hasFUepu
	Q6MNm8saqNHDbt+7PKYNtj7gP1TYFJHvJ9Hax4cK1TLY5snOI6GB6v17DNuvKBcU84gDkPBMrs/pX
	Sd3nVA3NE0qeqZHTSrH7nQz03ISbiRmJ3tgd7cqHiD3Frn+y/DyENhbpxzhTO2jGFf/0pfYsvXy9g
	vzGTK7pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKcq-0000000GVzs-1CSF;
	Wed, 14 May 2025 22:30:56 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFKah-0000000GVq7-0Aur
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 22:28:44 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-54ea69e9352so304184e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 15:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747261721; x=1747866521; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikg7uKNlFxdtInhouVVjlX/eWNb/Iocaf0FOoIsWq04=;
        b=WTzPiPxucFGUVXvHGdOfphCOFD2IK9XCm6UDb9cgIVGGQ8PuP0W5lawEmfMErhYvqt
         MTK915+eruVseIIbxGDCaRiQH9ntZVPpM/IHaGAAelltKdSyrSafvI/Tqqc9jRMDKWuq
         qiF0fHhHz2kkFP0MBJ6QB+e+PdPTF4hFl3fTaorryUQrx5W2xehanbdh+cFJep5+pcbu
         Uxu9+mqOHUDUuo1u4UDpm0Jyz2fpzeWNBV8AP8IgUz2cEvRHRRDny4eZXNxHJQYp/eSW
         G69x+Gwd/8jcDu68Y1sjvHvBRybuu3stX8x9Dd7CAoTeBvUkOrDsOKwNsypb/NhfpQhp
         Fo/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747261721; x=1747866521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikg7uKNlFxdtInhouVVjlX/eWNb/Iocaf0FOoIsWq04=;
        b=DlUAKHeynNajJ6aag5eCoZOhOqOMt59pNMTEqgwx+o8r3YrbCKEOoasylG2fISO1bx
         +1DpGABjwI68hwIQj9/hrsSorjQwW49CsxIBJ5GnjReHJ1d/dM1JOfVMhhnbgIAvfFhg
         G4nvYTEaA8ts0aHXDxthMAImTsUWz8AAMB9V4YbBEeONGEFpTP0GycPuXqzqwnx2IEbv
         sL84ao5fTtPkBfdL/eoQ4IN9zOeJbOYz3GMhAEdohgWARoocTVxmmT03ImbJWGispqg2
         qKz8aHrQ+NhfIeBHwMAWqRcohrWol4dJSa3ISMdEwFHy4ITN6wU48r4N81KKr1ouEU3s
         /bug==
X-Forwarded-Encrypted: i=1; AJvYcCVHz3t2WdRwOUjzRClJrDF9C83g8Fqjc23plL1ePzYRw/daSzOjvo/ILKUu4T62Zn4cfmZ6hX4dQIOj+DNDI2Xy@lists.infradead.org
X-Gm-Message-State: AOJu0YyTPPBCPrtDBCcXaWlwhptACQxkafTjLNRZu65919Cw2QsQ7RXy
	MEiwl91y3A5NJDu0s3HVMU901bd2ubiIEOFsq52YkYJyu8JZSOjeY9lEo/jZHEkiwTHuoym4QHI
	WbKbtvibGfjLV+1O7t3PrvzoWrT7220QcKfLG6g==
X-Gm-Gg: ASbGnct8+4+VjTHJvatmB1jaVXiONpCQ64KKpb8QnK8circyf4UabkAMDKLXS4nuwny
	OogZokUfjz9B4hqfO/2Tx/YEuFeJ147iSKbbp9NMxVssmLcF4h5Y9pwxjSk7WWGXMjoWUY1dSeQ
	EREyfMzyVEUKd5PVM63CJaPHdJmn40JTXle/+Ow8TqWxM=
X-Google-Smtp-Source: AGHT+IE1Vp4rlvI75qMKlDEVkN1t9zzD3BxyByO5SW27Vl1zUjiPYHzMEgLHLW0x21yYIa1dbtvC8PDJZuRwP2Kenrw=
X-Received: by 2002:a05:6512:450c:b0:550:d534:2b10 with SMTP id
 2adb3069b0e04-550dd12aeeemr60274e87.35.1747261720610; Wed, 14 May 2025
 15:28:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
In-Reply-To: <20250514-pinctrl-a37xx-fixes-v2-0-07e9ac1ab737@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 15 May 2025 00:28:29 +0200
X-Gm-Features: AX0GCFsW1KstBI2jcV_icDkbitXFWIRxmcRnuAcWr-VFZ0eu8OVxn2v41gFG6Ok
Message-ID: <CACRpkdb2Njam8GGuN5yeR+DYvi0xe11xbARaoDepoGk=gAK6GA@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] pinctrl: armada-37xx: a couple of small fixes
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_152843_099766_66CA9179 
X-CRM114-Status: GOOD (  10.56  )
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

On Wed, May 14, 2025 at 9:18=E2=80=AFPM Gabor Juhos <j4g8y7@gmail.com> wrot=
e:

> The series contains several small patches to fix various
> issues in the pinctrl driver for Armada 3700.
>
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Patches applied by applying to a separate immutable branch
and merging into my "devel" branch: we were clashing a bit
with Bartosz rewrites so I had to help git a bit.

Pushed to the autobuilders, check the result!

Yours,
Linus Walleij

