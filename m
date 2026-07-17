Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28868C44512
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 00:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UxLGBdpnrkDciajFDWMSeC+2EXjtdsW4rIt9aI9uoSw=; b=yea1ZNcH3nBNR61YoU3DtuJrYP
	Jugehub9AzLvTDbUHnfYHzx1DLe6E78rfXg1o26JEPunfbPfi/H+9DVyuMNNTqM/w+XLVm9NJRFGo
	Ai/+MZMXpda+G1P49/Zki9sccQNHLeQoPzmCldpH9L/tji5/P/Jv9e4NmpH2tdUT6VIoNFEFLx7z4
	PCXsErLoNwBqYjUtCE+YGr9vgBl9SPXrQh7hTXF9eRZVPI1ndEJmxFEU9BBBUSjzi6RfQ9/vl3v3P
	z8ua8ARcnmf7gMOUpUdMDSLpSsxmlOh5V4UrlTrF02xYvG7V7O7QrYAQ5yrHAMjowsjLYuVRVxc1E
	Tekot5YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWf8-00000000qta-04U1;
	Fri, 17 Jul 2026 00:42:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkWf5-00000000qtD-1jKE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 00:42:44 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GNITM34178647
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 00:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UxLGBdpnrkDciajFDWMSeC+2EXjtdsW4rIt9aI9uoSw=; b=FvjrwzUg7HydXT5X
	1J8taClGEMIWh+r5KEZz/IBpSeJqAzsXeKbsnM8r7oKK9+ww8xwAK6KVv23buqET
	P/JvYbuOA7rb4vGbEztsmsuCj/G2K5Q86avt6uJ+uW2jtMrQ5ZmwROwnldW4jdEB
	9v97UNNCT8tcHiSoZSh+bqHQufjIdrmsU8uT2P8nsrPwb0L7JOsT9ZudfBl1LgV3
	v2wOqHT3vYb0kWmj5VGaWK1AaQe6zc/IB6Hi3i9Z3Z4Qa6zTkY7nNavQ0uHsf2Y6
	tiq/WmUngXQed0uMlQAAFRzRmq1tLfJAzfYhPkg/p6KiR9El2a1WuLEgHO6Ro62A
	YW45vw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2su11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 00:42:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c891ed872ddso12636833a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 16 Jul 2026 17:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784248961; x=1784853761; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=UxLGBdpnrkDciajFDWMSeC+2EXjtdsW4rIt9aI9uoSw=;
        b=gWd8OssraU/8vcypzA1aH+KG80YpDAZ+hFge10N1pbEWky62RT2Z4gGRAPzfCLeb2i
         J+fmjMEr9NMRZ0K8d1UHaregdsynaX9ZvDPGTxX0FDtUTv+SZwbmvPtfCC9ldMsMyb84
         wN58AQK+ZjKOpXLY7V2BlsvprZ0VA7fhG58xgcgci7fv8EwvJFaYI57zGRYDHySSBfd5
         6IGeRI4mMrjfl7EoaLj4UJxB3DbRuQ+zFwzkkAzAveQdiVXY7tSAxfUtXOqpX3wuSMcn
         MazrZNlOLz4iuZFkwsW426XaJKJh6MrTy9OH81b0H7a/uXAs87eRPcZiRVqKn9aUoNIb
         Jw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784248961; x=1784853761;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UxLGBdpnrkDciajFDWMSeC+2EXjtdsW4rIt9aI9uoSw=;
        b=b9fvnUTlv9O6M0jxNx5HaXvXuRVBqu5EH6ebT3WNtC58caeuMkW7AKPkTCyIWIi8+t
         wJIKZfb2K6eGkxt300RlXKeVKLXpywHXMPcclWx9YLjL7mzdqdrUg+kMxFcAfy8y5q37
         5Dy+Lu+7o8Nt6jw7olzOM42n/L1NzAEzcd4m3PjsJFKOrp2SzRLTtQEvo6QC9mTQtLuz
         /aiavoWDyxraDrRy26l85x+OE6CrUqrrsgKE8SOl7hp/KEQYUkWzWeDJuUpO6xoYxpkf
         zAwt+yNKZH2F2+YuvRzzm9BqjsiKRwEWSD8b1XrlDVuj5mVD66bPgQ4IAfrsHXbT1dU+
         Xx9A==
X-Forwarded-Encrypted: i=1; AHgh+RorveBwmMcK3Zx6DKhDd2oDYRgzYSe+5uFdtL80P54TspCfe16Dz5Erd+RE6b5nAu9six4135hsAu/V0MBCcJXq@lists.infradead.org
X-Gm-Message-State: AOJu0YzD32kv4efYq9TYEeRDbynM3uVw/pMpd7pnlJj9kIm56CIgmlK9
	R1u2Py/L4OSPvZL1wWKbtkDfmmthpYNC1X384u/IIHhbn1gmemBKWLIw5CA+MNNaA30m49ps+Zy
	m9MwcQHYIwdzcivi18KpusvedTs93iIG+5PiaH07dDydbNrELmPgZdaR4QkQ9iaCDIwHIP5xBIH
	FXrw==
X-Gm-Gg: AfdE7ckYVHyAeh/Y40n8TCxcWmRsyVg+FNlp5gM44fxDflhuvGRR2qwd3vcqRlZ9MPB
	D6HlmYedtaG4wwGRZqP5xScJzQNz9vpaa4IsmQD/QaC3MsAJ0jamJlu+6XNsPg6FF7bsOrck95Q
	+LDTP10xgOAFjuZPOqFFRvcVnvGy3fF7auI3yTePhMsimCJcmQ8yAbmwfj/Yvq2nQPgKdeo3d69
	H/Qcgk0AqfUqxxJqLiz9HqcRCyhc4f1M9+cvgET3pl85sOOmiY5zZmAzNMvo1udF4sRRhXyhmnX
	/OonA8SBDdsm3tpEaShvh4Dptc5X6rMnzxIjLAcG0miwzdWY53NKSObL5NH+EWjMyX4XLtnwCsr
	V3cj4mXQF9TLFL4TC0B041UcE3A==
X-Received: by 2002:a05:6a21:6b83:b0:3c3:8222:b8c9 with SMTP id adf61e73a8af0-3c3ada39a49mr273662637.67.1784248961172;
        Thu, 16 Jul 2026 17:42:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b83:b0:3c3:8222:b8c9 with SMTP id adf61e73a8af0-3c3ada39a49mr273634637.67.1784248960701;
        Thu, 16 Jul 2026 17:42:40 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd432f1cesm22812830c88.11.2026.07.16.17.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 17:42:40 -0700 (PDT)
Date: Thu, 16 Jul 2026 17:42:37 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Chi-Wen Weng <cwweng.linux@gmail.com>
Cc: jic23@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        cwweng@nuvoton.com
Subject: Re: [PATCH v2 1/2] dt-bindings: iio: adc: Add Nuvoton MA35D1 EADC
Message-ID: <20260716174237.00004b79@oss.qualcomm.com>
In-Reply-To: <20260713081127.115197-2-cwweng.linux@gmail.com>
References: <20260713081127.115197-1-cwweng.linux@gmail.com>
	<20260713081127.115197-2-cwweng.linux@gmail.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6SoZ_joVliQCrt1o03ivkMwVQ-c0NwTF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAwMyBTYWx0ZWRfX7ZLjh2/zkhvr
 wjGuJvQ6V0uSUyuylmkjGSCHP5XGG3x//pdlTHj/YB4zSF3BFkmgw7ZXaxTR+R/DlK/SzVXIICP
 bEQU8I1Nm+2AbMbRCyyaMaSmsptj4sk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAwMyBTYWx0ZWRfX+Z3THqmLgSC/
 eIrKtaUcGvmOcnivF0qTY8I/wn1qY/fhpMeY9Dpejn1JJmCrXh2tu3pvFK5f2yVb8ze1ectkxqb
 qNYKx+YfJp0pWvoHfnmjAI9xOv4WrBZ/6YslX/CU1sv6Y5Ts/TdxcTyo1U7CZKw++XL80KXSMTU
 Jr/5brZrnfKnO7u/e7DfuszaLpAlXperESPel9j2IXuLSAoAo+HXlW7ZVHqEOhvF/GTx++00fGF
 W0pJUS1sjmNzHxOmqoa89HY2rP8n3dbSGhvL4u+OCP99PbaEtG25ZjM8BjCwsdbykic9CJHTM2R
 Of87nu3XQnYzNp4jedF50t9e3UvnfyGQVcTtPT289HQKdKKGtT5B498n+AsDrUU4uWdUa2Gtg1f
 TKT6xvMiXpceMyvWTMiHPQIuMBFxQkgDrI28tMOQ0rwBNI9163YbPRI1rKGCyfuPdgyPeSRWYKP
 IEUIR26vfLk87EsUhog==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a597a82 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=BxgfbMJPAAAA:8 a=O1BfqjI78t3fJ8cDaMMA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=-j4ASRGczZqhCHD74e4j:22
X-Proofpoint-GUID: 6SoZ_joVliQCrt1o03ivkMwVQ-c0NwTF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_08,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_174243_589312_DC118032 
X-CRM114-Status: GOOD (  22.82  )
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

On Mon, 13 Jul 2026 16:11:26 +0800
Chi-Wen Weng <cwweng.linux@gmail.com> wrote:

> From: Chi-Wen Weng <cwweng@nuvoton.com>
> 
> Add devicetree binding for the Enhanced ADC controller found on
> Nuvoton MA35D1 SoCs.
> 
> The controller has one register region, up to four end-of-conversion
> interrupts, one functional clock, and an optional reset line. The
> binding also describes the optional external reference supply and the
> optional DMA request supported by the hardware.
> 
> ADC input pins are described using standard channel child nodes. The
> external ADC input channels are 0 to 7. Differential inputs are described
> with diff-channels and are limited to the fixed hardware pairs.
> 
> Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>

Hi, A few comments below,

> ---
>  .../bindings/iio/adc/nuvoton,ma35d1-eadc.yaml | 163 ++++++++++++++++++
>  1 file changed, 163 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
> new file mode 100644
> index 000000000000..1be5470643d1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/nuvoton,ma35d1-eadc.yaml
...

> +  interrupts:
> +    minItems: 1
> +    maxItems: 4
> +    items:
> +      - description: ADINT0 end-of-conversion interrupt
> +      - description: ADINT1 end-of-conversion interrupt
> +      - description: ADINT2 end-of-conversion interrupt
> +      - description: ADINT3 end-of-conversion interrupt
Not sure this doc helps. What are these interrupts for?
The driver only uses one of them so why are there 4?

May well need interrupt-names to allow gaps in the list to
work but hard to tell without more information.


> +
> +patternProperties:
> +  '^channel@[0-7]$':
> +    type: object
> +    $ref: adc.yaml
> +    unevaluatedProperties: false
> +
> +    properties:
> +      reg:
> +        maximum: 7
> +
> +      diff-channels: true
Do you need that explicitly. I think adc.yaml already brings that in.

> +
> +    allOf:
> +      - if:
> +          properties:
> +            reg:
> +              const: 0
> +        then:
> +          properties:
> +            diff-channels:
> +              items:
> +                - const: 0
> +                - const: 4
> +      - if:
> +          properties:
> +            reg:
> +              const: 1
> +        then:
> +          properties:
> +            diff-channels:
> +              items:
> +                - const: 1
> +                - const: 5
> +      - if:
> +          properties:
> +            reg:
> +              const: 2
> +        then:
> +          properties:
> +            diff-channels:
> +              items:
> +                - const: 2
> +                - const: 6
> +      - if:
> +          properties:
> +            reg:
> +              const: 3
> +        then:
> +          properties:
> +            diff-channels:

For these take a look at the description of diff-channels.
It states that where the pairs are hard wired you can just use reg
and not specify diff-channels.  Seems to apply here and will greatly
simplify this binding.

> +              items:
> +                - const: 3
> +                - const: 7
> +      - if:
> +          properties:
> +            reg:
> +              enum: [4, 5, 6, 7]

What are these channels?  There is a reference to one
internally wired one so what are the other 3?


> +        then:
> +          not:
> +            required:
> +              - diff-channels
> +
> +    required:
> +      - reg

