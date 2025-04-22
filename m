Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3CBC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 00:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H8wLDV1hb56J4g1qGTPdYS2+5saoEpO4u3c0/B+uqvk=; b=T3s4/8LeAGr/zX48Ck2Gz57DOK
	4fsWmX/0p2SEznwnfGjIvRgtrBXsEKizGchDIzM7tkN+41S7gonqKxUvLVHEpUs3YBgcMxeT4TyEx
	eiyK9pez6ZICrfaxrqu+CtLv9ulVgemm8eDYgttpZqYqiFwR604Oi99/K2wzY19EoknlrvYZC9FkI
	npd4UtjNDVczPvdSWZ8kKYCLGskLPn+Q6V1fSlvXVSU/G4ZMJEN1tHjzUlTr9WCrGqCpJTMCq8fRJ
	ae8MtrRl5wXsVt5+39jpC3DpyMugVGjhJ7eygVZfg6aZqET62hB+aj+RgObz2u5O/vh0rjfnrsdYb
	7RL1ZghQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u71D0-00000005RdI-1X9J;
	Tue, 22 Apr 2025 00:09:54 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u71B7-00000005ROQ-1igR;
	Tue, 22 Apr 2025 00:07:58 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6ecf0e07947so44899436d6.0;
        Mon, 21 Apr 2025 17:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745280475; x=1745885275; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H8wLDV1hb56J4g1qGTPdYS2+5saoEpO4u3c0/B+uqvk=;
        b=JwY4a9JVJwn2SJ0+LbSwRbjEOhq5ubnoJkyJviPpBiA8GTYLj5FmUnFgYNQIkJ8IHD
         FMeI8Yo/l5u2lEN75cOrD9EWTnvd9+fU9Oi6SXdZSPWeEws1eICp/mlbFKedqossCQPO
         136EwLHQbgX1CFOeunvdC3+HYVMw1bTRm70MIAc2MYfHIT7KB3gZtRkbX0twE8ZKVXKM
         8fx1TqoP6CafwYx/Qm7/Zekn9gHqeo4XRrWGUG7duJtEs+bMBjA7buVlod2hzStRN7qT
         zK86L436HgfF1p4FPj2eH1PDE8WsCA5u6OdG1TEGo0g50AEDi2GSzGxHPDX07HbmMgNN
         TvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745280475; x=1745885275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8wLDV1hb56J4g1qGTPdYS2+5saoEpO4u3c0/B+uqvk=;
        b=n+y1wedxnXaVdFTIinklS7Ij38WSpd+FxhXPqWln/HUr86r9xcgDLmed8/B67oJ6Dt
         yq9U2N1Gl8dUo68A0tTC/m2rz15W1/NYgXPZq4CHQxKO/AuupGLvtvi0jdK1Rj4k0HPN
         x/R78UcpWgz57U0G9dG1KK+LEzmq+6RAwPemujztV2xPco/3+dqhCsO9Aed63zWHFdmB
         UjZf2r+2JibdTOvaC7pMGUf+opvXbZBz583Ly/sEIDp0WSQLBy4uVDOV+jXp9NBwzQX0
         YQn1h+PWLvA3YOJGvLJ3Gyq26waiehpl5CR3IoH1ama3xKETWMXiPIBSa4awSas7Qsjs
         7aDw==
X-Forwarded-Encrypted: i=1; AJvYcCULmvtsR+0TnJd1txevnPKTbtBbnpNc2a9RjZtG9LAqnTXEmJt+/1nBd2JbE2ZrHr69hnPKLIVFoeAVH2GUk50=@lists.infradead.org, AJvYcCVqaeNykpSvZQf8sc1sIsmB60QEgObqg9NdLb7TYcwnlXfsNtfKUdA0cuOYDQluchYgiLo2FOSXsqUNEK0QTFiu@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5Jrf1SImtpSvJAHe2TrlFcT95v0JK9igNulhT65q7jaeBwqel
	xmV+O6WU5bUq2WP3amsNC80XwG+CAYm4JScBe/qdvklym5LNWZI0
X-Gm-Gg: ASbGncsGnFmvAdNRcesLYytoQ1hqgloH7152+YAquPsTzC+XdBTkSQIJcOEfMl7UynV
	PTH5sVLzqPsM2b3CcTjL220NM2UUE5iWGRhlLH2NHIeVhg3swLbGmJN9/IerHm1crOpqIoVes9H
	PxR7KeXS9a/cNJ2L7PI/DfZBcSyMH40+hR+6HnTdCjTjFZt71pnY+ycJyYV5PI+x38iyHLC/vgn
	y0PCo4GxDhChKMnpQ4TGPRn0uKsMVEb2MAMUw2zzOhADa5yk2FIF7Eh/HePwylnBkdMrWk0sT+H
	JxqEX5tk6iy6vf8RM+hBgQOnetilA1Z8kek/0bzqatbvworO+a7V
X-Google-Smtp-Source: AGHT+IFfDWwvneQduY1xpp0BmYEQ8b2EqMecuS/b3VvGJHRaIDr0uNIu9yTru25IprQs8WvetVgDkQ==
X-Received: by 2002:a05:6214:1c84:b0:6e2:383f:4acd with SMTP id 6a1803df08f44-6f2c4d8b11emr226098736d6.7.1745280475490;
        Mon, 21 Apr 2025 17:07:55 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b0f11fsm50085206d6.39.2025.04.21.17.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 17:07:55 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: sigmaris@gmail.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	mjuszkiewicz@redhat.com,
	sebastian.reichel@collabora.com,
	jonas@kwiboo.se,
	John Clark <inindev@gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: rk3588-nanopc-t6: fix usb-c port functionality
Date: Mon, 21 Apr 2025 20:07:48 -0400
Message-Id: <20250422000748.59664-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <bda07179-1ff4-46e4-9dda-ece9c63fd613@gmail.com>
References: <20250419023715.16811-1-inindev@gmail.com> <bda07179-1ff4-46e4-9dda-ece9c63fd613@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_170757_468178_909CB552 
X-CRM114-Status: GOOD (  20.60  )
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

On Tue, Apr 22, 2025 at 00:12:02 +0100, Hugh Cole-Baker <sigmaris@gmail.com> wrote:
> Hi John,
>
> On 19/04/2025 03:37, John Clark wrote:
>> The USB-C port on the NanoPC-T6 was not providing VBUS (vbus5v0_typec
>> regulator disabled, gpio-58 out lo) due to misconfiguration. The
>> original setup with regulator-always-on and regulator-boot-on forced
>> the port on, masking the issue, but removing these properties revealed
>> that the fusb302 driver was not enabling the regulator dynamically.
>>
>> Signed-off-by: John Clark <inindev@gmail.com>
>> ---
>>  .../boot/dts/rockchip/rk3588-nanopc-t6.dtsi   | 21 ++++++++++---------
>>  1 file changed, 11 insertions(+), 10 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> index cecfb788bf9e..8f2bd30786d9 100644
>> --- a/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> +++ b/arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi
>> @@ -174,8 +174,6 @@ vbus5v0_typec: regulator-vbus5v0-typec {
>>  		gpio = <&gpio1 RK_PD2 GPIO_ACTIVE_HIGH>;
>>  		pinctrl-names = "default";
>>  		pinctrl-0 = <&typec5v_pwren>;
>> -		regulator-always-on;
>> -		regulator-boot-on;
>>  		regulator-name = "vbus5v0_typec";
>> @@ -465,24 +461,30 @@ regulator-state-mem {
>>  &i2c6 {
>> -	clock-frequency = <200000>;
>>  	status = "okay";
>>
>> -	fusb302: typec-portc@22 {
>> +	usbc0: usb-typec@22 {
>>  		compatible = "fcs,fusb302";
>>  		connector {
>>  			compatible = "usb-c-connector";
>>  			data-role = "dual";
>>  			label = "USB-C";
>> -			power-role = "source";
>> +			/* fusb302 supports PD Rev 2.0 Ver 1.2 */
>> +			pd-revision = /bits/ 8 <0x2 0x0 0x1 0x2>;
>> +			power-role = "dual";
>> +			op-sink-microwatt = <1000000>;
>> +			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
>>  			source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;
>> +			try-power-role = "source";
>> +			typec-power-opmode = "3.0A";
>
> According to the manufacturer wiki [1] "Power Output Capacity" table, the USB-C
> port maximum output is 5V/2A. So I think "1.5A" would be a better value here.
>
> [1]: https://wiki.friendlyelec.com/wiki/index.php/NanoPC-T6

Hi Hugh,

Thank you for your feedback and for referencing the manufacturer’s wiki. To clarify, the line in question:

source-pdos = <PDO_FIXED(5000, 2000, PDO_FIXED_USB_COMM)>;

was not modified in my patch. This value, which sets the USB-C port’s source capability to 5V/2A, is unchanged from the existing device tree.

Furthermore, the schematic for the NanoPC-T6 and the vendor’s upstream Linux device tree (e.g., FriendlyARM’s kernel at https://github.com/friendlyarm/kernel-rockchip/blob/nanopi6-v6.1.y/arch/arm64/boot/dts/rockchip/rk3588-nanopi6-rev01.dts#L346) also specify the source capability as 5V/2A. Given this consistency across the schematic and vendor sources, I believe 2A is an appropriate value for this configuration.

Please let me know if you have further concerns or suggestions!

Best regards,
John Clark

