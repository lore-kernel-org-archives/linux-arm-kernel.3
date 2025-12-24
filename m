Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFA60E74915
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 11:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U+gVmRUB2u2nv3Wc1zC5rKWwnuvVcDu6lhjOYLZCxUQ=; b=UDlTQSeb8/QgkQ4I10V5ocMdUo
	Afi8A5YyfyW4JKeeFjQw+9YdQYwbeExaE6ZPtcQrBsRVI3CoIdXF2UCXzaQHZ7W0YwyX6qhyg1QGl
	dYfpEFRVTHHF4U3sfzlRk2J/BbECRKj6UeLajNt1aGpLTm9fnVMj4jv7cE+atyfzKNE4Ob/8qDmU7
	MRiWV5bmRaIo64WSc0U7HLq2UHQyc3hJ4Ip+Xn/plGYUDEqWCGvVzDHjitw7EIQSvWvjLIUUq3F+i
	Lf2HNmJK0o9VA+WVSGL5X7Q15Zsue2hc+oKgcIy2uAYChr7iiSVj5hnr6C0Eujnmgf821ozZ6Jcye
	fy8gwFMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNG3-0000000Gkny-0eaA;
	Wed, 24 Dec 2025 11:42:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYNFz-0000000GknG-3DKM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 11:42:21 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO90vBj700441
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:42:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=U+gVmRUB2u2nv3Wc1zC5rKWwnuvVcDu6lhj
	OYLZCxUQ=; b=AnxwkYs8IAf1GZ3C3mD+SyC4el6zF2qhamgjZAEjfL/LSklYd1a
	MsHDYPmOQbWfBIEPNpdVYFYyg6Gh+y5XvVRWD5V2Jgs5NC4AiG6D4wT3XRY2n6d+
	EvGLxbTE3iCeh1KIsXL2z06GlsK9/+Y+DqzFmpp3CUXq1AM7kVl7TckjCOgpUfC9
	1AlOpj3Suyx5AnB2Z7e7kyU37c2/R+Mo/fhdFT684IJj+1ewWkQhVoFM1+SrujsF
	O29xXaLFpwXDIuPFBazIm9oCKg59ZWWW8WIMv6F1nQoj5PDrKQUtWY8E78SI/bRB
	dTGBpthUZZPMDe+Ra2+crNuvtHLYvAeCU1w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7t7jukmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 11:42:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f183e4cc7bso104888891cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 03:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766576538; x=1767181338; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U+gVmRUB2u2nv3Wc1zC5rKWwnuvVcDu6lhjOYLZCxUQ=;
        b=AA7yAnbQKiL2t2lM1Pf2sycNnDZTuAM8PYXe2kKRXx5DobFxl/oZUGizY/W/mt7QL3
         i3nuH5oE9EXhtt0ZOLmNiAuEIkJ0S3wU3dTTiXlhtEZslVbYonTga/Vv9U1d1ZN3ih85
         NDpP7f3v+2DnynEiCzUHDruyLPm7QCiCdT+zD7I6HIVcvliCpM6BBz+YtI4jXb8NSslG
         ss5RZoqriY9hqH6LXvJzr3qs0lnVNYNXUyK3BQYm/xqoLifAEBTeWALE2ZrLZ5exoy6C
         Gzv1C+mNKFHJ9QcTfPQZdiQ4jHu6flS/rSfsCHc22R5O1c1a3zIIJt07UoN/cxryAhXN
         W0Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766576538; x=1767181338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U+gVmRUB2u2nv3Wc1zC5rKWwnuvVcDu6lhjOYLZCxUQ=;
        b=W6fddVBj5ga52dlm7W0C3Xcg7azjKCzEpn+3LHcVGQZr3WpW9EaPFHSrAxmtzCU9EW
         TenMCgHveTASPejaUuj/TSC6Iy2Um1Zs+abEv2oxDLP4bArlIp14sds4kJ6neE7ynDFP
         57v9VfnCqLcfs1J/13Of5FTjmu0JhqZ0MbtbtAWXoiCx9S+PuEwTHvWaE4uoVI85q1kS
         nE2VaR3/3cmz/8O/tTuh7OOMEBwOGDkPlsIjI9yFUJGhH0m5o4l8NHWfqfdo9XNc5jyb
         97FHc71nVRGvjClWJ9yLnjnZerYC9zQe+t2k6NBi9CuwufXAxE16bFOgsGHk40yf9JuZ
         PZhA==
X-Forwarded-Encrypted: i=1; AJvYcCVxQP6k5Tosu0vvAWVMadWjx35YDyGamokwuFJ3YzbfOVV1Uz9F5cR6p/iMWRZ2yjHwH6KWZnZFhMCrE5iQ4pxP@lists.infradead.org
X-Gm-Message-State: AOJu0YxyE2i0j/fNtYZhKPxhf1/CYM5MgzqXnxQdFHberR5j0wkj6DPM
	4fHWF09JAanTxYHz2j7bGesJSfNKvjdMW3IoczkEII1SwRGwlGURGmpGyXQ7usBAcut4kj/Ra2e
	gNHus68h+oC+UYp+u90IKrwQI/66nA6k/IHV1N6bPNuu4rOPVhAaRMV4gkIPgwbqEtGM05DIfy6
	bo2w==
X-Gm-Gg: AY/fxX69M1gCAIINTDDIjJgE3aKBn9TCsIysU1DZLvLaOVzWBzQVwGh/7jjyXVNYBVc
	hKNqENNw5NN8Eo2eLLyp23y5MEt4mkEAHX4sVCES1NUL4beEaobYa7kldBlB5mfK86lX6vvxnjB
	5qgqTliW01EioyI0U4keZFEBVxKodWI6NbIatE49u3pl+CftE2/AjvgHKLn1FWUG1D5Zp3TVSpN
	SKJbl+JcpNZqYgonWY9QvESmGangrZcRwv2oRIpVuVX2n4Pcij1Wqnowkg4LYOLoDsD7MlO0hQI
	54px02DsSwuc1kYfVCiWKvyGpSAU5XWrSEg84sl788UvnreLosrp+4GPtMQ5Lq6TfwZ+Wvoa7V+
	KpBkOJf1ugJPNNVIFTCswN0PGKORoLlelNKUf1KOsjRSDyag/u9HUHN90xxJIYhOJrODICA==
X-Received: by 2002:a05:622a:6bc5:b0:4e8:b2df:fe1f with SMTP id d75a77b69052e-4f4b44aa828mr163735941cf.28.1766576537793;
        Wed, 24 Dec 2025 03:42:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGYJQbZ7xIuM5JsrPsYTOyPB7yBvvFRWJ69uQCl8zSRJ/Ken0JqIo6Kls3ykdo83q8RZTzLsg==
X-Received: by 2002:a05:622a:6bc5:b0:4e8:b2df:fe1f with SMTP id d75a77b69052e-4f4b44aa828mr163735851cf.28.1766576537378;
        Wed, 24 Dec 2025 03:42:17 -0800 (PST)
Received: from quoll.home (83.5.187.232.ipv4.supernova.orange.pl. [83.5.187.232])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b9105a9d8sm16468342a12.11.2025.12.24.03.42.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 03:42:16 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Michal Simek <michal.simek@amd.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 1/3] clk: zynqmp: divider: Fix zynqmp_clk_divider_determine_rate kerneldoc
Date: Wed, 24 Dec 2025 12:42:11 +0100
Message-ID: <20251224114210.139817-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=7+3rMzvWcGTKos/3OJqmU9tz7kC9zKpFIYE0gqYo5Aw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpS9GSuPMj/bofVABLhnOOl4JRJ2uqvbka0tUdQ
 YT2afTx+smJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaUvRkgAKCRDBN2bmhouD
 10CiD/4mSux1oeYItqR5RWzwadskR10HMs+EK6yD0EulBWZJMQjZjA7WhfWuzrS1QCaytFULuaG
 054YN38zVMSSUKKlOqflhqZGdPnD3afJHKgY5jB1NbIVmXJp62dcShVMzv85LUHpr8IKKDD87Kc
 ryy3wOMsOVjSU1GriuZX73kJnIwjL/oupXN86cHskl192vk74UIRwDV5Z6UeTiTnvj67SYklXzh
 cz6zmFOVvm03Sor18p5ckWB7OrxnaIuUwLfWB96NSqrtb5CzCWyQUftdRJeCFQYbgELUJrNJaiP
 KdZLuA92uiFXGMkwrFJLXxv4gcxJGUWNvDPnh7WDGgFC8SItfuD+6me7QdHT72szHc1D+alZRmA
 EvGoSOONtwVw4uCSf6umN2ZY2/1mWmZ+GcVt9G6gx5/X21vwVH8yPWqxadG8GGcd8uoQ3vdNoAc
 IQHgl09pMdZRScCLg0c9PuJzhXfHzc0XW7afOOCXIlzBUQtAQi2Y7XB+1C3m8Xy5gLNMwZwFRSH
 Vs7vHcJVOMNLkjOJGiJX4Jro6FXz7dEtFJGTqinWNa2wKLTaHDCwCH+gNsCXdZItUvUCueUHk4t
 xd3ZrJc7AIknh/SYjrFSqHCfVxrT5Nm8B2a0z3dRfvrM0AiTvo8AdnvUy3esG2a4rQhoeQFO5mn b/SKEfK+Is0NIIg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDEwMSBTYWx0ZWRfX5iaDQIVz462O
 jMo+/u6vtPMOlVDJoszWXu+AQYP/6q9vnv5/rcon//rxnXR75ixcmu5PDFSVfQ7LuF6EyPMciBb
 jZgcXEdLXsyNUG7GxJFhhOKqHmbr2F2RaaGgYv3GMp7syR+ViDA6t9cr3Z7cr8Dft9+EzQB8Kzl
 uHAhavYHiXfP7YlOOT/8Z9yJS33v0GjXt/Ku3tzyt+n+KcYG8nU0uSSJhOFRfD8/4Ej74IEERP7
 ZrNCUZTW8h86vF3UkzIXElBCSmacTZ9Hs9kqZ382D2+T0wQw9oK9o+cyFaey0WT19S5TSaMVxbU
 bSddIRfpFv8UKvu3rVK6bpptVYkqxLwcCvRNxCqQtHUGNL0P/qRS3oCcIbL0A1qidwb5Ux5Dc+E
 tQnej1r5vQWViFq52oFvvXEnoIfT/RQn0WiA2CjprR+EcjBKYg+y0ggpiTd/PGDd2+J8F5dRSWR
 UZubNdknFKz9sspOC0w==
X-Authority-Analysis: v=2.4 cv=IvATsb/g c=1 sm=1 tr=0 ts=694bd19a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=urQ9wjG1USoGuMoDBEOPbA==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_NWB5zRfvcGgyacOYGAA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: KpJuewdls9x7sFy0u4hEz0VTb7b_LnkW
X-Proofpoint-ORIG-GUID: KpJuewdls9x7sFy0u4hEz0VTb7b_LnkW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_03,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_034220_183167_4ED7DF78 
X-CRM114-Status: GOOD (  12.72  )
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

After renaming round_rate->determine, kerneldoc does not match anymore,
causing W=1 warnings:

  Warning: drivers/clk/zynqmp/divider.c:122 function parameter 'req' not described in 'zynqmp_clk_divider_determine_rate'
  Warning: drivers/clk/zynqmp/divider.c:122 expecting prototype for zynqmp_clk_divider_round_rate(). Prototype was for zynqmp_clk_divider_determine_rate() instead

Fixes: 0f9cf96a01fd ("clk: zynqmp: divider: convert from round_rate() to determine_rate()")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/clk/zynqmp/divider.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/zynqmp/divider.c b/drivers/clk/zynqmp/divider.c
index c824eeacd8eb..5baa967aa7c9 100644
--- a/drivers/clk/zynqmp/divider.c
+++ b/drivers/clk/zynqmp/divider.c
@@ -111,10 +111,9 @@ static unsigned long zynqmp_clk_divider_recalc_rate(struct clk_hw *hw,
 }
 
 /**
- * zynqmp_clk_divider_round_rate() - Round rate of divider clock
+ * zynqmp_clk_divider_determine_rate() - Determine rate of divider clock
  * @hw:			handle between common and hardware-specific interfaces
- * @rate:		rate of clock to be set
- * @prate:		rate of parent clock
+ * @req:		rate of clock to be set
  *
  * Return: 0 on success else error+reason
  */
-- 
2.51.0


