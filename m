Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A15BFCD0A5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 04:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3SrK9mYgwI7NSVaaqY/fNysgz1UJQZeGTR0XtUZbr+4=; b=XHQX3RujxoSk0nOAzY02zJyrTp
	aTSAIe2j2ouHnH7RNxUNQdTZQ4G68agXNKXfWPuqI58XOgZSHU6Da0DRfgXsC20gkzycQ+JRcUmG/
	QTLGijEnAadVO/E2UwegNMOEtwzl1TcLb2JZOEqT9ZF9t2O6OGa4JggkAJa+xfoEY86Q+jl4a6xao
	l4Z9N7NVm2wBSxzcefhEdAR7kGDTH6M62NxQuXQHNo9z5V4os/cnmfSbjuzFNo5XbLqVucV/zkKPr
	9iwxdOQDnkCMr9ucVY/EgjBsJ1nlsg5C1IiUadXWA+6IZDl0lDkDNncmMt627drEZ6bqOc8z1a7fj
	CQwlSjWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2iA9-00000007kDO-0iZH;
	Wed, 18 Mar 2026 04:05:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2iA5-00000007kCJ-3g5G
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 04:05:39 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I34qlO2730140
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 04:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3SrK9mYgwI7NSVaaqY/fNysgz1UJQZeGTR0XtUZbr+4=; b=paLwn93Q9wUIJo9A
	uMy54svfYhUIYKfb3g/sXTTrC2Xwt0Nm6yt6XCxfVN8yxFPA3ODllqZ5NijpDEO8
	+sAKEb+LUN5PUn3L6WBiWihJXF2oweNePPa9Hq2aWZs2ffTUrtoTEZH6vtxelED+
	fYTUyCHX/U8wEbHChH9RK6sNwRPj6ZcdfF73N1cEzVal18bYDjiVE/17ZLZ1WSvQ
	yUp/CknpE248w8M88YA6q8E4/d7L5XJC5QsJvkQZlgjEOguJ5Lk8IyslfD3H2df8
	h0SP7nxQ4P4aZ7ADBwHJCE9lToZtX9q6yWtOOPjTjnrMPGs82Of1OkQyBSJ78URA
	fyHkXA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cy8kjtxtb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Mar 2026 04:05:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aad5fec175so311360445ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Mar 2026 21:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773806736; x=1774411536; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3SrK9mYgwI7NSVaaqY/fNysgz1UJQZeGTR0XtUZbr+4=;
        b=R7WB1NIJCqByIfiF2b3TfxO/vsE3D2r6N8hePD67lC91Uxu8M6/83PAzdNxTkSO7DU
         LDwm6rnJdCvHCkiUwJNVerRFD1NMiTzO+o7PoPPaCKdOK+93WuCSkZCy7c8VZ4BzJZXR
         mRbY0W5jrsKM1GUXK/A9SNtOhursfwDnj13W6EMS2iQGXs/7y39TlYvy2Aj1J+QCUTBz
         V14Rbk9UI10dvfmd8Dpf4oi+kApWHPhSfotyh3Ga6vLjpt573v9++HhLTT1O68CmkOkM
         3jVUE6XQbg5IT2qUn5X+Ou9YATyUMRQHTSIgbVYpJKUeArypdRnu405fqBb8bMAjKJQ6
         6olQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773806736; x=1774411536;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3SrK9mYgwI7NSVaaqY/fNysgz1UJQZeGTR0XtUZbr+4=;
        b=aanwIIuFGUjo8RVTX2jFCQcC+bfMGmFI4HsrpZvA5omX7nZ2tDc/X0L+fgmJ+dxx2I
         yMaCCINwrxTFCO9K4v8hJ8dWjynUnTrjkOmP5KLdFB3yjsfWpAgyUFd5Af5iiNcmo8j8
         7qXH/vmmG8VXh8kTOyd8cvvDvtB4+844drmLzpqUvIAdX40Oj9w8y8BaAxgFXetu1wPP
         0UfdAlTGa433ao1+QQVIKeBKH2NXlXIW7Uf9QrZLtC+Me6skETaOI+yHKRq9q2btCJ5F
         SLArwzRPGnLI+ZCGFLaOAu4wpf5sWY192IGx6CgPYUSziOJP3g8eE2kiBkhUjKIxQ9bH
         Awug==
X-Forwarded-Encrypted: i=1; AJvYcCUhvnsd36nhDxdIxgEX8niwu/4XWWpa0STME5cYbr2+kj4/ZXF+ACXeFiMrJzw9r2/QSc+rlqBcxrTx3pcX8wtB@lists.infradead.org
X-Gm-Message-State: AOJu0YwJMpb+aMrygJYB5//CkBlTZ/91J7nUq135TyIOdNbdaq/wtri0
	D1MVCwHnm/uCygh7wiZnRnd8JtdowY+NH3HyVCJ+Jn7Hg6BAYND9PJBg1nl2tcB5W4fSlMF27aX
	6psKQqo8oxgQJasIDbiM6Td5Jwmu7MAyfBRsiyhChTZLWKdOQ6SF6ycwcxKUorGoGinyZdIS7CJ
	WqXQ==
X-Gm-Gg: ATEYQzzGxDbnU2iavQuQfubh7IUDvhM1ky7973z9uh9OCBaZ5DoHph4OYJ+Qzrh02uh
	0NxIxuIkcJ+yHQPUboCSdOlvDkDNJg4XS0iZ798PGZ50zCAnmhQdLjEW8HK1Ttmw1Io4eqeBzkv
	fVsjhXGgpHRI7BeqCV/mokqkkqnBNN2loo5zywiBs00QjntLQkP3Ly6Q9t5rvifBt7OVYI03g15
	isV0P0eb2nKW2JymEOpVT/2nEuXueFx+Jm660+fkgO8Cuui5R3fExkRd064rTth7a5RwLQfI4/k
	UQ5LyAf/8wPf9lPCchYUJkJ8zjvxMP1+bEGTf4KAad8I4m9smJ7nNyOV06NiLy/voUugc7VQSl+
	bwdTSh+8+Qi9464NFe8JbHJ2Gt2LxorDF//A9UY7Ya4IBmqrQrQ==
X-Received: by 2002:a17:902:cf4c:b0:2ae:ac0c:5a29 with SMTP id d9443c01a7336-2b06e323431mr19012125ad.10.1773806735688;
        Tue, 17 Mar 2026 21:05:35 -0700 (PDT)
X-Received: by 2002:a17:902:cf4c:b0:2ae:ac0c:5a29 with SMTP id d9443c01a7336-2b06e323431mr19011755ad.10.1773806735209;
        Tue, 17 Mar 2026 21:05:35 -0700 (PDT)
Received: from [10.217.217.233] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e62fd3asm10424855ad.78.2026.03.17.21.05.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 21:05:34 -0700 (PDT)
Message-ID: <797d1615-860c-4829-a8f3-ee33ebeefad6@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 09:35:28 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add support for Video, Camera, Graphics clock
 controllers on Eliza
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
 <253ee25d-3096-407d-8d2e-3c9d1072b2ae@kernel.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <253ee25d-3096-407d-8d2e-3c9d1072b2ae@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAzMiBTYWx0ZWRfX6fxbzIimnil3
 lvOddgsgg7i4F6z6g9OyN4XpSd0UfH+O7cC4uSIvWJNA6hR/lOejqFb1xHcJP9Ig22OdXHCSpTR
 HwSB12Hgn0LzVSc0lDsSURG8ANfrf0hSdz1tDZtgKqz/FcJwr6Skief4MNFygXuWdSLgl/iwDTI
 +WUSprpY9n7rOOeyfv9YP8Tt4gPQCGbGsP2LlDDRxeIgSIO0VwK6g8qcYm+91lEtXGU4eQ8fscW
 KC895tTtZL7pcbTxvJFgncSyOsUWocV1SaEpxFkRhORS9Qz+VvYhRxNdnbOEl5XL/2suFNlTPb9
 JkTbbtwUOPBFnk7IwLf33dDRnDnPHSiBDvaQDaY+3xAzk8DnzuBx2AZeB22mM+JpvkZxrXgd0mg
 k6smtsE6NOjpCzAQgwFeWGw5vA79coceGMdTOd/NflPuCvqozuICsYotKDkK3kHGVyprzQ4GODA
 nhIZFU9KgmcAvoHrlCg==
X-Authority-Analysis: v=2.4 cv=P8I3RyAu c=1 sm=1 tr=0 ts=69ba2490 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=k92yKOBYwQCJlanLp_wA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: -SS_E4sVxvq2Hn6n5GRIG6TDo5TCBQ2a
X-Proofpoint-GUID: -SS_E4sVxvq2Hn6n5GRIG6TDo5TCBQ2a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603180032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_210538_045626_5BB61265 
X-CRM114-Status: GOOD (  15.71  )
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



On 3/17/2026 10:53 PM, Krzysztof Kozlowski wrote:
> On 17/03/2026 18:14, Taniya Das wrote:
>> Add driver for Eliza SoC camera, graphics and Video clock controllers.
>> The camera clock controller supports the cambist clock controller and
>> the regular camera clock controller.
>>
>> Dependency:
>> https://lore.kernel.org/lkml/20260305-gpucc_sm8750_v2-v5-0-78292b40b053@oss.qualcomm.com/
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>> Taniya Das (7):
>>       dt-bindings: clock: qcom: Add video clock controller on Eliza SoC
>>       dt-bindings: clock: qcom: document the Eliza GPU Clock Controller
>>       dt-bindings: clock: qcom: Add support for CAMCC for Eliza
>>       clk: qcom: videocc: Add video clock controller driver for Eliza
>>       clk: qcom: gpucc: Add GPU Clock Controller driver for Eliza
>>       clk: qcom: camcc: Add support for camera clock controller for Eliza
>>       arm64: defconfig: Enable clock controllers on Qualcomm Eliza SoC
> 
> On which device did you test it? Considering that you told me you did
> not hear about integration branch with patches before, I have doubts you
> could ever actually test it without our changes.
> 

This is SoC which is already tested with our internal mobile platforms.
The SoC w.r.t clocks remains same and has been verified and work well.

> But regardless - on which hardware exactly?

These are our mobile Eliza MTP platform.

> 
> Best regards,
> Krzysztof

-- 
Thanks,
Taniya Das


