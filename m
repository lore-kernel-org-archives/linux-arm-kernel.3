Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A288EFCE47
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 20:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KYNFqupRvkwAilNqSDcz2z6T7EuDcaIGLGnq2s5luwA=; b=Pguz4U1mA/m0agOZXprT5AKf9P
	uSa86+3BMgdjDXX6Jrp9tCQVT1HLvB0dXxPSUjXp942YPo1hY4inkHQQjPs4bxPv3Y/mTukTK8MRc
	Z6nWG31uVP4o8oPdEGog77wPus/tJfZXUQJpDLDOlmdN+ahx6vwHkyPekG8OMNnPOFD66AKuxipbs
	N4E/2G4XgF4mKLbPNIjWb0T2fYd3uayS7L2PKFckW/bZLTV71ZZr218MOpWQD3o/ibOh3fhX1xHVM
	fJ2XHpXZkfeCTdDHm1aWpmE6w1xQe3L0RynP3adJ570lgk/h+jVvdTxa/MfL+3UWHFH7sLYiaUm5Z
	PZjcq5pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxt8j-00000000TOB-28r6;
	Wed, 04 Mar 2026 20:48:17 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxt8h-00000000TNp-0AhE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 20:48:16 +0000
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b611274bso2516166f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 12:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772657293; x=1773262093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KYNFqupRvkwAilNqSDcz2z6T7EuDcaIGLGnq2s5luwA=;
        b=t9aJco2RnQgLto1dm4T4mSBmTwbpkgVSc2Ppk65JJwCEuoXHM7vUpvS83zzV49F1CN
         RVdfHOHCl5NB05UNOJh5yc2s2yrE3VjB9z0NSHgsyTBj2Vx35jU1eMUitUMuLbrTSA+6
         cbSnOabQqWz8mnFx3gt/OJRlS9ipOdzKWA9HadYo6TpotGEcycMY5qmsnlmgT9u6st4i
         wopvxna87DYS53ZKKOJSDAyI6AMpIqjAmRqeCkuPVT26IlA2bUwvQ0tNlHFaOZTozQu9
         QfQSwo/pQdNCLHwroyBMcQ+/U2zGR0/66wHPMgnEPK4wuW+88sWVYvaN52P5BGXklEu9
         xdDw==
X-Forwarded-Encrypted: i=1; AJvYcCXO1DcbkMdBoqxtYR96W/MpjJM+Aug4xcftT+M1iG3B/Ug1hFd4Jcejndw9BYSv+2jWoFUVT/Pxuw39SoMz9txO@lists.infradead.org
X-Gm-Message-State: AOJu0YzxldqgX4Q0FXv+GeQ/WJQZ5qoiai+nhizUaM38pCLxWl3GftfS
	6gqVP8TjRbrLy1CPxtSRfR8jlxqPVnkAGH0UB/6w+0koEgmwIbMNFi+o
X-Gm-Gg: ATEYQzxEb6kZ6esJt9lgP/gYYSrOGCZTXMriAefAjaCkxrMm58U4/n4JWfIanXV32nm
	/mzGz/fY5xYYRCI6icBjWI0WRk0opt0F8cTtOQiPro9XBisXwd2iQuGfqL2y9oRRuEIrEZTvgwY
	fuRO2YxJ574sVlB3i26pXI/aiVn1Vq61JfBgf9m79KdgVrsDpO+MO/61qO84siWmrNl0xsJX0DW
	Uv7WGqzf52rHyVwYeL121qpRLznCHoInX6jZ+AsJcD1GTJjKtvVdwV8Izk2xl/PBW6etVcOVayd
	sW/Zzn+2cJ/pSOiuCqmIjfR4R3cx+6ccG9iz+5LamtSVH5JjfhVeCiw3umueeejMF7tOKlTE6pe
	tkjayn3vb2uPPcK+sUZd6DsUF799UHbc+10Im9kbw8TrvLtZCXSirnPS4F1nwocIRHWRAa/2kOD
	AZb8ApcYhf5qr3m+h9rsz3Rbu7Z4UH7q+d8XZA4Pwb3Qyvw4gDFz04OV6LxpgLertn9H2CQxd49
	44cppTVbkge6bD+tmo+T4WbmU9X
X-Received: by 2002:a5d:5d07:0:b0:439:cce7:d04d with SMTP id ffacd0b85a97d-439cce7d0a0mr2269547f8f.58.1772657292586;
        Wed, 04 Mar 2026 12:48:12 -0800 (PST)
Received: from ?IPV6:2001:818:ea73:e00:b102:ff11:db49:2389? ([2001:818:ea73:e00:b102:ff11:db49:2389])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a5970sm22469059f8f.33.2026.03.04.12.48.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 12:48:12 -0800 (PST)
Message-ID: <7d3c5e4c-37a8-4d12-a7da-3b4d159a8d4d@pta2002.com>
Date: Wed, 4 Mar 2026 20:48:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: rockchip: configure hdmirx in Rock 5 ITX
To: Heiko Stuebner <heiko@sntech.de>,
 Diederik de Haas <diederik@cknow-tech.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260304-radxa-r5-itx-hdmirx-v1-1-f77bf1f7ce03@pta2002.com>
 <DGU7SPZQMZR5.1506XM8RO4EHE@cknow-tech.com>
 <CAAEXfUVBVMmT3i+10F3uvmGOtMMLoQK4WXM7_0G88aL5DntOuw@mail.gmail.com>
 <24285215.6Emhk5qWAg@phil>
Content-Language: pt_PT
From: Pedro Alves <pta2002@pta2002.com>
In-Reply-To: <24285215.6Emhk5qWAg@phil>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_124815_092538_B5F66A84 
X-CRM114-Status: GOOD (  12.70  )
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

On 04/03/2026 20:26, Heiko Stuebner wrote:
> I really want pin-names to reflect the schematics. This makes searching
> so much easier. Sometimes things slip through where that doesn't match,
> but the goal would be to always move to improve things.
> 
> So at least the newly added hdmirx here should follow the schematics,
> and if you are keen to bring everything in line, you could also change
> the other boards. But please make sure via the schematics of those :-)

Thanks for the feedback. I've reverted that and will look into changing
the other boards in a separate patch since there are quite a few.

