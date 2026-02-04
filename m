Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4722EE9D41E
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 17:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQMMFflNqnk7npdBRibcUjPFqk+hQsIRfSSjEu4G97A=; b=aUQemFJigEGAPVl5pWC2gFHuX1
	0LegFfE36uBrQtf2gtqoeFDKm9LAjllYKqxsbKySlaT+incZc5elWqALi7D7Vi+mV39YRssEmg1qL
	Hj6231QvL0ELHDAs/9YELSq/6D0egmJuqp1dp9pnQQjxq2hCkhevGjPDs5Xd4gJKZKUYCvXEJYVdC
	jJVZs97jjU2eliNMUYYozX0goOuQJnQ/RIG4BRgpRYKwH5S4mdOyf0M7b9MeSlxaq6H31zRTmEllM
	tcZMOfsYnB5QuYCNAfwF6a5sddL8gUyPrIFxhW3DkEdEMfbv6Y0ygZsP5U4YREYr/sBOKlMN4tfkT
	yHlF/3zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhAD-00000008tol-3LIz;
	Wed, 04 Feb 2026 17:59:41 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnhAB-00000008to8-1sh9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 17:59:40 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-82318b640beso78352b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Feb 2026 09:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1770227978; x=1770832778; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQMMFflNqnk7npdBRibcUjPFqk+hQsIRfSSjEu4G97A=;
        b=Ir2vQh0JtK8Hr5uq3zAQRpz6pP1v99U/O6O7/qbdjUAt/3P0nnX1mlSepEoeafiu0c
         x+8+Sa4DpFSd9U1DJqmqoyypGM3J+ll1CudgYO89LbtBvfPUzYz8nnawcBSVgDAG0hN7
         uZjPSm3Ju0yTDn2zLKGvE0qJFlef80txugj0luRSWtW6xOjJ1snqu+i0GxVa04qEDxIi
         XCNYRNUxtCYrvVqeSXfpQ7DnaZEurBclUnifH3jXX4TQbv1vmcWPJ6Br1qZi/Sr3NYcP
         /bQ/hHmvGTcFB6B7pNbcRRsyjrZo0ikl+XAlj5ftYq9ijJm9fbVzDq0f/ao0lvHrGF1b
         tXgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770227978; x=1770832778;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DQMMFflNqnk7npdBRibcUjPFqk+hQsIRfSSjEu4G97A=;
        b=C1v4s1iw+qP0cVhUL1AkcAuHjZuT885IJt1TOnmraJIC+gFaxLeGfxufnokD7/cwL0
         L8AQNT56zZAl93+E21WBGosArpXmdsVolIPUtnfkY1jaNZZL9VB9rhSgFuZ2RI2I++ex
         9yUygcfD5WaK8qyz33YC0z6QmyRf74ZyTQN+YJJPlnhDan68HV5+edgdQn0YaVYXOTDM
         jgEpDPgF9wVhEuxffX//8peaFNE5IRHVLwbaX/h9ANesTW/aqGGPT+vFAES2BT+x5oMA
         +iVyE36N11njZ0nSkzihi/jmFclBGpxFZYnC8ZqTdwVjAgu7jFhMVeeZlX6JzOfjauxc
         GhNQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoWKGWxik5ebypO1M2lYo/FOHWKXX6fjFaWuCQuzfQOHaMfvb1T2bpdbUfmXne4HVKIz1NRNAUYh76lay/jyzN@lists.infradead.org
X-Gm-Message-State: AOJu0YxOZKYHSxhyj0Z3Jc/A6hDzju2GiDpS3vpplb47HVCygjqgPYAO
	eonwBBArNcaaOTzGTSW77MwHypkCe3MDcxcXQOUTGhuhvQXqLT4JAwAdiIDaysfSniI=
X-Gm-Gg: AZuq6aIXZVSb6WgNly8WJMZTbtRmGW2pbMqhEpp+Ccfpb3r38fRXatlDPp6GVGBfUMb
	uUXvcFXyAuybXX49z8zNXRog5AV8+kW869UGw/q+l2G1Tgzgo8cwuyH1wJMV55iIhCkaOONIDYa
	MpUNojTzqmnjMGHHZkkkp36zEitcQTjCdGAewzvlelmuaHEXS6f7Bvq7Hd2KnxUNtF9QpKcIJhp
	vRSvyZY+y/PR1xwUNl2WdMkMRDK4SebgLWoB6yxEwHbojfpQv54ChsBRXojpMQuLxfr3P+gr6Nk
	WpAioxnglyQUHxJKJ3+rfYCTZ49/LcKjWSPG4/DAl2qms91VzWLwOZMSnSpu168ckRBvulGxlRf
	POTaz0QvXG5w9M7AQgCo9JEJyklqeyeyaTJ4sxHGawO57mNRSpejmON0/4lmT74Cys87qh0W3p2
	YK+tRQBskesa3nFe6SevZPvmbKwQpWnp0TON8=
X-Received: by 2002:a05:6a20:72a2:b0:38d:657f:7d9d with SMTP id adf61e73a8af0-393725ddbc9mr3332035637.75.1770227978511;
        Wed, 04 Feb 2026 09:59:38 -0800 (PST)
Received: from smtpclient.apple ([50.47.115.214])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93397e9cesm26698205ad.97.2026.02.04.09.59.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Feb 2026 09:59:38 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v10 1/7] i2c: xiic: switch to devres managed APIs
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <aYMbY62uJo95yc1l@smile.fi.intel.com>
Date: Wed, 4 Feb 2026 09:59:27 -0800
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,
 Abdurrahman Hussain via B4 Relay <devnull+abdurrahman.nexthop.ai@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <1B0AB3B9-A117-455B-949B-24805850AC69@nexthop.ai>
References: <20260204-i2c-xiic-v10-0-c2b996425235@nexthop.ai>
 <20260204-i2c-xiic-v10-1-c2b996425235@nexthop.ai>
 <20260204100034.000050b2@huawei.com> <aYMbY62uJo95yc1l@smile.fi.intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_095939_488561_28B3BABB 
X-CRM114-Status: GOOD (  13.32  )
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



> On Feb 4, 2026, at 2:11=E2=80=AFAM, Andy Shevchenko =
<andriy.shevchenko@intel.com> wrote:
>=20
> On Wed, Feb 04, 2026 at 10:00:34AM +0000, Jonathan Cameron wrote:
>> On Wed, 04 Feb 2026 07:01:58 +0000
>> Abdurrahman Hussain via B4 Relay =
<devnull+abdurrahman.nexthop.ai@kernel.org> wrote:
>=20
> ...
>=20
>>> - return 0;
>>> -
>>> -err_pm_disable:
>>> - pm_runtime_disable(&pdev->dev);
>>> - pm_runtime_set_suspended(&pdev->dev);
>>> -
>>> return ret;
>> Trivial but if you are respinning...
>> If you get here we know ret must be 0, so make that explicit to the =
reader as it
>> was before with
>> return 0;
>=20
>> Otherwise they need to look up a few lines to realize that is true.
>=20
> Right and this is already the line above, just wrong one was removed.
>=20
> ...
>=20
>>> - pm_runtime_disable(&pdev->dev);
>>> - pm_runtime_set_suspended(&pdev->dev);
>>> pm_runtime_dont_use_autosuspend(&pdev->dev);
>>=20
>> Take a look at docs for the devm_runtime_enable() that is called
>> by the cleanup for devm_pm_runtime_set_active_enabled()
>>=20
>> Short story, it will call pm_runtime_dont_use_autosuspend() for you
>=20
> Good catch! It's not obvious from the devm_pm_*() naming... :-(
>=20
> ...
>=20
> This definitely means v11 should be send at some point, but,
> Abdurrahman, do not hurry with it, this series missed the cycle
> anyway, we have a few *weeks* to polish this.
>=20
> That said, send it after v6.20-rc1 (or v7.0-rc1) is out.
>=20

Sounds good. Thank you for your patience!


