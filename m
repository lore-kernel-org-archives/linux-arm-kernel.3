Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B64AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Jun 2026 18:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WEEd6pGIHJ7HSv0pntu9QVw4caHLnNnK53uxzqrs9Zg=; b=nPK6esnoODH94ZjKV/k8n0sS+5
	IpyJvRaQ1B2TWXnZD3+OqDk3u0dNYyFo4kOpVqmqvuEW0bEUBiB1d0aykXBUvlztkk7GtTJfLEVGX
	o0PKvxQr1C9Zf/34bpC6JDdtuwvD8LFpzw9PBndBvAJ0VHnpUw8seYB3j9FCr6xejA8435Aqic5Nl
	fKBf+s0SM+pDLkaO/bVfmpnCgFs52F28oA1tXSZxLSt7BjUwrtw2/DAPTEBbF6n7DhUbVATZDdKns
	fygqNHw77DOKYWMI4jbERKqm3NDkWQjXeV9d+4pyIJ/e60TfiHrEc/JWhGFewrcNDMuN/cLEBx9Dr
	vZ+kchiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduBy-0000000DH5p-1GK7;
	Sun, 28 Jun 2026 18:25:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wduBv-0000000DH42-2zy2
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Jun 2026 18:25:17 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65SHj8jS449452
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 18:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WEEd6pGIHJ7HSv0pntu9QVw4caHLnNnK53uxzqrs9Zg=; b=XJWDZsXyybmXtixy
	TD9TZjhNYlVwupMIKDj9ccUekygjgyb2NuRhpgPoLs8FQ8nh4FrmHFtjJK8OfCUE
	TzJ490W5r6MMnxRQghIRMtQs7mRwzHxQ8cqe+cZdT7VclxE1rMDa14L8OfdKtIK3
	q5jqmu2p6FmzKE2kU+FLalq7ysbj6Oh65RiGwAqmd2Vm4iUTo5Jyou6E880qZ2OW
	bInH4OR3letKay8hMZQRrISDVRFDG4kk+fwOdLZBf4rqjzz7yM+GzCKuZlRnLr9r
	OakVsTWVs2/f3s9172k/w8xzPP4nNeh370kQOvYHyE+9lBMPY864HRQ9IA7QKWpK
	PO5nJA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f26tukcgj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 18:25:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c17f62afdso2354621eec.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Jun 2026 11:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782671114; x=1783275914; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WEEd6pGIHJ7HSv0pntu9QVw4caHLnNnK53uxzqrs9Zg=;
        b=Z3dqel/ajT89hjHFXkX+JlOZZ8cKEMv9EWRxqYopHHmmcZRLqP1j5EtWOmRdSasfKc
         lO+SkT0cr7bu64DVX953P8gkMFXQc/Rbv/KDNL+nAxWPUPjeLa46D0O24l+D10U1mU3D
         OY1NLnBWYYAeGJTs99NlW4jpzuuYBlJuWOo0mFDFi60oa+7NYYwK6VxLcBbWO0axlP4H
         /5fdCK8TNENTFXIKlytT2/0Rj5aKNv3JyJOnbPIF54weICHTKyCCM0DIp7akGf/b0g6w
         I80NEhzVNqAoiayQAJARmvYns/uaneTU5UiVF5/6EW8y7ktMxWQSLYYn63P8LhU4atP/
         /HDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782671115; x=1783275915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WEEd6pGIHJ7HSv0pntu9QVw4caHLnNnK53uxzqrs9Zg=;
        b=e9srmGmrGiZEvry8xwCgj2SEACtzIk5iccBuku92FJtBQWk8GdNpdOP2bOsNqMSk6B
         rS5H6YplooIJPiwrY+iZVz+YPB9dC+21ckbZiKjj8GKtgv0oTkaT5ELzkzlyRyTebHUv
         B4lbWPoJUEs9OgguEtxRUfbyw7C+81Aizye2mkO4WXaMrl4BTPBcR2TsBmDxHYOftt7Y
         DUrpVIe2rymme96eeg310r2HVWdeX2ybixwdTIttuS8+6NKYDV48ZyG8i2xLQNzqFkrt
         aR1NIuTYjiwaqD0EZYJPsO8UAoyrNARZol0j+jfeUugAsykpb2+vjAN6f15yBgyn6xUI
         fH8A==
X-Forwarded-Encrypted: i=1; AHgh+RpXuGj8lBszwr/Y5YkgfyU4zLWcQZf/qJIxOIwqNOpZ7ajcG2AaPsDQYoZAX1Xh6LJfcsPnhGA3E6iQ86HayQYC@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+jL45G6m1YsYQORgumkVfEATmm//lQBbk1onB6C/P+BLlIs+W
	nt/GIiJGszUK/K4gobUYgxztfX6gzoh/2XZBYcV4AhdGILxRaVDzUycf7TU2/zDY21Ug9ZLXpnj
	q6xQ87MB5Im03n7vm3PI+W0cul79Qepq3AIAtqY4xiTkuKLgwIJ6RQxIbuf0r8qpNT1YMaHRC0/
	ZVXw==
X-Gm-Gg: AfdE7cmUjjqRLtqV2682ITnM2506digYm2wW8zoXJkykWqcKbHC2Hd0P+M7k6X/ULcq
	rbVODXCB4iBlkOY5dIjOkr5+xJKHHWAa17PPGZopphM9x0u7G07Pg44mxUMN4BBF4uOA4CQg11N
	B6pRXXkwZUoVvo3InvUt/6w9TZi6bP1TxCrzgW6rUBdENoVIcICWHmQ6oZ0bXPF6McFFfAmatAy
	5xZ1o3hvKeIiaMDoPh3JBuj7VRs6VUhQtgBXoVoSNwpEIkc7TkqScTSZD2mbTAh3JzQ/wwiMtl/
	0QUsYuuQmn4IenKLJjB60LTXXFyUbd37Id01uQRHycnWHfeZD4AxWi6Arx9p5iOatngo+Ix1Lei
	K37SSUydbnJ3psXermgzmBcWXqtw4zYSV880=
X-Received: by 2002:a05:693c:60c3:b0:30c:d03d:ccd9 with SMTP id 5a478bee46e88-30cd04d0fc1mr4515716eec.7.1782671114444;
        Sun, 28 Jun 2026 11:25:14 -0700 (PDT)
X-Received: by 2002:a05:693c:60c3:b0:30c:d03d:ccd9 with SMTP id 5a478bee46e88-30cd04d0fc1mr4515687eec.7.1782671113915;
        Sun, 28 Jun 2026 11:25:13 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c8b1a75sm37508218eec.19.2026.06.28.11.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 11:25:13 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 28 Jun 2026 23:53:59 +0530
Subject: [PATCH v3 6/8] arm64: dts: qcom: shikra-cqm-evk: Enable A704 GPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260628-shikra-gpu-v3-6-9b28a3b167e1@oss.qualcomm.com>
References: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
In-Reply-To: <20260628-shikra-gpu-v3-0-9b28a3b167e1@oss.qualcomm.com>
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
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Aditya Sherawat <asherawa@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782671052; l=803;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=uABArrmcbp7tI6+l6+GOP05oGpD2TXxtwDJgJbxPJ2c=;
 b=zu51LUxAMig1yDaYoqIMlPTJ3nAgm4JPkQdk45v4XIneHJFJdXsdBfMbW7Ec9GipESIbRsT1m
 E9agdOA8VanBZThtAfeTyOxBDPVcGJgnX+VmRW9w2JALr6auGuyEtDg
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: GQkWgdj1L3kpa8Af-Mdrvx0acYFJbU7D
X-Authority-Analysis: v=2.4 cv=A8Rc+aWG c=1 sm=1 tr=0 ts=6a41670b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Xl3f10jGzgz6Ja07nhwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: GQkWgdj1L3kpa8Af-Mdrvx0acYFJbU7D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfX4xfkJuFWZbDR
 yiMN8kXg7vZh9nJHDP6v1V+BbFlxuQ8B7bjhpna0Bb7KK5V/obfj87IkclR55LbR32ih/DlVAIw
 ij6zinIalVEuQvNV5ELXUdcadS6vv2ES99KrFP8kuQzRfpqRjsmo4ybr2l3Ciy08G/RRBK5PjNH
 TQeJ5z/zzPo5Itg1mJLhxjx3XRd1s24nZ02daV8BOt0KlAg1BMhtwpBry8FIdkBBb+7meoUOz4g
 pAydG96e5o5Q6x12UDRbrFFLxVXP3FhrDlDf40Irzw2r0syOTDzn/1mN6WkbivEbN1RW0U82Iip
 Psi5nNtpsyTIJ/ZQ9hkPEsOjIIW+kWK/6cgB/nvUVmVts2gKOt26nyr52sQlua70eJ3Jxv+pQgf
 QTrAyB2uQspyuAbaku7Y3/mH7tuCYbYX2x0VRJeH2QjB1TgB7+FVi683tQbVPqcU/VQYt3MaG6N
 6Rk5LA62mDNzk5XcScg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI4MDE2NSBTYWx0ZWRfXwEzbXqcU7dWq
 WMJ7RjYV2uEqpoKgBW7gszXd1dNK2HQZji4+VK+PMKe4w4rC1CU9s+zOi4+9ouFhuT9CEP4QqOy
 ildWlK99CcnHSjcfVjONbWVXIXCYWZc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-28_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606280165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260628_112515_762636_E582DF7E 
X-CRM114-Status: GOOD (  12.60  )
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

From: Aditya Sherawat <asherawa@qti.qualcomm.com>

Enable the A704 GPU and configure its zap-shader firmware on the
Shikra CQM EVK board.

Signed-off-by: Aditya Sherawat <asherawa@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 0a52ab9b7a4c..d46132e97c69 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,14 @@ chosen {
 	};
 };
 
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/shikra/a704_zap.mbn";
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;

-- 
2.51.0


