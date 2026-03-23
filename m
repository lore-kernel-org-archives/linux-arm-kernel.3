Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99882F46139
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 15:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Amel3Ki2zXNrX/7FZJwT6RM3+K8dNmrSBRyTw5oSvT0=; b=J7ef3OD+nPtNVmAUP15c3tCxvV
	+vp7YznrK/KWtV9sChla5QnYYvvxVDdaJLdeniLIWE4yMF9ku0lpJuJz6Mr/afIms/GaRhb3WihOG
	SDY8X0iel7CFAyspEoQSBEfYIuBsk+PQv7/C5nXdwoty89ZAXSmD/EiJawiL5Ix/bvW5kkDKTvGpx
	boKcYfucU8F7IhVhHxj+pMbWBbTXKTA3vKPZFfF8SuHdHjGuZAtViGMk0/7siKoEMAU/rnTvzykDw
	4gFCJ6uO9gbmSBfy0qtt8bx0uZ3r2TX4iSJH2efvHMD/T+FV5etPjoCtSogPX6zrVkTC0fXDtnHFU
	kPlgv6/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h6q-0000000H1et-3Y03;
	Mon, 23 Mar 2026 15:22:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4h6o-0000000H1dn-0pwp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 15:22:27 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NFGZ3w3476249
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Amel3Ki2zXNrX/7FZJwT6RM3+K8dNmrSBRyTw5oSvT0=; b=awUdgDUOtA9GKwW6
	epj58chBC5hgvDphFBS3cJCt0leEZW2ZTBg6+HzWewYubr3zRiiKmdCtSgb0CHlm
	zeNOT25pYTOiXzO35p8ZGm6OSdG63filyTDx8tugjgSY4AzlvvU5phViBfcIfqEl
	GmksDUY2d8vBLY3tZO30+KpVwTFG43DuHJ62+atAd7X7WZLDzi07Y5h12cg9Vbr4
	mnUALKU3zP5dZjodYaIPPY1Fg8W33MHVXYJs3O8+qrHFMrnAncRdD6uficI1VA//
	+Mh3++CmBmoaxegzL3VJVhFBv4jRYUqL7aOTvxkF77nktkY2/Pt6gmPqg5jUsZJX
	HQV6hQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d355w0qfk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 15:22:24 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94ac053469dso462347241.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 08:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774279344; x=1774884144; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Amel3Ki2zXNrX/7FZJwT6RM3+K8dNmrSBRyTw5oSvT0=;
        b=hVejTM7AK/LZ37WCLFSsSq4VrNTrhs4t+X5gWjt4EjBQvXgrf9Jk17NzNDpN0C6hTu
         EbO5ZVoo4VEZipIi61AI/6h+yg0ZIW1I5USKZDZpVUJ/Z0yKjuchgTvA5XRErdoBLK74
         9Ps+yofGM8obpy6LZE4LCc3KDCp5jzpN1AyCEfquHoac15Ye45XvGvWj8leZE/va5y8U
         YjyMDf4FZ6WXI5uulVtdRm7Tuibm2C+etTsUPqFq4poUMTpz7uPbMmBKi5eHG+0j66df
         mJOnZexdhDHfrPqKGhyJ7zH2fFnDytwOzvW4DeS93YvIePz2KCZSUQYGyIZABxxzWOuv
         lnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774279344; x=1774884144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Amel3Ki2zXNrX/7FZJwT6RM3+K8dNmrSBRyTw5oSvT0=;
        b=dqtmJDq+bTl18tk2XPU72gz1fqyIWzHhPBwEdVSg49guRynVUtRAYqFJzaFP24LsAy
         ribLeg22/rRnjbblVylibtywBkDxU2N8BrMrTV/oaB6UHPwjArpPPV6dTHbW6XbRk/ei
         N2mBtWplkkgrz2m6tpDqlkwXyUvp6jTxy1h4pF6DM7AwW5pH76omxY3JbvlIWR0cKTOm
         wucswg1bw6719Rm2dVSy0+89qZ1U5ViuU7GpeHgfq/CCoO2UhwZTj8CmHJ38v5FMxq5m
         97s1oUrJrxqBQSnT5fXSfT2WbM1pvANO7HW+e2XgiQQzEcfLgB+Vq0Njq/iOG4WlCU0s
         gURw==
X-Forwarded-Encrypted: i=1; AJvYcCXHJSAnrYyHY2krVvt9BUpVIIok8cEA42BFxbmFm+1jTEbISdP00m0g465mU3j5IzpytJvg46gCxWJnDljsL8wo@lists.infradead.org
X-Gm-Message-State: AOJu0YyCqeoS3h9rHd45pxCtzTfyqv+uzLDRstdaYMzB5guY2+WR87kZ
	YIQxsRkOz8bsdrj2E4dlGsSDFpUB38r43toZFNYtd8lBHyIMdWxxI9N6GlTIUB6vKiDRcucy9yL
	HRsTdGILpDdDxlNJwZ7ZbQCToyZNls2c9r6xGjD/jPkWAjUWGKb3eNBmb/ECtpRSGmMfIQfWpcs
	cxsg==
X-Gm-Gg: ATEYQzyZVBNrgmhZpFosL/F21ksN3f0WhF81VSkYoibmp+FM1LpLH7Cq+JpgKdcdWh7
	vpNMKqujUMapMWax6L/mIQ29EFldN3rxvtDrE/QG4dVR+NXXey1xRdeAB9p5ggTuGMipyImUhuS
	IdWJQzM03z/XgMtELdop1igbvfXxGl9VbUb52Yo0UA2FntA0quuFfdXQoVrWC8XWTdXPqN+rJJq
	24S0HMuOnE4rB06V91i0fYGyksV/nqsQUsIVd2Ll2eByz+Pk86io6Kh6PbTH6ltzzdvQTz8TC8S
	d1BlOhEiIuh4pFpf8hnEsl6v2TqmkZKSHgWw8cXYsTgZOzPmcEyGGIjE+1gLHkIjMhsfi/SDE8B
	CFPPbFivg/Kbk8Ozc3LYUfFA0MRaupLp74I2rl2vHpr+nQBYyEyFR5dSaDIVAdS9seIT2KR8GVR
	Z1xtM=
X-Received: by 2002:a05:6102:74c:b0:5ff:c831:b98b with SMTP id ada2fe7eead31-602aea86467mr2333030137.2.1774279344375;
        Mon, 23 Mar 2026 08:22:24 -0700 (PDT)
X-Received: by 2002:a05:6102:74c:b0:5ff:c831:b98b with SMTP id ada2fe7eead31-602aea86467mr2332997137.2.1774279343875;
        Mon, 23 Mar 2026 08:22:23 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66a281b6fb0sm86875a12.19.2026.03.23.08.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 08:22:22 -0700 (PDT)
Message-ID: <2e13c91a-6d87-4c2b-8a98-0b58f97023ed@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 16:22:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/5] arm64: dts: qcom: talos-evk-camera: Add DT overlay
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260305-sm6150_evk-v6-0-38ce4360d5e0@oss.qualcomm.com>
 <20260305-sm6150_evk-v6-5-38ce4360d5e0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260305-sm6150_evk-v6-5-38ce4360d5e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=fq7RpV4f c=1 sm=1 tr=0 ts=69c15ab1 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=hKTp4ChWe8y635cLtM8A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cgGY6gfswUpnrFx7fAyXUvtu4pnbhdmE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDExOCBTYWx0ZWRfX8hwxaiHn1+ON
 Tr7JiZqdn8oFDSwGZfw0N776pQLhlEepXrC0zfH8SvnUqmPN2zToGJfMdtOCS2kWBSoBcPgTNFf
 3lV4KPhcY/A1Lck2fW1THrysGldJ0UNqf9xawr6xY8h44on6ccaY3iKnNXT3eXZw/Cz8hv3HuqC
 O9Mxdx3drN0mSRR1bSHW3Vg2qij5uMFziWwf2koR9WmDFbi6yB2N6pxwq35HSirM+4YiAiBP8CH
 XEDwLsLgrQsRx9eOWOT2+dAO+GoLGED/Mn0cHQP5YjCNDiN4wIeZgnYoa3MhWEHk8Uh0Zpl68GA
 KfJeGSMUWV6jb0NeS2sTCeAB4p72pXwDKN0oDIRvBESFR/uD/0QlCcbeSDP507/SGQ02B4WTuR0
 rLpEibhrmjmLo25XmGnjACcb+VY5kRKytgjcCI7PSRqefHeTdWk7oasfnWcHNrFMX8WOykTipL6
 e3TTDVJP3+PpHGVoSqA==
X-Proofpoint-GUID: cgGY6gfswUpnrFx7fAyXUvtu4pnbhdmE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_04,2026-03-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_082226_359530_AEB02D63 
X-CRM114-Status: GOOD (  11.28  )
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

On 3/5/26 10:48 AM, Wenmeng Liu wrote:
> Enable IMX577 via CCI on Talos EVK Core Kit.
> 
> The Talos EVK board does not include a camera sensor
> by default. This DTSO has enabled the Arducam 12.3MP
> IMX577 Mini Camera Module on the CSI-1 interface.
> CSI-1 interface using mclk2 as the MCLK source on this board.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

