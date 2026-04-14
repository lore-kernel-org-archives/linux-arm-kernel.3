Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2A3ED7B8D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 09:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBYUs6vtopkXApMTy5KoL+CYxoYocSKqj1Le8Qpg1Dk=; b=moXyL4ajWVh2xo4f7WNvTv2CNR
	CkzJvZMjCC7G5pEyY3R5HATtXrcZ7GEvZs6bKMfKh+sVP1U5QNx3R+P+p7Qkb5kZPQW9ylLTlspDH
	DdlxGXFOWNV+0H+ov5Dc72i+vYEMtizKI7+Tc2P0DZ2pU18lpTuAxr+wY8cQfMEiMxa/AoLN9ZXdC
	YyQvfFSO4BqrRp7UwA4KvvKiLqoKn60P77ewH0gWrcvSDngf7wOB62QBZ/o7WTS9jGWf17M333oBr
	GZkca94vG9A9pPOA5Ej2ld2PpkVyrPMoPENyaH6v00QtN3k0BHaM2F6UGktDfIX12lpXJkJh/ZRTs
	mzyNZMMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZdX-0000000H1e4-40je;
	Tue, 14 Apr 2026 09:00:48 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCZdV-0000000H1dW-34up
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 09:00:47 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-b93698bb57aso960361366b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Apr 2026 02:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776157244; x=1776762044; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JBYUs6vtopkXApMTy5KoL+CYxoYocSKqj1Le8Qpg1Dk=;
        b=xRhbj2wdtMleJfKXUwn61hAMn2vDQBzF0vo4HY/wRevGjA55xFmp5qxhxf92LVwiz0
         tC8LPtunA3HIp3FgCvOQ6IJYRLsXl5apHDEY8Rngu3m8WwddnuGj5WP0oAwuCm3N6mrV
         PG/pCLs7Yt0agn24eIqb4rlPSEGrjLdz53VWMoaoufLm//vjByzPsQoFwk5j2CB1egwP
         uT2WVS6UnRuTwtHF42hz/UfULWO8LU9o9CWLi8EEV21ghTgC8Q5QTTzanp7wVvDyz4Xp
         t4azsVlv3Qkvx1SI8xoEW+78w+CO8l7PP+ZTpFUT+L6KgqxZeQ/1foD5CDVT5ZpdDyE8
         zkkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776157244; x=1776762044;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JBYUs6vtopkXApMTy5KoL+CYxoYocSKqj1Le8Qpg1Dk=;
        b=ODllRCm8d/TEjrr6tuqYtfFWx9yQcECzER5Ei4OhwDo4A10F/p/aCHu/MJRCG9eqaK
         MvAkiij1CCW8L0FxxLl2eH0N/HeRj1yFebe+Shi5s2EKhaX5t0askGVHqgprQuKqhz01
         K/DCKLGyQDzGJKlwTSn1eynynD+WVBfmWvsoJm1cnhVOcBnwQxIGnHVw1l5Cs06waWd9
         +/T6uKxUpq8O2WvKhen32ftTUR/JCjbAM4ql8tAE0JfrZ7KQW4eGiMybw/knI2feU8/x
         Unl+RnFgid+6sA3eHaJRLe1BibTNCI7VXexNSiuEEohYs7cmG8Klx7pdtBYvf8IFKJMv
         6wfA==
X-Forwarded-Encrypted: i=1; AFNElJ/FYAqS/fGKv2o68la2mCp0KM7eZ3qmhXCETm586GCo8p9yUb/XhFXhim42wdemNmYtSj6EaBHw0kGDa88vLv3C@lists.infradead.org
X-Gm-Message-State: AOJu0YzmBlyFV11wZ8F7KY7vxDX/6O23hLmaCfC9f7FdCSXnfoSFbu41
	PtaJrV20JAJjqAEapDTfjJWsypyAfal4yxZYkTSeKM3seXs9ish1i132lixsNyt8lo0=
X-Gm-Gg: AeBDieu4WmNp/lenovSXp7Q1U+GYPTMI2etaX5GGy6MtQ72B2p5ljFiBUUpKhvufE8o
	Nt8LXA9ByzK9mVRDloXwE4fIAIHbzaduCPe0WbORIgVto56GxAWf/Sj/71Ipn73vmEKaMAVsfFY
	arDm2ghLS0OXVemmokO4KjU9eFHEmHx1DDHzzCx4L9Jd68NrsaUXCncY9uh/RqL8iAIwj+uw6K3
	sYL/HAfxT87BEReCMg0kJ4qkdClv2l4LkeS1LKf02Yq3joK+DfyJFtJPVn9SN9rm+j30QyBIgK1
	q7UIdjayfQ9QGFSZ/oW+7bxxbAoPxebOGFjD+HdZnuNmJ0xfMFfrxIDKXZcOiF03E/6aypV57cw
	o5skRNP5MWYuJC7ms6tZS6GzE53smWMx6BOyeiiCieFiW6xbiwQrJdwYhR7eXqb762WfQLtZD18
	t3pbX64Qk5vnT5jWrOf0Og2t28fhJOMMLIP8sMjB8RNfOkXSVDgF7G9Qy/qD3WFbiZ6O4Hb9jwL
	m3+8+B8vRsLVWBrX28Js/GZOetx
X-Received: by 2002:a17:906:6a15:b0:b9b:e7b3:a25a with SMTP id a640c23a62f3a-b9d76d2f86fmr806127766b.12.1776157242962;
        Tue, 14 Apr 2026 02:00:42 -0700 (PDT)
Received: from localhost ([212.187.182.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de97e43sm396148266b.13.2026.04.14.02.00.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 02:00:42 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 14 Apr 2026 10:00:41 +0100
Message-Id: <DHSR70EGYY4N.2EA2HWIXJR7QR@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Alexey Klimov"
 <alexey.klimov@linaro.org>, "Sam Protsenko" <semen.protsenko@linaro.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
Cc: <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: exynos850: Add SRAM node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260413-exynos850_sram-v1-1-7fda5b7fb7d4@linaro.org>
 <2ff077e1-8983-4a41-bb21-5e4140545aa3@kernel.org>
In-Reply-To: <2ff077e1-8983-4a41-bb21-5e4140545aa3@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_020045_804878_39CB915F 
X-CRM114-Status: GOOD (  13.08  )
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

On Mon Apr 13, 2026 at 4:23 PM BST, Krzysztof Kozlowski wrote:
> On 13/04/2026 16:52, Alexey Klimov wrote:
>> SRAM is used by the ACPM protocol to retrieve the ACPM channels
>> information and configuration data. Add the SRAM node.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot=
/dts/exynos/exynos850.dtsi
>> index cb55015c8dce..cf4a6168846c 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -910,6 +910,14 @@ spi_2: spi@11d20000 {
>>  			};
>>  		};
>>  	};
>> +
>> +	apm_sram: sram@2039000 {
>> +		compatible =3D "mmio-sram";
>> +		reg =3D <0x0 0x2039000 0x40000>;
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <1>;
>> +		ranges =3D <0x0 0x0 0x2039000 0x40000>;
>
> You miss here children.

Thank you! I guess I should convert it to smth like this:

apm_sram: sram@2039000 {
		compatible =3D "mmio-sram";
		reg =3D <0x0 0x2039000 0x40000>;
		ranges =3D <0x0 0x0 0x2039000 0x40000>;
		#address-cells =3D <1>;
		#size-cells =3D <1>;

		acpm_sram_region: sram-section@0 {
			reg =3D <0x0 0x40000>;
		};
	};

And then later reference shmem =3D &acpm_sram_region from acpm node.

> Also, 'ranges' should be after 'reg'.

Thanks, will fix this.

FWIW this commit is a copy of commit 48e7821b26904
https://lore.kernel.org/r/20250207-gs101-acpm-dt-v4-1-230ba8663a2d@linaro.o=
rg

Best regards,
Alexey


