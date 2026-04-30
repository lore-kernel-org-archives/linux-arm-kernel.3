Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7806CD13DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 23:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wPb32HxMm/+qEq7JGxjS6idVv7iM9pOULTkDilujde0=; b=DuUURuWjCrBKTvFcMHdaSKroBf
	iWnINFHNKFYtRoEcH3bfbwCkwLIQrBZO9H1qiUvtxiwvZ2SRSp1POeL8M3S+kEwaFRr+DGUPbnHjw
	DtpZ2RkuY18bmvn3LwwkymqXhFepf9uBZIcNWwWGT/LUAkM7esYymc9eRukgYnxXj5CsMXPwFjtYo
	ZJ9ZqV3FDAYhtTB7/LNeRNX1KiPK9C44PY0zGThfzuAzcJy9NwA0StGXwjQraLkppLCdUl6Ql5PWd
	qdvPmoNF3JpETwvYEsWsH2q6MFzPW4lf/AiG1vTzjutxusgNQuUNqeu9C8WrLOYhm2RgutQJJS6jU
	judOEVcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIadh-000000065hx-1Y2v;
	Thu, 30 Apr 2026 23:17:51 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wIadc-000000065hF-3Rli
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 23:17:47 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2b4650d5f5cso5935395ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Apr 2026 16:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777591064; x=1778195864; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wPb32HxMm/+qEq7JGxjS6idVv7iM9pOULTkDilujde0=;
        b=npybbFiXy01gflcw4j0emuKZRHpbPhguN3GTjQsh1sZRTo0HcGRbnJaMr5NQgenXbw
         lcsy9BFJhVn7pr151UGoD7W32Mp/nBJnHRI/OONG8vV32ByAUjCRtdqaFdGCbZ0Bq537
         dfGfiG+YIzcRNQzw5l/DRMiVmI+Ja4CLeOEGRDuUsjW/Juo5ZS9zc3OckdNtafY1Bqxn
         0kJ5Az5DY9R8z13l/aUl3JNw4SibJy64LYwcGhgr1ZdXuHNX2H7uQ/3xYN/uT5mb8DqD
         clFrFIJtYBzdxGlFhqEY7+fh6a1Q05CtX6UOLTETag0A/RuOYEys/M6s37F5A96LCbDE
         betg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777591064; x=1778195864;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wPb32HxMm/+qEq7JGxjS6idVv7iM9pOULTkDilujde0=;
        b=Zsg+NkKhuzYAZv9CEC+DpfJPENVJfO4GrQ3Z/bMG8njV54iVBS9/kp7t4pMjSeS4qy
         iU5LjSqENNflmX9dSfa/r4ppabCgiHJml7/7upicvCGEJnUF9J4yy5burJKy5di3rLVN
         wbo5+xBek5QkMGmYwdJBI+Ukfo9CDxE0FJ2Ja4Nris8LcjrAXC62kwamI78twHT+Dy6A
         QSGyzcymGX8Uy626MWFh0fTI22f/MMJz3L5VxM6ek3Y1vwd0DABZLrWLYPALqr2MXxCE
         OcjHXE4mSvbDyfQQwGj8MIvRcLm+SQnntenqusZQEE+Ls9oAwAlUcXCFAJOUg/GK/Bzt
         B1kA==
X-Forwarded-Encrypted: i=1; AFNElJ+ouMth0O9d/H2WzODWIGgi1LkpclG52gG0VWKAa3kdodCxdpjBtrzTLiOLeMqx3C57WP8YpYP0bfcAVlY7D0bt@lists.infradead.org
X-Gm-Message-State: AOJu0YxR9DrMuroPMMVD9FFuzNizA4Jnko6CypgEQoYZxHwxSsoHYq+7
	NEX7f+yivPvSrdRduvnGR7L3/uGhxw612ZGadhrTBkQQZiA7eCPtJIpO
X-Gm-Gg: AeBDieuBEruIqJB/1N0uTB8EF7sTD7QIHCnZIBjWa9ltvSaPAp8qhZgvK1sMXU8AQ0l
	f/0HoloeoySMYxrJAwVwGDwrNIjyUnECahQ9PmT1DI9JbYd9J/XrkHBYFPsl79YHrvBFqrwZYdw
	OUO8dEtrHlPlJdD+i9LsMxCtWwdERgtrD4hq3HcKRTOHTADxnCHQOPkF3aWS0+UTwtTvXr4ankJ
	W649pj+sP7YW07kcxPPFsl1I9+X3lnH+GdZ0zNMNFIRI3lXORsHbKhfijzMNuUkplRViAPc9lQO
	4Il8SPz7pJGffdkt3A0F+3az7m88SircXmuwgLupjP8+JJIOc15FUxkU5kuLuruZh/ZK9wiJO/S
	5ptniqwBzBQXgQ24cdj6GUabzmh6m3B87rG4bHBFq6oDuBIHYCaEO0XhleRD1SOQ/PcsjYXog3G
	eBfCefc3H76erwzhQUt/51/PDFZmeWruQ70N/qBhR2U8LKaJY=
X-Received: by 2002:a17:903:4509:b0:2b7:a350:463f with SMTP id d9443c01a7336-2b9a2316e61mr37002455ad.10.1777591063991;
        Thu, 30 Apr 2026 16:17:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae58906sm6249995ad.74.2026.04.30.16.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 16:17:43 -0700 (PDT)
Date: Thu, 30 Apr 2026 16:17:42 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: florin.leotescu@oss.nxp.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Shych <michaelsh@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, viorel.suman@nxp.com,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	festevam@gmail.com, Florin Leotescu <florin.leotescu@nxp.com>
Subject: Re: [PATCH v7 3/3] hwmon: emc2305: Support configurable fan PWM at
 shutdown
Message-ID: <931b8c3c-8555-4333-a660-e1d78fd67a00@roeck-us.net>
References: <20260429065955.2113012-1-florin.leotescu@oss.nxp.com>
 <20260429065955.2113012-4-florin.leotescu@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429065955.2113012-4-florin.leotescu@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_161746_588220_207966BD 
X-CRM114-Status: GOOD (  12.50  )
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

On Wed, Apr 29, 2026 at 09:59:55AM +0300, florin.leotescu@oss.nxp.com wrote:
> From: Florin Leotescu <florin.leotescu@nxp.com>
> 
> Some systems require fans to enter in a defined safe state during system
> shutdown or reboot handoff.
> 
> Add support for the optional Device Tree property "fan-shutdown-percent"
> to configure the shutdown PWM duty cycle per fan output.
> 
> If the property is present for a fan channel, the driver converts the
> configured percentage value to the corresponding PWM duty cycle and
> applies it during driver shutdown.
> 
> If the property is not present, the fan state remains unchanged.
> 
> Signed-off-by: Florin Leotescu <florin.leotescu@nxp.com>

I don't know if Sashiko's concerns are real; if sysfs accesses are still
possible during shutdown, lots of drivers have problems. With that in mind,
applied.

Thanks,
Guenter

