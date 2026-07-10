Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C31C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 02:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmLmkU1YQaMHOUF56Fxlmr/AeBRPhfqt1YSrM4LteKE=; b=EDr2xv6r4c9maReG8JXlMWHrnF
	BNsIQR9FnwH57KihNXF4bGaQ/bHdm4+1tJ4pWJzvBYsQVgd4n53CJigF4+dbJnN/umJkaIW9ENz7F
	HeZbhPUFdVU3828N7YlMUs1WauTeJToi59bc4vbVzVNUJ5RdOFjf3KFboq64/1j8tZPx7FiWQd2X1
	n4XLdUhIPZ1gXS5P21nwm1rGXtM6K7w5DUp2q4y2dgtQRSetRi1Md4kho0BO4HhyNEJqZgWANi9kS
	Ac5NZ8JH1mASgxZHBKr8jbHCaYTsTLTnhhct9eujqUZp3CI6mTUsh9ktyBxyEG/ehM6jsM5eDt/CJ
	ug1vh/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1AF-00000003yqS-254K;
	Fri, 10 Jul 2026 02:40:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi1AD-00000003yoW-0DKs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 02:40:30 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669HXlvr2474047
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 02:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fmLmkU1YQaMHOUF56Fxlmr/AeBRPhfqt1YSrM4LteKE=; b=kzGFM3fhaAn6jTjX
	53uhY/ZgHBfQh6PzZV2cU/6cRJV/qV0eow2t+6nK325ahKFczpnL+7NgJLyWRD7j
	76/EgfB/+ZeR7TPfFy9SgPE9JdcTqaafLAO0qlY2ekQ7xLwU2YX5HByCQlvOdvd1
	8zVPImqgJ1jb9z8Iw/pu3pENbNhMwQyXi+c6JHc8vaI3jLaRQKosK3S4Pjii0fWZ
	xNkpQueE3f5czDJMYPyROHy0mwYNJj5KmEWl0lV9i3TUhXDMyg7CLvsIGPWs4BnV
	1CgmquQBY6DyhYTJfF/xy8/FJzWbVK1SCXe+jlJhTAcm7nV4waKMqGeQWSCec+Kz
	4SXFBg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4facqpjwkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 02:40:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84857446424so789419b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 19:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651227; x=1784256027; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fmLmkU1YQaMHOUF56Fxlmr/AeBRPhfqt1YSrM4LteKE=;
        b=KpmqaheiSfwhE0b1qJL+1PiVS9Xj97b84QWs5RGopL5PGm4nTuriMyFynJIGxiw9Er
         h+PtfwV15l1jsKeRHqjHV3pep2R8SsqGR9l0BbJT2OJd9blYpSxjGd2QNorqxR8ISsr5
         b3LFKXc5aMMEWfUbc6CfX4xgICnTR3/VfpXHPt/OKmsh+vDDDntajTLEIazXzN8wTA4s
         VTdEPnwXOacowUZE/QZPbVhJMELRQMci/ZKsapx96cNcDJh539ZpgHdcAbPojLIqSu3y
         Ez5WcLIrWG5UKNCPK/KZ7HfkqPLUN5fkxJZCEefr0OMgjY5QKDpd0k9qpczAUVpabDge
         lIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651227; x=1784256027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fmLmkU1YQaMHOUF56Fxlmr/AeBRPhfqt1YSrM4LteKE=;
        b=ounDyZbW9mZe//3OKd1Uj6K9cDERyegChf+MUz8jZGij5gSx45bd4heyiq0gGa4RYk
         vYVUdKgac99se7y+lTFKaMmlEUxb/f555p6Qs7Ax4yTt3xydJ/4D3ZsVwhVC6r/hMU0J
         K6DEdpbZ45CRtYtZhQ39s+o2Com8Eq4ejmGecG0/HxJFg/ZaJw7rY6x1xiOuOL1AMeya
         hwl6/sMOzE7WAuFNMajbU4m93DFzuV+kzu8Azc3xQ1oFoe+3D/527dRzVAm2LmGjC5zk
         2EfpXJWaPaA3MqHA/EN92XOsPfpWt2MAQrv4cFjkPVXeehuj+BWOFbnidlll0vmkkFbE
         Z0EQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqb+HetQu+6Vge792R8P2jpjk+DicaIxxoypeZScwj8GkhAoPcAEGvAJ7PzyUJ4zrATOUeVnIVM2dbHOfAASbxV@lists.infradead.org
X-Gm-Message-State: AOJu0YxEDDQgIq5/nvovB2on1zWPGCwfw6Sl34cWVUQJk5LdtDvIk2sE
	jzbM8UxYWSp/g/fEnSuOFJx7bnXn6VIwF8co4SnNmJhDSxLxanZAX/6U9nZlWDChcdN+Dd64ZrF
	zYrDBD1kmodieqJ3yi8UOnnU7io4FqiE+LXzQRGZyYO7LUMzgv457DHwXG/ZvpNaY/N4gxzNJQF
	Klow==
X-Gm-Gg: AfdE7ck6WFANpOdx9dIQCQL/F6DhAkl+rZhAyzuWbNlFNoBBVPXD0B18ehS/QNe2dKA
	S/b8j7NiG1L3NC6hNCBpZTQmqiWuwPtTQR1LoemTSKD+q08n0+sJEUrNHsmTob/UruxuxIA/kHV
	LRqSVCLubfhaCc292xtTrMpWjNlXsRvpNT80CzTouMffXkPr9TRPJYSpK7r+klPfA5U6qJe8yyv
	1BNtLhsJnfA66y0Lq/UG7UrPrdzhl4OaXkfqYcCEdaiTxxNMfnSWtr3W1eEko4mO/ISXo9iM+nI
	dJpN7OFt0qb1vIiY2u3xZr+MJVpmOKXuZOgc+A/pHicuMf0h2SJKpmroXIKwM64yyOv8zvoMmJn
	lHXZsDSRK+NtT0QBPgzq+YQNkIrw6XQtWRIta+RFcB2MrwY03Of6KG45d9cdaBLC9304aGi0pdA
	==
X-Received: by 2002:a05:6a00:8c8:b0:82f:72e6:ed4 with SMTP id d2e1a72fcca58-84842e8f2b6mr8945867b3a.0.1783651227043;
        Thu, 09 Jul 2026 19:40:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c8:b0:82f:72e6:ed4 with SMTP id d2e1a72fcca58-84842e8f2b6mr8945831b3a.0.1783651226566;
        Thu, 09 Jul 2026 19:40:26 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4517611a12.5.2026.07.09.19.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:40:26 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 10:39:04 +0800
Subject: [PATCH v6 5/5] arm64: dts: qcom: glymur: use Aggregator TNOC
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix-tracenoc-probe-issue-v6-5-41eb36fef8d9@oss.qualcomm.com>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651186; l=1699;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=6SxIbCzVB43Q5gQOLOs5yrmATRLuGa4fNKmIn7mrhsg=;
 b=dbHuilsW4KxM+/xj3xUsen5J+9wy2lfD6bFh1ZEENRS60E3sUsXMnDUWzpcow2ZRroA77ut4o
 rtUALoX0HXrCQjChr6r9g53qvCpL4ZowiOj+mgLseTGDwJJ9VRM3f2S
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX4wBQDW4Jrn6Y
 ktE5mCJRmyZqm/901O3iSZIMXUY5OCKxyVFbrrzoVSjbbVCBzdgNjtwXKg3lbKKlZ3XlTu9FyXm
 CodWCjA3r7kCwD/+Lr4OSuj8tylSEIGZ754ao0mYumyVDG/N4jUhnX2yQQeDaxnOnkqzHDX+itP
 3JARgwr1DSGaz1I2CKzDq4LprrrgxUoZZkIugL57Akcp8eLLAf++KD71HPX5IGJUVNGXzfEKId9
 ktX2kNMjX0b82aNM09JVA9xFCe+aFfimScFyHnMRgwy8UZiEQv0pH+MtKifmji7b4KzgS5aftqO
 5oD4An9uZQsdYMHSK1EGeLwaGcy4hyne/SwKYSaZzB5uT4mZ908Ql2FJ2XGAkVHlDw66lD3F/Xf
 fqOyJ/Nzmc8sRUPp6OI7YJRU7caeqch8Rk6kHJHSs1czTHRoLg1FSKEEoeUeuPJCsLnL8j/63ui
 C/7kJ4WQcbMQb3gKiag==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX3b3YtndIQI7I
 xq9jFREOxnM6t8IUfBeUeifxO3SkTc3z2vIpoy8J4GDKJOm74++4RFmNC4Uyozz7sq64wb7FpXW
 EByjnIfpw4oC0Fp7rockQgDaghA6hWM=
X-Proofpoint-GUID: brPEtNkipFZLxeWcd-DaSKjzHQ4QPzKU
X-Proofpoint-ORIG-GUID: brPEtNkipFZLxeWcd-DaSKjzHQ4QPzKU
X-Authority-Analysis: v=2.4 cv=GJ441ONK c=1 sm=1 tr=0 ts=6a505b9c cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VopqNUcg1dr8wGNk0jsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_194029_212958_64DF4D37 
X-CRM114-Status: GOOD (  15.46  )
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

The traceNoC node is the system-level Aggregator TNOC, so it must own a
valid ATID that tags the whole aggregation path. It was marked compatible
with "qcom,coresight-itnoc", an Interconnect TNOC, which is never assigned
an ATID. As a result the aggregator had no trace ID and could not tag the
merged trace.

An Interconnect TNOC is a subsystem-level aggregator: it merges trace from
the ATB sources within its subsystem (TPDMs and other ATB masters) and
forwards the combined stream to the system-level Aggregator TNOC. It
carries no ATID of its own, because the Aggregator TNOC downstream in the
path already owns the ATID.

Switch the node to "qcom,coresight-tnoc" so it is described as the
Aggregator TNOC it is and is assigned a system trace ID. Rename the node
to "tn" and use the "apb_pclk" clock name as required by the Aggregator
TNOC binding.

Fixes: 1f7d0c42a08d ("arm64: dts: qcom: glymur: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 20b49af7298e..0c04dca5e557 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -6038,12 +6038,12 @@ qm_tpdm_out: endpoint {
 			};
 		};
 
-		itnoc@11200000  {
-			compatible = "qcom,coresight-itnoc";
+		tn@11200000 {
+			compatible = "qcom,coresight-tnoc";
 			reg = <0x0 0x11200000 0x0 0x3c00>;
 
 			clocks = <&aoss_qmp>;
-			clock-names = "apb";
+			clock-names = "apb_pclk";
 
 			in-ports {
 				#address-cells = <1>;

-- 
2.34.1


