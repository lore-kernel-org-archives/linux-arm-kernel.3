Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF5DCD6E77
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 12:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hOWy2W3C8F0epU9cKoqDrCPhuhX/iOel8Vt4x+uvwak=; b=aMvEx2Md3fcsJrdHKWERHVEF4n
	O16Ikbi+N/xVwkT30k5jJ3W7TakMP6bgCxuM68eNZAUEGWECCzFQxKWDFcjFr179apMtBbR7Tvmf7
	hv9ZOnqZoAGIdgmPGtBnXMtkVHxhsxPMNL2ruUcJCPT7VZl5FEZyMPGyQivIYja6XcjWAgFr+BMZQ
	Ipw8Ny9FxluMTT8njmFxzssqN86+Az5TmLcScv3JdILJ37NtvBPfAJFZdCLwAoFDhc4g9wahPXeOP
	p62flP0eWF150Wm4Yz0f1+64SJ8bobwvPw6N9M4T99LVFCwj/sKmmo5p/o26lqrO8EbXzqRppexv+
	YOoAP6Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTif-00000000cty-2YzA;
	Fri, 05 Jun 2026 12:32:13 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTid-00000000ctZ-1kFM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 12:32:12 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-91587626ae1so213650285a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Jun 2026 05:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1780662730; x=1781267530; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hOWy2W3C8F0epU9cKoqDrCPhuhX/iOel8Vt4x+uvwak=;
        b=oKSpvBU0ZOmMafoXtocwijZVGMV80BnBBxcC1IacYlUl09s8XbkX+MjVcnC25zH7PJ
         rUBodU8+2HuKKZJGmY4MDR2jAsbLcj9ocewjL91F0DfJZV6v/oWYRSdMA+lKpXaMZQpI
         CNMXT4liQj4su+7S+yDpv+06gBVTUhNS9bilQ5R4RNJ/ksaYTIy9qxRYLshI3QngoO54
         XYP8zR8pXOjixfq189tCslhBy7oYSY2aGfnWGxUBr+H0KAMPTAzMHUpvzeXOVz6H+/PM
         JYFfBw1yI/DqsMM36JuZ5NB7rFW2/SYWgl0TkAMbEtsnYxeZjyPId17oVlRUizlFZcbr
         qRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780662730; x=1781267530;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOWy2W3C8F0epU9cKoqDrCPhuhX/iOel8Vt4x+uvwak=;
        b=FaXiZaV/P4iM1SCT0AbOcaOHIPW9AD9LeIsJTJ1w2W2H12jw6AfvnCajdEoo19eoyq
         w7g1cIdPCMhD+XlJrzynY/2ZmxS677jQL82Ob/RnhqkZ7vJK9OLWSld9mNhwll9LzcFw
         e3anoPZgQ4rYqjN6t2CHNIRq560uVjCcOQ/cffxbVUk8yR857nnSa5Zr1Zei4eRCVx8u
         K7zUE/D29tKjTlMNl7YLiqMgSkE6ABZT8O+HfEoRfoINQnqvzppyFLal2L9ETK0XAdQu
         rrBz1N417PQqBRq7AVcWdNKiOMTgQITrSCb5j3sRGaMmk31feoZOkZMIBSwW8wuFjl7Z
         Updw==
X-Forwarded-Encrypted: i=1; AFNElJ/s4kYWstFnECOVioSfJig1JddADlIKIQeghqy2U2UVH/aUlVtFFARxtKP5h6F3QwihLCAeogr4DTCPooZaPmmv@lists.infradead.org
X-Gm-Message-State: AOJu0Ywcrzd6nYcdzJhzdW/P3x8jkqScuEazxgQH6R23otyd6OBM0aas
	IImeeydyROJlzpdRpwGbNbpHS8PUkYLkLaZEpE8QrTnuDpiaJPTHlIj5O1TuTbnM8WLRuMjzAj8
	bgoDZUns=
X-Gm-Gg: Acq92OHZBwy36dYF/1X53Fzw37z7bbBa9U8fmKqbIO1DWnNOqkLWA7wJOjEvpumuYQ/
	BGrqfhY3caT3iTDDJVYIOHPs7JNH615sdliep82XCKktC/kad0Ur7VJp78ZdQY9wzRYVfNsi9C6
	Uc4nFwzaKygiUTz6fD1gbmZFe5RZ/Fv0bzyjjO1ttoOdGs+Z5vKdswTQr6zA6+GxbrjRq8EhpVV
	5NuTq+trXlocG3bVqdW/Iv5VA85X5BO3ZwomMLJX7x9jHfXXvtRNIO21nKBeLU1Jdq21CVpNPdw
	e7qfP0TijQGjO6soW0NNXsJrG4/86B01WxcH6FJFL2XDZeA0uEc5I8GdsoJ8LMA7XgiUg5Z+7id
	NUOqtH3udCsBau4N6EiGLWnaR5tQ6/eP7QnPuth2x+DOMr5QBMbSY+U2pN59NuxRg0ZtXXtfto8
	JJkJFrKYlLMru7XDwJHo6T4WrHVqJL7wQl4dk=
X-Received: by 2002:a05:6830:6685:b0:7e6:deb1:484d with SMTP id 46e09a7af769-7e70c7b1386mr1725355a34.13.1780662284484;
        Fri, 05 Jun 2026 05:24:44 -0700 (PDT)
Received: from [172.22.22.234] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e6e7974f22sm5817653a34.25.2026.06.05.05.24.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 05:24:44 -0700 (PDT)
Message-ID: <bd2c09d4-462d-4392-bb3f-ca91b2f08bd7@riscstar.com>
Date: Fri, 5 Jun 2026 07:24:40 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 10/14] dt-bindings: net: toshiba,tc9654-dwmac:
 add TC9564 Ethernet bridge
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: weishangjuan@eswincomputing.com, linux-gpio@vger.kernel.org,
 inochiama@gmail.com, davem@davemloft.net, devicetree@vger.kernel.org,
 kuba@kernel.org, me@ziyao.cc, hawk@kernel.org, arnd@arndb.de,
 konradybcio@kernel.org, mohd.anwar@oss.qualcomm.com, hkallweit1@gmail.com,
 pabeni@redhat.com, ast@kernel.org, maxime.chevallier@bootlin.com,
 bpf@vger.kernel.org, boon.khai.ng@altera.com, linusw@kernel.org,
 andersson@kernel.org, sdf@fomichev.me, linux-kernel@vger.kernel.org,
 livelycarpet87@gmail.com, a0987203069@gmail.com,
 linux-stm32@st-md-mailman.stormreply.com, daniel@iogearbox.net,
 john.fastabend@gmail.com, alexandre.torgue@foss.st.com,
 richardcochran@gmail.com, rmk+kernel@armlinux.org.uk, krzk+dt@kernel.org,
 conor+dt@kernel.org, rohan.g.thomas@altera.com, gregkh@linuxfoundation.org,
 Daniel Thompson <daniel@riscstar.com>, chenchuangyu@xiaomi.com,
 andrew+netdev@lunn.ch, mcoquelin.stm32@gmail.com, edumazet@google.com,
 siyanteng@cqsoftware.com.cn, wens@kernel.org, brgl@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 julianbraha@gmail.com, netdev@vger.kernel.org, chenhuacai@kernel.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com
References: <20260605010022.968612-1-elder@riscstar.com>
 <20260605010022.968612-11-elder@riscstar.com>
 <178062720108.1744752.12164392208085928081.robh@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <178062720108.1744752.12164392208085928081.robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_053211_497411_2B1E5F40 
X-CRM114-Status: GOOD (  20.71  )
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

On 6/4/26 9:40 PM, Rob Herring (Arm) wrote:
> 
> On Thu, 04 Jun 2026 20:00:17 -0500, Alex Elder wrote:
>> From: Daniel Thompson <daniel@riscstar.com>
>>
>> Add devicetree bindings for the Toshiba TC956x family of Ethernet-AVB/TSN
>> bridges.
>>
>> The TC9564 contains a PCIe switch with one upstream and three downstream
>> PCIe ports.  The third PCIe downstream port has an attached embedded PCIe
>> endpoint, and that endpoint implements two PCIe functions.  Each internal
>> PCIe function has a Synopsys XGMAC Ethernet interface capable of 10 Gbps
>> operation.
>>
>> The TC9564 also implements an embedded GPIO controller, which exposes
>> 10 lines externally.  Some platforms use these GPIO lines, so this
>> GPIO controller is managed by a separate driver.  Other embedded
>> peripherals (like a microcontroller, SRAM, and UART) are currently
>> unused.
>>
>> The GPIO controller is managed by registers accessed via MMIO on an
>> internal PCIe function's registers.
>>
>> Signed-off-by: Daniel Thompson <daniel@riscstar.com>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../bindings/net/toshiba,tc9564-dwmac.yaml    | 120 ++++++++++++++++++
>>   MAINTAINERS                                   |   6 +
>>   2 files changed, 126 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml
>>
> 
> My bot found errors running 'make dt_binding_check' on your patch:

Thank you for this report.  After upgrading the "dtschema" package I
also see these errors.  The "gpio" and "ethernet" properties will
have an "unevaluatedProperties: false" constraint added in the next
version of this series.  The name of the binding file will also be
correct in the MAINTAINERS file.

					-Alex

> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml: gpio: Missing additionalProperties/unevaluatedProperties constraint
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/toshiba,tc9564-dwmac.yaml: ethernet: Missing additionalProperties/unevaluatedProperties constraint
> 
> doc reference errors (make refcheckdocs):
> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> MAINTAINERS: Documentation/devicetree/bindings/net/toshiba,tc956x-dwmac.yaml
> 
> See https://patchwork.kernel.org/project/devicetree/patch/20260605010022.968612-11-elder@riscstar.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 


