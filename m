Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17E47C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 19:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=; b=QOlll/MCw4L2QgF1mDP8M5SgRg
	fuW+O3FlLwTEG7XAakfmrnXr+S+wA1/Ghve4yDR9TxKXVG/QbnpQw5W2CkCwhmyQXN32pa4ARNx/8
	i8Q27imYEfNlXH9Y49eWdZDc5ugCuQ9bzAMjghCJDjq+kmECJU8up9zsFk4VTEAWxT7vTMPfGnWDi
	toIiNOzWJZ9pGT+aLo1lP7SmP2vxJPejHqdfCapugY/P4yYgbgygilcvD51VGQEFVhBjHQZSzZmNi
	n/o8pN2QeHd806YUztKHpGAwRuF/Cleo+tSaKoJ3OHJzJNZWRLZLNUZxPhzasZNQ6+sePC3Gm3xPu
	fkWM3wwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSiX-00000009eB1-0pZq;
	Sun, 05 Jul 2026 19:41:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgSiU-00000009e6o-0fxE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 19:41:27 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 665HhZC42351641
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 19:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=; b=TLn6zhutzCtePBXP
	eApN5L/sdm3XfMAHOZhP82YsbqE0e2xRcEAFk/+OzouZNGNfc26qhw5knDcbPcel
	BP5iZZDUvJOH4Kdt2QhgKPJOeoScqNJcXRyWCHIYBBbsIEBD0ZiVVQvHgMHBpB06
	KDdBLLvkRr12JNjMqEtNLmZCzmB3HEASAP+zwk9LWIkse6JF6XJ5aE2oTFOlREXB
	HWsjh1ZGAPgsRx3a1N+Une0Zk6nBS+M8q7Nzxb/+beCfZqlUhL0J/8be0mCDgioR
	WDJzt0GGrulk/kLFg2I0CGVxAo6WNnObMHMMKTDfE+fIZHUMdON7dtl7vgqPIl6I
	fMEfTw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6s4sudwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 19:41:25 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88e0d11a3fso1435805a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 12:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783280485; x=1783885285; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=;
        b=JFqjEmspQBSs8PHx+rNSmaRDIpZhU0Y0fKuEvExSXMbp3rcuvJX3hwvRhEW+lFCN/P
         wzhdkj1ePb77kBleduNpDN1sSg6GT4uoUJw+K93HZO7neqTM8VjXC9ccxv0aqqgT6wTd
         hWaP8Jg/DoUnKzh1VkmbTi103oV4a99kQrsefhb+OL5ALV/Lb7eBnYMU/JSQVHQ8IGjI
         f9Lc4wMen4FfZLL4kUij/nlOmKJ7pl4WKNud8PuRTHH6CUT0NZj1v44MqarZFKub1Plk
         gju8zFug/Vu51YGjiFGPai9GtVoLMpEam1J01on/WuMH2FuEcAks5/cLVyjGgJVvjGpA
         aWJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783280485; x=1783885285;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NGgGvwnqAVQQEeBPG1kTtk7oaNyoX+6Tcm1yJclm2Pw=;
        b=YsXiDjHjxFJLh+iXJKm+rehhgeSwAfFo07OAdNmyIG06L/9sEx5LD3PV+WFn/bdAF5
         1u0vM7JGfl+Sr9uPQ8iKsGYQz8dkSQzu7o9JGa7yuVWw5jlMCHswX7Z/T31R0ZB9YH3Y
         iHTtkCB5SveKh+3JAbXblt0Uxrcglf4r9hNThSEMM3f9LqRNr482h5z+YEXxLYSzvcxD
         ag9Dymylry9w00Vhi5eMwdK/b+RUYlUXiRD80Tx1j4r5OOonKsC0C4gjSwByLN6/T+Y4
         4kKFVLQGfKH3C5tbNF/SBN/PovGp6ypHE3r8sUo3fc2WibfgwwIme9+xLnPq2W5Qn7FX
         nvhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqbFOtFedtI2DGNfFF0S0nqv+giRpQ81pkxJBo/IO4G8X+fDARqNHihw16S3RVpJ42i5ThRqorZO9Qx/CXsGP21@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ/qK9oDeNyOcRoLDFVQ66ZvFXDdy39N2oY1YBt45cqlCMUKyS
	t7vlAfRwXAo62/SuHvSLcvwmoAhRX4W14En/UXjXr1k493wtxuQtIWKQi3WBXnFSVpKxI+sOEwl
	KUOt5ebZ9SCVShdi8XY9ADYdpMRPp/IdpbFIK1qmRKY+veb19bWaO/lzLrDHHbBvMjLB1vc2P2Q
	HyhQ==
X-Gm-Gg: AfdE7cmeR6B9PhmHXQohtp4nvjf8nntf8hCY7i9FlqXxEy2XhXEEFiCpG1fHE//xDJN
	+xAdKxWg+OsOg/gA8Pt697M3TjW8orlwb2+VNwH0GbnADfE8gL4w4Zi18Dm+TPtcKH96Xkt7uWF
	70KuRge+CvLMSFcnQwW+icZgSGGTo+fFEGfVQFjxblxqahLyB4IT/MuF647g54iKN/1c4kRGYAZ
	fwV9vt6JTXxedcQrQ3ULWkTgc2lttc+4YPJsewY1iCLyD/4/OEovN1d90/4bcSXcGtpM5SihGhB
	8QkEZsay5QYc36h5AaPgqUZ06DRGwGGC1LW6EPaPUMFIPoI6bKWfaTY2nBZEkLAUWUI282ljHtj
	n8TTRTN6t5IMlTyMBnsnxeBwg3wEPCbT2NH9qbQ==
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr8745229637.15.1783280484465;
        Sun, 05 Jul 2026 12:41:24 -0700 (PDT)
X-Received: by 2002:a05:6a20:43a9:b0:3bf:9e25:1a13 with SMTP id adf61e73a8af0-3c03e26ff8cmr8745209637.15.1783280483924;
        Sun, 05 Jul 2026 12:41:23 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7fa566sm40573417c88.4.2026.07.05.12.41.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 12:41:23 -0700 (PDT)
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
Subject: [PATCH 41/42] ASoC: fsl: imx-rpmsg: Use devm_of_reserved_mem_device_init_by_idx()
Date: Mon,  6 Jul 2026 01:10:17 +0530
Message-ID: <20260705194019.2565498-9-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXwXI8uhhc1xYt
 I5/C2/X32KKciKBGEq0lrqfbPY99C4rfEILwaB5VmTTVPRCdb6+FZDMK0dpRonx/IcAU2sSCHlM
 F/1mZvgLD3HeTyEVzwrXvuQnZrmejG8=
X-Proofpoint-ORIG-GUID: Kkl1UewDlhq5GsnJy4kPA1DDPL8ZRXn4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDIxMiBTYWx0ZWRfXxOzFAcALZx1F
 HH3dLn1swi4hf0yC7MfnMhphL91GIndK63h+yhARRkSW3GK35kroaY7QJZZUk+EAw3ykwb2NEne
 1COk43uplDRt/2R21FVBfwAu+yDJnrAFQccVGIrKpCktnkvpGLpAjGO9b249/tUDJNQzhrP7DWH
 Y5MKpbYb4iOvExRjBEC8nHbGHFwE6ZE18FDCNr5GLgENH9Qu7h/c7sidpR0u6xRA8boOTTajOqh
 sPqam5H+PZw20hVc7IbY8KKClVso50SM6rJeQVWIEHzRqycxpY0s1maoUhRRkoHpSNDIrf662GO
 0Ti6P2p2BGRkAzvvNbVgA4rucpiRoR2DIpPJ9f+f+pcAfocbdMuYZFFtdiFvgm9gYiTw3WRZ/LB
 HUGoXGLVIDwZgnE38jZ/v/rN0pxvtQ9Hrcqd/RRQF5o5y5h3E1jzBg43VO7LTMp93xjF+YA9lP+
 +6IHhwmbV5jYsifJ+9Q==
X-Proofpoint-GUID: Kkl1UewDlhq5GsnJy4kPA1DDPL8ZRXn4
X-Authority-Analysis: v=2.4 cv=ZfQt8MVA c=1 sm=1 tr=0 ts=6a4ab365 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dtkDxOtodmQ1SLiiO2kA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_124126_214812_F22162DE 
X-CRM114-Status: GOOD (  14.83  )
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

Use the devres-managed devm_of_reserved_mem_device_init_by_idx() to
ensure the reserved memory region is released on device removal, fixing
a missing cleanup — the driver has no remove function.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 sound/soc/fsl/imx-rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 5f1af258caf2..f504d94c4f68 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -199,7 +199,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	ret = devm_of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
 	if (ret)
 		dev_warn(&pdev->dev, "no reserved DMA memory\n");
 
-- 
2.53.0


