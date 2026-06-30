Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65C8DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 10:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPV0Cu4z4WlvZa9lXzKbTkoT+NVZAbTVV3x69Ag6f0M=; b=BC5YthEjJxiitOUcWx9rZGs+3+
	7WKRT2rhQPDJa7yWuJgehbsYz4anFVVYahtBPwnOy0QH21tzAAc3ZwoxxfEs94sXgILVZ886p8lX9
	xEDS6h4WA0D77aj8SItgP4fgPg6gqG00Q3SuAnpWas8OuycYR+W7VyR9M2LqKoK1OibxBuY6AfQG2
	9ZZa/fJLQmLIYJtLwjLWmBqCUQOWp9EIttJrbkctrbfhUzOA599k7a4qs8+fc07MqAOAXBGJ8OGip
	VNJd0Xe7USwn8SiFvCH1zYbk7HpzHzCnmPqqcPQdcT/SdznEez//Z9OShGTabVPj89C6m0dP86ppp
	sER0VrSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVq8-0000000GgEN-3P7I;
	Tue, 30 Jun 2026 10:37:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weVq4-0000000GgCF-3DKa
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 10:37:14 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mkhQ1602532
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 10:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CPV0Cu4z4WlvZa9lXzKbTkoT+NVZAbTVV3x69Ag6f0M=; b=HI8EC6H0H03YFrdR
	YqFGi1tdZcXtXs0xVQJn1RZt/pZmxE6Iww3lZrn+d94j6JwVt6F3Rq1tHNn7+jOW
	zuuiisgVqI74vBjjgHHgB8YBqX4Ad1mYDSKw456FetKf3s+58QH1/5FZrvEUXWXU
	SMta47BXz7nXqwWiGokJXlHf71tqXPoCFhrQn1ZjwB8Kej7QqbS2qAtz8gmpiZ9+
	FaHAB7BF0PT4sAKDC4sTBJZ87jhmyGtbHBqt5gVOffY09vIp6XZPWrsekV36PoWR
	Hr3PiE9/1r69VKVq5RrxU84lojDv26Pu2l7ahIOXN0LDkiRdCknZD55wV3lgwZ1r
	y61MUA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avprdrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 10:37:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8479586724eso1272471b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 03:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782815831; x=1783420631; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPV0Cu4z4WlvZa9lXzKbTkoT+NVZAbTVV3x69Ag6f0M=;
        b=HtgOteHSu67ivOwAiWwd6pnkhR5SYQ0ChWz1wy55fnz9fLh/J/0rPN3JVM6qu5ZfgO
         MYZ6B+iJ2okHnAyuKJJSPKa2H0DxJRouH23uw+x8YfOB6jJgKedTh3lW4Hj4BujdpUJh
         //ggVn7aOF7LgPQVd6dDtnRjzS9DXVzud3vKEaxxETaM7SrmNkPnEH9r9P4gsgVMMS0T
         Sx8U3MsqIkcumDVgYHllgv2Tv4RgQn6RuhA5LZgpxqic9gUy4kQl0Vv/brkkIFM5OjHB
         5ecR/FwJhyRhZii+7p5DHPZiwa6h8hZZSGYEU645ICqCHlBxdsWNSw3xbunEtctb+MtF
         1lAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782815831; x=1783420631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CPV0Cu4z4WlvZa9lXzKbTkoT+NVZAbTVV3x69Ag6f0M=;
        b=GdNAC7y5jHo9o0qHFLiq314LqDgQZihmjZS0Di4VNphkUJp9pKxza+E70CFKQUeorY
         HhqN2oYCuDor/4QupMbp/svSJg22fRJ/1cOn5njpfkcRyTKX5THwZ593JO37LhSQ8ScJ
         Lc7qgFihW8J9TZC9Uz58l7UApdfziIYHxgE1XdN4PJk3xxc8AKms7zi4L/PDy43B+YM2
         ybCinOTjK6y+AihVOUl/Ms2EneyGOxaJeY1jvyhgaaN/gVXiSjI1CRsNN9UMzPHEoTqM
         TOWxiuDK24A0Wcfj4KPEbpTK8LQpBw393UJj/pV0PV7M4BbDWaXBFG6tAh9l5YC9mgra
         5geA==
X-Forwarded-Encrypted: i=1; AHgh+Rr9Yj66AIo/3JugQiNiZeAPd7ug7AhKD7113NTVuJMP5pg6ME2S7/LUj0mnQNtDSukGQbDg72mllMUXp9PJwTQt@lists.infradead.org
X-Gm-Message-State: AOJu0YwiZ+CImMG1+cE1D9BsMYyz5043iIVpQiNdO9+7PJIrAJOcXbH1
	Wte/HGoM/dR9yiW0GHTt0y3sE7+WQFH8tQr/2Xdy9opAQ/vFSbwDfLTxPv/KRqFp2x35A57HHy9
	VJunU+ljwgOca1rCdZpzF2yM/FsCGAK4x3EHfMgeXO8c4Q7wwNhBCeXcQPmEb5LeJDnFuePV0Ht
	hVJA==
X-Gm-Gg: AfdE7clgcGLW0O1TtiHx4uLeJtfqDp7pK+hakF9j4rO8DJ9/okuuVrQkgmXHTuym1Qd
	iO5W6CMqHZZu9zkSfpzTMV6cnDp+cNgwhPJU+/eroS7M3stDVnjLmj3GlNGadS+8MtS4ArDJJRV
	DAaYXKgoW8kxmCOQXScBbQWIma2YHqiSb3L4w5Vgr7HaBUpgR+l+OFwi2FPVTd5E5/Ygs99MKLB
	OaUe3WzBUZC61I1WQaOYt/A4woiB/42X9aZs3D/Pk/fiNp44any1umJwGdjsxicUJ/gLVhjsf0a
	ojISrUqdAtLJYl77R7tXJMKt/0tSSiM0Tv9iXeMQ6Al8gPmAN8LmhMXreLCVyK39+9CIdKc2yjA
	T7FWFL/Eom0+WXiuarLtm8XeVYONWVwkSyLWXj8CWpiUiYM95uh1IoGRiUCExj+y/Vd5Ckty4kg
	==
X-Received: by 2002:a05:6a00:1253:b0:845:e1a3:107e with SMTP id d2e1a72fcca58-8479f27a8d4mr2349394b3a.52.1782815830835;
        Tue, 30 Jun 2026 03:37:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:1253:b0:845:e1a3:107e with SMTP id d2e1a72fcca58-8479f27a8d4mr2349370b3a.52.1782815830384;
        Tue, 30 Jun 2026 03:37:10 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cf9b8sm1677581b3a.28.2026.06.30.03.37.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 03:37:09 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 18:36:05 +0800
Subject: [PATCH v3 3/5] arm64: dts: qcom: kaanapali: fix traceNoC probe
 issue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-fix-tracenoc-probe-issue-v3-3-7201e1841e94@oss.qualcomm.com>
References: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
In-Reply-To: <20260630-fix-tracenoc-probe-issue-v3-0-7201e1841e94@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782815804; l=1214;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=HagOjHvvKalPyaoRLhnwxbxe/eeYB5Wc6HvJnYKVRFQ=;
 b=4lZF37zPda1yimqyZLnf7/5YnIJaYzVw6x5TTSBnASYMyAeufNJcTbfRuB0rbMFy0xiaCqNVX
 eJO8CBg95lIDb+wy49Iz61s7gYwDsyG0IxF5ZBSDEd/UMSltfv5+3YJ
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: vzOiUDkpz40uXu4mzfq6mL8jNObF5_Q4
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a439c57 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9-n9NCBYjeJb_QXN7LkA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfXwdH2mXLiZZ5N
 xdOHzuALrH8pj8MIlaxKsfmD7czi44fPWseSWnk4wCn5zwQ0PduZk0CAs0vmk/semgC1EhcWp60
 FlbEe4RkCHt3X6ZmTSJLDfuJ0ezK3K0TT9+waNiq7/ddLiy5YGTKfRxv4svKMeS8wckZoPNRD8p
 3Lirz/HOoIKxDgmH9q7G+zghBYd/oQZ+uBuaPH9h9gdcTQ0eTttBQfApqCjBygDulYfRB11aSqy
 m6LsMIwYMtz3OtJSFkbB0LKYBqTz4RUz5qBdVByKALF9VOAtj63lpdazuItl6W8MPc6Qxuz19V/
 T7dP/zsMH5JVegBvd5dTlni3+zu5za7zOBM6yLnQMA2Vzt0ekaRTjzBqR4Yzssc4E1dA7X7OUYi
 AlXz/tL3Xtz/4DwDMPYit4xX5B8M115dwnyK+ZtYK16fUDFqNyDub/AMDcqyrFUoeJmoTKog0xu
 LBcoCaG8HnPmS0wplrw==
X-Proofpoint-ORIG-GUID: vzOiUDkpz40uXu4mzfq6mL8jNObF5_Q4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA5NSBTYWx0ZWRfXyhZBXtZ21qNo
 AQ5bK+QyiwfJ8ZRqKKbBeBH5KGwzGOL410fjMzNfxXI2Af2ok7LaCPpvxkk3M1z0xZjbqth8XWP
 6pV2J3XXDTTpUZcKzlxnZGHsUVlVeEM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300095
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_033712_930756_C12A04F0 
X-CRM114-Status: GOOD (  15.71  )
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

The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
compatible, which places the device on the AMBA bus. The AMBA peripheral
ID probing fails on this platform, so the device never probes.

Switch the node to the standalone "qcom,coresight-agtnoc" compatible.
Dropping "arm,primecell" makes the device probe through the platform
driver instead of the AMBA bus, which resolves the probe failure while
keeping it an Aggregator TNOC that retains ATID functionality.

Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7aa9653bd456..e98f4aa4b141 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -5004,7 +5004,7 @@ tpdm_pcie_rscc_out: endpoint {
 		};
 
 		tn@111b8000 {
-			compatible = "qcom,coresight-tnoc", "arm,primecell";
+			compatible = "qcom,coresight-agtnoc";
 			reg = <0x0 0x111b8000 0x0 0x4200>;
 
 			clocks = <&aoss_qmp>;

-- 
2.34.1


