Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A67E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 12:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6S/HfA2Jq7a1HhJuKKdJo8XxHgRM/1ZMu2JHAvQIhQ=; b=m1+IBQmeHbkQGzQ9mrwPF7ID0Q
	7rFLEV4Zu/UyfYFCz527CGHqgIw4O2ameXzINdfMi96NmJETbSNLNpK0YaERfQpdAwv8gticqkomE
	FvRaUmGpiirSYHp7/+F+taNpqIW4daCX7C/leOp+BYeTjFyyH2S8cqNwNxVGYEkAOeAesprH4IrwT
	dXOh/EVEW+OhZDOyqU3cnCVu51Adp7OfZtRqMJoJ3E8E5yroAKpXbDeOYqyw8FuG/CXFhIo7Eh+cQ
	TeFgb/47qOB+qxda8b3gYVDTOM1tYSEfIYB7XsgIpqOuyc0i2xZVxXu73TotTPoDwQ3hfisQCMSH0
	ZhuXHPXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUyD-00000008Nuc-2JnZ;
	Wed, 08 Jan 2025 12:15:33 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVUQv-00000008Fpg-1XX7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jan 2025 11:41:11 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43675b1155bso160309145e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Jan 2025 03:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736336467; x=1736941267; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h6S/HfA2Jq7a1HhJuKKdJo8XxHgRM/1ZMu2JHAvQIhQ=;
        b=fYg5eZo6Gby8xrXyUTy0/u4nBs+Kyt0GTyux50u2GCNFESU4uofS333ffKbWdGzTxo
         bxhjp7+j+JzRp3heUiMuenThEklho9RYk+JhrFUdesoXcoax8efj4xfPPH78lJCdXcOr
         wUNBMgoCfknvxXyUZPu0VjBrlqHQTsXa/qgE3kFh7H2FxrTuyijz15W4TqKqtjdwkg7Z
         2V3NWHbEH4LwsvvMDPW2Fi/t0PazOau5O+ZXbF47ghxZhaVsOvoayKS6z+7dTKeQWPT+
         0sUdS/7uSWxGqSGyFovG93zgbZe83ipSrZpv0zSFGdGY1q8LGK+CdSM43ZcF6ug+whCR
         GkdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736336467; x=1736941267;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h6S/HfA2Jq7a1HhJuKKdJo8XxHgRM/1ZMu2JHAvQIhQ=;
        b=ucb3W5Go37zfRPxdT9Hviwfd1aokBzr8fIlxBlzmoeSMCpQA767csC2RvuPmKUubUJ
         /O0bCKOpGw2aqb1Fqa/kM5kvEzDdUrSIVdwF1VYcXun60LTfdjDt7WGYPJl8832s37Rz
         I67L8e5jUrAXGpegRFFqnTsg6arv4F4o9fwkCTl+uNmSTOSaDnqz/KoLZKeX6gxOnMtB
         c1DsoU1zTN3U82DdXWuUZFlysYL0PpibJa8Z5587rvDkppa8/dwqRNGktB8Ri6hH/XXr
         /6T3mkTPUVqlHiQ1K1w1RmFtlrYT547e/3WdsJT4Uu6tEZ3eFp4mSUlxY9aIs1bWtK40
         TmqQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3J9rWHniz7EqIBVVwdzONzdFXDbAGLDF6Dt6THdgpBlHSvtQOR8JEx5AsY+SnbLtD/3F4neFbKr17eLEhC+Al@lists.infradead.org
X-Gm-Message-State: AOJu0YznxTRJnayevfayeqZXBox62tTgm0K8WuLVlj7+SBM0W/Z3pnFB
	GnfH9HuvSvUUHX3iL4oSphUQSATXEUrTjeMpawEMRF6mOn0u4vFa
X-Gm-Gg: ASbGnct99P3YqlBe/zF34uj4YdH6+UqGXLqD2qHxCYeKg5YtkNA5EfGGEfGDRDfncJ2
	UwAp50Xu9D0jI0IR3L1FZhivoAyTaaa1tWKFF1QDqqEzC4GwMrWk4n+w5uudndso+rVBPOrw468
	KMpzn3K5vnteuIYt8Tzm68GQb17W2E3Sf9Wnk38BaKRSd8IK38alTxYQ1PKltt5nzVfCfOcsTOu
	zcCVfVNrKWeFazdXZk5JJBzUXCx1FZufPYZo0An2sOfWf7WhFMouCjmMfLRetbNijl4qW6mLmwi
	q2SQVg==
X-Google-Smtp-Source: AGHT+IGZNzJ0gmJc5uMS8tMi5FavbgJj915mjJboHd4V9ATd3VnrztacUeJqVQLao2ZkraSSlltGUA==
X-Received: by 2002:a5d:64cc:0:b0:385:e8ce:7483 with SMTP id ffacd0b85a97d-38a872faf34mr1961390f8f.4.1736336467305;
        Wed, 08 Jan 2025 03:41:07 -0800 (PST)
Received: from [192.168.4.226] ([92.120.5.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828f8fsm51961774f8f.12.2025.01.08.03.41.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 03:41:06 -0800 (PST)
Message-ID: <8605a282-c43a-4792-8750-f56a7370f355@gmail.com>
Date: Wed, 8 Jan 2025 13:41:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] ASoC: dt-bindings: add common binding for NXP
 audio processors
To: Frank Li <Frank.li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Daniel Baluta <daniel.baluta@nxp.com>,
 Mark Brown <broonie@kernel.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-sound@vger.kernel.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
 <20241216145039.3074-2-laurentiumihalcea111@gmail.com>
 <Z2BYcw6x3zyeBwvE@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <Z2BYcw6x3zyeBwvE@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_034109_406444_CD026D6F 
X-CRM114-Status: GOOD (  12.64  )
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




On 12/16/2024 6:42 PM, Frank Li wrote:
> On Mon, Dec 16, 2024 at 09:50:35AM -0500, Laurentiu Mihalcea wrote:
>> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>>
>> Add common binding for NXP audio processors with Sound Open Firmware
>> (SOF) support.
>>
>> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
>> ---
>>  .../bindings/sound/fsl,sof-cpu.yaml           | 35 +++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
> You create common file, could you please change existed binding yaml to
> use it also?
>
> Frank
Plan was to do this incrementally to keep this series as small as possible. If required though, I
can also include the other bindings in this series.

