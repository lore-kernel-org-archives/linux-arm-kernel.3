Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FA4C79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ff7gYwr5JatAwsuf2+3tCMqptzY259GZ7PdLz6iyl+I=; b=l21Ix5tmFSFQlR9VdZjN3whMDp
	NJJJtH/FWAxQNyBcJK1BKhOxfBmQPuzHQV6Kxs/O1VNi9m+2xs1SCmGPsvncuXGGBafrNIcYsQ/6B
	8Jh8LRRXsXYJJF5B+qdqXd9xS9L05z1AyQf4psGNCs2GhSx3jSvAvTc8tSk4PP9YwuzSAlsbNswSn
	TrOg326G0/pjk63wHO5oGV+WWRLasoMuOeRYMf9ig4rlAe/aP71lJe1kpYkz72AKeUb520BAiU/nT
	S5/B8dddBx/3Sg9/5piNMeVoXf4GCttpBxXBIZ1HHLoQntfa85jVJ48EEQmS2QKDIj86d8bgz9o9W
	kQTpihjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4enw-0000000ESeA-0jzW;
	Thu, 10 Sep 2026 13:27:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4enu-0000000ESct-3X8o
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Sep 2026 13:27:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ff7gYwr5JatAwsuf2+3tCMqptzY259GZ7PdLz6iyl+I=; b=qpmMZY/9OpgBOrZDBfJSlDS5ut
	od8ok4LkPNuTmkC3vZE3Ccn4/o7w5HFroy5vjfm4G7R8YgkYmkuJFn/xKa5ZG5ScQemcC30OqqEmX
	G6cf+VYNfJzQ5n+XEYTuBXPjYcb5ofyESpmp7ywRREhO+9CVkbe20pW5Sc4YLMJKHqRdt5ry7ntGk
	CmdztLzlvEDV7fxp1Wg5TAnh4aTgsFuPr/va0uQ1mKHpwLxKJlhD3h70Rfm/0HRh6SASbugCghmW1
	sQiFBymLn+ZZJyiFHQ77NOS4s9NKyEXf0FqrrYpMLkSdR3Ry+cG3s+MtZT9mM9/e+Xw4NLLJHJCbs
	ZZ8VjDFg==;
Received: from mgamail.intel.com ([192.198.163.17])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4enr-00000002Wro-2smx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:27:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789046820; x=1820582820;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=8LwohI+p8DDT76fk9A1VjUcstLsK4BTQ3LgFB0X08yA=;
  b=U34sap1zJcyhNh/jXV5V2UxaIWjRRSrePhA7zB9Mqtd9fMmaFIQ36axn
   YfT59rD8YGaZdt4sxwoFSMevJhaNfEyRHSFtq1e83qgcyURjzw5+iKLYL
   ZlpnENMoL5+9VQIV4sofh27ViMs43qfZpa9jRgihA0xXLXVklMDh5GR/O
   DKapEXVnYKxg6hJj8VuQxAiEXMxGdRRFebt8D7zrTPH/8KRANK/t0Glad
   EHJExGs9ayidF5kLalyhmGvz/Io6Cvd+q4b4BrQ15qavA4Wi8eQn5iS2h
   0T7fo+kuyNmJ5BQtY7RClIFq3ISV3YOHVqFHIx0Virf/DW2c57HXmntj4
   w==;
X-CSE-ConnectionGUID: Snpmgo2WQreE607LyLP/Rg==
X-CSE-MsgGUID: 8sxfkJSkTIKmCbh9CDAPKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="89368701"
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="89368701"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 06:26:53 -0700
X-CSE-ConnectionGUID: KQ5tpSHfQh2knyhfTWhoxw==
X-CSE-MsgGUID: iLCqQu/YT5SV3PoFAgxRCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,95,1787036400"; 
   d="scan'208";a="271154595"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.245.173]) ([10.245.245.173])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2026 06:26:48 -0700
Message-ID: <6b00b20f-a4ce-402b-bdad-9411499e6753@linux.intel.com>
Date: Thu, 10 Sep 2026 16:26:59 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: SOF: imx: Prevent stack OOB read in DSP panic dump
To: Mark Brown <broonie@kernel.org>, =?UTF-8?B?yJh0ZWZhbiBHaGXIm3U=?=
 <stefanghetu9@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
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
 <20260909204042.46656-2-stefanghetu9@gmail.com>
 <f64a008a-8bdd-4c06-aa12-a721cebc3a11@sirena.org.uk>
Content-Language: en-US
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <f64a008a-8bdd-4c06-aa12-a721cebc3a11@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_142700_157877_1EBFCA4D 
X-CRM114-Status: GOOD (  11.43  )
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



On 10/09/2026 16:17, Mark Brown wrote:
> On Wed, Sep 09, 2026 at 11:40:42PM +0300, Ștefan Ghețu wrote:
>> Commit 58bb5081cba1 ("ASoC: SOF: Xtensa: dump ar registers to restore
>> call stack") added a shared Xtensa helper that iterates over a flexible
>> array of AR registers (`ar[]`) controlled by `plat_hdr.numaregs`.
> 
> You've sent multiple tengentially related patches in a single thread
> without anything indicating that it's a patch series.  This is really
> confusing tooling, please resend as either a coherent series or
> individual patches.

I'm not sure if these patches should be applied for few reasons:
- orchestrating the exploit or error case require access to secret
signing key
- deploying the signed firmware needs root access
- in these cases the firmware could be prepared to pass the defensive
checks and still cause problems.
- creates false sense of security through obfuscation

Stefan, sorry for nacking it and thank you for the patches, I hope you
understand my side of the argument.

-- 
Péter


