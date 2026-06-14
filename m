Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F1ECD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Jun 2026 21:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qtZnYSknyC6VJ7wYBpo4K4Mxwk7AfbIC2xEn+pH4i4U=; b=m8Iv9ZziaPuepDuYQEZmM1JO72
	98tLen2krdEyvQoIUgQIt3+GrPFNzEop8RZ2inSplytp8deVw7PmfB1sBdVu5Q41YaaeC1GdWCiKO
	kYcWT/vARGRgr+Lo2qdTXu1IzkRl2/VSumSHQZMjskmOnQSwHa9bpW3+eMxsWT7r16C94J65ySg73
	BVHxhR4TUi6oBUuJ/VegS4tXT+8gT6SiA2fbjun/wv5EAY6bJSZ8l0NkyumZcCojvqUmHHhcHoswu
	klW3mUHqwuzD9JhMr4PfMIQ52cNCFRngo/MfTVj6AoqoAjHjsA2UbmEvN86RcCZS+zC+hwNnApVMF
	YTtzBErQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYsSY-0000000DIr1-1NW4;
	Sun, 14 Jun 2026 21:33:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYsSW-0000000DIq8-0B1X
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Jun 2026 21:33:37 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ELEiHr2752755
	for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 21:33:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qtZnYSknyC6VJ7wYBpo4K4Mxwk7AfbIC2xEn+pH4i4U=; b=FsLNiNIdFmZndie2
	tRt5ydKZzUxW/6mifNC4GmEyHdSfZP2CobxkJ+rfx12JrWu8TqPsWEqV6hLQfCzC
	5D84ckxeYSFcD6dJkM/mqv2AzG/hq+FgDJE9/SKyye0hceGdue4YM16lhngWdiXV
	J1rLaeNsLicGxKuzqPvFwYBzODqXhCSFA3hAmAZ90Och1F2ojiBtY8RYhF/Lnp5s
	HhAMSz4BM51OEeD552zbcTie5lu2I72Ki+P2Q8jN+U9xJUdI1G6XPy6eN3kPMJLu
	7zfwOdClIIFat+7IBwXfURaKD+LiOh27fFVZbro9dEXlOFybvshEz8CEPxP/bKJI
	rgmn8Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eryc6vm3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 21:33:34 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf11699875so30188325ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 14 Jun 2026 14:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781472814; x=1782077614; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qtZnYSknyC6VJ7wYBpo4K4Mxwk7AfbIC2xEn+pH4i4U=;
        b=K6quD5gmWsX88gaPQTsdWOYorjYP5yLjyLUwMADZC0mWEUxje3Ep5zMqZhSRwK1zz5
         LvZxsOuBuRbKo65r/Momqlq62xaJNEugx1wNyKNwlqEmSrBPF1mI1TnU2Wls2qa2zXkQ
         JOIgPXOA1gnfCL8PNLwY2tcg5C9NXPFsBy3/WZ1SDaXzunnJJoOSuGGbc1J4B52ult6N
         P+On6I1mDT6cv2fIuOCdpiDvRDANvMXcSiar9fixJAENdOneAMn4l8tmdc+WtZn3UVpv
         8/7QiYI2Q9YSqbacPkRIWOBE3ssneVanJtqiB18jlWqyXjxmkPIxyu5wQ0RNMF9SNOLi
         /mhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781472814; x=1782077614;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qtZnYSknyC6VJ7wYBpo4K4Mxwk7AfbIC2xEn+pH4i4U=;
        b=I2mZbQ7B9UoG1kadLr8PIDuPfkcXtBgZBA2Jy/bxC+GCWPUWCfwzbxAUvwqTs08BYL
         qjxnjC7vtNSxL4IjWgQj9ptkLUKV78AfmlKamIY0B5C/ZZx+3aXggWHPYFrjv8tbMBBQ
         HhU9SGucXMs+vC0VEwu1bT9oo3zbf9/+ASoZHWE7WpOmpnpqgDHOanEuGCeNaFCpHZdC
         XLYd9QkHrvmC6kIkoLv79qChWOLla+3lmjwS9IDz13AuGEY99rY9P2wRKX57nuJvtZQ9
         9aM2QWVIdu9IZEQ9Z6HidtJj1NY3LOPEOT3n6F7IkQo0ZlXYzM+hZkJgr7dqa9DsaFPd
         oOkA==
X-Forwarded-Encrypted: i=1; AFNElJ/ifqyv0TPcQMHaJWVdynC5GcKcKYXAevLm8UtJt+SgAu6SjHhEY606akBs4vlVhxjYuPJMSqRaP3sYWMRIis/r@lists.infradead.org
X-Gm-Message-State: AOJu0YxkBcJ1yBYD528sHSYrh6vq2PrXFG0MlEbv1s2u/9E53y2rPQkr
	2iMyxIyAYHiHsMw4Z45KGp1F0ntEfY6nJQ016NeFStml88lARydHwIiJyVh1C2t8MsgGUy9abrB
	qhT4z+4QKlmq2pVPLRmotwxQb5vCO8gA7ECzQbKlRPY5B6Zjci1EVFzusjPEM3DhrXlb+lrTaVd
	1Gow==
X-Gm-Gg: Acq92OFhgqJwqpXnRx4RFgDr4WAj70PU2sE6BAVZCYrsILmUrL8DJ6SlQrAVeoVqL9G
	0UqxpuGJwSUIvGimjnIZpBxSkI7tt7IDsuaz4LXmgUTky/Mv3saD9nobV0SXjASPHkAR70WZ8xs
	7yIC39ICmhW5tomNDNTgGjvwwB4ZpNcJERXPt3HFhuSeBE/0tOPXY7xCyzwwhSteUXpZK+9W0gU
	DPip50IyLYll0Xy0ro82Ws8kVysNfWfdyOUrAaqsBuSFBsE05gRmqXiqCs5hR+78bgKk4OlNC88
	uY+MhHO+KRiEFPsAdVdDY1vI4es37JKv1u218dwOkqYPG1GGqbhQHbountnX4BZeAnXbI6Ia204
	kQfqlQW8+94Hq0loBItC9mgoQZ87uBwgNo4UqPO3s+00UQw==
X-Received: by 2002:a17:902:f790:b0:2ba:838b:bfae with SMTP id d9443c01a7336-2c42ee0f946mr95926875ad.18.1781472813704;
        Sun, 14 Jun 2026 14:33:33 -0700 (PDT)
X-Received: by 2002:a17:902:f790:b0:2ba:838b:bfae with SMTP id d9443c01a7336-2c42ee0f946mr95926735ad.18.1781472813306;
        Sun, 14 Jun 2026 14:33:33 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c6c5dsm78385815ad.21.2026.06.14.14.33.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 14:33:32 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 03:02:59 +0530
Subject: [PATCH v2 3/3] dt-bindings: arm-smmu: Document GPU SMMU for Shikra
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-shikra-gpu-v2-3-2f2d1347c3fb@oss.qualcomm.com>
References: <20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com>
In-Reply-To: <20260615-shikra-gpu-v2-0-2f2d1347c3fb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781472781; l=1225;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=S6znqV/U764pfMoWaMCKGZx0PPM7djt7INHbYNV0GNA=;
 b=cHbThRGdErenu+D4xB+6tFiU7NF1g5rTdTt10AdLvYMAoGXwlPggSRFZhJlXinOL4jAjn9CmZ
 z4iqDybCdYpDbwVAijgulh/0R9QqPHqBkUTaY2chI9tFPbAbld9LvBY
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE0MDIyOSBTYWx0ZWRfX34Nn7kqI3B3H
 UfhRw4oMQEVLn/XNALOuswJEf9zlVe5eSbqufLMFCm4HQfRe84Wlusc87ewQQZXmcA6iRzQxDGJ
 z3mcMlRRa2C0hgroXq+UDQXbYfMUrM4=
X-Authority-Analysis: v=2.4 cv=Oop/DS/t c=1 sm=1 tr=0 ts=6a2f1e2e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=iEDX-NX4Me02MYkbRrQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: WTZ3u2t-ObikQulo4HhLOb96F-LbjtmW
X-Proofpoint-ORIG-GUID: WTZ3u2t-ObikQulo4HhLOb96F-LbjtmW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE0MDIyOSBTYWx0ZWRfX9kt+gov50dRf
 4i/166ZhQSCZMTznMKVTDfRR6shUVY7Tam9Yynh7fGqX3DdmpIMsaTDqSiQ3gGnZHIb4CnqJGV0
 iUoQi8Rw3yTKLAHm++QK1uGEDNrsIwZezr4AnG72eroQ+h1SLRudoQ4gB+rDiXe0ybI/Ke0LNLD
 UmdCbaoUgiq1HtWmjWDtnl31/tR9U4te7JT6czM3TpcjJe9Lbbd0ucdxh9CWob7vGFVa+tfjZTi
 wtwKT1Nb1beKnys/rRHhPw9K07iAcc7g1VAlPEzp/9P6txPKxuiU7GbRNY4Vy6rTCJMw5LDd90R
 Oj8+wBEhws5T9p6a0QvkWHUfCLajo/Y/Jbo+FzrtYRH+dn3jYd64aVZIYXi/FkL0lSYVBppL3ML
 QM5a9E/sA1BmejA4hMUgLZrdCsXd0idmnsEwlhD/XrOOJjVrH5IqZzcR0HpbErvnm3l/XWuEaV8
 Fa/G+K8hMJAa9DTTD/w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-14_05,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606140229
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_143336_558333_A97F34F2 
X-CRM114-Status: GOOD (  12.33  )
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

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add specific compatible strings to document the GPU SMMU present
in the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index a701dec2fa0a..ad15fda5c25e 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -108,6 +108,7 @@ properties:
               - qcom,sc7280-smmu-500
               - qcom,sc8180x-smmu-500
               - qcom,sc8280xp-smmu-500
+              - qcom,shikra-smmu-500
               - qcom,sm6115-smmu-500
               - qcom,sm6125-smmu-500
               - qcom,sm8150-smmu-500
@@ -543,6 +544,7 @@ allOf:
             - enum:
                 - qcom,milos-smmu-500
                 - qcom,sar2130p-smmu-500
+                - qcom,shikra-smmu-500
                 - qcom,sm8550-smmu-500
                 - qcom,sm8650-smmu-500
                 - qcom,x1e80100-smmu-500

-- 
2.51.0


