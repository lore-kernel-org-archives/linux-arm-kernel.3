Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0424BC79F82
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Sep 2026 16:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2RTVmx65sj/OQ1FTIJA7qw5cuQ/6mnn1iGRNRdhAkxI=; b=kzXFagRoi9Ubr5SmTmpCK+LrvW
	e8BM9Z25uHH7MOmkpOUuqtyvhHSDfUQHlRjZc22YJ82BCDHrIdRJz9NPo3GvhIglOPM/V1D7FyT14
	/4K0npJ+Z8yrECoxwPFoDV7YH0PIulX4lGzLsvLmWyEejvozQpLO2zeU7FGB8ZopqgT599+BO6835
	eKejLC4eMQsK7zLEAvFA/+qjWjkYUVvP68er5uw5/xXtINt6Tj6mMtA1zZLqVe+oocwyFR8tevBVN
	DgeUy5ZrAQG6ONLYw4oLqlyQajHAQN0A5YurMKSFzlw8H+E6tdgKveBfdtl3bID9sGdIq2qT3ijQm
	ihxXsdKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yQn-00000009bYd-0nvy;
	Tue, 08 Sep 2026 16:12:21 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3yQk-00000009bXU-3762
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Sep 2026 16:12:20 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2db858d60e0so6461305ad.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 08 Sep 2026 09:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788883937; x=1789488737; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2RTVmx65sj/OQ1FTIJA7qw5cuQ/6mnn1iGRNRdhAkxI=;
        b=gkQEXcJGcBFsawiHlkFjLGO8/tDOc1EKjA/uFghmfynKVgF/urN11QJCG359sZGApv
         mOExfagQ8n+NsG5WPayKPc5P+X/j7DQiRSNqvIrMRW7SaqrZqpG2q35sUa+7W5o318k8
         tl/BS23C7u+kAvkpYOHMRayg9aSSJ60Eus+JnGlljday/T9l1MgIVSCe35nNq7md9aE1
         BJZQz2rnsZhm3yNC7ae24k+sOe1SphzSWa80XrrrWg+gA+jFretP0bpbC/lHEO18hOEb
         Lr+exW0/aOFElzW3/D6/QVc96ar9gD6ktAsojY/BEKPLyDht+f3AP9pgUIOxfjt3QJ0W
         GWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788883937; x=1789488737;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2RTVmx65sj/OQ1FTIJA7qw5cuQ/6mnn1iGRNRdhAkxI=;
        b=JygdVoKtojXfPcvpEHRfsMGLyMraTyukbn8vPCvYVHt4ajczjPcLhmmU6yTchTq354
         l/9u9Ib9oiMYagOKMQHdd9lWyEzn5dHcmittJZ7ntGP8Zr7gPviexyevw6dNpPe+8cOV
         Z9gMKMHuJqR2uM22ERWjR+sypmyimHhzCTSJ8Ltp0OIW/fDLcnIONsVPvS7HwFpViDO1
         dhuNJ96Sy6fGy4bVs7mFx65MeaWKz6XGHoVMJM5BMtyh37H7pMYhoG1rzB3ep+GXgs0g
         JjgIKgKUEInZbvLcDy/eVJch60j3n1tDPlB4Kpoj/9mzTgRP3fyztsOSgx4KAcme6dto
         BEuA==
X-Forwarded-Encrypted: i=1; AKwUvBy1uDu324dnou0B54YqsRm4gg/SzovzpDZXcsxFzkysK/ni95EfjB3YtuTimsHbCWtvXhFSgoaLfAfzSYVm9dRH@lists.infradead.org
X-Gm-Message-State: AFuF++n2mfPEEq03ahJ9zPBonNV5A93nlj7Cxd9bQjysqDFlpXa8IKHZ
	+nxu4qWmI3U13iB4+1lf2j/vtcULigRDLLyqhMpKNmVG7m0UeQnR8IOW
X-Gm-Gg: AYBFou1Y57BfOzr3t3EwTBKSp9QZBkT1iFdvZabl4sWDKkQr4Li+meKXfgpswERny44
	jeiOyCpZ0+EDmLyyt3hR7jRbjq7Q+Wb9YA7VQ0mSQVt5uGPGdvqjDc2rUc0Eql0zf1dXBlZBBrJ
	CBmh2KlPAw1hQHQx1bmCCRvPZo1m4uzd5nCi8EDGDUQoYpdYaj2nZHbAMwbEnz3eizuo8tvrTSO
	DVMRa93h6oFG+bx8TyBGFHYxiXj/VZ0DUfSMfNGbuPxszFmOUGMip1u813gF1YihtYOhhSB/gef
	qsHx09HX96eouHfbpPPrSpVwc55ZDVdw7gj0a1UPB4edgBcrn/QKNfmbWbSrrhhthH2k/5HUUkk
	jIG4t8bQYUtWsx8QCT1wRSy3Fz1otoXH01CFXDWDV9FECcpXBlPpIlTV/5QSv29NdecElWi843T
	ADhi0jC6qzA0IHmssdh3RKBuPeg1JRAELY12pnmZN6MWD7xKdPgqtBMXPF2M1ZtdHyfMpQDgnPj
	g==
X-Received: by 2002:a17:902:db07:b0:2db:5ea1:8b04 with SMTP id d9443c01a7336-2db5ea18e2amr170023395ad.5.1788883937378;
        Tue, 08 Sep 2026 09:12:17 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495b419sm61093785ad.13.2026.09.08.09.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 09:12:16 -0700 (PDT)
Date: Tue, 8 Sep 2026 09:12:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Petar Stepanovic <pstepanovic@axiado.com>
Cc: Akhila Kavi <akavi@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	openbmc@lists.ozlabs.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add Axiado AX3000 TSADC
Message-ID: <ba945a15-bd57-4c6a-a738-53177a9cd814@roeck-us.net>
References: <20260903-axiado-ax3000-tsadc-v1-0-a8a0f3b251f5@axiado.com>
 <20260903-axiado-ax3000-tsadc-v1-1-a8a0f3b251f5@axiado.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903-axiado-ax3000-tsadc-v1-1-a8a0f3b251f5@axiado.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260908_091218_781314_68450CFD 
X-CRM114-Status: GOOD (  14.62  )
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

On Thu, Sep 03, 2026 at 12:09:47AM -0700, Petar Stepanovic wrote:
> Add a Devicetree binding for the temperature sensor ADC (TSADC)
> controller found on the Axiado AX3000 and AX3005 SoCs.
> 
> The controller monitors the on-die temperature. An SoC may contain
> multiple TSADC controllers at different locations on the die, each
> represented by a separate Devicetree node.
> 
> AX3005 uses the same programming model as AX3000 and is compatible
> with the AX3000 implementation. Therefore, axiado,ax3000-tsadc is
> used as its fallback compatible.
> 
> Also add a MAINTAINERS entry covering the binding and driver.
> 
> Signed-off-by: Petar Stepanovic <pstepanovic@axiado.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter

