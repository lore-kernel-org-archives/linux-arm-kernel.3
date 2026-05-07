Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FE7CD3439
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 13:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	References:To:From:Subject:Message-Id:Date:Content-Type:Mime-Version:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PMTg4x+eEXsPu7Tgk5l8N+6jmxWHQBVR0ARsPIG0eJ8=; b=cUoY8j0YG80l38qwquW0RhcrZy
	BR14NFs8Uq0PWOc/gqoYFA3laYu3F3Z68NJ86ipEch59XE9v0EuzCWEk7mJsNmsJAlIs8SG84s1HL
	8x3tuaJbWgQ3s4UPpME906nq/pRM763S8MBDoRbDA8HfqtX9MEY9kIEL6ZIAP6YvlTpmn8qbJso7L
	p2zXCRCTfQlVuKCWUWhmQk30770M7dVuKU7hHHVjtP8gXX5xAMfvqi9FzvoMuhZhrWxeBqvrdxuKq
	hfPj3201gNmo0Ck6RSm1h1L5vU0ByD+CYZbO3dwx2dDQUm+AEdEYt9zytsBkUb/9DM7UE33ce7diL
	FB7KRrcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKyYt-00000003sXU-041n;
	Thu, 07 May 2026 13:14:43 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKyYp-00000003sWv-2QiV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 13:14:41 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4891e86fabeso10407975e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 06:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778159677; x=1778764477; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PMTg4x+eEXsPu7Tgk5l8N+6jmxWHQBVR0ARsPIG0eJ8=;
        b=ag7WNaMtF+rjIbtN/29z9ziVaszHYuAvkI58iy1T691dR+P3BIcYflZzwyGptjvGo9
         Fr8FhkRrKCIO2sPYqc1u1c8JTT+yyjT1D/TeqXDLD0a5iNF/xhUI6ObS2dhjsbxMFiSx
         S0xd5ZrEVVLBi5JOsU4/77JT/zokLvZTslrjYJqTd4MLJ/erGBWTIRYpInktILf1SH2z
         x5mU2MypY65cO3a0ecEyLVtsoyvIKz/DpqDhVTrO+q2vOBTFhFJHu16YOAIeSOXbUoJs
         1N45saAusa3/Y0bceJ1dN8aphq/0WB8l6rlz+h/S5SyewrKq45bGfp2o2ObHdR+wzNHK
         aU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778159677; x=1778764477;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PMTg4x+eEXsPu7Tgk5l8N+6jmxWHQBVR0ARsPIG0eJ8=;
        b=p/J9R2jFhbzaImoxAc6ue3lpvRI//3VxLvGEbquPIl+mkAfjdxNrgBYaE0KAZZ1n7T
         sEMLFVGNO7nvptj9LkdRp//YQqyL/Yu1uy4nXBGvS4i6KIbpivHAvARcDewELrKIdelt
         erqiHJPAEmx78BKPGw4HBlrdRnETaiDUQsVs2YMjdcy0mUWaDo6qYRDBkx1RTy83r1V3
         4FxKeTfYO6gDhHTfYRd6r+Ogm5CdblF613bRBfnzNCfrHaTZb1HFfuzHw8dE0708b1HF
         H5jDwsK/crCw11LLltEOqDawtN9lWLRfmtS7vtgodUhKhBfGWEkErD0J3c/MfRQXkbRf
         avmQ==
X-Forwarded-Encrypted: i=1; AFNElJ/B/d4CDFUZFPGEk5j61aQVS21Bx6rGfhBRP5DBbQpIP6XRLiPkf3zJ8teoq4mwKJS54DmDHKGT9Q6SwPHjLtlq@lists.infradead.org
X-Gm-Message-State: AOJu0YxMxQtakXFH5/dAyAMv+Yrun+kTA74KduLousnQ7yIPDbCbFspI
	3o7Yh8gaVLFnyGvlyLvDdqcLt9cjObzq3AVN7wqp8N6yTLDIO0vQZQrm+gsOT+q7rIY=
X-Gm-Gg: AeBDietT2i11pBwTJTiDI95kUF+le23TNO+HqZxxxRSA/bvZ1Jxh6hcDBrNm6smA8CV
	fBiQkkf4MR0TTjIDhUh+qZPXm6HqtP2MQUXyJ4VfY8DFDseSejGb9jh6xQqv6KhD1Qo9aR0J0D4
	FVDeApn47hhlonCPkqUdFsAFPkNcwJBHRm+GXc3oS4pahHnTFkZXPsxZeQTi5fcoZ0j2lpTPnQW
	5ZJYip+OK3JEmhHndsajUlaKpRtpBMFLAimFRLM3wr/GIHp5xsVYyvO9bqm3/DhU8XPxmgX1kpU
	p214plxFwAirD3wsX1z3YlEQ8+nhoZj2e4Lt9haeZ2XIYbPQSwNnBsJFTITkffWWwouCzB1pmD8
	dH+KYJIUBkC6w3nqNqZdMQV1mGXDmcMtpSCumwHr2L1p3SgCzKlrn+LCcsoEcZO26OUyqqGHx+q
	QTN/fV4A8I2qt8Xr/gf+GykwTFJsNZiBADNRVku2Mz
X-Received: by 2002:a05:600c:4f51:b0:48d:1a94:56c with SMTP id 5b1f17b1804b1-48e51f3054cmr140580965e9.18.1778159677055;
        Thu, 07 May 2026 06:14:37 -0700 (PDT)
Received: from localhost ([2001:4090:a246:83ca:9bf6:accf:de42:f1be])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e53891163sm136382465e9.2.2026.05.07.06.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:14:36 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=1cd2ce29e617ccf25a0057d7944a172c6840176cfdde9913103d3dc41b58;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Thu, 07 May 2026 15:14:25 +0200
Message-Id: <DICGZTCMDWHK.HMQMCB8M32ZV@baylibre.com>
Subject: Re: [PATCH v4 1/4] arm64: dts: ti: k3-am62a7-sk: Split r5f memory
 region
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Nishanth Menon" <nm@ti.com>, "Markus Schneider-Pargmann (TI)"
 <msp@baylibre.com>
X-Mailer: aerc 0.21.0-126-g9e77103592fe
References: <20260429-topic-am62a-ioddr-dt-v6-19-v4-0-fc27d6ac753c@baylibre.com> <20260429-topic-am62a-ioddr-dt-v6-19-v4-1-fc27d6ac753c@baylibre.com> <20260505124121.hffywentvo5pusfx@glowing>
In-Reply-To: <20260505124121.hffywentvo5pusfx@glowing>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_061439_896024_FE07A469 
X-CRM114-Status: GOOD (  28.09  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Dhruva Gole <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Kendall Willis <k-willis@ti.com>, devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, Sebin Francis <sebin.francis@ti.com>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

--1cd2ce29e617ccf25a0057d7944a172c6840176cfdde9913103d3dc41b58
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Nishanth,

On Tue May 5, 2026 at 2:41 PM CEST, Nishanth Menon wrote:
> On 15:22-20260429, Markus Schneider-Pargmann (TI) wrote:
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
>> index c1e9067b3bdd5ab0591541d4685bb17a5dac4f65..6f2ee93c7be141ee5ae3f1e3=
324d3a060db069f6 100644
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
> Looks like you have'nt addressed Vignesh's comments from previous
> revision.
>
> https://lore.kernel.org/all/DHS46FH9ZYZB.3BG6HVH832NAE@baylibre.com/

Sorry, I was trying to understand the issue in that thread but I didn't
and didn't get a response so I couldn't really address it.

>
> We dropped wkup_r5fss0_core0_memory_region here..
>
>>  #include "k3-am62a-ti-ipc-firmware.dtsi"
> In this file:
> https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git/tree/arch/ar=
m64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi#n27

This file line 27 is
	mcu_r5fss0_core0_memory_region: memory@9b900000 {
		compatible =3D "shared-dma-pool";
		reg =3D <0x00 0x9b900000 0x00 0xf00000>;
		no-map;
	};

But my patch is removing wkup_r5fss0_core0_memory_region and not
touching the mcu_* definitions.

> https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git/tree/arch/ar=
m64/boot/dts/ti/k3-am62a-ti-ipc-firmware.dtsi#n68
>
> I am not clear where wkup_r5fss0_core0_memory_region is now defined.

It is not defined anymore for k3-am62a7-sk.

> BUT, in the patch, we introduce:
>
>> +
>> +&wkup_r5fss0_core0 {
>> +	memory-region =3D <&wkup_r5fss0_core0_dma_memory_region>,
>> +			<&wkup_r5fss0_core0_ipc_region>,
>> +			<&wkup_r5fss0_core0_lpm_fs_stub_region>,
>> +			<&wkup_r5fss0_core0_lpm_metadata_region>,
>> +			<&wkup_r5fss0_core0_lpm_rest_region>,
>> +			<&wkup_r5fss0_core0_dm_region>;
>> +	memory-region-names =3D "dma", "ipc", "lpm-stub",
>> +			      "lpm-metadata", "lpm-context",
>> +			      "dm-firmware";
>> +};
>
>
> So we go ahead an override the definitions of ipc-firmware.dtsi for
> wkup_r5fss0_core0 here - explaining why the build does'nt fail. I am
> confused why the ipc firmware dtsi was'nt updated instead? is this
> something different firmware dtsi now? if so, we should split the
> ipc-firmware.dtsi accordingly. Commit message does'nt mention the same
> either. This right solution is to make up our minds if ipc-firmware.dtsi
> is meant for LPM mode support or not. if not, split the dtsi, if yes, do
> the mods in the ipc.dtsi

We can update the firmware definitions as well. I currently only did
this for am62a and am62p as these require the new format so IO+DDR
works. But if you prefer I can make the changes to firmware.dtsi
instead.

Best
Markus

--1cd2ce29e617ccf25a0057d7944a172c6840176cfdde9913103d3dc41b58
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCafyQMxsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlNz
QwD+K6cqc767M67zBw7vaL0hUeEw8dOTuH2ND3M1gilCBQkBAMKU6KOE5lZ9FFu5
88v+RbDSuYzP0g6h//QRzeC/V+UI
=J7j8
-----END PGP SIGNATURE-----

--1cd2ce29e617ccf25a0057d7944a172c6840176cfdde9913103d3dc41b58--

