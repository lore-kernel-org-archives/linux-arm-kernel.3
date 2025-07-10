Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8655EC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 18:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+vQ+6ordS2MREHUlH+sOv1F4IpVKnvygDpjQPI9SC08=; b=fnA4s6vW2Sz5RHLGKvCmOsHcbA
	8jK4kE0zbN7Wo7H3RUV+uvwiK6kQKXG7i6Txbp2ieX7m/Z+85a1HjFGPtn80FdJ5MKU1kcxla25VQ
	HQAHwf+NabFpW23L8S0ekNMoCVGr1GWtITMKVNKXC/CqF3+zLIXrCycLmvmltsLwjKtg5l5KXJAb+
	nlWymJqhvWomEvNdK21Z0JEb3jRR6TQwhCSQuf0W7ju/0g7/rXW+asO6WuJUJQ4lmxtE1bbqnsa9u
	70s0pwfRL2LcNUTVueOp+TmErOKbIYBnq9PDTRHMZtqr32nKXHH+DDk4x/+xmJ4GhNU7d2SBL0lp6
	8IliiP1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZwNK-0000000CkPz-3eFP;
	Thu, 10 Jul 2025 18:52:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtph-0000000CMXM-1oeY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 16:09:14 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56ADRNOY023864
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 16:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+vQ+6ordS2MREHUlH+sOv1F4IpVKnvygDpjQPI9SC08=; b=CmTGLJWINImAHKoL
	C3DmEyyOHxwXFEHYDYwh9nNs9+qHt9oDnwlEHteC1OnCI6yisLYB4/ucmnYvvLrj
	9Gnq6RF4WjuDnhLew1VVzZh/snqX6sLbsFTDtDT88C0KSOr4Jr9wcZPL9Eg85AL0
	Kx45dAtjgRyOnaoGdJSd7P5kZQCjABqt56jZujpaGtfIVeGs0RuMBAUfcJSAXwyS
	vz75sSrZHISd4DCZLQUP/EVxIiXZYB3tRoFHAQTFkBZMnonxyXEwXKUUMo0Yke+A
	gy9X7lG2p3TUYGL40TOiN0KoHtT2U+B6nJ8XwMK+HwSgGGmHgEC7eAMpNCw7vVSq
	VAOVAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47t83u1uup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 16:09:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d3eeb07a05so12279285a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Jul 2025 09:09:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163751; x=1752768551;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vQ+6ordS2MREHUlH+sOv1F4IpVKnvygDpjQPI9SC08=;
        b=iypL6O38ORsbWkJIYKDsiB4iTqNcYqInj/ZPc24e8ZNm4N3H8W9IJqC8ouuzv0UE9j
         SU9q6J1DgceOf7/pSljP1I/o/uTEtZFKGdRUMs2bFhoGcz0YJ/Gy+O8H+ZI5OWz93fVY
         uuuFGFNHbekhyaJbbL5PHXjRar3Lqcjdd+e0DnlS4+cN04IfWW+moNKWltH0tVYxyY2X
         2gyxdPqA/+ZiJuFsDdpk5/COn12DQ8jA6/xGThxj3bT7pt52i06P3RKCjLEqEJF9/H3x
         EE0xQCa73zE+JCLd7YaEXrkTVM+4eoaVfIxv+PVjGM+AcJZAh7MoSap7uL0/YtJwgVsZ
         kGEA==
X-Forwarded-Encrypted: i=1; AJvYcCVs0PQNkejd+OwfqxxtD8owpKiXfBlrNppRAOTIRdcUNt7i8TY//hsihPV55o0f+KJeGDcqz9pMXqqYV+ssmyBN@lists.infradead.org
X-Gm-Message-State: AOJu0YxxUNanxXEobcGfTOcA85tRMejRyFjac7Q9zRGM2VElpHxA/WB6
	YiPQHIMDd7E/VSF/MsXW2oMLNQpjQbqyOZEDsEq5bPIXSsBBxftSK6ZKHhlR82Wp9tiTM1baw9T
	gJrn8vQvgIic6TTyM1E0i63S5y2XwbK88FMsiOqorxFAbORFaTvW7Ex4HifXULs79vRZqzuxXOw
	ewnEBn9FEcwQ==
X-Gm-Gg: ASbGncvOavwAZbVqd9Ikzn/+FymvlgRdQKQqPmwBsbansxgoXRx7odrbXKOePlQTFp7
	ay5RKKRdGBu1oPCD8kSAGnmlknqcu/uff5tlxlYkPqPqIkgNYsBeMUwJngWwDI3VmXr2NedOjp7
	/d0S7hVJDujVnmRpM5xWLN+KSZEEXVCXk6HjKhWPB2NAmS2JJTd66f81FV+u3SAYSlGTspErsEH
	mbQruq8wmQMiNBeHkDKJMq4LzUS0fx7VqMlVsVNdHrzYf/UIlHKwIMtjne8K+BvHtK1n38nJL8k
	YFbE6UblWRcTucWuKrcwnoYiVX70u1dmuP8Duyh/dQmQa7ORK3capUogwpbYYuz3AWuWsjccF8X
	y/ew=
X-Received: by 2002:a05:620a:4726:b0:7d9:d722:7678 with SMTP id af79cd13be357-7dde82dd8e5mr7282685a.0.1752163750878;
        Thu, 10 Jul 2025 09:09:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAeeRzlvLfbUeyU2SSOBFEfwuLO+KS9f2E54G98Fl8PmYU4woiYSJtTIHX8QfSQxlGnb4YxQ==
X-Received: by 2002:a05:620a:4726:b0:7d9:d722:7678 with SMTP id af79cd13be357-7dde82dd8e5mr7279685a.0.1752163750275;
        Thu, 10 Jul 2025 09:09:10 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e7e91d10sm153830666b.5.2025.07.10.09.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 09:09:09 -0700 (PDT)
Message-ID: <c321ed9f-7906-4a92-9202-efb46343ee91@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 18:09:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] sound: soc: qcom: qdsp6: q6dsp-lpass-clocks: convert
 from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Olivier Moysan <olivier.moysan@foss.st.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <20250710-sound-clk-round-rate-v1-0-4a9c3bb6ff3a@redhat.com>
 <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-sound-clk-round-rate-v1-4-4a9c3bb6ff3a@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UaxPFf2TfMhlwWyqFaTZOfCJA1javXxd
X-Authority-Analysis: v=2.4 cv=OotPyz/t c=1 sm=1 tr=0 ts=686fe5a8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8
 a=RGHBBWgGYxkf0F71jXEA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEzNyBTYWx0ZWRfXy+7NrDKuis59
 bu76VtAWXADy3IZ2iekeG2ERztaAXgn28raSOqT8SefgzQWgVgJXkoIJheVcQw3LLpTUQ3JTNMm
 Qr7/ElZxiJvzQw+PN1usBCCOS/C4Ef17rXTAvTldvQtOOSPaQBnCh6noFLWohCDLJIKdvDOd+jD
 Wt7KjqIR6bir6Bp0fVRhwOaZ4tCD0Y+nsOzzKUl7jcaXZ+AX2Wobtt7TBTxmTvi0ppVCQL9R6bm
 dcck4krBZ6gpHulcGi6+AhX+rZA5rvo0sUPlMbf837Mpm+0ejrYYFGJpyWgpCD5Kre/0ikaVM9O
 AEMuxCtHbwhYVDIY0eSeNikqU/CMadXFtI4O2DSEwoZVw6eLKr+MDa4UjeFOSQhDvBOX6MTt97o
 B7mVJp9rnvSaciIkcswb6IIrw4NRtjbLHrhU/2NIXnIQiD3KMa+1Hhk8qYiGt0Tt9X6LVyci
X-Proofpoint-GUID: UaxPFf2TfMhlwWyqFaTZOfCJA1javXxd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_04,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0
 malwarescore=0 mlxlogscore=891 clxscore=1015 suspectscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507100137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_090913_478360_0C25216E 
X-CRM114-Status: GOOD (  12.89  )
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

On 7/10/25 5:51 PM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

come to think of it, there are a lot of drivers that can not
do any rate rounding - perhaps we could introduce a NOP implementation
in the clk core that we could reference, instead of copypasting
int foo(...) { "return 0" }?

Konrad

