Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457B6C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 09:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWQm08I1k5LyUTw+wBhW0HthtUeHce+mEdC10fdxN/A=; b=TnFQ6RWCC6/pR7JTimgHPwuirK
	N7FLhZzrLyzovsk5BVzAeeUs5hYvX01UMzb1Cbp7KEk+YxDNjp9bdccV/f1DWjr5/N2yz/9NBDMb/
	b1IbDFHN4ay2tUCElgkqBIu2eXAy8Yy4Qb7Ez44mjXx31fwuYGX+2Twd0+wzdP8HPqb5Qmd2MMO5Q
	gLm9r+RHqSd41V6HevDKEDij1Ym2qtYSEzYlJ8mMnhLu6yzLTon4PnZ5Aq30fhZx/3Z6MDVpNDl9f
	bJO1P02+QIMD0uDBBOxGURbB/p2/9/Bpi7/cEDm0C6XFFo4la1eP5apB0uy2CvCVXYbjyakxmwMwr
	Sze1PZoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gz4-0000000EBiu-3odv;
	Wed, 02 Sep 2026 09:10:18 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1gz2-0000000EBh1-31PQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 09:10:18 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C3B8D1A1953;
	Wed,  2 Sep 2026 09:10:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 935226053C;
	Wed,  2 Sep 2026 09:10:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E1B3A11C792D5;
	Wed,  2 Sep 2026 11:10:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788340211; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=dWQm08I1k5LyUTw+wBhW0HthtUeHce+mEdC10fdxN/A=;
	b=1SirV6k9/fAEqVYJRgYQiMtRJcFLFJPD9Qa4SPbnxEoaWVGcRuMj27XmFPWJx+kj88yr6f
	KM3VAlxhYw00T6QKynkYib37xl0DjDmgT8GWTwD1It91umoj0nBGz1iQ4/gCPi+AM5MZRs
	1/Pnl1HsFVZSKN19K8BbCJyFMAr4m40pnJvI8stNwbccFQopVO2XbpYfVDZzsyqGzxCUfQ
	RnQvv2CV5zryqYFdoJYXGLulq7bmwVm6tdMyl9niiFkFa5vqXADjm6hemoiKtSK9iCEp5u
	Gt6KmJVE68xAjOKQrb+H6RTkhc2xxvicacXTlbPhyIpbN42rWTvyHkQNjK8S2w==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Srinivas Kandagatla <srini@kernel.org>,  Rob Herring <robh@kernel.org>,
  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
 <conor+dt@kernel.org>,  Heiko Stuebner <heiko@sntech.de>,  Michael Walle
 <michael@walle.cc>,  Finley Xiao <finley.xiao@rock-chips.com>,  Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-rockchip@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org,  stable@vger.kernel.org
Subject: Re: [PATCH 1/4] nvmem: rockchip-otp: Serialize reads
In-Reply-To: <20260901-rk3576-otp-cpuid-mac-v1-1-ea9135270fc2@flipper.net>
	(Alexey Charkov's message of "Tue, 01 Sep 2026 19:33:11 +0400")
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
	<20260901-rk3576-otp-cpuid-mac-v1-1-ea9135270fc2@flipper.net>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 02 Sep 2026 11:10:06 +0200
Message-ID: <87ecfc81e9.fsf@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_021016_894253_6E593E30 
X-CRM114-Status: GOOD (  12.75  )
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

On 01/09/2026 at 19:33:11 +04, Alexey Charkov <alchark@flipper.net> wrote:

> The OTP controller is driven through a single set of registers holding a
> state machine which has to be stepped through for every word read, yet
> nothing keeps two readers out of each other's way. Concurrent reads
> interleave, and the outcome is either a reader bailing out:
>
>   rockchip-otp 2a580000.otp: timeout during read setup
>
> or, worse, one of them silently taking delivery of the other's data.
>
> Reading two cells in parallel from userspace on RK3576 reproduces both
> within 150 iterations - 53 read errors and 9 corrupted results, the latter
> either losing their first word or, in one case, ending in the two bytes
> which belong to the other reader's cell - whereas the same reads issued
> sequentially never fail. Concurrency is not hypothetical here, as six
> thermal sensors source their trim values from the OTP and reach the driver
> straight from asynchronous driver probing.
>
> Guard the read path with a mutex. Reads are the only way into the hardware,
> as the driver registers no write callback, and they always run in process
> context, so a plain mutex spanning the whole clock-enable, read,
> clock-disable sequence is enough.
>
> Fixes: 755864feb729 ("nvmem: add Rockchip OTP driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexey Charkov <alchark@flipper.net>

Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>


