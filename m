Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F46C021A9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Feb 2025 17:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6Me8ZURi9BHMA5VBv/dcrhQFM3Dtg/x5OSHUQbvC6g=; b=nr8FYorIMP1OaqjDymGhF/CDP/
	vYfIU4DS3ySDIeReA+ZrIUDkqK7/HUY/iyBg6Hp5SouOSOnlIpToKiYl3HWPsDPwsGyinIGPmLCq/
	Tp9AyLZSu9dqthWE+5eI/geIi7TE3hx32NeyWKdoSormyDIwgTgbk3Jtqg2hdlac1yWfdgkqZ0whu
	UzlbYRXyqISYTMrwHatEvGeI0Y8XyDS3uhrPnXvFKc1WFW2xqlpPGnhwn6Whp4Zi7MwmL2xLPvwqu
	+psaeCTLEgUZXJQwfpQ/OTrc1KAA7rZ/N5mrvZJmpI6MyK76a2Lo/GJMaZQoKyjU1rXT9jals9yoy
	RMIpHHFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk58o-00000005UlN-1Ztl;
	Mon, 17 Feb 2025 17:42:46 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk3vK-00000005FVe-0HSV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Feb 2025 16:24:47 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-aaec111762bso1050898766b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Feb 2025 08:24:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739809484; x=1740414284; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x6Me8ZURi9BHMA5VBv/dcrhQFM3Dtg/x5OSHUQbvC6g=;
        b=eg+/TBKmp8+fIujg7UN3QWDPKqMJN5r6p448v25PB8zJ1p8iXjzr4O0Yv7wyDEKtd0
         XzU+BJlGRPtwmp+an+dIQh8U1XG0RRXy5GFKUviz1XnzrahJ19kuntuBmP8ejnkbgDTg
         Xq8nMemDlTltc8ek2H9lr3HGiBW2HtWcb8NFP/lWzoKIYKSMwN/qKVBOyhL2ZLVS82KU
         +J6oEnv9V2sRnhSpFh7rgWipC0LVplE78RcF/VDdd9A0rSRsf9ck1u6XkOVCAleuk9yr
         lqb+ntdJltcMvRcJHVyXISM2CJYsxh8RFmvHzGFZsDnYljgKoiy0WMSXCnKM/wP/YgFl
         WnZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739809484; x=1740414284;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x6Me8ZURi9BHMA5VBv/dcrhQFM3Dtg/x5OSHUQbvC6g=;
        b=bXFL25faRozutXAXSaS/KJSD70CeDmpFHNf8bGjbfOOvypGOk0vq58lqi2OTfSTLN5
         UZ51heUUO9TseBt1Ye4j4X1PRUrc10pL0QUKdDzr3IzxL52jrWmRPrKTv539BHrhfy7d
         5FTFpxXHWBgg45FE+MXh3Vj3igoVuzTRCG5Od4FrNKEV8ZY8hC2+qt+tqnks4Vmji1ED
         Brp1NT+55EesNkn91Ph6pPfOniGTp1jD1AfWAGlCJ/8Qcca3fMe4ruqNi0bSL5vb3/Jr
         QLsKogJSxUGkEHPUC9VuvH/DsQkpey+NP4NBWKkN4BCf2hX4QQhJabxTpaFlgTydfZL1
         dCmw==
X-Forwarded-Encrypted: i=1; AJvYcCVGJyyUcO6zXKH3GfiIqZ9MGDK8hgdYVxNxC+D0oArprydON51iI+e1r7hfuS9gaEyGKk6uz3WlZmvlgGOi0mBg@lists.infradead.org
X-Gm-Message-State: AOJu0YzcUm1qU/47R8M+Z7sDPsmXBdcf9/pgXGhuOW5WALgrbMo93Bvx
	U/768jl6mzr2mM922tySIuZmC6jThEMuwbURwO3/q2zJnMvATpQ0
X-Gm-Gg: ASbGncvLKJntTIiAiffxwmJ43+N0iZVjzVd0wifxBvfmUHM8nN2fb8duWxCMykkFJhc
	JRZbyfADT3ATibaIriMGPt3/OsHl/qbopyfUn/Jm4vPawPyJdfON6qs3GoaMdcNwlz0fpQz11lm
	I0qGpo/nSSMSezYw2phOOzs/ycAP1eP3kXLTiJFHkDycb9uWqtuPMSwzGg6pvjKCDaHRYI9G0pF
	kJff3A78mCHZtUw9lKhNkLlfRWtR3hyganIxoy1DdBtK0LwlVoZZMb9OSP70mbf8XzPhlTq3Io9
	y+DKAAU6Wa8r+OqFA7bAogKy6k29phIP+52yVN2IP/ez
X-Google-Smtp-Source: AGHT+IF485TpglsHoYcM2qPJw/DdadQMT0idtEVOh9tCPnUieChDKELqnF5ni403s2wOT43n83j0+A==
X-Received: by 2002:a17:907:1b04:b0:ab7:d66f:c86d with SMTP id a640c23a62f3a-abb70df5d76mr1030222066b.34.1739809483644;
        Mon, 17 Feb 2025 08:24:43 -0800 (PST)
Received: from [192.168.1.130] ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abb837378e7sm421915566b.52.2025.02.17.08.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 08:24:43 -0800 (PST)
Message-ID: <c6c5e039-7c86-4813-a880-89b864822d80@gmail.com>
Date: Mon, 17 Feb 2025 18:24:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] ASoC: SOF: imx: fix a couple Smatch bugs
Content-Language: en-US
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev,
 Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 sound-open-firmware@alsa-project.org, Takashi Iwai <tiwai@suse.com>
References: <fffa1613-72e8-4cd0-a4db-b6b13a5222e9@stanley.mountain>
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <fffa1613-72e8-4cd0-a4db-b6b13a5222e9@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_082446_107502_A195C7A2 
X-CRM114-Status: UNSURE (   9.77  )
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


On 2/17/2025 9:32 AM, Dan Carpenter wrote:
> Fix a couple of bugs which were detected using Smatch.
> (https://github.com/error27/smatch)
>
> Dan Carpenter (2):
>   ASoC: SOF: imx: Fix an IS_ERR() vs NULL bug in
>     imx_parse_ioremap_memory()
>   ASoC: SOF: imx: Fix error code in probe()
>
>  sound/soc/sof/imx/imx-common.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
Thanks! For the whole series: Reviewed-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

