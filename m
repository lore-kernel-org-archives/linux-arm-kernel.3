Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C27F810ED65C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/mmEvjF+xhmn9Wns9betMD2C6MNmROj8DyAiLE02zM=; b=FEuRxZNEn/2DnC+CsT7kCkI6AT
	CFXkZyHrHl3Liz+UoWxmkTSwxJ0M7HQ1VUvVuZTiy9Ph7O5Nti/SBM+Nc2irsRQG+Y9eQPwAxs8xz
	7TsdAYMuirALr5yuU+M5MMize7kp6yhl3Rvv88iRqeBTS29n4fnfxbQxc4N+iinRbUeRgrfnNu/Xl
	cJ/bcl23lo+uZcsFi/mXDPLumEr3MD2k0gV+YJbd2vEE9dtk08weVo8gAj4V47Q27TM/iLT9z9N1n
	8WTKEUBRYBJRgKVOMWvPiuK8M7ct8EHaWFYM3OYDWBUk57tYhMb6xgao+qL8LSEvwlbhiCgl+Hnp1
	oEkaZtXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65bM-00000007IAE-3FlD;
	Fri, 27 Mar 2026 11:43:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65bD-00000007I7k-3MYV
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 11:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=H/mmEvjF+xhmn9Wns9betMD2C6MNmROj8DyAiLE02zM=; b=FDs/PdwOAXruuHPiJQDlIN1RLk
	rIZItbAXTNxewyUQEdL8HG+jwYbwRBL8u+n2iaKmGL4bHDMYcYj5LFa9PxmQ012V94ooMkszq/q1H
	O5lqsoyDC2zynZwP4bhX2jltVTLdIY8L6LqrITp2MSB10Pzy4tt/zHIXD2bjFSGpVNnefucYW59ro
	DWNUwWDGDHTYFIQUlw8cFKWXgIKspVFsAX3aBxIisAa62Q00COWYM2tbYCdh2MTxZAPLtPXqG6aP7
	1MhG4jpgxApn0Bml0ef+gIAikLVKiIqVlopwelYf327Dh8vOAc0O2sn+GuRmOQ7Lfj+7Q+k0GtB4V
	/t3fi8rQ==;
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65b8-0000000AJud-2COg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=H/mm
	EvjF+xhmn9Wns9betMD2C6MNmROj8DyAiLE02zM=; b=k4QvSzox0bVkfsfDjzFG
	LGuc3RY6Nc4A01kHbyNKckXguVBwpBOKFgCosfhLsRsjq4eDoNRYZpMIVCJ0O3hr
	gfeanKsyTEOWbah1eONyp6cI2lvZTWiinFUqQ1+gY2hdjjx+hPdnLjDCYK70TUJ4
	aFc/YaBf28GDjSGd7mxe254RWqDfD9attVFCtj8ikS1PeMOzQ7Wq1WpZ9OE7cTEW
	LWHjg90xTnSXm5laQso2Th3BJmrtN84wxdyQWCBE0l/PveVIj91/BXi11wFJWf4A
	0Ik6WG0aYRHLixjG/wpRM3UOW+oQhTX4llCiif+gTG5sUZ6tFSGGFUkiiWl6Oq3N
	Rg==
Received: (qmail 174700 invoked from network); 27 Mar 2026 12:43:25 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Mar 2026 12:43:25 +0100
X-UD-Smtp-Session: l3s3148p1@m9s6AgBO++RUhsJN
Date: Fri, 27 Mar 2026 12:43:24 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andy Shevchenko <andy@kernel.org>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	David Lechner <dlechner@baylibre.com>, driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Konrad Dybcio <konradybcio@kernel.org>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Waiman Long <longman@redhat.com>,
	Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v5 00/15] hwspinlock: move device alloc into core and
 refactor includes
Message-ID: <acZtXL7OiM0ceyMe@shikoro>
References: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260319105947.6237-1-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_114331_333514_3DEA1457 
X-CRM114-Status: GOOD (  21.26  )
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

On Thu, Mar 19, 2026 at 11:59:22AM +0100, Wolfram Sang wrote:
> Changes since v4:
> 
> * update Documentation, too, when ABI gets changed (Thanks Antonio!)
> * rebased to 7.0-rc4
> * added more tags (Thanks!)
> 
> My ultimate goal is to allow hwspinlock provider drivers outside of the
> subsystem directory. It turned out that a simple split of the headers
> files into a public provider and a public consumer header file is not
> enough because core internal structures need to stay hidden. Even more,
> their opaqueness could and should even be increased. That would also
> allow the core to handle the de-/allocation of the hwspinlock device
> itself.
> 
> This series does all that. Patches 1-2 remove the meanwhile unused
> platform_data to ease further refactoring. Patches 3-9 abstract access
> to internal structures away using helpers. Patch 10 then moves
> hwspinlock device handling to the core, simplifying drivers. The
> remaining patches refactor the headers until the internal one is gone
> and the public ones are divided into provider and consumer parts. More
> details are given in the patch descriptions.
> 
> One note about using a callback to initialize hwspinlock priv: I also
> experimented with a dedicated 'set_priv' helper function. It felt a bit
> clumsy to me. Drivers would need to save the 'bank' pointer again and
> iterate over it. Because most drivers will only have a simple callback
> anyhow, it looked leaner to me.
> 
> This series has been tested on a Renesas SparrowHawk board (R-Car V4H)
> with a yet-to-be-upstreamed hwspinlock driver for the MFIS IP core. A
> branch can be found here (without the MFIS driver currently):
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/hwspinlock/refactor-alloc-buildtest
> 
> Build bots reported success.

Sashiko found some valid issues[1], so I am already working on a v6.

[1] https://sashiko.dev/#/patchset/20260319105947.6237-1-wsa%2Brenesas%40sang-engineering.com


