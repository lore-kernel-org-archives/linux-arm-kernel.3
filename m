Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21938EB3647
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 00:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DbRpP4pGqX3L3KGnHSAdJ16AaJ96EbWxB7jPQsFqMQ=; b=Ye2UUqM2SDGFGEWJOQnVP2Eyg4
	FicSi0ic7MTGhFDLH2o/8sTrdbR3dSekBY724h9G1DmY7hho0PpBiJ/f7uQv8iuNl6EKu5odaGwGZ
	o5VcN6QnflK1phUgO/jNa5JG+BqxRmxpSR5jZs/Zlrb1V0ZLUmto4q38XwPjLWI1UZX5W/9OCiMv1
	TyPIRTYJzcb70s+34gRobRjDwXeAlRiPTWxLSHGgWnjjW8EqJhwPW8XAd2AW+pUdorf9b2y2yIF0r
	LMWZKcOVGTsQ5VdvLlyXxb8AM3t0vgF+7ntD2VIqDGrp90fuML2tkbVA4d8NyL+m+xlpqRW7x3Ar3
	2E5aej6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxE4k-0000000EIGW-2NSU;
	Tue, 03 Mar 2026 00:57:26 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxE4h-0000000EIG4-2nrG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 00:57:25 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ad617d5b80so32293365ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Mar 2026 16:57:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772499442; x=1773104242; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+DbRpP4pGqX3L3KGnHSAdJ16AaJ96EbWxB7jPQsFqMQ=;
        b=YZss9gBUBoCVIcg/So3IWaktOmY7EjsEDVeOfGqcaKQFZefyPiKfZVMdhCS6jelxFC
         jpnbyAQ9HSPXiw9qExeh5z+6GcB0HcMtDn4Nn4u8gqDqJ2LJVAjVRsuM4/QpTWecMgxz
         ZvGYOeeZS/qD0bRMUHccRGvnuhrTNGwxmfn9DUwk9t6WKMEMvjaDlNJZdMIw9lvOVDbN
         7nZRfGK+/4JCWg9I2mZCDyXbUzfeYNEHXohygl6eGuYwFG5OHaMzVsrjkcVkceUoFDJs
         C87H2fhCmsS6jTKBWBCyaQRd6oi4f4Ftoo9uRWtEISlCitjEY4HhEB3k4VzUtjI+xSbO
         wZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772499442; x=1773104242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+DbRpP4pGqX3L3KGnHSAdJ16AaJ96EbWxB7jPQsFqMQ=;
        b=fWj0zvZYTZZ36FVr3TyDAcDfJuuutq4484NMoqTMnoyL0bGWSvWeTbGBw7kQutcZJK
         iycAj7AOa7eMpe0Tir+VQ/VeM+rFXxC0eFRHXMcLyP+Xen7HnMZXOPbY1j3D1dn80e8a
         hVFuaYBe1I1BmRtOQYuF6+TKfUYbsaN47nYOZ1xSKb3eDcduKAzzb7vOFicGIA1XKrEI
         +KOjJN+r1ZntXPzHz/+hqHTxnIRsVotXqbEjLiTBuhc1Ln6hBw0W8my+ekX8EXQU4OAN
         Ao7wxmrj+fJep5zBf/woH+HzrHm26bK5EUprEeSGnENjpM9loulUdOW+ZXxbk+MD2h07
         at0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVwPIR+4Ie4VBPwV3E0BRJRQqsKhJDU++di3e3U8ayar4NhY1GN9RJi179vr6nADTzA5F9S6noiIjnrEoQV4Vll@lists.infradead.org
X-Gm-Message-State: AOJu0YwtH8SePFe0+sLB6hQK6mByNPyaU4jZQUePI1yV3j9/lq5h8jWD
	FAl5opPCiXTbUwYOKTtE/V9aJUXNeeXp6vAP0s1x+v2d6lgdxupFmePc
X-Gm-Gg: ATEYQzyraXwe2imKKd3v+F0havaf3IBRabsuXs/sob9OyWIVU1N87tAame86BeXU4p5
	q2toG+ymME3Kdlub5tHHBLF5Q/a6qYRWKtw+P+5VJeM54yjVTqhCINvCzrjQ6pwuFAz5mS6kZE0
	4ID0E1U7g2nS9ffHlkVXoJPcfNZ0uXeqYWpWh6cwAJEb1jGzJD/qngt0RtN/ITVAyTppIJT/tnw
	RAijijQZ4nqSHvOkfF65PZ4uoy9iLdQRJhr+1wg7B7idKaBlRqbbHKP0uS28+MPHi89SZ6Kh6g0
	Op/0ES1cwClSwGy6yC+1BDFRRnkSvWgCr+ugS79UPABln8PzlMsUIPNkH7wXJisUpKDd0fka+Jc
	8NcUpegKa9B8sXI6ajRVywcJ9UVSkwNkZCc/+HT+v38P6e3Gs6fvGYe131cmfVPuCuFJ6XyuPie
	w0noE8qRGpa4iTpUNPCBdgAxi2QnuhYEtBeDVr2hwYQ30LFuFVdkl2uZ6bLWz/S9iJj+/T96c=
X-Received: by 2002:a17:902:d484:b0:29e:c2de:4ad with SMTP id d9443c01a7336-2ae2e42233dmr126907975ad.24.1772499442458;
        Mon, 02 Mar 2026 16:57:22 -0800 (PST)
Received: from [172.19.1.48] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b22fesm207547505ad.2.2026.03.02.16.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 16:57:22 -0800 (PST)
Message-ID: <1a6cbd56-2e07-42e0-b7e7-959fa2bf6315@gmail.com>
Date: Tue, 3 Mar 2026 08:57:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: andi.shyti@kernel.org, ychuang3@nuvoton.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260302020822.13936-1-zychennvt@gmail.com>
 <20260302020822.13936-2-zychennvt@gmail.com>
 <20260302-agile-mighty-cassowary-ed972e@quoll>
Content-Language: en-US
From: zychen <zychennvt@gmail.com>
In-Reply-To: <20260302-agile-mighty-cassowary-ed972e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_165723_711564_F2217390 
X-CRM114-Status: GOOD (  18.17  )
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



Krzysztof Kozlowski 於 2026/3/2 下午 03:20 寫道:
> On Mon, Mar 02, 2026 at 02:08:20AM +0000, Zi-Yu Chen wrote:
>> Add device tree binding documentation for the I2C controller
>> found in the Nuvoton MA35D1 SoC.
>>
>> Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
>> ---
>>  .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      | 65 +++++++++++++++++++
>>  1 file changed, 65 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
>> new file mode 100644
>> index 000000000000..fa8b01e2c5b1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
>> @@ -0,0 +1,65 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/i2c/nuvoton,ma35d1-i2c.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Nuvoton MA35D1 I2C Controller
>> +
>> +maintainers:
>> +  - Zi-Yu Chen <zychennvt@gmail.com>
>> +
>> +description: |
> 
> Do not need '|' unless you need to preserve formatting.
will fix in v2.
> 
>> +  The Nuvoton MA35D1 I2C controller supports master mode and optional
>> +  slave mode operation. The controller is configured via Device Tree
> 
> Use modern naming, not master/slave.
> 
>> +  and supports interrupt-driven I2C transfers.
> 
> Drop "The controller is configured via Device Tree", because it is
> completely irrelevant. Why telling in DT binding that you use DT? Can
> you use ACPI here?
> 
> And with dropping this it could be one simple sentence.
> 
Acknowledged. I plan to simplify the description in v2 as follows:

'The Nuvoton MA35D1 I2C controller supports controller and optional target mode.'
> With these changes:
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Best regards,
> Krzysztof
> 
Thanks!

