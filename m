Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E21ECC369B1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 07:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IQwgh/eFhQFNa1zpdZ5wpvXrOLPvfDa3MWFOdnbZAIM=; b=EqOsp8Y31puTjVLT0dTR+DT0Tn
	EzVT6whVFJp1GgSaE9L8oy2Cb/akt/0D6uMBLbVdlAbBaei8VHhZ5ZnzLjzpawXDqmmAxisTwi0+x
	bFdhHlho05wnhlpzcQP4MjiqvYXGsPMRSWurRCZogolmtI2scP3ZLKrD1pDt97rS/pENvkVaNRcJA
	Eyv7ePEAsZ8X9tiQcMf4X4pf1RyWx4pDfLIm+nd/nHyWzqSOA5j94tmDZicqJWsD++N34tnaQI/SN
	TjfcKPyrpWjpzxXqtnKHfaT5XFKUWfa3tqQ+wvbladRJOgtgy6KE1iul155eqJXHa2aANLCyHtw3v
	khx553RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xT2-00000008fy5-2d8i;
	Wed, 16 Apr 2025 07:45:56 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xOm-00000008fCf-2yVS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 07:41:34 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-ac339f58631so101185866b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Apr 2025 00:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744789291; x=1745394091; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IQwgh/eFhQFNa1zpdZ5wpvXrOLPvfDa3MWFOdnbZAIM=;
        b=ntv9PIkUhPvMf92s7d6/yZrt4CrTcdjiKzAM4z6p7xLHufWGWdCwCDWSrZxOFArZ66
         WqFWV9JCZkUnuVE4qI5+eh4SAt4IZXTvaEDCMR6ND39BVLlsXyBPoWOJ23knJanjbgd2
         mC+YlnVTKgiLEZzUG4uFRYxlna633puOwW1RbOHdxdedDojdyQGBSMGrHHHMy7r1kFz6
         cXI4lqVUCP8braAj04SIOgh3FrN6JAb3l5IP6HvqMyvs3ELjUdUWOHVCOmSR2+CXmYGb
         +KsYbz+/UiA3FcqRbQvvl4hJsZLVM/6JDiH43J6RxRDeY+ksYOiyeqoWT3P4f3leqkxF
         ks0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744789291; x=1745394091;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IQwgh/eFhQFNa1zpdZ5wpvXrOLPvfDa3MWFOdnbZAIM=;
        b=hHOoZSbmjwuyARr2kdMB2mTssF+LlLPtR4AIOws0yQD7/1jOykiDZM614cOZTGsSGE
         p7fMnY+9gjcv1rWuVNoB29p3Yb5ibY/lFvjC7t/2LRvOiCaN9hJ0o7VoM6bsJyC6xHk6
         w5dywWvSE3kvPrYMuI2KSCCKjStYhek8rUtwe5f16y8T0r8QYaRcnKim/T2Ijph38YIE
         yCRPkGvlWFNEt8RzdZ+G08K2FxGoWcCsAqNL8yJ6TLIrGecBUCr9lkIuoqut0PjtI3dO
         BNwkoWBUOxbRw9/Szqx6UuolW/uLy0LRtoXpl+QYVNdRNsxsgWK94yLKVSQsnaV70WtM
         ehEA==
X-Gm-Message-State: AOJu0YxfZg+vd2EJOk8oqnnshXIOZe21jufrwzW8idGYERfMJPtBF9JQ
	DKKfHEZ4iF9mbIxormDrvnQaSU3CaNFP3L9akvIY+a2sMwWqIBG6PJebY1Wgcjc=
X-Gm-Gg: ASbGnctDT/yiEG5qxcJd51ZOnwx3F1/A9FABuC72ws0YHtI24tK8Pbq1+aDZSA0xJJB
	CLWxzmG4lHCKgGMAsL3/Z//GSdLbyg9vPZBALmFU9XTR0Mv+FHMCUD1s3KGeY/hg4mr9ubp63S0
	ttLMQPN0L4ngb0G5FTejYOLlmCU+GjKYhXvIoRIjuOm06n/QH20e8j1MqaXyq5XhSe8fvdOu6oE
	i2QG4fxunYOhPv3RhLhCg+wxLh6s9OTBvx7CyzMfje95LjircPNKy+6PV/hZrpTOsnZOe4alcIb
	sbgGJDBmWjY2vPshndp7oRdGOZHy7N/zXzkrnFjj+rtiDMtnZG2163WQPBha/UwFwK6Tfx3wI2w
	T5P6OQmiPNmjh1hWHIFMqZ0wD2g==
X-Google-Smtp-Source: AGHT+IHTknhlFG+z4J8gZnOeey2sdavxFU9JrO/1GpceNf5BqfVMq/pp1GAkF9RLLxRC0Q/Rb3MhbQ==
X-Received: by 2002:a17:907:928e:b0:ac7:4324:f56a with SMTP id a640c23a62f3a-acb42b73ca3mr23355466b.13.1744789290805;
        Wed, 16 Apr 2025 00:41:30 -0700 (PDT)
Received: from [192.168.1.26] (46.150.74.144.lvv.nat.volia.net. [46.150.74.144])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb3d1cce01sm74205266b.160.2025.04.16.00.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 00:41:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: linux-arm-kernel@lists.infradead.org, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Alexey Charkov <alchark@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
In-Reply-To: <20250330193833.21970-12-wsa+renesas@sang-engineering.com>
References: <20250330193833.21970-7-wsa+renesas@sang-engineering.com>
 <20250330193833.21970-12-wsa+renesas@sang-engineering.com>
Subject: Re: (subset) [PATCH v2 5/5] ARM: dts: vt8500: use correct
 ohci/ehci node names
Message-Id: <174478928969.20468.13803674314386256291.b4-ty@linaro.org>
Date: Wed, 16 Apr 2025 09:41:29 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_004132_752796_BDD88902 
X-CRM114-Status: UNSURE (   6.48  )
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


On Sun, 30 Mar 2025 21:38:36 +0200, Wolfram Sang wrote:
> They should be named "usb@".
> 
> 

Applied, thanks!

[5/5] ARM: dts: vt8500: use correct ohci/ehci node names
      https://git.kernel.org/krzk/linux-dt/c/b112d9ffaa65635ec38dfa18661f6d8a358c275c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


