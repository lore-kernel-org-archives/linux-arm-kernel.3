Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FDCC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 05:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qio30BBoJgNtCXMiZsiYGpqURN/Ug560k5Han0gxn+E=; b=jHj4nfDT9Pv9D7xUufI8S3vtGE
	pxfJKM7J6cxvzI/wBOaA3lbnHK3QkLRZI8u2TvL4g1TPibA3vkCRBlmAJfPdw0CShZJadzW9joCIe
	apiEjrR5gphZpRFcUCG29553v1LWYDxNdvaF5rHsXEL5/wrOABKlOlDQpE1EqIQG6S+77jZ9kN0cR
	zYUA+pOsZAdH0KbkbEDRnGToNoNZGOMEiOMfCdWpsKhLqI6N6BVcKrXyNMCagyUM5cXGnfswATnbx
	tEqpLYlXGFBt60E33n4QgBjWkJfe2xS+VhJkqt1tT5jGQbvscExaVuEBaFPh5Luku68xo8GhUeqbc
	TmO94qIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89wF-0000000GvZN-1G1q;
	Sun, 20 Sep 2026 05:18:07 +0000
Received: from mail-oi2-x07.google.com ([2607:f8b0:4864:32::7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x89wD-0000000GvYg-1ySf
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 05:18:06 +0000
Received: by mail-oi2-x07.google.com with SMTP id 46e09a7af769-7f66624aa21so508012a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 22:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789881484; x=1790486284; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qio30BBoJgNtCXMiZsiYGpqURN/Ug560k5Han0gxn+E=;
        b=rKP4RDXrjoCdqFycgsPh8XTXPMDRjdD1ZfRnmyS4q/69xbSmCaIGVIaXK07T+UhS6R
         5bMNOEtBC6aiivNUIkHCCrXeI7I/WqIshk7WCc5J7yNbXH/f6JG9oMRJgcxRklXeFn8u
         0xv4rAA82I9lF2Asf6h8meiOndtL760LVr7ClxbsSQqJxfza50QWK6E193dh3qTseonV
         8ltJzI1EL+6Bdb9weyBEuZCNryhlyGuFqMoPREBrqT12BhImEnnWG/f29UI5M2E2Eq3S
         cJg6joyt7zaNWVNY8S3DPBq88zbLGgDp15L/uJhyxmLys93IKAar5j6X7lb8PI1WgbUb
         Izrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789881484; x=1790486284;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qio30BBoJgNtCXMiZsiYGpqURN/Ug560k5Han0gxn+E=;
        b=h0Ws9YIv3Dq9oaHuqpGAJhXE/iNFTEkVylbD4hAF3Qeb18gjVBRV/Kz7V1413IJGuq
         El2V7q6P21ZB45j1jC7llmIohx4hs3LyCJ7DGuaSB/3QJX6iEHFaTrhXDeIx93C/Jc4/
         t2yQJNRR9eLR/DdJyeRnDL2w26b5V+M1dNP1PpUO+goYsq2M6mYxE9mf8zk9dJofET1R
         Ni32Rne7Bc6d+3rcE5PM0hUtiaYr09XQZC9k0EBUcPjNUGOGcezCuGTeXBkWyjeqaKzZ
         GB5TzZgPYEG5KDoOpDKm0goxYzDsO9vi9+tkLBaefVXzHTRtIowZx5vxQuXoHtP72e2Z
         EzEQ==
X-Forwarded-Encrypted: i=1; AKwUvByYkFNoOdUX9JgXhk9aWCev5+Xksh/OcfbZhQkTe/9Dd9wEs4Oj0ehURMjLRz7yx6kuR/Vfke5AUGX6Kzm5zW+q@lists.infradead.org
X-Gm-Message-State: AFuF++mPWMIevIxb/kKakel7uHXMD+I62mjI+BfitcNI1UOCHiaAIlpl
	gbg0Slb6+D9ebf3+bqkvc3iupWSrDQfKAg2E4xnlC6azbIwqqR2cG27t
X-Gm-Gg: AYBFou2I0Blgt7TBbpxmCyysYk8gLEfm4nVWCrJ1qT0yTVZjachQUsfaw84ilfyuW3o
	DpUDLS60iG/Ln2W8vKWvGQEnVSWWUCIAJsFXbkwraMzjbEl1HzKgO3pusG8XJ6pvMAHidpwaueb
	O9rcXjR6aJzbxP5+XS8gr+cU6DybKGaU5xK2Anl7FG6tnXhWwtYTI0TeBJ90A/G467WxEkvp0yL
	tvajHffLC4Wr5KtFiBhWAeeaMYoC/dKRISw6UmYt8yGSkfifjT1LleW8+2WYD9Tg6855oNq3x6O
	g/ywlmF/2sWsSa2zLJm78Ap2esi7KAUzh8ySX7bLmW9erLVld7ZUQmFpepHJpA5XPPMguhANAAz
	N/RzAKGnaLtrwK27xDmnmh0wyoNdeKVYVyd0fAXVTSU5UXS7h8p+O8gSWzoJi9FZsmCga/XgZoJ
	ZstVcZibd1eqKzcqRXvdc1xF+oT/dNpeiua1kGobljqUiwwAeBZMx/9nvf762P1iX1a991F8Cxx
	cD8drdo5nw1Occ=
X-Received: by 2002:a05:6820:2219:b0:6b1:2843:1312 with SMTP id 006d021491bc7-6ca972e90f2mr6018628eaf.0.1789881484271;
        Sat, 19 Sep 2026 22:18:04 -0700 (PDT)
Received: from ?IPV6:2600:8804:5716:d800::2620? ([2600:8804:5716:d800::2620])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd320d5c30sm5494232eaf.2.2026.09.19.22.18.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 22:18:02 -0700 (PDT)
Message-ID: <1c1b2958-dbcc-4a8f-8d7f-d2eaaebc941b@gmail.com>
Date: Sun, 20 Sep 2026 00:18:00 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] iio: adc: add mt6397 PMIC AUXADC support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Roman Vivchar <rva333@protonmail.com>,
 Luca Leonardo Scorcia <l.scorcia@gmail.com>
References: <20260917-rbrue-suez-upstreaming-mt6397-auxadc-v2-0-db35882a6080@gmail.com>
 <aqzl29C_R4zwAnDK@ashevche-desk.local>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <aqzl29C_R4zwAnDK@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_221805_510136_D9B770DC 
X-CRM114-Status: UNSURE (   8.00  )
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

On 9/18/26 2:18 AM, Andy Shevchenko wrote:
>> Cc'd Luca.
> Instead of this, just put the real Cc: email tag here
> Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Done in v3.

Thank you!

Best regards,
Ryan Brue

