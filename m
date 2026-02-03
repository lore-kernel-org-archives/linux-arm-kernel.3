Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76124E8784C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S7ZwS6nHEpnT2Ed8O6Wsq8QnI7o0iZGRuFsNLUgRsT8=; b=fHcP6Mip2C8Oey047yK6HmhIpP
	LrOel8uyLOZrBFQqLTALmJxH7AlQU9qkbs3q2XUDb6t8WHhDG4SLVVwZEvW9Vp44vwIgLeqRKzz+l
	MzPakvKHhop41Q/YNMHM1csMW6OMU7dWBxm+fnUffCZJdTIYawbxCIvAPIMEOHD4k4X/WJ7xKKThF
	5PurbGQRhislAWzbpjZAVPlr/NTonhvIK3kk0GPCODVjOZP1rIfY2uM/UcSRTB/EbyKIl/Xf1Puoq
	lLftIgqq/PYrMXfkdQffZgALeB+U7TRW+5HdljFVYmB+wi7VvYydZsk9DXL9Vw+TS2Mq67au/B4Xg
	/GsxeIIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLIo-00000007APJ-3Czq;
	Tue, 03 Feb 2026 18:39:06 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnLIm-00000007AOe-2t8R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 18:39:05 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8230c2d3128so3215084b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 10:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1770143943; x=1770748743; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S7ZwS6nHEpnT2Ed8O6Wsq8QnI7o0iZGRuFsNLUgRsT8=;
        b=FfziOGza3voeXo4T1/mZR/sUFWRKTP8ZzlWWmpBK80UkSJL7rV/pwtnkrXFLQhvHQ0
         wbfbt16hjRHpJsSuC/qxaIYdckt72dLFEBedeJMNqdSLuCzPeDQwiYLW++3Kqr1h7PEW
         TNtq8dVZXUxjbT/qp5qin6XIjoh6qPeAz77BQR01hemBA1qxRDbLdYMwxjg29oS78dRm
         2lT9yIqkHrmjCWwMVsiMtF6nYXaCr+6EHXXoezOUB9fRwhOjE5OVXs+Xyt1dDl9b50fU
         maR3JUmpGXjDBlroJTveYi+xflbpjC4rO+Wrj24fhuyPw15WQyL3OPK3yFBnraV/SNyY
         +lfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770143943; x=1770748743;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S7ZwS6nHEpnT2Ed8O6Wsq8QnI7o0iZGRuFsNLUgRsT8=;
        b=U3t6uyVZ8Ygf4SDmh/fSr2Yc2iUmB2zwYEOn7n22URMXbZP8uwHvA1ln+0biWttIlK
         KOYgKso3cjKeq7L1+p4E60Xg0uUAXrOtQeTqRqHOKC5g09PQp9W1arWrl6IjsH5WUoJ1
         hfUNOupVYWRz+pwO9DmyJsSZgiDjSNyNZQtwUQZkx2bFDKm6Kyd9Kzl+GR6TyWjumFRq
         DRbm02XRt7f+BEfSrUnOGRnj8mrTbHVs4vr8Yt2A8rtlPcryB4j3rbSJ/amPT7etbtME
         HZnnC1dgtxm/B/tHxAJpiDHrrdEhrc6ra5Jd3asFUNAQA4s05GCe87mbLbUfY7T6JevO
         emvA==
X-Forwarded-Encrypted: i=1; AJvYcCWX9qcMTob2j5HFWA8Ei4sHWUb/20OU1XJWvNLnShvMld/f7t04DtxC60Ycq+GmZ4U2MN5LPD7dfpsUcnHPT6/R@lists.infradead.org
X-Gm-Message-State: AOJu0Yy91jFD+Sm1FQbep2nCbZYxV7YETDfNzfa8txQhCEZho5bIwEu3
	v+sp31Wr8nS4EDJYbPDyVFmv0BU1iPKaqqCaxvVo9mrNri/YRgooFBFzFiw/x6DyqEk=
X-Gm-Gg: AZuq6aLW/nwD1ZjluMoMmGbBcqdnwiNU+DwnoR/EiUDxTZ9GGElC3I69tXXKYPPDJmO
	Py+JZ946ZoGeRjBdtkcegC6nv/U5XGxf5vehjn6EWP8ENYcF2HwJB6/E7VRUdM9WF90BknM/hKW
	0p3v4JxLgKxf6+VzJCnhxdxfUxQLfXLj2UDgVPIMV5ROcldzi1QE6EVAVb+nw9qNA+U4q80NKnu
	/ktNbugw9gb4Q5Rofjvo19S0Ahhc4uUMTAMrMt5mijyXoUK1DD+QMBrNiuyUVvIyH/Nr5EPAm8c
	ZDogZbebwzk/XWjr6Ipb92UncUjEPz7f7KmzAk2JZh57odjQD4SX5Fng32ptJBxvPwOstGqfjwj
	gxtikRmUm3azIocnhUoXITufeRbCdLPiKXg+/rhMb+ukXbkOXvWg4nnDi4hOGSd9UwrH5WGw+7X
	6lCTKL/dmMSWA9mLkbmTtkmjuDezWcWFSfp60ywi0WHG6Pf5/e8PYX5OBJ
X-Received: by 2002:a05:6a00:1148:b0:81f:9c39:14f3 with SMTP id d2e1a72fcca58-8241c5f6390mr296399b3a.42.1770143943444;
        Tue, 03 Feb 2026 10:39:03 -0800 (PST)
Received: from smtpclient.apple ([2601:602:8701:5361:2dd6:2d53:d593:7d46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d47a418sm68996b3a.53.2026.02.03.10.39.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Feb 2026 10:39:02 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v9 7/7] i2c: xiic: skip input clock setup on non-OF
 systems
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <aYIYUNejGCVdekx7@smile.fi.intel.com>
Date: Tue, 3 Feb 2026 10:38:51 -0800
Cc: Michal Simek <michal.simek@amd.com>,
 Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9F7815FA-80D8-4C96-B61F-5CA6CB405F7A@nexthop.ai>
References: <20260202-i2c-xiic-v9-0-ce4695f5267d@nexthop.ai>
 <20260202-i2c-xiic-v9-7-ce4695f5267d@nexthop.ai>
 <aYIYUNejGCVdekx7@smile.fi.intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_103904_749516_3547EC02 
X-CRM114-Status: GOOD (  15.64  )
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



> On Feb 3, 2026, at 7:46=E2=80=AFAM, Andy Shevchenko =
<andriy.shevchenko@intel.com> wrote:
>=20
> On Mon, Feb 02, 2026 at 08:37:24PM +0000, Abdurrahman Hussain via B4 =
Relay wrote:
>=20
>> Currently Linux does not implement ACPI ClockInput to describe clock
>=20
> ClockInput() resource
>=20
>> resources, unlike DT. However the xiic driver is happy if something
>> magically enables the clock before the driver probes, and does not
>> turn it off again. The clock should always be considered optional for
>> ACPI.
>=20

I just used the wording provided earlier by Andrew verbatim. But can =
change
to the following if you insist:

Currently Linux does not implement ACPI ClockInput() resource to =
describe
clocks, unlike DT. However the xiic driver is happy if something
magically enables the clock before the driver probes, and does not
turn it off again. The clock should always be considered optional for
ACPI.

> ...
>=20
>> + if (is_of_node(dev_fwnode(dev))) {
>> + i2c->clk =3D devm_clk_get_enabled(dev, NULL);
>> + if (IS_ERR(i2c->clk))
>> + return dev_err_probe(&pdev->dev, PTR_ERR(i2c->clk),
>=20
> Haven't you seen my previous comments? Why 'pdev=E2=80=99?
>=20
Sorry, I missed it. Will fix in V10.

>> + "failed to enable input clock.\n");
>> + }
>=20
> --=20
> With Best Regards,
> Andy Shevchenko
>=20
>=20


