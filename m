Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108D9C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSQ2wHhx839udlZk7WcsVOCsrQscw+jiuWWpRziMZZ4=; b=2vfNIvL7CUJuz88qesDfUsKLIg
	Zz6KwbrZmt7daFC+8KmYzDDacR1SQ7t4QDl0xEL4NVszutcWe85acoDtfdjJwMLmFAV2Tn8LReOK4
	dqKyMnmAwPvNeqfr/pMCyThbGGhNF/ot6VbjlKTGk6h1nTDOXmwoW+lyfONzm+FuBzM5T0WPGLwx+
	EYZABrt061+VI53x0lBy3I8OxZJXDlqukMbSIlpv2QQChp5uOgsoJHRh/Xx5hPS/4mHFJO/j1iyfF
	H79pp3LWFTFjdccRl+8RNIeQhk7PrXtn1sIaN8YnNiw4gIoMkGVHmucJDlzqrN9NPilDXAuhKaRO5
	Vci+acew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qx1-0000000FmpI-0FQo;
	Wed, 02 Sep 2026 19:48:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qwy-0000000Fmmp-3Wu9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:48:50 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 682Hqnni1586059
	for <linux-arm-kernel@lists.infradead.org>; Wed, 2 Sep 2026 19:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mSQ2wHhx839
	udlZk7WcsVOCsrQscw+jiuWWpRziMZZ4=; b=SrARi4tMGYt78Vw9iIalKH5PhfQ
	d47PzXnzCU/UuRGqYazjgueka+kdIHjj5YiZY16yem0fyH8wDOW4zgf+qATvlGlF
	RGdR4INSXrg+wZfUZZ9rO+Jloh5nDrYKke0VDt0LJxvCJc3OMvblSMJTlBH8qydz
	YVK+BAgvV3H68+2grhR8nGavPAg0q9RP231KFd4f6VovWkiVozDPLzSrJU1oa6xo
	vs+nx4v/Q0ckJgy469rSdDt6apzzy82ruQIx494vaolH3MBN0fxpjpEN5c/1d0k8
	pQAS+ofoSxareDrvTrXljVbHlUwkiVUSZ0b38y64aW6ZRRAnpZ0B9r7sZIQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gemb01tk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 19:48:48 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cacd6d37edso19349705ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 12:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788378528; x=1788983328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mSQ2wHhx839udlZk7WcsVOCsrQscw+jiuWWpRziMZZ4=;
        b=F+9ddm1pz+Q1lwWa7i6KhPjoh02AOQ5hdZfbZoHk7shrrANyBjINn/QiGIhgw0y66E
         Y4p2C82YAPh28FSiNyQqRnTSc4BTaJxRkAmqF401az14JGwI28gCA50pPg41Gq75GM3w
         YSVs2Npq9saleLlK1KEevSIGkybxO7qFfsmvCh9Q8+gDG7Om/V8S53YeEn5ImRWZORsF
         emTkS8KOijvf1V0Ua/v2/0wq70FgoVUX/VN3XgXE+mPTFx4Zy+Bso/zcmWUn/gda++dh
         0h/fxTC5bgB+JASyX/TgEmgf18XmAfouG/WebDk9IOromWRx5T5MRGWfxKaaU2PQEgZf
         AkaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788378528; x=1788983328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mSQ2wHhx839udlZk7WcsVOCsrQscw+jiuWWpRziMZZ4=;
        b=OvTuRbC2+4v8gNOdUIO5pnyuE65Qg2NDrYI4p8DDzNqQDaJuz15KM8QUT/VNM8v55W
         H4wTjO34Ew4sLGHlWcXveKDjQmGSJPlTQBGi/n5KA1As+8EuQqyq+ykRfQJhG6pGuXb1
         QBVQSQOGTV/GVgJ+AfCn/6f6EK6cLWwiW7aJgkVM3p/tklK/32tUdG6TsuWwjj2SWS5E
         OBIGUDCKbzRn0TV7K3LT5lzlRUt7FKfubEfEM9wYqIzSSW+AvQsVjkJgLH0zqm7P4xX/
         lX5toeVe+ZXM/YcKsErP/MctyLf6URFm7EkfkkEnxFWp5UKegbSIKzIvTdMpNWQ7p9kr
         zS8w==
X-Forwarded-Encrypted: i=1; AKwUvBzrsGOqfWIebu3BNgMdxwEAWzqTOm1+uKVTYO7K7DEFn6/2rozDI0+kIAdVbZxPvgkWfy3YK55j8UUplnuqJMuL@lists.infradead.org
X-Gm-Message-State: AFuF++ljfU+AIfVBNVlLpwwdn7d2Zwg4jzxGBWL6oZPjcoKGMTve5xg+
	1OXs8aViqG7dDzXQslKicGddG7t1Czm4v+/N3ZyhqDTLuVqcbHnd6UsnBXzrvqDUSo6d2UvwbO/
	QCHNrPdgiOStpT/LH/piwbevAgWJb6LH4Abu+WkNpT8/NYf/FIJsqXSBphIWHi4hfHt9H3T+tDX
	xThw==
X-Gm-Gg: AYBFou2WGskI74jjKz5qTnfn3BsD9Y2Ww4+ro72twmZrmg34d7ucIeFoG1xK/7nx+Pw
	PoZIC6Jgu336K5QLhGcOWTtG6Es/gVNgufqas/DUosTlTb83W/r1XGTGECCJPERdF/aTtVQ0lf3
	fXW4mTz3YpXqKQS12sPMp3IYNdhqqvg45QUc0XrFrVHhhHdT8MUYXIlHG3UgG1+e8Dluq7/5rwT
	8ZeIcKCq5PGgPNENI9VLiGxUQoGKe4HITCx8Ih+7ln29XX+WEcqORfcPUHI1yctwlnJgawuIp3s
	Wp0aaDuCkPFEMuj3/tAVKxj38Eoy/VzXBbWtxubg294jDC2nt/+azxzhBr3aBVovcYwOLJE3kqW
	hJ9M6jl0O/9vkHgvty1lGgr3+SsY=
X-Received: by 2002:a17:903:3884:b0:2da:fa6a:b04f with SMTP id d9443c01a7336-2dafa6ab21cmr26711975ad.2.1788378527656;
        Wed, 02 Sep 2026 12:48:47 -0700 (PDT)
X-Received: by 2002:a17:903:3884:b0:2da:fa6a:b04f with SMTP id d9443c01a7336-2dafa6ab21cmr26711685ad.2.1788378527226;
        Wed, 02 Sep 2026 12:48:47 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3325641b4dcsm307065eec.26.2026.09.02.12.48.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 12:48:46 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
        Bard Liao <yung-chuan.liao@linux.intel.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Gary Yang <gary.yang@cixtech.com>,
        Fugang Duan <fugang.duan@cixtech.com>
Cc: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        sound-open-firmware@alsa-project.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 11/12] ASoC: SOF: mediatek: mt8195: Use devm_of_reserved_mem_device_init()
Date: Thu,  3 Sep 2026 01:17:11 +0530
Message-ID: <20260902194712.2003414-12-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
References: <20260902194712.2003414-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: I_nhxVGL2wp93SKPgVYzjxcBNQXLM6EW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX3sGzrRiVzQcy
 ARqqJAlJMiyOzveJ5Ufz+rgC+8PmpqI4beGKMghP6xDM1qdmTPGoomDTC5oVlpMuDNZiqIwP0cC
 rldErWH+/uLgZXn/j9X2Z9aCMKYipwq7+v5SoKFjSEbj64xxsfNXyYpBj/sRnvvgG8Dezar/uuH
 Qm9Ww2KkrXAIBJa3tKrRsGLzDzDkS9c+Albi3dH+OKuwB9eHa4GrmPlxdEA0nzctBXxb/agF8cK
 2cMvDQo/oIUvsC8Zu4glOdGwRGOfJiDD95gmZI+u34bD0k3zYYXL8e1s0uwNQGSGsKJPrWhqkpb
 gjhN9CYAj/ERxh7CkjAc3eO1opqDOs3ZQWrl58g9hfsPg0i4/s53j72cbtBfrY9Db292eZbqw85
 cvmOa7a3tzjyJ1vrhFkxE0rmMssFRmQGw0/6vpo7aeTPdKoe30GMleEGk/cWZ7JBHhIhc6BQ7Rc
 8jSgoY0d3yl9F4nO7sA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDE3NSBTYWx0ZWRfX2wCereUV82l3
 CWun36OZbajZrquYtz4knD3hMV+BZRo1NciELnsr/SmtbPNrMhfJIb1oVfrMXOo4kwDR3Oo0Vlk
 VYN6h0yGS5ivb5yrUELctC3dftwVBvg=
X-Authority-Analysis: v=2.4 cv=EuPiaycA c=1 sm=1 tr=0 ts=6a987da0 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=YxFYfaw6DuWYmsw8bRUA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: I_nhxVGL2wp93SKPgVYzjxcBNQXLM6EW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_04,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_124848_894073_155AF942 
X-CRM114-Status: GOOD (  17.31  )
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
2.55.0


