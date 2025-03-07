Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B7AC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 22:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5jKSlZGlGiJXcnUBFmBH70jB0bTGdkoasIi160iUrs=; b=ekFQbz8aCRbmpObHCVASTqc0ot
	wQUhvqM9nnyKsfI5K8umbH7hMIRxrlbQ7ud1Ox1SAEmUDhOFAsu1nOk4b/XwfU9f1jjtnddi7Au4Y
	kZvWcywGdstf7d0ZSACsaSXaQTqUuwwAbCxO6CNgMYvalYeBrC5Rsc9arWL5MdA89BBbegW1rkMm/
	ttHZX4+NgfefQJhCiT9MkmGAV9XuLDOSnnxw0FSeFm7JPq82r4ce6dq40TRc5OS/M2uCrPFCtGVHE
	QYUneQ8n0Z43cC1O1h+h7AqF7Bst2Vnoz0xqo23DcyX4WSW2dMl3DdJgTjNB9u9ldO1TRfPu8bsCo
	N1Y7nhwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqgA0-0000000Fhi3-3UAA;
	Fri, 07 Mar 2025 22:27:16 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqg8N-0000000Fhav-3vMa
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 22:25:37 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 527MPVlt485179
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Mar 2025 16:25:31 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1741386331;
	bh=f5jKSlZGlGiJXcnUBFmBH70jB0bTGdkoasIi160iUrs=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=illAF1zh0Xwf6POhwM3sBNWxWu1razjKqWENqk0zyQO71S2lpVBGF2rkkp5yZFbP1
	 MN36OCYW/i7kXnvrLmrZxYlUBNkwKqvXrXodCoH1kiZ73yGtvXFjb2TeKDt4j2lZug
	 eIf/5tQdzkSqElocuZ/b3A8qbv2rlrrKsaZ4J7Sg=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 527MPVcR046961
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 7 Mar 2025 16:25:31 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 7
 Mar 2025 16:25:31 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 7 Mar 2025 16:25:31 -0600
Received: from [128.247.81.105] (judy-hp.dhcp.ti.com [128.247.81.105])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 527MPVPW081358;
	Fri, 7 Mar 2025 16:25:31 -0600
Message-ID: <df3842b2-7a7e-4c54-80dc-927c7eb55b3c@ti.com>
Date: Fri, 7 Mar 2025 16:25:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 00/10] Add R5F and C7xv device nodes
To: Vignesh Raghavendra <vigneshr@ti.com>, Andrew Davis <afd@ti.com>,
        Hari
 Nagalla <hnagalla@ti.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Nishanth Menon <nm@ti.com>, <devicetree@vger.kernel.org>
References: <20250210221530.1234009-1-jm@ti.com>
Content-Language: en-US
From: Judith Mendez <jm@ti.com>
In-Reply-To: <20250210221530.1234009-1-jm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_142536_088052_136637AB 
X-CRM114-Status: GOOD (  12.73  )
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

Hi Vignesh, all,

On 2/10/25 4:15 PM, Judith Mendez wrote:
> For am62x and am62ax devices, this patch series adds device nodes
> for the R5F subsystem and C7xv DSP subsystem found in their
> respective voltage domain, based on the device TRMs [0][1].
> 
> This patch series also includes patches for enabling IPC for am62x SK,
> am62ax SK, and am62px SK by reserving memory and binding the mailbox
> assignments for each remote core.
> 
> Also reserve timers used by C7x DSP for am62ax SK board and timers used
> by MCU FW for AM642 SK and EVM boards as per firmware requirements.
> 

Is it at all possible to only pick the first 4 patches of this series
that only enable the core nodes?

I will respin the rest of the series in a different patch series.

~ Judith



