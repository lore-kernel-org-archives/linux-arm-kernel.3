Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C86C44501
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3J7+oNMk7WMQ4KOiVM1+PpfhqlleI9nCGCg735LegyU=; b=Xdj/kaMIJCluzI1gVXTMcfP0wD
	7waiRVmAtm7jp2of+lW7ODC6mn0wqsGloSG18iQ6lDLhuKn3wkJ2PVz2xy3ynRowqcAKktWwDn0cZ
	xv6QU2Kwux61OYlrjmPp1bX5A3CVkut0h/QaSgCxACHdDvkYZFfkvJhXoRHdoknX8WRy44emMRRvo
	GA01/VtQwDbBK77rz2qUEYf9DwHnqYNQsFgwZdGS5Wdkb8LMFiDC11vuct1UhZ74tvZYKtsuWNSCV
	WD2K+v8ANEahAN/zJxnfmfM9tNhP8FNm4sfQmwrHern4BWBXboAtTVMc+3uJrNKp/QTR8iuJ1xPzX
	sZ0UM1mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSi7-00000009di7-2gSB;
	Sun, 05 Jul 2026 19:41:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSi4-00000009dfs-3PkA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:41:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665Hj8Ue2274089
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 19:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=3J7+oNMk7WM
	Q4KOiVM1+PpfhqlleI9nCGCg735LegyU=; b=hPcw2XE00hJiXGUlPJdzgAHVQzT
	3IKBxTpsdM3YltXY0Gb00tp8cyyqr2jLji+CKNDBWau5JTu+BreuyR01af4GFyfv
	ngpGWe//C62ZWMgkGJk4zSl0S0wOJ9lpQw3JAKnLg2fIs5pZCB7N4aamjssEjqJr
	56eMgt2RR1Wu9uGyx458onBujfZX4GqD+UxQKYZvfMFk6K6CooiLxTXLejKO9W0R
	0jkXD7cR55aEXj06BsfreVAtJNhMuxZgvDsgw5Rbn8a2yz3zzklaCOw3S6PIDyNi
	LSZAc2ZKjYucaa8JgIZQNxudHkYVpBDXyT4e5CmqkA1zH01od7f0TWn9fNw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6qhnkmcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 19:40:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so13685275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280459; x=1783885259; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3J7+oNMk7WMQ4KOiVM1+PpfhqlleI9nCGCg735LegyU=;
        b=E4JtAtysZa6MTmnVKoJzLoiDBh/iYJlplAc93Y2dBvdbPAGSnS4rc2pVAa6qUPkfKJ
         of1A+KiL7NHlttm5CxrKG2WAmDDOdFcB7aCMbGwvaAHogPvMJ+l5Q4Mwe8TLuUP1yrom
         syEjLz8uyil/HjFIYoe4f8ON/oXBgwrrg/Hl1PJ9O8RgynhQD2xl+WMuw1Qp/K9IVB03
         qnMiQGsAGkzqve2O8lxo48Ew8T9WFiyTw/XSJR+dueXJt9UzxqqFWyAoJ9Q1h4GUXuoc
         MiPFmQxIT8QDlcw4M5KWKvjOnj0qmx3QqERaIxUX5q9BpOnK1B0ztemarrWqokkRMXst
         CEfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280459; x=1783885259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3J7+oNMk7WMQ4KOiVM1+PpfhqlleI9nCGCg735LegyU=;
        b=SIajv2c5Fl5meE+GsTwjc6R5gtpW8EH/JfrKAfzug1qBP+rvUPPWQSbi9+VFZSjAH6
         JlZaqE7TeRSL7UD1CT7ppNr0Gj8PV3bbacH1w8ImOH4E54jwJGdPW3WoABpW6vQBSPYe
         44p4KWlLJK+xmVi6q4nsQ27i1oGQLVp46M5WYLQMBL2cUvEwERyD8WKRN/PCcbjMBpRc
         RstYRxQZu8ou0JxIoUZ8YdnPvb1o2tELCKLtXqTJESUjkvBo/RLJZhPpIBbKztIPJR1n
         IF1tOsHlu6mVxhrse0cW7nR07IwbTcO2iAxmCnBgEgpNnLVm46wwt3/mhJ2nROABw5BA
         7SoQ==
X-Forwarded-Encrypted: i=1; AHgh+RruqD4l4eepONH6Z35qLxldVqirzpZLdrgyk0Nx3i9X3Ja03uwsvSXc2p2kLNK5rGDXKS7l0BYtu64mjJszyRs8@lists.infradead.org
X-Gm-Message-State: AOJu0YzoyhHw1Dzwe02booxwR994W1N9VU13ubPAyD1H1riMjhSS/i1v
	5zUX7JFTKYkBZull3es0XQJQM45DjpxWBaGtk89evDZoEsltvcAsNn5cjp+HQ/JmG+IJyC0YqDb
	jkx8ArZxWj8CJ3AJj94PKegxbtaBbIRL0VLsKfx9v9pficM5oX1D8ghVcZfMdO7tGf3kZqy7+oJ
	Mj7g==
X-Gm-Gg: AfdE7cndSRi44yjIvCPFQKKmYYYk/dq8zUy1yZWMfMrm6Ejz0xinG5cw95wxg5GbvF6
	NLe0zb0Xa8YpY6wHnORltMHOGdwgCH/qextgx5xRk/8jfLO7zmYC5dFhCfQFuJxKWqqz0gs9rb4
	LBWhUJlVjpz6/qQD2bf3Szinbc9PSIrHd74bBGveCRTLy/4TOr0/kzNcV32agrUb0eWT8IVvrJD
	HdjjcLIpwWiFV1A/14tUXllvkosc390Vt5YBzM+ghCQq8kO5KwVfuQa3OSOyUCaHj8QrHr9XVzl
	3DsD5ZYAETvWaXh18Fea+PJqR8to2tMMLZAP8Q/dBBIZjsAxf3cKtXR/nIZd6x7ER0XuewKpoaw
	98LeOlu9zXZW8pYUt16zuxBpEhIbEl2HuYdwAQw==
X-Received: by 2002:a17:902:db05:b0:2c8:1f1e:6922 with SMTP id d9443c01a7336-2cbb9ee11admr72369465ad.37.1783280458796;
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
X-Received: by 2002:a17:902:db05:b0:2c8:1f1e:6922 with SMTP id d9443c01a7336-2cbb9ee11admr72369145ad.37.1783280458256;
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:40:58 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        openbmc@lists.ozlabs.org, sound-open-firmware@alsa-project.org
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH 37/42] ASoC: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:13 +0530
Message-ID: <20260705194019.2565498-5-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX60SXhBLm3bME
 yiMMohu99Hs1FW6wX+G1pXj73iu14oQAHudlV2zErVfuOxSknmnMNy919R1lQS+C7yIpbv/Q7Uh
 nEuPkDSThuedE8gEtKT9H6+0MiEJ/Ek=
X-Proofpoint-ORIG-GUID: EZYxbaHc_dsqcLDl6mpbr6MT8_ihi7sQ
X-Authority-Analysis: v=2.4 cv=J+yaKgnS c=1 sm=1 tr=0 ts=6a4ab34b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=FVZLpNCcgjzkSGVc8gUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX52Fl9G2m14+m
 jiVjOwbISA8eDFGFLr3EskhuqEHNbG1D1Fc63G0+G/IPTI8krBh4xnr6cRzUpT6n9GZH6O9c8tp
 gOURnWFFpwFtqNDyYnIMV/NqrNgo6mJHbzdPq0dGxj1pAHRRFszoJokwQy97IWnYUAoE2IoSVhb
 lFFhhPK7PmeAPPHv4wKJNNEZgKbaH7xZXQbJCvFusGwoPtopug37BwiEwxDbDBiC9oWr6KCmZoO
 l5f4EwKCQ38kwMM+1I5XE7VyxN9NfWJ49lRhS6H3lpzBRrsc4VmNWp+DMcnypT7WUykM7sh46B+
 mWKBWtZOOVSXdAzfk9IUDRtDMcZELTZTucEYxT/4eX67E6wU1tntkFYmdsCwFNqktontIDz1olG
 x+DVAVj7pO2SdVtXaQfZrs0cJMKgk2OOORwRuCuxZdtLnjJ3njjv12YAwF9oXwk4pRFiLTdHLpS
 zESbrnRztXraSmYQCMQ==
X-Proofpoint-GUID: EZYxbaHc_dsqcLDl6mpbr6MT8_ihi7sQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124100_970932_9476E2A6 
X-CRM114-Status: GOOD (  15.53  )
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

Use the devres-managed devm_of_reserved_mem_device_init() to ensure
the reserved memory region is released on device removal, fixing a
missing cleanup in the original code.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index bc0a63457cd7..52c3381e6766 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3013,7 +3013,7 @@ static int mt8195_afe_pcm_dev_probe(struct platform_device *pdev)
 	struct reset_control *rstc;
 	int i, irq_id, ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to assign memory region\n");
 
-- 
2.53.0


