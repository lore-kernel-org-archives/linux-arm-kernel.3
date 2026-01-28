Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCAED25B47
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 11:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=26elPWs7TSj/P1iv30rj+NWpCzRlNUklVKX54bnVcaQ=; b=GmkGVNz8yq9NmQzGKITYQc+VRx
	YhqVSgPnkV9vLJRGi+KTb4GGsSnfq3wOf88Nq1No2WBoxrpYcL7skNOGTRo9jzahNel2xkhbkV1El
	AAU/1rjjvfQX63t6ocMK+OS3yw4k82TrkeRCMepQ511ajB2KQEJWeKPYWpkmuUVYp5cG2dPYCEtld
	9+hFk1ewuoaynXzhY2ZqVlBh4C9NRY3QxCYGH+W2bNbtFmdqbzNm4hTM3x1RJXyWpLMIpiMfKu6+l
	yKxE6G8/BSnquaQA44clX8x4/q8siGH2hloQa9iBRBlgiQM+hUzrfdB7jtpgoGMlLEw+2q4TZrv7l
	wO4z+mzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3uw-0000000Fwas-47f1;
	Wed, 28 Jan 2026 11:41:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl3ur-0000000FwZF-0IAw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 11:40:58 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60SBdwSj1750502
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 11:40:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	26elPWs7TSj/P1iv30rj+NWpCzRlNUklVKX54bnVcaQ=; b=P8RYbQiU17NBiLJI
	Aqiq4/+WZO2pvPZm/LkwqpkLQ8KWPo0Gw4ClFGSJngWW0mp63MLm5jbfn0nIQFue
	mFZmsfeiG+H+hs21ctEhqZI5l7ytzHdzxjFeCrPXeUOH9szwmcpB5o3amv/q4291
	bsymptpgkWzz332RAd13uGxXTzGHMr8XHIsJZcyhkSlHnDQDduZdFYEopnGXjYh6
	GznBC0CFSCVYY966uhnloEp5jNsmj5l17GxjSHShdNL+7b+ByiLKDee3glfMLO6w
	1Cldlr4Bel+mCwA67Xcrs7XsvMYp1nufzh503woCnjSyMdfgUu6qN9MuZOrGB+C2
	Kr+EWA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4byhsj805s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 11:40:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c551e6fe4b4so4159725a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 28 Jan 2026 03:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769600456; x=1770205256; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=26elPWs7TSj/P1iv30rj+NWpCzRlNUklVKX54bnVcaQ=;
        b=TkH+yYk6fqe1oZTqRS+YKJJ0Mu0V1U8idtruFfuAyRxY0r/6EflMHGokNsIM59Lui+
         lFGRPiyYw11FPULMQNlXdkL12OjTWPwQ07ZMbfsk3l+0o9GMwI9O+/sRaWuRIwaZ+23u
         mbcvZy7gcZoKSyrA382+NEZp6sg8zlaQjU8mWdumv8rpocTTpbKL6SCJtWnV/kku84lu
         yvaQlVqJGX/maqqpLQYmprOy5Fd/Je1nlC5MvuDvsYYwungiDus178dz/6KHamaW1znt
         2shjmtseRlRZVjnYkyoPOAHGk4BjXr6I9e4m1qGY8b6eNZ5cqdiPMgARx4p8xwWiPxZK
         jc8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769600456; x=1770205256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=26elPWs7TSj/P1iv30rj+NWpCzRlNUklVKX54bnVcaQ=;
        b=aUoOa9Kz+TKItC3h9xZQp+1wll3cd1SxFULWJiWcJmJWA2H3+10Fc7QE/8vCuxEsKG
         uTX3wlOtDu+ypIUTQaF1ayhFGT/WzA+rHfsTzKvTDRUZmKyrDaEqaecB1yMhoPDlHhaJ
         1T0sMf17kwOGegM52AlWp2w0//mPsO/lmSK/sx8vjpy6yB5hCqMzjZLpeimgsRmF+g2j
         dXzanuk9y8nvDF1uu/CQfeQp2LYLP3RuPz/RCZjai1+gOKLRYatRRW8+YX1HpBoDRA2l
         RjVn4yF/ZsCxxS4aToGpCI84nChq9uGN72GgHG/49TROiHnz8ww/3aLrg+VLBk43mP1Y
         OqAA==
X-Forwarded-Encrypted: i=1; AJvYcCWPDEZ/PiLaPkLO/vPPThPEeFtL/2L/a6KfZGzrPGzxYtGgwitPAZDHObQMA8TlcdIAVR6gqm9nmwW5Npe56BZ2@lists.infradead.org
X-Gm-Message-State: AOJu0YwJO8IKiFZjx+Z0sV9Y8WhUn21Zdt0SwD/XRH9+ydpbq44amNoC
	k06JBXX4nTqTSqy4QHpvA3hHr5zD1+FayKYCo6kUT9E6tjBi2IpwWBMHlxD0/7iNHEhQuDIJO9m
	x2VTwsDKe3HUF2PNvWOJYHt6L3/Y/a9alB3tIWAmZt5HYDdqfEEPbdkzAWGleeysPZPpzBO/VM+
	zO4w==
X-Gm-Gg: AZuq6aI+Ubq7AGthpYICprn+wZuJuVVs9cCWG6BH+KB1lQxdynucCR8oQZGm3E95WN+
	ivlN1oCasoMcLiOmIv4YSS1w1nhbe88DcVzLSVk/luYDHJ09NaAoEPm4p+LZ6aRVmf2exNGhnJG
	wltkIgLby9RO07BvkS9FP5jeD2pN1/GA+WQPFN73ph+cDeHwSkyUQZQZms3FIv8dhMfxO6poPO5
	cvtrshrfo4gwI7kFxcO9LcM65wWW8MgiDCLjt/vkNPNeYobG2puK+5KmGfA9jbNX5nNoIiaB8jt
	zFaQOSG/TzRbO1i44WYH9AI+3XmeJssOOD6YFeP1O85XsV0tbozMM2d8ZT9merCDzIDh0oJXJDe
	ftDbc9Gm0dcJ87sBQbj1ZSLu0AG/peJw4RdRIlRp3S+4b
X-Received: by 2002:a05:6a21:7a90:b0:35d:bb66:5ce3 with SMTP id adf61e73a8af0-38ec6287db1mr5032437637.12.1769600455884;
        Wed, 28 Jan 2026 03:40:55 -0800 (PST)
X-Received: by 2002:a05:6a21:7a90:b0:35d:bb66:5ce3 with SMTP id adf61e73a8af0-38ec6287db1mr5032413637.12.1769600455424;
        Wed, 28 Jan 2026 03:40:55 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a9f41d0sm2010678a12.27.2026.01.28.03.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 03:40:55 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 17:10:41 +0530
Subject: [PATCH 1/3] PCI: host-common: Add shared D3cold eligibility helper
 for host bridges
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-d3cold-v1-1-dd8f3f0ce824@oss.qualcomm.com>
References: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
In-Reply-To: <20260128-d3cold-v1-0-dd8f3f0ce824@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Will Deacon <will@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        jonathanh@nvidia.com,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769600446; l=2595;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=2/RHS3VB+9/ela56gcCfKz5EhOgp8MbiqRV5USDd5Bg=;
 b=9+Uq3obX1/upVJ1jSgLEdlZDN14hf6EC2Z5l3sJYRX+e2KMzaMrGwzdlT8eEsRE2LClbxTJKD
 nw9j0LzsDcpBv/30rGcMussGSOFuzmC9sfng9UFkEgAb0iNNoHU2HR3
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: pUQK97KDG2ITfyemXce22uQ3tzK9ZEa2
X-Authority-Analysis: v=2.4 cv=GbMaXAXL c=1 sm=1 tr=0 ts=6979f5c8 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: pUQK97KDG2ITfyemXce22uQ3tzK9ZEa2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5NSBTYWx0ZWRfX8mcyWi5604yO
 Pwjd+XipBpx8qjKc3dggq2Hj4UZ1AmlZTMfuakh1c4+/55YUAzTC4BN4TVFjemss46xhBAckYkK
 FFdtLKHCHkybV4Zb0u+WFjktYXdPmo0rU8fvodFfeTLHZHpSC3umDHglize3ROH1s/V7X8AdlUT
 Bhh5RF4SsrlCFBXcdMOUnOcyx7eHhQkDSyX60qnDrbdGYk5Ftu6GjllqQ6HCxpyq13UduvNzLwg
 vHRdNiglorXSdhc1O0s0XrutE0hC4+CtIFuQSCilR+bG5UnvOEtqIbAGqCSAjaVA7mi9Api5Dt4
 vGw8L9N+HPgfCE3BXRq/0TuV5VPtWwmpUl/W+BJjftOL92WJWID2erazRr2CJDK6CnFbcgRx3Eo
 bFK4QQ63oGgnRkUkSY/4sX3YRkVE7m3Xocp4gRf6vy87MFSCew350q3DBlZV5V0bqXMdWX69oXw
 3ifd00DAsTbjCD386jQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_034057_135189_968CCD70 
X-CRM114-Status: GOOD (  16.32  )
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

Add a common helper, pci_host_common_can_enter_d3cold(), to determine
whether a PCI host bridge can safely transition to D3cold.

The helper walks all devices on the bridge's bus and only allows the
host bridge to enter D3cold if all PCIe endpoints are already in
PCI_D3hot. For devices that may wake the system, it additionally
requires that the device supports PME wakeup from D3cold(with WAKE#).
Devices without wakeup enabled are not restricted by this check and can
be allowed to keep device in D3cold.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/pci-host-common.c | 29 +++++++++++++++++++++++++++++
 drivers/pci/controller/pci-host-common.h |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index c473e7c03bacad2de07c798768f99652443431e0..225472c5ac82c6c5b44257d68a0fc503ec046ff1 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -106,5 +106,34 @@ void pci_host_common_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(pci_host_common_remove);
 
+static int pci_host_common_check_d3cold(struct pci_dev *pdev, void *userdata)
+{
+	bool *d3cold_allow = userdata;
+
+	if (pci_pcie_type(pdev) != PCI_EXP_TYPE_ENDPOINT)
+		return 0;
+
+	if (pdev->current_state != PCI_D3hot)
+		goto exit;
+
+	if (device_may_wakeup(&pdev->dev) && !pci_pme_capable(pdev, PCI_D3cold))
+		goto exit;
+
+	return 0;
+exit:
+	*d3cold_allow = false;
+	return -EBUSY;
+}
+
+bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge)
+{
+	bool d3cold_allow = true;
+
+	pci_walk_bus(bridge->bus, pci_host_common_check_d3cold, &d3cold_allow);
+
+	return d3cold_allow;
+}
+EXPORT_SYMBOL_GPL(pci_host_common_can_enter_d3cold);
+
 MODULE_DESCRIPTION("Common library for PCI host controller drivers");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/pci/controller/pci-host-common.h b/drivers/pci/controller/pci-host-common.h
index b5075d4bd7eb31fbf1dc946ef1a6afd5afb5b3c6..18a731bca058828340bca84776d0e91da1edbbf7 100644
--- a/drivers/pci/controller/pci-host-common.h
+++ b/drivers/pci/controller/pci-host-common.h
@@ -20,4 +20,6 @@ void pci_host_common_remove(struct platform_device *pdev);
 
 struct pci_config_window *pci_host_common_ecam_create(struct device *dev,
 	struct pci_host_bridge *bridge, const struct pci_ecam_ops *ops);
+
+bool pci_host_common_can_enter_d3cold(struct pci_host_bridge *bridge);
 #endif

-- 
2.34.1


