Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD189EFCE39
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 19:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Jaor1i7AaHnrlCUBtuu5yj9CDGjIA3h33PiPiPYpNA=; b=OGRRRPF4YtIuYC/lQJwABTJpRo
	8avj2YJttZWdlyySl06QBajtGlwv4U2E16VbHyOOYgb1Ft6Gf+jzEHpWEqbHPMwoAmNqSPdL2ig4h
	bu38kHqVD5BV9Va955dYLPy8Jl7JVnF0TCFmt6ZaIpfTHJCbkAGCXrLOxdDMPxNHC5vhnBOGIUawg
	L/0+t/s5AS4VE7AQucGzODfAzMMYCTTlBNamxJqk1ENKs4O+jwXmUbUtsJQK0F06F8S+YGjmNWGjq
	E5d5MBq8kYCKAdVEYOCJDjLduhWqtbqzD/hUmHabnSpY0xCNeB4WO9R+iW+BOpSo9zSEC0UGF9rU2
	Hr+pcp/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrw5-00000000PB8-3zs7;
	Wed, 04 Mar 2026 19:31:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxrw3-00000000PAM-1uGD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 19:31:08 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624HHEMJ3837984
	for <linux-arm-kernel@lists.infradead.org>; Wed, 4 Mar 2026 19:31:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5Jaor1i7AaHnrlCUBtuu5yj9
	CDGjIA3h33PiPiPYpNA=; b=B6/0HCT1giHCu1qilIWaWxAGL9TVYR0aaiE8GJJv
	X3unB+slTHqqyJMag90tMNq2NMIe/X84h0BnqSD/dn47/hj9+OQIw0wcxrCP4CNK
	SpvEY06u4k3LJ5ppxCuwTAgOz+PD6aEOA7LPF+AvQu052mlH+DGwRlzwzrsSM5s/
	Jm+GZ90PNC2xXCh1NLnT106oph24aku6pZ3UHMvhYEiKecQS79i/Z68BvWqBH5Kl
	JiaKT44IB+SE4sGNDIB5hzuiR8iQmgEVpmhAk5cHW5DPgNcOa2ShChFbiyLLinoa
	M+XaMFfArLhc7y2Re8ZwPKTW0UST3hRoxKhRLRrfBQO6Ig==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0m0dh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 19:31:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70d16d5a9so4125885285a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 11:31:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772652666; x=1773257466; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5Jaor1i7AaHnrlCUBtuu5yj9CDGjIA3h33PiPiPYpNA=;
        b=cPHZaDtthlirwVi5uH/2d9UyYlrUzOvGwKARfdT0GqTK3J1kJd2GHiC0zNNZYDEpd/
         swyJAsTlCrBef2wwViwYY+qk6Glm2WF2eBcBd5kPZSIzQzy2pw8Jt6sfQPMT7fQ8VxqL
         h0cXMm9IecinfKRAa5r/b31dCbslNuQAWekpzzfo80ksvVntRx8drQ28Sb8n9S9EPEsB
         HTzEMjXblXl6Q6tt/m8M0HFJS0AOA5AkHaJ24cDO52vx8WpHo2SqOkZK8Jb5GkDNe6OI
         2uC0VYRJlq0lWbGeBeV5Y07DNsbNXpR1xTWiA7wetMk3znOEuJ5EyHZ248XfStbwGTyO
         lGRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772652666; x=1773257466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Jaor1i7AaHnrlCUBtuu5yj9CDGjIA3h33PiPiPYpNA=;
        b=wvBH+6y4xJC94/a2kKUunAKJxFSOxiDdnbhkm6wYOtLysi4y+rxj5050CMpkfiUI2t
         Q93ZamIeRGw78UmlPf9jRNXgkIwmMPx9uzSBHPg3cLZqxHlHr6bOr2NjHynWFp7H5XW3
         icSgfs+9TnG8bMluOB/B+Rf07p2+Y8trTZjwvtOsYMMkxHZovnr9mHKZMNNWH5k3lTdm
         vqkCaqZaRe18MG2PxdEBVggNlMgBbIdupWRGVX9WidyOwB0Dc//9UHandfk8SyzjohFA
         YYCQqYFqhmZr6drVszrPhCVsLe1mJQJLq8A42Bacqo0ru69Ukz2t+VtQkaNEaoZccSZm
         B49g==
X-Forwarded-Encrypted: i=1; AJvYcCUt6mdjE5hLM2BPAoSnQFaG/fgPCbkjkU7zxxRDJN3JGcb4kPvLelAADqsyU15jP54imQYumkF2ozkkc9G6GX9b@lists.infradead.org
X-Gm-Message-State: AOJu0YwD3SvO6nBJ5KKbCtEt9w2g+PrBbFv/4a/0hhYZCRaBNIRpBtQp
	C41b8rAgSBleDhAZN8lPGB0C0W/rSROMfsx+tuyfENxkP7/ApRmh0q8hh8b+zEvobAONQrJchJE
	Bs9bAxExnoRT1jwsjsxqwUIloD5PIgAl7SLjQSsZEYiGyF1jJoNvgsdDx+1aX1BwuGIMITvoA1j
	L25g==
X-Gm-Gg: ATEYQzwE64paw9ppLPLY60IqNeQtVg0DHrwlZte7ifqB0PgAPRKp69fUyWcHrwDthGy
	/O9chwZ/Mxc5P9R5BsKtgzUnZcpS8eHAWfE4q2d/4K0FBB4SSAbFEz2sg2OmG6auBwDEJAxZkw4
	c8U7C1sGyT0/a+zeF7HxhHCPoj3QhYd9pgft4b+BRVyoKMIs+tQXNNPaCkAwvgOP5nLz+yyO3fH
	gtl1VrDHXH8KSUXmXn62OA9x4OWk9mrm2qwF5AAzOylnfIbRY2V5DyoWeA/eN59/UvuYEc8fSiL
	lBdkgjadwD6Q/3a5DhFXsLyZzlMk4rBPbisaIDDr+9kunlzXcn3yiP9tPP36teUCnenMSa+2Bgr
	n0qxX8b/gAjtGSa6/Z+la9xn7q6j9
X-Received: by 2002:a05:620a:3722:b0:8c7:b5b:cea7 with SMTP id af79cd13be357-8cd5aec67d7mr408391385a.12.1772652665621;
        Wed, 04 Mar 2026 11:31:05 -0800 (PST)
X-Received: by 2002:a05:620a:3722:b0:8c7:b5b:cea7 with SMTP id af79cd13be357-8cd5aec67d7mr408386285a.12.1772652665180;
        Wed, 04 Mar 2026 11:31:05 -0800 (PST)
Received: from mai.linaro.org ([2a05:6e02:1041:c10:ee0b:246c:2dae:77b9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4851a82dac3sm43124135e9.0.2026.03.04.11.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 11:31:04 -0800 (PST)
Date: Wed, 4 Mar 2026 20:31:01 +0100
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
        "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/1] dt-bindings: timer: fsl,imxgpt: add compatible
 string fsl,imx25-epit
Message-ID: <aaiIdS0zRPBY81aE@mai.linaro.org>
References: <20260211214947.3705328-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211214947.3705328-1-Frank.Li@nxp.com>
X-Authority-Analysis: v=2.4 cv=e6wLiKp/ c=1 sm=1 tr=0 ts=69a8887a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=8AirrxEcAAAA:8
 a=VlEfjGrzG_qnfxHD3IEA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-ORIG-GUID: a_0R0kiQJPRW_5GH4ipZ4fdE_LFlHaWx
X-Proofpoint-GUID: a_0R0kiQJPRW_5GH4ipZ4fdE_LFlHaWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDE1OSBTYWx0ZWRfX1skwBFQWNuar
 k0rbslMfFWj8QepKr4GYflHZspzRt2hNrpNW1Lil6hTkEjc6G0FfhM7jAUtnFMUjnjANEcoydck
 fEw6u1tt9keyFvdIbzaGyKLrAjrZV4nx07sUQgIG/POXO69gX2wV/fcQULJD8uPTcVUzLqJpVyW
 rw+iETO1GMbUchYXpl5Fz5dJbcy6UqwdUxeZS97LwuE7jHkZz1gY+x603UitI045veTJHwnTlUp
 ARba9FDLPQ5haq+PfbXEPQhxne0y3LR02zEEhdQ0x9yutUs0NBL8mZQXdn56Ar2zgmXWklmEVmw
 Fk6B9FikbI1vC+BlakXu+T+dXTtWpuiw6LjQG9nQyXIoRqjuxBz3VcLZigQGBaGMKSyxCZ/JzEF
 Ka2XixEjKmjhLIbVqnDXFW1U+lEi7+4SI5dmbTLBNMfUUQsKvgUGT7ZLwGkX77+99MAsH8zuno1
 w7SENhOK4ze8UMs5lnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_07,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603040159
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_113107_501695_4B7BDA81 
X-CRM114-Status: GOOD (  18.43  )
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

On Wed, Feb 11, 2026 at 04:49:47PM -0500, Frank Li wrote:
> Add compatible string fsl,imx25-epit to fix below CHECK_DTBS warnings:
> arch/arm/boot/dts/nxp/imx/imx25-eukrea-mbimxsd25-baseboard-dvi-svga.dtb: /soc/bus@53f00000/timer@53f94000: failed to match any schema with compatible: ['fsl,imx25-epit']
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks

> ---
>  Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> index 9898dc7ea97be..6d41fb1203793 100644
> --- a/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> +++ b/Documentation/devicetree/bindings/timer/fsl,imxgpt.yaml
> @@ -14,6 +14,7 @@ properties:
>      oneOf:
>        - const: fsl,imx1-gpt
>        - const: fsl,imx21-gpt
> +      - const: fsl,imx25-epit
>        - items:
>            - const: fsl,imx27-gpt
>            - const: fsl,imx21-gpt
> -- 
> 2.43.0
> 

-- 

