Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23078D3B9AC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 16:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/ZbCdY/ecw6ecn/wcTYRT4DAvUEnDOC9uj6W7G8loo=; b=K3lCLNHDvgFcEBkao9DMUckoBn
	1UH2VYNPJJiekgrFOG6kZdU2uF4U5ea1+ucxC163jnU6GK6cYSPydk7ZzT9XncETlyog7KJceM6SI
	8R0B3E4zzMB6CNQg24uN6l054uWRsOS7JwQ/ER1+WgLvlIs5OE6i/jZumjuVXbMPI3j0zZsljGMdl
	RIeMnFfsN2qAMsHItLEjDJE8E+oyro/jJlANFpcOe9IRtt3e6vQh1XYzfMWHYBB/EQ+uog1tBKiUx
	eX+hcnKOFOTwCbujr5444Uqe6YKvnz2rlAFkw6MZlmsvRLYRO9exbO0uzpHg2uOaP/ennYBgGk/oy
	KScDhQDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFyLy-0000000B9Gq-1J8S;
	Tue, 26 Nov 2024 16:23:54 +0000
Received: from phobos.denx.de ([2a01:238:438b:c500:173d:9f52:ddab:ee01])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFyKz-0000000B96l-2HZg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 16:22:54 +0000
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 533C689C93;
	Tue, 26 Nov 2024 17:22:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1732638170;
	bh=6/ZbCdY/ecw6ecn/wcTYRT4DAvUEnDOC9uj6W7G8loo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U8Hh5+jcPOr1GekvPKC2t9a/OVjRJ/4gnxm4aVOV2H/hlJEHYBqXcvEBkvIr+Jmm+
	 dbzrrI6EOqYFx90YrZuexxAW0nHc6XUjJk33mA6nLC31p9ZTgQzr8/fG92Z0onELet
	 TOrm6KQawAfrjBOGoE//bymtsSOVx4Cb4Nvhe/BrLgwiZZ4GWY6hkNRYTzjJ5UfQDx
	 rW0It5L5guYuQYl/K2f3WO2IkN/A9frW/t+sTflFt3RaKmXjHBFT6A++IUrQtReEmr
	 wtAVjkhXK/Ibz6+Fq/NtY9VE3NgnUwiieHDBHFB5ZZPBvqs6gCAAVHJrBwn2+m+s+C
	 9oqiboW2Be2+A==
Message-ID: <8b6085b9-9b21-4043-af5e-e7fc4962236f@denx.de>
Date: Tue, 26 Nov 2024 17:18:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: zynqmp: Work around broken DT GPU node
To: "Gajjar, Parth" <parth.gajjar@amd.com>,
 "Sagar, Vishal" <vishal.sagar@amd.com>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 "Simek, Michal" <michal.simek@amd.com>, Stephen Boyd <sboyd@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "Allagadapa, Varunkumar" <varunkumar.allagadapa@amd.com>
References: <20241031170015.55243-1-marex@denx.de>
 <dd4cb501-5fc7-4430-9ffc-9c8c910df425@amd.com>
 <4ee8d8a5-ec00-4b11-a7bc-4137e1982218@denx.de>
 <SJ0PR12MB69656066F70FC40E4A5A93B499592@SJ0PR12MB6965.namprd12.prod.outlook.com>
 <638cdca0-05ba-4b2b-8a92-3041247c2c7f@denx.de>
 <PH7PR12MB69557B0065EE5D4E51EE13FF995A2@PH7PR12MB6955.namprd12.prod.outlook.com>
 <14d05680-3112-4ad6-9d4c-e892359fc9d4@denx.de>
 <SJ0PR12MB6965E6448CFB1095584B114C992F2@SJ0PR12MB6965.namprd12.prod.outlook.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <SJ0PR12MB6965E6448CFB1095584B114C992F2@SJ0PR12MB6965.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_082253_744763_9611B11A 
X-CRM114-Status: GOOD (  10.62  )
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

On 11/26/24 6:25 AM, Gajjar, Parth wrote:
> Hi Marek,

Hi,

> Yes we are using https://github.com/Xilinx/linux-xlnx/tree/xlnx_rebase_v6.6_LTS. We are also checking with upstream kernel. Will update you on that.

Please do test mainline Linux (currently 6.12 or next), not some 
downstream fork. Downstream forks tests have no relevance in mainline 
Linux testing.

> Can you share please your artifacts.
> 
> The blobs I use are 2019.1
> [Parth]: You are using 2019.1 BOOT.bin and rootfs and upstream kernel Image right?

FSBL and PMUFW are built from embedded-sw 2019.1 , rootfs is currently 
debian unstable or OE scarthgap based .

> Also I don't think any changes with respect to this. Let me also double check once.
I'll wait for this.

