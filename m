Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9553ED1CDC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 10:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7jqYN1k2sIIVDynNkGogy0+4dYc363N58InYK+olTwA=; b=i2j/2VPQ5cCPO0vCDsL/1/xvY/
	sMvZYd2l4M7BzeQ6QxCLrPsxaN5CYr0yQN9mZM3IxppuEUEK2W60UkvcL//8N9NGa6/5V5Is4BDxr
	ZcJ0f1Cv5NykNlzKU4HME84/U0pXVbShcayC0L8/XZ9AGY9Z2clHax1w1dCXMvidhEWmPqshYNWvv
	gKcCh0DSp6bM3cUDl2x4PucfGOMQ/pq5kdBBQbjrTcInZA5ccFnphIibAD2mc2drUlsRQZmVmDtW3
	lt5qnl364KL5YxxvQRjiNnSx5QNHKxm98bTdQpVDqCoMlK369Q7rDe6Ny9x9JHa756TYE21GYzjwI
	Qqs6B3QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSumC-0000000E5hI-0cOj;
	Tue, 09 Dec 2025 10:17:00 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSum7-0000000E5gP-33AJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 10:16:58 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-42e2b90ad22so2012399f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Dec 2025 02:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1765275413; x=1765880213; darn=lists.infradead.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7jqYN1k2sIIVDynNkGogy0+4dYc363N58InYK+olTwA=;
        b=GLXW8iPHDYxdzDoJsh0rS2n4wtm89TT9jshfn82U4uf4j2796IaLj8gzQo9gDwG6Kj
         VEUs+chQK2kdg7E49aZhSRmhL8I44q0FuCq8E/s/v5DMF82OKukBGUveHou/XMvJNKk+
         m6zyuI80bYRtkDr27NWNNB1388pRjDtsuuiGvT8rkpMfKY3GnaN6Ql/Dg61knPhQ5dZy
         3N6hhaVaSmi2jgAaU7nhSTp0jOiRxMpC2noxLonpXKZRTzWeeATt13uiXSdyzayM1cND
         nlAL/Ql9lzLuJZWk8R423D858hGZeg++fY9Ta8oqt1EQKtivEbTi+0k/Fbw8eaImLjk/
         goVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765275413; x=1765880213;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7jqYN1k2sIIVDynNkGogy0+4dYc363N58InYK+olTwA=;
        b=CgXg7QMbeB8T87hbLSou3AFnadhvhBkOayoMNFIMksUINLmyVS/b1+NeMHXXV0EDZz
         R4qEsbSq/VJMVpIJ5+XMGyU2LqVKOdX+TLRNtRwmppjGFJ1hTvvxg3o36TQVpTAkt+uV
         Az8uQwGJLiG5h4eV0H5xEcug1b4XciI1c1njOpSVYDShYO8eM7a2w876i6fViHAqK6cW
         0LC+FKbSbMBdieu39XErpw+gKvfrJcMYyA/DFpk85HztFFgD+l8P+XMgJx+uvLa0BAOw
         M4PMynPcqQq1maa7r5UdE99L2Ckpna1tcPl5wRcgTrbNPlznjwDkjDju7XZ6kioFoTIC
         fLkA==
X-Forwarded-Encrypted: i=1; AJvYcCXf5hjgb4GbeA1K5A9LRBXAQpblC6XMdNf/ikv5mOBpzyQjVpr/u2aQ8mGNvRO2agOPQy1NOC4ItsFScWaA6Kc7@lists.infradead.org
X-Gm-Message-State: AOJu0Yxti2peq8mZJdxXlgJT4qFwsUrcH8swbN/AV+Gz67Tf/qdseCQM
	m2qHRzxvmBhfhUtYH8Ucm33ybHqwuR8j74g4+GymKnpMkJTboBWBTjCcCTaeLCNUi3U=
X-Gm-Gg: ASbGncsgdf+V4SPNyi7Zp/sSs1/n2twCxpXSiEnUZsj9f6blUdKxnTGSjbwankzSvr5
	37LlplikXHzodnsgcIOkwkGAA/Wzus7ESp6wH5VQ34DYH/+2ci6blR3OYSxJbP1ahasvuKmQkVl
	Z0GqzHEn7HI0+BNNI2MPApgLuzxiD+g3jFd3dp+BG88vPjW/tuN2L/jvyR7hvDoPbxjXjQzqTfD
	6Jozv20YVyuwGBfDciCP8EXxsnNOURBUZCoA2AjXVmxNOdLGeOiZoUibHHw40gTUPxpbfueAZT1
	bq9QFYOY64ccNQO9iznVuDkoCMlwCeIUAO4Odh+N6GzmOe+Wdh/nzMd5TGlrk12JjDwpIPceB5p
	XUqwoWUfXzmC/SzqZbvm2qJXNMg2N7T2iioCLsh3tLsKl9mbersOLt6cjFnXWBBlFHQNJxyEjP7
	fCAv3Ur8Z+Gw==
X-Google-Smtp-Source: AGHT+IGYLG3rhZdJLL1r2IWmCryy/+X0jCUOg6jWuDZZCpYYA9nn3V/pWnZyhAXTJz8/W4BJn1NtMw==
X-Received: by 2002:a5d:42c4:0:b0:42f:9e8d:548 with SMTP id ffacd0b85a97d-42f9e8d1ee0mr1375634f8f.60.1765275413393;
        Tue, 09 Dec 2025 02:16:53 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:f9ab:1ddd:a971:a17b])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-42f7cbe9032sm28891327f8f.1.2025.12.09.02.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 02:16:52 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jian Hu <jian.hu@amlogic.com>,  Xianwei Zhao <xianwei.zhao@amlogic.com>,
  Chuan Liu <chuan.liu@amlogic.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Kevin Hilman <khilman@baylibre.com>,
  Stephen Boyd <sboyd@kernel.org>,  Michael Turquette
 <mturquette@baylibre.com>,  robh+dt <robh+dt@kernel.org>,  Rob Herring
 <robh@kernel.org>,  devicetree <devicetree@vger.kernel.org>,  linux-clk
 <linux-clk@vger.kernel.org>,  linux-amlogic
 <linux-amlogic@lists.infradead.org>,  linux-kernel
 <linux-kernel@vger.kernel.org>,  linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v6 2/5] dt-bindings: clock: add Amlogic T7 SCMI clock
 controller
In-Reply-To: <4f5ec838-f8d6-4c3b-94f2-b2a60cfe64ec@kernel.org> (Krzysztof
	Kozlowski's message of "Tue, 9 Dec 2025 07:01:44 +0100")
References: <20251204053635.1234150-1-jian.hu@amlogic.com>
	<20251204053635.1234150-3-jian.hu@amlogic.com>
	<20251208-independent-warping-macaw-74a169@quoll>
	<dd90b445-bafb-46d4-8cec-e0877cf425b3@amlogic.com>
	<4f5ec838-f8d6-4c3b-94f2-b2a60cfe64ec@kernel.org>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 09 Dec 2025 11:16:52 +0100
Message-ID: <1jy0ncvu23.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_021656_024055_51E00686 
X-CRM114-Status: GOOD (  24.92  )
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

On Tue 09 Dec 2025 at 07:01, Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 08/12/2025 09:40, Jian Hu wrote:
>> Hi, Krzysztof
>> 
>> 
>> Thans for your review.
>> 
>> On 12/8/2025 2:17 PM, Krzysztof Kozlowski wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> On Thu, Dec 04, 2025 at 01:36:31PM +0800, Jian Hu wrote:
>>>> Add DT bindings for the SCMI clock controller of the Amlogic T7 SoC family.
>>>>
>>>> Signed-off-by: Jian Hu <jian.hu@amlogic.com>
>>>> Acked-by: Rob Herring (Arm) <robh@kernel.org>
>>>> ---
>>>>   include/dt-bindings/clock/amlogic,t7-scmi.h | 47 +++++++++++++++++++++
>>>>   1 file changed, 47 insertions(+)
>>>>   create mode 100644 include/dt-bindings/clock/amlogic,t7-scmi.h
>>>>
>>> Where is any binding doc for this? Why is this a separate patch?
>> 
>> 
>> The ARM SCMI device tree binding specification is located at 
>> ./Documentation/devicetree/bindings/firmware/arm,scmi.yaml.
>
> Then git grep for the file name - there is no such compatible. Are you
> sure you follow writing bindings doc?
>
> Think how are you going to use these values. You will have phandle, yes?
> To some controller, yes? Which one?

For the C3 (I believe the T7 is the same), the compatible being used is
"arm,scmi-smc". It is a generic one documented here:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/firmware/arm,scmi.yaml?h=v6.18#n202

The phandle used is a subnode of that, to clock protocol:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi?h=v6.18#n116

Same things is done on imx, stm and rockchip platforms from what I can
see.

Jian is just adding the arbitrary IDs used to identify the clocks in the
FW. I don't think there is anything out of the ordirnary here.

Is there something else Rob and I missed reviewing this ?

>
>> 
>> Certain secure clocks on the T7 rely on the ARM SCMI driver stack, which 
>> is officially supported by ARM.
>> 
>> The kernel-side SCMI client implementation resides in 
>> ./drivers/firmware/arm_scmi/.
>> 
>> To enable ARM SCMI on T7, three components are needed:
>> 
>> - Kernel-side definition of ARM SCMI clock indices (this patch addresses 
>> this component);
>> - SCMI server implementation in the ARM Trusted Firmware (ATF) running 
>> at Exception Level 3 (EL3), which has been integrated into the bootloader;
>> - Device Tree Source (DTS) configuration for ARM SCMI clock nodes (the 
>> DTS changes will be submitted after the T7 clock driver patches are 
>> merged upstream).
>
> So silently you keep the users hidden? No, I want to see the users.
>

Is there a new requirement to submit the DTS file changes along with the
driver changes now ?

This has never been case before, especially since the changes are merged
through different trees.

>
> Best regards,
> Krzysztof

-- 
Jerome

