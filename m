Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEC81C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 12:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UYYmwpP0MAwsA931NniE7DuDU5H48aT0XrSHju++1ic=; b=FSHOesExqrgGBOqyKWk7/lx5TL
	CLNcVA9FlIEBlECM+qDRdG0BS8xtvxql4rP8MIKVd66Afn5QIAZ6SSc0r3cOFUQETPeI6Iq/1mkPM
	ZwNWhc2Qx1/IJBBzStXwAGqFTDs9u8pBESEfED+VqTWx3txm4PBuLg1np28Jn0h4IcQk/GhcczjOl
	TkJYKBI3FEj0UDNS63a+yx/qOuDmqFTF+WstYpK4OiU6QF5FcwSZmrh1I3nY9mFbY5gBnSHDtQ3yM
	5z/CSTCyhrhpb81YOdubXaWPt1THJtY8T27Z4KajO3ycNsz0Qp2RSxHDAlI/iyDh4SFbVtp+Ibis5
	9a2u+j5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXbx-00000000Y95-0JLe;
	Thu, 15 May 2025 12:22:53 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFXZu-00000000Xq4-3WBL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 12:20:48 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso9302385e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 May 2025 05:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747311645; x=1747916445; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UYYmwpP0MAwsA931NniE7DuDU5H48aT0XrSHju++1ic=;
        b=mna0B5hBOx93SkG7p7pCJDfcoI+HREFB4bpz/NdpVRXu6dV+NGZRGjtI/yeYKWiAn5
         9z0U2xe2UpgReOpdyBvRMHaU4RadcZ9tGokSJp6Vg5Zk/1Lw5mT1BISJjTCXGr28ck9t
         uOyTuilBxN6aOlMoYuZqiDpRM/M/SViHuxZLiamc3om42aNKtKTkTlet9f/9d26fv+8V
         vemgBbv/hRHvwMKx1DtxdbtuCHwute2WuwIvKhjRC3WZ5ZzQW4YViI3a6nHqzeUKN7kx
         mi6Vj7sJo8o4XlVL4mv/L3usDoVpUKswKKdgoTiee1Q2Zw2wdzx6g6W2ZGv2fqswyNsC
         Iv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747311645; x=1747916445;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UYYmwpP0MAwsA931NniE7DuDU5H48aT0XrSHju++1ic=;
        b=mtrJrhcMSC96AFen0UYykXIUzr1yhfDC9gdJlQpQ/ju+FT5XIg4/JzTg6x55w/yPw1
         CAeTSgTRUckn0Jku4q3q1LD41SSkz4X6C7FEuLBqft6xgiiV2dOEByDw1K46No3jgZWQ
         bJ/lPXLf4Vjic7EnEoQLkyjfTQVIcrpKf6KJU58GIqJaN82k0GacQiYroumbRxTQY1NY
         CYarzgHIESPGdo8P9UQDSCYwE1fu/LPnPFYXtx+n8fsmt3JXFVvKpmspDEGIsYt2xzMB
         sL/ZEGyWgccsUhyq1oFLuhF43v6MRYvVJCCrq7uSsjKIihkSz4XxcUrAp/UevsyIkILp
         yn5w==
X-Forwarded-Encrypted: i=1; AJvYcCWciEcOJjkjwgfLf3urGaNtIctOsHGVbJdw617YqthR0NqvgHo1lMhnuHzsPGDFXN5ulOG/xA827bvRCjVuU2OE@lists.infradead.org
X-Gm-Message-State: AOJu0YwtyE6QUMgM+4OsupywZt7kCBkoS5Ofxx39HZph0AF3OHHu6PJc
	pzuGO/XvXeFr7kKyrukbAuofl/paf/Xb5PqiK4o88/MeAwsI4YEOrtzTFaQfWDY=
X-Gm-Gg: ASbGncvGQ8YtTVP+88DeACghIM0umBCaQngDV2nEGaz5jmGZUOLJAH50VndIpbxHazo
	nb3WnI8VUhpgWOrOHh8umCZS0w0HYCm7rSUn845tdwgmn7euVBUATWP7l7CqGhpCWqkUBmp4/6/
	axPIin4PGHY9BU7D9oFhr2tkQrvIJn3MfizawcAxXHv0egNwkFTc32k5xJmP0wxzgKSSsjH6vgn
	X92z4Hl4OYM1V2DPa761BIYwgara0I35YCTMH2xoE+QOUspeKmc4XtUXMj8S4K1hpT8H91Dv0GU
	FNRI2mJ7HO/ZpPTGvZMQa6lOaBoZWRofeOoBlVI8vqkT81oSh6EwjQi5vj6Cj1gVXTLpPRZTMsV
	jXKPQvRzU
X-Google-Smtp-Source: AGHT+IFf5pIVLw9OgzawdBaBFW6KZvXprzzPf2JHeKzZZEBmezUo1iUF8T/ujeptaHHKPw8LeA0tyA==
X-Received: by 2002:a05:600c:3e88:b0:43c:fb95:c76f with SMTP id 5b1f17b1804b1-442f20e33b0mr74335285e9.9.1747311644763;
        Thu, 15 May 2025 05:20:44 -0700 (PDT)
Received: from [10.61.2.175] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde01sm22985463f8f.15.2025.05.15.05.20.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 05:20:44 -0700 (PDT)
Message-ID: <586c877d-0d0a-48bf-9c55-97bd24e86638@linaro.org>
Date: Thu, 15 May 2025 13:20:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/14] spi: spi-fsl-dspi: Enable modified transfer
 protocol
To: Mark Brown <broonie@kernel.org>
Cc: Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org,
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org,
 linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Andra-Teodora Ilie
 <andra.ilie@nxp.com>, Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
 <20250509-james-nxp-spi-v1-10-32bfcd2fea11@linaro.org>
 <aB6pa9m0emX2vMH8@finisterre.sirena.org.uk>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aB6pa9m0emX2vMH8@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_052046_881215_A68A8107 
X-CRM114-Status: GOOD (  11.26  )
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



On 10/05/2025 02:18, Mark Brown wrote:
> On Fri, May 09, 2025 at 12:05:57PM +0100, James Clark wrote:
>> From: Andra-Teodora Ilie <andra.ilie@nxp.com>
>>
>> Set MTFE bit in MCR register for frequencies higher than 25MHz.
> 
> Is this a bug fix?

Not this one as it's only supported for s32g which isn't enabled until 
later. The commit message is lacking though so I will elaborate.

For the other bug fixes it looks like they are, so I'll put them at the 
beginning and add fixes tags.

Thanks
James

