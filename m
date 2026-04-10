Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B85D9F36BA9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 05:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dGAAQYdibmGel+J9EQRjZTfJ2zzKpoKfnhVodiCaKVM=; b=ynyE38N14tvgsm/rOzyqqTdRBn
	qJi4y5nDlia0MJ0KMWDMt6m/a8YbWr3ooD2kWiW2sJTFtA2pa1WcP2CjwuptBeXUuT5PIDwnrie5F
	J6wqG4GcRywbR7KxIDwYXZ0MAEoL2i+jjRVkY+B0Iy/4yH4aAOUDoI62wfooYAZz0CcOHnzVnCgRf
	FX9fXTKdRJCPnlfqZEilfdKxNpZPl3dhLDIHU+6WyeF5gSrZmZGy3Aus6nnpK4s4a2WI6ynHoKu7D
	lsA+NWtQLI4gRuSle9p1PHC77PVcXCk3r1cBaZUVSNQh2gK17G8ALCuqkPfMy40KWLIJdv/1/yCdA
	Ry1m3Cug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB4kS-0000000BdyW-3l4q;
	Fri, 10 Apr 2026 05:49:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB4kQ-0000000BdyB-04gY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 05:49:43 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639JFmVH1433357
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 05:49:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dGAAQYdibmGel+J9EQRjZTfJ2zzKpoKfnhVodiCaKVM=; b=fW7Yvbv3HxYGOLVw
	G2nvFRqIJSayLL1KpAL4BDQiL0UzERgrY8ZutytnpNdpckuepgm7r+NiEMjCJ9PA
	NeO5UPKcX7WlqcaghjeEnGBuscga0ehBLsGvuAkAmMtg6P/dVlkrsB6BkPepEOG8
	M2rOR5lhdtNNr7CRMBufIMdQggx+sY9e34TAqGQZeDGuK7Ld1UiHMV0BPBzNBzbg
	Yf/U3ztKrj1CS+7b7Eohk7rogzCc3jCjbui9rTkEXMWjl49fHLZhHgFd/tDeCTpD
	djs5PayfXDDKMHmhUr5Wv6LioMl5WTCXlwpB/CltScmEqVYNz556xA1GdGcg2loH
	z8L45w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckfawh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Apr 2026 05:49:40 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35842aa350fso3550648a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 22:49:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775800009; x=1776404809; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dGAAQYdibmGel+J9EQRjZTfJ2zzKpoKfnhVodiCaKVM=;
        b=dViEBSZ0UznYBcPwYe9BxXxLyxX6EcyK72TxBuGdfLdKGmFC4YjUjBBeqCTnLyg5wL
         +BQks2PEbxhxYFFxEwF9JruLM6lL4V6mkdOxnjmamQhP3GaReuSA495MSBEiwNMHeYZA
         DL/BKF97fldJ/YqEMYhiUD+ZB/93GtzhrqVaPjON7H3lKInPslflmyEAz3lza/Hj36S/
         mVjyAjUQoVdPG0f1HNCr+uqnfdCrR7lsXJ3nxmK8yvaoT8BKxuMAG/e2Jq+vCozdJqSo
         Tg0I1NkJcQGMq3ziAX45e1MxfqONuxAzDz4Ky3xVfkt4BEqwk7lZJJgYjr2d6bmoirMO
         6LSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775800009; x=1776404809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dGAAQYdibmGel+J9EQRjZTfJ2zzKpoKfnhVodiCaKVM=;
        b=d3yLJkirUe+pLfhgyIcsZ6d/xsGC4pZZ/Vb2ErFX4bhdF1F1jHLNQVNjElLH052UpX
         IsJotknfD1/qfeVe05O7Eauw6+p7yXfY0NTvepozZ3o1efwt3bv/EGcrWgFbT1ParLfT
         nHIcMQD+l5oITkKmgTeHLcPw7tzF5bNf1OMYnMlKk5r4W09an0ZRUhzO6+oA25Lg7Mer
         yjUCubpLTVcLbzwBA7D7xkOjYEqq4xMy4K3xiQ5VPiFsSf+4pCT3ONmhDOFg79HaGjWS
         V1aaVHKqL1rL8iNsHvtxY/4moyS+c6um+2DcLitkD8QgNSbaffUxVOedgPxergfPOyjC
         zbPA==
X-Forwarded-Encrypted: i=1; AJvYcCVBv/pKx7RxRIYePgXYS0ULcIOCT5/uZ185I005WA/puPvwIRjxFbebcpqGnON3ouPsB5Qnsaci6wzB6oPmlgm0@lists.infradead.org
X-Gm-Message-State: AOJu0YzQXjTYjRvc1yJSoHrQ8ORNTgTym7wY4yNhPc1q9n6A4XU5BR03
	12Ubp7mgR+Dc6CwRPVOtcuHy0yEh0u7+A12g4HLBSPkiNwA4nLhUR1urP9HjEgvxiLHqmgBcv4P
	8Mdp8tWXBqRnlgCchP6eGI2FDHtbPr+TamsmuaNMZwAL506MDjTroejYerac/HAp7muRMSWob6R
	+wew==
X-Gm-Gg: AeBDieve53M9Hp2yf4NYRwPENIeBVbxQIWtJFc8Vhup5p/TEB/QIsjtrn6xX8ZH0lGe
	fVqVrGksmDfazZQBdB5xmtDmcDwQe/rBnw/1Y6/ldbnKlf+qFveiy0Wv30F/Ws1tO6ZQrxnb1NU
	OmXn0+Z/a4HcFB2AEibv2KNMbNr+sKmWwUgYn9X/lquO5GxxP3CZxh6akbj/N6ot2LjgSJeiCf6
	o6NU/z7kfQlZ+WqjgMGacXNKt8Y8aCGHsZVIxS0k64+7BfcRV3ceF8ZiyAYK28LPmkYDRofC1tl
	dJSSGG1gIjr3W3Tn5ESbvNugujWmTuTo4ga8Yd9sXisFPi4jMZGV9C7eGoJZH5akitAhZ84Gxu2
	Gxxq6DCqzNeR8P2t9nsh6jku4oiil9sqPBZo18tkE8oF6gDCxGA==
X-Received: by 2002:a17:90b:5746:b0:35d:a861:36de with SMTP id 98e67ed59e1d1-35e42853531mr2026759a91.24.1775800008947;
        Thu, 09 Apr 2026 22:46:48 -0700 (PDT)
X-Received: by 2002:a17:90b:5746:b0:35d:a861:36de with SMTP id 98e67ed59e1d1-35e42853531mr2026730a91.24.1775800008479;
        Thu, 09 Apr 2026 22:46:48 -0700 (PDT)
Received: from [10.217.217.198] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2d4e16930sm14363155ad.36.2026.04.09.22.46.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 22:46:48 -0700 (PDT)
Message-ID: <7c244d02-ebef-4a75-b1b2-f55f8ce7c8dc@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 11:16:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] clk: qcom: videocc: Add video clock controller
 driver for Eliza
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
 <20260409-eliza_mm_cc_v2-v2-4-bc0c6dd77bc5@oss.qualcomm.com>
 <c7706c41-d855-4ed4-92c4-dca43c8f6d2a@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <c7706c41-d855-4ed4-92c4-dca43c8f6d2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d88f74 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=xLwlGchuUDJACbqrD4cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA1MSBTYWx0ZWRfX9MYw94375Hze
 32kqo0aHJYrEQCs5gB7XE79/7JQ3SjCYkewWySfcUPD5SYE2EEESPliFZaqQKE+2vwpVwWQxeEV
 TjvwkHcaEOZ31C6XzPCTUHvzHTVSJ2BCCRdi60bUa1liffre4EDUXHgcHc+nKQeQla2eq86KNes
 YhnfcLSGyHwmYUaMSP5+S+0n9SEfx0fXJX4KdP5MuV/Lr99qAA/4YN8wQ8o1/iGEveCiGz+Dxzc
 qctn0J+CjGXaES9X4iRFvnnlkXWDImrt8Ytmh3MMVsnGsmr8wiVf/E0VY6+uccB0ytdtmFh5ezl
 8Pf9JvomjiCKPO9Y4kwrpHlR6H/Wq0Z8Pu5xQEvuxFTyc+hXlJFmJdX6gxDQdmXn+tweAuNKlBv
 mdVASRJy0xlxZk5jgfUsvRW29ZcCVu43EfyRccMQHJa8ug3LBM1qCzn+EaDyShtWYmyBCkrnSQq
 OPfEszu9VW+ctVAMoJg==
X-Proofpoint-ORIG-GUID: XD9H8jd3NL1XJOMa6ecZYtxpEA5vo_x4
X-Proofpoint-GUID: XD9H8jd3NL1XJOMa6ecZYtxpEA5vo_x4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_01,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_224942_177110_47F9E3AD 
X-CRM114-Status: GOOD (  15.44  )
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



On 4/10/2026 10:18 AM, Jie Gan wrote:
>> +    depends on ARM64 || COMPILE_TEST
>> +    select CLK_GLYMUR_GCC
> 
> Hi,
> 
> My bot found a [BUG] here, please ignore it if it's a false positive issue.
> 
> CLK_ELIZA_VIDEOCC selects CLK_GLYMUR_GCC instead of CLK_ELIZA_GCC
> 
> - select CLK_GLYMUR_GCC pulls in gcc-glymur.c instead of gcc-eliza.c
> - On an Eliza system, gcc-glymur.c will never probe (no matching DTS
> node), so GCC_VIDEO_AHB_CLK from the Eliza GCC will never be available
> to videocc
> - The videocc driver's clocks = <&gcc GCC_VIDEO_AHB_CLK> will fail to
> resolve at runtime
> - The correct fix is select CLK_ELIZA_GCC, consistent with all other
> Eliza clock controllers
> 

Thanks, Jie for pointing out, will fix this.

GCC of ELIZA is already 'y' and Video driver probes as this
GCC_VIDEO_AHB_CLK is kept enabled/critical.

Please find the 'clk_summary' from device.

       bi-tcxo-div2-clk              1       1        0        19200000
  0          0     50000      Y         deviceless
no_connection_id
          video_cc_xo_clk_src        0       0        0        19200000
  0          0     50000      ?            deviceless
  no_connection_id
             video_cc_mvs0_shift_clk 0       0        0        19200000
  0          0     50000      N               deviceless
     no_connection_id
             video_cc_mvs0c_shift_clk 0       0        0        19200000
   0          0     50000      N               deviceless
      no_connection_id
          video_cc_pll0              0       0        0        576000000
  0          0     50000      N            deviceless
  no_connection_id
          video_cc_mvs0_clk_src      0       0        0        19200000
  0          0     50000      ?            deviceless
  no_connection_id
             video_cc_mvs0c_div2_div_clk_src 0       0        0
9600000     0          0     50000      Y               deviceless
               no_connection_id
                video_cc_mvs0c_clk   0       0        0        9600000
  0          0     50000      N                  deviceless
        no_connection_id
             video_cc_mvs0_div_clk_src 0       0        0        6400000
    0          0     50000      Y               deviceless
       no_connection_id
                video_cc_mvs0_clk    0       0        0        6400000
  0          0     50000      N                  deviceless
        no_connection_id
          video_cc_ahb_clk_src       0       0        0        19200000
  0          0     50000      ?            deviceless
  no_connection_id



-- 
Thanks,
Taniya Das


