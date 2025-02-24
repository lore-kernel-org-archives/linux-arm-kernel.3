Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 810CCC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 10:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YlyuCvvFDo2128e2teHgyAWHlRy7aBFZ5OZbDHsqsLE=; b=jschgvq/FAMB4PA2pnuvEL2oem
	I/+3LMfeRm7y+DQvUidSYDhIcIWd+Z7r0n0+LIDqKSwHqPxHJBa0ZJh2QjHBiwTM+qX/7tAPEz2Jn
	txxUOwfzZ7iKME6F4doygb28JFrhfgn/sNzUU+t0zeYEY1TT0h9guIHlCNVC3GCaTlkzRjr3vf/fL
	0wSStEgYZw18ZnFSUX9mjwk4pzmClDc0HBGaAlphzus/bb6Kg5A3wfZ2U7r9l4xlHogTLGvAsYwL2
	coYaHAVHHV3GIlcBZM4PxGtOR4GtilJKiW39xI96Qi+3amYOl5DmzonA/Lj4XboEc5dac7Wjnh8aT
	z4lW0lZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVRK-0000000D4AS-3D6Y;
	Mon, 24 Feb 2025 10:11:54 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVEm-0000000D16j-0rIu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 09:58:57 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aaecf50578eso822748566b.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 01:58:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740391134; x=1740995934; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YlyuCvvFDo2128e2teHgyAWHlRy7aBFZ5OZbDHsqsLE=;
        b=mmMP934tuV41/DeqX9cJU8al/fJm/S4H49HnC4tTIx95w7XTeSf+nMgsD1Q2nEXsCK
         lmnrgIUgOg3p1IRE03HfItb8bsmvzLpb+rEUm86DIHU0NKeBstLz6ALhcAbU3YBqz6e5
         NV9jVQF7G7aC+yaMOBfReFnuyPuNGymYwoWZnwocQyEFMWxpy2zqnXu9c3p+cqevsrhW
         pwH83Tds6USH96W3YI+0IHg3WQ/E+Z2bUwjm3K+QN0g5cKF3PAVasqZG1k0wT1BQMQq4
         8MLuGcWzfPmWemfQ4X+LyxPqmAW3HEKCGljaAhOHkfx6sXJaDGDrvaROLAUCczx4WdE5
         wIuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740391134; x=1740995934;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YlyuCvvFDo2128e2teHgyAWHlRy7aBFZ5OZbDHsqsLE=;
        b=oKTDX+mjuvj9yKJ5EF4vQ6RZFn/YgAYugdIH3okyX0ZX1jbCaMuDbnWwZ5KgJYgTh6
         GaPg7EYna0XA3eVopeIpgKGdjXCjVdMT3AUIK+Vl6cqSh1NWf12jDTtrjoohHFybITK6
         MylscFpger5EPpHMVd8sPE2CYFqc/8kH6chrzN4y8NeHXq1feNTKknK+vwxKAMGx5Hqq
         jCQu1wMFW36gUzsmf/r1QCyRVlPCDFjP53HPweIncSkfAATxY/srijvFhGdecCDcvfCr
         T4yAZKLoHpqjN68Lzly/YcCdyfaEWrS2h2Pxv+zh7WKESmFnW0MWxZvupCVP3Glka1JA
         xVuA==
X-Forwarded-Encrypted: i=1; AJvYcCWaXJcc0dqedEN5ZdMMh/99tqnPHbSdIBjXNYTSWFKA0wBZ81eMFXAqf0vLLrHtbELwGKTfC2Wyjd7jf8T+b4HB@lists.infradead.org
X-Gm-Message-State: AOJu0YyEdXgEDbOvAoNMXQLSh0Rr5IQMoffHBR2LS0bziFqjxaVX0phn
	8x2rnYzGE+anXiPDcE2OTe5f6klN2pxxqEHhA5aHH1KM+xBJ1M5v
X-Gm-Gg: ASbGncugSJGlx1rkk6jHRMCW6V0vd09rRFljM40bVSYOPb3QopuHqDKCSZOpF0edDGU
	E230uTSh8Lbu2dKd6JRTbZko2AK9mOnd2eb0l1x6bBj05hgwRtxQrLNgqMKz412ts9Oqm8MjVH5
	eAUV11aGtC++lKgtlEZFPiEG9A6gXMjc1nmuNA0YwCxH/ez/6fuj4wmGKc6RO2oZN4zPmrW7VX3
	VoeHXA2RVjjOG2uZ77Qz0kRFc1VfRvMAtQFLNd5+5vzVbWJ97kmUy6hUiLaGjbFs3vhvl4HxrQX
	rFpGCjLUqQvGD6NuBiCMTZEZNNdiJukGwZksFM5g/V5tAHtuFsE=
X-Google-Smtp-Source: AGHT+IE4DISpsiKgYOL3EFZd4l0OSdPpTIlMEud2TUQe2sSiVQY+CihGdqfWOxw12evc/bJo4FFOAA==
X-Received: by 2002:a17:906:31cf:b0:ab6:ef33:402 with SMTP id a640c23a62f3a-abc0d9e4ef5mr1108032166b.18.1740391133934;
        Mon, 24 Feb 2025 01:58:53 -0800 (PST)
Received: from [192.168.5.199] ([92.120.5.6])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbbbc95288sm1255333966b.158.2025.02.24.01.58.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 01:58:53 -0800 (PST)
Message-ID: <a62ab860-5e0e-4ebc-af1f-6fb7ac621e2b@gmail.com>
Date: Mon, 24 Feb 2025 12:07:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] bus: add driver for IMX AIPSTZ bridge
Content-Language: en-GB
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Shengjiu Wang
 <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev
References: <20250221191909.31874-1-laurentiumihalcea111@gmail.com>
 <20250221191909.31874-4-laurentiumihalcea111@gmail.com>
 <20250224075538.7oetjzllqqr2mlnt@pengutronix.de>
From: Mihalcea Laurentiu <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250224075538.7oetjzllqqr2mlnt@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_015856_245246_139499B9 
X-CRM114-Status: GOOD (  13.60  )
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


On 24.02.2025 09:55, Marco Felsch wrote:
> Hi Laurentiu,
>
> thanks for your patch.
>
> On 25-02-21, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> The secure AHB to IP Slave (AIPSTZ) bus bridge provides access control
>> configurations meant to restrict access to certain peripherals.
>> Some of the configurations include:
>>
>> 	1) Marking masters as trusted for R/W. Based on this
>> 	(and the configuration of the accessed peripheral), the bridge
>> 	may choose to abort the R/W transactions issued by certain
>> 	masters.
> Setting these bits requires very often that the core is running at EL3
> (e.g. secure-monitor) which is not the case for Linux. Can you please
> provide more information how Linux can set these bits?
>
> Regards,
>   Marco


In this particular case, as far as I was able to understand, NS EL1 has enough

privilege to program this IP. This is why Linux can do it.


