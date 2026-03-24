Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0C2F54AB8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 13:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iKCvDxPU4e1QcvYZGXsXfBq0hdgl0iM7/+HP8gM9eA=; b=MeYwHixt6orFfIab3e3sAy+w9X
	NVaiafCphJ+1bVJysLDn43XdRdv7O+iszt3bjzYdwWqcy5oPBe4oVFBVko0TMPpl977gFr1JeMyED
	HS0jmay6b6aUmd1HuLo4pPCkunLZkp1Kd+7IPmuwrWhpS3qRnRmNBMlKIKAB+SxhZIVJngqze4yKH
	MjJH32QOlMTrQP885GB1fhn9J21FSoFTnMuSXVDbOlWYSzfNx1t1SWSZcvma9Bxt4zQb5iXeZY0TT
	+v3j3qr4o265NTGnFwxz0afNCjIhak/8F+qbCQMeevOFM7yKB4RRmiWw/5X89uzD/fFor/SFvQPIv
	GLj0ddxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51qV-00000001Y7R-2tau;
	Tue, 24 Mar 2026 13:30:59 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51qS-00000001Y6y-49Mo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 13:30:58 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ad4d639db3so17527395ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 06:30:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774359056; x=1774963856; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9iKCvDxPU4e1QcvYZGXsXfBq0hdgl0iM7/+HP8gM9eA=;
        b=VEsovAkvc2XQ7Hf/SJkOPZ5/mS38ErNQ7viiA+9dhqU2nLsG65t0Y7q2bYSvPjZen5
         K4/Cjre8V9BKqdN8xgRx9ENx8XcsqQDjvIYhSD5ze/uG2oDV7hopSInfzE5GRGCRe7/h
         632k4SA8WKyNWhOqXgmcF0g7vkhF/N8X3VgRgGF3XLrdHMBMvx3DQ8/x4N++wQ3Zr16q
         AQlEBmTRUKCywivoeza17zoGwLXvJVHqlu9wJmoJ78izpt5MFfgc3yG2M1aBLJ+HgCP7
         eXs7MEA4WzdYImLRID1Fzf53vURrM43KYvHoiGjbBz61lV0b/VA7K57wtajvZi/Cypd/
         CL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359056; x=1774963856;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9iKCvDxPU4e1QcvYZGXsXfBq0hdgl0iM7/+HP8gM9eA=;
        b=S0A9kGA6IRTsMdOuRjC2B0z+agzGkO1/T93F2gWKHvhNnpm+weqT/KnHwsXvZzbMDU
         9CjXqLRxZ0xm36MxyhhKKtiYtURQVTp/X7IPTBs0Oy+g9bPQgu11ln1Qcx5dUhuH7wzW
         eq4/r8QKLOFo+RG0f/ZUK5159pg8AqhnACER9sWW0Yjx3njC4VDfnLewuVgbZZbQvhCx
         xqHdAsdtJreg13vcnaJwOCuWbOHcCfWcHMCs2TPj/1PcVulBkdzrWAhGfl4y9Qyc7QU8
         fIr/zCW0DNSNPXAv4Rz8ecqBma6jXYmAEt0UZzG+0rgRcVbQTexD5TrZCesahrGVAddl
         fMyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYXRnuuHgkUxDfCggiw8osds9TQYQNV8B4yPFPPJ27Ngclr9Nq1ng13MIZDYNO6PlIn/40LvtMN0QEPrc1vSY3@lists.infradead.org
X-Gm-Message-State: AOJu0YyItTJNKfKybYltWfsYHrrBVKVJlwKp/5/xByEtMl5m/2KURSvx
	uySFqzWYZdts1+xpM/+MTOtdG2VxMrfawpMwsLUUIdEJXlPJ5Md1A5rE
X-Gm-Gg: ATEYQzwyRsjOG/7XTNkePnbrOSKwvAPSR3CAg/lTEL1+kDMZE5lH3Xnodb3NV/JsBs/
	2ddGlyJKF418tiCye/MWDpEkz6kWVm4R+esCKG72Nsf4yzHwOKY3UN7IOmqbvAkiWiUVa03tVrr
	VVyJdpErgmsS3MQrf2L1NvnmG81u4b99pYzZ0dXoZlbC4IV2m3FshgST5mNcAvH6+k4A9C6aqbi
	9j/2RUd2pMBbZklElhEv9MBkjMm8A0vy738swj4nmHYzGJbIlzdJCismSPKZsb557XjcLeS6i3k
	6Vjjj8YawhcP3GPKz38BdHG7h6eW+4SzJ7HjWxxN81ZEFvMI/+GnQbL6OGRiIOU/lDvGjscUvus
	E3gfighyeayw19f3B6ah0PpR9vtdShHmLCO9D3qpZ6p7o14fQJUXMM9PNq7KJPS1+KI2v/iCSWM
	iUM7Zl6VuZfBQTmEdD/d8gN3ljnTm9nX6w/j9jEsusgRzUjBcvuYNoCXWVOOI=
X-Received: by 2002:a17:903:380b:b0:2ae:504c:ae8a with SMTP id d9443c01a7336-2b082724a85mr165419795ad.16.1774359055635;
        Tue, 24 Mar 2026 06:30:55 -0700 (PDT)
Received: from localhost ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a7ffafdsm9821747a12.7.2026.03.24.06.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:30:54 -0700 (PDT)
Date: Tue, 24 Mar 2026 19:00:49 +0530
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Daniel Baluta <daniel.baluta@nxp.com>, rafael@kernel.org, 
	daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com, robh@kernel.org, 
	krzk+dt@kernel.org, vireshk@kernel.org, conor+dt@kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, simona.toaca@nxp.com, d-gole@ti.com, 
	m-chawdhry@ti.com
Subject: Re: [PATCH 2/2] ARM: dts: st: spear: fix dtbs warning on spear
 thermal sensor
Message-ID: <acKEJrB6vc9wfd1k@toolbx>
References: <20260323133814.14152-1-krishnagopi487@gmail.com>
 <20260323133814.14152-3-krishnagopi487@gmail.com>
 <20260324-smoky-radical-hyrax-1274a9@quoll>
 <cd3400ce-295e-450f-b650-6715142ccbde@nxp.com>
 <5a9f84fe-5827-48e7-8e4e-699cf8ae4776@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5a9f84fe-5827-48e7-8e4e-699cf8ae4776@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_063057_036980_1A5B15B1 
X-CRM114-Status: GOOD (  34.78  )
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

On Tue, Mar 24, 2026 at 11:01:05AM +0100, Krzysztof Kozlowski wrote:

> On 24/03/2026 11:00, Daniel Baluta wrote:
> > On 3/24/26 11:26, Krzysztof Kozlowski wrote:
> >> On Mon, Mar 23, 2026 at 07:08:09PM +0530, Gopi Krishna Menon wrote:
> >>> Running DTBS checks on st/spear1340-evb.dtb results in the following
> >>> warning:
> >>>
> >>> thermal@e07008c4 (st,thermal-spear1340): Unevaluated properties are not allowed ('thermal_flags' was unexpected)
> >>>   from schema $id: http://devicetree.org/schemas/thermal/st,thermal-spear1340.yaml
> >> How is it possible if there is no such file?
> >>
> >> Did you just add new warning in patch #1 and then claim in patch #2 that
> >> you fix it?
> >>
> >> You completely miss the point why this change is needed: how could the
> >> DTS work before? It could not. And that should be your justification for
> >> the patch, with explanation why it could not work.
> > 
> > Correct me if I'm wrong but I think there was a hidden bug here 
> > 
> > drivers/thermal/spear_thermal.c:spear_thermal_probe:
> > 
> >       if (!np || !of_property_read_u32(np, "st,thermal-flags", &val)) {
> > »       »       dev_err(&pdev->dev, "Failed: DT Pdata not passed\n");                                                                                                                         
> > »       »       return -EINVAL;
> > »       }
> > 
> > So, the driver was checking for the correct property as pointed by 
> 
> Yes
> 
> > 
> > bindings/thermal/spear-thermal.txt but the dts was using the wrong
> 
> No, DTS had two properties - correct one and incorrect.
> 

Yup, spear13xx is included by spear1310.dtsi and spear1340.dtsi both of
which have st,thermal-flags correctly defined. When working on this
patch, after converting the binding, I ran dtbs check and upon seeing
dtbs warning immediately fixed it thinking it was complaining because
st,thermal-flags (thermal_flags) was written incorrectly. (Which is not
incorrect as st,thermal-flags was there in the final node but there was one
additional property named thermal_flags as well which is not allowed as
UnevaluatedProperty is set to false). 

Also I dont think we have to override the st,thermal-flags property in
spear1310.dtsi as the flags value is same in spear13xx.dtsi and
spear1310.dtsi (0x7000).

> > 
> > property name: arch/arm/boot/dts/st/spear13xx.dtsi » » » thermal@e07008c4 { » » » » compatible = "st,thermal-spear1340"; » » » » reg = <0xe07008c4 0x4>; » » » » thermal_flags = <0x7000>; » » » }; And because this check is wrong:
> > 
> >       if (!np || !of_property_read_u32(np, "st,thermal-flags", &val)) {
> > 
> > people really didn't notice it.
> > 
> > The check should be:
> > 
> >       if (!np || of_property_read_u32(np, "st,thermal-flags", &val)) {
> > »       »       dev_err(&pdev->dev, "Failed: DT Pdata not passed\n");                                                                                                                         
> > »       »       return -EINVAL;
> > »       }
> > 
> > So, this actual patch has uncovered a bug! 
> 
> Yes. Driver also has bug, so probably was never working. The point is
> whatever commit is doing, the dtbs_check warning is not the
> justification, because it was introduced by this patchset.
> 

Please correct me if I am wrong Krzysztof but should i send a seperate patch
fixing the thermal_flags property (Not connected to these converted
bindings)?.

Also, is it necessary to set additionalProperties to true? I am not able to
figure out if that is needed.

> Best regards,
> Krzysztof

Thanks,
Gopi Krishna Menon

