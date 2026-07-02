Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55CF6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QZ4m0ub7YcDOAkKIrEUkJb+UvLZJSVJAdOzyniML2WU=; b=O4kxF0E/P/OHUY
	H2GdFY8FLLAwxLWmmcridoP75dIAswH7GQMaUCvyNE5UfmefwlK0kuFbvebF3UL8IvrilhdxTvCds
	E6fqh/XuAIYkEHa+1U4aser3Yq534GewlaxkZsO4XrgUQa7j3xJeWgIzMRikg1xw4cPbARJrLvPla
	3fLXIQcqn2IMzl5T4UCfLZqfa++9ekhCc9VIWHti+p5ZvFxg7ONBq1Jy4wWBgRk7s7Je/JwE1NMqN
	/ec3h2hybP93Z9IwYSW3c9uNLBfHykHiUkW3reCibT1GD82axynFzUqKhECG1IMfJImRmIoNQvoe0
	5jQ5826XlHzrVRnQFLqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDC5-00000003vMl-0G9A;
	Thu, 02 Jul 2026 08:54:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDC1-00000003vMO-3rKi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:54:47 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624iIsw3591717
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Jul 2026 08:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QZ4m0ub7YcDOAkKIrEUkJb
	+UvLZJSVJAdOzyniML2WU=; b=PslQsynnTcRNiMASNj6MqYGjpJoGC/owxLkQQT
	5Ks5bTo5bdNDSJLNbWoyhx3zj3NlzOdhcjACZ2Kgn34VNPsFzk8JuaDxTWYpJls3
	TJNpVfcOO1ADHiIfdzfGG99RRNf0ATjC0J5SOryJNiPg2RK5RQBtAGu5grtDOuXI
	gNy7Gj+hRlZJ8Ibeez6umnlsbS1vtttSaRtozscaY3btclZNwgLdIUmxjZQrCz4N
	EWhoL9F7i7bYch3Xi1lnlSYL+IujmTCu1tOJHaRuC4pi9HpWrupy5OYV4qsnZlDq
	KduxKtvU3JDW23IHyGbaHLRwZEI5sswSHIteYRXr8/fqIB9w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n8w8d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 08:54:45 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847a225cd91so1647113b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 01:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782982485; x=1783587285; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QZ4m0ub7YcDOAkKIrEUkJb+UvLZJSVJAdOzyniML2WU=;
        b=T3yI/HLALQgNEkGVURwIok9VjCPosySgieJFJLuQoEvZMulA/SYbBGsIQZads3/bnq
         ZEe0fcjVxQUF+tJBQ2JvnH1+zu/YIyeHY8bPhZMFrlorktbPNenHiq+4IcNUDHx5ZlK7
         +cl06N0BHHp8TMrwdAjBowtCJ8NHz+zT0E5yG6u/bbQol+J0Nh9gUmssMLXhYYWUg5Ec
         1c0ug1rmR7QdgNa+jDdEH3v6homIy8THCc6PO3nvRWi5hBIYynvWAmOVOYUFwmwtm+g0
         HOIgPnv78QFGVXmSOyTStU/bDUo3c/e3U03UFZqR9ziHRcCTTuh7DfmQn1EhRyZ+ItX7
         EyUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782982485; x=1783587285;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QZ4m0ub7YcDOAkKIrEUkJb+UvLZJSVJAdOzyniML2WU=;
        b=MXwn1klSd/3dspJraUCIdbrPv5H/pkaZHC+Cdb/D167gLKoVnUDwQ0SGL4nlYV/gF0
         vxXavDm261wFOPzwJcqHSfgkSwsGlnpyOkkdoPtk5kM0HEWkcGteaeFOaP+3yH5Ef4lD
         4wInwT17qPlmSoARaiDWPXhOG3spwVtv0dZAOgSb6nmZuFJI5jIA8IDQwL0tBCdumftZ
         2TJHWmobVYTW4VNskcpuJMQHejusAWqrhwnawy0DMePJ0SA3lyxKxg6aA4pLysrxnb3w
         TL67KdoMc0p19GDJp5aN4EkuoI1DLWumVXXnLrrAeRkfoGx+YtFKZNJIax8E1V/1C2c8
         3rOQ==
X-Forwarded-Encrypted: i=1; AHgh+RrleWWYLZQlNVvrPLNRITsb1sW/HdqJBsKPRae5Eaf3lyWrz5PHRHsiQmOYZj0YNlLCWvjmNq71NISq0PK8hiT6@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu97Mwg+ecISz4MP3V669kZ7NliuCNLrEzIwJzBHNVMSZEvZfE
	rvpIVt5KqEZek0cqCfKz8PeyTFvZ75nXLZcMBVORHA9jj7gW6oC0l354z8pRHEk8ydWwzlY+upV
	6bLxkH8lRfrQr5tnwC6m9IZqY4NIFdgfewyZ9EGUm+iaDJDa3bf/po7hSMV9vId4HLjKwpFkM/2
	Qxiw==
X-Gm-Gg: AfdE7cnQ8SoFUXY9MLnLO4vNDCEf20+yWT1gX1S+G3f28yt/KphucWPiftym5y3CzgQ
	lO6bLE/eoCFdkQdMvk6BMwfdzpUcbb5KdDG60UyjrFfEFqT4ad8UkFVjhPWkg01BiDUKqSqNcya
	Cb7HVi1xSNauqs1+kadQwMtEhUX0ZHRf0OBgk5wq1dkioqM7c0MCxJ636dWPH9a8sLe6dFNOoQL
	FxUQNVEbIJgIvdJUemM1MJmh3ZYRyNo2ivTmwEyL/S7sIJF8+0+RO/mWfBmeYeX7i9EqFp6ZfDC
	XsIwlRebF/x3xwx9oWz6XJtrpfRyuTMS8ZhU0wLxdRj+W3bofcikm3f0O1AM0ZM9PZr6S6MmlND
	dcNaQZ3npfIGotQYO/pGCDnRoB6vpZr1+9M8DO8WOOrWjSjda0N+ro08bQFGctLBlkbz2ZETNWQ
	==
X-Received: by 2002:aa7:9a82:0:b0:842:4f20:53ff with SMTP id d2e1a72fcca58-847c5183cccmr4146363b3a.42.1782982484304;
        Thu, 02 Jul 2026 01:54:44 -0700 (PDT)
X-Received: by 2002:aa7:9a82:0:b0:842:4f20:53ff with SMTP id d2e1a72fcca58-847c5183cccmr4146338b3a.42.1782982483610;
        Thu, 02 Jul 2026 01:54:43 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb7933e1sm1003514b3a.26.2026.07.02.01.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:54:42 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Subject: [PATCH v2 0/2] fix clock refcount imbalance for all Coresight
 platform drivers
Date: Thu, 02 Jul 2026 16:54:18 +0800
Message-Id: <20260702-fix-clock-refcount-unbalance-v2-0-2383fbb9952e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADsnRmoC/42NQQ6CMBBFr0Jm7ZC2mKKuvIdhUYciE6HVFgiG9
 O5WTuDmJ+/n5/0Nog1sI1yKDYJdOLJ3GdShAOqNe1jkNjMoobSohcSOV6TB0xOD7cjPbsLZ3c1
 gHFm0NR11LSttThqy4pU3vO76W5O55zj58NnfFvlr/xQvEgVWSrakK5LdWVx9jOV7NgP5cSxzQ
 JNS+gLX6xrUzwAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782982477; l=6168;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=IdXInZ+yzXcXbw1SELbxEyMpDMDJRzZpTkeQpkosYh0=;
 b=gmAN1oKDUiJFXGKvn1W5AMzMe+Qxk1Y2kQLaa8n19cvXooJTLYX/Hhy8A2GAeEHuourxp9A+/
 LBtovf76zdECez6YOLGYGR69HNOKQZfFAXWyiZChqV2MUSUtBiuWCFB
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5MSBTYWx0ZWRfX5HN4LzUON55U
 kSsFaxfF3CcFUiTo0Oq4oqsD4+U+bQN8Pi42ULGfEPQV6hvANJQjmZf+AwVp+i/E+a9QfXEJUFg
 QBCIirA3kX5vZvTzdrW+D8jSia7IZva63qoEZLhn6iLLBuQLtaL/beyT2TahMUSwJaqevwLUcgP
 9eGHNHdXdzNm7gYc2YJvxP2Tx4mzkiOOdEsUcWplymSUHg7aoDeWswLlMDdfG/AZtrtBxkEn7pz
 vxC/s+gA7HwV/KMHVyBhzuO+sFmO8AfASKFoCpxkvQ7VDN9+lzPsW2l/87dq7rblu1xXYUNKvs7
 qPBrsJx8AnhwzF+nTAq03DSXpMMhlt5HFR5cqrtS1Ddw9Ir1tZUs0eYFBqq4G1L/PoSdaHMsT60
 ZmF7aY9nDKCm1bkOiAoeYWQjzUnKvcoEFU2UWEVscqrA8b10WqIUrGlps+JM/suxHFVXB1nKGQd
 x/4kk7nedd/R/FFwEQw==
X-Proofpoint-ORIG-GUID: 3FjkqdYYKtlcg88FMzvbnlsyh-c5-1b2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5MSBTYWx0ZWRfX//xPEuTITe/x
 64RhcAE49ozRVwDCJoTYP+UQ7+ZvUHJiXmzoqzc3Vz+6iLlBR1g3FXiY0w8pXRT/NFcWWCbobRJ
 Jazr4hnEEb7z5l0H03YJ1yJblZCymNI=
X-Proofpoint-GUID: 3FjkqdYYKtlcg88FMzvbnlsyh-c5-1b2
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a462755 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=9pHmQkOP4Je6lBMvZCAA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_015446_010064_C929239E 
X-CRM114-Status: GOOD (  15.31  )
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

 drivers/hwtracing/coresight/coresight-catu.c       | 8 ++++++++
 drivers/hwtracing/coresight/coresight-cpu-debug.c  | 8 ++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 8 ++++++++
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 8 ++++++++
 drivers/hwtracing/coresight/coresight-funnel.c     | 8 ++++++++
 drivers/hwtracing/coresight/coresight-replicator.c | 8 ++++++++
 drivers/hwtracing/coresight/coresight-stm.c        | 8 ++++++++
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 8 ++++++++
 drivers/hwtracing/coresight/coresight-tnoc.c       | 8 ++++++++
 drivers/hwtracing/coresight/coresight-tpiu.c       | 8 ++++++++
 10 files changed, 80 insertions(+)
---
base-commit: be5c93fa674f0fc3c8f359c2143abce6bbb422e6
change-id: 20260701-fix-clock-refcount-unbalance-e7c467136a86

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


