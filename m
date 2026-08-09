Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37978C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yk+KYV00feoHEnqEQdIlOr21cfjXAHPNBDwYtv89cDM=; b=YGppsTqYdNWSHpqVYxysz89X+X
	HCf8tWAAmR7VIQlLuqCpvCSGeKoschR8THLydmomN92XDchrJiARAAkkqwmWDB3TsesNI+wAJuDv8
	Ynnh394icAnSGlI4C/CDBEt6rhODLOwYJyZ1IQZPgdOgTQFSigg8sJda8gJef1mwK81TFzDgmZ7mi
	ZC34+56ktucg07ANMJA9Wn/zlbTWApFGuLxoGwZz9b0JWL9bS9Tw6/1FdZVk735Qa3/9+vZnRvN8U
	2ncaxXpfLPHgwI2FlbDod9RfyrAO7U5St3lLuhMoSg6rH0tikpmjOpPVpbJb/YdraXV7kYhy1lubP
	V97wKlTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9wT-0000000AeTW-2Zay;
	Sun, 09 Aug 2026 20:16:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9wN-0000000AeLT-1l4P
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:16:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679I9G3s3974645
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Aug 2026 20:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yk+KYV00feoHEnqEQdIlOr21cfjXAHPNBDwYtv89cDM=; b=ZHXdN1VpDKl+ZNUo
	ODEaQ2l8XHyiBPxTgyi5JmJf7quskfA6a+2oEsWpaXjcf/TwORC9I4Yjfr6rsM5C
	g5qiSKcTK78i34yeMKC/0/AMFu0lvDQy4llT3+dGXjnEfEK7yOHVo2OdMDzKdQUO
	ST3rwaLxP41exMd8U3iOwA1zQVPvrdqXS/cEpbBzljptJTMBO2NSH+GS3lczTrzS
	KzIoKi9luQ0npfbNSnr6zDlNjQB2VoDofL3XN2FMVXZRT5Bw+ba6Mu7uO770gNAz
	RZcIxt5zBo4HX+or/9qFQoYHP5r6nWVwRuRCdVOC9kJvGx2xcUEtg77AodrNv+u0
	ubo4Pw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwudqkjdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 20:16:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a97644aso13452061cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 13:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306574; x=1786911374; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yk+KYV00feoHEnqEQdIlOr21cfjXAHPNBDwYtv89cDM=;
        b=WEXxnkmI8skSZsqHn4hrYMnmxVc3GaI3xIzMUnXeEuRG12X5vG+V6Pla+4oCpnI/6n
         mWZHozG6ms4H5tFMXzttragqFlngsQ+UJO1W7CaU/8oaGdeugqyDAdM1JuQlASAzG7HM
         rbc8MG2I+7HSvT50TnL2jBzt3+9VSfz0zc64dzzxC/WYNCkLnSoqNnw7s8B3118ycWku
         sujtbLDoX7pgJ+gtSzafIOgbNmdH0Pc53/6r8vnScdFLSqgldLDn8XkkMVUoGSMheEmC
         GZNokODdEFCpZTt2aqWE5KPTmvfZrePk4fAgvZ1byCNCBfS3J9qkIVEQ/iykR1cvJtbs
         lu5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306574; x=1786911374;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yk+KYV00feoHEnqEQdIlOr21cfjXAHPNBDwYtv89cDM=;
        b=L6ORIJvufDsWGGJ4AcOE0hhkzlw5zPa4Y0olgqjJueHVltY44NV6gHA2EZKV4APRaB
         A8hcUA5iWB81s8Tfydb0TNZHrUs6COA1QTf9cBITPGGZTTJw8PoJeeonQiv2PwdLoIeu
         YC3ISEAP/1qHtNY/2gjDlS6QEJiFuPQ9N57NRvp/if27PJsGHNkw1wOI9LsBauz/T/Rz
         P4exxq2VqSUPLXX+jiP+XdLXr8/HUjm9ouPVBOmck3xRKk7IDWWENMZAspittaXqW1VF
         ORqnxCxtsmcFICOug5AuVWRZdqFEHAxgIVZuVN6PPNej/laTadhm9GdT3rJQD71WciOm
         AaOA==
X-Forwarded-Encrypted: i=1; AHgh+RqRfr1elrBrAjyI4R4W7RNORB+kuQLaq2AcSj5UevJ3XfNUkvnRFwU5qQ7KcndXAZfO6h7cbtbA/fnZquW0aJWG@lists.infradead.org
X-Gm-Message-State: AOJu0YyNT/oVgQ1RNSxhEcQO4JTsNc50JJzccQSgBZRA92rqnqGHu6BW
	F/HFmEtpOv0SHnjwDVHMlga9Rrw6U9i2Ls5KAZ7WQ83wJ9ItzdcX81uBH0tnUmWbM8hQt+1aLpa
	6CzGjc2ajHoGrxzCIjzSH030mNd2BmfMGy/+t53mGZylXi1YPdkARWFOVdEsQiBhA2n9sYFY+37
	7jgBi5/qagCA==
X-Gm-Gg: AR+sD118PYKVjIk6Ggg2668RLUrK0Y+C/ybq9nXGpIfqZ5pXHPg00jl97VyK7nSOI6c
	mRuXRTI6uJkZ6xWfeUIDb42Wrjm6Jl8XmWmIpPq8FGYO661MGfQxXrPxSJ9LJl2Qj2AVoini3Hp
	0iPaMa1b86cKpIrB2ILnfJIWumA7Q+tL8qEkUZg3gLakGjlu4iD7E00kLYbm+kb/U6aTClRQc2n
	JTQkNqNBYMmsIxwN6XVxZxJQBqUdJ3QYUI6WfOMx4HYJz7sxKuJJtpzEN2ngVaFNX6wde4vDJda
	b/8FfNpINF9U1cb2G2b2m2vHZYP6WJwgs5B8US7v+T0I73eRj6k61kU2IFpooX3qgAXWazK+OKB
	VMIwbHHz9SvCEgnNWEYbYfL+YSKkDj63Kvu12ZEwil/PXAQnUkxlnxPWcIe/X28Qvrr4zDW67VF
	wsoh+E19VbQEJYIg==
X-Received: by 2002:a05:622a:13c9:b0:51b:ecca:f2e0 with SMTP id d75a77b69052e-52ce5f44c7dmr383805811cf.5.1786306573850;
        Sun, 09 Aug 2026 13:16:13 -0700 (PDT)
X-Received: by 2002:a05:622a:13c9:b0:51b:ecca:f2e0 with SMTP id d75a77b69052e-52ce5f44c7dmr383805601cf.5.1786306573440;
        Sun, 09 Aug 2026 13:16:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:16:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:50 +0300
Subject: [PATCH 11/12] iommu: qcom_iommu: add the MSM8974 instances
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-11-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4519;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7mTJcw8HBthTXbxYIDu/Mf6KA/iBjN8RO8P1CCTFwMk=;
 b=kA0DAAoBizyKPgIpKNUByyZiAGp43++hNuem12DDwajis+OwqIh9iTWMPy7MPfgSALuCYaIMO
 YkBMwQAAQoAHRYhBExwhJVcsmNW8LiVf4s8ij4CKSjVBQJqeN/vAAoJEIs8ij4CKSjV8aMH/2Gs
 /ZeyCHt2uKgXo7yBo2k08/ksLkKzv4XX6EkQgXcFWdr4a2M43ghcQUcOi4hi97mOoDYxcJ2rtpZ
 3r5cM3FMU2JXbxaKfthVjEkIEaNoq1vaf5emEukCvTuRkIJJRin6FKlZX8uqQu4+2GfQOQ7TZOg
 pe6yokGZD6WNROQOQGw5r1XwNfWvjsf2TAhch8wgZX9GbMAoNKwOXaGYA09g+WaPQTLjR61p7dC
 iX451qTFBgZSuJ6s9N9oh4q5EBnI13SV65r+eZ65Zop/51irdjikPiFhFmsa8UGghQJPohmiX9a
 rTUZgI5FAFu/IgagduF7gsw8+ipPpSIgO2zAyjs=
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX8OIoJ+FkZsfH
 Bh3h9d4vKGj7AIPLM9VPZff/Ter6ZsWT5R8wKnGN7aYk0DnIEmTSXeIvv+00Cy+/8uCLdaWS0Lj
 FFb5NmO8yMnFDaT+9RTUy31uWVrxzTE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX9ND1oq4J1J3i
 m4db7iL2CoGkSstm59RCz6sE0r32NbTshQJS9i+jfLmASvgw9xbzLUuRJylRX00g8p4p9kHpinW
 AkJpLbuwvnkbLdANMVn1EgFADwfPHbu+b3yV3TbEBGCHnKVBdlD/vypwwpBfuXcFr/CUugoJYlo
 zKudm/FGABwE+hwKNosHeW02p6ddkDaanl7Qe2OLZrhtbmgZKylnOGvxiTUauBTQE6J3KmY2GCo
 vtubzaU2Sm9zo4Thv3iIq6cNdBg440nP4KmAOk1KZi/WKwh8UmR4k8bAANDmRwkBtbYjiCgjRgI
 xippYgitoBMDD+d8eC0GcHN2CgIbu1rUwQ3BoHCwzD7slP7HQME1ZvH2+Z4rraF5JrcPV1ab6OM
 mBWImmX1I80KQ4zQtEKUssfyReLpjWbXrludsxw381V9DNDwTheCDr9sQ2kHeSpln7TGwFfW38T
 jOkBrHp5xjCE+wmbpPw==
X-Authority-Analysis: v=2.4 cv=BNCDalQG c=1 sm=1 tr=0 ts=6a78e00e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=T1X4G6qr_Viczm72je4A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: hhMlfKWW7FHfMeuGwi38EtRXjO41L-PN
X-Proofpoint-GUID: hhMlfKWW7FHfMeuGwi38EtRXjO41L-PN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_131615_476721_E8EE3FBC 
X-CRM114-Status: GOOD (  15.66  )
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

All the infrastructure for driving the MSM8974 IOMMUs is in place, but
no instance uses it yet, so the GPU, display, video codec and camera
blocks still cannot be put behind their IOMMUs.

Add the per-instance configurations for the five MSM8974 IOMMUs. MDP and
Venus are TZ-secured (SCM secure IDs 1 and 0), so only their context
banks are programmed, like on MSM8916. GPU is fully OS-managed. The
stream ID maps come from the downstream MSM8974-v2 DT. All instances use
the short-descriptor pagetable format with the AFE quirk.

All instances terminate faulting transactions rather than stalling them,
as downstream does. The display IOMMU also halts the micro-MMU while its
context banks are programmed: a hung GPU cannot drain, so halting it
during GPU recovery resets the SoC.

Verified on the APQ8074 dragonboard: kmscube on the Adreno 330
renders through the GPU IOMMU (119 frames offscreen, freedreno FD330)
and MDP5 scanout works through the MDP IOMMU.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 102 ++++++++++++++++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 9523ae95fa12..bc7d692a2043 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -1187,9 +1187,111 @@ static const struct dev_pm_ops qcom_iommu_pm_ops = {
 				pm_runtime_force_resume)
 };
 
+static const struct qcom_iommu_bfb_reg msm8974_gpu_bfb[] = {
+	{ 0x04c, 0x00000003 },
+	{ 0x050, 0x00000000 },
+	{ 0x514, 0x00000004 },
+	{ 0x540, 0x00000010 },
+	{ 0x56c, 0x00000000 },
+	{ 0x0ac, 0x00000000 },
+	{ 0x15c, 0x00000000 },
+	{ 0x20c, 0x00000020 },
+	{ 0x314, 0x00000000 },
+	{ 0x394, 0x00000001 },
+	{ 0x414, 0x00000081 },
+	{ 0x008, 0x00000000 },
+};
+
+static const struct qcom_iommu_sid msm8974_gpu_sids[] = {
+	{ .cbndx = 0, .sid = 0 },	/* GFX3D_USER */
+	{ .cbndx = 1, .sid = 1 },	/* GFX3D_PRIV */
+};
+
+static const struct qcom_iommu_cfg msm8974_gpu_cfg = {
+	.no_stall = true,
+	.fmt = ARM_V7S,
+	.no_afe = true,
+	.ctx_restore = true,
+	.bfb = msm8974_gpu_bfb,
+	.num_bfb = ARRAY_SIZE(msm8974_gpu_bfb),
+	.sids = msm8974_gpu_sids,
+	.num_sids = ARRAY_SIZE(msm8974_gpu_sids),
+};
+
+static const struct qcom_iommu_bfb_reg msm8974_mdp_bfb[] = {
+	{ 0x04c, 0xffffffff },
+	{ 0x050, 0x00000000 },
+	{ 0x514, 0x00000004 },
+	{ 0x540, 0x00000010 },
+	{ 0x56c, 0x00000000 },
+	{ 0x0ac, 0x00006800 },
+	{ 0x15c, 0x00006221 },
+	{ 0x20c, 0x00016231 },
+	{ 0x314, 0x00000000 },
+	{ 0x394, 0x00000034 },
+	{ 0x414, 0x00000074 },
+	{ 0x008, 0x00000000 },
+	{ 0x00c, 0x00000000 },
+	{ 0x010, 0x00000000 },
+	{ 0x014, 0x00000000 },
+	{ 0x018, 0x00000000 },
+	{ 0x01c, 0x00000000 },
+	{ 0x020, 0x00000000 },
+};
+
+static const struct qcom_iommu_cfg msm8974_mdp_cfg = {
+	.halt = true,
+	.no_stall = true,
+	.fmt = ARM_V7S,
+	.no_afe = true,
+	.ctx_restore = true,
+	.bfb = msm8974_mdp_bfb,
+	.num_bfb = ARRAY_SIZE(msm8974_mdp_bfb),
+};
+
+static const struct qcom_iommu_bfb_reg msm8974_venus_bfb[] = {
+	{ 0x04c, 0xffffffff },
+	{ 0x050, 0xffffffff },
+	{ 0x514, 0x00000004 },
+	{ 0x540, 0x00000008 },
+	{ 0x56c, 0x00000000 },
+	{ 0x0ac, 0x00013205 },
+	{ 0x15c, 0x00004000 },
+	{ 0x20c, 0x00014020 },
+	{ 0x314, 0x00000000 },
+	{ 0x394, 0x00000094 },
+	{ 0x414, 0x00000114 },
+	{ 0x008, 0x00000000 },
+	{ 0x00c, 0x00000000 },
+	{ 0x010, 0x00000000 },
+	{ 0x014, 0x00000000 },
+	{ 0x018, 0x00000000 },
+	{ 0x01c, 0x00000000 },
+	{ 0x020, 0x00000000 },
+	{ 0x024, 0x00000000 },
+	{ 0x028, 0x00000000 },
+	{ 0x02c, 0x00000000 },
+	{ 0x030, 0x00000000 },
+	{ 0x034, 0x00000000 },
+	{ 0x038, 0x00000000 },
+};
+
+static const struct qcom_iommu_cfg msm8974_venus_cfg = {
+	.halt = true,
+	.no_stall = true,
+	.fmt = ARM_V7S,
+	.no_afe = true,
+	.ctx_restore = true,
+	.bfb = msm8974_venus_bfb,
+	.num_bfb = ARRAY_SIZE(msm8974_venus_bfb),
+};
+
 static const struct of_device_id qcom_iommu_of_match[] = {
 	{ .compatible = "qcom,msm-iommu-v1" },
 	{ .compatible = "qcom,msm-iommu-v2" },
+	{ .compatible = "qcom,msm8974-gpu-iommu", .data = &msm8974_gpu_cfg },
+	{ .compatible = "qcom,msm8974-mdp-iommu", .data = &msm8974_mdp_cfg },
+	{ .compatible = "qcom,msm8974-venus-iommu", .data = &msm8974_venus_cfg },
 	{ /* sentinel */ }
 };
 

-- 
2.47.3


