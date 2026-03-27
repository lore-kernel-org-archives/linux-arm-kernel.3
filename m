Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE74010BA45C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 09:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1a0vPBy9+iA/IZEcVrDWkc2KTFbkSsKnIAGvsdKzx1I=; b=D4kjFAj6eWpdmunGM6W5PagTgn
	Gz+Cjc0cj0faKMhojqyZr5qtIi0oX5ruK8aA2hlh5oNw93jIuuLbJ27d7Gvp652n7rJCJ85AW6BN2
	uP53BcK7Vlvhg5izPDAVhCGdKOyv6Iw2EJqlFJYUaPAhfEvVTLojpEBpnYMnfs3BeK8lqwndPLKNV
	rlD9T4tl2b2kn0noWkIuzrhSUrYBY6dju+sfVyeoWrC3blshrkzvorflfaYSv0YsybckrFFxQpYd9
	8SvzhEZNlr5UeW3fGhoy+9E7wIayG3aIir+YFuwN7DNpdftTrJEdvZVz8AgsR9ZBSRqIWohKLMgRP
	RJTKaQnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63d2-000000075Qx-32fh;
	Fri, 27 Mar 2026 09:37:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w63cz-000000075Q9-3LX1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 09:37:19 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vere2378956
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 09:37:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1a0vPBy9+iA/IZEcVrDWkc2KTFbkSsKnIAGvsdKzx1I=; b=CqouCsF/BSHA/4Sp
	I3lspYnwvcOJBCB9VvzvgzksbD7w1yjFOYl2dkSbNs5nwS2TN1Bp0nu6ey4FmXpY
	xSdxKWRumhwj6qDR5bHBscdPJ5oyaMDs0nd5bOlOfsTdkACBbLm5XhgirQIMhBcN
	8GqPdv3L4oY+nHQd5IlrlGYBrdCJuDiP6UQTvAa0KcBOF6K1eqKS/2JrFTT7iBYJ
	p+x4u7giiaE3IWI97MxnXC8bTzgRdDyDgyAjUCZbSvCIbGr7cHNzICZ48ByDvyfd
	C3M/v63aMdguvV7oWbSTugfAsL9qZU92gSxiKn+XHtmpHGiR/edslSk1jBxUYlsF
	C0LfcA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5jcx18tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 09:37:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb456d53a5so58235185a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 02:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774604236; x=1775209036; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1a0vPBy9+iA/IZEcVrDWkc2KTFbkSsKnIAGvsdKzx1I=;
        b=HNmfHZ+KkKX3ZEgVX+iur0mUwYWYPMoTLMmGKVKv0w/3AB6HRRak8FkRsWoE9gSGNn
         En+9H9TZ2zNY7T2cIJ0FZRhFYzwkTJpivf5IAT49BGYXWtKoMmuC9Dhvtrf4yqB6pDOW
         vRVkeHgv0W58gYY4453qZx1S98tOFIy1qu9P1PPd2b3uX4a6MWzGpLaj+wP1h1TuK3S4
         NDQdRpcPkvZBLMYXno1KXFMno5uZSZzjzC6Eh8i89xilJm2Sf1X6/9uWg3hOxIsun4Ah
         2s1/xlJ7969h99xWdMluThlWHoCGAwNbG6hkJruPQpD+bvMg5pJI4M6dvUMxNSGc0VMD
         OVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774604236; x=1775209036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1a0vPBy9+iA/IZEcVrDWkc2KTFbkSsKnIAGvsdKzx1I=;
        b=RMKoLkd0Um+KRs8zsin7kAsuUYfS82FYUe75S7oSFXSXdQjpxYsi4wK/IJcmRRjgj9
         NV1szZIfM8IegpII1EMSKTE3EMhFuQYBbWJ6JKtAtPwkHgNuMUDSH6uzFiMTMMIqRh4S
         DYxWLA4P1eDHlEPUTEVk2yz2MWyBTWifdlVLTNng+He1L8DvumhndspmdMwLNwlZzCJW
         Cv5Z5tw1L6E7sWhWo79oNgUaPWzmjjRtXIUSUhpTSsM2/wKOTvs67506EK42bEeMGZUT
         I4RefbChvauQQZx3mpC+uetRDsrs5mairPp2JeB0KGRA5csQBERz80HTe2UPBPQsEfbu
         oc8w==
X-Forwarded-Encrypted: i=1; AJvYcCW66KBgwKm5YJ+rk7sDMU4BxXtGn6H5xS0N7/T893I+gvxg/YCKb1vKa5ovHXK7XqBSPcfOvdmorrCBqTfGyQ4F@lists.infradead.org
X-Gm-Message-State: AOJu0YyCM7ABVdsuRvp7p+wjlAJ8Tz8fhCwtmw0L7hCZpcbts+PL7OsA
	Wd5qGKbWfKDwFFzlFfTWXOK6/BK6FSyk4COOGE2Qof4QVLQiEOIBytMAejM28COdeU1vcDS75T8
	ltR+58Qc0zkU2upCqPlP43Jkrr9+rkQht4hn6FW1SPVZSbJjIw7mOkWn0jSfiTaEho+5E0jHCrU
	oKqg==
X-Gm-Gg: ATEYQzwvoD3dNmZz3hlW78slqSHH6haRPo2nVm6ZDav4jLs4r5se1TTQCpggDw2PRh1
	tIdTj8k5LpkkdDBZYrSWvUiCuT0XScTRtvVCIH5lmoVjdqHnVAawM/uMBfuzP1mr03D1tHaczoo
	OLjcyk5qG0ynQkoiCAVxeXodii9b2ISlSvsRSxGBbZsmzXuNMcV0GpkRx18fhMVP5AF+CQ2fKcD
	ms6t4gvPo8Om+rPe0QC1QRe1YyTqJfJM0Pj3+6Z9qEy0ljlRkOoIpIxkryd/4WizVKbMb+EYQB1
	lWTz2EijkkWMV8CNTghsf6TVROPEoXU6mdgMpzhkQE88FH+F+gHK7JuufeRrEi/qz8ZtgLQytAU
	1t7nqmopazca5m/EUMST5h8uwoZ9M0XEKeOobNJFBbq3U6+2g0CVCjcFw0KjOpZZXW/OTU0Uqlm
	4fo4M=
X-Received: by 2002:a05:620a:444a:b0:8cd:78b6:e261 with SMTP id af79cd13be357-8d01c5f28eemr140647785a.2.1774604235999;
        Fri, 27 Mar 2026 02:37:15 -0700 (PDT)
X-Received: by 2002:a05:620a:444a:b0:8cd:78b6:e261 with SMTP id af79cd13be357-8d01c5f28eemr140645785a.2.1774604235596;
        Fri, 27 Mar 2026 02:37:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6048508sm2026149a12.13.2026.03.27.02.37.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 02:37:14 -0700 (PDT)
Message-ID: <cde5bcb8-685e-4e1d-ac61-9a216e8ab040@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:37:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: lemans-evk: enable UART0 for robot
 expansion board
To: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>, konradybcio@kernel.org,
        andersson@kernel.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260327083101.1343613-1-canfeng.zhuang@oss.qualcomm.com>
 <20260327083101.1343613-2-canfeng.zhuang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260327083101.1343613-2-canfeng.zhuang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NfTrFmD4 c=1 sm=1 tr=0 ts=69c64fcc cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=GeFP3kUyQ-hAHLItCtwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: UJbVaJkT30ToqoZBKwDt8gjXrNwboa3z
X-Proofpoint-ORIG-GUID: UJbVaJkT30ToqoZBKwDt8gjXrNwboa3z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA3MCBTYWx0ZWRfX0MhW57q00eEG
 HsMf9icWxpqa6AkbDH+NH9xreTA3dFuMshsk4Bm3rLpagwSoo56YObHEdWdCXojLNAoWJLOdGxP
 lOqzk7iVMaT/nKzCgzZ9yI+3RWn4WMm3vW2tn5hpBYP5iCdimvuuwsE4pSihzwuy1i+u41z1IGu
 im7seYpEma3cg45ke6DQvy/PUw2w7jFl0HHR/uI3slkKlYFr0IuoxoIimKc7xt8x9wUZqr8rNOV
 BBODWLVADLmrtBDU8ccRQULbTK4UN4tC1pUc0K25OeYgRytTql8XxNe37Sog2YaSzpxPidX9Xc7
 /c99uaN31huz/g2C+Q3qSokOfy8CV4GkCeKGy0cX0Iq3Rn2DWOEsu2fe8fHuyA8KzCOzqjiUbh0
 mQ7L0Zgt7E8YRMFTM/5FEOOyZwUGzyGVaBWwpry97zJCyQC1HEQUyJNwBQ3idWhiPx05Dwh/K7u
 TzDBQoaoZB01wzMr2mQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_023717_982511_89847B44 
X-CRM114-Status: GOOD (  10.75  )
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

On 3/27/26 9:31 AM, Canfeng Zhuang wrote:
> The lemans-evk mezzanine connector supports a robot expansion board that
> requires UART0, which is currently disabled. This prevents the expansion
> board from exchanging data and control commands.
> 
> Enable UART0 and assign the serial2 alias to provide stable device
> enumeration for the expansion board.
> 
> Signed-off-by: Canfeng Zhuang <canfeng.zhuang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

