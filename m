Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 647EFEB104A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 11:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIgDdQSPHHbW/xDZMWuKTK+oRBDbO81ulYdAvMxwVv4=; b=pBTnqcrthk0sf7dDG+v2qO6Ogk
	k8mk4z8Ox1k6clSKt/t0LkyFLLqi974WBLrohDS2wnoBoW6ktPABejVBrrpiHMpmOWJK0QlJel3ij
	tSOc+uXjccTFkLZND+ePA5aPSw6esPzCHnAOZh5+JEdu0S9gK6BqDR6bHstXHI6xHiKn97xAf0bLU
	b3wgCIDjojKQHic4PqAHtzTeqPC9VD7ONZ7O4gWIP9vAqlUqfvWPtyABI8ZNa/3tAeqTFDxsRJQtq
	0Xa4TDXwTeIj2R8ExqzeMGHrUOxdk2pgnkPo2w4e7NrJE8EAIwWm0wVMkhD/KVQPjXiAJhT/KO1gw
	XU6+G4ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvAs-00000009HGP-3ycX;
	Tue, 10 Mar 2026 11:22:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzvAp-00000009HDJ-3SOE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 11:22:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62AAREGu4188516
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 11:22:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oIgDdQSPHHbW/xDZMWuKTK+oRBDbO81ulYdAvMxwVv4=; b=Ku1uPC/IZy5e02N6
	j0heH1khlSjCw6iao/7RiS/0xxvM0oA7s9rjq+PgLKv+MtnS0j8T68outou4DNJH
	kuVceTvx+0FXeHgCwD204top+wTclk0G7mp7/zKtEF5W140RvXkHmJQsgtwsOlAu
	wW+beES46aAYKxQFudoiZEPcbn4UTYE7VYMRfpB9DWnJ+1Y1p1q7LWY3IfnxwBy4
	5igK1pRpKs0DJluSIriODadG2wqCk4QObhwheFLzsL4l9wlYNyjjs8qg+x1cQnwJ
	HVz0NDJWs+3V8tLLdp3cCOgRvlD/izSRTwfvP6jIvVAAGfRvLrziIEY/Mla7sSQN
	VsgdMw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cthjf084x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 11:22:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-506bac14430so6596321cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Mar 2026 04:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773141770; x=1773746570; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oIgDdQSPHHbW/xDZMWuKTK+oRBDbO81ulYdAvMxwVv4=;
        b=hHjyfER/GgE+2/VVy1lJSlWQzqs49ZPqPO2kQHf50teeOEjt52zhY01h4SDv+KpEiv
         muWlM8I3vctLTekFu7bzZ9UD9bvqlP1mrx2Y++2BKNx9iB+aTVySoWDeBNK+I7Y/qBDB
         pDkgGfrRJDJDqddQqUE0UxfyogRii6S4d3SA4dbLSttGzsZZjYkp/WQwed9XBbB8Ynlm
         HJuYlp6tXM7Byzl2Qabwz3YMAV3/S7Qi5V53qe37kUvZrmU6v9vlqL2eeRHKTlpPySj/
         ssYIpNuXqI87ZHdD5SkFJi8q/u30jH1LClftt5e5YRjO9AW9p5NYnwfPuT0H3VTAqowC
         TiDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773141770; x=1773746570;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oIgDdQSPHHbW/xDZMWuKTK+oRBDbO81ulYdAvMxwVv4=;
        b=RP4Ev2Mf8Zk7QiLLxc85SnHbEP5HBR/zKG/gz57TCSlhdS51p5Fm9PM1xGLiBUI/O6
         1eGPCanSd6y3vwMdw9Q1vz0GzZHC/QYCpv/E1xmxLhHOoR6K+5rDJMOtcMs2NpTqH2mt
         dDTE5iOAx355UZSVmmh+JaNzXyet93wMA4A5eAa2A3jz2t7a5yWYAvEPZhlEt2+oj/vW
         4+fSzslKyfikUAFh06xt3uSpiIPgjtwK1S4b+LPGURhSr5eH1R5Uw7rCYVZtuOqmLUpe
         jvFyK3LAXgTih2bZiuHwUSzun++0hLy9KvvzcUWGMue48p4K0Qumy3gq2Vu5QYYPLBGy
         ZFiw==
X-Forwarded-Encrypted: i=1; AJvYcCXfz2Qkj7IgJLuqKKCeUQvCqbU2Vrhv4VBDV7pqmQKHRbBynW8uX1uPsFbkt87NCAodaGvzVnu0iIDkPG0GcoCl@lists.infradead.org
X-Gm-Message-State: AOJu0YyM9R3UqZ7SA/ZpE61DgXrSd8U/V/JXVp8ce6Hm2zlHYxuoUk17
	gLvrGEjg/4T4hsELYIOzRJF2pw5XnE7pq9tJ8LVgQOn19UqzT8D3rgtIB7yEsFbfzmMiZ+4tTqC
	rMZZlh8qTxdP55rhyw7ckvNrMLK89HHInnw9gdLJ3yJMR/n4HYeyuzcGKmqpFym61LW+zrG3Lbb
	WKlg==
X-Gm-Gg: ATEYQzzpamdKtlpczHevYDABkwJiSKZeN8AuobI7VcrWJQwKkcbQjusIu3ymQXthBR5
	CXO9jE9Src+Hodwx+a0apJa5brO60eyAIVXP9a63STYFcOFDN+qTb96VnaQ0noMK2R/eZxqtNOP
	lGZsFB5EssfVS41kAMj0CtZDBQ8xh7vI6szAlq+EfzqeukhPWCKfOA7wypGF4MsPrD+9rv2322p
	4zpYpiYQ4UP2EWKsg8ifpTJYwg277nUuiXxtezQ40lD6hqY1YzAIY11GfHKH1JzZy6njpXXyF+4
	HEs6tisShUx3752h+0GgixQFhNtuNu/CiYynwNgM/poC3xw3UoMtz5EM7vpNbxbW/h191rs65yO
	PL+UhPGawN2v9TW0VVxeH9EKG+PuuXtyLA+Ja6mMQpJSc
X-Received: by 2002:a05:620a:318d:b0:8cb:4d9b:6b48 with SMTP id af79cd13be357-8cd6d3eaf48mr1956315285a.6.1773141770390;
        Tue, 10 Mar 2026 04:22:50 -0700 (PDT)
X-Received: by 2002:a05:620a:318d:b0:8cb:4d9b:6b48 with SMTP id af79cd13be357-8cd6d3eaf48mr1956311185a.6.1773141769971;
        Tue, 10 Mar 2026 04:22:49 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b7f255sm67162115e9.12.2026.03.10.04.22.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 04:22:48 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 12:22:36 +0100
Subject: [PATCH v2 2/5] remoteproc: mtp_scp: Constify buffer passed to
 scp_send_ipi()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-rpmsg-send-const-v2-2-0e94c5db9bf4@oss.qualcomm.com>
References: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
In-Reply-To: <20260310-rpmsg-send-const-v2-0-0e94c5db9bf4@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-media@vger.kernel.org,
        Mathieu Poirier <mathieuu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=MhZZXUyWfb59oILbyPbh6LcS50AAaVQ8Jux1XwFcQ8g=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpr/7/GykfeN06ugvQtQkoDM6PNcDwvBeH+8Dt3
 FPaTV7303CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaa/+/wAKCRDBN2bmhouD
 1+InD/9J+1xEG6CF2PZMGQySQThP0VZ7hQUI/UT72YfGzryRehuNMY/eZ31woOO2Vu0a0gVzdkV
 efLQ5HCw042qUk5q9JJSAGuRt0G6tBH4bZzi5ZoyTgythpFc/MdY2HF/A/CwoHyYzqBafD+TYRl
 K6F9tzJ3lvA45lkSkeDNKkBgXmR5ZS2Car2ShwTUaoflGU7Neyz8c0bd2sD5u0uQwZwxDgsGOzf
 2uM3gRe8DRSav8N/zQQjnMbr8ous8IxoN5D1QFHpzrWCuFlI/J3Ce52B+rkkXREtuDBq2iN8RHA
 n/LsgVhHbe4oP0X8J8cXyBPaYTUQKcx3Fbq9bemyxVaFEa5ZXEih5L8HMAhb6V35QwAHsAkZ6x4
 HbcS3uUX8az6sMR16tNZ9oHOc3fVHGlcAtub0mGwbi4l6Po69aRWa7nu8MDYjpkyPZzaeBL4W/H
 +40L3j0GFuqbARddLEwBoSs3i5VOHmEm8o4UfLWsmd1lr6dP1hOQVAzo/8tJXiKglh//taqgDRH
 EdigPxJ9TOu/Ey3ozVyP1agqBCvyFJUcDys3Q13/ESZezgipDuHYeSRKv/ahAI5h2pm3NKEJ2Vb
 sM3s8JvQ6bM6k04yN0bb2tR+bej1HZfVaiZCBcRsSYyyKRlW0Q/VXtYMIE+eGInWKVMZOj+DPMW
 xxExYfX+Hg9hlGQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: onh4NwecqamfrjLaA44pvf22psZ01Uc6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA5OCBTYWx0ZWRfX8szrd3IqjPyr
 4rdV0+jA5ZikYz1pYpBhXS5cvc2dW04O6HI5d/UvLDQgbegthYtqDXHMwy9eqRX/uYFLRZW/bEl
 oWVDncOqa3YkUf3qu3kjaytEVEjH0UwRAGdKIPFN9s81iS+iEkcab5BoH5AWRFN9n5lpMxdoHPW
 O3gipN6GiIwbwfxsmmzyCGlEx49nYQyxEBUrNturfCjJ0HjV/iP20v0GqTEOsjFba/qi37yn6Uw
 ozSIcm0ilI3k8ZFgQbOB94VmEUUUFXl8MpsEPkaD/MeGCIz+ef5ZW5BevKRi7m9O8Nm6aUar56m
 lslO9+Hazw2fsTXmH1hzCINLlpG2Kdfoy8RdbQZmgG79et0CSatzrPCyUbcQfIbqDS+LdAyoc6Z
 q86wdCI3mFYtpgwxS0R3ZC/Ngym9umf9ChsApExnfYy72MlwQUldwC+ApSf0DxqIpG7IKLxIVxw
 lPd2vnXdMcFSSsFiM+g==
X-Authority-Analysis: v=2.4 cv=A71h/qWG c=1 sm=1 tr=0 ts=69afff0b cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aY2cFw3b1D9xo--RORcA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: onh4NwecqamfrjLaA44pvf22psZ01Uc6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_042251_873110_B56DD7BA 
X-CRM114-Status: GOOD (  17.52  )
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

scp_send_ipi() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Acked-by: Mathieu Poirier <mathieuu.poirier@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp.c    | 2 +-
 include/linux/rpmsg/mtk_rpmsg.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index bb6f6a16d895..85a74c9ec521 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1078,7 +1078,7 @@ static void scp_unregister_ipi(struct platform_device *pdev, u32 id)
 	scp_ipi_unregister(scp, id);
 }
 
-static int scp_send_ipi(struct platform_device *pdev, u32 id, void *buf,
+static int scp_send_ipi(struct platform_device *pdev, u32 id, const void *buf,
 			unsigned int len, unsigned int wait)
 {
 	struct mtk_scp *scp = platform_get_drvdata(pdev);
diff --git a/include/linux/rpmsg/mtk_rpmsg.h b/include/linux/rpmsg/mtk_rpmsg.h
index 363b60178040..badcbc89917f 100644
--- a/include/linux/rpmsg/mtk_rpmsg.h
+++ b/include/linux/rpmsg/mtk_rpmsg.h
@@ -25,7 +25,7 @@ struct mtk_rpmsg_info {
 			    ipi_handler_t handler, void *priv);
 	void (*unregister_ipi)(struct platform_device *pdev, u32 id);
 	int (*send_ipi)(struct platform_device *pdev, u32 id,
-			void *buf, unsigned int len, unsigned int wait);
+			const void *buf, unsigned int len, unsigned int wait);
 	int ns_ipi_id;
 };
 

-- 
2.51.0


