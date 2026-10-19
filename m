Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D3BCCF2E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 12:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lf9FLL6T5/Kb7gEctiirso0+WOoWDflrhqqlYLNOZeU=; b=MLWdViDVsAjxMpusHMejXP1dV9
	rSDh9+HWKzb32H+p+3nwId6hvcKSpwgcoUZ+37HdIBlKcljHRmktCEjM8gcYPro/aq9LZdJj9LhmW
	J+ThwzcO6hsQG5pJmcf2DhVq37aLbzkFYJ4FBvrOkIL69hAa952exifb23BumXKP6NVq8IyPux+ib
	HVwi3wa5d5RO86FF7T8zgvjMd8tntOejI2l1pUERyByCg1w2Bh2rhKd6W++NCVsTjlyRY0sITJrK/
	GDzFy0HDTYOp4yCnTvEGlJPI1IX1ggfetL+qk4sDMCfoxscNi1E9l2iPdqKw4fvEY/fPM622kaUDQ
	vIvLxBgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImvq-00000007Rfp-0pww;
	Mon, 19 Oct 2026 12:57:38 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xImvl-00000007RfT-41my
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 12:57:36 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48de72fc832so1562611f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Oct 2026 05:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792414652; x=1793019452; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lf9FLL6T5/Kb7gEctiirso0+WOoWDflrhqqlYLNOZeU=;
        b=IZ2xcAm7kk5bep2wlLodQcN2avj+w8l/eJy+Rbee5RC3Cs6zop44Ggcp9Dn6BbFLVK
         eeobzP8mG3A8ZmEd8UWJE+YnVU1ObisrHtLTNtGo4mWicIVX5tafQEatmO0ZHZvKuWRO
         4k6LyLgG5CYrNlV902FDNEoTqch1bdOYP0h/HqK8dCrujE9u9whj3ZLU2r2ICkyh8uHo
         jGve075Dz1x1kjK6+rhSDz2T++kES36b5VhiiDbA5ktlbK19fZUmKPntM57IxMGF1iOg
         msMy/ylFTeOXUsJjG066bLP23xWnZmmMxeK8OF23c9k0GK71XBRCkJ3NzKahZKaHOouy
         jHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792414652; x=1793019452;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lf9FLL6T5/Kb7gEctiirso0+WOoWDflrhqqlYLNOZeU=;
        b=khlzDk1tJYGItBtvXMjezTzx9zbixmY1iK2swh7ZCdg5kc/akAFpuT5t4mLuvnH/8n
         GauIIpb9y7Cqu/PYY7EcgYgvEezWzaBQjWlYyfE5msmWRVLEXLqG+FsjWgTjn2PFJZWY
         XhiICpngHHESZDXJxjh2UpW0OzxffxUhtFZMjR6PBV9c2TeJ7YEDNsEcfoUgoJN3vspg
         yE0WaEhE4fQyzg/MXOUTQxf4x22/NzzNpkzgQ90jEC+Rgk+8o/+I6KxyyGih5t0Effa+
         O7tnpDQG8TNRKY0BXGlUtUjTKGegkBW7ECSRxVwVaPtpLUBGy6J567xWJSXeowGT3n4C
         EJ9g==
X-Forwarded-Encrypted: i=1; AKwUvBy/tJ5nBKBNofVzSwvuNPsWZpcZIxo5JWCnZzeaatfFS6gYIitJGCYrt4F0Ew6MAexNc3O8LgbDyMJRHLFT47px@lists.infradead.org
X-Gm-Message-State: AFq9FYJV/RM07XLrxZHCPPgTStVEQDKZRevqOIOO5nANmt1pRxSiIdQv
	6+yLxg8L6UIAY0000YdFbb+rY8kHohwkz847WFeR75AgX+dBussmCLL4
X-Gm-Gg: AYBFou0aZO8YYDKUekwUwZyEUtX04oFmJVvLUoXES3dp2WaL2ck6SoU4vkdzuG/802+
	2LF8jEZ4s3qWwgizOxRggmVJfD8GMXYkV0PIIuN5/vpVOCp+lwA/yep2eSvOJA66MmhDHMszPMW
	63IcsgL0Hq0iPWLiUZSev/dGI7iVR+cVfUlwvSOPN9tdFYLhc155XQmcO/xGZWpLp9HeglXEtrn
	pa1oJbP0ZrYqJCUWNNIE+sQvBuPNsCx59eHKvGN5MtQ/9xzxhs2UuRDH9N/97J9qY7yHswYllJJ
	CGLkEzRBkfS7os2ZNfBXROSob2JBJ4Sryg/7kP6P67WdnozKLgysq6+nAN6D51jByqbb1Dqk7n2
	uSW/FOj4dRbafixrJzsgPNpB4ct0BDZzNjNW2THbLWoTfdWFfQHQNNoXK5xMO5JhazuAUEKFs/b
	rxqtrSdoP2YU90ZzjgEhspTxt+TS2PDPpVYOT/EKfhw5XOIE6ZIaQOuZPicCrp6rSTd4tm0281A
	xwbAPoxxYPa
X-Received: by 2002:a05:6000:4b15:b0:48e:1421:ed49 with SMTP id ffacd0b85a97d-48e14220c4amr6571820f8f.18.1792414651426;
        Mon, 19 Oct 2026 05:57:31 -0700 (PDT)
Received: from [192.168.69.3] ([91.189.216.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfdcc0f20sm22643828f8f.11.2026.10.19.05.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:57:30 -0700 (PDT)
Message-ID: <2c73e54a-d2b1-48cc-827c-6c29c6664697@gmail.com>
Date: Mon, 19 Oct 2026 14:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
Content-Language: pl-PL
From: =?UTF-8?Q?Micha=C5=82_Szczepaniak?= <m.szczepaniak.000@gmail.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_055734_005178_32F4319A 
X-CRM114-Status: UNSURE (   6.75  )
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

On 09/08/2026 22:15, Dmitry Baryshkov wrote:
> Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1

Hi Dmitry,

As requested, for the series:

Tested-by: Michał Szczepaniak <m.szczepaniak.000@gmail.com> # Motorola 
Moto X 2014 (MSM8974PRO-AC)

Thanks,
Michał


