Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09C8E8784C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 18:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AhLtBFYuwe8sjQdJz53j2wA7HDUB30kbmrpluvLvkdw=; b=ZKHSGQ1eDSUzuJfKJu5ATB5oTg
	XCgkYCoFt0mCWzR7L/zD8P4ePIA7HD5JcpsRCMnF0YLsXOTBkXcdTXIjMbT2vPEeE/fpSPesoElO9
	V6hvi+LMXyGXS//TUPkxzvpMzkoA7VwoS9daEjxAlyTbcQ6I+JhJkBOAwtCoi2N9xFbiRf0IHwKrO
	IalT3Tuo/kLEMMPcSn61IShsFu1+AC2WM6+lyuvkZ3JA/wOsl/UAgO6JtGmGFWgyoTebnzxzBm3Uy
	VWPF1VzpJA32IUF5s5RGIRfL5k2GTmKgwx7OEVMfSpcZwuniv2IcDw4J6BEgf6Od6JhRwgaMSMvBv
	lkwNezFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKvZ-0000000773W-468X;
	Tue, 03 Feb 2026 18:15:05 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnKvX-0000000772r-29Tj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 18:15:04 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c6541e35fc0so3393127a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 10:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1770142502; x=1770747302; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhLtBFYuwe8sjQdJz53j2wA7HDUB30kbmrpluvLvkdw=;
        b=ZFO3+m/kRiLbIUmqo/6GOsOHSq1xoyKISDKSXi1Yj6n4kCO+NDXQJTxn5ViaEsw73K
         jObuCr+oOvHKU9cqGQTdkTfRUhL5dcpItMyG2YAEravjXDmBKXcZYBBgt4OvV+89fCk+
         8YVKjuivKgjp4uE8NNuX6JVUdXO7fjAIjZrYF5zcE3QE8QtgN88qvcDg48djFuDJcq0u
         rheB5O4o47LSVz3c0lWuNJKBUPNinqtd2C5dtpb2UJkGAOmxzW2Cieewr/olkyRbLkQ2
         d/xO56UcGqVotnVEMvVUooX8nrRh1H2hYIZAu57fS5cC7xtfSBRJlDQac5mbTeozwKcv
         8tJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770142502; x=1770747302;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AhLtBFYuwe8sjQdJz53j2wA7HDUB30kbmrpluvLvkdw=;
        b=bwDreNzGgjRZ7GqIQYxIHt7d+VGF5ey19fwi58cUXplKiZoCv9V+WUxaalinL/6eRk
         /jpP+n26bkbVJ6VkfjA1wYLx6dxuaG4dsiTz4LfkcvHsImnR8vEAApnsPCjYcTwepUXl
         J08XSTtwDJChXQjcb6jHwcBSDG8oPFISVAAdKp7dRlj3iLBiGEkmMQX7kroYJTE4AZsA
         IkQlywtm3PMcH469v0MBS8Sfxwf2gZLd9BlTZNnzH66AXfcMYuxbseat4og7+O2pPupA
         gqOaI68fdtXBuLm3NayifJ6qZPJgg7U0T0lRrXfxzVNOGTrvxzj8u2Qmn4W3hwtG6osC
         AI1w==
X-Forwarded-Encrypted: i=1; AJvYcCUpnVZ6TJFPLs+2gINO3qvu3cp/rNWMo4gFfYGezX4vs39sGZUzYdD0kJ2MP5nAdasePSiKu4KIXFiaG2wVB5TM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw38UWQGDIQCm631PL5+Uld7ER/dIQvJyjJhssVisUsIgUlUZpT
	h/JOqgPioBCU/qNiulpb1F7BEQqaRM0v2Qpjsk7u0PNiCLyL9RAhfaPskTBZZlVCDr8=
X-Gm-Gg: AZuq6aLulTs1W7UxV7Ud96Szda0lqqsk4D/ABsP0w7G/lZ1aOOAP3kAgFt4Ha+pxSpw
	QsdXE4LcPN6+ncXwQ9ryC8vsl9zEYhFhEaTDUsAYKNewsnmQHvkpFCHanx+HQbKNEastxk4EQSF
	kjuq32U5ZOQJ6KYoLGrnrnHJk6CmYEVra3bvfCj4bYnuzUHmMnZems43BEnr7/TSE70XY19AYNU
	PJawQihl8rfq7sLZqRF4jgPwZpi1aXKQyMPetIm0sBAK52nJbqWRUmXk19H2+SDRfbnqIMRyOSp
	Zca3J8+TL0iHUibVQx54TBAWj+yXdZv+Z6YknikASAkT7ZL9637JdKeWtq3PddB4HMZq4ObGkUz
	ENYJrym++oj6pGVXf++PqylY7b6ad/RiEr214qAdLduH7jagJH4zIYhUNXGsxFnWJEXz9tWZskP
	FPqVJlkF69A1OjI5cn6eiAo8sAgtjdOOeXHB6uSthtULi7Rg==
X-Received: by 2002:a17:902:f711:b0:269:b6c8:4a4b with SMTP id d9443c01a7336-2a933bc9acbmr2072775ad.6.1770142501839;
        Tue, 03 Feb 2026 10:15:01 -0800 (PST)
Received: from smtpclient.apple ([2601:602:8701:5361:2dd6:2d53:d593:7d46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d43513esm32495b3a.43.2026.02.03.10.14.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Feb 2026 10:15:00 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v9 6/7] i2c: xiic: use numbered adapter registration
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <aYIYBheQgIN71os8@smile.fi.intel.com>
Date: Tue, 3 Feb 2026 10:14:49 -0800
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
Message-Id: <2F830E87-F00A-4A54-A5CC-E59BD2C5C7B2@nexthop.ai>
References: <20260202-i2c-xiic-v9-0-ce4695f5267d@nexthop.ai>
 <20260202-i2c-xiic-v9-6-ce4695f5267d@nexthop.ai>
 <aYIYBheQgIN71os8@smile.fi.intel.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_101503_581685_8CE3F2AA 
X-CRM114-Status: GOOD (  10.64  )
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



> On Feb 3, 2026, at 7:45=E2=80=AFAM, Andy Shevchenko =
<andriy.shevchenko@intel.com> wrote:
>=20
> On Mon, Feb 02, 2026 at 08:37:23PM +0000, Abdurrahman Hussain via B4 =
Relay wrote:
>=20
>> Use i2c_add_numbered_adapter() to allow platform devices to specify
>> fixed bus numbers when needed.
>=20
> Not sure about this. Doesn't it break the current approach? Please, =
double
> check that.
>=20
> --=20
> With Best Regards,
> Andy Shevchenko
>=20
>=20

If pdev->id is PLATFORM_DEVID_NONE(-1) then i2c_add_numbered_adapter()
falls back to dynamic allocation and calls i2c_add_adapter().

Many existing i2c drivers use the same approach, see i2c-pxa.c and
i2c-pnx.c etc.=

