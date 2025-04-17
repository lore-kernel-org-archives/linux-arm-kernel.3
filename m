Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCD3C369CA
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 17:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qn/fKaJTQk9gq0OqOW5xdFT6LxZnTNELy3TrPms8KwQ=; b=IWQP3a3bzc5LCHJRjmjbI54Rht
	ALJx+8+WGkNv6vaJ7DY+ToRFRsWsHG0/uH5P/6V1X8JUNfej82CwgK22uO919n65mtS5/cwydbT7e
	+B9fEQmOpHery+LgQ48LUyzdB3zxSAPdrZvwpdjgRhl1REMyB5OBGn892RwLbHBuwQdZZET4XCSj4
	gDe1b0z9SKhW1tJ9MP0cgrbfuGtgScAI2AU+ohlJSmw6Ph9JHA9vvmMiDPOVoUP2HblP01YCO65YO
	lmy3lIgeyh8Ol9jMKVYMVO2UZRI94IiwzQwXxtQGud2wUIg812Mv6DR+jgf7vKT/n/HlBuCNbrchf
	C+BJXjmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5Sri-0000000DoSN-2tzK;
	Thu, 17 Apr 2025 17:17:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5SfG-0000000DlnX-0biY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 17:04:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1E3666845B;
	Thu, 17 Apr 2025 17:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA99AC4CEE4;
	Thu, 17 Apr 2025 17:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744909476;
	bh=RAgSqwP6v8XUqd0sIEMCAhSCHpxuahOcrR/OC8vTJJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ePQEbWRzWefj/7Ht6qipf1HfTKXla7WSlFH3FZCWrp5rKQ0SHVy2GG8StxLrYpQ1I
	 2BUQIDKLUacHMfI6+P7WOkAgPMPYwCf6jPNEtr2fM86ilRrqWPxyw7xZg5Bmr2Yc3u
	 uybZlR7iTPE4RCK2neY51RGaFtOQVdRwVQSb8N7CebOZa6gIhvOMJUevncWiwlpnH8
	 IMMzQ4P4Bl6FovKQA7ryBkS8hWACCl35WC13H8TEebi8OP2S/hncJMqhYtkfrCAguR
	 s4EVKqXvQSg34RVUOx5rj5jXTdKyhdnzvvedgk+wRjxVASn3LJh60S754Y3AHQvclW
	 QU3DzGsaym3Sw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u5SfF-000000005Ch-1biL;
	Thu, 17 Apr 2025 19:04:37 +0200
Date: Thu, 17 Apr 2025 19:04:37 +0200
From: Johan Hovold <johan@kernel.org>
To: quic_sibis@quicinc.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, sudeep.holla@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, peng.fan@oss.nxp.com,
	michal.simek@amd.com, dan.carpenter@linaro.org, maz@kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [PATCH 4/4] [NOT FOR UPSTREAM] firmware: arm_scmi: quirk: Ignore
 FC bit in attributes
Message-ID: <aAE0peT-Fk7TZGGo@hovoldconsulting.com>
References: <20250415142933.1746249-1-cristian.marussi@arm.com>
 <20250415142933.1746249-5-cristian.marussi@arm.com>
 <Z__WyYWhelFwt-rQ@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z__WyYWhelFwt-rQ@hovoldconsulting.com>
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

Hi Sibi,

On Wed, Apr 16, 2025 at 06:11:54PM +0200, Johan Hovold wrote:

> Interestingly, I'm no longer seeing the crash on x1e without the quirk
> enabled with 6.14 and 6.15-rc2.
> 
> I still hit it immediately with 6.12 and 6.13 when accessing the cpufreq
> sysfs attributes (with patch 1/4 applied):
> 
> 	[   30.663577] arm-scmi arm-scmi.0.auto: timed out in resp(caller: do_xfer+0x164/0x564)
> 
> So presumably something changed in 6.14 that masks the earlier issue
> when falling back to regular messaging.

I just realised that this was due to a local change in the 6.14 and
6.15-rc trees I used for testing. Without it the crash still happens
with 6.15-rc2.

Sorry about the noise.

Johan

