Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA0FF9B5E0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 08:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jib7lw5DFroVVGtRxX4pDGI4Rw/4f1CS4+m53zs6a7c=; b=EmpEnG/Go20u9EUwg4x4LSZ6p3
	B4hGjfMib8/dYK2++NPPWHmVwGWae6+XocOU0WeAfl1k/sQtKsysOKJMC7REckU1bKLKPhBGPqq85
	FQyR0AAt++HGXnf1/lsbSYynfqhffYHuUnq9ydh+4r70BnYCWi+ur5FZmUwCBIhm2PgTQONmXwAgb
	jaHf+bQ1XifkOl1M8W9WhiLxu7noegIv4LstiHnnPTqB2Q+gSLzumxlP5r7MYG2PYd/0E+OZZCky6
	E79iSSNsBOmJ/h6ztcBO140hkNxmevLswuYyiB7nv4CZnwJmLmrs1zti3RtX6lvOcfUVNm0yapuWd
	p/4FbaJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFT7a-00000009n5N-2Dyj;
	Wed, 22 Apr 2026 08:39:46 +0000
Received: from relay.yourmailgateway.de ([188.68.63.162])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFT7W-00000009n4j-2NRl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 08:39:44 +0000
Received: from mors-relay-8201.netcup.net (localhost [127.0.0.1])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4g0t1z2Z2Nz3yVZ;
	Wed, 22 Apr 2026 10:39:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1776847175;
	bh=yUNY2WJfRMKnvbtKN/j/UvADsxIjSpJls0F3U9Rux10=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g3S8Z4GC6aCNC+t29j/1QGZkgIt7qaTO+iQADn2aywvab/Ev8EjJuMreKxeleihQX
	 2hdKfdg+HuMkcRjd42bCVLxtYVK/pYNPjhtKZBTkIbN9CBpY4tZ8TIqLN+gY3S7Zc2
	 uL0t+O3FqDh7lspxKshvzyGOmKdjewuKGSX804Oo0ZDY9+CrX+pPoyPmzj8VBLk5iX
	 0eOlsua9Cwy80ts/Nh9KmaS6Jq9czu/I2UE3aVO4tKs4gTEnx1vcB5X6RxG777+oOi
	 4rRAUCE6mkWoex7wdG8eQHgHdDp+Q6kXFCQPyKcjRJvywyLQJcS9cnXpOz+0XPJdV4
	 vOY3S33AEgiQA==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-8201.netcup.net (Postfix) with ESMTPS id 4g0t1k4b51z40Db;
	Wed, 22 Apr 2026 10:39:22 +0200 (CEST)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4g0t1j4MTwz8sZP;
	Wed, 22 Apr 2026 10:39:21 +0200 (CEST)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 88904632AD;
	Wed, 22 Apr 2026 10:39:20 +0200 (CEST)
Authentication-Results: mxe9fb;
        spf=pass (sender IP is 2a02:8108:8984:1d00:a0cf:1912:4be:477f) smtp.mailfrom=regressions@leemhuis.info smtp.helo=[IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f]
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <0fe54399-1fb1-4f75-a60c-e171292415a6@leemhuis.info>
Date: Wed, 22 Apr 2026 10:39:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i.MX8M Plus PCIe link regression
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Hongxing Zhu <hongxing.zhu@nxp.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <23024521.EfDdHjke4D@steina-w>
 <AS8PR04MB88332979F06EDE29E751BCE18C7CA@AS8PR04MB8833.eurprd04.prod.outlook.com>
 <2qto2ddqmtks37wxtklxo4ctvxyezmgtjcuprnk6crant5fvsu@vdbmqomrcqt3>
 <6102060.LvFx2qVVIh@steina-w>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <6102060.LvFx2qVVIh@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <177684716089.1821918.1965836553222221611@mxe9fb.netcup.net>
X-Rspamd-Server: rspamd-worker-8404
X-Rspamd-Queue-Id: 88904632AD
X-NC-CID: pbQs2wGavMMtO1Lsg5Lqnthp6i0QkgfZ7gamkgUvglMNXJR6u80=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_013943_332703_CC349949 
X-CRM114-Status: GOOD (  19.50  )
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

Lo! What happened to this regression? It looks like it was never
resolved. Is that something everybody can live with in some way? Or
something we have to live with, as reverting the culprit at this point
would create a regression and thus creates even more trouble then it solves?

Ciao, Thorsten

On 3/4/26 09:47, Alexander Stein wrote:
> 
> Am Mittwoch, 4. März 2026, 07:32:48 CET schrieb Manivannan Sadhasivam:
>> On Wed, Mar 04, 2026 at 02:55:51AM +0000, Hongxing Zhu wrote:
>>>> -----Original Message-----
>>>> From: Manivannan Sadhasivam <mani@kernel.org>
>>>> Sent: 2026年3月4日 0:42
>>>> To: Hongxing Zhu <hongxing.zhu@nxp.com>; Alexander Stein
>>>> <alexander.stein@ew.tq-group.com>
>>>> Cc: linux-pci@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
>>>> imx@lists.linux.dev
>>>> Subject: Re: i.MX8M Plus PCIe link regression
>>>>
>>>> On Tue, Mar 03, 2026 at 01:38:13PM +0100, Alexander Stein wrote:
>>>>> Hi,
>>>>>
>>>>> these days I noticed that there is a PCIe link regression on my
>>>>> i.MX8MP platform (TQMa8MPxL) running next-20260227.
>>>>> I could bisect it back to commit 9c03e30e3ade3 ("PCI: imx6: Skip link
>>>>> up workaround for newer platforms"). I always get the following errors:
>>>>>
>>>>> imx6q-pcie 33800000.pcie: Link failed to come up. LTSSM:
>>>>> CFG_LINKWD_START imx6q-pcie 33800000.pcie: probe with driver
>>>>> imx6q-pcie failed with error -110
>>>>>
>>>>> Connected is a Gen1 PCIe -> Ethernet adapter. Interestingly a Gen2
>>>>> device is detected without issues.
>>>>>
>>>>> Reverting 3c96a61dd2e098dda8dcac3dce3d38a3c87afbfc and
>>>>> b9a8d28ebbf118bb3eac953f4a37abbd341257ab "fixes" my platform, both
>>>> Gen
>>>>> 1 and Gen 2 devices are detect. Commit
>>>>> 3c96a61dd2e098dda8dcac3dce3d38a3c87afbfc is only required for conflict
>>>> free revert.
>>>>>
>>>>> Here is a summary with outputs:
>>>>> Gen 1 device
>>>>>> 00:00.0 PCI bridge: Synopsys, Inc. DWC_usb3 / PCIe bridge (rev 01)
>>>>>> 01:00.0 Ethernet controller: Realtek Semiconductor Co., Ltd.
>>>>>> RTL8111/8168/8211/8411 PCI Express Gigabit Ethernet Controller (rev
>>>>>> 01)
>>>>>
>>>>> Gen 2 device
>>>>>> 00:00.0 PCI bridge: Synopsys, Inc. DWC_usb3 / PCIe bridge (rev 01)
>>>>>> 01:00.0 SATA controller: Marvell Technology Group Ltd. 88SE9128 PCIe
>>>>>> SATA 6 Gb/s RAID controller (rev 20)
>>>>>
>>>>> output of "dmesg | grep imx6q-pcie". Common part for all tests:
>>>>>> imx6q-pcie 33800000.pcie: host bridge /soc@0/pcie@33800000 ranges:
>>>>>> imx6q-pcie 33800000.pcie:       IO 0x001ff80000..0x001ff8ffff ->
>>>>>> 0x0000000000
>>>>>> imx6q-pcie 33800000.pcie:      MEM 0x0018000000..0x001fefffff ->
>>>>>> 0x0018000000
>>>>>> imx6q-pcie 33800000.pcie: config reg[1] 0x1ff00000 == cpu 0x1ff00000
>>>>>> imx6q-pcie 33800000.pcie: iATU: unroll T, 4 ob, 4 ib, align 64K,
>>>>>> limit 16G
>>>>>
>>>>> next-20260227
>>>>> Gen 1
>>>>>> imx6q-pcie 33800000.pcie: Link failed to come up. LTSSM:
>>>>>> CFG_LINKWD_START imx6q-pcie 33800000.pcie: probe with driver
>>>>>> imx6q-pcie failed with error -110
>>>>>
>>>>> Gen 2
>>>>>> imx6q-pcie 33800000.pcie: PCIe Gen.2 x1 link up imx6q-pcie
>>>>>> 33800000.pcie: PCI host bridge to bus 0000:00
>>>>>
>>>>> next-20260227 + reverts
>>>>> Gen 1
>>>>>> imx6q-pcie 33800000.pcie: PCIe Gen.1 x1 link up imx6q-pcie
>>>>>> 33800000.pcie: PCIe Gen.1 x1 link up imx6q-pcie 33800000.pcie: PCI
>>>>>> host bridge to bus 0000:00
>>>>>
>>>>> Gen 2
>>>>>> imx6q-pcie 33800000.pcie: PCIe Gen.1 x1 link up imx6q-pcie
>>>>>> 33800000.pcie: PCIe Gen.2 x1 link up imx6q-pcie 33800000.pcie: PCI
>>>>>> host bridge to bus 0000:00
>>>>>
>>>>> What can we do here? I'm wondering why Gen 2 trains correctly, while
>>>>> Gen 1 doesn't.
>>>>>
>>>>
>>>> Thanks for the report and sorry for the breakage. Commit 9c03e30e3ade3,
>>>> mentions that the workaround is only needed for the i.MX6 platforms. So
>>>> I'm not sure why the patch breaks i.MX8M and that too only for Gen 1
>>>> speed.
>>>>
>>>> Also, before 9c03e30e3ade3, LTSSM was always started in Gen 1, but as per
>>>> your finding, only Gen 1 devices fail to work. So the code till
>>>> imx_pcie_wait_for_speed_change() shouldn't have an impact. Maybe the
>>>> issue is due to skipping imx_pcie_wait_for_speed_change()?
>>>>
>>>> Richard, thoughts?
>>> Hi Maini:
>>> Prior to calling imx_pcie_wait_for_speed_change(), the PCIe link must
>>>  already be established. Before commit 9c03e30e3ade3, the speed change
>>>  procedure was only initiated after the initial Gen1 link was successfully
>>>  brought up.
>>>
>>> Hi Alexander:
>>> Sorry for the breakage.
>>> Before commit 9c03e30e3ade3, i.MX8MP PCIe forced Gen1 link training
>>>  initially, then switched to Gen3 after link-up by triggering a speed
>>>  change. After commit 9c03e30e3ade3, link training starts directly at
>>>  the Gen3 capability level.
>>>
>>> The two link training methods differ only in the i.MX8MP Root Complex (RC)
>>>  link capability configuration prior to link training: one method forces
>>>  Gen1 speed, while the other retains the default Gen3 setting in your tests.
>>>
>>
>> I still don't understand why the link fails to train at Gen 1.
> 
> Independently from the configured maximum link speed, shouldn't the initial
> link be Gen1 anyway and upgraded to Gen 2 later on?
> 
> I added some debug output to dw_pcie_link_up()
> 
> imx6q-pcie 33800000.pcie: dw_pcie_link_set_max_speed: current pci->max_link_speed: 3
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08200000
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08200000
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f704
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x28000000
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f722
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
> imx6q-pcie 33800000.pcie: Link failed to come up. LTSSM: CFG_LINKWD_START
> imx6q-pcie 33800000.pcie: probe with driver imx6q-pcie failed with error -110
> 
> 
> imx6q-pcie 33800000.pcie: dw_pcie_link_set_max_speed: current pci->max_link_speed: 2
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08200000
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08200000
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x28000000
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x28000000
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x2800f702
> imx6q-pcie 33800000.pcie: Link failed to come up. LTSSM: CFG_LINKWD_START
> imx6q-pcie 33800000.pcie: probe with driver imx6q-pcie failed with error -110
> 
> 
> imx6q-pcie 33800000.pcie: dw_pcie_link_set_max_speed: current pci->max_link_speed: 1
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08200000
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08200000
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08000010
> imx6q-pcie 33800000.pcie: PCIe Gen.1 x1 link up
> imx6q-pcie 33800000.pcie: PCI host bridge to bus 0000:00
> 
> So for any maximum speed above Gen1 it seems that LTSSM is stuck at link
> training.
> Unfortunately only link training and link up bits are defined and RM doesn't
> show anything, so I don't know what the other bits are indicating.
> 
> For a Gen2 device the link training succeeds right away.
> 
> imx6q-pcie 33800000.pcie: dw_pcie_link_set_max_speed: current pci->max_link_speed: 2
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08200000
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08200000
> imx6q-pcie 33800000.pcie: dw_pcie_link_up: PCIE_PORT_DEBUG1: 0x08000010
> imx6q-pcie 33800000.pcie: PCIe Gen.2 x1 link up
> imx6q-pcie 33800000.pcie: PCI host bridge to bus 0000:00
> 
> Best regards,
> Alexander


