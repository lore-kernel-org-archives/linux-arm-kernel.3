Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49AA2C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:52:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=; b=3OGHq2qFqkzJzMJZa12SduCODJ
	1qwL0fqbPfbFQuY85TPAk0MfajxaAc6X8loxjA46Uf+7OsONAmLF2b23k35quweOSSPbxIh9rhiW8
	CFHbAFgPuZHcpsDk8+a77Tbaxkic+UkFh6fVQkCelMRVzdohEVA34HI1KUKYUUxavPqalgxKsJ6t6
	K+lEQVmU1kfl0HBHrpFE0dnIkM1EGhmG8+VuSSS6SEznFycB8gSnHwyU6la/JE99x8EcaQmFd8a3f
	JbMymPp6i7G0mywS8l8AyU7t4yLSZnearvDs4SKa5IxuSHwXctbtGlGEx0YgmGzJaO5qpaRHJmXdw
	vxsjv1PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeGN-00000004VJR-3DsJ;
	Thu, 27 Aug 2026 17:51:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeGH-00000004VGw-3XhQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:51:40 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXaut4178250
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=; b=Zu220O01n5yJNHX5
	ySNhJyILhSpvi7mx53R3ja2RAMxFAAyh0WET2xjnoMBnNZMZziK09Rnwvvsypy/o
	DCqfCeKDCb21BWS1Fknfyk6WtYfTaS6YG1+yy9nIBdlxKbnqTPteYujtBBaaAiQu
	e6x7PwmPYrQVWGuxq6gHdb4tJgrphRNfzjfH4CaPB7pPDMI0pjn3+KyyvTj204bX
	u+9y805bwL1jRuMLN801CmC7mbeWdD9D9qYbDKadhPvEZ0oXcHPdgU9esRbg4rHX
	Ovb8ABQX1r6DRL2/sgDS2GOqzLUe3K1rc/mDtIRqoaCud4eCP+UhO2g/i8/Wgl/K
	PW/qHw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gaphw11wf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:51:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso315642a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853096; x=1788457896; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=;
        b=fDx1PpR965DMax/NVwBfMZGMXwinN5BMQxWpHNaGZ6Cnw74VKrFCRV1UgJCtoab5jc
         Tl2bwnOZV0qkUa1VErlsb0ZrrFxlrWrjLet4Z5w48AnRC7Kh1/oLM791WRVY7VYlrXTM
         m5y4OX9xNPqoF+wPulBw6x4WG2SvPJfJTkzRqxDd5cJptF0XCB3y7F1U6UR67y4RpmEd
         bLXpvZQ/Js9kdL/SNY5uWelbcNnzAm0WqhEIIogzIbqglCHxDTGyHcA0W5KeRQNlnDht
         q1nAJSDgVlG2Qhumbncqg5ZPobTb8fkI2zECrJZ5GFrAqlDthiaVCRLf6DDeZcvwE8AH
         Krnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853096; x=1788457896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=;
        b=OQ6cVgkQpoh29eIfG3ZM2g9MkQI+foI+R3pmd5Aiiii/Y5Qw/ri+hu1KIaRc0nFVQD
         ieK9AkvHOvSIr3l3emlh99yGQb3c2dBnw/xfP0dh9FeOI6i1VJMzBhUX5AqcM6ADb3bb
         RuWbuLSfn66WFkVBDOvuN3zOuVTt74WychiJvXrrb51leTH+6vFZ+Tr2l94rEjITcmnv
         o9fVyc10c3uR2ZBqMcXjKVNpEKqZu6xRHsFKkzzOStAUtjikOlavw2HmmrFctxB/0aBV
         8T6bf2iAAm7MfgR1EjnDyiY0y0VZ1Zn6oQj0kyoOxr/z7aQLxf9BFdpLe1TS5fihfoF/
         x9/A==
X-Forwarded-Encrypted: i=1; AHgh+RqaiiXIo89fPmKayi1qgWoS4IQTZBQ1nnt9/9e5yS2ZRy0OCcEo31gfi78P70iBtkbLMfbQD1lQJD+zSUzd/2C+@lists.infradead.org
X-Gm-Message-State: AFuF++kDy/gNEIW1aCt8RofIxbIEUDYus2bZcq57w1HUFq4J9c6FylIf
	hgHstxV11xHa+n3V5h/ZWR8bS+x8uEnR7BCJniFugrsmjS3vph1/k7eXu9cyvGwfDJzy/L2wFdU
	sMfO8PppvTi/lgPtkuy8k32W5RE1jXb6WtMsoDdZ05oClLsREIPn5jxkphNu1xuZWXoDLEjNZHV
	iAPg==
X-Gm-Gg: AR+sD13Nwvi2/U8dw2swaX2ZlAjEIsbWFj2LccdPZSgpe5NXpnsZN61HQJTHzKExowo
	gzDcykz8IAdEQS2Uj8kYcGvOobgTU246OwED31qpdnLaZxCwOTk7tC49RNV4WVgzJyB4yqnGteP
	mjZfxFeDggm78Z1uc99AncQ+kMe8UbXvj3gSOpAhR4vyYVj/RPpQ4AJxZThTu+rgu2Fk9IJJo0z
	HHXeClfQz8FqO8OvA435rQ+ZsMVGEA8Vm8FtGm/SUyPbmxCXT/5HOlMFp/mL5wbwwwpWg6l96gb
	noL8N3EHXSJq69ag0J/fko7xvMVsjG1DgL8C6JP5ETS7ha1DchISvkzmoKYNGCh/Nam2J/DlZpc
	bycDG6v6PDAPrFko5PMG+OXQQLhQ+dovhVlOrbYx0jC1OI1gH1RPwFdIubMfNtrqcSyiN5S81MJ
	RcJkrOKUZuh981vcfjU3Q/zOU=
X-Received: by 2002:a17:90b:5443:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-396d100313fmr1670018a91.16.1787853095938;
        Thu, 27 Aug 2026 10:51:35 -0700 (PDT)
X-Received: by 2002:a17:90b:5443:b0:396:4cbf:45bc with SMTP id 98e67ed59e1d1-396d100313fmr1669920a91.16.1787853095439;
        Thu, 27 Aug 2026 10:51:35 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:51:35 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:05 +0530
Subject: [PATCH v5 02/15] dt-bindings: power: rpmpd: Document Kuno RPMh
 power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-2-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=ZHsN8zM/JbhignLDIxWKpOEJ0dJLsvtVmGGylPc0eUU=;
 b=vzpCJkMB6+PuXviINwNp3FHtz7nk5WS01Bo1zaRtxjr+lSRFC5WQzJQ1BawfNs62WmAgjGZz3
 7ciUxDb3xWuBXJwtYwyZR+4oRn74aMGz3NiBwSWu57vDqmcxYmMWTid
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-GUID: eHMMUXobG3dINiOCj7wmIpyFBCyHgFNA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXzbmYaM4rGyvY
 s6bZX7wNWYqNRHO4XoNgeVKj4oH0E5M2OhIwn8OaDm8vzS5JAFUk7OipRWIufVJxg6TJ/aP02oz
 CXwI47lB2BbyNMcgb9w7WAv6aCKwbFs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXytFySdStHBKV
 NPdhR0NLckKOVEHFk3Kwvo7WMPBIsFqlehj25NNAEBJ/v9whk0vNvFafs9M8ncJlgYE/HZ+qFKo
 WbGuys9S5/9UODSgfNhTFirfi1EYAi1q8uHkAB3E2+imjry3G8dUDE5waAkr9STs2wnPMUdfziJ
 riXu1oIX3zLmup5cQZnPCSFg6SzMDEgbOYS6W49Hnbe/eSr94tl306qaxO1XlcfgVCohZNYyGh/
 TsLvrRA2JckgoyAaHOKnBeV7eQb054et7IJ8gvGXHX0coC+wdsDRO3Yvoctsco02XLY0qOJyKZq
 4Izv7i8sIS5IafyaBY+Yxq5S7/8SjMBkhEyTu92BY/eP3sKSeX1oBnuQcObAIGkgdSRbjTczSTO
 T7Zb9Ec3sJONkNBcxU6jj04LmfxNUq5iB4FSu3kG6Mgg1c80iidKtZuDy6ecUbvClnuVwAV8eQx
 FWhGNFO6ySxLbkNuOQg==
X-Proofpoint-ORIG-GUID: eHMMUXobG3dINiOCj7wmIpyFBCyHgFNA
X-Authority-Analysis: v=2.4 cv=E8b9Y6dl c=1 sm=1 tr=0 ts=6a907928 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=lHgBgSUrZIjjmBdF2hoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105138_480732_539D8C4A 
X-CRM114-Status: GOOD (  11.92  )
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

Document the RPMh power domains for the Qualcomm Kuno SoC.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0a45e1f55062..7fc3927efa27 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -21,6 +21,7 @@ properties:
           - qcom,glymur-rpmhpd
           - qcom,hawi-rpmhpd
           - qcom,kaanapali-rpmhpd
+          - qcom,kuno-rpmhpd
           - qcom,mdm9607-rpmpd
           - qcom,milos-rpmhpd
           - qcom,msm8226-rpmpd

-- 
2.43.0


