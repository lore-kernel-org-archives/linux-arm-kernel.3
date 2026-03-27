Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D93E10BA440
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 08:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DhKgSU/RvXUTJBFyFAlD5w+pe27yOPu/2DZEaL1jy1k=; b=HylkOdDJiL1z1RFP1OOJaqpk7r
	KObvOWAqKjsXCfQv6CIcpwZH3YUKiA/8F+0gT2OKCZFB4F42YW4mYBA2aZKS3M//IGBEJOWi6Bfn7
	dIqdB+BW4fQOxAnLlY3DXPyTn857hKihXjfz665ffKHOiR/16h8Wo6WmdLYXHJIKQ1qF14eICgfS9
	1ZKoTDaXG4/YBSuU1RAiNS362mKOiKL/YC5pp8Pp9o0iCqHj1UeLCJB8tfp3UB014uMTyzHZC90y8
	RmFf4tk928rmUOqcCBacqDW0AOsPH1bO/9D7qRu7Qf/y6iG2Z7AoEKVMwdGf4etVrFIuEBbqJjtea
	u8APexog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62bI-00000006yOY-0TVM;
	Fri, 27 Mar 2026 08:31:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62bC-00000006yMg-3D18
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 08:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DhKgSU/RvXUTJBFyFAlD5w+pe27yOPu/2DZEaL1jy1k=; b=b6bHIp2bXOwUMGrF+W4qk9GLuV
	6pBvKhe1vTD3Bg2UmwGgwJitNl9dHBYyZeTRyHBLAO6zJvNuIX9vG0VIilfXfqBLET/d0v7ExHBuX
	J+ZwGIF0sUaDu2CS08gRYmoGOl1i3JqroJUNROAEfxgbr/Fz01Ykpl/uML8w8EB+JUmXf8FG8hoBB
	Ru8/clzSL4IzSDHHjsEf1zLQiPN/Nh9/FVOCVz5vZAvFp/MEl2w6L7fjHA1zoC24N3UzOLQA75Vdd
	vo3zbc9aQZFkBV1MeTWm1PUaY4SrFjuagPtdc1PgTv+ao4w7Z6elL2SdsbpCE3eGGEV1WfHiHtsIZ
	ix4HrOVg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w62b9-00000009yI8-1kgK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 08:31:21 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vnnd3715894
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 08:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=DhKgSU/RvXU
	TJBFyFAlD5w+pe27yOPu/2DZEaL1jy1k=; b=WWF6ooDFq3S9VAXyGOMnGd/svZ0
	JqMR4SwUtcZiCITnZ+dJ7uOZjQ+sgkhvVCzaEFtvrL4C2wuMLD6wrchmvea2nGEt
	8r2Y5P5Oj30OsmsY9byHFbhVhZsvje6J2LFeRzkFFywnVE6xWBQwxDO2nLxlEdfs
	haBsFqAZMIJnWMAvB9or2qQ1l3nUvdAn3d0KvttRjjh29G1Iv4hA9avQTTICMRod
	mMIFnZO7c+ayE5p2YN3sEPHMmizsDlUbYDzW2oini4dvgtW9KBgfjrjeaD8FiIgd
	Kbizd6C+Jfok2tAeIaBdnyOHIOTPtJoE7EWBo7U2lTlotXPB5Fo67qjp9Vw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5dd6hw44-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 08:31:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-35bea322389so2458968a91.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774600274; x=1775205074; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DhKgSU/RvXUTJBFyFAlD5w+pe27yOPu/2DZEaL1jy1k=;
        b=gShmYiVSLSQjZDXCYziC7F/PHf89GXYgQ0qAeqnBKeoIgEKyZOHICNSUeMr6Q8p4B1
         AFDqno26H3gj2ff1yTyKowOY8294eW9QrO3lj2tYeeJKQeehFppNVyTM1ytIcvFgdgvL
         0OoN/uZtrryi2uGTsWi/MSDMzWT+BN3xs03UkvNS0bKOFL0fCmIGSrkDbwZK0X1kkm+1
         +/6lYwiVcu4lWFBTiJy+4/btXMfavKyAjCk7BiZZDDNWznX69d3IUp/hq5w4v3H9PUvi
         D7krG1fOhYYvi70RwVgVuybVqH5rlkTZToAIurICThpaMHzMnG6EhLPMRsRRUh9yQZ1c
         vDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774600274; x=1775205074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DhKgSU/RvXUTJBFyFAlD5w+pe27yOPu/2DZEaL1jy1k=;
        b=Q1xPiwy0uhD28ZSlnTZWbcNNxfdPqaq8rtCzgMEVH1ewhdU/WH6wQsfwpWcn7NSxiA
         1NMXKJ0/ZJ6kZvV4JApRU2oG/eS+QR3dmFGyk7Z084S+J8PpEnhf5Avucif2NWJKtJH1
         /rI8zRVNP3ASyV1Y6MNckDdjomwQUZABXwjNKwa3AS7f71dJQCaNhsXgN+l4JhFTzXr6
         gZb+CDgjhbVp15SfNDOIalu5rZe+vCZQt9y6SXCBzpKHfDPrS4w3ZKE1Mwarj2UB1VXo
         V3zYCxIRNWMLWxLpy1++IkIEtDaeY6sr48ZOoTErXN97FTkzdktPhsgx7DhRLY4krhhm
         YP0A==
X-Forwarded-Encrypted: i=1; AJvYcCWeQdqRjq2DI/Ys5bRjVidi22+sgU6sTtMnqAd6McL9wA9GlPAp8Tk82TS7HcrQEycFisRC3+kqEEnGWR5IMGez@lists.infradead.org
X-Gm-Message-State: AOJu0YwtBYHdk4bwSir9hHS8QCZnbq/u2gDTpsdhuxVEQCxDjAySEPkG
	8fDW31iVoD1yClQoQWKSfrWjo13Q+YqJ2sfcesVGwZPLU+g1eyZ9ZXVY2b58iDE4eGcheBrGkY4
	kqkWKH9H5Q6pvNpeA2Rz03i1+N8UePqWpiH8TW/ZlOJ4iNTR7E2PYxrbpR6IsflYOr9k1KJrmP2
	dXuQ==
X-Gm-Gg: ATEYQzzQa8QJBApz7ZYWPH40MsNtHcVeKw1Bysxxep8qkfoLaqwQ0OS8CpdJqJIg1wv
	DurDlLJHGc3gV0C0m8aylHj64nN77Kq6h3kD4PyP+kQrF77ygfJS7WC3WBcO7TPDgCq9V2nTYKO
	xGL2Y4AkQjyu9ZC4r9JPyt4kMCx/zq0HNJlVEsIkG5hqI/dvRsi2Clj1AG3SXFmCL1DAHjlPcND
	AUPSq0SsEOuXWoh+QT5xfTG0I6fYLaEtMjNbFEC6xMHoUIoTF9fuAEutaBReqcnfuGcDvTa7bmU
	J/hPEGj5rXqwaxlKA59O7ccM4uzxCH0tAOsdRuVofONhcrZIPXI2iS2YyOLRHo+vm4tViyRkN1W
	jvTiq1ouaBu9ErF3wLZD37n8oyUigIJ5/jq2U+Ael4q8gFy34C/FXe1jjIts=
X-Received: by 2002:a17:90b:3fcb:b0:35b:9958:4edd with SMTP id 98e67ed59e1d1-35c300bd7f6mr1792666a91.30.1774600274357;
        Fri, 27 Mar 2026 01:31:14 -0700 (PDT)
X-Received: by 2002:a17:90b:3fcb:b0:35b:9958:4edd with SMTP id 98e67ed59e1d1-35c300bd7f6mr1792635a91.30.1774600273898;
        Fri, 27 Mar 2026 01:31:13 -0700 (PDT)
Received: from robotics-lnxbld008.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc68914bsm56234905ad.0.2026.03.27.01.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:31:13 -0700 (PDT)
From: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
To: konradybcio@kernel.org, andersson@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH 1/2] arm64: dts: qcom: lemans-evk: enable UART0 for robot expansion board
Date: Fri, 27 Mar 2026 16:31:00 +0800
Message-Id: <20260327083101.1343613-2-canfeng.zhuang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NenrFmD4 c=1 sm=1 tr=0 ts=69c64053 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=o9fUvUwYGSpSYbbeJqQA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: hMwiFG19twVq4A7N4bipyYLHKXrVJxvf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2MiBTYWx0ZWRfXwDF4PkRyktWO
 Ewy/cbGET3JS6NCLAvsFAeB/N2VECLKfzpmoLF6v2qQ6HrTtsGMJZSM0EAMBssfA+hmnws7t2v/
 M36snQcya4PwBsPhrtOHnHKzc8+ME27Szc7iQCzbHOB3sVzVEsHhBbB2DH2+iPlNqfg5xc29ZwQ
 4EE96OknYoQst6IBhChNfXDqvqOGCNjaE2FctuslcaoYRQqoHQHTnKomghYsGzcb38m+ATj1NcC
 cZxMv8bIJMiRYu9A5URU8OM8su0V7jUt+9OGcbasGBHt51RAEkcNj3WIFt1EW8CaJjWqPM+eb0g
 ANdMO+jyYx+QkcJtLqtu5fa28BzeZULIVJPKdeOGjhbhPmQDrwOtGx09/8cxV/nFRVgS5fdcBuk
 /ts6Ed5MXP4VHi+MVqEQ9SMKwa8lVEbx5jHqViG7lzWxepT2swR40RxcAX8KH03LggGllBYY4gO
 Jp51SptAn4l8jo1uRog==
X-Proofpoint-ORIG-GUID: hMwiFG19twVq4A7N4bipyYLHKXrVJxvf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_083119_905392_E8B803F6 
X-CRM114-Status: GOOD (  12.88  )
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

The lemans-evk mezzanine connector supports a robot expansion board that
requires UART0, which is currently disabled. This prevents the expansion
board from exchanging data and control commands.

Enable UART0 and assign the serial2 alias to provide stable device
enumeration for the expansion board.

Signed-off-by: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 90fce947ca7e..1e9386677bf5 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		mmc1 = &sdhc;
 		serial0 = &uart10;
+		serial2 = &uart0;
 	};
 
 	dmic: audio-codec-0 {
@@ -870,6 +871,10 @@ usb_id: usb-id-state {
 	};
 };
 
+&uart0 {
+	status = "okay";
+};
+
 &uart10 {
 	compatible = "qcom,geni-debug-uart";
 	pinctrl-0 = <&qup_uart10_default>;
-- 
2.34.1


