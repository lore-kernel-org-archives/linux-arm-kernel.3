Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45E00C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 13:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To
	:From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GT+QfWaXLUz2plhdm6tzk3KnJrg30pcNVb5s5dMBoo=; b=YJSfGqnmQuROrOOZ1dq7gsAxa+
	d8FekaOHNncheZQqVLzg4DcIi+lxEE4WLCFOu9K8eMxk0AAoEzfP/fB1vYT7BxxkbRJETBmAfcQrg
	3T0klpcAX/hlAldhf/2ufbG9Eew71j/m1fapl8q994wrB1KHYrI9zetZORJUXuO0Ov/YKsurMf3UV
	ynpsX/V9nl62fwmHtU/CCBDUzaq2zR1HsFJLR604dGZsCQF2lheQM540ghYD22qOoh2adAJWk1DKq
	Ib9wvrRkuqshh7K7RLEf1pRZay9bURCQPZm52cclvy2eN1CWgPF4iWUL4HrtXhh7at+jOs/rx8vqh
	JlLNJ7Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIzH-00000002FDE-06qk;
	Mon, 14 Jul 2025 13:12:55 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubIM4-00000002Ay3-0sK9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 12:32:25 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-ae3b336e936so852641066b.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 05:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752496342; x=1753101142; darn=lists.infradead.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6GT+QfWaXLUz2plhdm6tzk3KnJrg30pcNVb5s5dMBoo=;
        b=iVF656Zi1tlaOpU1mxZyzue539A62TIfvlZW24+iXhGirijMjW1rxXUFVcQPkhTIBv
         bSXF1ZisVSR0p7BlnmJJCxUux0NxLYSyToLSmTik9Jh7OMPx0IOM3BNqZpJDqQT0YR3a
         t3T8TTEHzCeSpN6TgS1WJY3aYqV1FQLD0MgCvJakO0woWg125FbSQXRWY0TSPxdPbbxl
         xchuBhx3qK4jErBjoLpFY6IWn8RwR7dSteX1xFgpZP69qYnn6NPzR/m6m7R1bo4XkwT5
         CCR1w84IiS16Uz1lCxLOElwuUR3gRrukvnesiCFBNOit5FLvWnrYUouBeoM+LIIp+fRq
         9cXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752496342; x=1753101142;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6GT+QfWaXLUz2plhdm6tzk3KnJrg30pcNVb5s5dMBoo=;
        b=w2EJRCxqAh/jS1Vvsaj5OjQZdeztuowLB4s1yLyQrBiUhufBQLlCeBqceWJzOcd2Qq
         4LN94exNHXVBMeRWLuVfqsywMOcUchWXCLGWYJRHXVP5ME/r3xtQrq6xF8/zdLQgRjA6
         Pfn7GEaFBPx59ro9abUbGp5DulTPPLWWNjqoV4lCYjL1QvQ46Xn8bKaGlO/qWT8t8EZ2
         bFpSuiSbl6/s57yy4oK1iZQwd14xXIeLMZL9jU+k2o54p2pJEW5kMKJYKEvSqnKfIFR7
         VSH/OJDehgMYeztW7P61P12Uo9qc72QZj7emmFB2lRyv2PnWXwJifICjjSBQoxeLaJvC
         y0DQ==
X-Forwarded-Encrypted: i=1; AJvYcCVI+xYffwbraREFWqKkzkzai1uLau5FZYfjPHj0BMIHPf3B4yLsLJ7S4A1hdohtCIGJuSPzAw0rxPzfVDK+gGzX@lists.infradead.org
X-Gm-Message-State: AOJu0Yyft+IvhCMrnE4xynsb3RZ/6LwewBwEjWc1zDzK77MpNgCInePT
	4DwH1AEB5SvZwDx/sZIRf5avAeeo9cZvx0MqmmZbxHy88elBLjf4U26asCZ5g95I3fs=
X-Gm-Gg: ASbGncuPQprX+ElI2UwqldJWrEbkQ/glOubVeqqcVFJXnLEvDvaJo9lTYyuEGC833kH
	2P7sPKpXcx0UJ5g8k2//IfEClUdS0dx0xEh0G2HgcnmoPVszqvWdvNxYXKbNbOhpXmuUlEKP5ny
	ugVP2isJ/EfAkzsGxDw26uS6teO72iCtFxKQGDFGtezcP0lbzm0CwdVUWB81tvNh8BCnrj2JAra
	gm42n2Iwn/dbBMi0dDTarMt2ooUIOTLAexldq08BUDI/RiMpt0Fpe+uqAmlBdnoQ/dL7sO8VHAn
	vxtlkDSIVx/xng7nUKqP+L44Ne1Hz/aE1LE4iR8abVeRCjY5BYY270aTLiWzdVcedWROsbb3lyf
	kzl8SorDP7mkGrJ9vBuWlVfjhtG6YhLAI1Ho8hh9rxkGmLPQXq+6cfWn4wB5hDLNaCKjoGsuoeh
	udD2msMPmqTUlq0r9XRw3x9EIFQ+EZ4xxWZA==
X-Google-Smtp-Source: AGHT+IEdIUlKAIUoH3odRS/w1x3zJL/78SxmRMa+QOLnmU3zwNSH9f5FMxlA1f2U3nn/eb6t4vkm0Q==
X-Received: by 2002:a17:906:7956:b0:ae3:cd73:e95a with SMTP id a640c23a62f3a-ae6fcbc356cmr1271518666b.36.1752496341821;
        Mon, 14 Jul 2025 05:32:21 -0700 (PDT)
Received: from localhost (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e82962acsm818540766b.139.2025.07.14.05.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Jul 2025 05:32:21 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 14 Jul 2025 14:32:19 +0200
Message-Id: <DBBS3S38CWTN.32RLYB9VEZAB@fairphone.com>
Subject: Re: [PATCH v2 15/15] arm64: dts: qcom: Add The Fairphone (Gen. 6)
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com>, "Will Deacon"
 <will@kernel.org>, "Robin Murphy" <robin.murphy@arm.com>, "Joerg Roedel"
 <joro@8bytes.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Rafael J.
 Wysocki" <rafael@kernel.org>, "Viresh Kumar" <viresh.kumar@linaro.org>,
 "Manivannan Sadhasivam" <mani@kernel.org>, "Herbert Xu"
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 "Vinod Koul" <vkoul@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>, "Robert Marko"
 <robimarko@gmail.com>, "Das Srinagesh" <quic_gurus@quicinc.com>, "Thomas
 Gleixner" <tglx@linutronix.de>, "Jassi Brar" <jassisinghbrar@gmail.com>,
 "Amit Kucheria" <amitk@kernel.org>, "Thara Gopinath"
 <thara.gopinath@gmail.com>, "Daniel Lezcano" <daniel.lezcano@linaro.org>,
 "Zhang Rui" <rui.zhang@intel.com>, "Lukasz Luba" <lukasz.luba@arm.com>,
 "Ulf Hansson" <ulf.hansson@linaro.org>
Cc: <~postmarketos/upstreaming@lists.sr.ht>, <phone-devel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
 <linux-crypto@vger.kernel.org>, <dmaengine@vger.kernel.org>,
 <linux-mmc@vger.kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250713-sm7635-fp6-initial-v2-0-e8f9a789505b@fairphone.com>
 <20250713-sm7635-fp6-initial-v2-15-e8f9a789505b@fairphone.com>
 <6f8b86c7-96a5-4c7c-b54e-25b173084d95@oss.qualcomm.com>
In-Reply-To: <6f8b86c7-96a5-4c7c-b54e-25b173084d95@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_053224_261617_278B6654 
X-CRM114-Status: GOOD (  16.05  )
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

On Mon Jul 14, 2025 at 2:19 PM CEST, Konrad Dybcio wrote:
> On 7/13/25 10:05 AM, Luca Weiss wrote:
>> Add a devicetree for The Fairphone (Gen. 6) smartphone, which is based
>> on the Milos/SM7635 SoC.
>>=20
>> Supported functionality as of this initial submission:
>> * Debug UART
>> * Regulators (PM7550, PM8550VS, PMR735B, PM8008)
>> * Remoteprocs (ADSP, CDSP, MPSS, WPSS)
>> * Power Button, Volume Keys, Switch
>> * Display (using simple-framebuffer)
>> * PMIC-GLINK (Charger, Fuel gauge, USB-C mode switching)
>> * Camera flash/torch LED
>> * SD card
>> * USB
>>=20
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>
> [...]
>
>> +	reserved-memory {
>> +		/*
>> +		 * ABL is powering down display and controller if this node is
>> +		 * not named exactly "splash_region".
>> +		 */
>> +		splash_region@e3940000 {
>
> Was it not possible to arrange for a fw update after all?

I've made a patch to support both 'splash' and 'splash-region' but not
sure when it's going to be included, I've sent the patch to the correct
people internally last week. Since Android build cycles are always super
slow, it'll take a the very least a month I guess.

>
> fwiw the rest looks good

Thanks!

Regards
Luca

>
> Konrad


