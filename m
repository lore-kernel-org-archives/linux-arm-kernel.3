Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75693CD6E79
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 08:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N1J30wpRr/zoxFVY10vvN98wpm4s2FZR/qZwrLhfn4I=; b=q1wOiarO95p+NdTfOIdE3Oamk+
	2ZcRcSKVSIeKQJNCw8O70yVHQZytM+/AeVFWVrWdaCSACk680zXZJ0ChZ0WdGMOS5sS0/fXFBIXQ2
	oAuZyRGFuv7nT7jOmKYDaCwpkpWyalrDfqKj3IMSSBwqlshR1O+kifGo8GH803+KVdcwWvbjbzw0D
	5gp+QQURyjR28QezgNHwZGpAPNMyU4IrLKw8GL6vADdjSKvjETrrXpM0zZtllbNTaTIlT3fiogmKE
	PtjJ2tY/O3umS8YL3PTR1rN8HMkaZ7om1vth1A0OmCYyOdA4M/bOr1fXCamtYHGRY9O0R0fCNlyjm
	ixJ309EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsD0-000000056vw-3rhd;
	Tue, 09 Jun 2026 08:53:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWsCz-000000056vQ-32tK
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 09 Jun 2026 08:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=N1J30wpRr/zoxFVY10vvN98wpm4s2FZR/qZwrLhfn4I=; b=p9Y1ILBHCMPHBQA0nINDalI4e0
	VhEwhMAB/s+bsBYmQwH4U8rcRShZeqHXgIu4S8vdrhkMM9KVxNrQoOchk18dEeyDezxSqcFfX/sT+
	W6az9CuuzzzLcI5gsxMAKxQjSV7EjxsSY4JIuVZSCJW9GflsvUFd9/X+CryPyKq9WwnYrwQZ1rUR8
	035oshxoFMfVVdqqg2FwZYfTSkFPJ99H6YNZevGW9PFbT1TJBJt+lnWZjySjYGUyaqS3ZCFfKLF/y
	O9slZMe4fWbJ/K2N6lvN66TLaXp6liJA8LuS+Iq/M/Qfnk+30gUVmSmUUta0uYydwzLo3VcIMU9wZ
	kbTQlANg==;
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWsCw-00000002Ch9-2WHC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 08:53:16 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-6877c719cb0so6690878a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 01:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780995192; x=1781599992; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N1J30wpRr/zoxFVY10vvN98wpm4s2FZR/qZwrLhfn4I=;
        b=C0EQuy1eQSzOl0a7sOXDQ93l76DHk7Bh4hmjFMvPWEAZ21fbAEUajg4arV6cQYDmOS
         STfmF8RhyMpFGT+1fIp/qnDdwJkhEu88XRpjdDjjcVuYff6qq+rkP6ijHw7puA/vMeso
         ZGjyXW809oGQK0ZJ4tCCHGKHWvDY1lRRyyLprXbICG318pkYP5DHm+wl2b6Up16Mzt4g
         uzOF0WP9j3hbYwZGr2HCWDyLoq3JftASzhS55GyDRQVotihto+c49YznvJzpkP1zDRs0
         pEpsKSkQQaYiuwbdXo8G/VMjMot29qeEX70ECp9xim1ucBXBIDLaVEWCrvkf7AQy9E5L
         D1Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995192; x=1781599992;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N1J30wpRr/zoxFVY10vvN98wpm4s2FZR/qZwrLhfn4I=;
        b=cgYESm3ZmaXlh/1u/zbtNGSIZ4DbG8FOg7fBWOzckvfsptgz77u1K0j4o7eWFb86Yj
         MCaSQTy0EN2FR2in5Rj3xYV3rQ37sPNdT334Wl7IP/LEU2hP/DEYDqEbALuXt8U7wEho
         C3nUC4MXGQfBwWea9axJkhTjMZJFDg5C+RnQURxTMjIFcFCf/m5DYf43S7m7N721BzKz
         GZI97Eui2MSPqJ5HsKnelOf76Mvsgthh3r2O8bTcyhP7ca40lol1n+MFfwFyM1OJNqUS
         6NSf71Q6H8S9pkfhPNlFQO5BkrR/wjiBpSXSSKEeFnI7m4T4hdKnFOfQurJs6Sjs69pd
         RnDA==
X-Forwarded-Encrypted: i=1; AFNElJ+kD2TMz6du3gRYgdIZ9QMyFToEbD892n+SVn6s7kxd0kVcKAirv6bBxSHTERIUPxJC4MjvRdcRWQSMzFVWWtv4@lists.infradead.org
X-Gm-Message-State: AOJu0YzdOg23Es7459rjL9bj0v5UVaoIBBdyblTvy31Ynjct0y52m1BN
	NL1kEa6TjYdbP/4sWmwaMNdAZ7UUjEDI+HQc+FBbpM71tS09kFXoJL/fYZQQI25Qpj8=
X-Gm-Gg: Acq92OEs+D3PKfzbBCLnXVrdatqu77IMbohgbXMfyFS4jTTMVazyZrbAk4jywZJCRYF
	jjzRmP6SqN087sXl3gKEW4Zd0Q/bV907IxaASpyXbIanKzA3BMrfqCJkhEnBL4YlDDCdOYDVtc4
	QoXVchYYBCCqPKEMP/+AjUCLa/x778yJiB4jvjsA8dLarsHLbDPfSCEc2aDH0w372U7uazSvAq7
	0xP1EEMIpY/TBIl2f/RNw8Gt29+xmDyDkIT/GMTGOI1TUUc5p0KYlUhe12VkB5475y/plFqMYv+
	IB3G3GVO5LGHuM+YdcT2+3EsD3Xss5zecfnjJalKmyosU0zw9byBUlUTuyGw+KCv6uybkvLPu0P
	5mF1COaIgdVopGDO++83UTok9wSb8MbP0wA9F8ZtUDW92Lt7HS86W7F5f1RJlirToMdwotmhoVe
	sqRydO8g7CnECxAsJsiBojnRTxPqBTlx/POUf5wspgP45U
X-Received: by 2002:a05:6402:4506:b0:68a:88cd:eb22 with SMTP id 4fb4d7f45d1cf-68fa535d734mr8754916a12.26.1780995192260;
        Tue, 09 Jun 2026 01:53:12 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.72.26])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e6595c722sm8240110a12.22.2026.06.09.01.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 01:53:11 -0700 (PDT)
Message-ID: <11db2b96-975d-40df-b902-c1772f83a1fd@linaro.org>
Date: Tue, 9 Jun 2026 09:53:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/7] dt-bindings: media: qcom: Add Shikra CAMSS
 compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Suresh Vankadara <quic_svankada@quicinc.com>,
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20260608-shikra-camss-review-v2-0-ca1936bf1219@oss.qualcomm.com>
 <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260608-shikra-camss-review-v2-1-ca1936bf1219@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_095314_816272_BD9AF8AB 
X-CRM114-Status: GOOD (  13.66  )
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

On 08/06/2026 15:06, Nihal Kumar Gupta wrote:
> Shikra contains the same Camera Subsystem IP as QCM2290. Document the
> platform-specific compatible string, using qcom,qcm2290-camss as
> fallback.
> 
> Unlike QCM2290, Shikra omits the CDM and OPE blocks, requiring only a
> single IOMMU context bank instead of four.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/media/qcom,qcm2290-camss.yaml    | 16 +++++++++++++---
>   1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> index 391d0f6f67ef5fdfea31dd3683477561516b1556..4f39eefb4898ebc22117407f26cfb4f41deb111b 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss.yaml
> @@ -14,8 +14,11 @@ description:
>   
>   properties:
>     compatible:
> -    const: qcom,qcm2290-camss
> -
> +    oneOf:
> +      - items:
> +          - const: qcom,shikra-camss
> +          - const: qcom,qcm2290-camss
> +      - const: qcom,qcm2290-camss
>     reg:
>       maxItems: 9
>   
> @@ -76,7 +79,14 @@ properties:
>         - const: sf_mnoc
>   
>     iommus:
> -    maxItems: 4
> +    oneOf:
> +      - items:
> +          - description: S1 HLOS VFE non-protected (VFE only)
> +      - items:
> +          - description: S1 HLOS VFE non-protected
> +          - description: S1 HLOS CDM non-protected
> +          - description: S1 HLOS OPE read non-protected
> +          - description: S1 HLOS OPE write non-protected
>   
>     power-domains:
>       items:
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

