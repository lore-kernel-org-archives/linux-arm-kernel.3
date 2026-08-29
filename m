Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CDCC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Aug 2026 19:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FH+a3+sk3H6VaF9NIcKqUQaDhB9NJhZrunnDLN/w26A=; b=jF/RLZYv9RL+p0CipA82ALFREO
	xKGI0qD5jEvxS9vLIzNSIEM0bx3dol6Fa0GVYQDziS/AQeRiVIL48zvTAm5VnF/Cl0WaBC6i+6Tvc
	WSKF5cNNknhnh8+TGG1gAjkEJYMGJHOqvOBPenYg3puVOFBXkWuKKwm0BFt1rBjuD4ov4Cvq68ohe
	aNT4/kDEhIyUhlBLcig0qwRB1Bh9oZW9ziVvara7nyGbEQf+79ag++4G/kPs/L2zdM844kyZb4F0s
	GcAnEqjO8eIt5AEQofzdcxDNkHOh0MJfIc0zR0lfMbgnN2JF6POxVHIqPcfIzbHiww1+1z9IwUDOC
	+6pp73bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ovk-00000007Gg2-0lkD;
	Sat, 29 Aug 2026 19:41:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0Ovh-00000007Get-120v
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Aug 2026 19:41:31 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67TGx0An3454745
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FH+a3+sk3H6VaF9NIcKqUQaDhB9NJhZrunn
	DLN/w26A=; b=T1PQ4I8Q9qWQPka9RuZtZ56l7OtsU+dfZrJOz+kakN814EMO5SX
	3pxhLdUnabqyuFDX/oBlNV4KyeyKeglwYtOlx/xsN93ndMoqJE3hM6ewl3S6tZJm
	hU6T+ZelhR5/l5wWAUk0qTau3oVw/7rZAVcQaFxo1vxPpyQCD5GjAh5ovTGnSUbQ
	vwL9QL0RzxP3vB+iVeEZwru29ZzyXucOyoffr+6FlnEhjRx2rHTeNDy4Jnfx0vyN
	CgWducqyrS+mIx0IHXM3U/c7456dv9VFCgUhtHAp+OYLvHfhQmwhKwGF9+2XBY4C
	7hcrmVVvmcn9PxI2rWm9rHiIdoXZV2l7CSw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhmsnav-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 19:41:28 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52ffe24490bso13918861cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 29 Aug 2026 12:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788032488; x=1788637288; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FH+a3+sk3H6VaF9NIcKqUQaDhB9NJhZrunnDLN/w26A=;
        b=Ne1BLJrMemQHKnz6e1w/x/xTnH34ja1Y4YYmsdBhno0V6cFEwD64F06VcKc/Lb33T7
         Ahl4QVd7XFRJyDQi7uC0keKCtU8B6cLVaFM5zICnp6goRquU8GsvvQCsIX2Kw/lk0hCH
         U/bkKfZQCVhwYZmoQeTTGgLvlqH4WumTJak0MGB6rkp7dkGtclwfUQ4OixL3H+oJFaz+
         D5clMTjkmMMdVAhDYEAcrT8NJgxrp8y0/f/plYJYE4uoNv8cz/xXhju+Yfffi7V6Cju7
         Oc8amn9dn+O0XBXl0UXucgt0C6PctOumKZP9JcBCLfQ9gP8eqeBLsoDA3Gbt3KyIlc/l
         FY0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788032488; x=1788637288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FH+a3+sk3H6VaF9NIcKqUQaDhB9NJhZrunnDLN/w26A=;
        b=M4W/3OiBcqpd1Ms93YCDKZ8M//MUqgpae5EdeDTWxBu7pwzJd7LYI7fMaMhC1j/2AK
         VRtlZUGnKftMdyeoRELB/tSzbWbOoWLp6sTvWNElbt+Nfy5z2OimOt5wm2KvZ46L8aaI
         11WgH5D/aZtsudMr3o2xOyqYUccAfV005BfL7edfYCQI0f8FqTxVqW6JHGF+tl8s5i7g
         gqCjL2u55XJtFCwVYILyD3d7SrjoDGIFOCegTv4k59GwUrqbZAHNxf+DyVmMDISw4t8K
         4TKWxYO8ksg9urlgfZqXd5SPMirc5UVsL8WfUwUa22sPIanHnemJNJp0o1gI6O8dA2gn
         oA0g==
X-Forwarded-Encrypted: i=1; AHgh+Rocg7kMkQih4413+cfd3/SE/GVOxvSARiQwc47AbBsy0p1ZZYbdAPVPIjo6G2ldccpQEhWAxbUdlZZAQr/c2KkM@lists.infradead.org
X-Gm-Message-State: AFuF++ktsdFV+7yj9ZxxjarAGrphItgW7Kyl4P8mG8o5MDrjd+ZSKQne
	dzEq7m4LOpl1Xpy6j+xEMHS50y47beTmAkNJ0Wr7NJmYhVuiHQwnSshToGgHqOyvmlPRR79Xhe4
	FDo5Vahv6IbIxGe/t7k9Ifq/R0PXjrI8qj9J298ARxP/EW0kc1Yy31te3iR6uTiVtdq13LyPO5f
	r+dw==
X-Gm-Gg: AR+sD1148bkRmF0/luNeQhPo5dizGeqlccmY6VV2J6e2ZaRMbHhd5p0ERUu+ZhRXN23
	BjljmeIhAVxexCCa/QKnEODyPjibLe38i9VXogI8jU0xLf0RSUEzlliRuRPgTPqNnNOov/qjjfD
	FU+OlQWvX1LbZZoT3CpBIpWPPWWgKKsm6N7bya2DL6H7/POPX7sLno2+kYZLQLoqw2ruBI4SK6q
	5vFXhWVWVDolZGky+mHB+6ebhwEGhD14YxxpKOHY5cxw6XBqDe4eCXfJyPdKicogE4k5y8hT7WK
	6L64GUmCKAB37jEU4K0AlhmzuTvFZBOioFXR06imWz01MfIVFxRgczD1Vdgr4Q2fBpF4+gELlC+
	pE9LQZH5K+UkBkaA=
X-Received: by 2002:a05:622a:30c:b0:52f:a2c0:1451 with SMTP id d75a77b69052e-52fb93d17e4mr179442881cf.7.1788032487678;
        Sat, 29 Aug 2026 12:41:27 -0700 (PDT)
X-Received: by 2002:a05:622a:30c:b0:52f:a2c0:1451 with SMTP id d75a77b69052e-52fb93d17e4mr179442551cf.7.1788032487295;
        Sat, 29 Aug 2026 12:41:27 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49cc61cfsm255293995e9.6.2026.08.29.12.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 12:41:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: vexpress-v2p-ca5s: Replace spaces indentation with tabs
Date: Sat, 29 Aug 2026 21:41:22 +0200
Message-ID: <20260829194121.107988-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=906; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=Jwc+N+RbC/87sl8XYmsrEN6YP76o/LSd2aUUOiwIpJU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkzXhz4Lrehjos+ZwfOwcRyf+/LQ1LjTZQar3X
 ul8U8kyiBqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapM14QAKCRDBN2bmhouD
 115CD/9Z7kbeDsNcTxmBstu9LpGXU+YYsTlq0l+F1qf15cR6vnKuyEsjjeSnWb2iU4HzGAnNroH
 Xa+9iS3LmYOlQ13EfRZAtPHQGo9ZvqSRTLUC5VbEtd+SOVr4oQVyHSaXqDRyytsBazln+YcrTok
 ScUwj8pvP5B0oCuJf8mLKupkN6GhCf9l7riwYlt8YDSE0wgOtOzvY24HuklXxqjEhNyvbHP6/0N
 mWoi15+mqlg8CTeyGI1bbLPvDttwXzQXeinNuhPbfZovnhdC5nlCKirJnCyqdVpFH727c0cHZV9
 rm+6HJ5OH1U9AYvItO0iNteWLJxYcnjFx+SeFpRDvhAVl0mz2/+O1SdWNOaMA6KAcLpuqnhIhv0
 0OCtA9gpM7wc9ItWzuHDARHIYWk4Vo4iRA84Bgpjt3XKMSGQgu4qHbw5QHeaufJU6+0In+qO4bv
 LGYyvrWK4O0SHaXS/xmjwx9qRg14xb1DxCRo1s1ysPZfSiOHjdQoh+SCXPzpulS9NiSTijQW1Ug
 QGv5rpAIQtMiCkE+g4IL5lhg64XMOFKGEOEuPkPnANVlUU9Unhe5kq493biy/gWyWTxXL+gzgIr
 g22GrIUDGCgavJu8tbly6e9gLUltMzhTeFRb9hEzZv7f+fqLaO6kKXMSjQBFE3J+l+RwRO3dwMT p336Oa3emrU99KA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX6g7wZvHHMHoq
 7xF2VEk02GkA6QL8ekJOjXUxlAg61FuTgrfi/0cMd/JaTHjPkt3NL3X42it2NBrJPEnEQ2ZR2qx
 0VqAlS0q5w3hRNFFFWgbwrLa2cI2E7Y6sh8xLNSjympCnkKlk09bf5AVBdG2Rk8VcZ7g0NTZPpk
 yvKohqLO0j9Nkng30HrF9W0Y6XtmiKHwEFwyY2irl6ZeB7XApEUjDdaP78BRk/RTEAN+TtrkLmx
 MvxY/tK7caG1N2lmV2E7UNwhy02/t/MbCAQQbDT8LFya3rKkYhraxdBAwdxdbIA4crzuCyo2CM6
 kvXDakY/BFu8/jYKgPPpgXuxJv33GbXD6Ls6IAPqTGu4AsQVU1wgCF3Bith5vVrkMDhODu2DbbA
 hSfA1mTkJuXTIcybHSSnGFrNUWRe8tpeDMKR1XwpAYc74Pf/fKYe9Bq+eRN4Qi3lLA8T3D32h8+
 kiUixiT0SUgC+BXKJLw==
X-Proofpoint-ORIG-GUID: ExgXER9cfs67QOPPvFFCW1SpVChm8RSV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDE3MCBTYWx0ZWRfX3FNVq+00qyP9
 jk16gxAeHLcImrBAFFq3vArgTwYIsG167n9k+nVH+NpMis+i0nLPNsyffLD4PfdnsM73k2IjFpM
 p5ejHGcgtVG86OLxD2cNxof1K4jbdfA=
X-Proofpoint-GUID: ExgXER9cfs67QOPPvFFCW1SpVChm8RSV
X-Authority-Analysis: v=2.4 cv=bpl8wkai c=1 sm=1 tr=0 ts=6a9335e8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=JjGN2f0IYHD0VWcqIQwA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_05,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290170
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260829_124129_289911_217D4C2C 
X-CRM114-Status: GOOD (  14.57  )
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

Replace excessive spaces for aligning indentation into tabs.  This will
be reported by dt-style-check ("[mixed-indent-chars] too many space
characters in indent (more than 7)").

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts b/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
index e3896253f33e..41a98ba33e80 100644
--- a/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
+++ b/arch/arm/boot/dts/arm/vexpress-v2p-ca5s.dts
@@ -106,7 +106,7 @@ timer@2c000600 {
 
 	timer@2c000200 {
 		compatible = "arm,cortex-a5-global-timer",
-		             "arm,cortex-a9-global-timer";
+			     "arm,cortex-a9-global-timer";
 		reg = <0x2c000200 0x20>;
 		interrupts = <1 11 0x304>;
 		clocks = <&cpu_clk>;
-- 
2.53.0


