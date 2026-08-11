Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B056FC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Aug 2026 05:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fGCMCudQPIfNSyE/z15lzExG5h5W9AfLeMiFY/ee9OY=; b=h20jC5Jeu8hWYPSGMHeabrVe47
	1iwLsyxsQF5G8uzllxL/MA8qRu44jOWVfVwxptABDN58QMlzwZMRRUXN2D8tQGTNUKsmyWh62mNqu
	SrGGEAkhP1E7FNVOx9QEdge49/u4hw+ww54qlqdrCGu45bJbl10+a+GLpydo6jsv4/0jNVJrS1qWr
	KWx+2xF8/KX1Jmvw95qu6GNOcVzdMkfxPVCe9+4imOahKEVO4pBK99Vk92CcTQBYdscWIP2Z+ltA7
	/8+/hsdeGzgfLxQfYehYYKnUiOm6UwLCS5GGP8h7I7jPjQ8s86S9QtuWzD3cJhKZjoxpKluJZ/gHv
	eqCSRCOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfNl-0000000DLHD-3rHB;
	Tue, 11 Aug 2026 05:50:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfNd-0000000DLF7-2HIA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Aug 2026 05:50:33 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AMpnEZ3552848
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 05:50:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fGCMCudQPIfNSyE/z15lzExG5h5W9AfLeMiFY/ee9OY=; b=kf2O3pQMYB8pi+MU
	QHMlTa26UGMqs8WDovc57l/bDQQ9CN/FrrP6q/wywiLDVR6soh5+OLFyFM5dOvfM
	Opi6f3z8ejQcGvLDFoyOJEvMYupTNBL5H+JGv4rmVJoYWLRATUCiGbOZqpMq4jJT
	SttIB7ytPmea8fRq4sXoK5tS6rnn1zduX7SXOeiFYen4B4KlCyAO9To6rXOZmuqU
	y78V+VRO8M6ooH++UXxJWPPulbvY9gMLVuw1vAQwckXroaT7p2OfRYQaY+DCVgEr
	qIUgNmesNMSdXzHBrS43NMwZnquSz8IaaH1rQZUVuJ4J5pXOHT6jrvuwtMsK8Oq6
	Ypq7Ww==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyqmk16k2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Aug 2026 05:50:28 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so1881917a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Aug 2026 22:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786427428; x=1787032228; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fGCMCudQPIfNSyE/z15lzExG5h5W9AfLeMiFY/ee9OY=;
        b=c+1o7Rf1lhNv/FDkx/lNUyy5ThengBrcip4elnC4JXjucgN4LChxOQ520g2cV0ne2C
         03vayB8Piq6G+/zDd6/wBrhj99STzrw86rWLdhw3HGHfM6jgYx0Qk9RK63dntTFrnoje
         3VGkeGrVYSjU68YZGYXTTwaihwrxbk8hduUclUEMdaY0xjTTeSqAZ6XxFeL9Av5ScKvA
         Me8g5pVfNisLgM/4y8hztsN303Djr0wCNyX2nAvLX+/G0PxVRu233pG3sLmx3Q5AzX/2
         VG5+oG+YKMFa0EqXiJ2W0wMWr1JY74OHqLM+ewGIg2eBdCEYsH6CEfmQosIAfv1kQzyi
         BTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786427428; x=1787032228;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fGCMCudQPIfNSyE/z15lzExG5h5W9AfLeMiFY/ee9OY=;
        b=NDVShPf2NKB9E7wRbQFHVDA+kx2cbyXK6wWl+D5pOmyYkAl40BHSYuX6xnkiDKgHK9
         z1RT6IdaDLmCMlVJpfcJp00H8a1YW82IPfB2KhWYJSrr/mdeBtIUuS7kfD85jrfpIOTS
         LimVNxK7uX09K8sGUqObWxvhllojN7bLrvVn7JfkzYUatev9njDRu3nj3INmuQQhipLq
         Yfgrx5OAQ79ZoRCYBnYO05+a5MHhk+A7p7zySO4GI20IkRftVy/pOMrHddMfptrYtdEh
         wrEVXzA+aTzd2e1NOPYvRRX96JzY7rDW61EkmQeXMV34ipLB8SKkKJo0jJED2jzWUj+1
         kVHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqtS7U2GgYc2jtQJp9tzesDlOJkccMxHxEF0/xXSq2Xxpd0Sd/4GDVpfunvCVaY2CUU+GkILYPie7N87VM+g+WT@lists.infradead.org
X-Gm-Message-State: AOJu0YxH0UjP+TJBQLnB7hvt5490UUroMrOa02Glye/IP6kMEWm9sUU5
	qK999F8YBooCKfyGA49sPEn+G7cC8bbn7c86OV2eKe6wkhSaqSzEvPHiKx8erifCh0iCpi7B1Wp
	LkDHQHe+MWRJRhNXzkffuaIgszdlW1Og6ZP9JD7cUnCommmQHksXbxeKvqDdp8yCGsSDRw75ae3
	985A==
X-Gm-Gg: AR+sD10v7xCbcKtUVRHV7Rz9xxaVpDdGmy4CevpSoCVAj2Cb7SNMDP2xdS5+jI8cWuf
	H6Yu+65nPcjNAJaLTCxsH8CDI00wRTQcVaFvI+CB8rRpqcA/bEvUNxP96xeGSfH/0PvXd1zQkCn
	sN/pUuLIPUQdtPDtxN+bdND+5BPSbLYajDYHe3sruGASPzhGnr1j1WdnRGAZ/XkaDv0TzdHuC9V
	Yftk8/+zwE7uHSrstyen391yaU/km6It3a5I/aReJSDhcNOoISso/dLFbxuKMazjT0ymeEjN0Iz
	bPXZpXVuw+Sh4UUjfn9UYH5ONkuql9L3LQVyI/ZjMM/s7n828JhsQc6Hwg18ZnNG9mPiuJ2Cbom
	gq1bBMp9md4ILw4KWbR55GIkSrrFf
X-Received: by 2002:a17:90b:2689:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-392ec37c01cmr966949a91.6.1786427428010;
        Mon, 10 Aug 2026 22:50:28 -0700 (PDT)
X-Received: by 2002:a17:90b:2689:b0:37f:e1b6:4c7d with SMTP id 98e67ed59e1d1-392ec37c01cmr966903a91.6.1786427427551;
        Mon, 10 Aug 2026 22:50:27 -0700 (PDT)
Received: from hu-mkshah-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d534ab78sm2062289a91.12.2026.08.10.22.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 22:50:27 -0700 (PDT)
From: Maulik Shah <maulik.shah@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 11:20:02 +0530
Subject: [PATCH 2/2] pmdomain: core: Initialize state_idx to deepest state
 for OFF domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-domain_off_ss3-v1-2-6a0a0fc023f5@oss.qualcomm.com>
References: <20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com>
In-Reply-To: <20260811-domain_off_ss3-v1-0-6a0a0fc023f5@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Dmitry Osipenko <digetx@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786427415; l=3169;
 i=maulik.shah@oss.qualcomm.com; s=20240109; h=from:subject:message-id;
 bh=noGCtlEhc01PRgl/TejE7Msr9fur7y8T+UGMXIwtm0c=;
 b=D9am7/oqe122qna9Nn9H1nPHIpqFD1bL2sZOvl7tLN25181E35dmbfujCBe2tD9iPkJPBih/E
 KbnrOgeVBnNB64D06CJkjFUXgMU5qpDK66xl5dgHjd0dxpUt8CF9pNm
X-Developer-Key: i=maulik.shah@oss.qualcomm.com; a=ed25519;
 pk=bd9h5FIIliUddIk8p3BlQWBlzKEQ/YW5V+fe759hTWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA0NiBTYWx0ZWRfXxzKp7pRZSkfj
 84MKz/4QaivYzDkCWCTuZGyRn//FG4OT8OCWOjEm5srGljdF6TsFO1Xw8mwgQtuGdt1g2dJbMif
 AlqD6sDdB3R6P/qW30XrQzDU0oZoUTckqb3sKIAOIu9MIwT5YLi7DLUEKYx8z/YUJkHKQdGAyTb
 SzKG9UXW2lgHjXbalQsAbL5IFYzVIR1nfE2HH+ChHc7clnCce5rtHNCEvkDXj+Wdc6tEhyGefHM
 MbnXjvsW4dZszYb3emJHBH6wI5drA8z4ZrrtL/hNYRmu0NzbburwDFCgz/2q3Dk8iF/Y1v0UEs3
 NwA5C7EzV8sEWeguW4sZyzYVv9N7c0g6/EeDpGnXrzzkaAeB/NTjmcw4n/eyE4x1wtYTwNGEEuu
 rIS5Kgce1eTxtC44McMNyWiWWiZtKfFKLqmC075hRbiL3BPNIpnLXm6RRHHgySiIwaylBcxYaQl
 Rnozv561O/smEMSldaw==
X-Authority-Analysis: v=2.4 cv=O4YJeh9W c=1 sm=1 tr=0 ts=6a7ab824 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Z6difoz2d0IOI9WDWMkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA0NiBTYWx0ZWRfX8zjD57tEZrNx
 l+RjU+hueyl6i0RUxPIR5VZnPid5/u/Rj6bWgNfExuM+HhUvU8cIY6D3Ucl62lxih4RbArDHDpN
 dUtmLoL25zKntX6y686H0gMUzt/+t88=
X-Proofpoint-GUID: 3FYWMjc2lb5Bj7za7bo2DFn4uWakvNvY
X-Proofpoint-ORIG-GUID: 3FYWMjc2lb5Bj7za7bo2DFn4uWakvNvY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_225032_752113_E62D398D 
X-CRM114-Status: GOOD (  17.94  )
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

pm_genpd_init() sets genpd->status from is_off but never touches state_idx,
which stays at its kzalloc'd value of 0 (dt_idle_pd_alloc()) regardless of
is_off. A domain that starts OFF without ever having gone through an actual
power-off sequence is therefore left looking like it's parked at its
shallowest idle state (state_idx=0) instead of its deepest one, even though
it is fully powered down.

This is visible on hamoa, where cluster0/1/2 each expose two idle states,
CL4 (state_idx=0) and CL5 (state_idx=1, the deepest). When CPU-cluster
genpds are initialised directly into GENPD_STATE_OFF under OSI mode
("cpuidle: psci: Start CPU-cluster pmdomain OFF when OSI is used"),
clusters whose CPUs are excluded at boot (e.g. maxcpus=4, leaving clusters
1 and 2 untouched) never go through a power-off path, so their state_idx
remains 0 instead of the deepest 1. debugfs reports this as "off-0",
meaning the domain is off but parked at idle-state 0 (CL4) rather than
"off-1", idle-state 1 (CL5):

genpd_power_off() and genpd_sync_power_off() both gate parent power-off on
every child being at its deepest state index:

  if (child->state_idx < child->state_count - 1)
      return;

so the parent's check treats these fully-off children as "not yet at
deepest state" and refuses to power off, blocking the deepest system-level
low-power mode (SS3) from ever being entered.

Without this change:

  $ cat .../power-domain-cpu-cluster1/current_state
  off-0

  $ cat /sys/kernel/debug/qcom_stats/apss
  Count: 0
  Last Entered At: 0
  Last Exited At: 0
  Accumulated Duration: 0

Fix this at the source: when a domain is initialised OFF, set its state_idx
to its deepest state (state_count - 1) instead of leaving it at 0. This
makes genpd's reported state consistent with reality for every is_off=true
caller of pm_genpd_init(), not just the PSCI CPU-cluster case, and requires
no special-casing in the parent power-off checks.

With this change, the domain correctly reports its deepest state and SS3
is entered normally:

  $ cat .../power-domain-cpu-cluster1/current_state
  off-1

  $ cat /sys/kernel/debug/qcom_stats/apss
  Count: 218
  Last Entered At: 726792712
  Last Exited At: 726950687
  Accumulated Duration: 199888773

Fixes: e7d90cfac551 ("PM: domains: Prevent power off for parent unless child is in deepest state")
Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
---
 drivers/pmdomain/core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 842c4169e290..5d96d9eabc1f 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2409,6 +2409,8 @@ int pm_genpd_init(struct generic_pm_domain *genpd,
 	INIT_WORK(&genpd->power_off_work, genpd_power_off_work_fn);
 	atomic_set(&genpd->sd_count, 0);
 	genpd->status = is_off ? GENPD_STATE_OFF : GENPD_STATE_ON;
+	if (is_off && genpd->state_count)
+		genpd->state_idx = genpd->state_count - 1;
 	genpd_set_stay_on(genpd, is_off);
 	genpd->sync_state = GENPD_SYNC_STATE_OFF;
 	genpd->device_count = 0;

-- 
2.43.0


