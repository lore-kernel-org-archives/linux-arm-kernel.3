Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 215F7CC6B33
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 09:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ByhdOUCDCFZkR9AkmOM8OvWfYh/AqKaZyHIi7MgdSe8=; b=zcjekHE2hIT+f/sSdxneb47Iu1
	V2QFkbBC+tPkz7Trw1jvgXgmU2Byu19Bg9KULfQOuD0wrK7XI3te7EscTmkycgdEyKSJKq9LCNSO3
	VbqYtGCKQCwTi/KYIneiy1S0u9A29wJMIHmXtgF7ba7GOxLZ9JiYG67T+JynbZ2VV+RRwQz/R76QF
	9FSJeocQ94Q9Mdd2LmEm4VHQA8Nq80ZTXyRhfcaLBDWZ+6nx79eu+gO82QWkh3p63fb2TawTpTQww
	0viAsutphK/8XwQEA93eI2375gWEfIN/QOtejXW/RdPmC01PGogMbi2ifdvN05ymh0u8kougYGpDw
	rXdxVFFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHICG-0000000HMVM-091q;
	Thu, 15 Oct 2026 09:56:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIC9-0000000HMPw-1nCQ
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 15 Oct 2026 09:56:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ByhdOUCDCFZkR9AkmOM8OvWfYh/AqKaZyHIi7MgdSe8=; b=ZfqQekG7chhiJPzp9dZEc+i0jN
	Bl8s9yIKAhV3GUY8zr53fq6LIW6HY/NSu8ZdZPs630c4tLjO/nAmqLlphMYb53dcndzh1fdx+sLJe
	7FbkaV+n6hqxk75X0GA1+YcN7WfyAupBxmId14CmqO/sO2VO6oKqkkFEPuBL25/BtKbUFwAyknuqf
	vvzIuLV9T1obvLmrkKjGjElMDbRsMLGCO4bSaiV9lWmOVF9UGev8vV4Vmw8PIPfHP9RfPmnMpRy7k
	0kMIEFhIoyIJt8j1HYAEYr959Xcuwim/FZktREBYMJETJ3uK4pd7Zjfj9J61hsv55/uMbyYsbJ8GW
	/E4KRWsQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHIC6-00000000CuB-1IOV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 09:56:16 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jRIU2662617
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ByhdOUCDCFZkR9AkmOM8OvWfYh/AqKaZyHIi7MgdSe8=; b=CsMR7IJ2TunH9DgL
	cmkQ/e+JzfleuNiIjiZDoYSUvvum4ZNSBcVL5QwDjOTSdn/8x1cw0mXuOAuUbC+8
	wXSgLV5dw5AXXu2c7mNr4+olSuC9VlOY5d8fOkH890RrIuUajL+lD3EoNWjMbkf6
	NBp5eliZXpbVDi0RtSZP0oHZgHjMejfxhbVRm/BtsCVkiK8STjXd/4xnVs8t/z+3
	OKJm5JOSE/Xl7tKnMHXtwzlza6KTL088QApWEmaqfPqjIyu8i7udBDNixoAZ7/rM
	6JYNOUHXd9rF+gnmX+NbyGeT+p5GqkVwraVujCL8Oe876NYuM451GaQoQnMhzSrM
	tdQOIw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda1dw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 09:56:12 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-149e8e8ad71so5910505c88.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 02:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792058172; x=1792662972; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ByhdOUCDCFZkR9AkmOM8OvWfYh/AqKaZyHIi7MgdSe8=;
        b=NGGCm9WxkzHLJEmhJYn88fq3kpBGre+Gm38pxa4ZbrDq0YVU83HghlCUvwc8fCVxqb
         pkmyx3Owu+Ia6ThWAJnFGxX176Lm58TuRKP34COciwy2Y9teZlRfga1fFB2dLey1yrx6
         rNsAb1w+Kw3SkGi8uhFKBFrW6zj1vAz6JjCLwS0to3sObnP3JX11vtNADSeXI93Da6vD
         gBPXwp9QmOXgoxu0PbVq5Rxb3m/Ea3fzOw/6Yb/AOXmetLXnTOEWUo5o37/WBLTm8sQ5
         AxV3qn7eEzeLBk0pM6btvyPRigcs9B7LkbGj1RsuTkfiJDgvTQdZ4wu3GibgXBh0U7IB
         Re1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058172; x=1792662972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ByhdOUCDCFZkR9AkmOM8OvWfYh/AqKaZyHIi7MgdSe8=;
        b=svp9ufYGkb32T3s2A1UaWiKcudVpAqQyS+in1o5YogDJ1s3fKqbEAGQ/8iai0oj3qQ
         6rXux5rN1bGvadXGSblzd6MJL4aqOxp0NT2eDZh6G1oEn6lJpuTmf/qH6+zTjIV2kwA4
         upN+hStt05886DM640vu9EmH7eEktyw2hUQUtKvMMVEW80DDHSYqBpnfzUF4I0k7MYSz
         ZUbB9WcRjigQkX2SUznBjum8ZR7nH4lymGtIWd8VpfhSodi5lnUqiuB+vMsynN8mHqUe
         PN6DEi8ixOtWZJyNVrXVO0OJxRZ4AR2898iJ9oGBNZwlNcMp5kYLrZN09GZOHBGf9Mhv
         FbdQ==
X-Forwarded-Encrypted: i=1; AKwUvByP8EkhsfvQtP3yQbNEAOVZy5CdlrjDzvNfOYz3KXdqsbHCh5+Ayt1TZe6Ob+nCtVlYMKCRP+TJA/1F7NE3WzAo@lists.infradead.org
X-Gm-Message-State: AFq9FYKyXh55GeWBy274jhiEHUzrOCycZlQlkpmFFy/MfT9UimWSP4XU
	OxIAvIf/7m47QthxFMvks3+nd678JE065aoraekDvW4XlmnKA6H6WqtcEWdNkZ4DfQmjbljF+ff
	uIjAuQMaJFLj0lG176whpNLpqlv35oi00vS+izahPT2rrdhrf/kwJqNYrW504g4KxclD1HQLx0K
	HiOg==
X-Gm-Gg: AYBFou0nKOhukNh5+UcklPlZVn/Tf8HWr6U59igKR2FhBED58VsjRwHwV3v2qOKJHZN
	reVEU4/vExvVljcBydHslFl5kVBUJpHB9sOY6RQ3L4uj9r0MkuEUCKaQxSOKzvf9DM0/vCXH39r
	tr6Efnlux2vWDyqXEjDimT/4g9ufQdxJel20TMhsoVAxvBkNgLP/H8mQnsfQrBVFNZ3ny2OC+wG
	h5EaHHmPPrAermrVWYEuFBr4czUbNFywPXPghK6+tR8Q19vKp8iMRJnpvpQ3cIgny1YVcN8D+uN
	Cq0ERC9MJq0E/HVIJ0K7wQvY+AdVB/gxapGDyc5ZB0BujeD/3VJKYFW97YUAy7HLEt53tr5uZCQ
	QpCwML7cCXFYvsmoM/v/8jkUTClNT
X-Received: by 2002:a05:7022:7e08:b0:144:fdf0:9d91 with SMTP id a92af1059eb24-16a61695832mr34481548c88.24.1792058171762;
        Thu, 15 Oct 2026 02:56:11 -0700 (PDT)
X-Received: by 2002:a05:7022:7e08:b0:144:fdf0:9d91 with SMTP id a92af1059eb24-16a61695832mr34481502c88.24.1792058171276;
        Thu, 15 Oct 2026 02:56:11 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442ac67sm84476533c88.18.2026.10.15.02.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 02:56:10 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 15:25:23 +0530
Subject: [PATCH v2 7/9] arm64: dts: qcom: agatti: Do not mark MPM as power
 domain provider
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-b4-shikra_lpm_addition-v2-7-ac7f1a0d5638@oss.qualcomm.com>
References: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
In-Reply-To: <20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792058122; l=1132;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=uXma0x2l2wqBjoOcZzn8IVH4sZ/ICl8Q0BX6Fyj3Fn8=;
 b=DREdCntyDkJs8jeJyOQDvcGfxG3Sw6cmfGGxdznbs+Lih9GzsyrTm7LcSVxLK/FhKBY6SYkJC
 hfE3EZvvdZGBtKf6kDZOv9zVh3hAIoo3VLr7+MzMGM9+Ib3gb8Au9/S
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX5O6fruzHqeY5
 0sN/IU8dDdiDssqo7IjVXnz8T3Y6wktxkfrxS6fsu5l1Vxe1/4HDVJqZDAOllkecvariO69VnHM
 beyq+LxyEaeOiPgobkCzeDjHVhfpvmE=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad0a33c cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RDWDdWZ4iDCRx9RkWiAA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: 5LjBdUDpc0dAibcH3FiK82LurE-ZDxXu
X-Proofpoint-ORIG-GUID: 5LjBdUDpc0dAibcH3FiK82LurE-ZDxXu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOSBTYWx0ZWRfX/sQaoz3yGxmF
 +Tsc04ExTzp3wf+VDyWFJPkc9fPGLOfpIqNslnkUTCsfglHAdcJkY8Jaj2HRUOf+g2XRXjNUyRI
 oZURoz8ARJt5VN4jVgaCKNcGtDcwIXMj1wnRrmhZN88K/dsAEIRoOLzgjHXHRS6B6+Q6g2CqM66
 Lal89VSQdwaXrApIC+H74cBj8Hx/og6IGw6WtnYHv8j6b7UYrPZLKr1JAVjRxn7ykLqlNhc/VlX
 ij/edC3kPCHOMXOEF1QpuV7AR8B+DIb0ZBGoZLjZoLhp2dOjL2DmnyW+sxEm+8RxRCyLeActDpJ
 5v7uJx1jtwpMehDBGhXCDDyu7v+3FT1NmByFcvkYzFEKAIZIRgWuAKRclhFj+CEmWbP+gbfZ6e/
 f/A9BSCBb54xCelRotMCrj7cKlQBPYlQ3OiLL/eC/LBxJWFDXe2u+kRZNbFsEzX2DIxZXSF5D8z
 b5KiAVnvl68vcbj1Mvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_105614_780557_600EE1BC 
X-CRM114-Status: GOOD (  14.22  )
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

To make the MPM design more logical and avoid probe dependencies, the RPM
notification is managed by registering for CPU_PM notifications.

Remove #power-domain-cells property from MPM device.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 8a7337239b1ebe2c40d64ed670752a680085b871..05505dc3b400e923a574bc89ec9a8e7382ab803a 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -205,7 +205,6 @@ cpu_pd3: power-domain-cpu3 {
 
 		cluster_pd: power-domain-cpu-cluster {
 			#power-domain-cells = <0>;
-			power-domains = <&mpm>;
 			domain-idle-states = <&cluster_sleep>;
 		};
 	};
@@ -281,7 +280,6 @@ mpm: interrupt-controller {
 			mboxes = <&apcs_glb 1>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
-			#power-domain-cells = <0>;
 			interrupt-parent = <&intc>;
 			qcom,mpm-pin-count = <96>;
 			qcom,mpm-pin-map = <2 275>,  /* TSENS0 uplow */

-- 
2.34.1


