Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24373C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 15:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUxYdITeq/FY+FFUjMdRTMxDfy5p0X/5gpQ0/qb6sDI=; b=Zgx8LqKfyH+K2Qe1/nvCXBMa6l
	XyAaocziNjh6u3H8eEsx+rxZgGO589dGf2KYOdx/BGCX2wTlR2h5OfYl5WifVFNOwpwMJRnFvi5pO
	tkWiCb4ecTGuNfZaE7T+D/cNPhRZooYS0raQoJxsTUyvIj3wK7nhBodRdLG+Y0W8NWVDlpcuM6Ldi
	mvty0uWVlIC5H3fdJ1IDqK6IQpuFlYPrqVFuVdaljELseteLaN77J9QTHG+6bI0ysE2j2+tIxZew5
	ZejnEJaZ6ms8p2OWZ3GfAj7ptRJXDahvvJIbOfrIzglwL+XRgYuGENgxvFk4AI3U+EADuHxrsnf1H
	la3wMgZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglXp-0000000CwXp-0Bno;
	Mon, 06 Jul 2026 15:47:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wglXm-0000000CwW0-2nQF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 15:47:39 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF6t2832946
	for <linux-arm-kernel@lists.infradead.org>; Mon, 6 Jul 2026 15:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HUxYdITeq/FY+FFUjMdRTMxDfy5p0X/5gpQ0/qb6sDI=; b=fb7UTHsy2qV3f//A
	xMmgKNW5GqGvhgOJ1plc98d4btdiVlUep3RLCEgrqpyl8HDfraQ7zeQEvQFQCZwd
	3iGaAqVGF5tlBr2MDqJtoXi0YpHS6wZQ0IRnJUspHODAIOQVAhhluSK9OKCgVt+l
	qhNc1+6x/qjiH6O999ghpvRwUAzqHoXEj3LTZI/sTwa9flZNqalMGpywJIZ6JbnY
	wo/ee2r0fbuEtPXzn7QdwgXRffN1SWuhwC9wDLlUUrNu7YmGfikWUL7ruFGV4gn4
	2vysvBx/px7SlWDIHDSjUSpbJq6QCgUjXm1iMMxdChlWYu+jAUelbO5raXUkRkca
	7n4+Mg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98hh4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 15:47:38 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8ec235c7c66so41840406d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 08:47:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783352857; cv=none;
        d=google.com; s=arc-20260327;
        b=lv/yPyu+uqWdmgQLHwAQmcXrbzad3du/5csh2pvgX93o6mODDu0ayfysBJv31OJjpW
         JAMySihYpGQ5/1YEZyk35gzl0YGVGpFvnCc3HH0Gv+FMGTrdx50p8epwTqsS4aVOxmOi
         DN8rWGAMLCdo50NveOFOddtukRkoq/vfCM2g+a3yl4AUCGUfW4bjRhWpXB/yyruz913u
         fK3hXiDiSVyaSh3y3a+HPzbcDbFp6uUYR6GtENQawd5uYYPjCLXR6D45kV7Oj6V9wpbi
         +w5XOMZD3nmgtLnna3iTXgV5OY5Nrs6jmLqkQd6g0f4jOWznc4TomCND2QQEFK7DzpbY
         Oyxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HUxYdITeq/FY+FFUjMdRTMxDfy5p0X/5gpQ0/qb6sDI=;
        fh=rwKbcpdMj4GT4umV5T2i637GcJUs/qFu0NVucdQiSl0=;
        b=q8UAGwam2DuofuVAf50aXL8uohIgT/Fm9MSVmM6NDng7AM1yMTWw+BtLDyeETVTklQ
         9+0duDblbXPz/10p6dLri+vf8UtfC3cVimqrNAcecKFio7N4fBaQtuU9YHAeUm8J8FA+
         ifALwOao9d6XH/XufguuyqixtjbOIs8O11TKMUEim4eRI6/6ZIdf8zrZ4BOSb2B2AUEc
         /Go7S9z5h3jSArVbiw5RSuNUIdjhOmCN+K1/OD2GRHsqKkvazVrpHr9hv9+L8irmPbwT
         FJciGMnBZR+f/VXwcVUMkkOJiLRaTBS2UALBEqVza8IeDisYkQbiZq04caaGktUrCutH
         BikQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783352857; x=1783957657; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HUxYdITeq/FY+FFUjMdRTMxDfy5p0X/5gpQ0/qb6sDI=;
        b=jlKXMalJEw2XdQe5938qBeXZsx/NU+LLkDHVIGh5krZPh7Z68QY3ol2o0qhS1bLv8Y
         L/gjhZJGLmDiioeRsrEERAD5H4c0hSfCRUGK4LL2oXorvImjloE8AKUPNnKvOerB63dC
         PoFaVAEYbA5yruBz6Uph9v+AmIPls25Vz1Qpp2d3f0LXKaZ8h4uKiZf+80h436w7gd39
         sjJLH7T0qmM5Z7EknPNM1Nw3j0dU69qFMAXvTCOuJ9sKw2v4nxiWEPSD5UEaQssXwU6w
         dgbwK89GtKRjhtZmvhdT97/l+v/+MmCo0XNg/2GpIof30fp8vTP9isC/HYyQEtzjeixZ
         vfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783352857; x=1783957657;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HUxYdITeq/FY+FFUjMdRTMxDfy5p0X/5gpQ0/qb6sDI=;
        b=qc+vDgHLGFUaPNWe4e8MagcWtDz6m2EbFnUvbHWPL0ejboIViuxpFGFG7nBa14bSZN
         jdabFn4gsrgwo12hAb7v7TZHvQ4SZ4ip2Yxr8ZovIXHqD8axsI1Tjdhg3mUgrIC+DBHY
         pkRyo+mYwud7Zvmqry+RmwrImFC4ZBSYeKs7y7kphMUvRlulQNuBkkwe++N0aScAcs8A
         cDah/m1+wFsjhxw4dfjVPzqjjqfOY8z/u2UTjRrrjjHtktdtESyJZk5yMb5mCxt4PeVa
         ogibDCoVgL3qVmv9EMQi2QGHntS1KHRQel7hIXXbBx4bdXsPUP9EtBe46wTv8RlpOmYo
         mxBg==
X-Forwarded-Encrypted: i=1; AHgh+RrPhBbqdmx54uu4oyGKLEx0ovoGFf3TcrW0PoPVK3+Ltz6AKrB/uNkfJaYqrcpSdKw3RU81XHsyCLZOLiMvq3HN@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3iZwMaxdMUiLEmCCxUFHVVziXvmYJY+sydysswFwdvjI50Z+i
	s7ESCskno5rIRBBrB3AnCa75t4XLWmmZDSfRca5ziAul8sA2nXFK+APYx63pWYf4l6pDfWF6h7v
	d/ZgwiTT4YHhWN5CuiosG7Z7OB2zDIlEvYw6H01kX2Bqp6BAzmUwAjCmLatZWoj7FT18Un3/rQu
	UYjAkVJr4MQbELumNjl6bYr3ZKy44L18cCiqaFcdiCFVHQDWoeq2Vt
X-Gm-Gg: AfdE7ck2Ks0yVzIWsI+ANBQVKp4WkOr1/z3PYV+Rmz8ORLdk/J3U1RuCcMFfKRlsDBa
	whKx7DG24HGzpKxPZ5kZyg5AXToezAC0+BvSJV2FJq7xk3iAniDBfi5k/t3ICaGaUWXvxJXcelZ
	dp1UFwSH81cx8U0IftK0cwZbFZvuF6VDhma1LaLlIFLw/d+DuwmU6IEDqqCEOnmawCz6eM
X-Received: by 2002:a05:6214:3bc7:b0:8e9:f62b:8f9c with SMTP id 6a1803df08f44-8fcb59c6085mr13170576d6.49.1783352856997;
        Mon, 06 Jul 2026 08:47:36 -0700 (PDT)
X-Received: by 2002:a05:6214:3bc7:b0:8e9:f62b:8f9c with SMTP id
 6a1803df08f44-8fcb59c6085mr13168716d6.49.1783352855484; Mon, 06 Jul 2026
 08:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260701-mt8189-mmc-dt-bindings-fix-v1-1-e75f241a275b@collabora.com>
In-Reply-To: <20260701-mt8189-mmc-dt-bindings-fix-v1-1-e75f241a275b@collabora.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 17:47:24 +0200
X-Gm-Features: AVVi8CfPNJrEYS0E8R69POW_oPeNyXt4oUaNnxJ3KUF6es4aIXlmymOTBoUEd9A
Message-ID: <CAPx+jO-vFS+p7K9unKDtPGHMNNdS0Z6YwsgtE1cv01TxFmpNmg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: mmc: mtk-sd: Document extra clocks for MT8189
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Wenbin Mei <wenbin.mei@mediatek.com>, kernel@collabora.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4bce1a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QX4gbG5DAAAA:8 a=6cAowrh06DlNpcgoBcwA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX4LMgVPuIhZZN
 YMX4wwBKCf+qu0L+V39AhL9gsLy/kAY8YbTiQFpPVzaETeqanPxgGv/a/uJGRuBSI3dBe0CTGC5
 wde40MKgVzeSztBbcoTEjrxdg6KYiQl3yskCZZwNDA733hJLOIPBRBTH84O4FkbMsSJcR2HcI+Y
 f8ikIE9euWKv6Gk1/Akfg2P6QEWPifvVrUzNH7PGayHgKdMjT9w1Xa+OGFCETAeNGC4PdbBgSsG
 JHBMVVuisdVeXLnimuX81aEG6IWkUbSo2p7gFakas0usKdXvEmXB3J4G+ZgPO5NhKwvvDca2vMJ
 yleiv/wHFRiDPzhK7Uo9I0caempcwlQrX+5Qt7yubWFoAeZAMyjR84xUSiErMO4ygsblixn6yCo
 MCbcglu0av1mJMU6L00f4DBopt6lFHFEjSpLUKGqSyd7D/7X+7uDgvipNavwAAe3n61snrRSNMO
 WTJT3kojkHsQBcnWzKg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE2MSBTYWx0ZWRfX9ooMJANYPYhN
 TzOZQxmtU3wE8qTxBPHRjcOxj8t4ZvkT1wx8BHHBOqwDsJI3Z6pLfHefEhI/Tgt2PKVfXzxqkJg
 4neF9Ff/zTwJpz7DF8nZeFRDzXlEm/k=
X-Proofpoint-GUID: f3AZ59JKc8ruyEt0l9iQV6HyYoFPQAqW
X-Proofpoint-ORIG-GUID: f3AZ59JKc8ruyEt0l9iQV6HyYoFPQAqW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_084738_702389_1BDA3B0D 
X-CRM114-Status: GOOD (  22.13  )
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

On Wed, Jul 1, 2026 at 4:44=E2=80=AFPM Louis-Alexis Eyraud
<louisalexis.eyraud@collabora.com> wrote:
>
> MT8189 SoC MMC Controller IP has 4 additional clocks.
> Describe them in the dt-bindings for this SoC.
>
> Fixes: 7514f64780a4 ("dt-bindings: mmc: mtk-sd: Add support for MT8189 So=
C")
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> The patch is based on linux-next tree (tag: next-20260630) and has
> been tested on Mediatek Genio 520-EVK (MT8371) and 720-EVK (MT8391)
> boards with board hardware enablement patch series.
>
> Additional note:
> There is currently no use of "mediatek,mt8189-mmc" compatible in
> Mediatek board devicetrees.
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 29 +++++++++++++++++=
+++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Document=
ation/devicetree/bindings/mmc/mtk-sd.yaml
> index eb3755bdfdf7..a4d032224dce 100644
> --- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> +++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
> @@ -193,7 +193,6 @@ allOf:
>              - mediatek,mt8183-mmc
>              - mediatek,mt8186-mmc
>              - mediatek,mt8188-mmc
> -            - mediatek,mt8189-mmc
>              - mediatek,mt8195-mmc
>              - mediatek,mt8196-mmc
>              - mediatek,mt8516-mmc
> @@ -348,6 +347,34 @@ allOf:
>              - const: axi_cg
>              - const: ahb_cg
>
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: mediatek,mt8189-mmc
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 6
> +          items:
> +            - description: source clock
> +            - description: HCLK which used for host
> +            - description: independent source clock gate
> +            - description: bus clock used for internal register access
> +            - description: peripheral bus clock gate
> +            - description: AXI bus clock gate
> +            - description: crypto clock used for data encrypt/decrypt (o=
ptional)
> +        clock-names:
> +          minItems: 6
> +          items:
> +            - const: source
> +            - const: hclk
> +            - const: source_cg
> +            - const: bus_clk
> +            - const: pclk_cg
> +            - const: axi_cg
> +            - const: crypto
> +
>  unevaluatedProperties: false
>
>  examples:
>
> ---
> base-commit: ba7c57499e5999aeae8dd4f954eb2600589d80aa
> change-id: 20260701-mt8189-mmc-dt-bindings-fix-18959c85d5b6
>
> Best regards,
> --
> Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
>

