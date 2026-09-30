Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA77CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 11:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aVzuXE/DlhAkuriCQToRPrh16XzvOjKZo5qCvzwYsCc=; b=kadoZQi3NH1dCh22heEFVJ2JI2
	VdBwA7Is4ApgfAJwfKnHTmjNehu3giyy9CP88xXNaqIdxXkQuoCq9rvdP5kYQfuwZkuSmJfeVLQ8q
	W9MYxe/hgcj/R0Mft7lADrg264UOK1bwQopW0Cl6pK+f52xDxNMuNfKWZYcS3SIJIymISxLuSgRL0
	gbSQYYtgYYfo6TUpaezXF8aiNOARY8V0bsnpIoUcBi7k8EtSpIImFlw69WEmFJQHr4ymrfetvBvEL
	0rWIRgt04mVpBQhA8ZANRytC8cLzeg5YhE/qNJweg01LGCLztU/Y9BqGd9AezubyUIpK9BCV17Dz/
	V+/txoxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBstn-00000005wD5-2oJv;
	Wed, 30 Sep 2026 11:54:59 +0000
Received: from mail-ej2-x0d.google.com ([2a00:1450:4864:34::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBstk-00000005wCP-2vOr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 11:54:58 +0000
Received: by mail-ej2-x0d.google.com with SMTP id a640c23a62f3a-c2dd363f57aso416407466b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 04:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790769295; x=1791374095; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aVzuXE/DlhAkuriCQToRPrh16XzvOjKZo5qCvzwYsCc=;
        b=i0Aw9lxlxu23d+0MxAFFAFSAqEgsiAiHIRUTHrSfxVdYFGFZfWMmKlXcwwqxNFQI8d
         02adYWJCLifD8HFzhSGMvc55xSS0I5jKB3mHefL2B7v+y18bc9g8VMAS9gKkEehNTBTl
         CI8EzX1dc+XNom66s9IeXrmUSy1LVGY7uxe8g16OcpvIM7bVcAK376FNBjnKQ8HWALM9
         lzR6dYsXvNmiM5DFuVgnp2ai6sB71IPqjZgEfX2+6hwm3V+3om/pRbGgP+KKfNTulZEl
         5hDQs9mB2AizFq2tAfIfkHNzxXvonSfdZqfS4Ug16FXCkCqGDqh0KcVBK5P2lRmoJZvF
         OZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769295; x=1791374095;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVzuXE/DlhAkuriCQToRPrh16XzvOjKZo5qCvzwYsCc=;
        b=dq2KnUHiADVFv5bLPiO9tjy89JQso5JYQAvfSFkNg9BfTu8PcSDeE8uHXpdd35+A5l
         UE0ItJm5hLWzq3Q5B6Ye2PV0vmkC4mWz1NbsAPtEq5EIr8c9CRtXirOPWl7Q1lVzF+Yt
         AkqZSH9Vx1L0QX62YmQClBaVp1OJTFHPY7hmo5v4hn9nSObCUPWiZMZkfPncLsHRF0qO
         Cv/cSGhpU5GgHZz6Hz428wnk8IRVy/YtfAMZQG/NG9N9wysAlmvms04+smPUYL1g/vSG
         n1JfSy810fVkmDExZ/UUj7KXvIMu21G8Vpm71AJ9fsuCloFC9u+/qdEEeuG5qHm67TS4
         1FIQ==
X-Forwarded-Encrypted: i=1; AKwUvBwq+vrxl5pjV0UbuxxIfFoPsUzv7re00zrYajVTHk8DaDMI5kZexa0x2ZiH5kvX9PI95bVn8BNFMNBpnZ6NbiYH@lists.infradead.org
X-Gm-Message-State: AFq9FYIoyI8ZQynz/fXnjjGSB2+zF71RlQ+r/NlzZaiBKTWzIvih2760
	L4hhcS8BCHEPQFPrw+nAs6JMH0KXbkZa7o5l+JgwMZXKBGdrco0BXU2xQLhmjTLkdDk=
X-Gm-Gg: AYBFou2hB31kO5HYUD9LcqHkls9iquzh7eQr9MgsaWZ+2s8PgV28+sMuTObmz+KEgav
	ocM5gBVLwIHNel/vjDo17lwcItYkTPCH4r+6eZsgvsvgemwhq+eh4saK5HCGiRxUwUyi7m3VTaq
	lwzHWoyMazZW8SsXH+a6M7G20UwIW738K03crjYVULMwEUlQJezm96l/RrCfw+i/rzQCYvm2+EY
	HBI3DyeyHlpbvKi42IqhYYkwd6fjtTzMF7c7VaFiYIWj2e2oCB7SE3ckrZ8yF0GUxMgAP2tzqmJ
	0skHJPz3ojEkRQ9h/0ZQMHsA06fAdZ79kSHjw1gwdc/qu7d3mm4AOTF+5XQMoo1WL5MrJv0UeeT
	TvZP7WKlIhPPXL7zaAqBthW4nBQQwqPdIJMpcqZ6/N2d0riX5oKkDzMXqgj8wXE92ax4mTl9PCt
	BuepsssjNcVUV8UHVosiy/OS/O58ays8jgJ5sr8Ki9xxZlattbbi316jZgZhgBuq1DfK8IdV9m/
	v7NSgLctY8DQG2as5jnE+WiU2/1q6jGwrP3CVY4SVSfgqCYH3G4OiD9dlOZ+vDW
X-Received: by 2002:a17:907:2d8e:b0:c29:3c97:c994 with SMTP id a640c23a62f3a-c2e23d94b26mr97396666b.35.1790769294780;
        Wed, 30 Sep 2026 04:54:54 -0700 (PDT)
Received: from localhost ([2a00:2381:fd67:101:2655:b567:7e10:e7eb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e22e16137sm55259666b.9.2026.09.30.04.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:54:54 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 30 Sep 2026 12:54:53 +0100
Message-Id: <DLSMQGCHNINR.ZPYVN1SR0GM2@linaro.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Sam Protsenko"
 <semen.protsenko@linaro.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Peter Griffin" <peter.griffin@linaro.org>, "Alim Akhtar"
 <alim.akhtar@samsung.com>
Cc: "Thomas Turner" <tturner@lineageos.org>,
 <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: exynos850: Add ACPM firmware node
From: "Alexey Klimov" <alexey.klimov@linaro.org>
X-Mailer: aerc 0.20.0
References: <20260929-exynos850-acpm-node-cpufreq-v1-0-5a86c1d404b8@linaro.org> <20260929-exynos850-acpm-node-cpufreq-v1-1-5a86c1d404b8@linaro.org> <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org>
In-Reply-To: <7b5dded4-c475-40dd-b5c4-5086bab4162e@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_045456_763280_E921898A 
X-CRM114-Status: GOOD (  14.29  )
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

Hi Tudor,

On Tue Sep 29, 2026 at 10:02 AM BST, Tudor Ambarus wrote:
> Hi, Alexey,
> On 9/29/26 6:10 AM, Alexey Klimov wrote:
>> Add the ACPM firmware node with cpucl0 and cpucl1 clocks. ACPM firmware
>> protocol provides interface for all client drivers to actually use
>> features exposed by the APM co-processor.
>>=20
>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>> ---
>>  arch/arm64/boot/dts/exynos/exynos850.dtsi | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>>=20
>> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot=
/dts/exynos/exynos850.dtsi
>> index 8a4771899a8e..91c6cee8f483 100644
>> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
>> @@ -11,6 +11,7 @@
>>   */
>> =20
>>  #include <dt-bindings/clock/exynos850.h>
>> +#include <dt-bindings/clock/samsung,exynos850-acpm.h>
>>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>>  #include <dt-bindings/soc/samsung,exynos-usi.h>
>> =20
>> @@ -170,6 +171,18 @@ timer: timer {
>>  		     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>>  	};
>> =20
>> +	firmware {
>> +		acpm_ipc: power-management {
>> +			compatible =3D "samsung,exynos850-acpm-ipc";
>> +			mboxes =3D <&ap2apm_mailbox>;
>> +			shmem =3D <&apm_sram>;
>> +			clocks =3D <&cmu_cpucl0 CLK_FOUT_CPUCL0_PLL>,
>> +				 <&cmu_cpucl1 CLK_FOUT_CPUCL1_PLL>;
>
> Why do you describe these clocks?

>> +			clock-names =3D "cpucl0", "cpucl1";

To link these clocks with ACPM clocks from this list:
(file drivers/clk/samsung/clk-acpm.c)

static const struct acpm_clk_variant exynos850_acpm_clks[] =3D {
	ACPM_CLK("mif"),
	ACPM_CLK("int"),
	ACPM_CLK("cpucl0"),
	ACPM_CLK("cpucl1"),
	ACPM_CLK("g3d"),
	ACPM_CLK("aud"),
	ACPM_CLK("cam"),
	ACPM_CLK("disp"),
	ACPM_CLK("cp"),
};

Eventually to have some sensible/working ->recalc_rate() for ACPM
cpucl{0,1} clocks.

Which is needed, for instance, for cpufreq_dt because it registers with:

static struct cpufreq_driver dt_cpufreq_driver =3D {
        .flags =3D CPUFREQ_NEED_INITIAL_FREQ_CHECK |
                 CPUFREQ_IS_COOLING_DEV,

Don't know if it answers the question (if I understood it correctly)?

Best regards,
Alexey

