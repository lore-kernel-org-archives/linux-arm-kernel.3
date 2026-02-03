Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1EEFE7FDCF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 19:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkfty02cxqofjS2vATNtghiojOPwFY5oNur2jl4/Hn4=; b=heoZxBtLIUktlryuGTASIR1XJq
	sNixKB8i7jGTDf6ufmCYSrmlYpdOmhy+VBpP5mUtHVzRMU8w/h9bct2QlbKnuLfbzwr7rq7E6Vp9D
	ieiYsobDvC0XkpkX1eGyoztq85AsUZEbOkKue8dfjqpUn2SyuZng5xqLTLWnVvCfSuXiifS+QSgaG
	ytcU1zBXTTtb0eJMDWW3R1vthE47XlXCbivrV92nLo0CiogY7lgvQxR3eFZKObXVIt0l5dr3OtAEk
	cWdm4yohgS3o5BOgw5K5s4OamxXzTB7T9g/V4rvorgXd4UdmHzgFgwUJUQq5qZJcb6J1zieg5m98m
	uI6x/8rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnMWx-00000007Ggf-3PHc;
	Tue, 03 Feb 2026 19:57:47 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnMWu-00000007Gfz-3AZP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 19:57:45 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-81ecbdfdcebso3300534b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 11:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1770148663; x=1770753463; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tkfty02cxqofjS2vATNtghiojOPwFY5oNur2jl4/Hn4=;
        b=GO3Di/jtOY2wWYvTu5ZAH229bBq0as0yMjFD5PAUVaE+FT3j+JMkmT7cgMjihdqX+e
         Uy5YfD2ygyuU4WytNY4MS7gCD4C2a1Lgv8WDs3C056E9giqoh+wYB4afgClbHexV5CQK
         e2vzW6SXPwaXtkuQ/zjvkWF0C/jOxDTNYzPG7b8X20XQwEgCuD3JDgCQvaX3IXIfqlTg
         tRKhAmL+VHWeo2TBeorOMVbAJ7oh0seOpwtUh55UjMP8J6v497n/RY0CuJJPtU7enHQO
         goyzaKz0dmV1SOCY7g2QVDQB+p7KTCT5dOG7VyAtQw6n00HbM7CTToEShn60GOQbUDm5
         ywug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770148663; x=1770753463;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tkfty02cxqofjS2vATNtghiojOPwFY5oNur2jl4/Hn4=;
        b=eujKUr3vIvx/Iu+7VVnTePTbBUdZ/ilFPZckUTc7VFF6Kb3oXotQyCx/STpgt7/ovv
         Xu5vFqVvfBtHAzEwgf25Tktbdvdc3m27a5c8C5EuJ0p7p3mFurbOBgIVsOkpLL1fdOjX
         HQZcB0C6ClyRBeNKJCsqDcFR6Ww+tjECNjNabGzoNwaAnXKTqTT28j5xlAf1WLstVNbr
         q9nqMh0a5CKLr7ZiJZrZc9DxTFDWch/3u1/4PneYSkM0RX96kYQyHAT4zxzbhlZ1H31C
         DuTcVx8bQahnvWmn0CqcYSC306s9zOxAfpMYTcCPsMpJoYj4aF2Qdw/iI2YYh68gD25S
         SFFA==
X-Forwarded-Encrypted: i=1; AJvYcCUlrcJMDqlukHI8HPmq5rKtCVHxqdVAy9UXdsvMwdY013Dl3FnZY9DY3p0msjzm/iQr8SzAbHcVwxnKnq01v5DC@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4jRCFtDLFpwayEw+mivn/3LWqw2skKjI4V+zXa0Bv3lQkTV0F
	depVx4JvX7XRjV/Rcs7DFelD09QysW1F2rz2ryWfGNmMXpf9B5Cl1acAFEfUjmVNidglIxkOqiw
	khkfw
X-Gm-Gg: AZuq6aIRbsIKfoc+y+Vc882/8dg/zEXgHBT6Zn9NSfRNojmo6KvKeN0LTcbBfXGeDg4
	xdkD0gCoL9/Ufqn0qrw/uFvxo50ZmIdG742vTTPCL8Xd6cHtBALTAL3uiw9HGbV8dcMD2QLhhlW
	+pDS052Fs2AdBW3SH/zgD07vUMSla+NR+lQL4WkmqgvPTFbOPrR/8Nt+We8XKFsG9ag9wAg2Wqz
	a2cluFLk/FCBzQHbN3/USFOv9bo1YB9hwBCvYIcmZOb/OxfLIo0hCupZ4kmT8dktZfyz6p3RzPU
	kcu8PkWJ9Y4RfmmSuxknNCpptm1tgmDOeZl/EQnmu8GC/2HkKtcahGRHw7UMjAjmzCNQlE1KSnW
	9h25/Bz1wEuuVZJYHkkgvySczMalkA3lGsw+Z6worGIAFT9zt+MfRJufBMuAe21pCNcL9Jjm0k8
	8vdP+7TeUJFz12ZQWrp8ec+BssH4/viHSYlBsh59ZLZt3cwL+kWQYplYnE
X-Received: by 2002:a05:6a00:80a:b0:81e:ef16:b288 with SMTP id d2e1a72fcca58-8241c1dfd64mr495588b3a.22.1770148662815;
        Tue, 03 Feb 2026 11:57:42 -0800 (PST)
Received: from smtpclient.apple ([2601:602:8701:5361:2dd6:2d53:d593:7d46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d4af6efsm181555b3a.65.2026.02.03.11.57.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Feb 2026 11:57:41 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v9 6/7] i2c: xiic: use numbered adapter registration
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <DF13B121-56F2-4987-A47B-99A20E18554E@nexthop.ai>
Date: Tue, 3 Feb 2026 11:57:30 -0800
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
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
Message-Id: <2D57C995-C65C-4F61-9CDD-9884967E7CC2@nexthop.ai>
References: <20260202-i2c-xiic-v9-0-ce4695f5267d@nexthop.ai>
 <20260202-i2c-xiic-v9-6-ce4695f5267d@nexthop.ai>
 <aYIYBheQgIN71os8@smile.fi.intel.com>
 <2F830E87-F00A-4A54-A5CC-E59BD2C5C7B2@nexthop.ai>
 <1ac7be34-22b1-4d93-9957-fc7ade9a2649@lunn.ch>
 <DF13B121-56F2-4987-A47B-99A20E18554E@nexthop.ai>
To: Andrew Lunn <andrew@lunn.ch>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_115744_806270_D2C5E6CD 
X-CRM114-Status: GOOD (  18.63  )
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



> On Feb 3, 2026, at 10:50=E2=80=AFAM, Abdurrahman Hussain =
<abdurrahman@nexthop.ai> wrote:
>=20
>=20
>=20
>> On Feb 3, 2026, at 10:31=E2=80=AFAM, Andrew Lunn <andrew@lunn.ch> =
wrote:
>>=20
>> On Tue, Feb 03, 2026 at 10:14:49AM -0800, Abdurrahman Hussain wrote:
>>>=20
>>>=20
>>>> On Feb 3, 2026, at 7:45=E2=80=AFAM, Andy Shevchenko =
<andriy.shevchenko@intel.com> wrote:
>>>>=20
>>>> On Mon, Feb 02, 2026 at 08:37:23PM +0000, Abdurrahman Hussain via =
B4 Relay wrote:
>>>>=20
>>>>> Use i2c_add_numbered_adapter() to allow platform devices to =
specify
>>>>> fixed bus numbers when needed.
>>>>=20
>>>> Not sure about this. Doesn't it break the current approach? Please, =
double
>>>> check that.
>>>>=20
>>>> --=20
>>>> With Best Regards,
>>>> Andy Shevchenko
>>>>=20
>>>>=20
>>>=20
>>> If pdev->id is PLATFORM_DEVID_NONE(-1) then =
i2c_add_numbered_adapter()
>>> falls back to dynamic allocation and calls i2c_add_adapter().
>>>=20
>>> Many existing i2c drivers use the same approach, see i2c-pxa.c and
>>> i2c-pnx.c etc.
>>=20
>> It is not about if other drivers do this. Its about does this change
>> the behaviour of this driver, so that I2C busses get different IDs
>> then before, and so cause regressions?
>>=20
>> You need to explain in the commit message why you think this is safe.
>>=20
>>   Andrew
>=20
> Before, the driver was always doing the dynamic allocation due to
> i2c_add_adapter(). So there could not have been a system that relied =
on
> consistent i2c bus numbering. Even between reboots bus numbering could =
change.
>=20
> The systems that did set pdev->id and were expecting a consistent i2c =
bus
> numbering were broken to begin with.
>=20
> This patch won=E2=80=99t break any existing systems or cause =
regressions.
>=20

I can add the following to the commit if you find the wording =
acceptable:

Previously, the i2c bus numbers were dynamically allocated because of =
the use of
the i2c_add_adapter() call. This meant there were no guarantees about =
consistent
bus numbering. However, with this change, on systems that don=E2=80=99t =
set their platform
device ID and leave it at the default PLATFORM_DEVID_NONE, the bus =
numbers will
still be dynamically allocated because of the check in =
i2c_add_numbered_adapter().
Therefore there won=E2=80=99t be any change in behavior.



