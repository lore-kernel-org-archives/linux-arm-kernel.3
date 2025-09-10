Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA25ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=as8/dZDO8owF6SFVquRrpoPe4TAAz7QgxjhL0k5eGCs=; b=H4Nlmf2woHfc4ttW34cWDM567u
	8afdleijL6gzgqgC4pZyuH7AoIz1W84t7dX4nH4Yx8TP/nKrfVczcKjJgDzr6jj6u7MajxlOCDSEq
	cS6VLoO7pFRJASlUUU8XM/nqvd8vuiBgCOTkvnHpWAXD0SobKY3cqKmmXINKAy2XJ4jDXlwpm0pxE
	NoFtmyw62qSGWuAnffW1ktPFABeG/snSvYcNnn0sjAh5XxsG0lnkkYC7wa/RZrcFAwIpiZ42Hz1fw
	syJ5DRgm26SxreRVULJstY8apWFa+/oGtYH6x3rDajBYWV9H4S8xL6TChTqd3Nefw/AWQcONYjMBU
	wTXxgCmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEtC-0000000COMZ-1EPm;
	Wed, 10 Sep 2025 07:05:10 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwEt9-0000000COLq-2h29
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:05:08 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b04962540a0so99037666b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Sep 2025 00:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757487906; x=1758092706; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=as8/dZDO8owF6SFVquRrpoPe4TAAz7QgxjhL0k5eGCs=;
        b=ynlAZXMwPDonlSLVd+ZjuvDv6CCvYYnBf9cDW5BcddY1+nHqixOHrnSUal0vrDHkm3
         qn2PwZLO8WH2hEmtUmQKPS55a/Rt3GZVk2KXmSSrG+pUt+1u0gw9kMTpq6HPPVq2wsA0
         tz1JrbnvrdsjX2hei5L+KX/yBHP5NvO5Jc9qFyStSjfZ+BDu+MDVQuybJesvL4wW0KPm
         nNw6h90SO9TP4HuMlk/BGOzRcWltrPw+gtUo7/qfGC2IP6j57d7EiLYLt0SLH0vo+tZc
         QAJOZJGRxygfXKtQsb3mKWmHnzYKy+u5a6XTBPoHj4W9ZrKlci73k7CWZw0OKrjGj3iI
         3VCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757487906; x=1758092706;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=as8/dZDO8owF6SFVquRrpoPe4TAAz7QgxjhL0k5eGCs=;
        b=E8sLyWRJsyr+CCSP+6Y79uMJufkFNAaNs68R6UMHjlOxAErcpqeruFZvGOxofxpVfQ
         zKzfCcL/HVER+oGzTcwTUipXgIeQLOL7QH+WpWODRhIdkl+mqxp+TDdter6/mC9JyZFC
         zWqDSZtR7cgOgge8iUm9/G58Dz5IwXwJLFn4IlvUj85DDgNkIp85AIez3fO1YX0lScpD
         deNgyj/VPN2HZ/mULD99NIc6p/bKG5E6RtwiL536KYOZib0y6V+Smiw3YDIRAj3vty82
         MlEL095zLK1J6oqIO9b9e7Uwg5y3CgjParwrOJy0AT0lVR41teQ9d9BXg2kVOb0IvkYu
         t0GQ==
X-Gm-Message-State: AOJu0YxeX5BRk8RJ4ikpNvj4fqS1qG0rK46AELm/G/DY6Ym42DgfR8iu
	E/iM8mUAgGZoCtSvOOrBC1zpB4/ogfsaB5dLNiSM41u6j8f8Px15j4jGPrpL3/2nukc=
X-Gm-Gg: ASbGncspPxKy3+qK5F50PSr3Z3YtxmDGUSyXWRcQ9BWKw9nr82j9qOfelncJhftjte5
	cdggRrxAz5WCRaHqQdZMcIg196vqog/8N7Shy/rUASB9F2R0/ZKW4I7pJAm1fezJE6CdrmsyRfm
	f/1zaU+WhTk1mSjQaF2W4QbJqy5Kn6XaeECCjBOKC//y9jciKZ1jmqr2csZtCq04Mxjhd5G+Ueb
	7lHLGqYBRtlSJglPFFCrJrX37UtDzikGNerGqQGZOOwcu5GnU6QEHvv18aGdyd2yWL2XVOW3tO6
	SqnNhC6OtlfaDY8D5ClvCn0qxTrR+ccEjyevc5VDLgKj7eJrwgXYs3ewkQPB3J+dx3l299bvJmQ
	LezEpMSwn9GKrfSv0GXXXgR0b1RTwbT33iiyHbwtXHHE=
X-Google-Smtp-Source: AGHT+IF3KfrNaYL9BAO6+0dQRxMKq/YdSHLmLqiuiTFOITlhEkhRhqhcPD3U+CMEhWrTIxTJYOV9jw==
X-Received: by 2002:a17:907:60cc:b0:afe:ee31:4b93 with SMTP id a640c23a62f3a-b04b10a4accmr724030566b.0.1757487905603;
        Wed, 10 Sep 2025 00:05:05 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07833ebe61sm116132666b.89.2025.09.10.00.05.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 00:05:04 -0700 (PDT)
Message-ID: <f1e3c3a9-9929-477a-b1ad-e485c059cbc2@linaro.org>
Date: Wed, 10 Sep 2025 09:05:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/7] media: dt-bindings: Add qcom,qcs8300-camss
 compatible
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
 todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
 cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
 <20250813053724.232494-2-quic_vikramsa@quicinc.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <20250813053724.232494-2-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_000507_723562_ACBEC273 
X-CRM114-Status: GOOD (  11.07  )
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

On 13/08/2025 07:37, Vikram Sharma wrote:
> Add the compatible string "qcom,qcs8300-camss" to support the
> Camera Subsystem (CAMSS) on the Qualcomm QCS8300 platform.
> 
> The QCS8300 platform provides:
> - 2 x VFE (version 690), each with 3 RDI
> - 5 x VFE Lite (version 690), each with 6 RDI
> - 2 x CSID (version 690)
> - 5 x CSID Lite (version 690)
> - 3 x CSIPHY (version 690)
> - 3 x TPG
> 
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../bindings/media/qcom,qcs8300-camss.yaml    | 336 ++++++++++++++++++
>  1 file changed, 336 insertions(+)

So it turns out this code is wrong and you already sent fixes for it.

Bryan, please don't apply it.

Best regards,
Krzysztof

