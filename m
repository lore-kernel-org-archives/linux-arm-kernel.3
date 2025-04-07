Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B764C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 13:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sswdE7b0COrK1xS5nDBAkZP8+l1zfmqgxXA1GZhphsA=; b=r6kt+CKHxeQayt4DzS0UkMkfzw
	46wYMVI5j8oSV6HG4UVQ+w9R4G/7OWLhc/ONO2Cai+fYhrOT0QxB97r5re8vIUvtaedldgTYHDXhc
	DGcpItpge3+h6Fajz0ANCOK8C6hACHMHpTrOTpG9y51vSCltiFPeYF7lJCGnFiPzlfMyiN/YKwySx
	5XrstkNnmkaeN8m5nFvZehENBzL/hPW8Mu4fOH5rWreTVxY9Ub4y6fSAEDnt9k+0Ccjet5tFKu3v5
	k45XOGj29rO7VrZ4vbK4bNkpNnas3UF5quAYBeSveZTfYJLa34No/I6X1cIN7BuYPpdiFyzuliICU
	0hV4WQvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1m7s-00000000OiN-240M;
	Mon, 07 Apr 2025 13:02:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1lkd-00000000J3e-2soV;
	Mon, 07 Apr 2025 12:38:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E9EB7106F;
	Mon,  7 Apr 2025 05:38:53 -0700 (PDT)
Received: from [10.57.70.149] (unknown [10.57.70.149])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D06EC3F694;
	Mon,  7 Apr 2025 05:38:49 -0700 (PDT)
Message-ID: <2792b9df-fc82-4252-af64-cf888a36f561@arm.com>
Date: Mon, 7 Apr 2025 13:38:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] iommu/mediatek: Fix NULL pointer deference in
 mtk_iommu_device_group
To: Chen-Yu Tsai <wenst@chromium.org>, Joerg Roedel <joro@8bytes.org>
Cc: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>, kernel@collabora.com,
 Joerg Roedel <jroedel@suse.de>, Jason Gunthorpe <jgg@ziepe.ca>,
 iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250403-fix-mtk-iommu-error-v2-1-fe8b18f8b0a8@collabora.com>
 <CAGXv+5HJpTYmQ2h-GD7GjyeYT7bL9EBCvu0mz5LgpzJZtzfW0w@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAGXv+5HJpTYmQ2h-GD7GjyeYT7bL9EBCvu0mz5LgpzJZtzfW0w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_053855_819434_2AEC17E7 
X-CRM114-Status: GOOD (  30.00  )
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

On 2025-04-07 6:17 am, Chen-Yu Tsai wrote:
> Hi,
> 
> On Thu, Apr 3, 2025 at 6:24 PM Louis-Alexis Eyraud
> <louisalexis.eyraud@collabora.com> wrote:
>>
>> Currently, mtk_iommu calls during probe iommu_device_register before
>> the hw_list from driver data is initialized. Since iommu probing issue
>> fix, it leads to NULL pointer dereference in mtk_iommu_device_group when
>> hw_list is accessed with list_first_entry (not null safe).
>>
>> So, change the call order to ensure iommu_device_register is called
>> after the driver data are initialized.
>>
>> Fixes: 9e3a2a643653 ("iommu/mediatek: Adapt sharing and non-sharing pgtable case")
>> Fixes: bcb81ac6ae3c ("iommu: Get DT/ACPI parsing into the proper probe path")
>> Reviewed-by: Yong Wu <yong.wu@mediatek.com>
>> Tested-by: Chen-Yu Tsai <wenst@chromium.org> # MT8183 Juniper, MT8186 Tentacruel
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>> ---
>> This patch fixes a NULL pointer dereference that occurs during the
>> mtk_iommu driver probe and observed at least on several Mediatek Genio boards:
>> ```
>> Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> 
> This is a reminder to please land this and send to Linus ASAP.
> 
> This fixes the v6.15-rc1 kernel on all the MediaTek Chromebook platforms,
> except for MT8188, which seems to have another issue in iommu_get_dma_domain()
> used from the DRM driver:
> 
>      Disabling lock debugging due to kernel taint
>      Unable to handle kernel NULL pointer dereference at virtual
> address 0000000000000158

 From the offset and the stacktrace code dump, this would appear to be 
the dereference of dev->iommu_group->default_domain, when 
dev->iommu_group is NULL (and CONFIG_DEBUG_LOCK_ALLOC makes the mutex 
really big). Which is a bit weird, as to get into iommu-dma at all in 
that state would suggest that whatever device this is has been removed 
and had its group torn down again after iommu_setup_dma_ops() has run... 
but either way that implies the DRM driver is passing an arbitrary 
device to the DMA API without making sure it's actualy valid.

Trying to trace the provenance of dma_dev from mtk_gem_create() back 
through the rest of the driver is quite the rabbit-hole, but it seems 
like in at least one case it can lead back to an 
of_find_device_by_node() in ovl_adaptor_comp_init(), which definitely 
looks sufficiently sketchy.

Thanks,
Robin.

>      Mem abort info:
>        ESR = 0x0000000096000005
>        EC = 0x25: DABT (current EL), IL = 32 bits
>        SET = 0, FnV = 0
>        EA = 0, S1PTW = 0
>        FSC = 0x05: level 1 translation fault
>      Data abort info:
>        ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
>        CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>        GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>      user pgtable: 4k pages, 39-bit VAs, pgdp=00000001185ab000
>      [0000000000000158] pgd=0000000000000000, p4d=0000000000000000,
> pud=0000000000000000
>      Internal error: Oops: 0000000096000005 [#1]  SMP
>      Modules linked in: mtk_vcodec_dec_hw mtk_vcodec_dec mtk_vcodec_enc
> v4l2_vp9 v4l2_h264 mtk_vcodec_dbgfs mtk_jpeg mtk_vcodec_common
> cros_ec_sensors mtk_jpeg_enc_hw cros_ec_sensors_core mtk_jpeg_dec_hw
> mtk_vpu v4l2_mem2mem videobuf2_v4l2 snd_sof_mt8186
> videobuf2_dma_contig snd_sof_xtensa_dsp sha1_ce videobuf2_memops
> mtk_adsp_common mtk_scp videobuf2_common snd_sof_of mtk_rpmsg snd_sof
> rpmsg_core cros_ec_sensorhub hid_google_hammer hid_vivaldi_common
> snd_sof_utils mtk_scp_ipi fuse
>      CPU: 6 UID: 0 PID: 12 Comm: kworker/u32:0 Tainted: G    B
>       6.15.0-rc1-00001-gfed05d98b726 #628 PREEMPT
> 06e695da6360d22824958738f9ba1c9b2416be19
>      Tainted: [B]=BAD_PAGE
>      Hardware name: Google Ciri sku2 board (DT)
>      Workqueue: events_unbound deferred_probe_work_func
>      pstate: 40400009 (nZcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>      pc : iommu_get_dma_domain+0x30/0x58
>      lr : iommu_get_dma_domain+0x30/0x58
>      sp : ffffffc080186ee0
>      x29: ffffffc080186ee0 x28: ffffff80c4c59028 x27: 0000000000000000
>      x26: 0000000000000014 x25: 0068000000000f0b x24: ffffff80c4c5ca28
>      x23: 00000000008ca000 x22: 1ffffff810030df8 x21: ffffff80c20ea010
>      x20: ffffff80c20ea010 x19: 0000000000000000 x18: 0000000000000000
>      x17: 3d3d3d3d3d3d3d3d x16: 3d3d3d3d3d3d3d3d x15: 0720072007200720
>      x14: 0720072007200720 x13: ffffff80c0a1bb80 x12: ffffffbae2ca45e9
>      x11: 1ffffffae2ca45e8 x10: ffffffbae2ca45e8 x9 : dfffffc000000000
>      x8 : 000000451d35ba18 x7 : ffffffd716522f47 x6 : 0000000000000001
>      x5 : ffffffd716522f40 x4 : ffffffbae2ca45e9 x3 : ffffffd713717e6c
>      x2 : 0000000000000001 x1 : ffffff80c0941dc0 x0 : 0000000000000001
>      Call trace:
>       iommu_get_dma_domain+0x30/0x58 (P)
>       __iommu_dma_alloc_noncontiguous+0x34/0x498
>       iommu_dma_alloc+0x2f0/0x3e0
>       dma_alloc_attrs+0x1b4/0x3b8
>       mtk_gem_create+0x124/0x170
>       mtk_gem_dumb_create+0x84/0x180
>       drm_mode_create_dumb+0xf8/0x128
>       drm_client_framebuffer_create+0x11c/0x240
>       drm_fbdev_dma_driver_fbdev_probe+0x154/0x5a0
>       __drm_fb_helper_initial_config_and_unlock+0x4f0/0x928
>       drm_fb_helper_initial_config+0x50/0x68
>       drm_fbdev_client_hotplug+0xc0/0x120
>       drm_client_register+0xa0/0x100
>       drm_fbdev_client_setup+0xc8/0x260
>       drm_client_setup+0x60/0xd0
>       mtk_drm_bind+0x4f0/0xaf0
>       try_to_bring_up_aggregate_device+0x258/0x2f0
>       __component_add+0x104/0x240
>       component_add+0x1c/0x38
>       mtk_disp_rdma_probe+0x180/0x260
>       platform_probe+0x98/0x128
>       really_probe+0x118/0x3c0
>       __driver_probe_device+0xc0/0x198
>       driver_probe_device+0x64/0x1f8
>       __device_attach_driver+0xf0/0x1b0
>       bus_for_each_drv+0xf4/0x178
>       __device_attach+0x120/0x240
>       device_initial_probe+0x1c/0x30
>       bus_probe_device+0xdc/0xe8
>       deferred_probe_work_func+0xec/0x140
>       process_one_work+0x428/0xa80
>       worker_thread+0x2c0/0x538
>       kthread+0x258/0x380
>       ret_from_fork+0x10/0x20
>      Code: 97e8f12c f9422673 91056260 97e8f129 (f940ae60)
>      ---[ end trace 0000000000000000 ]---
>      Kernel panic - not syncing: Oops: Fatal exception
>      SMP: stopping secondary CPUs
>      Kernel Offset: 0x1693600000 from 0xffffffc080000000
>      PHYS_OFFSET: 0x40000000
>      CPU features: 0x0e00,000002e0,01202650,8200720b
>      Memory Limit: none
>      Rebooting in 30 seconds..
> 
> 
> 
> Thanks
> ChenYu
> 
>> Mem abort info:
>>    ESR = 0x0000000096000004
>>    EC = 0x25: DABT (current EL), IL = 32 bits
>>    SET = 0, FnV = 0
>>    EA = 0, S1PTW = 0
>>    FSC = 0x04: level 0 translation fault
>> Data abort info:
>>    ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
>>    CM = 0, WnR = 0, TnD = 0, TagAccess = 0
>>    GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
>> user pgtable: 4k pages, 48-bit VAs, pgdp=0000000101380000
>> [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
>> Internal error: Oops: 0000000096000004 [#1]  SMP
>> Modules linked in: btusb btrtl mt6315_regulator btintel mtk_vcodec_dec
>>    btmtk v4l2_vp9 btbcm mtk_vcodec_enc v4l2_h264 mtk_vcodec_dbgfs
>>    bluetooth mtk_jpeg ecdh_generic mtk_vcodec_common mtk_jpeg_enc_hw
>>    mtk_jpeg_dec_hw ecc v4l2_mem2mem rfkill videobuf2_dma_contig
>>    videobuf2_memops videobuf2_v4l2 videodev videobuf2_common mc
>>    mt6360_charger mcp251xfd it5205 goodix_ts can_dev panfrost
>>    drm_shmem_helper gpu_sched lvts_thermal mtk_svs mtk_adsp_mailbox
>>    snd_soc_dmic mtk_scp mtk_rpmsg mtk_scp_ipi mtk_cmdq_mailbox
>>    mediatek_cpufreq_hw spmi_mtk_pmif fuse dm_mod ip_tables x_tables
>>    ipv6 mediatek_drm tcpci_mt6360 drm_display_helper drm_client_lib
>>    tcpci drm_dma_helper drm_kms_helper tcpm drm mtk_mutex mtk_mmsys
>>    typec rtc_mt6397 mtk_cmdq_helper phy_mtk_pcie pcie_mediatek_gen3
>>    dwmac_mediatek stmmac_platform stmmac pwm_mtk_disp pcs_xpcs pwm_bl
>>    backlight
>> CPU: 5 UID: 0 PID: 12 Comm: kworker/u32:0 Not tainted 6.14.0-next-20250326 #4 PREEMPT
>> Hardware name: MediaTek Genio 1200 EVK-P1V2-EMMC (DT)
>> Workqueue: events_unbound deferred_probe_work_func
>> pstate: 80400009 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>> pc : mtk_iommu_device_group+0x2c/0xe0
>> lr : __iommu_probe_device+0x130/0x490
>> sp : ffff8000827b3970
>> x29: ffff8000827b3970 x28: ffff0000c0028000 x27: ffff80008164f2b8
>> x26: ffff0000cbc47130 x25: ffff80008096a9f0 x24: ffff80008164f5a8
>> x23: ffff800082684b60 x22: ffff8000827b3a80 x21: ffff0000cbc47130
>> x20: ffffffffffffffed x19: ffff0000c117c010 x18: 0000000000000000
>> x17: 6f702d616d642d64 x16: 6574636972747365 x15: 0000000000000002
>> x14: 0000000000000000 x13: 0000000000128d55 x12: 6f632d616d642e30
>> x11: 0000000000000100 x10: 0000000000000001 x9 : 0000000000000220
>> x8 : 0101010101010101 x7 : ffff0000c117c010 x6 : 306c766f2c727461
>> x5 : 0000000000000000 x4 : ffff0000c10a2de8 x3 : ffff0000c10a2e70
>> x2 : ffff0000c01a4600 x1 : 0000000000000000 x0 : ffff0000c65470c0
>> Call trace:
>>   mtk_iommu_device_group+0x2c/0xe0 (P)
>>   __iommu_probe_device+0x130/0x490
>>   probe_iommu_group+0x3c/0x70
>>   bus_for_each_dev+0x7c/0xe0
>>   iommu_device_register+0xd8/0x22c
>>   mtk_iommu_probe+0x270/0x53c
>>   platform_probe+0x68/0xd8
>>   really_probe+0xbc/0x2c0
>>   __driver_probe_device+0x78/0x120
>>   driver_probe_device+0x3c/0x154
>>   __device_attach_driver+0xb8/0x140
>>   bus_for_each_drv+0x88/0xe8
>>   __device_attach+0xa0/0x190
>>   device_initial_probe+0x14/0x20
>>   bus_probe_device+0xb4/0xc0
>>   deferred_probe_work_func+0x90/0xc8
>>   process_one_work+0x148/0x284
>>   worker_thread+0x2cc/0x3cc
>>   kthread+0x12c/0x204
>>   ret_from_fork+0x10/0x20
>> Code: b4000500 f9401c01 92800254 f9409821 (f9400035)
>> ---[ end trace 0000000000000000 ]---
>> ```
>>
>> I've tested this patch on Mediatek Genio 510-EVK and 1200-EVK boards
>> with a kernel based on linux-next (tag: next-20250327).
>> ---
>> Changes in v2:
>> - Fix goto label usage in device registration error case
>> - Add review and test trailers
>> - Link to v1: https://lore.kernel.org/r/20250327-fix-mtk-iommu-error-v1-1-df969158e752@collabora.com
>> ---
>>   drivers/iommu/mtk_iommu.c | 26 +++++++++++++-------------
>>   1 file changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
>> index 034b0e670384a24df10130cbbff95ce8e0bc092d..df98d0c65f5469c6803cd9d151c85ad855558cf5 100644
>> --- a/drivers/iommu/mtk_iommu.c
>> +++ b/drivers/iommu/mtk_iommu.c
>> @@ -1372,15 +1372,6 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>>          platform_set_drvdata(pdev, data);
>>          mutex_init(&data->mutex);
>>
>> -       ret = iommu_device_sysfs_add(&data->iommu, dev, NULL,
>> -                                    "mtk-iommu.%pa", &ioaddr);
>> -       if (ret)
>> -               goto out_link_remove;
>> -
>> -       ret = iommu_device_register(&data->iommu, &mtk_iommu_ops, dev);
>> -       if (ret)
>> -               goto out_sysfs_remove;
>> -
>>          if (MTK_IOMMU_HAS_FLAG(data->plat_data, SHARE_PGTABLE)) {
>>                  list_add_tail(&data->list, data->plat_data->hw_list);
>>                  data->hw_list = data->plat_data->hw_list;
>> @@ -1390,19 +1381,28 @@ static int mtk_iommu_probe(struct platform_device *pdev)
>>                  data->hw_list = &data->hw_list_head;
>>          }
>>
>> +       ret = iommu_device_sysfs_add(&data->iommu, dev, NULL,
>> +                                    "mtk-iommu.%pa", &ioaddr);
>> +       if (ret)
>> +               goto out_list_del;
>> +
>> +       ret = iommu_device_register(&data->iommu, &mtk_iommu_ops, dev);
>> +       if (ret)
>> +               goto out_sysfs_remove;
>> +
>>          if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
>>                  ret = component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
>>                  if (ret)
>> -                       goto out_list_del;
>> +                       goto out_device_unregister;
>>          }
>>          return ret;
>>
>> -out_list_del:
>> -       list_del(&data->list);
>> +out_device_unregister:
>>          iommu_device_unregister(&data->iommu);
>>   out_sysfs_remove:
>>          iommu_device_sysfs_remove(&data->iommu);
>> -out_link_remove:
>> +out_list_del:
>> +       list_del(&data->list);
>>          if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM))
>>                  device_link_remove(data->smicomm_dev, dev);
>>   out_runtime_disable:
>>
>> ---
>> base-commit: bc960e3e32c8b940c10b14557271355f66ae4db1
>> change-id: 20250327-fix-mtk-iommu-error-af6ec347d057
>>
>> Best regards,
>> --
>> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>>


