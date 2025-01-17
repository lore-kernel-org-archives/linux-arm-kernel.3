Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D63C02185
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 17:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hXz9gJ3SbgLtGHYvtSFN2yMJaQoRdfWikhkGx2vKuJs=; b=H5EQ7Lhmp8vrZBnMvOSUuwnQz5
	Olzjpz+lcdYXSHpfUWFS8yTVlrllJK/hEzJ/dFL3RhNzCHLRIDbD2/xsMDlBDkgTWgylj1r8gOOR2
	vtRHymIwLTRhukhDKeC8rBQwg9xBqIuLLum9FFrc9jq6hA6dF+JtYRUZPO5s9LqNP8+wfLo1fzvMP
	s3Rxsyn3Yyw8Txa96f7ID314g06BMzLAz2xmOp9gulMokFzF1Ced+Il4tEZMSVeE4MEvvzLNAan/m
	/reR8MECWGgNokdfK+e1gsPplSKlUm41pMcTBEaL/km3KG42yDvrckHHPSZegSFI4LS4mKNTAb7F6
	S04YGSmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpmf-00000000u0w-14wZ;
	Fri, 17 Jan 2025 17:05:25 +0000
Received: from out-186.mta1.migadu.com ([2001:41d0:203:375::ba])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYpZG-00000000r7g-0Iey
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 16:51:35 +0000
Message-ID: <3f8bd4e2-02ed-44c1-8925-5c16a98d90cc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737132692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hXz9gJ3SbgLtGHYvtSFN2yMJaQoRdfWikhkGx2vKuJs=;
	b=mGEsmIWNO5ttoaJhkFf+SEn+tKZsOEf5l7f2t/vG3QeHxPfJuyy3dlPu7kcvBuFtdBSVjH
	GYNHfdqNnhC8XOwPWJFXLR7BHriDFP64cfJFF929rhy+MHdKD+NQkiNRN+f7fNfrPfgg9z
	k+yQecvM0t+SOXr1CwHWEfkYMue9fM0=
Date: Fri, 17 Jan 2025 11:50:41 -0500
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] spi: zynqmp-gqspi: Improve error recovery by
 resetting
To: Mark Brown <broonie@kernel.org>
Cc: Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-arm-kernel@lists.infradead.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Conor Dooley
 <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20250116225521.2688224-1-sean.anderson@linux.dev>
 <5942e111-24ba-4d1b-bd4f-6b81dcc6c5dc@sirena.org.uk>
 <3a38cc06-d052-420d-812e-7f3c0c6ef24c@linux.dev>
 <f694cd3e-f2be-48e0-8d84-038579cfca7d@sirena.org.uk>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <f694cd3e-f2be-48e0-8d84-038579cfca7d@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_085134_461341_8B357785 
X-CRM114-Status: GOOD (  10.50  )
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

On 1/17/25 11:48, Mark Brown wrote:
> On Fri, Jan 17, 2025 at 11:17:35AM -0500, Sean Anderson wrote:
>> On 1/17/25 08:21, Mark Brown wrote:
> 
>> > If you're hitting a timeout that tends to indicate there's already a
>> > serious stability problem...
> 
>> This was mostly hit when I was hacking on the driver. But of course
>> there are probably still bugs lurking in this driver, so I think it is
>> good to handle the exceptional conditions in a more-robust way.
> 
> I'm not saying it's a bad idea, but your changelog is written in a way
> that makes it sound like timeouts are normal.

I've updated my cover letter for v2 to include the above blurb. Hopefully
that clears things up.

--Sean

