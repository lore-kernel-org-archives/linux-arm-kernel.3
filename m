Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB34CC6B39
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 16:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lezDcEzfhmumF5Y2Y/lqp/Jl23Bf7Sw2XB6gt32AYa8=; b=U9zKhGJU3uUY4KGniotFHzl+gU
	doW0efWrchJBLskUh28vGsauMit/4YLsy+VjEgEGXCPQOghQ3kBXdfctJnGHnHjcS1Vp/o/odYQkP
	RJ15X4SEDKmxoHws18SksJUHVCd+1Wv26mICVp3XSqZAhWjCMEoLKTPOiwzTSE91Zt2+BrpfNWkIV
	L6J9pI3KXC94/yAYWIwnRS0WaqI2ZxjXl4CF6zvt1rY+NKRv42DdOMRwu6+Je4TifDihs22+bE8tg
	cd57KpWW2IhlEEWeuRl4Y1Iaa8FkdI2hkDnLkwmcnGtrHK6NEoDNEjckvw53RS5dXp3Ha3UQIt6BV
	0/7MA6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHONZ-00000000qhS-2Drz;
	Thu, 15 Oct 2026 16:32:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHONX-00000000qgb-2agD
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 16:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lezDcEzfhmumF5Y2Y/lqp/Jl23Bf7Sw2XB6gt32AYa8=; b=RlhBcpkTV3xsqxeEo3hQB37qgk
	GWt2ghfdfHDQ9JUdtdBAr7GDGwNZVQWfVHKSun4lTUie+udRXFN/YwgpgJyY17/7F2veN/o2JdF1C
	7w4uNwMSPR7X6NVV3KBsQpV6fKsO9Tzvu7LSH4mIDrB/38TXenitG+pz4/dwdM+eVcBu6m/nEGjMn
	/J2RucZAhxUJLp9fskzttZMs/vS5ZpRGtpC5kURc0xiNms0IX4hvG+8UJDfGwG3jV6S3VmkyClfyP
	5nS/rS5mP1p11LTjfvjYowHgja6ZhP7x6FmzUDKGavyPJ8reU63983UpUQTsPN4gvJpYdQVBbDzL3
	Es3YZKJw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHONU-00000000clw-2M64
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 16:32:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A328614BF;
	Thu, 15 Oct 2026 09:32:19 -0700 (PDT)
Received: from [10.0.138.89] (XHFQ2J9959-5.cambridge.arm.com [10.0.138.89])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E966C3F871;
	Thu, 15 Oct 2026 09:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792081942; bh=K53bHe/qRL8PgX+fC0aZ/IKukdzfGE2CeH1J1pXxbIw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QvHiuvww2XMiC1VH5lrEn7YT52tcUfUfqnhqZ6AL7/+1oS59HDeC1lXKxNrpFi1pC
	 t0SbzJpTfupyKQqZc3bVVGYXHq188MRT6NrH01zSEEbyjpLbZx7PQxzYaj0Ht2nEy2
	 xPD7PUul+C++YYvpS1ogXhTXImp3VMZKjPrCVxsE=
Message-ID: <e8d97f6c-8e22-4c85-b15d-6edade16d789@arm.com>
Date: Thu, 15 Oct 2026 17:32:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 02/15] misc/arm-cla: Add launch operation helpers
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean-Philippe Brucker <jpb@kernel.org>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
 <20261015142552.4128028-3-ryan.roberts@arm.com>
 <2026101542-briskness-most-a8ca@gregkh>
From: Ryan Roberts <ryan.roberts@arm.com>
Content-Language: en-GB
In-Reply-To: <2026101542-briskness-most-a8ca@gregkh>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_173224_817454_8A16129F 
X-CRM114-Status: GOOD (  13.14  )
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

On 15/10/2026 17:17, Greg Kroah-Hartman wrote:
> On Thu, Oct 15, 2026 at 03:25:36PM +0100, Ryan Roberts wrote:
>> From: Jean-Philippe Brucker <jpb@kernel.org>
>>
>> CLA commands are issued by writing optional payload registers,
>> programming the LAUNCH register and polling LRESP until the hardware
>> accepts or rejects the operation.
>>
>> Add a common launch helper that performs this sequence on the CLA's
>> local CPU, waits for LRESP completion and translates launch response
>> codes into Linux errors.
>>
>> Build accelerator reset and register read and write support on top of
>> it. The register read and write helpers split larger accesses into
>> multiple launch operations when an access crosses an eight-register
>> window.
>>
>> Signed-off-by: Jean-Philippe Brucker <jpb@kernel.org>
> 
> You forgot to sign off on patches from others :(

Ahh sh*t, sorry about that. Hopefully given this is "just" an RFC that's not a
big deal? Else, let me know and I'll resend.

