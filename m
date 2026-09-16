Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BE1C88E77
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 10:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t3hmWtdZP0Fd0Xr4e68FJlMw+IYfmh5JRzNHS/YOcT0=; b=koKuJRxm+dpubBksV1b3HGbNUm
	F5MXyY9jJTOPhk3m3dQGia++bsGd6G/EkW435GSHX6yb8OX3cevzxki0tfNYFznAWFCEur/q5uMgY
	swPU7N7P6ArkI01NGwVgriRVCHTNscyDVo9gKTzda/ZaTj9IlizHHSHD5sOuQ542vs/fRmvcmK1wM
	Z7CmOfCGprQ1uHyzjmRWCiD61fwfRDI/tS7cxLMZy7ejJOo9cmYfehWNssiJGt3+fsdF6pR2VYT5j
	YTwC7DXTJZagvKENmffJPe8lVf5fG2OtoxbHclw80mT7juywD8J/y3ibSAKuzZ6wevT93VIIH0ukT
	Pq9LzBFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6miB-00000008x8B-2BUg;
	Wed, 16 Sep 2026 10:17:55 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6mi7-00000008x78-3ljz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Sep 2026 10:17:54 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e71cdb22bso5532945e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Sep 2026 03:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789553870; x=1790158670; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=t3hmWtdZP0Fd0Xr4e68FJlMw+IYfmh5JRzNHS/YOcT0=;
        b=hJBoJVFupzPBZuXuFDmU9kN/LV38DTjCMu5ClT3rIdWAHE4mBNoS6YBbfItw23G3RV
         pWymEPOU4cVtBT+FPR7wOByWK4V1SZ56q2piuXWimYzvyNW112c2qQkzI31vD2YeTNkm
         0+2Ug5Rp8aXYsmGEnDCruagrivZgOMOe945JFyQ308V+AsErSmfwcrOyTS5hX3Wp0NsI
         gJKb8GsivyJBQS/VhEb/AxG8cwxZN2ZjPRFUZ2E+v3VpOkFJYt2roIBr2WJ8xZOVBOLt
         41BIIzf6VT4Qvmf0FTUm3aYmQZI2VGF4iksVqOWIOMnu4Ulaq+v8LXV+HDBXs+YMhc6g
         bF5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789553870; x=1790158670;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=t3hmWtdZP0Fd0Xr4e68FJlMw+IYfmh5JRzNHS/YOcT0=;
        b=P53U+qvU/lVIVFT1bOD1EJp4+EEpirpbErTAXhpU8iibcVvd3z1DHI2jrKVzeHDCXY
         c1owmE7SCiI8kNogYlWQ8EZ3tRECxYS2GTzQNr66Mtx6bSHnIKmXOdT6mlr8K3Pwi9Lz
         4o6z1zKmHFY3RS4lrwJlfXEKJUYyhaOKBg2YWOoQlgJlPbx2MVnyQGH03AciwmJFqG4n
         DpQ6dLUiJ/9rjmyBkQsB7vpfytDQZvYelpmligyCCaSnOAONCMim/ud36HugY3BLwtZh
         Uug6gPHjA3nTBpEAbv18q1fXu4gp+Ln44m5YrnOQkPuKALljLVvfnTZdk61QNz0cA0Hs
         OW2Q==
X-Forwarded-Encrypted: i=1; AKwUvBz/SlOf2jYL6ZyEoa9l/POOnNy/05DeYhd8I7yDK4Vw+509SIiafWgVU2Tc4K1srcgNfoptGBbhg8kr/JMtJndL@lists.infradead.org
X-Gm-Message-State: AFuF++lWlL33zOncCsIPH1UU57C0H0qpgOEERkgK7CNrQDBBukmB4PpP
	A3HloMT9RhwV+lb0eGC50ZLIFRelU3JiVZ4JybbJDYzXp4Ra3yQMzUNrzll+kY4HnjA=
X-Gm-Gg: AYBFou03hA32xSxgRMJwBNjXOX1W+2/3Hd4FMdTwT5lNSS2EojBZYaCP5B8BRPz1lKQ
	GthPA2nAX4EN0gvaoSh2Ybs6Ay1eU+Mr2WyqP8wPDLzvMdU4in4E05vTZg7vJubxbfD0LsS79v6
	rn69+GZAKa0jpSqKnUBuu1bv9AzXa9Zve1v6//LTowgproi19aV31TUT5I7dLg+mIUi1A45Kgo0
	5DDUPew2Y89PJsqnSq/mPyR0GqiHYiOESxHTLx8Ssm6db/5U/yUzIoggReWNl9gDWGSnV9uMGIJ
	X1fqxUnWjNre0qLIgi/4/onuB1a7AVlyqOrqpbV0SaNdL/zQQyD7gEQMFxgJTZ3FMVDT/qulP4/
	gn7zebBRL9yqcqoBATnQp4HDYhkN3cG5df3LlhaXSi/yVDVnP9BnNYc2mlLXboDgRvyD7XkEoCT
	yEMWxBmQpm2StMDYV7M27h+AA/aG8VHSaGAxIrXGYRwXIsu9btcySsWvPxJvoDLB5SiQ==
X-Received: by 2002:a05:600c:4e89:b0:49c:f504:2af5 with SMTP id 5b1f17b1804b1-49eac463892mr21836755e9.1.1789553870070;
        Wed, 16 Sep 2026 03:17:50 -0700 (PDT)
Received: from localhost ([2001:4091:a245:8029:665d:b7b:5fa4:7ad0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf462cesm6129385f8f.37.2026.09.16.03.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:17:49 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=4294f4665fca826925ab73fbe6c2302da13aa0714ec0f2a34bb309cea55b;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Wed, 16 Sep 2026 12:17:42 +0200
Message-Id: <DLGNWF2DSXZI.7WRJZRZLGW8@baylibre.com>
Cc: "Nishanth Menon" <nm@ti.com>, "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Tero Kristo" <kristo@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Nathan Chancellor" <nathan@kernel.org>, "Nick
 Desaulniers" <nick.desaulniers+lkml@gmail.com>, "Bill Wendling"
 <morbo@google.com>, "Justin Stitt" <justinstitt@google.com>, "Judith
 Mendez" <jm@ti.com>, "Daniel Schultz" <d.schultz@phytec.de>, "Andrew Davis"
 <afd@ti.com>, "Siddharth Vadapalli" <s-vadapalli@ti.com>, "Paresh Bhagat"
 <p-bhagat@ti.com>, "Bryan Brattlof" <bb@ti.com>, "Jai Luthra"
 <jai.luthra@ideasonboard.com>, "Devarsh Thakkar" <devarsht@ti.com>,
 "Beleswar Padhi" <b-padhi@ti.com>, "Francesco Dolcini"
 <francesco.dolcini@toradex.com>, "Stefano Radaelli"
 <stefano.radaelli21@gmail.com>, "Nick Desaulniers"
 <ndesaulniers@google.com>, "Vishal Mahaveer" <vishalm@ti.com>, "Kevin
 Hilman" <khilman@baylibre.com>, "Sebin Francis" <sebin.francis@ti.com>,
 "Kendall Willis" <k-willis@ti.com>, "Akashdeep Kaur" <a-kaur@ti.com>,
 <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <llvm@lists.linux.dev>, "Hari Nagalla"
 <hnagalla@ti.com>
Subject: Re: [PATCH v8 9/9] arm64: dts: ti: Add wkup R5F nodes to pre-ram
 bootphase
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Francesco Dolcini" <francesco@dolcini.it>, "Markus Schneider-Pargmann
 (TI)" <msp@baylibre.com>
X-Mailer: aerc 0.21.0-146-gb5c16ebe1835
References: <20260903-topic-am62a-ioddr-dt-v6-19-v8-0-74c650dfdea6@baylibre.com> <20260903-topic-am62a-ioddr-dt-v6-19-v8-9-74c650dfdea6@baylibre.com> <20260911052428.GB5377@francesco-nb>
In-Reply-To: <20260911052428.GB5377@francesco-nb>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_031752_249867_4479AA47 
X-CRM114-Status: GOOD (  19.79  )
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

--4294f4665fca826925ab73fbe6c2302da13aa0714ec0f2a34bb309cea55b
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Francesco,

On Fri Sep 11, 2026 at 7:24 AM CEST, Francesco Dolcini wrote:
> Hello Markus
>
> On Thu, Sep 03, 2026 at 02:39:30PM +0200, Markus Schneider-Pargmann (TI) =
wrote:
>> For IO+DDR the wkup_r5fss0_core0 and the
>> wkup_r5fss0_core0_lpm_metadata_region need to be accessed before RAM
>> setup is done. These are used to read the lpm metadata region in
>> which data is stored to resume. This needs to be done before RAM is
>> in use to avoid overwriting data.
>>=20
>> Add the bootph-pre-ram flag to the wkup_r5fss0_core0 node in both
>> ipc-firmware dtsi files and to the lpm metadata region nodes of the
>> AM62A and AM62P boards.
>>=20
>> The board level bootph-pre-ram flag of k3-am62d2-evm.dts becomes
>> redundant with the dtsi-wide flag and is dropped.
>>=20
>> Signed-off-by: Markus Schneider-Pargmann (TI) <msp@baylibre.com>
> ...
>
>> diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi b/arch/arm64/bo=
ot/dts/ti/k3-am62p-verdin.dtsi
>> index 45ab9d947b3a..8976c0424cd1 100644
>> --- a/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
>> +++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin.dtsi
>> @@ -184,6 +184,7 @@ wkup_r5fss0_core0_lpm_metadata_region: memory@9ca080=
00 {
>>  			compatible =3D "shared-dma-pool";
>>  			reg =3D <0x00 0x9ca08000 0x00 0x1000>;
>>  			no-map;
>> +			bootph-pre-ram;
>>  		};
>
> verdin-am62p has the various bootph tags only in the U-Boot dtsi
> (k3-am62p5-verdin-wifi-dev-u-boot.dtsi) as of now, I am not convinced it
> is a good idea to just add this single one here.

I don't see any bootph-* flags for any of the related memory regions in
k3-am62p5-verdin-wifi-dev-u-boot.dtsi. Is it in a different dtsi?

In general I am counting 72 bootph-* flags in the upstream devicetrees:

git grep bootph- | grep 'am62p' | sed 's/:.*//g' | sort | uniq -c
     38 arch/arm64/boot/dts/ti/k3-am62p5-sk.dts
      4 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
      9 arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
      3 arch/arm64/boot/dts/ti/k3-am62p.dtsi
     14 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi
      2 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-mcu.dtsi
      2 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-wakeup.dtsi

Best
Markus

--4294f4665fca826925ab73fbe6c2302da13aa0714ec0f2a34bb309cea55b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCaqpsxhsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlPF
ZAD/eDJUC404z4tekZfsmiBsSdeLivl6qN7wKJXrKvbZT8oA+wcDLzFFZE77sGVB
8TuajZIIVN4aNTNdZ3YIBLPrhFkO
=F8Zw
-----END PGP SIGNATURE-----

--4294f4665fca826925ab73fbe6c2302da13aa0714ec0f2a34bb309cea55b--

