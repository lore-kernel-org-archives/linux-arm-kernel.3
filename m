Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACCC11090223
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 12:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MfuF/PlZWMgF3ErD0zfEEpE4i/iFIciw6YjqRozDOSI=; b=wJymxMlJdToOvJvs5KpqG/o107
	LuV7guH6faikVE+nHspTl/vF56mPDtEHXZKLPrnVFBI9+fZlwpEC04a0kcFjP1lXfeWK4ufjgrICC
	Q07WLQBG7tRlApDah/Rru3RN6s1BwyMnGUD/YqGmxGTMVjTl/bm2R6PGtZ5984zVoWF6l++iqsvwF
	Xdx/4MKVE58FAmksa0TA1RooANyF5K2sePJTn/yQ0FEIISsWz9g2UIWoZlToZqKDEw82Phl22P0Fh
	0hEFvBoUAiZ4SM0lmT/yKc4DYprDT8Y4eE9xIqQtpjmvhn/Kru0ZXQxs4yW60uwJPh4LV3DgG5EJS
	nC/z1cEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Cwr-0000000AeFH-0vQ1;
	Thu, 19 Mar 2026 12:58:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Cwp-0000000AeEs-1gZG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 12:58:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J73wKT3771110
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 12:57:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MfuF/PlZWMgF3ErD0zfEEpE4i/iFIciw6YjqRozDOSI=; b=GT0iLIPvcgEkI18t
	RqrGsWYCMxUKkcGWtFcyAqOT4bYfG28CXoZOS4g8py0AKbM8x3FzpxcJh7rH5lZN
	1MVc/LAniCBG+d3D9kQb8CMDr3eT4EnvZ9m41mInGtzhlzo1SQF/CN1ws/Jz9D/O
	+ypAokzAg6PC5G8db0mBkPTpyjBq1usKy9ED+nT9V3zWuZYRDD8u2N2rlLC8vf9b
	qN7XrQF/MBm368nXCsPo4M5yp7MJaSwYtpZaOfRy1Hw5CknZHzuQx9o7V7BQC5Yv
	dg+2X0ZGtJ65SM95uSxW3JONEUBj5TCoLKWIqsMhvyjO3gTiiQCbJxyDs5xZXfo/
	hXSwGg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d083r9rsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 12:57:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89c6717b74dso7123516d6.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 05:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773925078; x=1774529878; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MfuF/PlZWMgF3ErD0zfEEpE4i/iFIciw6YjqRozDOSI=;
        b=UEmU5LKw1FUSRS/qsBHFEy57wOML86w97AZycLeb6a4NDncD/GDrBheKzv9LwePbGO
         +1FuTaU5wa97ZZFjn+cwm08+ahjEm2pZg/rs0mzB6+DbV01wsEIcNuZi+EG+vRpJxdU8
         YGJFDzbtQvnXnGyEaygZtjWqIQr9cwebwU+tVAITvJlGOzicaMbbSzJlBGxa+F4A2dYw
         6pf9Ulx0FSbXBH/UKehJosAh2gKvKu1o6IdfUqPiqoHE9ye1f5RUBaImBCT+yEAW+6Lz
         5xDu0ob00EGqm2XcYgh6hryeRNmNo8QHHJiMzu5W/fx2TO8PHj/IguoexjUUh0HLDTwC
         FUSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773925078; x=1774529878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfuF/PlZWMgF3ErD0zfEEpE4i/iFIciw6YjqRozDOSI=;
        b=XfIefB3prKO4HjWCqe9oo+vTb301b7EWoFtjINXvabxgx0qLbSHNjLrDKXd5ksyPVp
         zzs6p+0ucLD6+/CDA0PHTOugFLDnA2ww1kDiH/I7rneTSMt0E6+2/5Lz+B4UDDELqAvj
         jXZmWgIz+3tJpZj+2wNelb3SemI96AhbvARtJAD1WnBfswaKSDvV+rF0XEEI3fJc+JbI
         5FPIYMIXBtFgk+Uni9l0gfL11lfKoXbzX7rNyppdavrosgZCH5hyj3gdVG71JOnSvifW
         j66U8oBqUDsOaJjPa1eFV/IZCPFJ1zJsL4ZlJWb0wvjc+S8YInkaVAguZ5ctRKVHk9v9
         fQkg==
X-Forwarded-Encrypted: i=1; AJvYcCWKztUZ3O9cyLfXAr7vRqOi9adJl/l6/y6coYgtPGxaKUgm89z9Ga0Dnue9L6ajzUcFJcs83X8xjC0eCLrQf/im@lists.infradead.org
X-Gm-Message-State: AOJu0YzJxXAmrD28glqo6ReLXRIS7cMo+hMNzDzwLiPUU1bufORJ6hZC
	Pe2cPCvz321MUw7RoHBw0nmK+Rmn20Vpusi4PraMVGmSAzf/8OT85XSoJtiiOl7skaVSlcv8Hqq
	1pd6ZTA2iXqVUB6VRMiY3qYxdZKgxC4Vgkd+OnVR+pMy2MIDed+UpVdLyWrbryo4xey4jeIryQK
	u4Mw==
X-Gm-Gg: ATEYQzwII0diA2USU0bqT4EUHA0tSnWRvw/AnIxbDRtmFPK2+nKi2eGnk9HzQ/JYGFC
	PhIoVj4MSgDkArkQsPqjbh9MZZB5ZdnuZIbXm5Ok/mC0I3pddKbVRWWmoAs7cF7DQrWuv/3sEGk
	JPbVusRT3umCrBnTpqIf3BZ8TcYsDjdkkjXrD6Vyt3zptWB4S+FpxyhBuytm4aGBw7PuuXov2Q6
	s7Q36xDJ7UXWvpXCUM9EauNzVFdhS+PWSzCd/ivV/PBVL8zo5J7UOkPxFih1SMvmDkSbarad16X
	uhSUAI8HbiwugnvhLPuNr2KMWciMMSpObeZ7aMD1AQIC9xc1uePCXFbhj2dKwPYbMpj8iz4TP+P
	m0D7fowm1is9nHu6Bm5IwYHgdqFltNGP82c0q7dSMtMoLxUz6Gwg3fRYiLK+4hf+Nw4OA5QSOgH
	U3j1Q=
X-Received: by 2002:a05:6214:f2e:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-89c6b5c8893mr82541516d6.7.1773925077656;
        Thu, 19 Mar 2026 05:57:57 -0700 (PDT)
X-Received: by 2002:a05:6214:f2e:b0:89c:5159:ea52 with SMTP id 6a1803df08f44-89c6b5c8893mr82541176d6.7.1773925077104;
        Thu, 19 Mar 2026 05:57:57 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f142a785sm449977466b.14.2026.03.19.05.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 05:57:56 -0700 (PDT)
Message-ID: <34c67717-0d6a-424d-be5f-0e514b71d180@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 13:57:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] clk: qcom: camcc: Add support for camera clock
 controller for Eliza
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
 <20260317-eliza_mm_clock_controllers_v1-v1-6-4696eeda8cfb@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260317-eliza_mm_clock_controllers_v1-v1-6-4696eeda8cfb@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JYd6JQSIrplXCH6-NX_HlcGSS__hdXMj
X-Proofpoint-ORIG-GUID: JYd6JQSIrplXCH6-NX_HlcGSS__hdXMj
X-Authority-Analysis: v=2.4 cv=ApTjHe9P c=1 sm=1 tr=0 ts=69bbf2d6 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jdZfh6YgxIVJxXzoon8A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEwMSBTYWx0ZWRfXyo3cUrFy/0u5
 rZkenQpoeiYxqatdTCalelPDCNww0ImVNyHuRomtQ1n+pIExyEPEVJ9/OSpZMQj6bSK2hxFRETv
 Oj7kzGo8VPQ8lhynkdH74cOfjvVwm6bCx/z3rjeIHq9u0O5mkrxKliFl6iU546MQO9mMR3JQdCO
 cVUTYL22GbEot9f/dgwGxO+qJomuZO8Go65/MSIMOuC2KyvWzJzHQ/ipTJPy9nqZR4Ywh1NBvk6
 q2bRG1voF0ji1KkW+luXxlR+7wm9RJUjPtDMkA452w+meQzl6gk54h0bbnALEJd8u+uD8RErdPO
 GVIGuHyVDudDwlrDhfo2OQzW69TL3+32uHQtDRNWeGrtq9t4dDyQAO1JnXnwLscIoejsgHIlMAy
 eta+jkjiH9lZIuG/fj54LI0SzjgBUOZFsnNIUwaQu5N9jgzbN+48dsZgVrqsRYC725PPuDeb8vy
 ID3sOjOKk4LPMhrLY8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_055759_470522_DE7988C5 
X-CRM114-Status: GOOD (  11.70  )
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
> Add support for the Camera Clock Controller (CAMCC) on the Eliza
> platform.
> 
> The CAMCC block on Eliza includes both the primary camera clock
> controller and the Camera BIST clock controller, which provides the
> functional MCLK required for camera operations.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

