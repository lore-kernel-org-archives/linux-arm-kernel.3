Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70F0CD343A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 10:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0yHkPJ2+SoSmvwYpxfgmYiW9SG2320qnH+LsMaHO78=; b=PIjeMjo4d9ndKuztD/BfBfJ/9J
	Dfz0F34Llv5xvpTJYqJ5bTOFk7mdzWZlqe8n7CuiHj6NbGFITF7CK5A+kNybdqCF9Q37Fxg5b/IGu
	GRr5Z9tqxmLB6xcgdNkNeks46T9s6n7HxoRmB9wJgQdgr2lYsCF1zK28zTJNHqXVk2K/8NFvO94Z+
	poVz6kUX4QUv/wjvgnnO9xVmIYqvA51D7rT9sAQEc5FjSJXDAOqT7Il87ieeracaC1PqywSt/wWhz
	WJNtXDukYuX8GmqTFMePQHT7kjGjMh3/aSnraYLvouxbQwbPuRIOOOyV7+OkU0E9TfoHdfoptNA23
	0xbsi3kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKD0t-0000000FtEb-40xP;
	Tue, 05 May 2026 10:28:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKD0s-0000000FtD6-0CFj
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 05 May 2026 10:28:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=F0yHkPJ2+SoSmvwYpxfgmYiW9SG2320qnH+LsMaHO78=; b=aeHVG23UTb+gkTcjoIqw/Vkdrz
	j3c2v5L7IX0DaVN535dhopHzLCANQrY7It/13acgyDYiwiswpRAHfmLIVT+L3WLXO8IM/dLIJrZd5
	7wNXjtMlpfXpaLaih6eDRO7uD+erCvEJkJPpiHUd3ENgel3ceT8po83qWQbJMYuxlOJJmU3dD+FT7
	WZVgeDgrqwsqMqgRgcXNGzywKnYALbGfipaKPWrJFmKig5aHl2XN0clF0LEXXukp9ZYdFH4VUu0mW
	N8ipeaowEOgy6lMho26/zlkJF2O+rUznkdc943LJPHpm5n1z0KFIJ05MGpxpw6AAC4DrLEZ+HEDy/
	LmQrwkHw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKD0o-0000000DCEQ-2lV3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 10:28:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6458wb521346318
	for <linux-arm-kernel@lists.infradead.org>; Tue, 5 May 2026 10:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F0yHkPJ2+So
	SmvwYpxfgmYiW9SG2320qnH+LsMaHO78=; b=E0a6wCbdIjr2WquOQ71GnfL9AVE
	vrQq1bGSI4eCKxCxPPcQAbREs38xzniMOeeNXAZNYR/VyIpYStzgQDR4Vvx2QwAT
	xGXg6V6tcJcwNLSbaUlj3acAP8hRCOoODvS86/LVmPmc7koBnihm63vcfk/GSp1M
	V+JlskZ2ekidRagRq6IMG5GeOyQ1h9TO3IWLKfEM+ZY+VkND2C1iGXBqMDP6SXIs
	QZB2RIRTwAs8Ve6n36KEnFfNz+8fF8YhVOzqPMmlqW96UjMKVzI7iwJc7NVSFfbK
	sr/YXWfKCIBXLu/XeDj9affZRjwBKp5czWgg1bliLamNb0nBs7IJaFyzbCQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2xbksp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 10:28:20 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eaaf673eb4so1180171685a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 05 May 2026 03:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777976898; x=1778581698; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0yHkPJ2+SoSmvwYpxfgmYiW9SG2320qnH+LsMaHO78=;
        b=K4Arega/vRBltyqMm5eDlAxt8MDIY7vjawcB/Ko5VUjshQSVs+zhKSHGVU5sbK/G1G
         EeB+NQn86jONWZSS+3/mOTrKHL89SuZnMsy7lUONXrEJo69a04jUgOg1MYfU9o5TcUpQ
         l+GG4NmLv2FfXCRdfJxtSIAdqfanKWMXlL4FoI6ZtHD22Bc/o2RgshcDawIHVdR6JA70
         dZHE+hZzk8sHf5N+IG1oE5oBc60yXvz1Lxlk2NpPdt56L8RDp9ydIThTr5eq1S07mseg
         buXUQb/7SYIEN4000wdItaBG7TNnu/FpjraqCsNlazXOnz7ksFhFhO61g8cGQonNHSNo
         5e8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777976898; x=1778581698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F0yHkPJ2+SoSmvwYpxfgmYiW9SG2320qnH+LsMaHO78=;
        b=o6arU7hQdxgh6udDW5bi6BaUfs6bhnFbsJUHXk1ZTD2CL0TTv7POKu8Vke7NXXvx2z
         LYyc0ozjoWTnGpu+vKwDA+NDZeyESPtiMGTfGUYLMnsLQTU8S5CLK/wMJHAiPrG9GMzP
         gtADD3cx+3VSLPwb1Z3GivZFxMeqsB9Y6a+NuveivcoLgg9zpw+9AKtdtYeXZb9TpVDV
         w4575HZDZSpqI4KjZK7f/7xmVSeglpnPtmCbo05tmrueJNoEAm30TSas0JyXnwmjhMLd
         VBi+/VNrso6iTfipuV+T4VxuPESMleN2/REgegx7lnOxbiWvUKRwxlUyq4YjmLtbdA7X
         WfOA==
X-Forwarded-Encrypted: i=1; AFNElJ8Y+5D4nRZgx9awqCR9lHeCvub3KJ0CBcjYn85oRLPbdL/HXZw5j38QFSXdyi4X2PjZNobvLYPcLsdCGQzMlDx4@lists.infradead.org
X-Gm-Message-State: AOJu0YyTVVX1IEjQ2T1Iz2/KV9X8R9LR1WzgM6yVHy9Ed39NUsFLsqzy
	EPA2zZC/OSBEgrBR6zLq7ySfcFgnN9Ar+5wsuLuP9C3ExqiBs9+ydYKAOChdOIC6oWb90t5RABc
	zScg49csT4p/oi50A7pDgZ8MO7r4pXBUJaxCFR8OykQHXbINRRb3s+IVlxROQjoD1NUBmAFWwTa
	XZe7miTIndAQ==
X-Gm-Gg: AeBDiev1sdayyi/zGpLENTCD8KTx9q632kL1egsh0mDOA0hzcOJu2/NlLwEBEz2hEFr
	DLcYXLTzWNIqEnFiVWZ0pckXvjelxVspGOkvZneJHtPzozaZ3oKgZwo5oOD+OJZRQArLQLPD20F
	zA9ascjt6X+SfVfulJMqL6TLvMp4Bv4Jz0F81BOqi1y3+b0WHIjBND6lzmqID/Rozpl6xah4b+D
	2oXFX4q348iSkI159/8sT1a3k/G01LiQO3Tqxol0HSVD42v+ZEeZP7kAVtuydQ/ueRuwUAQ8i2o
	mHSm0r+oH6HKrv3JcG/OVQytcJeXJ/xcAUj7ifX46UxOEA0hp8+pc/+1S9JPaQxbOLmJmYyXWcu
	2oHGKt4+423BrMMWX0xqRJHgFUihWDFDTMO/QZNVNq71pivc=
X-Received: by 2002:ac8:5ac8:0:b0:50d:9b07:9c46 with SMTP id d75a77b69052e-5104bef2b99mr203901401cf.33.1777976898362;
        Tue, 05 May 2026 03:28:18 -0700 (PDT)
X-Received: by 2002:ac8:5ac8:0:b0:50d:9b07:9c46 with SMTP id d75a77b69052e-5104bef2b99mr203901151cf.33.1777976897898;
        Tue, 05 May 2026 03:28:17 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48af0d5a613sm140661845e9.2.2026.05.05.03.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:28:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>, linux-sound@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] ASoC: rockchip: Move MODULE_DEVICE_TABLE next to the table itself
Date: Tue,  5 May 2026 12:28:05 +0200
Message-ID: <20260505102803.183455-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260505102803.183455-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260505102803.183455-3-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2939; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=yrkwkHJYfYh4Qd/e6Jm0X0iKhU1/cDPw/TDKkqjnpUg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp+cY01NKoMVb6JQS8/2Bllf0JN0WwvF2MUfjEC
 At0QVkx3JyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafnGNAAKCRDBN2bmhouD
 1xOeD/9pigHD500nSIQ/Gkwl0OOWr4qe4DQ2RsBsMwqJKZMddixBg2k1WVZCFvImq/1ykutfGWB
 zvKUxottxASvb05RWbhFezZvPiZ92vw8G8/QqtVFsfo8FmqjaBw9bqCJfBO7Byw73eoAi0+A6HQ
 3ROLUywFOoHYJ2CA/pYG7XN/JSvl16zIsfzXJPiKPp0On/y7g7imf2dCVXDLpH3NhdO7ZCSdYDm
 NuizWjY58Tds3uN3/R9dXMVcQAIZbjfLU5+GGg/fzwXsqzd9zIL9MGFTvwpSYjJKNwrHLeAFK/O
 XvQQOtS1mcTMidOoxhd1JsKVdYPmpe9CU3L15djpmERNX3JkgSnrW4C9BjXujwXSZgU9SgDPSy0
 vK8b50I22tU2NXSpESXtWXIUT1glBCCBGa23RcyeP/ZNl+9uDuJufX4Fl943V2ncZgpEhna9Ruk
 jSGMjbFlJvRBY+bJtylBzTZMyRTp4xSEwVfVeiyjSbRrRQDwFYHvoSMgspGUT2hndhjcDDuUHqP
 RGVuxiGngyaiTFx0TlZA5tGvdiZCgYe10cx12PG8UkKANVHLslC5HU0JSnkfVkiyr8eFhDhUonH
 llndMTKQU64VP50PXa4v8GD9IWPCHcDMaomes9je1XMCTH5c3VQsoE1H6hDEoijVxc8l8WOf+IW jV5EH8oLlHvC8tg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f9c644 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=s8YR1HE3AAAA:8 a=UPwjdVLwzqKTMXskr54A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-ORIG-GUID: r98lVYVf6-Wnrz6GHX3mmPZf78pm0iZ7
X-Proofpoint-GUID: r98lVYVf6-Wnrz6GHX3mmPZf78pm0iZ7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDA5NyBTYWx0ZWRfX4gmQFKvfCwvv
 m3bOnpICdcrl9qwINC2pRTUE8F4+Wg6zeaPm4kpRFnKXckKYOxJXZ2XclSshiVpuUPpq6G3KiiZ
 a6I695FxW7oaQZsZveH0Hs36IUPqfSspS1vdNWCaS8sBCIe72G/qiY6b2QaCtgy21CymEDYWvij
 kPq7WKZi7vwotfeTOkEdZCLst0E+DffyRyJ3knuTNFhwbuVE888R0Fn/VwCcZeIePafieGH/hrB
 FBz151qNdbhAnUHrhk7Q86BiV+UZCTxZ4iTGnE5mrOFaR0Rccuup5+mqUhI/qVtTCy6rUEYHN3o
 Q+Rez3szIu84asjy1B7JcsbKwJlgKdt7rPfbO1mgj7droRkFPQlNIz8wAYR0GjOQ6wQEqekKNzi
 IEaiU/eW5Yu8vjTlx+TwMTU2qxZNoWlr6YNvpAGNxOAkRP9kvnKf47r+66C1ec6SaWUG+NL40mE
 /d3DJbNs1WUHTNJATdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_112823_024950_41727FFB 
X-CRM114-Status: GOOD (  18.07  )
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

By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
exports, because this is easier to read and verify.  It also makes more
sense since #ifdef for ACPI or OF could hide both of them.

Most of the privers already have this correctly placed, so adjust
the missing ones.  No functional impact.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 sound/soc/rockchip/rk3399_gru_sound.c | 2 +-
 sound/soc/rockchip/rockchip_i2s.c     | 2 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
index c8137e8883c4..b80acb221d24 100644
--- a/sound/soc/rockchip/rk3399_gru_sound.c
+++ b/sound/soc/rockchip/rk3399_gru_sound.c
@@ -606,6 +606,7 @@ static const struct of_device_id rockchip_sound_of_match[] = {
 	{ .compatible = "rockchip,rk3399-gru-sound", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, rockchip_sound_of_match);
 
 static struct platform_driver rockchip_sound_driver = {
 	.probe = rockchip_sound_probe,
@@ -624,4 +625,3 @@ MODULE_AUTHOR("Xing Zheng <zhengxing@rock-chips.com>");
 MODULE_DESCRIPTION("Rockchip ASoC Machine Driver");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, rockchip_sound_of_match);
diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 0a0a95b4f520..49ff86b35ef1 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -662,6 +662,7 @@ static const struct of_device_id rockchip_i2s_match[] __maybe_unused = {
 	{ .compatible = "rockchip,rv1126-i2s", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, rockchip_i2s_match);
 
 static int rockchip_i2s_init_dai(struct rk_i2s_dev *i2s, struct resource *res,
 				 struct snd_soc_dai_driver **dp)
@@ -878,4 +879,3 @@ MODULE_DESCRIPTION("ROCKCHIP IIS ASoC Interface");
 MODULE_AUTHOR("jianqun <jay.xu@rock-chips.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, rockchip_i2s_match);
diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index fc52149ed6ae..28fa253a5187 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1040,6 +1040,7 @@ static const struct of_device_id rockchip_i2s_tdm_match[] = {
 	{ .compatible = "rockchip,rv1126-i2s-tdm", .data = &rv1126_i2s_soc_data },
 	{},
 };
+MODULE_DEVICE_TABLE(of, rockchip_i2s_tdm_match);
 
 static const struct snd_soc_dai_driver i2s_tdm_dai = {
 	.ops = &rockchip_i2s_tdm_dai_ops,
@@ -1442,4 +1443,3 @@ MODULE_DESCRIPTION("ROCKCHIP I2S/TDM ASoC Interface");
 MODULE_AUTHOR("Sugar Zhang <sugar.zhang@rock-chips.com>");
 MODULE_LICENSE("GPL v2");
 MODULE_ALIAS("platform:" DRV_NAME);
-MODULE_DEVICE_TABLE(of, rockchip_i2s_tdm_match);
-- 
2.51.0


