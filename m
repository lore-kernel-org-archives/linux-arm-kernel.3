Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16B8CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 11:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=monGLLl72k03rW+XBHxv2n4ze7FfAMEbwcdE5Jp88/k=; b=07MNyCK/9dBhEh1JrvRjX080nD
	BjeRlhjC5TZim9qKGjTz62o4CBbl8iVQMqFky+5DqR+rO4/BMMFHAx8cPbDu+LGSjnaoe3uImN1nB
	ocWdbxxVfFKyVi6E0wMD1NswBAWns542VWCkS7KexaQ9ghfmNmJd1k0qffWSbFl4zS6+Ekcl8HCvY
	19daJmPytcnpJMo4D5tod1jpmMBXYBvDDLr7dVqOMH2F46kaK97WSCKde0WjzH35IzDm50Nas9KjI
	LJ1+V0LenBT1xdrEJodhfjeOqCRX0/hAHLavomnSLbCllo0eAy9otIqZ/tSfs76YPcgvhJZ7DqnlE
	/DXf0+Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHL67-0000000HFs5-2TYZ;
	Fri, 07 Nov 2025 11:57:43 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHL65-0000000HFrH-3Nk9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 11:57:42 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2958db8ae4fso5737085ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 03:57:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762516661; x=1763121461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=monGLLl72k03rW+XBHxv2n4ze7FfAMEbwcdE5Jp88/k=;
        b=fAFg10z0hOLOrMMY8O4TkZkMCQlTSHS6BKsWF1tBsIhBC+Lvt2E5q3+whzWYGJeyen
         70HsWl4FMNBvp+Q4zbR841clICZnVz8BpYNPhAWwxUoaaGMzULuT0BTPiHcb1sBZ/bQ/
         fKmI1ewwFFYTyXuAEEzuF93Ek1gMV0huxLJyE6Fa25ShP5W8ksUqXSBnu+twW6Glfa6h
         /KCBqRH3wg8FZfsGO4F995HrE+x1V706+87Qe8PS5bO/vWmiu9OlB4rUfwR2a9RJAk2S
         wSxGmhGjHiSPJpWFRnx7/3Rwk4dLygbIyY7PButtewT1FkImxjADiCOAcdXaH2gEk8D2
         NrRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762516661; x=1763121461;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=monGLLl72k03rW+XBHxv2n4ze7FfAMEbwcdE5Jp88/k=;
        b=QFzUO4r2YKtQOjXEmEKioLKfiiDRBRfZ1/iNW4W4Ub9F7hoh+Pg98oLpl5zokaFyJ/
         89wOeubQCsq1GqjwvARK64AFr2zaOxVSpAqUGFuNNvsetXa4aPFOBEq/CLGhJmgvhxtU
         8v/QkiS8SCAWG0gPwre7qklfx6BrE9S3RPq9UftgoxbgCiBrr4nqiv3FJ5T5ku29TTet
         RdvrKrRyGKPpvlIUOpG6fVSBhZjPZRFA+zPmkkJ9uvm2aj/oAOUi9YA7EtzNQLdjjvlq
         6bFscxIpxjMYE6SmD/sHJgrL1GQ6dD9A5wGVciHN5/PmMb+B4JjbSkm3Nmbg+1TCoWZ/
         Hzvg==
X-Forwarded-Encrypted: i=1; AJvYcCWg4kgt0HPagV3jSgAC4ls9/yQLuWVv2NBudbm/MkWM4uWyz/4Kj5eUYuVLBKh7Eh6hburrZ62UELs/ooYCyFI0@lists.infradead.org
X-Gm-Message-State: AOJu0YybJb+Z1B0LshNCDTMf/CmXlmhrHniimuE9QRDuHOgYKB/cIVKi
	fuTA80UQl+H8g4VplKWwzq0ZgAxY2ZFDJkOZMyTkmWHpwLuD0ooAyjRCssPbewwb
X-Gm-Gg: ASbGncv1OZbMfq8qlK5YNFeRtLNYYEmvngEaQVaFiKLy4Q7f59MHg8nSCJDCOFQhT02
	r9yNJSxiAAANCnXzHIX2/04YfkeUuK7EStFzTLE3THUuIb1camFZZfp0Luo4XNkmjTinstB6vpS
	Ek0YNWI5gZeNlsC2ratGlKmOqv0DBsTEFGzXUs5zCkZoOCJCymreLUhkJisuS9n9DUucZG/6nOT
	3sM0NztJACckGaYg+OKFTk6ZrkLdftODbztPhEOc8mimUDaTzzVLrNmv5vQ3dxcA2g2dFGT3kLB
	Gq14wRUrGEIY9cIH1Inja1T2LrEdr+FtSvQ0zTjOfjVIUr+3r7dORhnavMUmKZb46d+k1jXNOPS
	rstVbjSKNAw11wdcAyhrk0+i8c060DF2gYxBWga3UOZY5ihTf6omEsS11H6JMqeOQ8s+Np9m5nX
	wmECTCkkHDmhUwpb7taomVuif8Oazu5lB0
X-Google-Smtp-Source: AGHT+IG2JNYUVu7xIzD0M5+jz0kLb7Hm7r7y9xBYeK5/FwHh5dDyBrOGwBvYmi7VcMJsmKn3/mqWGw==
X-Received: by 2002:a17:903:2284:b0:297:d6c2:d06 with SMTP id d9443c01a7336-297d6c20d85mr8354715ad.20.1762516660819;
        Fri, 07 Nov 2025 03:57:40 -0800 (PST)
Received: from ehlo.thunderbird.net ([150.230.217.250])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c9c2a2sm58337585ad.93.2025.11.07.03.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 03:57:40 -0800 (PST)
Date: Fri, 07 Nov 2025 19:36:58 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Chukun Pan <amadeus@jmu.edu.cn>
CC: conor+dt@kernel.org, devicetree@vger.kernel.org, heiko@sntech.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 robh@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v5_3/3=5D_arm64=3A_dts=3A_rockchip=3A?=
 =?US-ASCII?Q?_Add_devicetree_for_the_9Tripod_X3568_v4?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20251107110020.226562-1-amadeus@jmu.edu.cn>
References: <20251103171702.1518730-4-coiaprant@gmail.com> <20251107110020.226562-1-amadeus@jmu.edu.cn>
Message-ID: <6F2972A5-047F-48A5-B409-C3F3E71643AD@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_035741_872854_71E519E6 
X-CRM114-Status: GOOD (  16.24  )
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

On November 7, 2025 7:00:20 PM GMT+08:00, Chukun Pan <amadeus@jmu=2Eedu=2Ec=
n> wrote:
>Hi,
>
>> +++ b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4-camera-demo=
=2Edtso
>> @@ -0,0 +1,84 @@
>> +// SPDX-License-Identifier: (GPL-2=2E0-or-later OR MIT)
>> +
>> +// This is a sample reference, due to lack of hardware can not be test=
ed, at your own risk
>
>> +++ b/arch/arm64/boot/dts/rockchip/rk3568-9tripod-x3568-v4-video-demo=
=2Edtso
>> @@ -0,0 +1,154 @@
>> +// SPDX-License-Identifier: (GPL-2=2E0-or-later OR MIT)
>> +
>> +// This is a sample reference, due to lack of hardware can not be test=
ed, at your own risk
>
>Why are these demo DT Overlays needed? Are these optional accessories?
>These untested DT Overlays should be removed=2E
>
>> +	vcc3v3_pcie: regulator-vcc3v3-pcie {
>> +		compatible =3D "regulator-gpio";
>
>This should use regulator-fixed=2E
>
>> +		regulator-name =3D "vcc3v3_pcie";
>> +		regulator-min-microvolt =3D <100000>;
>> +		regulator-max-microvolt =3D <3300000>;
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&vcc3v3_pcie_en_pin>;
>
>Is this the name from the schematic?
>
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&gmac0_miim
>> +			&gmac0_tx_bus2
>> +			&gmac0_rx_bus2
>> +			&gmac0_rgmii_clk
>> +			&gmac0_rgmii_bus
>> +			&gmac0_clkinout>;
>
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&gmac1m1_miim
>> +			&gmac1m1_tx_bus2
>> +			&gmac1m1_rx_bus2
>> +			&gmac1m1_rgmii_clk
>> +			&gmac1m1_rgmii_bus
>> +			&gmac1m1_clkinout>;
>
>Align Indentation=2E
>
>> +		codec {
>> +			rockchip,mic-in-differential;
>> +		};
>
>Is it confirmed to be differential signaling?
>
>> +	pmic {
>> +		pmic_int: pmic_int {
>> +			rockchip,pins =3D
>> +				<0 RK_PA3 RK_FUNC_GPIO &pcfg_pull_up>;
>
>No line break is needed here=2E
>
>> +/* Required remotectl for IR receiver */
>> +&pwm7 {
>> +	status =3D "disabled";
>> +};
>
>This should be replaced with gpio-ir-receiver=2E
>
>> +&sdmmc2 {
>> +	bus-width =3D <4>;
>> +	disable-wp;
>
>The disable-wp property does not apply to SDIO cards=2E
>
>> +	sd-uhs-sdr12;
>> +	sd-uhs-sdr25;
>> +	sd-uhs-sdr50;
>> +	sd-uhs-sdr104;
>
>Just declare the highest supported speed=2E

PCIe and MIC picked from OEM source codes=2E

PMIC picked from RK3568-EVB=2E

Since parts of the OEM source code are not available in mainline, I refer =
to other boards (e=2Eg=2E RK3568-EVB or RK3568-ROC-PC), but I don't have a =
camera or screen to test, so I mark them as demo=2E

Do I need to release a new set of patches?


Thanks

