Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF08F4485A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 13:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LqP6MZ/X3JZngH/ljagVF5jBd2WE3YkVVyVY71Hxwg8=; b=w4gxcneHCNOuOnYWPA4h8/gT2S
	yEoAXsZ7i20ureuI055hSYm1zKjTnNvyzBgtD1Mn9swi4XufW+IiLD9arusryG5/i2k4EuC1dqMF6
	sN/G7jwAiW9VKuXYH/H0HtP8f8J0A4X7cTv8oyCEwu5jOSCpBuAiSdEqH41mbpInhHKjRX04w/vxh
	yDN16OExuUb4xYr/GE+Wy6IP15rE3o77FDQPTzZB5MarpmvTUyJPEiBGcPGIlb6fqbpftlLtkVH1X
	iydAfHTxibrGSuPp3LcAd6bypRn7rsxRkatHIhDj/WS0d6XdDcLLKS4XsHjLU7f1XTqdkA4neRBpY
	tvL/WoXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBC8T-0000000CKlH-1HYE;
	Fri, 10 Apr 2026 13:43:01 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBC8P-0000000CKku-27kU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 13:42:59 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-488a041eae5so14669235e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 06:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1775828575; x=1776433375; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LqP6MZ/X3JZngH/ljagVF5jBd2WE3YkVVyVY71Hxwg8=;
        b=nV6OIgv9W0ZIscpO49OV8HmUujAcY5Uk/HED76cjS1VHUmEh9YAuEUmaQuRHn3sQ5o
         NexFtzIHFNIysU3Qhlg/1hxTHDUPUkVVyAeKoAiT8RX/pLudPMQE9rtdYKry27+lFAlN
         RLE8DD3KBC5OxmPfDAnH+IQfz7RrGTVshlXAES9KpzIlPy3R5GHpyJbDij9T92KgIzI2
         EJC9EqY7byy4o3UPek3Ig0NKItvCPtefhbNYrb+nlYmv5sFthalT3eOqXPh6WY2cFCsk
         ijyCow+D17aXnM7agGuK8pvjTZIUcT7fo/c09xoMQ+i7tRG9guN5/Gcs7LgnGBIkEiFP
         sXkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775828575; x=1776433375;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LqP6MZ/X3JZngH/ljagVF5jBd2WE3YkVVyVY71Hxwg8=;
        b=MvrmUeZYd5NYv6O1hSa74Rox07nER3IZvTyu3WZ5ZCjHnaT1PSe9fyEorxliMbGG8b
         xT/CkkIdOX/XUYo/z1+9HzMYjb4ZTj7R5HmmJh+6Ldda3TA1sZq4saHmJP0aItANAafx
         ZOit/SvdNtIJZbVAODtqeoAhyGI4Mcv8dQKn6BzkLNE6V/MGXtC/7LYoEHXNOVsagAlG
         BIGNRl94xDfKadbWN/+vqvXCoUluNUmk+ZBtJpA0lnVEB1MXNOdaKK+dspwVc6nkuI7i
         bh3Q6avyJX5jTLbMY4K7zvPBRLA8NoC4K8ip3J88yUaeJZ6LWJwyFMQ2aW6z/fDzvPbR
         wo7g==
X-Forwarded-Encrypted: i=1; AJvYcCUqBu0TrCIxdQfv52od7u4K2rI6zL2wxSlxfmWIOw3+JX/kSW322w5A8/nBmlH6mBCYK4TAowrBovw488xXVVBt@lists.infradead.org
X-Gm-Message-State: AOJu0YwlIiK8r0gzUum9BXTFXzUhWf0TdBbXrkg9bSi34jy/pp3X2ubq
	FcHaMxqeGYMPEjg+EqmJ0FgBMUsMuDXZolWyaipxLfICVSn8SCxM9CM5ASzvkXPzNSk=
X-Gm-Gg: AeBDies+R/CIjx8mZbHj8+pm+sMUWzBfDP7NUbFjqTEMkS9LxxISEwGhx/+0HNpZWBz
	cYbSYuWZ/kYDPTsBf8EkFp2S68sWBZAenN+sZ2M1FBJIzIk9jYQZD1d19sRNpIQwyZhp5q+IXW5
	n8ifngpvxCd1nk6uqC22motL6Lzsv3NkL0QYVCaXa4dO6zQSuTPN2JV409IlvQ9I5JIKr3hQS3d
	3N56xroBD9vEDXGnx+5uoMyggCndE93TverXJB0hf6o/Fm3Ouwvj/BSrQbif0X6aMdHMlP0MnB/
	5otMRFV1bW4MMPIqT9wrFTOWdf85BZes3E7oM1rlGz7oOPFMdxvQwsGybMUn311iDBC3iUm7R2Y
	nzl7qbPeMFJmr5h5JCPv6MggtcuEX7CWi5uVNv8qA1Dpu5KyvRfh6OFL36exHUx4H7Ex751IWDw
	tkBdDmqy63NbnrHg==
X-Received: by 2002:a05:600d:8449:b0:488:b683:a421 with SMTP id 5b1f17b1804b1-488d683d51bmr33002115e9.19.1775828575183;
        Fri, 10 Apr 2026 06:42:55 -0700 (PDT)
Received: from localhost ([195.52.170.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d5b3cbb2sm76078325e9.13.2026.04.10.06.42.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 06:42:54 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=fce1b4727364f5973feb041246ca85370b02d5848da19ed76fba443450be;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 10 Apr 2026 15:42:48 +0200
Message-Id: <DHPIOTXA81M3.AHBN8M49ENG5@baylibre.com>
Cc: "Vishal Mahaveer" <vishalm@ti.com>, "Kevin Hilman"
 <khilman@baylibre.com>, "Dhruva Gole" <d-gole@ti.com>, "Sebin Francis"
 <sebin.francis@ti.com>, "Kendall Willis" <k-willis@ti.com>, "Akashdeep
 Kaur" <a-kaur@ti.com>, <linux-remoteproc@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 4/7] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Vignesh Raghavendra" <vigneshr@ti.com>, "Markus Schneider-Pargmann
 (TI)" <msp@baylibre.com>, "Bjorn Andersson" <andersson@kernel.org>,
 "Mathieu Poirier" <mathieu.poirier@linaro.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Suman Anna" <s-anna@ti.com>, "Nishanth
 Menon" <nm@ti.com>, "Tero Kristo" <kristo@kernel.org>
X-Mailer: aerc 0.21.0-126-g9e77103592fe
References: <20260318-topic-am62a-ioddr-dt-v6-19-v3-0-c41473cb23c3@baylibre.com> <20260318-topic-am62a-ioddr-dt-v6-19-v3-4-c41473cb23c3@baylibre.com> <8673745d-aad2-49d3-b3af-556de7037b69@ti.com>
In-Reply-To: <8673745d-aad2-49d3-b3af-556de7037b69@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_064257_819933_1722A863 
X-CRM114-Status: GOOD (  21.75  )
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

--fce1b4727364f5973feb041246ca85370b02d5848da19ed76fba443450be
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Vignesh,

On Fri Apr 10, 2026 at 6:30 AM CEST, Vignesh Raghavendra wrote:
> Hi Markus
>
> On 18/03/26 20:43, Markus Schneider-Pargmann (TI) wrote:
>> Split the firmware memory region in more specific parts so it is better
>> described where to find which information. Specifically the LPM metadata
>> region is important as bootloader software like U-Boot has to know where
>> that data is to be able to read that data.
>>=20
>> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
>> ---
>>  arch/arm64/boot/dts/ti/k3-am62a7-sk.dts | 40 ++++++++++++++++++++++++++=
+++++--
>>  1 file changed, 38 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts b/arch/arm64/boot/d=
ts/ti/k3-am62a7-sk.dts
>> index e99bdbc2e0cbdf858f1631096f9c2a086191bab3..c381cc33064ec427751a9ac5=
bcdff745a9559a89 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> +++ b/arch/arm64/boot/dts/ti/k3-am62a7-sk.dts
>> @@ -59,9 +59,33 @@ wkup_r5fss0_core0_dma_memory_region: memory@9c800000 =
{
>>  			no-map;
>>  		};
>> =20
>> -		wkup_r5fss0_core0_memory_region: memory@9c900000 {
>> +		wkup_r5fss0_core0_ipc_region: memory@9c900000 {
>
> There are still references to wkup_r5fss0_core0_memory_region in
> k3-am62a-ti-ipc-firmware.dtsi (same comment applies to next 2 patches as
> well)
>
> Dont those need to be updated too?

I only updated the sk boards as these are the only ones that have IO+DDR
support that I know works and need the new memory region layout. But
thinking about this, updating the memory region structure shouldn't be a
problem for the other boards either, of course I can't tell if IO+DDR
would work on them, but the new memory region layout shouldn't break
anything.

I can respin the series or do a followup series with modifications for
all boards if you like.

Best
Markus

--fce1b4727364f5973feb041246ca85370b02d5848da19ed76fba443450be
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCadj+WBsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlOm
TwEA3u6RqiPdFMVzltU2VOokKlHJ2REIqs5yRIMNmRsfRb0BALqUuasImLphT+IM
k1FzSwoCFPxGLFA9l7C4E3YR3HIE
=b2//
-----END PGP SIGNATURE-----

--fce1b4727364f5973feb041246ca85370b02d5848da19ed76fba443450be--

