Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 400B21090221
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 12:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsamQFOrMm4/jCqvWGm8dQRlpIKGk1KXtpwPraUX6TE=; b=4MM3Z+JjvFC/HE3fbMvVZIaTFh
	NcPxZEqVV8pEcG9r5hbwJYJIUT3S3Kx4okqxhzspVCVkNAXewW/eiINZ5/6N6/iVjVDx3WGoLLM1j
	bPRVWUfNkBToNdGUyYhs5Tbw46rtyLF7rp5yvq35EKCvEiV2n+hx+d6MTXKCOeZsaIt1+vx6gEkPP
	nYzJb6bAf68a03T+rEi7z7a3qJ2rzlXa2uEatCx5qs/SwcwyykZQHsUwbkmZcarALPh5xys6VgP4/
	DOZZl7Wbv3qlQtOUR9m8PEgc1CasnHYgISKkUQsL/0KKcMjPeO5r607SID2ICKgmXiMw7OGg4tuK0
	YhABDl3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CsK-0000000AdXU-3Wlb;
	Thu, 19 Mar 2026 12:53:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CsH-0000000AdWV-0fbt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 12:53:19 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J74AMF1027820
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 12:53:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YsamQFOrMm4/jCqvWGm8dQRlpIKGk1KXtpwPraUX6TE=; b=FZK+WR6HnZPZ7fzs
	e1xNsifoyw6lM1RN84305p3Nvp/0pkcH/TIplC7EkdWqvCESnsC6mcOWtobTIolg
	HCmlg28r9xGUqX1VGTef1UwSMgfHkGyfeGyFbkQRAyjm33WectTPkij1JyIW7IST
	Hsl1V2iUaCE1xuFcYy1MxL3sKMuTXWL9nAXoW7VdFFaoeGpF2JIkbt0MHDGgDvsO
	yOj0mrs8Z6XrCzGRndFxOhpQ6PAtPj4rG/bDmndhRfjZXIf5CmZkIlLcJHoX1ERS
	Ug24a10dYJ0sA9XTWv0IVuRAAjwTA31cBIxwQX/0xTVGnqYfE/6VJW28+XrDek+a
	Rzt87g==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0032kamy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 12:53:16 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-89a012f8ab7so8106116d6.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 05:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773924795; x=1774529595; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsamQFOrMm4/jCqvWGm8dQRlpIKGk1KXtpwPraUX6TE=;
        b=ZPTAmvZup47pdDX+ZXQWSrmoC2drA2h1nb6pcVLfOmrrOIenNFFqsylREy/5bpsgsn
         U/+X9KnQlw3gO1Lfwq1iYaoPr+4WVI4BTiMuzZQnzbtd6lGTqp0UjgR8rPlkQOpa5Thi
         sJIXEi68b308N41tNdnvh4qO83Ua0DW0YfytU+3Lzz5qzq6DzXOYrpqKyHjT1mHmfcDK
         zMcQNTckTOKGgIEFbZkBxHKbbPGSOl87yDWG4A/yudqcDNkaGcZ/s3pJdv/sxa5GtfVO
         fAVA1crcSFbIeVTkGYDGuMz0yNt4iUxaKzC798VJBOFcKZh/I/sl0qlc52CP7iSXfRKg
         f/Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773924795; x=1774529595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YsamQFOrMm4/jCqvWGm8dQRlpIKGk1KXtpwPraUX6TE=;
        b=kRLGkMyqtrZETCtIgY03P7at4C9goWybUAgIkM7X3rHg1L7codOKFqB7Q8QNikYAv3
         T1BCrhsNcFiXVBfuei6LO9wZzDPiXpV/+WNlWZJ+QTZkpQh5yOif2XdoB+//bbMz45dE
         5bgKhVH/8j4SErgTxCmUOtsR8eS/6ClOhKmJpgsK6yC+L/igVYIj5/x1ddZjw71Yf/sM
         5X0Qlp/7uwHSQJaPPdY5ICyEBxML++//ubwFScjkh9ST+GNvGvnYjJXPT7MYvKTdT8a3
         hIoDW26sgvajH2/rQPUdiln+VRBrZodBDi4clUzqECo+y72iSjwQUv6pktJu+xh4hgro
         t0Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWpMwWdsFZek9lsMhGQK46dn637omq+QYC8alAB2UjrzvetxbvI4D2FEx/e8TK7rpH3RroCaU5U5epogHgc7H0L@lists.infradead.org
X-Gm-Message-State: AOJu0YzVQmoIZyvunl5ldmu0Aa0oIJJnmcCmNevWWk/cFWR2DoLzQtHv
	rKJ/zC/tni5LPMrnZsfM+PEkAfpYn6Afymq8skeFqSTUGSzPvH2C54D2fB7LEUduFqNeapo9N4I
	NaRHba2l5XGoqzeKR4xwv7YtJqNLh0U+sXvcVxmMwkE085oBlzCC45PChyr5atozh8Kks+uX7sx
	MJ6Q==
X-Gm-Gg: ATEYQzx6zFslbNEAist7YsT41QzVbiuZi81wdGh1XWVoQfvVZSO/xwc7Za4NA7c+U6t
	A7HL31+qjwYZNwxU/C5JPvNhS7S1moX412rfU4sa7cm2uFaVUE4CaS2IxtSpO+O5qdryocFtFe3
	yb/F45PaP0c2m4QdqE/UHjyV07yNItK0IhJ8dXw/GOo7c1NVykEo5YTH4kQcE2Kt7XeMOz/mesE
	dtfUg53kKK/uBSUaJUTs7kbg72UxI4GV6veu81HlOFSuv/RxLniDIXg5ewZh/Z1clsLRJkmSQhH
	8yEbz5iXtEkU7lelo7OaNuys0DtZ1Ll3EddJzZj51IUAu5PBX3rvN/GlNoquWhieFhQazH1qeGI
	V1E0HuXlggbdJu/X7zOAqC7np+PhG00MHiaiQ6lqwNQXYL3cTgrc2Pd+ixOdFMVb6UVvQryaT4B
	w1jJA=
X-Received: by 2002:ad4:594c:0:b0:89c:4aae:408f with SMTP id 6a1803df08f44-89c6b580401mr82458436d6.5.1773924795436;
        Thu, 19 Mar 2026 05:53:15 -0700 (PDT)
X-Received: by 2002:ad4:594c:0:b0:89c:4aae:408f with SMTP id 6a1803df08f44-89c6b580401mr82458146d6.5.1773924794968;
        Thu, 19 Mar 2026 05:53:14 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f17410aesm434895166b.62.2026.03.19.05.53.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 05:53:14 -0700 (PDT)
Message-ID: <d2960180-6d00-4a7a-9302-37b73c5b0892@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 13:53:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] clk: qcom: videocc: Add video clock controller driver
 for Eliza
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260317-eliza_mm_clock_controllers_v1-v1-0-4696eeda8cfb@oss.qualcomm.com>
 <20260317-eliza_mm_clock_controllers_v1-v1-4-4696eeda8cfb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260317-eliza_mm_clock_controllers_v1-v1-4-4696eeda8cfb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: PnUdRMy1ZNKts1wmXCR2EjYqoG099JzW
X-Proofpoint-GUID: PnUdRMy1ZNKts1wmXCR2EjYqoG099JzW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEwMSBTYWx0ZWRfX6cpQWulajhWq
 n8xWIGQcZqHPpKCLiDiuTc+t6FNWyMKXJtYlfzfEOWhNElWR6wCLFWMNU4dbzNGC0Tba8lZvlS1
 IlZFOkEeZMnG2K6FW5cTOfHaXqs7RxrNRgULO0DGAXeFQCwotUpTPZzCtl+pFxgXopl2qQeNlt/
 01W5hPUmJSekLhB3oXSOL7fM6LqzE/bF76zkhWt8XcGlhTDVUqR2Uo5/1qC46r+YI0MaY8yDJ+L
 wXjB3Htoqi2z3Ir03G6x4tVLlr9DDonW/syfCSN7lDTuXq428Zo1WHArmzKIIGt2E/xNvgqkdkT
 9MiVKM/9I+rA07kdRcSYyMFuveiIKzxgbr/Qom4l3Vmcr1dag78Fq/uhhnNDTb7OZtmEq1ZfdLo
 w59UssNl4hvjcu7V2ToFh+gqfl+7pdHB5cRCN9KcRIsVft0YbvEaQqpf/endMoNyGAq76CYyBKn
 eqByO/FUQgLQXhKVrHg==
X-Authority-Analysis: v=2.4 cv=WO9yn3sR c=1 sm=1 tr=0 ts=69bbf1bc cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=d7ClhsmVZ3m4v3ji_18A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_055317_324068_49267AF2 
X-CRM114-Status: GOOD (  11.75  )
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

On 3/17/26 6:14 PM, Taniya Das wrote:
> Add support for the video clock controller for video clients to be able
> to request for videocc clocks on Eliza platform.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

