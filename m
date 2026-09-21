Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC90EC982E1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 11:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ycnprV0l+QiM05HZAYzXXqeG9wnBaUsBNe37TTIlwsM=; b=WOy26VLHi2wiQtH4tuNA4WR9yK
	p9ApW277g8aT+xwnBwKBQVkby10rJGpzB3KGxCO9/00RLNslNVTvDvQuQDWDA+MQQrMlMZ8mEVe0M
	8HTj6DkfQvVKuvRw+A0tCJWhL27Rfq6eTjCTz1/ydpOGyeZY/DZ/5Dys/6hquW2ZHKj1gxyxKLkR/
	QdtBcLk3F0wj7ucUvk/hWRAPVijrrg4QPwFZowsg3XLIzGw9m+bKTCg8y6SOSxBQjmzCplHKcGqMb
	JQZeOB5X6LpRTuMJv8/tpjgwbWDqqFaYTQuv2mSJQuxvjoGIKknaGMU8tFoGUTAsIjVU6A8RuldND
	7cQ7eTuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8brO-00000001pPx-1Sep;
	Mon, 21 Sep 2026 11:06:58 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8brM-00000001pPX-1kGv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 11:06:57 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747ee1f38so28464175ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 04:06:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789988815; x=1790593615; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ycnprV0l+QiM05HZAYzXXqeG9wnBaUsBNe37TTIlwsM=;
        b=ZRd3X+gHH0Zt6K/NRtXXKXkFWVaWwcVQPGMUV1eqjDd8kNecyzRZrglr9ATB2c5/t6
         Su87hKQabe48dYn+8qsrdwBo7lsXW5+eB2rW+070DblZsZo5l/MqvGdZEYiBmKwA8T3V
         Vb/fCKls9YRVWt6jQJ/L9JjiK681JOS7hEbcPD9BkgkBiZDYsYgtf8cx1lrp3oP/VitY
         PvreySRkLARIZ62HcZRRtuBJgTzFNzVL+/S32rWtPcssAIUfZTxNsSalIoUsaHaAyaLD
         gm/F+Y0AyTrLH4voqh3IMLF7qS8k/La0gOLL5l8bbi9RRMreYCoyYk4GpgIaRDPuw8K5
         zHiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789988815; x=1790593615;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ycnprV0l+QiM05HZAYzXXqeG9wnBaUsBNe37TTIlwsM=;
        b=Znz2CwZrbNnwvoOGx5+QKb7l5M+Pluh5wqeJbSaAVd6X9l2WpbXNeQ8JeCMDm1ExX8
         vfeUb6+OHyqilMJ5aq0vUL51FgYvoeG6J14JKV04jToiPts948RVOWKyGBUmMosaBynj
         vn1xltysUYcC1rFPwd3xXUbFEpqXt80ZvZ5OHbv5zN+awoMksjCJpdAOaR4TKyGEzLVN
         fr3vNkCDKrGHPESSXi4Hvv/L+mQBESJXPxGmWFDyeQWwXMef1oB7bo1xiSkAXrZP8nom
         sNG0T/W++Uz3Mib3quURFJM8sRK68AUqUrx4s48yp0PYoTN1LjIO5dTBwbigl2Zebnad
         4iGA==
X-Forwarded-Encrypted: i=1; AKwUvBxmTqquvZwQWQU7rw2rzLXwcaThwJVKyZGBzK8Cstg6HTtCFHIypbfJ6vHQGqE+x5RkY4MygLhEdd3aWNjBxXRK@lists.infradead.org
X-Gm-Message-State: AFuF++laz94pfaJOQ9qcRCODJOACSm3mhvSHkygElWMEZaAJg04jEaAw
	ARW9yxdgS5HifanDxw2o/G/AU/QNa7GfP4tNtLQEam89I05L7UMbKmdx
X-Gm-Gg: AYBFou0W7tPgBqLTiTne83UN7gxXiianVE5jpMlWCpIOdaL662oiJUpsmZQhfc0kdiM
	RJu08BCX/T4tmYPIxpMu9N8NX5M5VgCDwwRt/xk9paEaxX9zp6iUs0qK8vMQN8xHPr92dKrj37G
	Kr9uZPK8POyCafnOPu79zrp0/g/bNLG9W3qE37bUxzONfXPpsx9D0O6aF0/a0lApwNpBHSqDOvs
	+u/wVGbGJr8Umr5EPAfsC5Jzvh859Z2sfZ9CIuMunsrJIe63tAjiH3SYRi9TO7QPZzTuzZ+tKRA
	S34l6z7eA6CVpFAmzPi5c7DPL6Vz/vi4XYBPztfaMd65hbnZuG1RUS3MTNjixJjlHw68mchjyy0
	8n2t3pHiPXqm9bkgVZzo+ciLsukpcwBa4xSlmKCiOslekPAMSEeif6CehD8mBCL5qnaEmlLByBE
	YfvUOR1/fprMay3XwV5Ii+62trhcNXRMWYc1kHFw67n8559lnF/IRkEuwjlX7ivI8UoalsW78CI
	BiRK2Cgd6994ixwJHMwtGVfRhd5wA07p8v8wpKKz3Q3MM82n8Uy4iD8k+oaNg==
X-Received: by 2002:a17:903:2447:b0:2d9:43f5:b462 with SMTP id d9443c01a7336-2ddb1b79df8mr144230985ad.5.1789988815140;
        Mon, 21 Sep 2026 04:06:55 -0700 (PDT)
Received: from [192.168.151.214] (222-228-113-186.aichi.fdn.vectant.ne.jp. [222.228.113.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba719sm31428165ad.56.2026.09.21.04.06.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 04:06:54 -0700 (PDT)
Message-ID: <17a74e90-27d1-4954-86a8-491267f00cb8@gmail.com>
Date: Mon, 21 Sep 2026 20:06:47 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Yoshifumi SHU <envzhu@gmail.com>
Subject: Re: [PATCH v2 00/14] ARM: deprecated platform removal
To: arnd@kernel.org
Cc: Frank.Li@nxp.com, aaro.koskinen@iki.fi, alexander.sverdlin@siemens.com,
 alexandre.belloni@bootlin.com, alexandre.torgue@foss.st.com,
 andreas@kemnade.info, andrew@lunn.ch, arnd@arndb.de,
 claudiu.beznea@tuxon.dev, conor+dt@kernel.org, david@kernel.org,
 devicetree@vger.kernel.org, enelsonmoore@gmail.com, festevam@gmail.com,
 geert@linux-m68k.org, gregory.clement@bootlin.com, imx@lists.linux.dev,
 kernel@pengutronix.de, khilman@baylibre.com, kmehltretter@gmail.com,
 kristoffer.ericson@gmail.com, krzk@kernel.org, linusw@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux@armlinux.org.uk,
 liviu.dudau@arm.com, lpieralisi@kernel.org, mcoquelin.stm32@gmail.com,
 nicolas.ferre@microchip.com, npitre@baylibre.com, robert.jarzmik@free.fr,
 robh@kernel.org, rogerq@kernel.org, s.hauer@pengutronix.de,
 sebastian.hesselbarth@gmail.com, shawnguo@kernel.org, soc@lists.linux.dev,
 stefan@agner.ch, sudeep.holla@kernel.org, tony@atomide.com, vz@mleia.com,
 thehajime@gmail.com
References: <20260914140821.1805449-1-arnd@kernel.org>
Content-Language: en-US
In-Reply-To: <20260914140821.1805449-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_040656_461269_0F42B33A 
X-CRM114-Status: GOOD (  10.19  )
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

Hi Arnd and all,

I would like to request that the core Arm Cortex-M support be retained, specifically for v8-M.

I'm heavily using Arm Cortex-M / NOMMU Linux for academic research.
In particular, I frequently run Linux on newer Arm v8-M (Cortex-M33/M55/M85) processors.
However, dropping CONFIG_CPU_V7M also removes support for these newer CPUs.
Because v8-M is highly compatible with the older v7-M (Cortex-M3/M4/M7), the v8-M support is tightly coupled with CONFIG_CPU_V7M, despite the name. 
The major differences are essentially CPU IDs and PMSAv8 MPU support.
So I need the majority of CONFIG_CPU_V7M to support Arm v8-M. 

Regarding platform support, I don't need Linux-side device drivers.
In my current setup, Linux runs in a virtualized environment hosted by an RTOS (like Zephyr) and accesses devices through virtio served by the RTOS.
I also understand that maintaining legacy MCU platform support is a significant burden.
Therefore, I don't object to removing the platform support, though the MPS platform remains convenient for bare-metal testing.

I am willing to help maintain this support, including modernizing the relevant code. I can regularly test kernels on real Armv8-M hardware.
If an active maintainer is required to keep the support, I am willing to take on that responsibility.
Please let me know how I can help keep the support.

Thanks,
Yoshifumi

