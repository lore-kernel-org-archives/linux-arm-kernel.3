Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD16D29C4F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 17:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9vmCqAtGysKfxxBfNQvQzZYtQZW3BMU6u0QIwzm6DI=; b=ftFV1p8YUvjqINbUW1ivvkpYL9
	EDc0nmVvyEfry4ieNCyYdKtF1JoXu/PHBJri53P7mSwCy66d1xyLLf0ZlXNixUZ4NVmmk1hgh+WA4
	myxK+Pz/PgQIX6ilRjKtCZDN2q1rim+VbZDhLwSGANaOXhXM8bG4fhw0oZ/rQIULRLWR1e+dQVWNq
	+2DObSbFMfwoh/6mZSJzJhpIXrSytur+CkcNslxf8M02LbozQDy9jaV6sDEgY5DTJXpe8xzx4+bOW
	kxk7QhyZ0Y7b8KIOgqW9FJ5qbU0jCULwcFGrEcbrGOoEMPmeDQ4p3L9MAJgNavmBFVgnFnETQ/dHR
	pcfZZXmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtLa-00000002fOo-1E7d;
	Mon, 19 Jan 2026 17:47:26 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhtLX-00000002fOU-1ZM7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 17:47:24 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a09757004cso40592325ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 09:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768844842; x=1769449642; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9vmCqAtGysKfxxBfNQvQzZYtQZW3BMU6u0QIwzm6DI=;
        b=Ttw84rUN+tEf/6TlhaDhEP75OGNV2Rjet+cuOW5YOGT82QNeVgrvlZoQQbmU+D0q7I
         TS554ZqXBTv4PttQNekRpV1uHwfWOfoArKkvoGmGUgH7TzOg6FVI+lir+pqTktTTQCHh
         XN532LPP5ZFOW30tZmiTfr55ivl7kZ9zqbaI+OSaXqqS0d6l5H6M0QnEJAbjT7255KwS
         9wbwYIkAjLWRhkzepievU2gu/yLO1/hzMv+bQMfNFdtFq9MZIEHqEmaTSBAitb/eXSDF
         HX40mP+3fwym7HnmN+V/jUiiYEZEHirW+u9ze0jUeXDoQMDjikGs6mKMQVUTNkgsev9B
         /2dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768844842; x=1769449642;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P9vmCqAtGysKfxxBfNQvQzZYtQZW3BMU6u0QIwzm6DI=;
        b=kXKiqjS3HElHZEy6586TvD/RqwC7NZFN7fih12IjF7fEm/lIjizMlYD8xS6ILLYdHq
         u8pU77tHpTpPM1Uh1dRCYXXLFaO6AfYHv2Uxy83p+EZMRY0/qv/7GcYfKjbMzICzmeAi
         g2eYDSShIorWsg9CAkIfuHiK1dQCrDKmQ5ScZkVlGbBKQAVY5b9MPhDWd/5llS3e+Juf
         qDmUtL9/552de4IjUqsbPPHN38CzjdF7IzBB6tmML9AzEk1mDyluNq+mm6BHeTpH+OuN
         GHWWSeaYbpb2EuTF4bPSMMSW3wRm9t+1T1FyEbET/LFPAyLG27wVgDb7SGCTGyCKJYP/
         Q9Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWsq9Qj0wx6f1z1w0MPnTs4WX8SWp6TnLUYRcnKh7kE3xC9H30O8byks4LF9ouqTd+bfhsMBSk+9NW9l2zXNIYE@lists.infradead.org
X-Gm-Message-State: AOJu0YwTC1ZlqG2ui8sXbYtcOubHHITj0kWu3Q4fVY9l1M63UoatLlsh
	1qhdNfy/zct9Qy4zrxoCl31vysvtKOLQpEhn6xR7+2YVNNCbD8BsTIusZBF4hdVhYiA=
X-Gm-Gg: AZuq6aK73ywncXVKaTWUkIO+ZhhVrvXnEmqAVAeV2DI/YnlYoRshJPUtq3QCM15k7U/
	r5O0Kwg3owEQjoSEZqAAidWuTZePgmIpcOMyRLzWr5LfLtd5/J1usbULfbqD+KxR9z2CmiDl5xV
	LhfBgrQ//Ah02t/kStT2WyHlMyqcPoUfFZKxUcKUYo1qAmwlAAkGUYRxnUh+5NCKAYztisbXzbU
	M7tbTcjTvGzcmFg9i+KKakEQoIqCQpWrunkqxYdrZaAynHG4EOMobTKF3jBP48So2vw6qXjszM7
	XPfFPSvMGioejyUYq3Qo4A+MqB0Bl+57h5eaSz3MGgcZdD1xtTIJUp67izM4we9Fmg/TGkB6dF0
	rjHE2eXNMafQnL8VaBOWeSHXdJ2XuJ7kvZ/A+PQF8CBUfN0Y3wHWnSnL/LEEVcdlJfgKsD3K9mX
	7G8LE4Z+C+hdxDT3muCMXD7748brHHlVYuulNHWck31TjYy4CEesDUuklSziItKfPEv7pjaMs=
X-Received: by 2002:a17:902:cf07:b0:2a0:ad09:750b with SMTP id d9443c01a7336-2a7174efc3fmr85950055ad.9.1768844842261;
        Mon, 19 Jan 2026 09:47:22 -0800 (PST)
Received: from smtpclient.apple (c-24-16-26-157.hsd1.wa.comcast.net. [24.16.26.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dca71sm98315145ad.48.2026.01.19.09.47.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Jan 2026 09:47:21 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v3 3/3] spi: xilinx: use device property accessors.
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <b1b79de0-a078-486d-b3e9-96899354407c@sirena.org.uk>
Date: Mon, 19 Jan 2026 09:47:11 -0800
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <3D1B59A7-6E57-4C8C-AA95-EA7AA115264F@nexthop.ai>
References: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
 <20260119-spi-xilinx-v3-3-4566c33bac0d@nexthop.ai>
 <8436e914-429f-40b9-8e6f-ec3b02702cad@sirena.org.uk>
 <69F83558-4675-4FC2-8656-BC6E3481AD65@nexthop.ai>
 <9e559e33-4f2f-40d4-a15f-584548bd6057@sirena.org.uk>
 <05D2CC15-DD6B-40F0-BFF0-3264D4FF96ED@nexthop.ai>
 <b1b79de0-a078-486d-b3e9-96899354407c@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_094723_439722_234E8D8D 
X-CRM114-Status: GOOD (  18.14  )
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



> On Jan 19, 2026, at 9:32=E2=80=AFAM, Mark Brown <broonie@kernel.org> =
wrote:
>=20
> On Mon, Jan 19, 2026 at 09:15:40AM -0800, Abdurrahman Hussain wrote:
>>> On Jan 19, 2026, at 8:50=E2=80=AFAM, Mark Brown <broonie@kernel.org> =
wrote:
>>> On Mon, Jan 19, 2026 at 08:47:17AM -0800, Abdurrahman Hussain wrote:
>=20
>>>>> Are these bindings appropraite for ACPI systems?
>=20
>>>> Yes, the Xilinx IP blocks are memory mapped and work exactly the =
same on ACPI as they do on DT.
>=20
>>> That does not answer the question at all.  Is it appropriate to
>>> configure an ACPI system in this way?
>=20
>> I am not sure I understood your question. What do you mean by =
=E2=80=9Cappropriate=E2=80=9D?
>> This is following the same guidelines as outlined in=20
>> =
https://www.kernel.org/doc/html/v6.7/firmware-guide/acpi/enumeration.html
>=20
> You are just bindly making the DT properties available as _DSD
> properties on ACPI systems, ACPI is a completely different firmware
> interface with it's own idioms.  Does this interface make any sense on
> ACPI?


=46rom the above link:

"The special DT namespace link device ID, PRP0001, provides a means to =
use the existing DT-compatible device identification in ACPI=E2=80=A6"

The following is an excerpt from=20
=
https://www.kernel.org/doc/html/v6.7/firmware-guide/acpi/DSD-properties-ru=
les.html

The _DSD (Device Specific Data) configuration object, introduced in ACPI =
5.1, allows any type of device configuration data to be provided via the =
ACPI namespace. In principle, the format of the data may be arbitrary, =
but it has to be identified by a UUID which must be recognized by the =
driver processing the _DSD output. However, there are generic UUIDs =
defined for _DSD recognized by the ACPI subsystem in the Linux kernel =
which automatically processes the data packages associated with them and =
makes those data available to device drivers as "device properties=E2=80=9D=
.

The two settings are just configuration data for the spi-xilinx driver. =
By switching to generic device_property_ APIs we can re-use the same =
driver on ACPI based systems where the properties are passed as _DSD.

Is this not appropriate?

Regards,
Abdurrahman


