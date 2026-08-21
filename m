Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3785DC5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=; b=zH97U76gpEyNz/GufXKjRednMf
	l0IN8nRG14IPiRpUnRxbynvqWl834kxINbMdjprmeM+IQoCS19LmwQo4FBDZJmNJnWvA82D1xV9H8
	MTLGffRjRmavRm/DdCjmERHk5nbtu1eZAg2HGoz7xDNJOCOvYKhrCIjQCmI0g9Yduu8VIhT8Gycdj
	ZXy21xL6gJptIaKzp1Sg97YouSCw6TjHgiaoz7+aEwhwDvm2QNS57kpSyI09xI8lMiKZAgcRwTcT9
	1l850+k29ROik0pQETCpr0hi5AFdxkiNUeyCl32gSa/fZDQHconMawj+1Jh147inO3nEQNcsoUWM/
	zYvTfXJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRoE-0000000Dktt-033w;
	Fri, 21 Aug 2026 16:09:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRoB-0000000DksV-1vMZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:09:32 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmJD92416649
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=; b=FbSuQsMA9sGD9voT
	5IaGH3EiIi/OTZuLG8vKc9zA4Z3DaeBixdMWvdfTUEKqdd3PBGdpFpoyXc8qweAf
	j1E1tKFeNxV7yiIAAKb8aJY5yynFbmyqh8/hAD8mIhg8e/ECvma5Xi0+b9IMCuwr
	MoMfkp6t8zUU6ZjglAnWs/EWYaoGV9vuc94oO8z7nCIq3q+SxzwgoTso+ZQidL1Q
	ghSVox4FohOz3TE5pUoJQpUMWIPHBcXembkdVC9J9z80zg/np0ucA31A5iJa2yRJ
	mX9BcyO0fqbNpifGjlGE0UydBnMgXaQsFzb0+eD9AjB05Cl6bgwj+zxj9juCHPop
	nz8DcQ==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fue2g4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:09:30 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b2d1eb484aso1939787b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 09:09:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328570; x=1787933370; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=;
        b=a0crm9bhXgf3Mjuswq7CsEjPEBUbCzKPoCikESQanmUtHG1aLuNqPa6iP69+XmHcXq
         NCtUmQ50K5+GY8zjcYYVsYw00vZExceUvgO4KfrgjYK8rURJPU3ZOBzG+86+BYEu7Op9
         5mq7dwKdVw+dNLaEL8wNjlY12dn+FXvNVZRkMoy1U1pZkAF862w9SgmHZ6xZpjodSAwr
         EGIWrAWbENZNxNi6Uf5pbe3fqORmgnvuv785zND0Rj/8PptUwucqsbDKCpKvV7XoSqJV
         jIbQ2dCoWQk0SaHfKXqQe8EVWqbZK8SiTMCq49aV6Mq/V95fK+ppknCGuAILwC7CC/FC
         ya2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328570; x=1787933370;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tKKYzTTyUQNx49FteOTvUbeUFOC22ARPMGkTLmOUYjE=;
        b=RzyZm3odWawGUSVmmI+LaEC2gJKCBBpfP/OTxl/8Ugt1hrOu1iJSkIU1Nzh+eAFeNY
         wBWap+92vrSnQ7NZiYU6TSloec+HGiSO7sRcYWh+Aliikbbe7uZZFr3524csdCqGpdAz
         jsdi6XxAboDTqraaN9biq7qW9o1NFZIJ5Irw5q9rtvEigPb6Y+QMPjFWaEqFCZM36Yzc
         J+P075qmr+DrKFMtem9B2mWuNfI/gBXAiw7C1hiqbvFdwzLVmwtq9AeZ0E1tEpq9T1Aa
         0z+YBk991HCU6UOXnc8CBiA0gGUSCWXqNL3nUIJiMgHHLE9CIke5vAVhxcYOiaaql9nc
         IgCg==
X-Forwarded-Encrypted: i=1; AHgh+Roi5O9IR07SLsy0rgz97jr6k3bcd+aAMWgz0w2FgvwVC9xvfa9NfwSh+1d4YazZdl9QXAGncS7rctNekP0HDtd6@lists.infradead.org
X-Gm-Message-State: AOJu0YwANWtjincBtRwS8O3Oroa3EiqfMcAXUgXmEaFr5ODI9OsMuK9K
	HaVYcXomt8bPMFVpEOIzdeJh7FmgUNE1X5N4bz/cZ04rtMcvTUf/7IXva2Ntc0m6aHuf67GPYMF
	iKJmxaNEF0ex3+KW4iwuoibg5aU2Y2kHiyF3hxnMTzEYfi2WUoObtxLBMcPdk1g8ct7qPRxgfTU
	DNIg==
X-Gm-Gg: AR+sD1277xJw2AAHnrfJA3hlZUSJhwj5Ks4onLC+HnorAy3MZCk53a0yYJqgrw8imU0
	XmqopEycNWpCIDWsgeu0jRJFYM9067r8jN3GRMRZG27Sl6wl6W1uNee8ugTg+NObVyKiHl56jtc
	p9BdHpYXSDGkxvjKAi+M4Uvfjb2pg436ITkWaFJQ6v16v93ArQGfAUfk8IyKnWsv4oW/Vm7f3qN
	YqLtKENTa7jI93Xfkh9vfI+2/0Fm1xontxePU0EJ5+S+C367ONPMtCqMwbKOhcGjfAxf1/DmBE8
	hdtc1I+9P874AyYfRMyZA0yaMjgX5eyfpzoXOT+8M8SFaa6FKGb3+H1EwhaKG3WjhoA3cP7E8HI
	mZxBncT5t4L69ru3XjOE5AfjNy5Drkh8x34FvKGdR+P7pAwvl9VTIVyZCs8ELMQE07SeT5Owmd+
	Bg/GJ0kmqhsXsEbAb+tmWfjx4=
X-Received: by 2002:a05:6808:192a:b0:4b2:8e51:91fb with SMTP id 5614622812f47-4b2ef38cbe8mr7352841b6e.16.1787328569764;
        Fri, 21 Aug 2026 09:09:29 -0700 (PDT)
X-Received: by 2002:a05:6808:192a:b0:4b2:8e51:91fb with SMTP id 5614622812f47-4b2ef38cbe8mr7352770b6e.16.1787328569363;
        Fri, 21 Aug 2026 09:09:29 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:28 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:38:55 +0530
Subject: [PATCH v3 02/15] dt-bindings: power: rpmpd: Document Kuno RPMh
 power domains
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-2-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=ZHsN8zM/JbhignLDIxWKpOEJ0dJLsvtVmGGylPc0eUU=;
 b=ZQq6hRuOT3Sv/p7Iga2o5Z4xvQ9K+e6HZ+qa9CVj+pK4W5CH8S/NVmAjuwyych0jxhamOfo9l
 Js/JNZDemsPAg1fxECd3OG7G21mKItHm9LrkYx7HK9DBgMn6nY1ZEKT
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXzIYi3fNH/0Lm
 NfqVBeuUD3SKHbUTvP71/nzO4qA6/uAvV6n+JrwCR8oJSDd2DBEGbkxnD4ZTp/wQfElQxQssoqm
 9kUVBiY3t61U09T0TPUd6kECsbKQmRE=
X-Authority-Analysis: v=2.4 cv=U9+iy+ru c=1 sm=1 tr=0 ts=6a88783a cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=lHgBgSUrZIjjmBdF2hoA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: cuKrrsa9zA6hLhWQuX2ofxJtzp4awyE_
X-Proofpoint-ORIG-GUID: cuKrrsa9zA6hLhWQuX2ofxJtzp4awyE_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX7BGzRrr7qMcp
 /h6/L2NxtxUGWdW5Om1g6tVvzGeAppUoAVPSeCZsNO+8s0MuE0Z10eLRSA8nXFhS3eTHqZ7CFFn
 aApi8p1YFGfzsAA5qLKOJn9famdlldNtfC4TDvxQpdfmHTrHsiuuvDw6Jdgr6lIGqC9ya8g/657
 oPiL1pmFamZy0yAX4/jry8PkQ+taKJspcVOw7sKHmfQVuARF9fEYxUpm2PKe7ZgXlaeKfuXQwpf
 NngvZvepC8WFKxMOeUn/JvTLmc9ksJciY5ENCGCAXJUHEr/ZzKLenATE1aAY4WYNj+7r1ToA/wc
 qpOt2oPMcCZm4SNhwl5Nx4lD0vBIWqxpoxEBiGCamVw5YzxUfXX7QT21bYaCEuMJITGTJnD8eRd
 yXZ/r1SanX4FgSWC0mXyOW3NKvbVhTwlJOh9JyB/NF9gyb4fVZZFHApHMKQcSLWuyMbETWIebbu
 za+rI4nnbEiuSa/YaMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_090931_655597_5C084C2F 
X-CRM114-Status: GOOD (  12.48  )
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


