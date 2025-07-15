Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEB8C83F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 13:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TXbl01E8QteEVcy+kSf5Hse7svb6iS2023jBa52cPY=; b=WEVby+ZkZjXCI7D7z/LfZKnh0E
	gtE70/rnzFq5wBwjX7udKtW5H/yekbpzUWNCxnRvzKrq1NVJWSnoeP8tIq8KMmUfw9U5Gz/j3KNJG
	Q+k9myJ049AVb0iHd9xbSMUdgisvtxbPb42qqIKD8nnlx2wLX+/9Nc/og9f7JKrm2zJlALeUOsmvJ
	vW3N9kduPn+WfR/iJUA/GgXYND0w/71jHdusby5X16itTkO7wDbwwwqAs3mw4hbnr+/iKFHhABLwe
	mOz0QQbRLoQ5vlT8QGvJ6Mx7xrCSivUjO2hQ3dgdw9rUD2qt+Jz6mu2/mOniW7RPXlZwlap/oNisf
	BFiGAjlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubg4o-00000005Gxj-2UbT;
	Tue, 15 Jul 2025 13:52:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubewy-000000055sz-1cX1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 12:40:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1520944C32;
	Tue, 15 Jul 2025 12:39:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3954EC4CEE3;
	Tue, 15 Jul 2025 12:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752583198;
	bh=+pu90pMOXbQaEW9Hm/kqWZt7Rsk1N7XL4gsFDUuXDgo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t/WMW3ajNFuEcGUS5cLW97Lm53LVFFJGyl6fCTT6uNS0KVjzfi73bLTLwGMrtIqbd
	 2PD7zzl5wx41pkiTd4E1MbCoFbyq6mYN3ZMrbph1XW/ogXdlYh6BhAPgbe7Q8370IR
	 QKKBvE9KcMVo7ez+Q61Lzj4C2+Wwdpj6EPFzjelBoTzO9VLP0NncA/0T4XLsnaNRC8
	 QYa33a6PxhIwcQAh6jnQMFtto5x9qx43OsmRQTlDbjSrz1E0l7StRXb1ihPod8JFl7
	 V+ZEtH41mxOGUgbsh+sZfjco3/H7VWG5NALXVHS/aWhARrQUp7PWLIA9WePeMzJel7
	 N9m+GRxBcgPDg==
Date: Tue, 15 Jul 2025 18:09:55 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Joris Verhaegen <verhaegen@google.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>, kernel-team@android.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com, linux-arm-msm@vger.kernel.org,
	sound-open-firmware@alsa-project.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/4] ALSA: compress_offload: Add 64-bit safe timestamp
 API
Message-ID: <aHZMG2XnCLoBuf9T@vaman>
References: <20250711093636.28204-1-verhaegen@google.com>
 <aHD7/9MZbcOmn+08@opensource.cirrus.com>
 <8734b2hpcu.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734b2hpcu.wl-tiwai@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_054000_443557_7F143D57 
X-CRM114-Status: GOOD (  17.02  )
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

On 11-07-25, 14:41, Takashi Iwai wrote:
> On Fri, 11 Jul 2025 13:56:47 +0200,

> > Would it not be slightly simpler to just update all the in kernel
> > bits to use 64-bit and then only convert to 32-bit for the
> > existing 32-bit IOCTLs? Why do we need 32-bit callbacks into the
> > drivers for example?
> 
> Right, it's a usual pattern to have only the 64bit ops in the kernel
> driver side while providing the 32bit stuff converted in the core
> layer.  Having two different ops are rather confusing and
> superfluous after conversions.
> 
> If there are tons of users for this API, it'd be needed to convert
> gradually, and eventually drop the 32bit ops at the end.  But in this
> case, there doesn't seem so many relevant drivers, hence the
> conversion can be done in a shot as done in your patch 4.

I agree we should do that. Kernel can be 64bit only while we keep
maintaining the 32bit ioctls, cant drop that one

-- 
~Vinod

