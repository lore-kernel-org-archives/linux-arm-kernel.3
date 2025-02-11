Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CA3C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 21:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FJXKo1rnLuFl+cPx44PrgMfGxNwkvUIiAKY29YBOxLs=; b=IZK6txCI3rDv25lQ14F+yNJYGV
	wg76XFVY9I2UkzFtne/bH8qrWT8E6ePSix2k6Hr+RIXQZygHTupO13EuHEiL6Zsd8TfTMGGWrYbz+
	ydWHCFai39ZHStpVBIBwwDN2fr3S67W4YLKkJkUoJ6GMHf3aNY5ZzGCWLSeCCxgjw2qQw/0FRrgur
	8HZH1uy3C2JUIzU8LX8c9zV595SSRMg1ZCxC20kDO39HCq5mlOZtpOKcSVZZtSSWaUs2+uEsvxpPj
	QGe49oNV/I6l90zn+U37qz9i4SW6wci6zJfdCq0ViqPwgncMV2vbmB+hQRdqsAKN6At+FiDaaReKb
	pGTjSFOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thxUB-00000005IEN-21D1;
	Tue, 11 Feb 2025 21:08:03 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thxS4-00000005HlK-28gO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 21:05:53 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5de4f4b0e31so7697546a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Feb 2025 13:05:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739307950; x=1739912750; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FJXKo1rnLuFl+cPx44PrgMfGxNwkvUIiAKY29YBOxLs=;
        b=gB84vRIEeCaGxpolUDVAIslea2Th3hz/rTyZbvXKi3Y69yFEdE051xYfkGWs6i3L8s
         Ay21o3yHobrg/wHSnhUVqnBdYUXOYgPhuiNMztdrmum+G+h+qlvBQ9ljIWzGLo+IU6qD
         nF+xRB3YW0jZFmRjS6/PHo1Lw0IBWUn9T2WwNuLQP+MNGwyiZUpNpoUU3UGbJJQON1Nu
         iK0fka/QMUFVtkPCX+0hQnh4T58nRAzSNbXxnxdtWMzCk9nXfwwwAhV0+z3APVG9AWaD
         FvpfKsIEf5UqFJ+tYa8DiytKbl8bTphnPoITtxc4ZsKsCimM0oFMDSteYbsPg7iawKio
         nlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739307950; x=1739912750;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FJXKo1rnLuFl+cPx44PrgMfGxNwkvUIiAKY29YBOxLs=;
        b=krFyuJtRmsTaBbKm6Jlb+BK5laY7Mdp4eWCSo/SvzglKbRiG6wjorKs05U/i9ohVLs
         Ynwim7wD4LtyahAPKG9no2Le9wG0TUN6u9gBNW4sYuXjN8pAH9VqaUmguRnyoksmMGGr
         fgF6/ljzRkr30y2JmVGjdeGWh9JtbFX4nWZ2T3kFeFLKbXoBbfjPhDqODB76zIf8U1xy
         SVeW1xfaA8KETFcU33IFxh+ZdZ5gk+p0HhqeW5d8vZY9v15vODKVloqYBPNL5pOkKEfo
         UmaDlMDXKmcp/gqJ2z+r/1tJqsHyj8nQdONzPfKWi4tizkxbehrpYduc1f678Ni6jBfe
         RDjA==
X-Forwarded-Encrypted: i=1; AJvYcCVLp3xuMoyq55MRvD9daQFrYQ6BAvz/f4ZPrddiMEYgEaWfCvKyWyL+Pg6p1VuM1Ue/UYg5+dNLQZIpGFdooFnE@lists.infradead.org
X-Gm-Message-State: AOJu0YzgbQ5XwfEMaHclD/KX5RDNephA1iuZCstbXM94secxvmZOXbE5
	ShocKS9ilPnTj4mS4Oj5Diu+kzC1mjnxORVpu/Qa1igkiyU02hPk
X-Gm-Gg: ASbGncssagOvhtfqIBbpekq3E/W7Ac/dmdQOFHbmVuMKb4+SvxBh5oh0dqPtfq0bdEI
	6qnYr67zewhm6W8OqHH8Wgz90tgpCWyiRGa0B1bqkXWmJY47o6IR6ykkI64xWpWahqSk6ErlvvA
	lJkIGmAfrRqFVoQy40tmegX6RGU7pjnlzI8VBQU9eSNCHUKLwg5bxdWrvInjAIXNCQfR8B31Voc
	nRAKulQ1LlobYNLVGfMnhYIK2i//fjEFYixIYkvbp5Q3y0+dVB9MYtYSO57uFJkIXbEsIuBjr8N
	PSGGaiRhm9tZUL+mTxfQFyK2YgMA7EiOd+a1X0qcr7yfYxwHcf6Q2Oe16XExJpP98atU
X-Google-Smtp-Source: AGHT+IE7TnL7jc5Iz6vTWhHrtrNij1s82deccxe7iwkiWATFIsU+z46kqSPjvpXY20QnIYGBevoc4Q==
X-Received: by 2002:a17:907:7251:b0:ab6:d7c5:124 with SMTP id a640c23a62f3a-ab7f347db92mr40005066b.43.1739307950174;
        Tue, 11 Feb 2025 13:05:50 -0800 (PST)
Received: from [192.168.1.23] (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab7bc28c58csm526166266b.135.2025.02.11.13.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 13:05:49 -0800 (PST)
Message-ID: <7251062a-c665-4f09-ba47-6e890e2911d6@gmail.com>
Date: Tue, 11 Feb 2025 22:05:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] ASoC: sun4i-codec: add headphone dectection for
 Anbernic RG35XX devices
To: Ryan Walklin <ryan@testtoast.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
References: <20250125070458.13822-1-ryan@testtoast.com>
Content-Language: en-US
From: Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <20250125070458.13822-1-ryan@testtoast.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_130552_551526_26131072 
X-CRM114-Status: GOOD (  16.69  )
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

Tested on Allwinner H700 devices.

Tested-by: Philippe Simons <simons.philippe@gmail.com>

On 25/01/2025 08:00, Ryan Walklin wrote:
> Hi All,
>
> V2 of this patch adding support for headphone detection on the Anbernic RG35XX series. No functional changes on this revision, patches refactored to more clearly represent a single change per individual patch, remove vendor prefixing for the device tree binding, improve documentation of the DAPM widget changes and associated UCM, and small whitespace fixes.
>
> Original message below:
>
> This series adds the required device tree bindings to describe GPIOs for jack detection in the sun4i-codec driver, adds support for jack detection to the codec machine driver, and describes the hardware configuration in the RG35XX DTS. The existing speaker amplifier GPIO pin can then be used in concert with jack detection to enable userspace sound servers (via an ALSA UCM configuration) to disable the speaker route when headphones are connected.
>
> Thanks to Chris Morgan for his assistance putting this series together.
>
> Regards,
>
> Ryan
>
> Chris Morgan (4):
>    ASoC: dt-bindings: sun4i-a10-codec: add hp-det-gpios
>    ASoC: sun4i-codec: correct dapm widgets and controls for h616
>    ASoC: sun4i-codec: support hp-det-gpios property
>    arm64: dts: allwinner: h700: Add hp-det-gpios for Anbernic RG35XX
>
> Ryan Walklin (1):
>    ASoC: sun4i-codec: change h616 card name
>
>   .../sound/allwinner,sun4i-a10-codec.yaml      |  6 ++
>   .../sun50i-h700-anbernic-rg35xx-2024.dts      |  5 +-
>   sound/soc/sunxi/sun4i-codec.c                 | 59 ++++++++++++++++++-
>   3 files changed, 67 insertions(+), 3 deletions(-)
>

