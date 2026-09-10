Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82721C88E41
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 23:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1KAo6kp4oi9EVWg8WoSVq7Fc1201WX9RfL0Wj3WvyIE=; b=4krwvpLaVvhIg8p01a4zGsYDKr
	cNf1/GlUf5uW92YhANhI/A6I99xeociamBv8Mpd2Ht10sS8KDyL04MXKM4zSxkPqmBr6PUsGFu6AC
	2g9owaUfof8fNDCOp5uPPTQQkBKjwH0+GzPNzPipZIAlZznAgXRmJl8ShooeHevMPrTwChYIaKpPf
	sGk1thswoxg0J4Mu8xLkQUFukGYArXPq6QHOctDnzPa+8bAikNV1ylzDfdSEdWMk+IX7AEwpxtzVE
	FIzxsr7T1TDgP5thGDnZjsFnCSMdJ8IZqWrStZhNRlbfkNuxtEM083+S83iV1rZGjMsFHOmFAQewT
	LrC6jqAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4oPH-0000000FYyT-12Ud;
	Thu, 10 Sep 2026 23:42:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4oPF-0000000FYyH-3WXU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 23:42:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id ED265601F0;
	Thu, 10 Sep 2026 23:42:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 249E61F000FF;
	Thu, 10 Sep 2026 23:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789083732;
	bh=1KAo6kp4oi9EVWg8WoSVq7Fc1201WX9RfL0Wj3WvyIE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UP21ZgXChI4dXgLUNLhnSKTZDyX6MZNkUa8kBr7stQTzhMFEJOXHgXShTdpbNaGEP
	 FjEabvVUtUMaJhIWJiaWZQ1DNbdHLYUx+gTQnlD4YNXcf3qr1cjDJkdGG1hVG/lnn0
	 rH5WzactI14KMYaLRlzorBVYkwKq/cu7MPa31wVxEMI9CUexEsEh6DD2FIoWhOSnXg
	 d0czVaiu3C/vRZYtrksDalEv2UFhIp7xf90VWo+3eRS7n7cx04UWCiHNjnuTn+z708
	 VHicRNYCXltuAQvBmqi2e4D7nXb063EqAXLpUjoVVoBm6/V7wzBAZCSrVJVb0R7on1
	 S0RB2Fhg/5ErQ==
Date: Thu, 10 Sep 2026 16:42:11 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>
Cc: maxime.chevallier@bootlin.com, recv.jo@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, shuah@kernel.org,
 joabreu@synopsys.com, yi.fang.gan@intel.com, jun.ann.lai@intel.com,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v4 6/7] selftests: drv-net: Move _set_ethtool_feat()
 into lib
Message-ID: <20260910164211.666ad484@kernel.org>
In-Reply-To: <20260908164309.59282-7-ovidiu.panait.rb@renesas.com>
References: <20260908164309.59282-1-ovidiu.panait.rb@renesas.com>
	<20260908164309.59282-7-ovidiu.panait.rb@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue,  8 Sep 2026 16:43:08 +0000 Ovidiu Panait wrote:
> +from lib.py import KsftXfailEx, defer, ethtool, ksft_pr

tools/testing/selftests/drivers/net/lib/py/feat.py:9:0: E0401: Unable to import 'lib.py' (import-error)

do:

from . import KsftXfailEx, defer, ethtool, ksft_pr

?

