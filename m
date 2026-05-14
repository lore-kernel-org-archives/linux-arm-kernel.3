Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEA8CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 10:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKTGKaxABIRgYitTJTutosm9+YX47ZXEjpDWGiVKMfM=; b=aJ8mZRcN+0Ryxfz2LuzJtGR2X9
	K3jLJtlloirsmeYZ14wVUXu07oaRXLqdtyKXE/P5SHC4PG+lwrRG9q1VWqL14tPNBYAgaVKC9+mOa
	BtJpzbpsXTyZpLQTzh6CZfeAkUBUxG4POQcJ32Rj5TyhNiO0f/LHmpk5gPd+0w9IfHqiGuPEZN1VR
	gXlK9xPqicoS3yhv9UQIr5kjd8vqN+hrZd+0fGHR/HxkPiSVmaCf3TEa6uCyP9jCPJEw8FyJpN7qy
	7gbVSvHUUZ4frQurEdAD+k9MN6vPl/FgLiiLZ2nJY3ve7kMBnlwslrSjBfGK0fjoiyTlbQgbL7vyA
	APVcPgUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTCZ-00000005Bbc-3niL;
	Thu, 14 May 2026 10:21:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNTCX-00000005Bb4-1XNs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 10:21:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E9k7lZ2592250
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 10:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKTGKaxABIRgYitTJTutosm9+YX47ZXEjpDWGiVKMfM=; b=E3kn8es9MXVd1/Gj
	4rFSCZB/DNa08vAsRs8ugWvy/fk/LBgTjPynLqVzu/PEOOF9XfS5Aa0gE/ntqkSs
	5D/SMScTaPW8f1oMOmz03Z3yidtI0gEHjWQv3zM9tQsyP2iC1V6v0mJxrVNOAvY8
	dBx0HB55nwv8cq9xl5Tp57WiCwafKGVLV4XZIdXMPNpasMh4Yi+y4QNKMST03dEK
	PskXU+myOmA1UZndCWiLrnpqtWuIaa5TNqi45vMS+us9cfrReWfAmG0uf9Gqa5Pr
	HbCtifSoyZAEWtCYs3poBC2hlWo3IxklHdiyMbZTCkUUlxenog+3E7+R82zlJ3/X
	j6PORQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5899s0j3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 10:21:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-365e70c39d0so9937692a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 May 2026 03:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778754115; x=1779358915; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CKTGKaxABIRgYitTJTutosm9+YX47ZXEjpDWGiVKMfM=;
        b=hNxTpK3qQrtiDdb5SjRysgQyLak3KGYxGq7WFyb/s0B1l5VgG9L4rQp+e1cYKXEKrm
         tqaVWcSe4wfxigPs3tf1LsjyGjww/PnQWLsSBqhKnCXody+zYmJonpURDcwCjl5QH+RY
         WDFW/MDrv+euEcjDv4Zh8Uh8KnP4KaIfbKqRObgzY2rZ9P5nnswhfstaNWEdbzqd9aom
         zAUYO4gIaQWXLZYiPZffaanhBu9Ehdj2W/w0R6h+vqmbqLHBZxVlvuWTBfv2AsMMvVBO
         9GQq2DraLapjk9VI/7DQxH3mtz0eJryYPczz9ahYkrdENv42fntRkVwchXbL5+KPk24u
         Fddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778754115; x=1779358915;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKTGKaxABIRgYitTJTutosm9+YX47ZXEjpDWGiVKMfM=;
        b=PUVYb5gt9lANLZNVA/lssJZWF2eevCpDXjImoxiAP0TIiuxtAsfI8rHjFDEAojGAET
         L4TIhlTPU5e4eyqRtlU+qRLtbuUQx2OQinxJrFU68HT5Jw2IxLqsGwJ5433JfkRgKkbe
         iFeTC5qoLyw3az6R5ButdDdWGcVq0mmvkl96S8Sq2cmL5uvxz1vce8/Glqk9sd2In7un
         6Dwcjpma5E6E1xH4bO+cxCdHuA/oM2JXOvkcT51csmYufAcIhWh2HrdT/wp4WsQxeVSm
         +Nh4mT7BOeUlWa0hzdBm9/fLDJuXQg9JaJbMU4CDm5xCumUhLZbiymw5pcnNBUVhVa9u
         fGFA==
X-Forwarded-Encrypted: i=1; AFNElJ/AwTuziMe2wd4x4mhVtiM2L620OKa4x3+ozWKhgLiEj8ZV9K81r3i0Rwb1L93vIshbVPqiAv6Ddew6+TZXiSGP@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5/Ah7wtJgiaxytFgu+y7Qcc51UvqeXJl6cxLBls1Z3BH2g+qa
	ddf2gs8K1RW0gwfaB08p/9bMb2p+HH9uB7rPih4dkeiS59AYsd77uKOy0W+FyTXLUHsnpkZoAOq
	C40babWMczc4z7voQHO46TWEmII8MwGdcf5GgnMyE1fn7cn/DhwiMSw7U7XH62fbjMjkxXsAsMD
	q2iQ==
X-Gm-Gg: Acq92OEKnbF0yPOEpOcUI37bbZRveyVWpkzbSj1OqTJkNJNAI30YafDJMDu4d4OxNyA
	ZhdoS7bCwNwUWgvcoy6MiVZETLwszOaj7KxZEniFFJOBzaOfrNiCAboZ1WHtx82/DfIZ+bOZ9bl
	cY2G1MPer4rE1V/r18hkyKXn7zP0EyDByNWXvi2Sy9/sLIOsRX5dmnikM3dObWvIf+t/CvcDGk4
	Cj22q4fwVg7odhMsJ2um6Hk6qxt0f4EWJ8wFJ5t+lmOczXNund/0UjW0y2Sldk36oOx/7BzzxyJ
	/1S1zXZDvqR6dwEzgtQinsNsICQQIeFn5s4bZPBhu2YEsVXT4omSyjLCTd2v5ZrAJ77/Tok1Dl3
	g1xQI6/XVJwZMkCoSczy9NKAPySfvA2GJtrRFky0ynbKypmGgkO/iVANDRiY=
X-Received: by 2002:a17:90b:4d07:b0:366:132:fda3 with SMTP id 98e67ed59e1d1-368f782f7ecmr6252250a91.11.1778754115134;
        Thu, 14 May 2026 03:21:55 -0700 (PDT)
X-Received: by 2002:a17:90b:4d07:b0:366:132:fda3 with SMTP id 98e67ed59e1d1-368f782f7ecmr6252211a91.11.1778754114516;
        Thu, 14 May 2026 03:21:54 -0700 (PDT)
Received: from [10.218.28.224] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ee6280d0sm5974990a91.16.2026.05.14.03.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 03:21:54 -0700 (PDT)
Message-ID: <2ac7dcb3-6dbe-4967-bde2-10811597449e@oss.qualcomm.com>
Date: Thu, 14 May 2026 15:51:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/7] dt-bindings: clock: qcom: Add video clock
 controller on Qualcomm Eliza SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260513-eliza_mm_cc_v2-v4-0-e61b5434e8d9@oss.qualcomm.com>
 <20260513-eliza_mm_cc_v2-v4-1-e61b5434e8d9@oss.qualcomm.com>
 <20260514-obedient-crouching-bulldog-7d63a8@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260514-obedient-crouching-bulldog-7d63a8@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEwMyBTYWx0ZWRfX0kh98AzSYDCY
 asxoyl+ZZxM83aO0DpSon6+J6JkewnHW/9WOAD0AoygCSIGfVAVVW0T9obyq2X+mzWi137a3AHG
 UBamF5UDC0DJvjaqW8AzaQTrcPWII4ihiLTqAx2bIh0wsECHAFGL7GvjnTgye5kcdZWOwv/T9zD
 3cP7VzpjEEC3I+fr6yOZ16wX8hyINbpgpGrksbOB5v62TTurPM6Huwr1CrZwJokXg13SpkVN+h2
 CyHj04KJuOdVJ7w3HhvMbW4Pw/avKaygbwIwEkmYShMzMOcFjGKAtT0dXI1G6RVyEkqk5uP8t6+
 d3UvYgn5ZSruPm1x5OZX4OFzJC+MSnwwz1GYsVx0NTAa5xBi/pw0986VHb0kcxasvjqyYOjzvNH
 yPk0eXWdZ59FYW9nqt7APmyzuZx9AH2Ndtx35eCaVU4Z5Dy81y6Y54Ijom8m2+SkUN6Ecf9VKTV
 4teuGdBaDY6MQrj1CNg==
X-Proofpoint-ORIG-GUID: Lem0S_7q7CDOrk0rlEuZV04pVxTfy2Ny
X-Authority-Analysis: v=2.4 cv=N6AZ0W9B c=1 sm=1 tr=0 ts=6a05a244 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=uKGqPZ-g_1yFZXzQAvAA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Lem0S_7q7CDOrk0rlEuZV04pVxTfy2Ny
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_032157_537072_9DA48729 
X-CRM114-Status: GOOD (  17.24  )
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



On 5/14/2026 3:48 PM, Krzysztof Kozlowski wrote:
> On Wed, May 13, 2026 at 08:57:36PM +0530, Taniya Das wrote:
>> Eliza Video clock controller is on CX and MX rails similar to Milos.
>> Add compatible string for Eliza video clock controller to the existing
>> Milos videocc binding and add the dt-bindings header for Eliza.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,milos-videocc.yaml         |  9 ++++--
>>  include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++++++++
>>  2 files changed, 44 insertions(+), 2 deletions(-)
> 
> Please allow others to actually review your patchsets. You sent v4
> immediately without waiting for v3 review.... which did happen. So now
> please address somewhere comments for v3.
> 


I have put a comment to ignore the v3 patch comment as I had missed
change in clock node, but for sure will address the v3 comments as well.

-- 
Thanks,
Taniya Das


