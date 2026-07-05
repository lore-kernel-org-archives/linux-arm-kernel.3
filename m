Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CCDC44500
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=; b=xtu9GNyz23VgHGfvfhqSbRq7jn
	lq1T8o8wl1jV5UNchrVUlA8qX0cSmjiEHo7qwMUwiNYu1EXf2EI8rJM5UmbYGkeZeO8wxrcP2iqbA
	ZMp0mL70GOSJSw8QZrSx1CkUYCkM5BDPW8E2Wig3QZJ1Kh5wAgRXVPO7IBJOUPNivjdlVhKxQQCn9
	QMW9X1g6ILk6+MrVTPbAxm4Z+AjFs1iHr2RnnXdRzhv6sXqrpVM3yrAqnvygiNMBTYbcHgFxFgLM2
	dfu3UIt4blGc1/uKMMUFwCIfLRDssKtP87R74GKV+PgSK7cYmJk9Iszodk/lxzWnuqhL4tkKbbrlv
	wnVdB+WA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSiJ-00000009dsq-0gta;
	Sun, 05 Jul 2026 19:41:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSiG-00000009dqx-3aZt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:41:13 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhfA22130955
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 19:41:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SRfBxbqW9Wo
	vwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=; b=Ct1DBvNsXtjXHhkOELxVhlpg6H2
	368Ld+75DkSj9KAbDdr+dccgJj5ELmVwXoWTwLRHuHRoMLG38NZA0i/dYf4N1Wwc
	GWDVGhaX3gkzJ/KUCjenkhf61SCvn7auxPGY1ifqGqoeJGMpHLM7TwdqAnd1zKxe
	XDmUTqO6867KN13WAC/hp1ycv49MufxZfENMTnh8m78LYIQT7d23L1S4XHIN449b
	smnhxYrxjaGQqsh6wd2AOVf/dnd9Fv/6+cSQqRdhbmEolxNJN1SJpi8Ey2Pa0lIw
	zunl7f6VOFaCAF/wwQuLKChNn1SjxkzDZMRnVULom/ITViFNtbylQf31vYA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6ubgk5c8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 19:41:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so3254668a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280472; x=1783885272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=;
        b=KCk1MwWsmTdvqnnoRdoKAuqFz8DVvkUNRJufekb0Iha4SS77yR60HM/WXHILM41jLe
         5XOQUX9fxxxiyHqEPKRUv/M7rUNRHKqKvRML2zaIq6TyfS9ag7ZJ5SCWhqW+ZwKJ2KdF
         2ldBKpO15jGhGOSWu/2CCnxyhBJx8QuCHTNtSVzHl4KCwHJjzztgq3ciIiGdDMBsML3N
         bcXAhZmpVDlf2abhF5NmAMMuoXVr5rzLN6lr44y5b14UKuKKuYYm8a+y7FGwvYO7c1ht
         9ZM/iHYDRVz4h4bNU6T13wgDHwo5JS9wKJ+SGmaE7UvPeakHQzZJRrPfNJsk9nNUiHbs
         3Pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280472; x=1783885272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SRfBxbqW9WovwhSYimxYWcInLCKkOQsnOkiyjjR+6kI=;
        b=YSZlkU8bpMNs3s7fGaUtQ9uSrwMVGKdNkFLGN9Woh8381wq29mZ6cilqvqWiyTzoPS
         47nOx7coSp+LLa1Fsbh9/Xpv71Q6fZwL6WwCj/LLATiIC5C6PxEBLfWSYdW/7Xs4Yfki
         v6UNuWkCTAKXte0TKyqvhPgxzzKP3S1D5U0hYcE31PYvtPud1lAye3GZ1v08lqkgqlQI
         pSYSgb5UoQSnZaNCUH7qYo4MSy8MEfGonxNOtSiNO9m3q7guSZjO8GYFqcon6x1HVWMg
         9bpyTwdrsbFWo2830ninr9ZYFYIVsI1PCKrAAtsO51MBXARCs+Vwc5AMobkz7747QFWN
         Kp0w==
X-Forwarded-Encrypted: i=1; AHgh+RqHEmzN3f5aez9GolZgdCkshMbLHEdhBOQemG9jofVcNc8lDRo5nLVXe+83ncmlf6HRA11rs8j/hNjJnV01t3sW@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1VEJM/jF3w3IXsuGd3I1nm9FeHx5dZAl1Q+XgGsRzYNoookNO
	Dd3D9tq7JMmvuPgQRqSRoJ+mAV0KjHZx8s1DJhHQw6w1s5upAQV9n/hG6zLEReEAJiE0mq8ioGI
	4dHqEW7XbR1ts4PiB3YqqD32tpZQqR1xnSLYnC5IfGVOhoLDskP6OkOl+J6zy97x/HquiCl6aki
	wryA==
X-Gm-Gg: AfdE7ckohfg5JLmfmsjqmyzvdU/E6HbTBMBvY3IvTN+UhkyLjtxHQ+To1cX2Ci60ZDz
	rSsLcSJEPMkSPTPYrDqgpmpXmKHLbCW5hORG2pQ6LUHLoMUAJDIveKQpEYYRwKCjsorw2ofq549
	AZSdpb4lE3gU+jH+3tKxsEo4084/64RE/v0lIf+EwkZkerxq+H6neDl3GJpkFM+LTdRykONLzn4
	rnbwmvswHvVACex1e6hoHlIXe1rkCpO34RAsqTngN09RsbYfBTESQTO1lWYSECL0l8JuGiNEDy2
	eq0ny7vkK42txBcOwr7S4bTh+IRMi1VoM8Y7Jr6EKnBSzLhWW2V8G2F+zgcJKhhJw4BvAC8vfvB
	Ij7UTcJ9XNG8q4yEBzanvnRrl95/IosQjH0xzvQ==
X-Received: by 2002:a05:6a21:6f14:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3c03e189935mr7605446637.10.1783280471649;
        Sun, 05 Jul 2026 12:41:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f14:b0:3b4:8cc7:c6fa with SMTP id adf61e73a8af0-3c03e189935mr7605425637.10.1783280471121;
        Sun, 05 Jul 2026 12:41:11 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:10 -0700 (PDT)
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
Subject: [PATCH 39/42] ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Mon,  6 Jul 2026 01:10:15 +0530
Message-ID: <20260705194019.2565498-7-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX+gpXFMs7LLHV
 GmoAHWhoRT6nX3OVFSam3eoaAhhYruZ1zZsncQn9unT3C2cy/inlGO60jNPKvm0KRY8/JSc0Sxa
 yQhcP/ppi9FWI1MORhGFKV5OzAEPTk8=
X-Proofpoint-ORIG-GUID: x75CfD9vYMgIXbOjslMKsccdNaIvaV2f
X-Proofpoint-GUID: x75CfD9vYMgIXbOjslMKsccdNaIvaV2f
X-Authority-Analysis: v=2.4 cv=FJwrAeos c=1 sm=1 tr=0 ts=6a4ab358 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfX14QmFS2UUg3v
 7AM897y/nGZMBzPVKwQhli/Me2FV84wv55MENAvS1j3NnNOKXFCY3avK2Xlzk8bhSNNvmobKBd7
 NWisRsSe6VIbxPShfuroLV10QoMhSTwoJGS3bhVj2AiPAv69zNd7U0UHHk7NQCRT6X8iwFT6HAR
 OYtfI9TxAC3K0my1iAWxOSyU4jMvUQKNh+UOT2v1T7YquSsMepjR26HWAihnIbI5bnppC6suehL
 H95/O67dzMsL+8BPFEIDf4AU7GqnfHErbvf0CN2oGu1BLzJz92FIKo5+ipTOpihz7UJNPIzl/aV
 KTIqodCGv/yy53HVk37dfVCNDlwJrBZ99k/ITs7k/R2BcGQWev2LvAwV+YM/7DR9IxUZpyBLBdf
 xFco7wEkjt71FmcBZWl1zRBu1MDN/YsTSMUvMVTHuN5ba67V2DfkXH7HRGcO05Zb3xCT/op/TrA
 1T4nNLFQR3E17bxqq/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124112_910312_270F26B7 
X-CRM114-Status: GOOD (  15.25  )
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
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 4d6e9300a9c0..e4b6b6c18e02 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -49,7 +49,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	struct mtk_adsp_chip_info *adsp = data;
 	int ret;
 
-	ret = of_reserved_mem_device_init(dev);
+	ret = devm_of_reserved_mem_device_init(dev);
 	if (ret) {
 		dev_err(dev, "of_reserved_mem_device_init failed\n");
 		return ret;
-- 
2.53.0


