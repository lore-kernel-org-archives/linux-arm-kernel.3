Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3076DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 13:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UoPXEWoEkPobWthNKy5rWRbTtfmuefFPlplLWESP+Ic=; b=2czP93PeCOtRYKZTTums4pRGE0
	avln/RAj5bQpCXfvKjmvKal0Pmg4WT3K9iEZ6ljr23hXXeInutr3K6wSicsBLhcc/t89rdHftzO0F
	xzkMRGppmWJg0x1rB015fAWFwcawr3PQ2gvqVPayR9cDLIYTtSE5DuIBKUDxpdpDFheZLOGf7xO6L
	FMa/JeG1pRS8LmytLb0kHcl2tIXtsOn3/Jl9I/9O8q+Q0/gS3QoXtRIMztluzfEGcftD4chM7AZUr
	x42xZjTQK5bBJTk9Pm9UWM3wFPPl4HBb6jHGbx8iikwEdxwil+9a9Ed4tzIAs6LjWGbnLjHF6kiEE
	SipdJH0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubg01-00000005GHU-0ZHY;
	Tue, 15 Jul 2025 13:47:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubevT-000000055lQ-1lky
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 12:38:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A192360053;
	Tue, 15 Jul 2025 12:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D421C4CEE3;
	Tue, 15 Jul 2025 12:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752583105;
	bh=gMdl43/0bMuiZDFZdXVaO2ZI3Rf0NtBZ9KAPxIt6tNs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ta6Ybp+5ZGZoiwIBSSjQQyLrXmiGjzZJFt4ku+MWt3JHYPaR1L/VuwDJUhkoazfvI
	 OtRkxFOAc5xQeUgBZY4VTsF7o4I95UfO/5HwfWQ9huaLnKyKgj6V7j/b+AIvZiSfAs
	 XPUBUC3No8i9wZiW5lPqwKq3HyHR8+6I+D/0siuODGLllyMLcPX/e7jLdYS+eV572f
	 o1fnowKHCk+9gp5FkmNbRGWAJyR4q8j7HYPn++3UwoUMxOXY3V443Ynq541bujK+Ne
	 dhOxmfOwn8L795bpGYslwf8sM5xdxAqfZgoCtmbE99tDWV43VBkixuBiVXn40KhfNP
	 IIMrBHsPyXWew==
Date: Tue, 15 Jul 2025 18:08:21 +0530
From: Vinod Koul <vkoul@kernel.org>
To: George Verhaegen <verhaegen@google.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
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
Subject: Re: [PATCH v1 0/4] ALSA: compress_offload: Add 64-bit safe timestamp
 API
Message-ID: <aHZLvVnNiBcqXdXG@vaman>
References: <20250711082441.4193295-1-verhaegen@google.com>
 <aHEEu1eSSGRhITmW@vaman>
 <CAAntYmKea1p=ao3OOWb=1Q+BXdyo1SCm9qGb_JMC5ry5DQVt-Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAntYmKea1p=ao3OOWb=1Q+BXdyo1SCm9qGb_JMC5ry5DQVt-Q@mail.gmail.com>
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

On 11-07-25, 14:58, George Verhaegen wrote:
> On Fri, 11 Jul 2025 at 13:34, Vinod Koul <vkoul@kernel.org> wrote:

> > Please share patches for tinycompress support too, we need those to test
> > this
> 
> I didn't make changes to tinycompress. The overflow happens in the
> kernel file compress_offload.c. As a test, I let it run for more than
> 3.1 hours and observed that the overflow no longer occurs.
> The overflow is in
> stream->runtime->total_bytes_transferred = tstamp->copied_total

You need to add support for new ioctl in tinycompress too

-- 
~Vinod

