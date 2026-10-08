Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A286CA600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 06:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=; b=ZlVhol3y9OGKwSKuQv78ZYW22b
	WDXLO2gedcH9YESKOnPLj+HR9b/LvSzmu0hMAmjD85AYNWFnEg72dii8WQjoOIdAMBFzzVtCBmWcI
	gH0UY9jYlUztiMUPQEY39ITZDgTAd1qyI4D46LF5SvxAjn7eP+1As8g/I1RqGvUuICY3Y5JN0sbJ+
	H1ldhKH5qrSo7PCcLUhVJ/0hjm40M5eHJDvFgnLF5VpKl8/EvZlUokQljvTYQ99YapAbh0C5iHozi
	9aZiG2iL8OHTsacs64SOArfVhrQ+CENIldjQ02t9oh9540Fgkp8nEuyOvpAu0EWdaVs6DAVz5hT7b
	6s8JwA6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhvW-00000003fOg-0vVv;
	Thu, 08 Oct 2026 06:48:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEhvT-00000003fMb-1k3G
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 06:48:24 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BntH1752716
	for <linux-arm-kernel@lists.infradead.org>; Thu, 8 Oct 2026 06:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=; b=JkJ22DvO8oYEI9db
	0B+z8dGhLGpInzRKRkSHIF3hcNwLqKjhtfCw0Gwqv/4bnorvEkS5gWqqjNOKXeAD
	MredqkqKwcSXc1hmp2jqMTkRRB8WQkw4a4S5RgUY4M14LTqXBzvh3m1eUiKNIO5r
	hkR51OaFpAq9qp8x1pHtcIG+Ovl5mKpyyUllWCLvkQoHtAWihXTBh2AvaChmBjDx
	p2tj4mrZ+n5p9eHgtk+dtFhTa1F4rQ4johJyQPKrkcw6TAPBKsXgmbWJGvw0b24n
	fQw/FZm4WTb6Owbdr+wXkdSFGY67GNwih5WGiumbkPjynC0ALe8Z+XFVzf9WPlcO
	uhslNQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe2sn6f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 06:48:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd0869f3578so1423917a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 23:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442101; x=1792046901; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=;
        b=kBTf746w4xs9DFpsTey1BQgA2xHlsbkFpEjsk7akjfYhg7F3y1tFCDPxvPIdP0LyPx
         fl/J4WIqjzBalqFl0WEbsTi0gJ8yR3XIcMZPNhdHdMo0/7LaPHg8S6zkjAwPNJA2VQqX
         yvgSKZNd0d1dV6Ue7EnzGyH7KD6UaL5ajixhfABR6Yp/JEfU1Oi43yW2Z2+3PtQFTiLX
         MflKuMPKpE4hTs7B8rw+bPJCxncmiN0Z1hUirxFA4ylWstre1ZC2IniXSSrQOiFAZkI8
         +FMMdW7VSS2Vk8wg9qU5gyx4H4YjtDYV+sRFAPwV6Ap1ns3WMD9ZWfe45xuqRoDJiWrn
         a3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442101; x=1792046901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IoNgOi7Gt/NIz8sa1CP6cy/ZIgCot/UywicQ+D+OG20=;
        b=E7S5PTQpqcAAot3BFrd94vdwjF+XLk1vqMlMyOi5EOzmqsVjKAsmO9PrevFkoJ4swN
         V73AAWJtfut/RxIo0a6At9RhGrcTmCb4LgOFrr50hvMhT3Cq8tqHbJNhGKz4aXyNp4Mg
         K7vGH05hPkfPbs6FQbv69BLzqPS0aaMqnQkNSvmfyjQFciuxX2Wl7hHBW/ivmTwTS4LC
         F9N5CY6tkLYzIah1fpXMsNGUckQzox1DP8bjqDhW6jGzd+yXX+hUvnp97f31p4jjRXjk
         TRMo4qERYG3CQmdMKlNC54rSveoMZHc4IcDqQOwhvwVcoRDlqgS3QMeJw2DI6z3QndyB
         La+A==
X-Forwarded-Encrypted: i=1; AKwUvBxm+s5HAK1Y/WPY8wug3d4C1xnNn90Ugz1/ADlX5LOnv+jip/sg6oL5/gXQ7IQLDDE86Q/vmR/ve1StNMhoC2uv@lists.infradead.org
X-Gm-Message-State: AFq9FYKKHdATZf9OzJ59x0f1mdGn/wqqpcDenFBBmtR6Fqy5E95825jv
	BmPLpGOFBGAbMVlmqAAxvtfIvvF4ZzKwJb5/5PjO1DF/cnTpxgsZSTKyYFXs08/u8CzHmBtkQNx
	R9mSmYH52XCU4kMnYjW10XgyLzUKF5uAtY/ujE8gxufWgFpHQ02jAdvo2b3ULkLadSyzEuPChgU
	S/Rw==
X-Gm-Gg: AYBFou3ZXa0Kep163Xy1F6PA9MtgObme5tfnq23jUC8TQ5yiSDFPg6sWVgdFfTFxTZB
	kpdcz7CqC4dIEQy+Yin9u6HB+dfNxrHK1UA6uZ8ZuOdSQ7Usw28SQpYgRnI/RcK3rvqcnR2tFKw
	0wil+Fd6qbLXULQaWfeI/jnvLJ52jtcXFJ8i6C1N4FwfIShAVhqOzP7lg96NYmfRNjzJPgv7tQh
	ctSpLwO/SqIGvdbyslnsKInuFEeyrTxDMSWsfHNFODBa4/XsCcNrGYpuXosNOnzgAjXSKymwCOQ
	eO0RkVBYYXlCbsy3RB9aLTGfzxwRaRbKaDJa+GhlilDDAALXPqGgLF+HrKcCPxbyTUT/SB5WxPl
	DLzPOplp87FagLseB/J+8gBxHWEa44OPqoQ82bzflpevc9wRqY+o0U/A=
X-Received: by 2002:a17:90b:46:b0:3ab:4f1:4f70 with SMTP id 98e67ed59e1d1-3ab04f14feemr612838a91.49.1791442101185;
        Wed, 07 Oct 2026 23:48:21 -0700 (PDT)
X-Received: by 2002:a17:90b:46:b0:3ab:4f1:4f70 with SMTP id 98e67ed59e1d1-3ab04f14feemr612810a91.49.1791442100559;
        Wed, 07 Oct 2026 23:48:20 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:48:20 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:17 +0800
Subject: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC nodes
 for the L2 caches
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442027; l=2861;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=4J037iW0jgNFIUaDdHihz/OvwcIdw7V7vHWLk2241fU=;
 b=jIgf60idSKurGrTwCMA9BKGAUgriAqwNO8PbOAveqoTDDZq6G4MsKu4HZfnyczcUiu9e6p/BR
 wz4yxrP/o4uAotz7CeHcNhJZpBpJj0web8KHZ7xhaaTIlilAP1GYCON
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Authority-Analysis: v=2.4 cv=AbMkjHXG c=1 sm=1 tr=0 ts=6ac73cb6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ODdVmvVKQohEaym1G8sA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: V3dEPoaLgvJFaCMxmUKHuBYAvhhuL3O9
X-Proofpoint-ORIG-GUID: V3dEPoaLgvJFaCMxmUKHuBYAvhhuL3O9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXxFgaGvcVnO/R
 Aqyl2qZedhwVr5oGCIfq8oLDtNgExvGec8P0Zf7UUIjP7BEPrROdvYdYoJgnmrXw2cKwRys/O/N
 iQMjtRVN7q5BTfqbmXMLw4eMDAUT5lA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXy7w1fSAVAUcn
 RVZcPmlqrUmBwDswzVH1kekSnJ6hu+izSESilptLK1obUwv2I4MgSUk1USaKlRm0XhH2jLRv1mS
 /WyFKFDiAK5XkeFznNHWnKCtHgvoOSlYI9d68rLl//p8MlRqQXJUrgr8/kE5DrH9dcjUUx0J2kj
 7oBoGdxfTUP1qHvvpHyvfJ77Nig9wbjsSPN5NJpyl4mmwXKSZgam83WLBt4wrhJB4HoXuLXza8Q
 81lgelSmFdM0LyVSkqPTiOyZTajByP0E3JuzaEXb5nrP1mehddtuiakDDuiB11Y1FR7kq/GK0GV
 bVm/Nx7lbuQxwNtlT2m/0b94ZK0OyQvYRbY36zeEtZkb7EqAfOwEUmn2G4TjJKEhQ0gAK+xXYHL
 5f84jvR0JUjWKLEJ5cQ/VwEZTYh8g1Qot3QwgePKGtZK1cO6CAPkSRXSbvGIgpPeyIL8AMNILD3
 Z7Ygzds1djmrjLtSsmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_234823_590334_A3D28AE7 
X-CRM114-Status: GOOD (  15.26  )
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

Add an MPAM MSC device node for each L2 cache. Each MSC is nested
directly under its L2 cache node so that the cache node is the MSC's
parent device and its CPU affinity is derived from that cache.

The L2 cache nodes are placed directly under the root node. The root is
the root of the physical address space, so each cache node only needs an
identity 'ranges' property for its nested MSC's 'reg' to be resolved to
a physical address. The two caches use distinct node names (l2-cache-0
and l2-cache-1) since a cache node has no MMIO unit-address of its own.

The nodes are disabled by default. Production firmware does not expose
MSC register access to the OS, so these nodes can only be enabled on a
local test setup where firmware permits direct MMIO access to the MSCs.
This DTS is therefore only an example for other platform DT authors and
is not intended to be merged.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 131fd2a16c54..b1dcb1e9c570 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -48,12 +48,6 @@ cpu0: cpu@0 {
 			power-domains = <&cpu_pd0>, <&scmi_perf 0>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_0: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu1: cpu@100 {
@@ -120,12 +114,6 @@ cpu6: cpu@10000 {
 			power-domains = <&cpu_pd6>, <&scmi_perf 1>;
 			power-domain-names = "psci", "perf";
 			#cooling-cells = <2>;
-
-			l2_1: l2-cache {
-				compatible = "cache";
-				cache-level = <2>;
-				cache-unified;
-			};
 		};
 
 		cpu7: cpu@10100 {
@@ -531,6 +519,44 @@ soccp_smp2p_in: slave-kernel {
 		};
 	};
 
+	l2_0: l2-cache-0 {
+		compatible = "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		ranges;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		msc@19870000 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x19870000 0x0 0x10000>;
+			arm,not-ready-us = <1>;
+			status = "disabled";
+		};
+
+	};
+
+	l2_1: l2-cache-1 {
+		compatible = "cache";
+		cache-level = <2>;
+		cache-unified;
+		cache-size = <0xc00000>;
+		ranges;
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		msc@1a870000 {
+			compatible = "arm,mpam-msc";
+			reg = <0x0 0x1a870000 0x0 0x10000>;
+			arm,not-ready-us = <1>;
+			status = "disabled";
+		};
+
+	};
+
 	soc: soc@0 {
 		compatible = "simple-bus";
 

-- 
2.34.1


