Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1405C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 16:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqiCINUAAonn0m4tpf2qCa2aEvL6DZ5ftKVEWyb5ynM=; b=vig41D41OEkDsXjQx1U7rV+VdN
	s7XNBL0RyGtHNexhyAWm+fZsEuxUZjc3FrIadYan76dxQqRqHoympS02pcdEteFKk7n97oH2VVCDR
	ljnhhCQAHGn4veFczuhSw4NzbrUJOmAjF/OPuAcpAYRMn7wCKzwvWrew8E2c0Bhgl9vmaaYCsofeJ
	dlv4TB618OFTHK6mw79vY210cOLfheb7GH8DG7gfyaJso+rhQ16UBFV2O3a0VrIBmWOrvHbmdQJsv
	s3ky1VNQObBujVSOUsH635nezux06S6tp/pWhUHw5u4Cu0/Fu4LO//fpr2DjnECIbfYP7CP4v9EVu
	0IA3z7IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8Lou-00000000BpL-17fI;
	Fri, 25 Apr 2025 16:22:32 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8JFu-0000000HJRK-12Sf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 13:38:15 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e5bc066283so3934560a12.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Apr 2025 06:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745588292; x=1746193092; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pqiCINUAAonn0m4tpf2qCa2aEvL6DZ5ftKVEWyb5ynM=;
        b=Shpm/eWgeaVH9+3JfvrtVGcreaILgljXlQFAcZemzc0rUalISO4R0fy4bic2qD/p32
         HqLhaRxV7eaWNrc1jPMbCn7haxdVW5OyHWVUnj5JAn+racc/ceT+N5tjTYbAaAbiDX81
         kcpHj9pSvqPWVGWcmxrcik64IiwLcJrF4wquwnkNdfiDV+xXYfNqv3j7qDtW+jH9s8qF
         QrRuYncXWffq+XHiArB3iOKGVc+2Z35615c+Ni29f6bzVACOI98Iqz3aRpIdRRHb5IVE
         wsGGh8jmCy1no/ZxFq6l7++ytxikElgjMKwWtaDHyeB/SV1b89PU8NypcO/54FbMHPKn
         QH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745588292; x=1746193092;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqiCINUAAonn0m4tpf2qCa2aEvL6DZ5ftKVEWyb5ynM=;
        b=D+PYviLm6vhQQyIV8y5gREAqZS+wwz/5KL6qxBIQ6E7bWD/k93KJrplpdjf6FJy6hW
         +P71817y5P9dukthCo5FvRMCrbleDQnKTmtBFiyrwA8U3vkaea+obWOuCCAS5H26Lh7a
         4fFpVTF6hkKALvk0DjXA3x/oJ6DRT20r8OJIVY6EqXMydAHZoCE7631DAUiNb7hIPHTz
         N+u4kwEHUDHSTcrTqmCyXqMrooZJK8RRE0YX975nS7ZBkuISCUywZSKqo7mYpyShn03q
         K0hF/gI5pBE2+FVxxJzLybPtIXldqWOhl2wrRiKTJ5lcA0IIpIOVUMpCB8FNq2ARGTLN
         Xinw==
X-Forwarded-Encrypted: i=1; AJvYcCUrKbohsDY6Vz8SXFVXifHjILoYvdeoAUC3vW2fuV0PU1wY3zvsDagUD5OcfSnj/dTBhSGW6X4TZUZ8QQZPWrDu@lists.infradead.org
X-Gm-Message-State: AOJu0YwTjIosQJDho5bu33Ef9G/j3uETYQ8bgqGsB1XNf0SRCHN+9wjh
	Gm0tH1QieAdeCbn1ae5clZntpSDxgVyb2adOumcLBj2mr+DhOcKx
X-Gm-Gg: ASbGncufDZmTx2kRZy41eA6ObYbZcUQqOaQoUik7mk5fxMH+GoA0VNuuobjin+X5Vze
	5FVFguc0FLF8Vr3FriKrdHjybcs3UUMASXL416l03APrhVgsbL1jAmXgJgP/g+cKXv2EeEVV7gp
	WeBEs5eMtcMPUArv6pnMqK1ID7MhMRChjo1uxncYNe2qwcPlRTOgGe/pKULHI6K7SLKGzCbC/Mg
	Fi3kFOGTTvPEZonw/hJ9rsUJnrZvK/FZcDKDmd8MddzJQT5Iyy+grwoeDK/Zl0+RH16z/uaVUuX
	4zgDzRTNSn7Zf+As3BE+Koa8fGAsoaWm0WrmPUIypBaUR3cZnTiC33Q=
X-Google-Smtp-Source: AGHT+IE86Q3+wVqPZufqaFdR5AXK2Hpei01lx1jufnMmv4wt1krtWH2mQQ/n9CHFPIgL61um5nK+HQ==
X-Received: by 2002:a05:6402:2748:b0:5e7:88d8:30a6 with SMTP id 4fb4d7f45d1cf-5f72297c525mr2124920a12.20.1745588292119;
        Fri, 25 Apr 2025 06:38:12 -0700 (PDT)
Received: from localhost ([217.151.144.138])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f70110791bsm1297259a12.13.2025.04.25.06.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:38:11 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:11:22 +0200
From: Oliver Graute <oliver.graute@gmail.com>
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: watchdog: fsl,scu-wdt: Document
 imx8qm
Message-ID: <aAuJ-qg7ZjZj0LQQ@graute-macos>
References: <20250414-imx8qm-watchdog-v2-0-449265a9da4e@bootlin.com>
 <20250414-imx8qm-watchdog-v2-1-449265a9da4e@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250414-imx8qm-watchdog-v2-1-449265a9da4e@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_063814_285736_9BB7F29A 
X-CRM114-Status: UNSURE (   8.20  )
X-CRM114-Notice: Please train this message.
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

On 14/04/25, Thomas Richard wrote:
> Add an entry for 'fsl,imx8qm-sc-wdt' as imx8qm also contains the SCU
> watchdog block.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Acked-by: Oliver Graute <oliver.graute@kococonnector.com>

