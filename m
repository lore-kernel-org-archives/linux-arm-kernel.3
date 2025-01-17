Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F739C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 08:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kcl5enqdMRs2CcCUSEWlMdhrMLxz2lYAT03H+4IXJe0=; b=d3VF4bmnL+VT4Nsa3qyP57Mlht
	Jhthanqnc44jvTStcHY1E1EBmrq3mI4Blvdio30JSwUYrPK4jkW33isICIfB+gGxt33gtji9+rKUa
	tloI2cvpKxC9uxjX2+KceXgdePw1jDCQzJD2gdGHsyDV5zvFDMzLEuQsHDkHs47mBOcqcVZD4joxh
	otORhr3BvZpBTe4FDio3r5kR2Fh04i3DVCFhJccuKZpvYLVxhKVONb9QKPCNcOkmcDsfqxeUVxegz
	nZk30arCoFS3lQaEYXGxVY3IfbHRfh2gAW35AS9M37ppXVGm13axXxzC1fAUpBUVX82GqxNjLVO3X
	qVLDFY+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhxC-0000000HMl5-25sX;
	Fri, 17 Jan 2025 08:43:46 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYhvT-0000000HMRW-0C3W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 08:42:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DC8720007;
	Fri, 17 Jan 2025 08:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737103314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kcl5enqdMRs2CcCUSEWlMdhrMLxz2lYAT03H+4IXJe0=;
	b=bD1mE7xWSpji0DUI9yntuT2z/rWkqL5VDZiXqzQ6jsFebAR5dFYsvPSLLXV2ehXF0+9a0p
	uNNu/0gWp2qWm6Z3Rm7Q0moY+mfd1g9wHLDIC1yAZ7kpJfrssbDvNLiB51KYvrHMW0wlzE
	njP/UoLCmpskUNh478LQPRZHazsvjPifIK6FbMg+y47p10QnaZCBQgbEjGQRWLb0SbhCg+
	cWrrexKofbFlZ1TJr94q7lDO936lyd5tX9zHotLNOOQqWEyj7HF0wCDAEFL9nusgOhh0Kk
	O/3w03fTK1TrPAM2Fhdvcva0+kYICDtoxj+YuHDIetnVh3eeczZVPEaCr/IO+Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Sean Anderson <sean.anderson@linux.dev>
Cc: Mark Brown <broonie@kernel.org>,  Michal Simek <michal.simek@amd.com>,
  linux-spi@vger.kernel.org,  linux-kernel@vger.kernel.org,  Jinjie Ruan
 <ruanjinjie@huawei.com>,  linux-arm-kernel@lists.infradead.org,  Amit
 Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: Re: [PATCH 4/5] spi: zynqmp-gqspi: Allow interrupting operations
In-Reply-To: <20250116225521.2688224-5-sean.anderson@linux.dev> (Sean
	Anderson's message of "Thu, 16 Jan 2025 17:55:20 -0500")
References: <20250116225521.2688224-1-sean.anderson@linux.dev>
	<20250116225521.2688224-5-sean.anderson@linux.dev>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Fri, 17 Jan 2025 09:41:53 +0100
Message-ID: <87y0z9j0ha.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_004159_214500_73C649C1 
X-CRM114-Status: UNSURE (   7.95  )
X-CRM114-Notice: Please train this message.
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

Hello Sean,

On 16/01/2025 at 17:55:20 -05, Sean Anderson <sean.anderson@linux.dev> wrot=
e:

> Some operations (such as reading several megabytes of data from a flash)
> can take several seconds or more. Users may want to cancel such
> operations. Allow them to do so now that we have a way to recover.

I fully agree with the observation, I tried myself interrupting too long
transfers with another spi controller:

e0205d6203c2c ("spi: atmel: Prevent false timeouts on long transfers")

But there were issues reported, so we limited the signals to SIGKILLs:

1ca2761a77349 ("spi: atmel: Do not cancel a transfer upon any signal")

But jffs2 plays with sigkills, so for spi memories it does not work
well, we had to revert:

890188d2d7e4a ("spi: atmel: Prevent spi transfers from being killed")

Same thing was also observed on Zynq7000:

26cfc0dbe43aa ("spi: spi-zynq-qspi: use wait_for_completion_timeout to make=
 zynq_qspi_exec_mem_op not interruptible")

I would however hint to use a specific helper for deriving your timeouts
if you play with spi memories, because it is interesting to adapt the
values nevertheless:

d8e4ebf870187 ("spi: Create a helper to derive adaptive timeouts")

Thanks,
Miqu=C3=A8l

