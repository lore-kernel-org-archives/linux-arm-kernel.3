Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF29C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 06:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GDA5R3uG6L2cQs5Nts3tPd1DDLvHEkLmpFRRWHiKAnE=; b=2BXZoaWiufjEQJ
	iha0rixbVG1bBOq/Yu+WLBaobT3xoCRFMval5HYfg/DxA3BoYo34rj5WXFkHBlnqdsbHDmBU3huFi
	xhHvkwcqQPke2jKAvB+K99yxSf7zDY3yUYJcfLP5xfCpvzDcXZ0DxHCutyAEtXxgRg+oEujBGdEw9
	djmPfDVrun7ldgq6bZw3xOf2DMI7qAAeS0Kbxqe0ZYjusOe7GURLJTOSNGHvIlcQT/cHJInvzoswZ
	qsXt60Q4YqUjeV9oNKC89907+ZQOky5ptifeW7czi9KBDBrNoDx1sANW8f8lx36OVohpMZYSJ29Pj
	OGeefTRuVy4RzEB8TXGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weo4w-00000000laq-387n;
	Wed, 01 Jul 2026 06:05:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weo4u-00000000laU-2prx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 06:05:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lX39137151
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 06:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GDA5R3uG6L2cQs5Nts3tPd
	1DDLvHEkLmpFRRWHiKAnE=; b=TgOpehFSirBOwgqhrNU6IADbzS1zwQ1x7tSXqV
	HmvvXJpBhziOrT6RoVlllfyVufO9LXOrLrQIP8SesZkhgIufh8Vkr5uth1L+MpfK
	1JWBf9N4ShzOftLsgl6LGIyC0ytMYssEYiTv4YUEsIiJVGHIoLXFI67Bcf0vmVVw
	n8GIWq813WRTX9HAK6y2QesZq8JtXFW1UYPLZ/ytpULLv3AruREn/TEME3yZ0bbd
	9JjHjj+6L+xyltlVmQGTxi+CSnMGHFXkLJKeljs14EmhyOXfV2ZOHMy1Y1OVfrtd
	7kcokOBcia50USMYjlFmGzvHBE4dTyrkTXDAjcb2X6nwtKww==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4h0au1up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 06:05:42 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84622d6102dso546252b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 23:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782885942; x=1783490742; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GDA5R3uG6L2cQs5Nts3tPd1DDLvHEkLmpFRRWHiKAnE=;
        b=Ptl2Ly6avJWFmxQAEWj2KkXH+9PXsAy8yYRYmmGOztydqlFmoUGfUUINpnQkIqwSg+
         TDZmQS+vLGkQ9RUaUcZcCnEnnnEomap0pARoeuPcazEOUpAhxun2ZSAVWB9gunsD1Rkn
         Mhb+JO7hjJtSdzLy6wBBmy7+P6Telsl4gy7NS7IiEXyLT7pM1L6yqhmTjXIKNfB3PueS
         ITSohEPWVNbnHq7b8utJtUPypiVz2XYszTYxZhpcxdAGLYDyM8jwrWZgW8DqaEPqfIzI
         C69ULKiHVmCveHYrOPz9659ORYE2O8SVGOE/1y3wzWeVgyYqg4HH12bzR07UTS4TlIn1
         KHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885942; x=1783490742;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GDA5R3uG6L2cQs5Nts3tPd1DDLvHEkLmpFRRWHiKAnE=;
        b=mlXiv8dB6HVaDjcAR2UvcxQ5hcW7XYpk9VTdja6aRisT4q+/FNQUMjcJpQXw84e/Ob
         lzf1bwdSm2O59w7RnNtlXX2L2CE38w6R/9YW8n4fViScfjnQJZB5AXk+gAkZ5RYzhB/j
         sNvl2GnKoo/roPwWhSuNWhFoL+txkKpwdA/tEodlfhz4GDkcbQpUimh+vKQ0kmYWI+u4
         76s26Wy77A4Ym9tWjkgiNKuYX3CbdjxdaZgduvnFvGG5OZh6GranFJUK7eJkMZXJs8eB
         M67YSjyxsCfFag88Dz97LeWqSptlvMOJlE1DGeh57n0d9dTdw3L+4mIOgEB9uVl9MKpK
         u1kw==
X-Forwarded-Encrypted: i=1; AHgh+RqAnvffFMXFQ2KExENTbRW6US8uaaKKcss8c7Pb9+CRg+u12nNoeFk1Zfj3T4ajaVIY1GSSl0KPHuZR7AZJU85r@lists.infradead.org
X-Gm-Message-State: AOJu0YyE8kiGgej6smBQZ86pxDaZw3hMAlaRm4bBHELSVS+YyskB4Cm+
	q1tql3VxQThOASQszmbyfPuqhrJ762xlxTZcXmTFxFNQaB489KIYX4z2Mn/TuZcW9UAcMit6WCq
	mQgyQyI2B6rpIeORLYv7/e03b5QTeYGp/5bwPzt6rI0/bMOhw7eDETdWUsQG9No2xg2kjy8qOWl
	9gcw==
X-Gm-Gg: AfdE7cmV2gjs0OcEJaanzm6vuWrVgaP+lt8h3NAPVh5AfQ7XquPD9pZOzDW779gJEn7
	Z3yKDaiXAb04XNtY1ZRWl5+fYp5d9ippxKtt7N5IcUXrOvO+QQDuV1xMoodM2Wm+c2JAUaVi8dE
	On56h8kXH/oqYTLOXjBCSisO4Zf1Wd2/qA7MZ3eYK8oR8U/Di05rJ0T85eLB7xlMZfEc7R/KLm1
	IteMD7+zfT5b+pkpbx7t5SuHb+miM+n3vVSpZL4/QZaD029FB1HfnV9UR0FgIxF34Z8JBy2/0ep
	DXXyId54+ttPUngpCQq8nFkQdvMhj4X38utETiktUFOzrAL5V/sHjkDqcNlZV/tUcaCLiHS0xiN
	s4aiKnUiydSKza6yy/ZGy4bH9m+SW3IK6lNty1ZuP0UtigpCHc2fS6t0UCEfLIKJ/6thsr3DhBw
	==
X-Received: by 2002:a05:6a00:b53:b0:847:9b9b:8981 with SMTP id d2e1a72fcca58-847c08c536fmr192382b3a.33.1782885941974;
        Tue, 30 Jun 2026 23:05:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:b53:b0:847:9b9b:8981 with SMTP id d2e1a72fcca58-847c08c536fmr192347b3a.33.1782885941484;
        Tue, 30 Jun 2026 23:05:41 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cc6f2sm3317658b3a.30.2026.06.30.23.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 23:05:41 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH 0/2] fix clock refcount imbalance for all Coresight
 platform drivers
Date: Wed, 01 Jul 2026 14:05:01 +0800
Message-Id: <20260701-fix-clock-refcount-unbalance-v1-0-321dc63c1f90@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA+uRGoC/x3MQQqDMBBA0avIrB1IVJLSqxQX6TjaoTIpiSmCe
 HeDyweff0DmJJzh2RyQ+C9ZolbYtgH6BF0YZaqGznTOeGNxlh1pjfTFxDPFohsWfYc1KDGyp8F
 527vwcFAXv9rIfu9f43leXO3KYG4AAAA=
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Yeoreum Yun <yeoreum.yun@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782885936; l=5432;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=r4JcLkKmJUVUxNqFU0mbjS/4HaA9P0NCxNsscjdtOfk=;
 b=lpymk6EebR+Xl+a53YBsH6KMKgGXRRXPrp5wevlBOx/rGVMqPAdJa9W3HvSBrJjHqcJPBJqOG
 W5eRKSsLsHQD2EFa2Nmd9DWdt2VeL5vbx/qBYJ/PkP8ojIgudISRARw
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=OuF/DS/t c=1 sm=1 tr=0 ts=6a44ae37 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=4U_dmyjyNprtKVz-Sb4A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: nRGL0MfD5GgtUyWaWF4IWkAf98yKYLKm
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA1OSBTYWx0ZWRfX8Z5NUZZRmdtM
 hrxEJGxKQcdVrNJU8qrv2z9E7bcTI/S6TezLC2cnba9ZmB/m6BI2d1iaQ1OC95SdkrxLCR6BT4l
 SXwbGjUGV3eabztvffLt6To3lOX0npE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA1OSBTYWx0ZWRfX9hqSfvQw9qMn
 HcHZdBe1mNNgJj/VyKC1+A23cB/k069szZxjTI26rdQmgYbVaa4wEagsVTB0vUhVI0O+DVnTw5p
 FUrAfPhBvP3q5PQaDT+FI0Tvc/5zCFAQ1mviUsBCg74CaWxVgpqOLQa+jQvMYl58QjpBoSq/RoD
 2bN9x3TfEb+fdBmsbFKgrF3iw+QxulDTCFDoAYoY/Wdkva+836jEBGt2Z7c+DSbR4aWBZKPj8SQ
 mo3WS8TvNEB9wVQX38FegQRTsgqdy8tUBXB0bk40lLgmuIrttAel/xaDCnSxN5MHQ6UFWtqt69N
 kLmycl+43rDEEpK/ipDWoIw6KTurXxwm4BObWb20b9hpfaY0yZtroHPDpS9GV7CTGruTmJAg37I
 0RIwdLFj3rKB4SOtEVYfmqIy8CSBLlh51ytbd0+b2yc5F6sfg08AOwNVlQPlYRH8G0e7ww2ivss
 2vJLvRc5QsSYdqMtS7g==
X-Proofpoint-GUID: nRGL0MfD5GgtUyWaWF4IWkAf98yKYLKm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_230544_906894_3D997AB4 
X-CRM114-Status: GOOD (  13.31  )
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

Found a clock imbalance issue when remove the CTCU module.

coresight_get_enable_clocks() enables the programming clock and the
optional AT clock through devm_clk_get_optional_enabled(), which also
registers a devm action to call clk_disable_unprepare() when the driver
detaches.

After probe, pm_runtime_put() allows the device to suspend and the
runtime suspend callback disables the same clocks. During remove the
device is left runtime suspended, so pm_runtime_disable() freezes it
with the clocks already disabled. The devm cleanup that runs afterwards
calls clk_disable_unprepare() a second time, underflowing the clock
enable refcount.

Resume the device with pm_runtime_get_sync() before pm_runtime_disable()
so the clocks are enabled again and balance the devm-managed disable.

Calltrace:

[  194.074015] ------------[ cut here ]------------
[  194.078779] qdss already disabled
[  194.082210] WARNING: drivers/clk/clk.c:1188 at clk_core_disable+0x238/0x240, CPU#4: rmmod/508
[  194.090976] Modules linked in: coresight_ctcu(-) snd_soc_hdmi_codec snd_soc_core snd_compress snd_pcm_dmaengine snd_pcm snd_timer snd soundcore 8021q garp mrp phy_qcom_edp stp af_alg llc anx7625 typec pci_pwrctrl_pwrseq hci_uart qcom_iris v4l2_mem2mem btqca btbcm qcom_pon videobuf2_dma_contig rtc_pm8xxx nvmem_qcom_spmi_sdam qcom_spmi_temp_alarm videobuf2_memops qrtr videobuf2_v4l2 bluetooth msm qcom_stats pwrseq_qcom_wcn ubwc_config videodev ocmem ecdh_generic drm_gpuvm videobuf2_common drm_exec gpu_sched qcom_q6v5_pas kpp marvell videocc_sa8775p camcc_sa8775p ecc drm_dp_aux_bus dispcc0_sa8775p spi_geni_qcom i2c_qcom_geni llcc_qcom mc qcom_refgen_regulator phy_qcom_snps_femto_v2 phy_qcom_qmp_usb icc_bwmon phy_qcom_sgmii_eth dwmac_qcom_ethqos qcom_pil_info gpucc_sa8775p qcom_q6v5 stmmac_platform stmmac ufs_qcom qcom_sysmon drm_display_helper qcom_common pcs_xpcs phylink cec qcom_glink_smem qcrypto drm_client_lib mdt_loader dispcc1_sa8775p qmi_helpers phy_qcom_qmp_ufs libdes qcom_ice display_connector phy_qcom_qmp_pcie
[  194.091130]  qcom_wdt qcomtee nvmem_reboot_mode icc_osm_l3 qcom_rng drm_kms_helper cfg80211 rfkill socinfo fuse drm backlight stm_p_basic
[  194.196124] CPU: 4 UID: 0 PID: 508 Comm: rmmod Not tainted 7.1.0-next-20260623-00008-ga4671328ba36 #831 PREEMPT
[  194.206566] Hardware name: Qualcomm SA8775P Ride (DT)
[  194.211771] pstate: 604000c5 (nZCv daIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
[  194.218938] pc : clk_core_disable+0x238/0x240
[  194.223426] lr : clk_core_disable+0x238/0x240
[  194.227908] sp : ffff8000889fbb40
[  194.231327] x29: ffff8000889fbb40 x28: ffff0000972eb580 x27: 0000000000000000
[  194.238662] x26: 0000000000000000 x25: 0000000000000000 x24: 0000000000000000
[  194.245995] x23: ffffd181d3de4620 x22: ffff8000889fbc28 x21: ffff000082382810
[  194.253322] x20: ffff000082334a00 x19: ffff000082334a00 x18: 0000000000000006
[  194.260658] x17: ffffd181d293fb18 x16: ffffd181d295c3c8 x15: ffff8000889fb550
[  194.267991] x14: 0000000000000000 x13: ffffd181d4eea620 x12: 00000000000004cf
[  194.275346] x11: 0000000000000e6d x10: ffffd181d4f42620 x9 : ffffd181d4eea620
[  194.282676] x8 : 3fffffffffffefff x7 : ffffd181d4f42620 x6 : bffffffffffff000
[  194.290007] x5 : ffff000ead974248 x4 : 0000000000000000 x3 : ffff2e8cd9611000
[  194.297338] x2 : 0000000000000000 x1 : 0000000000000000 x0 : ffff0000972eb580
[  194.304671] Call trace:
[  194.307199]  clk_core_disable+0x238/0x240 (P)
[  194.311687]  clk_disable+0x30/0x4c
[  194.315192]  clk_disable_unprepare+0x18/0x30
[  194.319596]  devm_clk_release+0x24/0x3c
[  194.323578]  dr_node_release+0x1c/0x28
[  194.327466]  release_nodes+0x5c/0x90
[  194.331147]  devres_release_all+0x90/0x104
[  194.335364]  device_unbind_cleanup+0x2c/0x84
[  194.339762]  device_release_driver_internal+0x200/0x23c
[  194.345153]  driver_detach+0x4c/0x94
[  194.348835]  bus_remove_driver+0x6c/0xbc
[  194.352872]  driver_unregister+0x30/0x60
[  194.356914]  platform_driver_unregister+0x14/0x20
[  194.361753]  ctcu_driver_exit+0x18/0xdf8 [coresight_ctcu]
[  194.367308]  __arm64_sys_delete_module+0x1bc/0x298
[  194.372240]  invoke_syscall+0x54/0x10c
[  194.376114]  el0_svc_common.constprop.0+0xc0/0xe0
[  194.380956]  do_el0_svc+0x1c/0x28
[  194.384374]  el0_svc+0x54/0x3a0
[  194.387626]  el0t_64_sync_handler+0xa0/0xe4
[  194.391951]  el0t_64_sync+0x198/0x19c

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Jie Gan (2):
      coresight: Fix clock refcount imbalance on platform remove
      coresight: tnoc: Fix clock refcount imbalance on platform remove

 drivers/hwtracing/coresight/coresight-catu.c       | 1 +
 drivers/hwtracing/coresight/coresight-cpu-debug.c  | 1 +
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 1 +
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 +
 drivers/hwtracing/coresight/coresight-funnel.c     | 1 +
 drivers/hwtracing/coresight/coresight-replicator.c | 1 +
 drivers/hwtracing/coresight/coresight-stm.c        | 1 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 1 +
 drivers/hwtracing/coresight/coresight-tnoc.c       | 1 +
 drivers/hwtracing/coresight/coresight-tpiu.c       | 1 +
 10 files changed, 10 insertions(+)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260701-fix-clock-refcount-unbalance-e7c467136a86

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


