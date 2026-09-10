Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AA8DC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lplquklkdI/ZWgzzdOXLSvAbxidAuRi5Zn7Uy7zP3NY=; b=xAiAHbAQP14tt6XUx359Ofui2I
	YM0/04LZ1nQ0XmuY2Tn1XjbYT/6zV9qB8KRSeXb7cMODMhwO+Db7AxxaOeMWzRKggwvGW6ya2LAh7
	wBGj33dLPDIgRkqmGvbQDoeH5XSMWaLL0ET29T1T4z9OiILf21+CqxW2zPiMmGx88YGX58YjrdWeJ
	89i2madhD8EHJ7aUPbqN810Pg4DSFKEWebzh5EvuJOijY1N6kgLuVIOJn7hlV5A1RUgUXxexBu8RV
	nP25CesotyQOt+/nr95zdDHAVGvZr6wPR9lsn/pLMRXTdbvEtvqHcDgE3i9ObWHZ53l6fVEWK0XPu
	AkH6gXtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dgH-0000000EJNX-3A4V;
	Thu, 10 Sep 2026 12:15:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dgG-0000000EJNJ-2sxa
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 12:15:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lplquklkdI/ZWgzzdOXLSvAbxidAuRi5Zn7Uy7zP3NY=; b=XPhOoE/zbXlCr4gWA/Qkg8Pwni
	U790Hfv9p1DEQmKiaJAd3uBNLLDDRFXP24sphT6bKuYSrFV16lk5tmwgfHaF7KXwob7kuY8Px+Hj2
	/eMlWh2HkG7z/85n/sq3ll1kvas/TFPsz1T1Fb74Mi/imtBUaTL/lxuk9UVUh6O9xeWfm/5H7DEGV
	DsXybd9xmAOHKo1jafFi98ouEHD/lPilEvzsXmoLHMB3fqOwxDLmFcF2Gr5rtLZFZtKGoZTto4Naw
	57ry43yditadnT+EXXjU89uSrAgM01qaew7h7cJ5mdX0Mt5gppLREp5mqgi9PLOPgpGSmBETdP7r2
	zFQBNggw==;
Received: from mgamail.intel.com ([198.175.65.11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4dgD-00000002S2h-1szk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789042502; x=1820578502;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=3nQyaecZsUcB0GBTRpE9wQWbqnay97vHqbl+yHN7CCU=;
  b=k1Gp/57FGk/nX7NLw9VkDS0t61qYEuztP3GzdaXmoSPTbZLPvxLI/In9
   VkDx2AWgD+fEREeZ4Xz9DszGZ3BKpLXSAeA05S2ihaUgRpesppupt3jjV
   mS9BXE+TtVQG1Znc3FHwU9Eg0vNWVrDQCvnCazWe8gy2+COo34Mm+DwWd
   vWgZPpI+4wr9gV+Fj9L7nUN7avvoKvMdiKxBkMCEOsyN3bDzDKeYJVD0c
   cmueZi75e+kNWQhPpspk1OICkl6WP6ZqLfZF3v4dxrLFQScJqg9f8fsVZ
   AmmhbFHsMNzaVUBMpssw9pRtb+lExmUXtcKcIVdunoUARjZSgHWvIXKBB
   Q==;
X-CSE-ConnectionGUID: QC0WgQiSQquY+C976TmS5Q==
X-CSE-MsgGUID: ewuDaGF1SrCq08ZZV0nLHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="99820849"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="99820849"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 05:14:55 -0700
X-CSE-ConnectionGUID: JHhdoNf+SL+ErBQi7rLG2A==
X-CSE-MsgGUID: Ev10l9m3SDumG8ViUn8H6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="269843818"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.173]) ([10.245.245.173])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 05:14:49 -0700
Message-ID: <2e719483-4e2a-46a2-a3fd-0c89bd1420e2@linux.intel.com>
Date: Thu, 10 Sep 2026 15:15:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: Bound the panic filename print to its array
 size
To: =?UTF-8?B?yJh0ZWZhbiBHaGXIm3U=?= <stefanghetu9@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 sound-open-firmware@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20260909204042.46656-1-stefanghetu9@gmail.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
Content-Language: en-US
In-Reply-To: <20260909204042.46656-1-stefanghetu9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_131501_916847_B7D327EB 
X-CRM114-Status: GOOD (  16.11  )
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



On 09/09/2026 23:40, Ștefan Ghețu wrote:
> struct sof_ipc_panic_info carries the panic location as a fixed 32 byte
> array, and include/sound/sof/trace.h documents that the "filename array
> will not include null terminator if fully filled".
> 
> sof_print_oops_and_stack() prints it with an unbounded %s, so firmware
> that fills all 32 bytes leaves printk() with no terminator to stop at
> within the array. It continues into the adjacent linenum field and, if
> that holds no zero byte either, past the end of the structure into the
> caller's stack frame, since every IPC3 dbg_dump callback passes a stack
> allocated struct sof_ipc_panic_info.
> 
> Use %.*s with SOF_TRACE_FILENAME_SIZE so the print honours the
> documented bound.

Same thing as for the ASoC: SOF: ipc3: bound firmware-supplied ext
header size.

The firmware internally constructs this and it makes sure that it is
terminated.

To change that you need to compromise the system first and when you are
there you don't need a compromised firmware.

We trust that the firmware has not been compromised as if it is it means
that the whole system has been already compromised.

> 
> Fixes: c16211d6226d ("ASoC: SOF: Add Sound Open Firmware driver core")
> Signed-off-by: Ștefan Ghețu <stefanghetu9@gmail.com>
> ---
>  sound/soc/sof/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sof/core.c b/sound/soc/sof/core.c
> index 2d394389c945..9b0850e87bf6 100644
> --- a/sound/soc/sof/core.c
> +++ b/sound/soc/sof/core.c
> @@ -152,7 +152,8 @@ void sof_print_oops_and_stack(struct snd_sof_dev *sdev, const char *level,
>  	dev_printk(level, sdev->dev, "trace point: %#010x\n", tracep_code);
>  
>  out:
> -	dev_printk(level, sdev->dev, "panic at %s:%d\n", panic_info->filename,
> +	dev_printk(level, sdev->dev, "panic at %.*s:%d\n",
> +		   SOF_TRACE_FILENAME_SIZE, panic_info->filename,
>  		   panic_info->linenum);
>  	sof_oops(sdev, level, oops);
>  	sof_stack(sdev, level, oops, stack, stack_words);

-- 
Péter


