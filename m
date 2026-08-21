Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EA7C5DF93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=; b=aO/pxsT0VKnCOOJf+t/r35blJL
	ALuM+5+VpLlpAcs56wd9+AVTN08TPvtAh12FJi8qt/GC8issJBw+649tgCBMPIUMr6nujMDmgeiZk
	u9RZ9B47cSkN7rsugi71WnC5WUnOg72/4xPMjvlSF2cOWQQhEmtvZOh6auBZG1cgPCkxvFs2t5Min
	MGEr2Z73u+hdGgUrQ3uPkJz68xvPGu9PxjarrOhUrzQrJIvFNX+lJdi7WFNQ6Z5cuAAFMsPBeLKX3
	GhrNlOpvrzKwmAjBWVWP1JRacLiSG0Cza4q6Og3cfhdh72DrNrsP/dFqxPGc6x0k5Ol02/V/8ejrG
	vnTmNIDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRrk-0000000Dlef-1R4H;
	Fri, 21 Aug 2026 16:13:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRps-0000000DlHU-1rWb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:11:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFm9ZV3172831
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=; b=d9XAmLb2d3tEemEY
	/SV0V+IgeXry0mDhpnxfXqW1JuUmV9keyxYmh2XiCUi7KJ1FHXQcEfrPWSo0cwv7
	3vu+37Q2Vzu5+aZnKCitDbG2XLn7Mu9tONdEPOv8C/NARtsoc6Sp5UclXYAKep+B
	Hhp/D+/Z5TpHpiBNJf58LQMV37uLM5NKNFx/PMKRAMETckK7W/JuYzELNhatVZsJ
	QSvk7ofCY16GqUI323X4Dlpeu0n34jtuj4ezj3RbQuj7L2XLxaDEy70Z1pMWB0x0
	C1kHPl7BWWggG9Fhf9PVozA/NZay7YJ/atuBya/jXZXKuwLQ+B7BlrrGvgovpYAB
	dvx+pA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gdf2dbx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:11:14 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28db3a47aso2156922b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 09:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328674; x=1787933474; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=gICt8lKA4k/NZJTXTaGphFgchBMM6Rj0fjDrzhg8qXuF6HLAQCDY8RWcv/vmkSKL0j
         58cC9IKt+547VtLbIEYHIO/FyajSAOz+d8Hc5ZaR2wbw0VpyloNSVTAKZ1w84DitZFQd
         kwGcDhi3fNROtEDllOLQkVc6IPTwgVUff2XSrxrOMuhjLjOfIAQvqaIwYtyOfhH4cDbe
         tfnjrr+Z/Xs5F5AUq0m/UEDnbwmmH9VChRrU7+UFOIT1lgrwa7THp2J2USxdH4F5xukz
         uq9PB+xL/1sJphCX/TmS1Ua0fsGi4mbus98bwKp7hchPlLqqU8tyuANIGK+9/vjCxtMc
         wcNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328674; x=1787933474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wOoRRo1BzWfxcKIRahahL37V6D+SA2lxSIowy+5sCk0=;
        b=g0Q2+5QgvD1+IHqTnJF2MjsLkrr/UUJJtOTPR2wrydpwc7lj/20uD1PlPFw5wMJ6y9
         vsu/VgJLjOuKEtTPBjidyRGfxFNNVyd4+UkcN8BygIwkkmLI0ATlsMMyM2IjR2+htFVp
         E628Te71uk9NoZJN6iaXjVBrATeXaHSxJ33OGrZDevVQvmHyf9HP2TPFS+0B8r2uMHXs
         0ZadJHPNNzP3clmGn938QTNUNjlxhfOAOtfs0EgUZ6R78WUIkK3WDVCR5zoqdq4+90Um
         7v0G4FdMoIKrJ9bRX2HCcnWh3WwQQbmHkAc0KOctd4zifHI23E+P9vSavFbyW65ju/9x
         KFtg==
X-Forwarded-Encrypted: i=1; AHgh+Ro6Jt+H5xhIDYE8ttn4DFuOGoNgce7vxgdXHhVUlvcyjmPjksd7GftxYckXwCuTzgTptrp8gbBQE/iL18hkJ+We@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8dHudwhCyhdx9C1EVYOEpacg9MEf53QvhTCf5eWZxHUfSx+DY
	gJlCwzaN1Hq5X/yv4nDyTMZPYf0rMh14qa4hw07zz8gugAEFcLpzgkACe5H9Ps8N2VvNAJOrZpJ
	EkNHO6eNVLOhzsI+3r7BepHfaBZKTq4V7H3E6sQ38HG27QhX6ynBNUqcEifRljpnwNMwFUt9Ct6
	88KQ==
X-Gm-Gg: AR+sD10OLjdU3ITWjYIDgSP+0n+uu+/56h94BejfyZ+3PJ3iAc0r/MTOdfowy3Q/k5A
	arP8BWFpujzeZjzVf6eAKuEYqYIH0EfDtowHwYkSIZyobKw0YtoT/3+7pXsQS3A1R/HVkOGZf/Q
	QyHlY+eMDrZRHbEAwFKi5Wruno2IZjhHMlbpi19luriMuSsMcgbjKG2m+IxuOMPKVcBqE24b1qz
	XQIEnMzkZXt9bApREg4fmv0GIgEF6kw8ECMERZtg6q3D3XOtQrjgL1iaGEWziXvJvkQ/A7rk4Yq
	B7BL0N+mdC77YDcNIzW4OzQMzHaXO7hwUiLm1Jyze7jE/eZidTd8xpsfYX/aahdDBag3dXuGwYR
	T8hvl3lBeMwD7tWF/xr7mkbCND2HfRDbJKav2ar9FTeErqgTFdtaRf24EzvhYnqtHrB6XxFU9on
	iAunEdO3c/oQIhnbOEMIlNNbE=
X-Received: by 2002:a05:6808:d46:b0:4a3:26e5:cc02 with SMTP id 5614622812f47-4b2ef33a94amr7457130b6e.10.1787328674368;
        Fri, 21 Aug 2026 09:11:14 -0700 (PDT)
X-Received: by 2002:a05:6808:d46:b0:4a3:26e5:cc02 with SMTP id 5614622812f47-4b2ef33a94amr7457022b6e.10.1787328673861;
        Fri, 21 Aug 2026 09:11:13 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:11:13 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:39:06 +0530
Subject: [PATCH v3 13/15] dt-bindings: firmware: qcom,scm: Document SCM on
 Kuno SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-13-196e2b306368@oss.qualcomm.com>
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
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=871;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9JHmO47xFcHiKwRcWRppqe+FIDEC/EmRY/1PhD8wx0w=;
 b=Ag3di3btT/XFPjezWsEE6sVb9FnCj3hpe8zj0J0Q0SOouAab1EOy4dpmgGa+2+2q7vu1xOsD6
 WyI4wCSjoG1D/AfPoIgDEjP9SKXjtAhxL2dv3aPIUrCAfJUfwsb3ZKm
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=CsqPtH4D c=1 sm=1 tr=0 ts=6a8878a3 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=M4Tw70yJP9P6qS8g1QAA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX99RGWIbLh1Qh
 C/QY3LO+Oe//ynHCsxRBa4Az7hz2oYl2z4R7c48vzKq12qxV4xt9G3RYWSZCP2cxyGMjipcM9GX
 ypYCACyuIh/33tQkGyo612ai4cnIBoNvRGkY3EryzubmasFFWtMN92vj4hI4/l5inzqPTdIpzdR
 AeMDzISmRvhYDhLR6x5UfqbZvXL/chXTzu1KwfrF/ZdIbGMzaDaU9mdwaKSvdtg9evoSSfXqCx+
 OqaRlLdi90Fl5Prf12HO6SL5XMEJl+R4OK+MWoHOpiUIgoV4j/0cvXkL26UJy7CoI83dDQ83xQx
 ECYYWsQGVKtcFknuUz1fCp/AaWXQ3upLZ96aoeinNataUSTzEREOE4o0EGrOwDIYhZXwmsRBTKW
 vQKSmxp97BOkbug02udo3Zv2/qurJ+z8fNzyw+NLW7Rz0/VYg8XIG5J9ck22M4SDWzMUtbeBmxQ
 B1uSIp1PSU8QPP8Hr+Q==
X-Proofpoint-ORIG-GUID: mOcbzagUPZcne8cZaFADz9R5k9Fh9fI7
X-Proofpoint-GUID: mOcbzagUPZcne8cZaFADz9R5k9Fh9fI7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX5oTn0s42nmrX
 EnMAOpxXO7XEyo6z73AB3A1qkHIqIlwTzeqaB5DG024cJnbEwKl1xUubDJVQfdcXJ6NDj/7EVGn
 jZA8tf0trZPjZW6E8dv0caJO2yPvsTs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_091139_543652_14D61104 
X-CRM114-Status: GOOD (  12.26  )
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

Document the SCM firmware interface found on the Qualcomm Kuno SoC.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 037d4ad8f718..ecee5aef65a7 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -37,6 +37,7 @@ properties:
           - qcom,scm-ipq9574
           - qcom,scm-ipq9650
           - qcom,scm-kaanapali
+          - qcom,scm-kuno
           - qcom,scm-maili
           - qcom,scm-mdm9607
           - qcom,scm-milos

-- 
2.43.0


