Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A49C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 16:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RrxAphLxQ/2ui++fGGP+v+/yKexgQPbirksMsmnTX34=; b=VPae3OpnQEdV14XhaVJtOTMyB5
	MIa8El+gXHqpZEFDm4LokmYotcuR9CiFJUBbcc6VZk1/ph3fC8ytfM0sw4CU0tw5HsttEeEPhPZkn
	6YQ4k3NklG+OzzeV9kSbFGAWZQV/XTXzVYPJFkCFMC9j3Tir9xz5m9z9Jt7Gjf85BvIT2KAo7gpPB
	Gr1iM5/wSZrfX1YEf/gyLtNxUgxdsesNxC0q1s6CUa8lBL2FT6Va5gVMFi6e9jsW55fSw07F7sSKq
	hstgZGg1rMbWT4SrLlpIHfvOTWYZE8h6fzep5cxJZY7oL1zqp5pjDDG0ihAgAxP/tYMiJWSpTJcsf
	I8LegThQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYp4N-00000000ljX-2XHJ;
	Fri, 17 Jan 2025 16:19:39 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYp2U-00000000lMs-1lkd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 16:17:43 +0000
Message-ID: <3a38cc06-d052-420d-812e-7f3c0c6ef24c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1737130660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RrxAphLxQ/2ui++fGGP+v+/yKexgQPbirksMsmnTX34=;
	b=EMwl132N2tZ7JKWLmj/7pzYNXMraFS2HCnJJ0j7NuAWbCV/MZAmht2TcLqluGAqhULmFR7
	Igh68JdacUDY5hq1FpVca9gRoiIXLSf5NJGyeJDp25M0a+Pf8yAoDg4KKHz74g0hkXA00l
	8fRjbEtELyHVkUOujycBR4SrdV6mfSI=
Date: Fri, 17 Jan 2025 11:17:35 -0500
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
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <5942e111-24ba-4d1b-bd4f-6b81dcc6c5dc@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_081742_735831_028BBE75 
X-CRM114-Status: GOOD (  10.16  )
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

On 1/17/25 08:21, Mark Brown wrote:
> On Thu, Jan 16, 2025 at 05:55:16PM -0500, Sean Anderson wrote:
>> This series adds support for resetting the QSPI controller if we have a
>> timeout. I find this greatly improves the stability of the device, which
>> would tend to break after any timeout.
> 
> If you're hitting a timeout that tends to indicate there's already a
> serious stability problem...

This was mostly hit when I was hacking on the driver. But of course
there are probably still bugs lurking in this driver, so I think it is
good to handle the exceptional conditions in a more-robust way.

--Sean

