Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42DE7C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 07:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2t1e8lDHeeC+VhrMMM1rV8xRnNEpcJgqStNn0Vw4SWI=; b=HIkrci/9PQrvrtbYU+ghYGdUNR
	Z5ZLEhqK+vbBlr9We5S/m/opc7RdyglKabLmKo4CT1EDarlxtzvpWdOmCHsR8d8K30BwUue0uvEA8
	/Rz36zTt/7HJoQfs6sUXld5LJBydRfyW8hZayBlC2ceOxUibq4tIso4Z8UmAW567xLUONW/IUrpi/
	CUBfmZH1AcsfhwWCzikSD2c7W3ZkotKipsNQMi5swK967QlE54aavOeTTOSL9BA71ncP/NlucQjPd
	096QeI37i29OHAeXGkvnz6mF7EuTMoRRTOkjQZS3JSJG5mR1Edzt106d72cukF2loRrGEuG8m9E1a
	WObf4NVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tunjQ-00000008DHs-0b0O;
	Wed, 19 Mar 2025 07:20:52 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tunh2-00000008D2o-0hTD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 07:18:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-43d46491946so65445e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 00:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742368702; x=1742973502; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2t1e8lDHeeC+VhrMMM1rV8xRnNEpcJgqStNn0Vw4SWI=;
        b=j27X2VEIbZzF3VcsE18enz0vxY24Dim9GIC2HWKZlmzZOZbYTeev9yOzVla3sisPHV
         igVi3tR3cxVHSk02W0h9SMwg8pPFQQSnwS6igKeeMy0IplbC7oomDahhbTGx8RKFCfvT
         ZWoorPBsuzIyCyhRpRwodLVv4o3LgmuLO3uBAyqGJH1zr88s2bXYJJXms6U8tJXb9oU/
         WVz0GMHoxbVvCZcpPgbWTSh6gFxFmnrWE0qH7gBV/U7PrTqYXHiMwkGITIQ892qnp90a
         HRnJ4hROD1c8La/tPoJEdK5Nf8tQnZXF1JL0hmOMCoHyfTHXJgpjdU6N3s6S8895tARR
         G4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742368702; x=1742973502;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2t1e8lDHeeC+VhrMMM1rV8xRnNEpcJgqStNn0Vw4SWI=;
        b=MBZ4LA1Py4FRBpWLj3NAVTKGpfIPK38IyWbDMRVSxU8UOEAjjtGILJ3xS6I62owk/f
         W/cmxKvVJ9297nRS5NPM6AP5ZU8uz+LtUg41ZkyMHAzm6zaCxkYOx3XBbMBOQVDw2PE5
         MwGTZnKdsZ/zHefdGYf1hFWpQWoHf/tfDDItgQ0SNJIHEYqsuzkU0g81ADP5Kp6WsBcN
         jE9qmKefU93otc4JBb5SPNJoBWKrsjCsOPUaX28VUZ2wYZtbkG8q3OVcEVHIHV9kM/Pc
         y5F8vA758wbLweUDxCcBErLgf5HPLzta+Xyc2q6aCxTOyH/WBCrLIzK5BOeAOZQHpgLu
         EZzw==
X-Forwarded-Encrypted: i=1; AJvYcCUSJ18AKU8+l7uHX3Dca6YMOQSxxNxK042b1TfMAuaAVv1ovWW4VqBHXYFSkQrlf7VMTOcDSREl4lbyiIC5CeS8@lists.infradead.org
X-Gm-Message-State: AOJu0Yz81WUTvBYXXxIng6NdZUhMPwMWvjRIZCpAzp7Bka2Mp13Si8eg
	udL4OX1thGpYGPWsdecUW8eYQZ/Dr4hD9ei4FYOmhHw3BkEIiq/qq/roacJEd8c=
X-Gm-Gg: ASbGnct7j4tJ5yyufnqWvb/6oh0l06ANuT1HWq/QJ15VCJnwjN3POdxG615XopHZm6e
	FexGXY0VoK1oLYW5W5nhzHuLagDH4TD4wb17C4LrZrBvTxdx9x1phN5P9ndkKGD9Aqmxp5WYox9
	phaSCiHtY//cVSj+1AweGp84tz4zo65r6hamqcjXFAIYeUwDMcaFmYA67wkORk1Bds51UAiwEq7
	fmh66iqAQDN/41yKYa1s+KwICqkSssosmGmonBZgGlgMnHbSih2musppaphmL4pxBYHSXHUGCyE
	wgOWPdg2L11w/FmK77umEFU2Fec5xLZPCfVhkzncbJ7AR4GSnUr4yyOaU0hTp0Q=
X-Google-Smtp-Source: AGHT+IE8IxeWFwFlKpP8Jw2vDUuTM92MTiYoo+wRg9VD1zFAykda6SI5zvDb5BcQatEeBZe+hwdHQA==
X-Received: by 2002:a05:600c:1553:b0:439:9fde:da76 with SMTP id 5b1f17b1804b1-43d44bd7e25mr2942125e9.0.1742368702376;
        Wed, 19 Mar 2025 00:18:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb7eb876sm20048778f8f.83.2025.03.19.00.18.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 00:18:21 -0700 (PDT)
Message-ID: <3f147dbd-c4a7-4cf5-911c-1d9263f5067c@linaro.org>
Date: Wed, 19 Mar 2025 08:18:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] dt-bindings: remoteproc: mediatek: Remove l1tcm for
 dual-core MT8188 SCP
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tinghan Shen <tinghan.shen@mediatek.com>,
 Olivia Wen <olivia.wen@mediatek.com>
Cc: kernel@collabora.com, linux-remoteproc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250318-scp-dual-core-mt8390-v1-0-8733e192cc73@collabora.com>
 <20250318-scp-dual-core-mt8390-v1-2-8733e192cc73@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20250318-scp-dual-core-mt8390-v1-2-8733e192cc73@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_001824_198329_C4654063 
X-CRM114-Status: GOOD (  10.85  )
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

On 18/03/2025 23:22, Nícolas F. R. A. Prado wrote:
> The SCP present on MT8188 does not have an L1TCM memory region, but the
> binding incorrectly requires one for the dual-core description of the
> MT8188 SCP. Remove that requirement. Also update the minimum number of
> reg and reg-names to 1, since as this is a multi-core SCP with no
> L1TCM memory, only the CFG memory region is present in the parent node.
> 
> Fixes: 91e0d560b9fd ("dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

