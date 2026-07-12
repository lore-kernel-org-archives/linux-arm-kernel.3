Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E82EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 10:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cGH0CHldg4jiiPBZJVYaKTOv1+yLE6ScqD49SVU+0Wk=; b=PRkicljFQ+B8GeTUQGJSa8UEYd
	JaaCgx3xTi23of0KwbH9AJJ64hTCGcFOyT879uzAVJfockCSTZpruDTDPN+GVur3G6mhZVyw50DAc
	AMPOt/kdOmLKkfNRhWgpuHdT3AYl/1VaTSoHUGKM4NWFLkUw/w3NctUkd76eWnW2idRgucy97mG9O
	NGXGnJ7C7N+LHewzap9sdL/WabYT+getc/mjM1tYU04NOqUUn97UZ2eohOXVcTLTTMT75jcqt2dkA
	4BR7k5J+/RX4Zh9U15L0Wlcy+MjPOMUtF+pptpfLxQ72WRLaXtisBZIwd0TdFFdWftkfLQwSPFcYm
	ZmkZKOUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirW9-00000007MwG-3syK;
	Sun, 12 Jul 2026 10:34:37 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wirW8-00000007MvW-0iWU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 10:34:37 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-476d8e647e9so2376098f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 03:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783852474; x=1784457274; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cGH0CHldg4jiiPBZJVYaKTOv1+yLE6ScqD49SVU+0Wk=;
        b=JST2Z7eRdsGbEI2/EQV/Y1lH1Us5Xaq9jRo8wa1W1bNEPHIQNIcRp6qcV+5x3Z9LnR
         iJZh4GxqiYypXIC/rI/MHU+ETuosCNJbE0Z8khl9CxaZp7fQSq635RbCnRLp35GmdDeQ
         Q3YfmElHvnzdvsYGrVun7nZ28jHAMzfV+6qvLAybTU//Se46F1NMiUJjhrJuqefC8ANo
         HW5fWu8CehWRfihjP3cs6ERkOVczrgYQa7U1FrNqDUPnW/5QAwDrDzt/7PG3LtpNz75w
         1CTmdFvhLBuwTEWTJ6bNCVO+6erwAvym7BVvoDFdstUV6PkSdF5pWTENn8zatX1ACfIc
         YJ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783852474; x=1784457274;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cGH0CHldg4jiiPBZJVYaKTOv1+yLE6ScqD49SVU+0Wk=;
        b=Q8KVHHhHAS55uGdfyxqY8fbtWJbKy1Bz8XPC1NwwNivZ+UsBEdS7sRKMAfBiK/QkhR
         YWUyJr3jq8QGlTm4BCn74QwXIhi4S2nhMJzHuQ36gIDM6A6rIThJPy8Xrh+qq+wo77zi
         GkvJC2lK36b7X7COP1Zsn9g7McE2sFSYTESDcBelSFfp+DoHfT4Nc7mzl91Dz6ySp5pK
         mtfctkT5D857ltTlltxgV1z4BaMNuPc044PC0KDsC0J+0bW7ep3OUYk2ihtlWsq7T4Y9
         w+QP0QzKEpBH/3r7PPsfjbSSkJc8L6hPkgBQRLdkt7b/cKxbt/DlRAK99X9JnOBCDIxF
         nd1A==
X-Forwarded-Encrypted: i=1; AHgh+Rotj9z+wGT48LQ5OrVF9JjNHwrrpj1Z1O6PWy32FNoP53M1jXxYcpLXr3DJt/4SareaNyWX/froK2XbzzTguHbj@lists.infradead.org
X-Gm-Message-State: AOJu0Ywwg+tltomrAThZUrqO6ANzQL2PTHXGkDEx3XrQGq58Ue/oIvSX
	tf3iIZZ1VMz2A8PE8F/wC91ALUzsm5AQZ/6pVg0yt3/QmNyTjW1AaRv0
X-Gm-Gg: AfdE7clCw1Jcl29RbCTFlxfZb26SXiXiHSd0mGS9/+UwhF1P9PW8HyKEBO+I88nsTFW
	cV8ppFMC4BqxDqnZuUR1NSrzDmBX3+O/9lEh44Nrd/e/mBdDudtnEYErrhrFxrbgYHVtxps7eWY
	4dMu3DmLAVhf8qRecIEl502kNKIHz4BRFDRqXYf+WWpM/3h85tzkfU/dfZdzvmJXTrrBHvXv38u
	JUSYfW1fN9Yl1x0hrvOsoXl3/A9prHUZQl6atwKEfEUdrvGziPtGFLBbJaDeoYlwvkRXRyOsGm+
	Qj6UzchUT7pLjY/BtMkBScUGGySLRLc+XiDgn7HvQUZgE4/43cT+j1ve7nRzjlWxRHbcSh04a9B
	yhz083IesXWJUa1O2Vcz9Zl79jXhRM8C6JDJN215TTH7JlK5zwlQioOVt1EDWFAvVdFOuddhGcu
	Y3uyrqHW4ANZ+9ES6eOxHdchSiVbbe1k0TTm6hEPKafaytEVCy/IV78I/XH+sb2zG/Tr572FGNS
	RydLVM9EKHit0S4R60rUeJwdKh5085kTdfY2/3kQ3FM72NrehS4rozMFLZtMF6CBRiqUOFC/WLg
	3Iiyl3unEozyji41h225eZQR0XjwQdYmQwTEptiVez+a9tWuRw==
X-Received: by 2002:a5d:64ce:0:b0:47d:fc33:df0d with SMTP id ffacd0b85a97d-47f2dcf78c3mr5789388f8f.58.1783852474054;
        Sun, 12 Jul 2026 03:34:34 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039af67sm84880696f8f.17.2026.07.12.03.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:34:33 -0700 (PDT)
Date: Sun, 12 Jul 2026 12:34:32 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Cc: rva333@protonmail.com, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Uwe =?UTF-8?B?S2xlaW5lLUvDtm5p?=
 =?UTF-8?B?Zw==?= <u.kleine-koenig@baylibre.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] iio: adc: mt6323: remove unused header
Message-ID: <20260712123432.15e39bd9@systembl0wer>
In-Reply-To: <20260712-mt6323-adc-rm-header-v1-1-d96395d1a323@protonmail.com>
References: <20260712-mt6323-adc-rm-header-v1-1-d96395d1a323@protonmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_033436_216268_7436669E 
X-CRM114-Status: UNSURE (   8.19  )
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

On Sun, 12 Jul 2026 09:26:36 +0300
Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wrote:

> From: Roman Vivchar <rva333@protonmail.com>
> 
> Remove unused mod_devicetable.h header.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards

CJD

