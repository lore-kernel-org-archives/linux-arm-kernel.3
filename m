Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CB7F532CE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 04:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7SqHnHYZqEYtwdh+YkC9S161bBgEEEQDmxfAGwav9w=; b=zMzZIgezdqDPtaaxTNUcukElF2
	lrxzNQ6Td3Pk8bBcAyNF2SDaHlbgBKW8/PurTKoL+YQ3m/DWhfNp2LUt9w8CVjMFibnzfuA8AyIfC
	hqVthJ7vh+vyPto3eFaZ3m0srIurCjHV12JdlfaaDClHyNvjpUWbKkAWaD2fB5SzNB99yMhWmMjUi
	5T5DhHi5aoV+6JKooFIjE5eqx1Of9nT0c6QZaKCxw9XGOyhIDAqPGPyu1tRWflBGSupNu1U3586D0
	YSH2ZIzhsVA7rMxdoREmtd9gwaaS2it7AlL0S7JcaSlySHn/Ntpzxq0Zx866+zrkeNVat0BL/y3G6
	RhvERRWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4t3K-00000000Wlh-0VJz;
	Tue, 24 Mar 2026 04:07:38 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4t3H-00000000WlL-2q42
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 04:07:36 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-82c2239140aso1237792b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 21:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774325254; x=1774930054; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m7SqHnHYZqEYtwdh+YkC9S161bBgEEEQDmxfAGwav9w=;
        b=NLKxMIr5y/++jQ5VMYUbzSMEMYyc3PLPqYRrFM2rhYsBM1JRTaHO9/ikhjVyrkgBZn
         nXF43jcfJ64VG/eTMxoEpAStpcVEXuMZGzWgVbAtP68SZlxU+ad+5YOrwMKfqmAQt1/s
         ET4QoBT/HMdctFRMVb2LKkOifs1DQybIjKAnHrKNSoqRg2TTiUSutP4ebT8TiuDKnITL
         sVr2WNelf+mqMGVQ+lk0wDZ1bDxwjWxty9IJSq3oohu3aP7TOh8GH2Dy136Qecs6WC4W
         o0RqCossTFWXswUs1URAAOWd9PUggeZ+c7XmHIMMp3AGuRXYH38mcCoNcVGq1cPQmOL8
         PTEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774325254; x=1774930054;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m7SqHnHYZqEYtwdh+YkC9S161bBgEEEQDmxfAGwav9w=;
        b=V8YIgBIFNBGDE2xJ6Ia8Dtc6HENX3EyrN97D6bendCHjpFYJjgClkin+aR7oTPu2MB
         TQqCaw0oa6i/WiFCN/SXSWEUhasdhk1xF4YyqyHZ6BYG+MapZYO0eTLkbeSuerF0t9lh
         Re7ohVVzjpBWplVRCgE/2Zp9qLIi8owCAmSyeDyszw6sRctRboNxUXugJ8uD61zYRtS7
         iEK73DtE/z/X7vYbRwIRyC7MbZim3WVasMg8GzFRMQqiFimaNdEr5OuhuqQJTmUZOMyL
         xxjehzlB0Kdh4wng/ZIWSxXGHhaVcaD8ewVdQIsLnDDPYLhrZ2IxKZL9ClPegFYrc/a4
         pLVQ==
X-Forwarded-Encrypted: i=1; AJvYcCWP++UqY5iDx+eDa7UbDUWWcg1quUmEcp75ESd69Y8PxQ0e0R4WW+qWaKFFmFa0ei7aAoXZ1j0dGjWEkCHs9GlK@lists.infradead.org
X-Gm-Message-State: AOJu0YwMWGrQsRGPGlBel2SFGoTpbp5zReseay6C+g3hTcMzyiAUQMuI
	ejmdshxx9zZdMyxOgmL//2450RHX6SaD55QNoigwEG8eMQWL0heVy52CtyzW18kcY/s=
X-Gm-Gg: ATEYQzwdwgCtp5twF9fh+gYXWvoh0Hh6+gWmzFIjJnDQab47T4RZlQfkBrM0A4HIN+8
	XTFZXtJKPxpJdQI3LkGE3+RPooH19NfyaCLpKpZda2CzbNr5FJyM/unhhoIHRDY8NL0nFtpfGYu
	SlwhVxmyEoDAMZYJI4p4ydRd0ZbLh7RSSkBIFGUUTYS3xsrOx39iFijvmziwS1mIkY9F/2hqkNu
	VRXcUbOh5+Tqy/OXnSTJmADW/RD/605hrvjljsnhaNTWKwR1dhgdeKJn4sG5c+Okm4Nv6Ssqomg
	fl8OCzMJNnNbvvd/2CmRKLDh65SqtrlAWxTtsmxaPgDdAMxbpT36BGtDI9ADbZqcER4u3NOFY4h
	g4Ersf9UvV9j6H3tjzivrwJs4i5UTmk+rwSe/4u+CFrbIzgKHFU0H8yxLJpvO40FvkFI9CwmWgb
	017+9p1gdCF3s0fX4hW2jPkkqq0wXatlyNthY=
X-Received: by 2002:a05:6a00:3bec:b0:82c:2155:5b6d with SMTP id d2e1a72fcca58-82c21556203mr7996673b3a.12.1774325253941;
        Mon, 23 Mar 2026 21:07:33 -0700 (PDT)
Received: from localhost ([122.172.81.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b0409bf65sm10979176b3a.34.2026.03.23.21.07.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 21:07:33 -0700 (PDT)
Date: Tue, 24 Mar 2026 09:37:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, vireshk@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com
Subject: Re: [PATCH 0/2] dt-bindings: thermal: st,thermal-spear1340: convert
 to dtschema
Message-ID: <n6jllrlsu5fatso5geeyjgiuefzj7qclkpsptgpowdy6splnip@re32x6zwepsp>
References: <20260323133814.14152-1-krishnagopi487@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260323133814.14152-1-krishnagopi487@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_210735_734916_2D1B572D 
X-CRM114-Status: GOOD (  12.60  )
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

On 23-03-26, 19:08, Gopi Krishna Menon wrote:
> This patch series converts SPEAr Thermal Sensor bindings to DT schema
> and renames thermal_flags property in spear13xx.dtsi to
> st,thermal-flags to fix the unevaluated property warning in
> st/spear1340-evb.dts.
> 
> Note:
> * This patch is part of the GSoC2026 application process for device tree bindings conversions
> * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
> 
> 
> Gopi Krishna Menon (2):
>   dt-bindings: thermal: st,thermal-spear1340: convert to dtschema
>   ARM: dts: st: spear: fix dtbs warning on spear thermal sensor
> 
>  .../bindings/thermal/spear-thermal.txt        | 14 --------
>  .../thermal/st,thermal-spear1340.yaml         | 36 +++++++++++++++++++
>  arch/arm/boot/dts/st/spear13xx.dtsi           |  2 +-
>  3 files changed, 37 insertions(+), 15 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/thermal/spear-thermal.txt
>  create mode 100644 Documentation/devicetree/bindings/thermal/st,thermal-spear1340.yaml

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

