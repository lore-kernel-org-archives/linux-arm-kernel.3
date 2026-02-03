Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB721E83057
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 05:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=; b=3Lrg9m7gm0FlUWyN7woaHZQR+v
	mXZGW0WAJpkC13npwTZFquNo30CsWActG0vpCBwXzi/51DTmXd77MFXkMz0q7PD+wW1/JbN4B757I
	wuB2b+lMOoATOp/NDLARdu5qof5qPYG89oFPwO86TizNe1ZhFes5qKgPY8px7nCh05soYrNpq8pXc
	8QMXLIf+LEyZw9tHEAck6JTzZZUFuT8coAek25n2HKNSBcnnkSLKcv8hL9lgQMOGxbuqrXdpecFPv
	UPoWdyv4jRe1aGK1bkb4g1cwDwX4LKaacRrYGEMVrLd7R6QAdEWewxYCfNoI6WCT5kxjTpRBOLSG/
	tBCcb0lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9L9-000000068r1-0Dm0;
	Tue, 03 Feb 2026 05:52:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9L4-000000068nr-29xc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 05:52:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61344uDI2998767
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 05:52:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=; b=K0kqsd8hcHXqDv+m
	men3VgvgZm9iXoRodTQL9wLGndo3xuDNk6I3Bz1MWn0LLI046yfRvt1fvqRC4iPv
	xmohmWjV6OpySZYccV/Fw306/+pe1nfhZ7L++CLfJXYXfo2ib92ZHCdbsmjETvVg
	xH8M/pFaU9FCTBAxHTSnDidcS55hkwrGzAdTcDYstLilhocidCReyG21RH9/Sv4B
	ggd/Z+1ExIZIo5k6H2VxE7htrRQWOdUYNS9tpIiulrcmKfEqGQ1qZL9YSgr/ENPT
	k30gv1rE6RuiLpXXhFbL/U6a+iyMoUWrI7VHQPn6DN1MJMx5DnV3Q7e3pm14UPQO
	wlIJng==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2v0masw1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 05:52:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0bb1192cbso44015965ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 21:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770097957; x=1770702757; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=;
        b=jvnveYw7gXZrM8Bk9YJ6pMdcyV1k+5G+O0q/yT9xLX5xonS3dOMrdeVNpJWc8KcW0m
         MZ+hfJETM9o0SGmB/7kUb4Prw0Pp88+y1W1a20BlgE9CzpyYEbnMXeEdoQZ7FVkBSuV+
         bXORJj1nyvNIW2swL7aRytAdw59MwOXuWKmdQoczO946eDkf2NbqD5EG0jwpTiKXBiOG
         aIcIDUuNOQjGCXsXRVgmiSz0JQB2QLiRUClmPtuHEEAB2YXb//ZcQsaZ1/yyGFo1wWVI
         JSmuVAGqzA9wJ2DMF6dD0HFTQubmxhtHo3moD55YRBybazNzEdbQZ/Q95/y01kSaY/g0
         RosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097957; x=1770702757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2hUWnOSTgpb39HiN4iScZAjggx5kZGetEG2O1nLvCqo=;
        b=NbqbayDvUNvoD6kwusnHSXE+Z3aYuxKAQpdvRkAFiRAJXwkdlOphmh/OkykGFmdizb
         3QiwmpR7TD0Z4/BngAFbRhkYH3hlL/33zZO7B1fH4985cCFRPWEsdRcJcKIZQnudOj8i
         EYMLwqIK9C8578sCZrW/mfAVeXR2yPyPVwU5TauyqXP3uUOplRJnSqSJVHo6gBQMQ7AZ
         gamQNGJ2NIQPLxvIdXazj8Zy+okzlEGWb4xui/SVZHyN6sEKVNYUZmL3l6N6e8L+YmQV
         D3MT1+oaXWngDRNykWD27nn7C9Df9R0zbtSv6GR8IV23iOpliu41ikEf4Ilkklbddr+0
         DbBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMlc8/ZlZPDlqbunw6017N1fd6CvK9vB66Sfel+Dqd/WyabK+zS8dMzi0AFW1D6P9OF30E4LN83BrCyZ8z0u75@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6O8r32BRDOR9vYauTLoqVng3YJGHAjX02CDQULkTmstrLwJNx
	Imms0B8fr59dJBJXnv39jGmI/bCMIxI31f+sq7i+F//OewlzJLeBVa0D10IAashoONED7WjUgE0
	OL5JYr5hjdy4VjdsnkriDQyfFPO7nEWEJKBo71JS2sPRkcspoz1zC5kWowoJKL0ZANYJHs/4GN6
	hcBQ==
X-Gm-Gg: AZuq6aLRSBFAvVHvNurPpEoxLZGPJoMvRij/LbC7BuKOH2HVoz/brbReQtqVgCu5IsJ
	2h3p4BTNWYJ+xz8NJDT4ClABgevtE4aAFjMGobvxtCkbF2oqJoRYcNxwVkVa32/MOAmWlWXt0Ze
	mOqVsAgzF1xaDRcvZ7mMxA0GwOyQt9HlQV/1bs7QhjkZV1LRKwwvveU88KJvoCKxAT1GtJJDyF/
	6apWYlGi73SNllYS+xcoqk1lzK6akmB5bgXCoiAqnC5mOy0Mz+iDLhfuKQYV43FJ2nwyPG7E++l
	QiPP/gNCXIPteNA2JYjBlvymEd9ZyUEflD5hwC+7F4o+NxKst/CVrdb2jhO6xXlnhd8b+94deJb
	4xlFHuybXEYOUiM6h+VdykceMC4krReQgHuyYWjjLxpFO8mkPWR316BeroRJTTpPKeDFSB63f
X-Received: by 2002:a17:903:4ca:b0:2a2:dc1f:78d8 with SMTP id d9443c01a7336-2a8d993fc9emr98505645ad.42.1770097956573;
        Mon, 02 Feb 2026 21:52:36 -0800 (PST)
X-Received: by 2002:a17:903:4ca:b0:2a2:dc1f:78d8 with SMTP id d9443c01a7336-2a8d993fc9emr98505295ad.42.1770097956098;
        Mon, 02 Feb 2026 21:52:36 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4189sm157424735ad.83.2026.02.02.21.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 21:52:35 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 13:51:24 +0800
Subject: [PATCH v12 8/8] arm64: dts: qcom: lemans: add interrupts to CTCU
 device
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-byte-cntr-for-ctcu-v12-8-7bf81b86b70e@oss.qualcomm.com>
References: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
In-Reply-To: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770097897; l=769;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=U3SBm8Q4F2Lqg46nftP77Qbyf63TqJWnGptxyfW3r6I=;
 b=1uZvAUAeceK/WP/F0pOERpVVCDW2i192FDsv27hjFMUWbZ1zfioae9HdwPsbFgIfuTlV1q/S6
 RT6QhC8e2ZsByser15YbRD35K3uiM61LNYKv8pO5XpoAq2rbPQE+ImU
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=dceNHHXe c=1 sm=1 tr=0 ts=69818d25 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gBkj9RZkAcI1HbXH1KoA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Niy7mI-uA7TF8cVbN5jIVKXljL_V1ehd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NCBTYWx0ZWRfX8LCr5aalGSQA
 rpcfZgKWcVMahefR0oN3Fwa4qSFQ9+HOFpGrYdDs5htGHNRCdSFS3tRD/p4GwdopYn0TWOxZ8vb
 QXo4P5Kp62IwL0veaq5yX1h2buxTeHlF4hHTnD/Gq+51midIhwBP/J3xB5Hcj4kJn/3e/fRhhgr
 VE6gq8249TzVlV98EoaFOjaoMl/R3cD7QG7VYDbnug5LyXrDDHiDVgeIaXBl7iQZi4MX+Y4i+xn
 Wv3vQJFOgFmGkBJFayCshRw6V4AZRakDceIGFl7w17KjL2szqlOdp3JkR+Yb/B0jC0ehzJBcHa6
 xpg9Kdqkd8P/1aXQFIA9P2ddPTscBqcWcLCM47/gEoa1x5PAcMtvNmKrNw9uxM7cXhUPBfCEyhw
 ybZHzT9zVolGIjLrRjBIVMwN620oVlXynrudB2knivThXDSztnS5wv7kEnJbo7SLYc16aZFe/Tj
 +rcPAuAg8rcHN5+B0yA==
X-Proofpoint-ORIG-GUID: Niy7mI-uA7TF8cVbN5jIVKXljL_V1ehd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_215238_700120_AA83A82E 
X-CRM114-Status: GOOD (  12.97  )
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

Add interrupts to enable byte-cntr function for TMC ETR devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 0b154d57ba24..75a468ddbf53 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2776,6 +2776,9 @@ ctcu@4001000 {
 			clocks = <&aoss_qmp>;
 			clock-names = "apb";
 
+			interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
 			in-ports {
 				#address-cells = <1>;
 				#size-cells = <0>;

-- 
2.34.1


