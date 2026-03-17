Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79461FD875F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 12:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d4K2m8EmkyTuCsbQro3hOXDA/sCvLpdG20NK5RUNXH8=; b=l8XqQHTaV03f9eulBhE0UwmckG
	EAaloIX/6PllA6hFoICjHzyR31Bo/Sze+tiIs+LXCmiiLx4v2T5N5FLGp3KqtLeINB1ezBITA+k48
	mKVB0dny4LModkmjc3cKKuPFjuhMdmJNH8t5uw2gTFHgiC9T1/d+3D7Q6hOQMG7+GQ+L6xRRkPLFH
	KNPfV3uIZ3jsWy1PUrDrRbmaWsVxgw4MWPtrKXlbXYTognJVtM+FnFEyR7C6+eCp9MlJSqwNqrxsB
	HB2Iejn94FRvOfAj09bMHrBWGwqN9cTVIMGN0mQ1tXI5XApD125Vd/9yE5FeDhURX9cPcOyfg4V+v
	08csbBDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Tfc-00000006JAQ-2LOk;
	Tue, 17 Mar 2026 12:37:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TfW-00000006J86-0zsH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 12:37:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62HA3Cd82071638
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 12:37:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d4K2m8EmkyTuCsbQro3hOXDA/sCvLpdG20NK5RUNXH8=; b=eEVe1rbfQl4RZOik
	kQmOfHy9g+KUrlgJA7nyceTXFe0TTiu5JQMZBV7XkZeYhx4eiYR5fvWu31JRsoQM
	BSsRUzV/HsH5gO8Zx4w/l3n3g0rkDC77kqZd3O6JRHBheLW24HNuYuQ6SGjkcAtE
	igNfHp2k3qDjCH5fzYQFinHX0+svqK3Rsn89vuyaZRM5tu9VBzHsM1ZdoTTRuzwA
	MRIwZKGuhwjm4D4HBS4W8d+J84PRHyYCnAJY1O+duNInxSyPxeEdzE0pAR646EoS
	4yQTFZZFy52G5bC67PKtq2uu7O6wURjX9bpzrz+WIi70DmkqCaEmg1hgG+JysvHc
	vNVLGg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy4v6rffe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 12:37:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd81ce6fdcso5579230585a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 05:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773751025; x=1774355825; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d4K2m8EmkyTuCsbQro3hOXDA/sCvLpdG20NK5RUNXH8=;
        b=R9XhaKji47/AYar9lFblSwjAk+oZKtoX4xRUZ7yp9YrhfKs3kPSwWMDLGrPNOoXpVr
         +qkGdNJ91JYbvGy33Ws0Dx0pvIYDyXGoruHOP1+5wk1icTEbyevVIwCaRZITKNoPcjLd
         dfgu9PkcLRxDbSAXFFp+dlWgYPAv10xyqyiFRlA9g1o8tlRy2pgL5FkGikw+FGyasotW
         aL1vTLdTNxCe+xo89besw/vPIVxjbtvPimNw+mrgk5OdB9NDoGgm9QkRS+keNO/dgEZF
         ZqG4OnML16eQw1b84nqszzTOaStlFpnA0ANeXmlbnV+l3PNeyhFcGPRUWIy6hOMo9frU
         foCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773751025; x=1774355825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d4K2m8EmkyTuCsbQro3hOXDA/sCvLpdG20NK5RUNXH8=;
        b=YnIk2TNPrfHEQ8ZRlx9nFFyQF5qaSQJB7IUFC+BPYcDZvXnpL40XroGxKPX4xnu3PT
         bqEGtn2Kxq1AGweCCYu4vanqYkf76kk/L4WjcxI7RRgmLxX701qe2kTm8SGfg6y6xSEX
         KQ6+F8JOnfDVGOepeiX2nYs9UstEkZ/mrSC2jVQzCqeBaN+1vwzR5L5CIsD0CTGydGLv
         biz2ru+lh0znmrMWiKujwTYGgYn7OVwBqyrrw7U1E+9+76wgHDOqzbEzQe2Rr9JqAsDM
         noLunELYaA8M3VBgsW/ob/OSJavrd1wtSczCAmK4J8iASF0WovLZtNWnFeTYvuVhalnq
         DmeA==
X-Forwarded-Encrypted: i=1; AJvYcCVXMNlRMrEr6ntDnzQVvh4qtwPigdtfJerjNXhdFuJqBHqVoJI3Y2AapKHJ0TSslhA/2L5wzigR+Hx0TUYQlG/a@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2cahQSwqgKfWoIoQ5cbUeESWAc9mGZgsOdCB6B243B6clpkyL
	eBkdW/yiAVzmQdgR7yCUdeIy/r20QZhlUSzHsW3OqZp0X35N++QULfiqa6e9s+lWHQtAPnvLvNx
	icvQ8ofh7T7HgONpyog6KE1HwIXB6UXoR8UW/aTUqaQiWdXmW5xY0N4xuco9xMe3/9ZKD+c1MiQ
	595A==
X-Gm-Gg: ATEYQzxdvvU+fuBvoMrHEZYXpoDXDyaH3eeowsLWTDtSFGs0iFiBjbc44VkuROLgddK
	fBYG2vtFbmCSIbuU9ta60ccLxGg7ieXJsr3DlTYl2qP5zABCzrZSpP/XT/cEG0bTjU+ZuWearEn
	9sinAxqhnp18v77ey3ziDPxYuHFa24xrw81xHixPubTblOW+UAMNCT3mXREh99P7NZo7fmxtkSh
	+HCAFOk1/p4ZEVmaFIUnSB203nFzJ4orBqPCd7jRypNpIMbSBVZPDyqQCAetMTGIFN/BSBuKJNJ
	+XRgoEg5GZzC/fggkvQGRbsAm/MgobVcb4lTeF8XoUnwqOG5sKmrGB6hIBgQXWPVCRpC1plpr9+
	vjLNJg8RF152i6egr//hfsQ04OyRBNYsJVA83OCtoV7Za
X-Received: by 2002:a05:620a:2590:b0:8cd:8938:eff9 with SMTP id af79cd13be357-8cdb59fff5cmr2252383685a.1.1773751024766;
        Tue, 17 Mar 2026 05:37:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2590:b0:8cd:8938:eff9 with SMTP id af79cd13be357-8cdb59fff5cmr2252376985a.1.1773751024311;
        Tue, 17 Mar 2026 05:37:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1abf84sm45556443f8f.14.2026.03.17.05.37.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 05:37:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Tue, 17 Mar 2026 13:36:50 +0100
Subject: [PATCH v3 1/5] remoteproc: mtk_scp_ipi: Constify buffer passed to
 scp_ipi_send()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-rpmsg-send-const-v3-1-4d7fd27f037f@oss.qualcomm.com>
References: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
In-Reply-To: <20260317-rpmsg-send-const-v3-0-4d7fd27f037f@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1795;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=D6+6jus/li56x+pBYY+b3ZKTjJKdSYbftq5axc2thAk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpuUrnOx+lHsgQiNOkTmEDx+3tpumic0NjHLRS3
 KqB60rCDL6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCablK5wAKCRDBN2bmhouD
 1y25D/kBPvJvGmbh87Tm7p+4o7yQwfwul6JXdr5rhanHpwawDTxECRfEZQro72/xuExaXTi0NW8
 +ogE9W9d4Nje8UndJGvSCSMqdRh2SbV5JAm3KM/4glNysoCAkl0Wzq33oKSyOSb35g2KfmdZ1Fh
 3ZIP3sFnZtuGlju0BnpbXgBsoZSuYJzk6DNo5jphcPjy1Vv2nySE89AUID12M55fqJlwSFsboJZ
 nOwz2Ilyj2Ps3B6pVrwgsP9o8zimsmF1C3y0hQD1/UL50ojAde+rY35dZ9o4gdK3K+jbATigoYd
 t2hxRXshbdtsSxuwFn2NKPOL4k07JHcpJXjHzvl/ED+1hO6zKT6oeGPh452/qPhsfp+WX6VC1pl
 rNF8xXyToTlmgqPC7c0Fh6UvYgNQQz5pkwJbssWoSrqV6vttgXutrbVOUVTqAVPnlkwtGxLGORG
 ouDPyNqRbc08FxOryo3mAkJojtfOgGoZ+D9r4hZOEUMZnFC6yi0xAVLyj8dcmlg641NoXdFeDhR
 1eAOnHfpMylnUdbGgV/GZsGefNVvEqndiDTGWt9/8aQIIuCkfyIBgXYwIvCVc5QNLItPeVO/xVb
 kfR/E7hD+CEjP7vN784wOEsqW06CK3+iIsKX5jBjmvdf5nISIEOWMTvYl7rNgl2qYuW4nJMfu8c
 scpWzdKfIwpCTbw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: Bg1m1GMfZ_zYVcYDBUaZs6QHi8tT-3O7
X-Authority-Analysis: v=2.4 cv=Aa683nXG c=1 sm=1 tr=0 ts=69b94af1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=aY2cFw3b1D9xo--RORcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-GUID: Bg1m1GMfZ_zYVcYDBUaZs6QHi8tT-3O7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExMSBTYWx0ZWRfX9eqKkJllSP1E
 /fGtj84w/BxU9YBI994brelz8aE1A9qSLGPt0n3ONMqnA+yGkHOMUw5UzFdxFolcxK7PhyGJSD8
 fmhSLvg4+wHX+FhfdFVIWMoHchaa5Zy8wK62Q9f3x6I1P3D4HpCen61KaSIKqKll5/gd1/hr8q5
 zGjznoyMWUrCbFglf+SHGTY5AQacJcQC9brcsfysbfSLEJTD6mlbNyJZYNZ2D1AWTwFJPeTEFfs
 /5u8y2xii/OjQe7v4nmx5kFtelpXP4fsfjQkvDvDAKRKiKnnlSp1ebTs/QpJJy59CV15+bsD8hb
 +cTCqIvG3yAottO9qEVh10wpnGvMZkA7UegOsYbhNeYCr4OR5ETFGJqnQm5dNhLtKVspA29moro
 PtMdlMKwKRMLyiVAWpcDIYx+/p/6Oghb4NPpL2Zag3589EA2W87DweE22fvcGk2RHLCbqfMkg4t
 Dq2ADg3C0nK4G7CrTfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_01,2026-03-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603170111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_053706_289461_FD649541 
X-CRM114-Status: GOOD (  15.88  )
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

scp_ipi_send() should only send the passed buffer, without modifying its
contents, so mark pointer 'buf' as pointer to const.

Acked-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---

Patch necessary for the further patches, please keep with the rest.
---
 drivers/remoteproc/mtk_scp_ipi.c   | 2 +-
 include/linux/remoteproc/mtk_scp.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index 7a37e273b3af..ee2f1121411f 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -156,7 +156,7 @@ EXPORT_SYMBOL_GPL(scp_ipi_unlock);
  *
  * Return: 0 if sending data successfully, -error on error.
  **/
-int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
+int scp_ipi_send(struct mtk_scp *scp, u32 id, const void *buf, unsigned int len,
 		 unsigned int wait)
 {
 	struct mtk_share_obj __iomem *send_obj = scp->send_buf;
diff --git a/include/linux/remoteproc/mtk_scp.h b/include/linux/remoteproc/mtk_scp.h
index 344ff41c22c7..4070537d6542 100644
--- a/include/linux/remoteproc/mtk_scp.h
+++ b/include/linux/remoteproc/mtk_scp.h
@@ -58,7 +58,7 @@ int scp_ipi_register(struct mtk_scp *scp, u32 id, scp_ipi_handler_t handler,
 		     void *priv);
 void scp_ipi_unregister(struct mtk_scp *scp, u32 id);
 
-int scp_ipi_send(struct mtk_scp *scp, u32 id, void *buf, unsigned int len,
+int scp_ipi_send(struct mtk_scp *scp, u32 id, const void *buf, unsigned int len,
 		 unsigned int wait);
 
 unsigned int scp_get_vdec_hw_capa(struct mtk_scp *scp);

-- 
2.51.0


