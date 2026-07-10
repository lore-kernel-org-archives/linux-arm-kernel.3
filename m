Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F036EC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 01:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ii/LdTnc46om4DGVyz/NYIKpJ3UQPwVgIjRx2xQN044=; b=R36+MPyfYLEWBP
	P4uXi+hTrsNN0sJwikVP7s7XvXOzUJjrFKUcPPD0Rda9DdKpYo+zb1lZ01dp7loAFUdTsErKqIOZV
	NkEQ6cEgAVOph3Z7wTu9TCTla7KVCQq0+trBy8Pcy46w6HUDMkaAKKrmcYHPJUGPbJwLj6+8id9qP
	+aMzOSD2x/7ko3H8nKS+3zXEKLte6cfDimc3B4IyEtB7zyPYrbQo/GiXBsese/99x3NTkZ4f+swhc
	m/ld8s9yOWwOJ2ToMrtEURuzaB64+MixL8a6IcrQv1USiIlD82npGR2fNDUTneVJtsgJ18xksczTb
	5wqTtqJqi2mL6daxgYDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whzpl-00000003uLZ-47B5;
	Fri, 10 Jul 2026 01:15:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whzpi-00000003uLE-4BRs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 01:15:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A06PjG3357370
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 01:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ii/LdTnc46om4DGVyz/NYI
	KpJ3UQPwVgIjRx2xQN044=; b=cEVSLL7Otabi04fMxtMuVlqK+jG2V0lJoj48wk
	JNR6sjU0zro5GBF4E6vHGXmQBgrSuANmhO2SuS5Ax+p7eZxh2GHEFi1boYiEWHsG
	X8z+cYVvdoOj387HNLBZZAIXUKzoQeu4GPsz+jr0fcJf2oTpBm3TCOLDy69nBCEs
	ZedbStk0vNbTYBjXMWfIp0Yu5mAxs9XiRpF/Nvus+ijcky00R2vDFyDqD2uio4LI
	uhbCzWxRRhsjRTAzBA96kgh7SeCRDbVK92PMSfXK9Rzgg3qpagjuHnPJiP0agDOn
	NSXipbXqqfZg3N1mBMfKBQVcYjAsbX2RvFGXBkpdrWCVpO/w==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwe85cc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 01:15:13 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88aab7c1d4so337074a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 18:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783646113; x=1784250913; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ii/LdTnc46om4DGVyz/NYIKpJ3UQPwVgIjRx2xQN044=;
        b=cWBWhDSdiFJA1UCdocv832H4mO4y0RlxXx9YM7Fa8VzQe6gH1vC+gDC8ECCExM1a/J
         x3ZuNL3c/QUkkTwvRE6Zqp7z97qb+yjj+NSMUW3aIawufpzys1GQ+dhra5CboIRoVsKJ
         YLEGi4pukWUdqZgl3qHs+In3psjSG3y78Q//zFoBGr22elRQ1opne+FV/9UdUfm0sHa/
         p0xhKT6hMjOswBFzs+0i9vxhmn/xEQzSKHWNBpDELelg7EZ2Q5IFWFK2pku796v7QV0D
         Rz3rMqo4J47k9idfxKAfuzZVv//oG4dL9jWK0xbXxpi11F7guwgUDaalbYS7LObMaUN3
         mvrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783646113; x=1784250913;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ii/LdTnc46om4DGVyz/NYIKpJ3UQPwVgIjRx2xQN044=;
        b=mMlCQu3vk8081eTWIGFAFjov0l/R57UhFox95GGS+AuMt4QS4b5LO7alN8EvOERwBC
         uUnGLX9LO5IjGW3bEutQTY1rv+gD9Um6PE9Y2mAeeqORUz+vSZuoTvHKB7HuHf0BU4z/
         HjmVSTHp+r2JDbqxBPeKB+/bi4W3Mm1C8aDpTfZPqBzI2SZf6Lavqe51uFjCnqMZfUPr
         3UnagETJgPo4aBapkavv6oKjBHvhuQclzjcD51GkeordN4yRhY492BPi93r67sf9dzyE
         jw+wepenrMMk6BrHuiC4FYmlGvsOU5tpR8Cnxeswt2+lbhq51x/LIneCdyaKwUPOLYVO
         5vHQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpx6nPOI9EPDMoU9x+DDZKvu1nkN0A0KmhwZ/tG36kQ6If8wvC8zD4XmdLfixNgKq5CUDNFlHRoTv1suTyXePq4@lists.infradead.org
X-Gm-Message-State: AOJu0Yx74MGilohhKrGvR5YPxL1sJBvc0wsJgjKzy1TSU7PX2kD4qGd7
	5InIXbfN/lIdyJhViwrGmqsEos1UklrPDKTcU2jylr1cpJTmYcB1t2odVtRj1tM980aFFxihQef
	yHbAihJ8hRRWt046yyLdQg2oUpNOB0ho8VK4kJDALMketvcSHcZwogBDvSA94LbKN5U+1nJbshz
	tv2g==
X-Gm-Gg: AfdE7ck3a7rXyNGv0sYfVvSJ0l5+DM7+yMgg7UaOveSLcKzXlHwVepOHGFGCC0ig/vo
	n2LRd7qoAf/xPSHe/MM+WjBRi6FMjujSyDYwz1U429YGEKLyJJM646tzWzSGiwIJh7LT5kL0Tz+
	qHPWW+h9spWHt2jlYnqxazF+pj96SS16O0plZ/o3teuZfDKHe25A5rN+oqnAJyQP6kf5ZNq9Own
	QVsp2nhwzHVsNG7HXWQM0PWXc+Xs4CASpvxbGBTTaLwqKEcU+u2S2WJDUV+5Ku84ou6avznekgu
	6t3+X0N2G+SdksU6tKf6mxVPTNLTzZWnFSR8lf4uKj8AkhcOLF6cmpd8TKYYpcMXHZcPj79QY97
	9IBrVRqIy9BgSkSmI5tcSWDamxwrOQddU3OMQG8reVRmCoaslXJvelXvOMBybFP3BYlh83eRXGg
	==
X-Received: by 2002:a05:6a20:938c:b0:3b3:fc6:6226 with SMTP id adf61e73a8af0-3c0bcede14fmr13931060637.24.1783646113035;
        Thu, 09 Jul 2026 18:15:13 -0700 (PDT)
X-Received: by 2002:a05:6a20:938c:b0:3b3:fc6:6226 with SMTP id adf61e73a8af0-3c0bcede14fmr13931003637.24.1783646112558;
        Thu, 09 Jul 2026 18:15:12 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b31628c1sm4431251a12.19.2026.07.09.18.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 18:15:11 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v3 0/2] fix clock refcount imbalance for all Coresight
 platform drivers
Date: Fri, 10 Jul 2026 09:14:46 +0800
Message-Id: <20260710-fix-clock-refcount-unbalance-v3-0-a37a1fb17981@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIdHUGoC/43NSw6CMBCA4auYri3pQwu48h7GRRkGaYRWW2gwh
 LtbWLkw0c0k/2TyzUwCeoOBnHYz8RhNMM6mkPsdgVbbG1JTpyaCCcVyxmljJgqdgzv12IAb7UB
 HW+lOW0CKORxUzqXShSKJeKQbM2385Zq6NWFw/rV9i3zd/glHThmVgtegJPCmZGcXQvYcdQeu7
 7M0yOpH8WmKH6ZIppCFbKqqLI8Cv5jLsrwBYbN/1CMBAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783646107; l=6575;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=34mMKmz62IJJvQEQf4zpfUNRjPSA4yvuY3mKxmyPMcQ=;
 b=KF7fwSHd1M9K4mDW63yRx7Kh1NKtMqo+8BL/qyp05JXERIqtsYFyOnOTgL1EX9mrHxs3d5A32
 L28VmT9INGJD+8W/GufuXp8xAPeRtNf2hebaipcrCTyyeFQaGmwKKya
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a5047a1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9pHmQkOP4Je6lBMvZCAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAwOSBTYWx0ZWRfX3tegCtmeZdQu
 4nUvG/KGr6DdB1zO9CK3GTj0BBwrWutJ1oN6Qhu1HqKaPdkLET+YVLGVSvJ4zUEFrKe8kk4fYhs
 QhTfNJJDw6wrePdT/r60bW1sWSkKTrWXny4tQX0ACpkl8r2tfBxiCvC2I914RCn+GB+DDzTZ87v
 ndwRhF5AjwAjLQcBEzp0tJZ9gtInA+x7pfaKlo7TpsY+JfxnDVL8JTVzJv0Tnk+N/7qDJfeUbcJ
 FvgPqDfZBjpv9In1+/mGmWb2xKFTIkM7OdyVxvWbdT7ccNDSy5XKKK8Y9fATr8qFElaPv//Ee6A
 aUEbaTLP3GLQT8N3KrWmlZ3EyqsSxDteaomp9IIG6ZsaLqvcjSkpET5lek4JLajFGyhCnUK1/xJ
 mjttaVXXotS4cbw5skSMYG2l9hKh8gchZnlvidjuW+ixVND2RxxzJjVFz+DQNBKfQ989zsYp89b
 YCKTDJtGI+jRtM3kN5w==
X-Proofpoint-ORIG-GUID: FFnpYfyY-5Dw5y4n8KJ6i_bsy5HPk1Ko
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAwOSBTYWx0ZWRfX/Vqh84VeVt2c
 NXaRCvUlIKZLaz3HnW0ulmb3Dx9tEJlF5kAGKIsOrUJpfsVee5bE6mn7BySuxl6ALVPfw0IZeHI
 AUqjwcXz8eLN8oBQ+IDM+VJOleA3UUY=
X-Proofpoint-GUID: FFnpYfyY-5Dw5y4n8KJ6i_bsy5HPk1Ko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_181515_050670_57888D1B 
X-CRM114-Status: GOOD (  16.71  )
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

Resume the device with pm_runtime_get_sync() before tearing it down so
the clocks are enabled again and balance the devm-managed disable. Then
pm_runtime_set_suspended() and pm_runtime_put_noidle() leave the device
in a coherent runtime PM state (suspended, usage count balanced) once
the devm action has disabled the clocks.

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
Changes in v3:
- etm4x: bail out with WARN_ON() when drvdata is missing instead of
  silently skipping teardown, and call etm4_remove_dev() after
  pm_runtime_get_sync() so the device is resumed before it is torn down.
- collect reviewed-by tag from Leo.
- Link to v2: https://lore.kernel.org/r/20260702-fix-clock-refcount-unbalance-v2-0-2383fbb9952e@oss.qualcomm.com

Changes in v2:
- Balance the runtime PM state in the remove path: after
  pm_runtime_get_sync() and pm_runtime_disable(), also call
  pm_runtime_set_suspended() and pm_runtime_put_noidle() so the device is
  left suspended with a balanced usage count once the devm action has
  disabled the clocks.
- Picked up Reviewed-by from Yeoreum Yun on patch 1.
- Link to v1: https://lore.kernel.org/r/20260701-fix-clock-refcount-unbalance-v1-0-321dc63c1f90@oss.qualcomm.com

---
Jie Gan (2):
      coresight: Fix clock refcount imbalance on platform remove
      coresight: tnoc: Fix clock refcount imbalance on platform remove

 drivers/hwtracing/coresight/coresight-catu.c       |  8 ++++++++
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |  8 ++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |  8 ++++++++
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 13 +++++++++++--
 drivers/hwtracing/coresight/coresight-funnel.c     |  8 ++++++++
 drivers/hwtracing/coresight/coresight-replicator.c |  8 ++++++++
 drivers/hwtracing/coresight/coresight-stm.c        |  8 ++++++++
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  8 ++++++++
 drivers/hwtracing/coresight/coresight-tnoc.c       |  8 ++++++++
 drivers/hwtracing/coresight/coresight-tpiu.c       |  8 ++++++++
 10 files changed, 83 insertions(+), 2 deletions(-)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260701-fix-clock-refcount-unbalance-e7c467136a86

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


