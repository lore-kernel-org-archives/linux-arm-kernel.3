Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C0D4CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 20:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iorVWdLlkotZMnSUwkOUwyxeHbcaMqA89GUu9SWioCM=; b=fTFbuxtB8Vo+4LRGWAEytygNT/
	ai+BPqG6ANVaQ/5VGzibeoA9l+0CpHdfbY9daIzuuDa2+NKpPAhchS/vR4yzEKsGTLojOG5UklUf8
	nbzISJpnsqhgdKCnupMWq+bLNMG7tTxCx6kgI9J0iWgWz5BmPb13JGPTxMRoZVtUVKH6+5DRRu9Kr
	cnRlpDV36gBpUSpY1DiBVW9frVoTbmmNO39xUxHtwaSvKxtCICJAYxje0dioucPU7X7joN2GaFbIJ
	wRBgFzdyh2c8aTL8D6tiIhlJeP51zWOs4Nh101awCNsBBwUpd7hpFDUFgJ08ogCGuRIHMjJn2bZ0U
	b1f5gkjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBICN-00000001bAv-2JVF;
	Mon, 28 Sep 2026 20:43:43 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBICK-00000001b9F-3WS5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 20:43:42 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49ccf3ca626so21732535e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 13:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1790628218; x=1791233018; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iorVWdLlkotZMnSUwkOUwyxeHbcaMqA89GUu9SWioCM=;
        b=QoIweLxUOY0UOv2DPQTZqqSXHP1cuiPo7jt0BeekplPt6/vYhcD0VDj7Dsak8yNqWE
         2tncNuyvfke8CWZowKGbapahnMUxvrtQlngR4DhGSxUA3qp1bT03p00ftDbOAgClquhv
         eVgUsOFhtq0iE5jG13JPQXkCVlDGZ2bNto+Ctp8WK5w6FlOCVq+pzL4togZn/v+X2bqA
         7yhCidr8VFtP5ha+lwPXGlB9gEbQzxNgej8Of+Xy+G1Wo4cJulojJJjYnyDJP3fo9Kl4
         Fd+8LnQ3s1ubzx2VusUDSi9pmhKB+rXyRl+bTHMJS9aGlpv+pta4r8uwckOStAgiQFOz
         6INQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790628218; x=1791233018;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iorVWdLlkotZMnSUwkOUwyxeHbcaMqA89GUu9SWioCM=;
        b=unGj0Ua3VV3VuLdcc1hUmaFsLClcmoN6HAU6bAiMwNnDAJZfvB+94U2VH7jhV+M440
         voeqfhppPE3SAT+CR1z/7jNfaBYJi9dQQ6+vo1EbyUX2KoOkumAPawTlQ1QNPMy/wC5B
         KALJ9rQ32euFUem/3mns6miTlVko1aSHCdfFNCvpx7CGXqAKKPsoG1NDlvjo97XgYXus
         0OvOj8FPvxwx4U7jfx647Luo7VJL0LMNFRnTTanXqful3lrmp3RbZx85s1ToS7wRpC2O
         Jpy/jm0mKDW2mzdpXQ8XgdrAggsUFqRqHcfL0PrgtO/8MDIjLi6illl8p/ovdbJQgpQr
         nquA==
X-Forwarded-Encrypted: i=1; AKwUvByWcCNxHg2Ank8Zu6pBhaR2kj4+tx54PMKD+HQ+mlw3EHE29W2eqyVqrZNlS+WSmV/Vu/yUGkJSE5FB5k6Fiv9Y@lists.infradead.org
X-Gm-Message-State: AFuF++k5nrEEm2+39PJ2s1TUJ98LzUEYZw9Zl/MVGaBXK9R+lZWBzBiS
	TRd9cYNix6n9kkCbiU8mBVrpGPVU08/C+iSe9GC9sErDUMMP+DC5Os14HP1p4wcRwmY=
X-Gm-Gg: AYBFou1UStybNI7VztgMSiyqubacDacq7MaqUwikPYgOgfK4h9pHYZ/ups0POeantcK
	YVZrXXR7ISxbK0GKq0RPBcA2Ra3Dp6qVO/lKswl8cnCR0QWT14aml/fwK2heeTmntNCqdlRmsVF
	1HdzDkIuLVycsVPqs4lMmSLy+bkNUxujcVtQs43VUofKWJUnC3pNhvIN2y9ZoX9J+GLhqB7HRBi
	QE3EWbNt6ax57DLRJPnmJOql92GlxybpEMKIi6M8KewZx2N70OEVUniw5hnCWOLGySPj6Ku0Qdu
	WSw1QT3KJtdUBUIlOi+SKf5PRXx4JGLK7LU5k3qzGsJJSQFE4f+x6ktTYj9arVIpisWWQtLsTa4
	Dpt5lqBezn52amLNqBohL8mv0fFyfcMSuOvuBfRswMp3Nk7UWkJdviMSUNAb8j3OgfYL+yhM0S1
	BYSKcSXu3BLWi7I3AfbIis2GJK/N25TP0GVOYWY1FaH4w3GDuF2mF5Pymnwg/0ZHhDvLS9Vg==
X-Received: by 2002:a05:600c:4e0d:b0:49f:ff7c:c96a with SMTP id 5b1f17b1804b1-49fff7ccb16mr127831615e9.4.1790628218211;
        Mon, 28 Sep 2026 13:43:38 -0700 (PDT)
Received: from [192.168.3.100] ([151.42.82.6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cf2d973sm23971435e9.0.2026.09.28.13.43.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 13:43:37 -0700 (PDT)
Message-ID: <8cead6cf-6981-4d11-b9f1-a752ae6b82c2@baylibre.com>
Date: Mon, 28 Sep 2026 22:43:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] ASoC: dt-bindings: amlogic,gx-audin: add schema
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260922-audin-v3-0-a760312c076c@baylibre.com>
 <20260922-audin-v3-1-a760312c076c@baylibre.com>
 <20260928-native-hornet-of-luxury-81edcc@quoll>
Content-Language: en-US
From: Valerio Setti <vsetti@baylibre.com>
In-Reply-To: <20260928-native-hornet-of-luxury-81edcc@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_134340_901566_EF003FF3 
X-CRM114-Status: GOOD (  16.17  )
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



On 9/28/26 11:54 AM, Krzysztof Kozlowski wrote:
> On Tue, Sep 22, 2026 at 06:00:46PM +0200, Valerio Setti wrote:
>> AUDIN provides I2S audio input support to the Meson GX platforms
>> (GXBB/GXL).
>>
>> Note: GXBB and GXL are not known to differ so the driver binds on the
>> 'amlogic,gx-audin' fallback.
> 
> What the driver does is usually less relevant. Here, completely
> irrelevant. Explain the compatibility between hardware.
> 
> OTOH, you cannot have family compatibles (clearly documented and
> explained on every beginners talk), so what is the GX?
> 
> And I already asked for this:
> https://lore.kernel.org/all/20260913-inventive-millipede-of-certainty-dd58ce@quoll/

GX is not an SoC. It's just the common part ('meson-gx.dtsi') between 
GXBB and GXL, which are the real SoCs.

I think the confusion on my end arose from following the AIU design, 
which I now suspect not being up to date with newest design guides.
I will rework the series using 'amlogic,gxbb-audin' as the fallback 
compatible and only extend it with 'amlogic,gxl-audin' for GXL.
Please apologize for the mistake.

-- 
Valerio


