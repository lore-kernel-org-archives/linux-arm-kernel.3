Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7530CE7DF19
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 18:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UmAP85T4hD2xzqQLiYF8/uEGgU9rFd+QCSkTmTB/L8k=; b=dMlE/KX3O1BnuOWjjBABrNuY6c
	XptqVsapR/lnmLJO0CZGbceQn3xl8PfImte37qr3BVLKYiXB6kJJuiiTQ282CNfZlUP60SXu30qa9
	rGJOkGUy5INU0G9QZ3U1BCPBSx6Gqkd+y1TIJs9HBYrmh+9xI6aaLqt85bdANjd1iVaR/F8vwhid8
	5iajDFadJ9PopfTqBnU8lKGdx16Bk5p3mNc6HwI5lBRDO+2m6I+WDFy7RaqCZWaYujOt3XFnolk1a
	/mOKMBiH5e8V8G+oKiRZ7tzNXAM44LUFYUJtrEKp1DoOLXv5kVGZtzLawCe5hI3OVBa7M5+JF+31F
	QH9fEeZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmydV-00000005Q8X-1npX;
	Mon, 02 Feb 2026 18:26:57 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmydT-00000005Q8C-2Dgv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 18:26:56 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-8230c2d3128so2510827b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 10:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1770056814; x=1770661614; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UmAP85T4hD2xzqQLiYF8/uEGgU9rFd+QCSkTmTB/L8k=;
        b=dvQT+kNhloCU0h3w1t2xkCpnO9ZcQDnqtjpnhd7P+R5Jz60gxjqQQbkEZ+yB6I/br0
         4s418vaVVD6sTQyCD6/qGvmWEh40eJ1JDCtG5fWXn+RxvNV/jG7ZHTXnIYUo0EByCUbg
         Sk5aDVOgm7PSMECXn4mcqeTrAiBrncYaeuajniKohxg1UND/nEDgloFO0v1DrJ99HLmg
         FUtDbz08FM10su/pV/DVdoVM9hJDh4jjCcTIFnx1eRPaGbWix/e3jHWXPXBR3VfhnAGa
         27Y/TY8Z+V6Rlepj9iDHNu/NDiOGu8YuJhX6IT6dhRajjhhA4N3r9bJ+9Q5wiSEM6Th8
         gyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770056814; x=1770661614;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UmAP85T4hD2xzqQLiYF8/uEGgU9rFd+QCSkTmTB/L8k=;
        b=DqtdS0OwtDqptPe3SkoLLUfDMHtvE39mCj+BUC7eSA7t7Olv3oSHKlpPsJxtj4Hv8E
         QON/x/m7pMnZWUapp5MPqTQc4ZzQNiw5jrLZkHDBysmzhwJp86V6xDJTGWNhGdNLhccQ
         qqSSfmaVztV+q6dHGbf7q+JpyWpwrMGdnCv9CKrn5VYRhd8Cd3lhhWht8oUQMTkV/HKy
         2cI8cDj9yEu9YCD4dTCNplzI7gJLia4dRtwki2jU3KEv8M1O/gDRSqigNrN77cIbLkjF
         1e1IZVNrbLz9VT7w8FBrHNmiz7ehHCiF8zN8s7PZ/k8h6QziEVGNkp9mpv6mt22RcTh7
         bXvg==
X-Forwarded-Encrypted: i=1; AJvYcCVLLZ5iVCJwhJVy+ethr7vX4N2vZYBuLU1VklkxwxHk7nM3WfE59OkCYk8zenOAObnmAfIAyG+sbdJ10XCLuKtt@lists.infradead.org
X-Gm-Message-State: AOJu0YznPmezhntC1mnr16JOPOOZJtgkyfigMQA7evZefYravUmHDsH2
	3nb9lXAIRHJCTwvPnXVRN7r03BauaQWtMDWcp3QcKoffLGUFm+0cJQwonaizNNseKaA=
X-Gm-Gg: AZuq6aKpPfZ3idPKmYBygIrKxIlMvPXe/9p9yB85vBBICAqaiICUoKeWbh3J7EQmiJT
	NVzi39R8EgO5pqUUCgmR1LcoiT5EEDGioPRAjim4h/5/p4TyfUC97QIv+pz7NntSuLLxTxhvo3m
	CBs+2XogwoxByR8UbERnxoMudM+WiZ5Rol1CL/npa+2PkSzCsL9OP1CG1PJyFY5I2FGdqBIsBHA
	GEEdREY2ZlrZUCGZ6mXSWxhtyuAQYTpy/V8c/LZ33oQVHrgcAMYXIoXeFAt2Vy4KLd3IRIaEjUS
	TckikL88gW7Pp9G8Bj2UctE+AT/ZDYKvLqJp5eUSzvEC9xHiv2Dwlpf88pI2f6eRwf4kzuX7eiS
	hoE/4AKbDnssAnDtwFjGCcGqYq3h/xuyxPtALdF0G3/H5q8humqkMxHjMSs1K7xYKgrIh5gX/3f
	b8CHhtoevYkzoi+Vzc1PT/kPtuO7AUIzE+uww8TpVivBBjG1txUqwq5NZE3W5QrntVEgWGRSouO
	co11qSVXg==
X-Received: by 2002:a05:6a21:34c1:b0:38b:ecae:671b with SMTP id adf61e73a8af0-392dfd7bb59mr12340570637.0.1770056814292;
        Mon, 02 Feb 2026 10:26:54 -0800 (PST)
Received: from smtpclient.apple (c-24-16-26-157.hsd1.wa.comcast.net. [24.16.26.157])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b59e10sm16991693b3a.25.2026.02.02.10.26.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Feb 2026 10:26:53 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v7 1/6] i2c: xiic: skip input clock setup on non-OF
 systems
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <8be34da2-bf0e-47a0-bf91-3329ed0ec8ab@lunn.ch>
Date: Mon, 2 Feb 2026 10:26:42 -0800
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
Message-Id: <7B60C48F-B2BA-4443-A4B7-F5086667A1F1@nexthop.ai>
References: <20260129-i2c-xiic-v7-0-727e434897ef@nexthop.ai>
 <20260129-i2c-xiic-v7-1-727e434897ef@nexthop.ai>
 <ab9dc191-59c1-40a9-bbf1-e6c082af128a@lunn.ch>
 <2428D892-89F9-4013-9681-AD9BD76B0874@nexthop.ai>
 <aX3VqGlIUGCvMY5p@smile.fi.intel.com>
 <CAGYn4vxRbPVFvzm1b_mk2KvnRcJSO0Ewmx1tCTEALaZAu+ZQJQ@mail.gmail.com>
 <8be34da2-bf0e-47a0-bf91-3329ed0ec8ab@lunn.ch>
To: Andrew Lunn <andrew@lunn.ch>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_102655_696532_2D31175D 
X-CRM114-Status: GOOD (  26.40  )
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



> On Feb 2, 2026, at 5:21=E2=80=AFAM, Andrew Lunn <andrew@lunn.ch> =
wrote:
>=20
> On Sat, Jan 31, 2026 at 08:30:40PM -0500, Abdurrahman Hussain wrote:
>> On Sat Jan 31, 2026 at 10:12 AM UTC, Andy Shevchenko wrote:
>>> On Thu, Jan 29, 2026 at 03:29:45PM -0800, Abdurrahman Hussain wrote:
>>>>> On Jan 29, 2026, at 2:43=E2=80=AFPM, Andrew Lunn <andrew@lunn.ch> =
wrote:
>>>>> On Thu, Jan 29, 2026 at 09:43:13PM +0000, Abdurrahman Hussain via =
B4 Relay wrote:
>>>=20
>>>>>> The xiic driver supports operation without explicit clock =
configuration
>>>>>> when clocks cannot be specified via firmware, such as on =
ACPI-based
>>>>>> systems.
>>>>>=20
>>>>> Are you saying it is technically impossible to specify a clock in
>>>>> ACPI?
>>>>>=20
>>>>> Maybe a more accurate would be:
>>>>>=20
>>>>> The xiic driver supports operation without explicit clock
>>>>> configuration when the clocks are not specified via firmware, such =
as
>>>>> when the ACPI tables are missing the description of the clocks.
>>>>=20
>>>> Actually, ACPI (since 6.5) added a ClockInput() macro that can be =
added to
>>>> _CRS of a device node. The ACPI subsystem in kernel could parse =
these and
>>>> convert into proper clocks integrated with the CCF. But, AFAIK, =
this idea was
>>>> rejected in the past.
>>>=20
>>> Rejected by which side? CCF?
>>> Because specification still has that.
>>=20
>> I think the argument was that on ACPI based systems clocks are =
"owned"
>> by AML and there could be syncronizations issuebetween AML and the =
OS.
>>=20
>> See =
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1712165.html
>=20
> Doesn't that just mean there needs to be a call into AML to request it
> take an action on a clock? Otherwise, why even have ClockInput()? This
> link is to quite an old thread, 2018, where as ClockInput seems to be
> pretty new.
>=20
> The fact ClockInput() exists, means at some point somebody will
> implement it. Once it has been implemented, somebody might need to use
> it with xiic? Because it is mandatory in DT, and there is no ACPI
> binding document for xiic, they could make it mandatory in ACPI as
> well. And then your device breaks.
>=20

That makes sense. I might have misread the thread and came to the wrong
conclusion that converting ClockInput() into a CCF clocks was
undesirable. Thank you for clarifying. Maybe I can start looking into =
adding
support for this after this series is merged.

> By putting in the commit message something like:
>=20
> Currently Linux does not implement ACPI ClockInput to describe clock
> resources, unlike DT. However the xiic driver is happy if something
> magically enables the clock before the driver probes, and does not
> turn it off again. The clock should always be considered optional for
> ACPI.
>=20
> That should act has a hint to future developers hacking on xiic not to
> make it mandatory.
>=20

Yes, that is much more clear and concise! I am going to use this =
paragraph
verbatim in the commit message. Thanks for all the feedback, Andrew!

Best regards,
Abdurrahman



