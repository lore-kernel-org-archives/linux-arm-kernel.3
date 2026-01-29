Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24135D73EA7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 23:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tApPpTDpzWHbB1pWe+VsiMG5gGDF6f3x7Nan38A1rbo=; b=3pbEcR6J9nLKLHumAw5cLSyYuN
	BKsP97bCsqkPbfmCF/Ok1G/WNknWvZR9mSyTgLjn96h0zUJnaritacanrnvFM8AoGbQ2DhQQyfSCC
	QS1Bnqq3bluLdFOjW4KOL7LfMDGg6I53xkanae7W4t8KTq5h9JIbdEYhzZli7IVB9YWiO0X/RPVRn
	OSjzC8cYTvizw/rvb6YJ1OCszrkqAPrsrdF4LnTz38BWh5Zm48zjJbSkyJlYqfOVTcRkfxXlgcYYB
	spzp/c05iG7L3Qo4WJt0UZ1a+DxbDo0zO8X8shOs/bWIcqCTtpaaGk4YpZZviWis7VIpOsdxHKZRP
	i1QB1bUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlbSZ-00000000moN-3psH;
	Thu, 29 Jan 2026 23:29:59 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlbSX-00000000mo1-40aX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 23:29:59 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-81e8b1bdf0cso908240b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 15:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1769729396; x=1770334196; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tApPpTDpzWHbB1pWe+VsiMG5gGDF6f3x7Nan38A1rbo=;
        b=AwjnvswnD3Hcv7KQVI54rtAhCGcUchGgQQ/JcFHR3KjtaXS29YS8ea12Pq0hGsbxUH
         IDn3wEI43SqpJkd8PSJYaxYG3puxwywY6LFl5L9mIxqz8idYp+vlZoQ1+BMAnX8p4PRe
         lfW3OetxxOPu23l5Qt7B8cActM0/s2lIcgqK5dvQPDRJFSQx1SkACZTMtgDbYsoauTPi
         iq4LXxfCcHP1iH55m4ME+sYmq6WdZTKkxToy0QJfq0w1jCcjsf6RbQSdGGgtZeGGXhb3
         WQSJu3IX3GSWZqGkFwSPZqJaVss95SxIhPl7a63H4ohKGqtMoB6X65tFuDkuiIvonnkq
         ScaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769729396; x=1770334196;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tApPpTDpzWHbB1pWe+VsiMG5gGDF6f3x7Nan38A1rbo=;
        b=V3TGVxOI5T4Tw/NHwLSjIXysgL9WZoxn9ENoqFMYWpGEUL7Kybm9gC/ey+UEDX+PQP
         AePVAlLqi1OayTXOK0wsbwBUumkICUEB9c5QgKX/59Xfycyzlz2ZIkDoCdXQGIHj62WB
         4/6btf/FNsSzVz22vev7Jq3/3VGIXktOPWzxZ8CuzIpN6HY0UhecM4gNuwU7gMHiM9z0
         UBxmJZIamXJmProH6uozIXf3AETKbI84tc9Tk1iJ8i10AY1L1QZRYMmVngjjQHFqioTC
         laiiq616E2VLkqAJ+6vljr6dq968ihKHx0yeCKKdcfHWNJTTT8WbY1Lphe8P8Fl4HHhw
         iNfg==
X-Forwarded-Encrypted: i=1; AJvYcCXansnm50fpzDwPEAUfE+T7JYkNTU9l7fcDXALhUILbyQJF9EjBEUNf9jXCsrMAXJMZvFQ7faLOqmtqYQjnE/oT@lists.infradead.org
X-Gm-Message-State: AOJu0Yz86eoHPwkaWNmBZ/B0+FNWf6h1Fn817afYcfceiS0wi03Hczs8
	p+eGBIlHn34/jdJpzYG04NtHVHLsU2hEw7d0/4WjdbZBYg0JgWNJnShi26e/aMy3s7g=
X-Gm-Gg: AZuq6aK5LZ6eBjZsPbfnKPS3P4SzWgEg1PUefZEZKrSs7lY/65QkSQBRCgpUpvd6jOK
	52C7bPwHnL12/yN0EzOZVyI/FheV6gL5BxwscQeUob3yCdHsmNXeofSLQmJbvwnqwwLRLehGOag
	DSMbl5Y8P9bowevnqZp3rZHB6QCQ7V6gdZMhbnKD2odpcXCgFS+6pSv9Rh5chp+QsAEGt/sSz+A
	6+OgVycqEx1fIRxhk5Sid3xIy1mxRBvQ/wHwstfzWDd1wPSvcLfeqRxnvQiZrnapoqLrzlV6I6t
	gfv4MsBgZc3PRIW6LyyFqxxn1t0YV+lbV1Fto0pWKFyVG/tjLbq5oeRM+CemCkD50dVGj7d0SnK
	2dwtzB2OEOhg3+Lg5NAb1KAp+t/Tzl2rHDaHHSwDGMap1EE6pb9eUrta5M2WXW/gGx6hzFRDe4T
	1fAph5Mm9dPZpREv/j58V3+Gdq15FR/1/wFMHKPOex+xf5nkxrJAND0PGJD4LLVpzERFx6HHs=
X-Received: by 2002:a05:6a00:7584:b0:81b:13c5:b6b2 with SMTP id d2e1a72fcca58-823aa71186emr720685b3a.33.1769729396526;
        Thu, 29 Jan 2026 15:29:56 -0800 (PST)
Received: from smtpclient.apple (c-24-16-26-157.hsd1.wa.comcast.net. [24.16.26.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379c64b4esm6363964b3a.69.2026.01.29.15.29.55
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Jan 2026 15:29:56 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v7 1/6] i2c: xiic: skip input clock setup on non-OF
 systems
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <ab9dc191-59c1-40a9-bbf1-e6c082af128a@lunn.ch>
Date: Thu, 29 Jan 2026 15:29:45 -0800
Cc: Michal Simek <michal.simek@amd.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <2428D892-89F9-4013-9681-AD9BD76B0874@nexthop.ai>
References: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
 <20260129-i2c-xiic-v7-1-727e434897ef@nexthop.ai>
 <ab9dc191-59c1-40a9-bbf1-e6c082af128a@lunn.ch>
To: Andrew Lunn <andrew@lunn.ch>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_152958_004096_FAF1C467 
X-CRM114-Status: GOOD (  12.61  )
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



> On Jan 29, 2026, at 2:43=E2=80=AFPM, Andrew Lunn <andrew@lunn.ch> =
wrote:
>=20
> On Thu, Jan 29, 2026 at 09:43:13PM +0000, Abdurrahman Hussain via B4 =
Relay wrote:
>> From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
>>=20
>> The xiic driver supports operation without explicit clock =
configuration
>> when clocks cannot be specified via firmware, such as on ACPI-based
>> systems.
>=20
> Are you saying it is technically impossible to specify a clock in
> ACPI?
>=20
> Maybe a more accurate would be:
>=20
> The xiic driver supports operation without explicit clock
> configuration when the clocks are not specified via firmware, such as
> when the ACPI tables are missing the description of the clocks.
>=20
> Andrew

Actually, ACPI (since 6.5) added a ClockInput() macro that can be added =
to
_CRS of a device node. The ACPI subsystem in kernel could parse these =
and
convert into proper clocks integrated with the CCF. But, AFAIK, this =
idea was
rejected in the past. So, technically, it's the kernel that lacks =
support on
ACPI systems.

What about this wording then:

The xiic driver supports operation without explicit clock configuration =
when
the clocks specified via firmware are ignored, such as on ACPI systems.

Abdurrahman=

