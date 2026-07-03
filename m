Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0916C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jul 2026 09:23:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NOw/y5u6kP1EYPo+p71lja3UI5ENfrKWunho0Mw4UtQ=; b=AM6c5VBY2OuurPP4TwsscUiWz5
	8rGde93sUMftIqtlSZH38CzTxmtFXLe+Z8nUGh+l+/Xdi2bk/WmtJZeuiIfN8rNMWKYFK334fOUIq
	smHwyWl+I+6TBvrvlLQOuyPK7blyA7S8WIwSiyW3xHVKsw5HpPUeGUQdNRS12uWzxzYZAUdH6I15g
	bGk33LiyQ/rewXLW0I/MZbNUoM/DAVyaYUQViubMIW98kG7Ls/GUZQHN+AqrGwCbVTmeB/57aHVlw
	KAC9RKVUcDGO55iSzvr4XLg5MlxlbJ08+a5RgJjLpqiLAitqGMndmJndp3r5teh4g8ad9UN73hZ6d
	PxpK2gGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfa7K-00000006TY3-21V8;
	Fri, 03 Jul 2026 09:23:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfa7G-00000006TXA-2z2d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jul 2026 09:23:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6637IZWQ3195362
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Jul 2026 09:23:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NOw/y5u6kP1EYPo+p71lja3UI5ENfrKWunho0Mw4UtQ=; b=JXm0VbVGUgl1DN4v
	Aocpo2T7qOQBSC+5Dm7ZAjfcEVQEHjJysI4lzG5vHRl8gWBXW0SMBRLjabn+gzp1
	LmM2ZecDViXL9GOw51Up0vWPGMQZ+xesNb9YVItRlH0RlOxbEdJMI56p7jW3xbxL
	j9qmhgWsdArGlvMC2tq/pviwt23W5T9IH2u7ukReIIEoe/o/9YDhWnvocMpcxkm3
	H4LAv3SyQBDE+u8Y+4ayG1/Vw1kDaNj34nmnSCTBxe3TMDrL/QEtFZbRjPF9K1A8
	HNTL4grsDMXDOyXpSvjXSOSoIF5DRpI4mYJ2B3jlnDh1PwxqHEHewegGljBFN1Rm
	NrBtIA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f68jyrexm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 09:23:21 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c804e38c65so7814755ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Jul 2026 02:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783070601; x=1783675401; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NOw/y5u6kP1EYPo+p71lja3UI5ENfrKWunho0Mw4UtQ=;
        b=dVFXe+DqK+oTgINZM6jamly2oMCMYPCn1i6A0cjpXpMzZ07MO/Wu9N0a/ahY8qcmNb
         hEObS98LcMWhNa4NejmQZ2HCxZgzwxCE4jThfhuXqjw1DG5/aH+YOsxsDI0YnwNeqPXs
         apJms24RUJAdMf6rQhZ/eHrNPTnNf195jYh9N6tyj5tlA8PBbThm3D48SK9OkCPLYJ+7
         g1mP6PgE+AJWatciAcZeYHq0vvt7VI+C7csvd0C2VNM/PKkUtHa9z+mNFTNSFox2n85N
         OggdGz2GNaiwgp5zbq1ZlQFCmzwTUInVrx2OA9RAlyTKgNZn7I4w30Z+0CKbpI4oKCVA
         Cq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783070601; x=1783675401;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NOw/y5u6kP1EYPo+p71lja3UI5ENfrKWunho0Mw4UtQ=;
        b=qMgOcNFiemwoCoJwMf7Hp0e9bqLDIXGyHaHgEjqFFyqpyfHsXsmOG+L3h4rFiGwrUR
         Wmw36xciU6u38Q1jAMWTU27YqQ3PPYJbyFik2lYkJdgVEYbKMOZq6xV8J7Sjc/pGBnqi
         yx9tGgpP4Y+0k1I7Dw2xUZoA540TpQwfBm4GsBeuN1SpqENsu2y5OQ6DIwxXz5q+doGT
         PnpSySFbuHbSJ3TxS6fEf3bhg1ofnt+77XGG/2bwHiJuhcWkgfjgoZgdXKQDEGHdOQ3W
         dhE23y/tTJA+wHyG0VIcnM2a/p+gI2GctqE+4SlVWR0cNvDGNwn0PykicVR/nN5EPn8l
         8+CQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqtpr5g8G0vEuLbqzLZWZwV792s4VEqQ4XLUNa5SGzG13Idv/bFYmAIW9WXqP5J6TQ3qU8OQ33yDrFeN41gC25Z@lists.infradead.org
X-Gm-Message-State: AOJu0YzQF3DRlMnINgS9JnC+TVfjUZRidTRYYZd5o5pLLj8CnuXjn6Qy
	4GegeyMFLSPTw0S4pObDRFNPyi/skf5yOG2ZHll1PdzocKp97bMfzLu1VkI6CMbvEkKiM6qd2um
	EDj6G1WrPcgWqDS15xJ0SvN6fEjAY1WF7ctRCMGJcqDuJo8GZ4vNPmXp9Xf8MIbRn1hsP71Eyvv
	oZgw==
X-Gm-Gg: AfdE7cn295ZSBhZC8AOzmtXgaGv3GMOFKSCT8IGCoj+DrgBYlzUSX/XwRrvM+0Nsf/J
	sZ0YCTYbruTA5CjC+7oF2/J4YIxTFpaZEkk0nlWeJPJHyXuE0EYqcbFfh6Y1nshOM+q08/jEM4K
	OZui54Sz+lMofYwGXAbzNpWPSavMtbTPnU77bRNFZxU43SPnEBzVH9hg9NaEYJ3Gcb0kvV+i+Q9
	NulDxsDxS7WCWOhK5qiTApzzZa9m8MTpe2TKbvlWuOIMNIxfyIvZPQ4zDG7IthN3pRbMpOyG5mH
	8Wnj4pobDxI22yFKjRY94pGK9ATk05gIS4FC1AlREDXF9tS/RVgKoc9UelPcdPKYYzfzi+GtEnx
	GA+lesf0z7JKHXQmdflVu0ipyDRPTD8IpI+70jak=
X-Received: by 2002:a17:903:240a:b0:2c6:c9de:cd0e with SMTP id d9443c01a7336-2ca7e75afccmr103763905ad.23.1783070600752;
        Fri, 03 Jul 2026 02:23:20 -0700 (PDT)
X-Received: by 2002:a17:903:240a:b0:2c6:c9de:cd0e with SMTP id d9443c01a7336-2ca7e75afccmr103763625ad.23.1783070600307;
        Fri, 03 Jul 2026 02:23:20 -0700 (PDT)
Received: from [10.204.78.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad789237bsm6382845ad.71.2026.07.03.02.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 02:23:19 -0700 (PDT)
Message-ID: <c72d2ac6-b1c8-4c96-a0c6-eafe18147ac0@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 14:53:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] arm64: defconfig: Enable ILI7807S DSI panel driver
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org
References: <20260604-shikra-display-v2-0-b3c1b2b67edc@oss.qualcomm.com>
 <20260604-shikra-display-v2-2-b3c1b2b67edc@oss.qualcomm.com>
 <0bbfd60c-236e-43e5-a150-93738961f3de@kernel.org>
Content-Language: en-GB
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
In-Reply-To: <0bbfd60c-236e-43e5-a150-93738961f3de@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA4OCBTYWx0ZWRfX/BDtNfjBjJnV
 EBb4qNSTQRQ2i1oeDLNRWg+ftzkKIfRC7kmMrlJGLZfU8GpXLE1gCxI5Nolv+3mu34fX3dAb0/3
 GxBFKq2SlFlmKc2ACOaiYESoEbwiD0dG263bZGEztLAZZ4Au4s+cf6Jc79rQQPvlguzCoP2eiXs
 //cQ6mVzuPIwuI6nykDKr6O5iha3rrEpSaW7ZuFLHK5xmAYtnABDkT2sBlZ7CEEMadpQt7PbH49
 /VvWbfHko5H8+L1bVivVzbc+ig0mbsK4c0UaAQf5aTn/QVUEI4k/HRZVPCvQgoptQ7C+Fy8yEK9
 wmxnwTRJuCYZI0R2l6F2O60unH/Wf98I/rBS45HxreaGfA17+jxfnirDnCoGUqk4L7foD9tAyXW
 uUvId+iKDkMoPcgEd5qWZLLgsyNSfl8EAN3AxHJ/uLCon0gCAIW7nnU2eus2KYpHORJkmo3LmGY
 1j5dmygAjpBqXrcmYHA==
X-Proofpoint-GUID: I1y43qZfCcmUPufNF04CneibcBxB6W5o
X-Authority-Analysis: v=2.4 cv=QbFWeMbv c=1 sm=1 tr=0 ts=6a477f89 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=TT0SokwCUCox7tJrE_AA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: I1y43qZfCcmUPufNF04CneibcBxB6W5o
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA4OCBTYWx0ZWRfX4A8QLskQ04R5
 gqsIFbFCGEATJ3i3DnfjSZvbUaLjRLV8MnDAvz+yo8y/tYsep0P2slh7ARwsGwzTpDLcotxqIgg
 mCKwqaLGqJI3yFZ4AptnDLJVbZDw2DM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_022322_757867_87054443 
X-CRM114-Status: GOOD (  12.84  )
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


On 6/4/2026 6:23 PM, Krzysztof Kozlowski wrote:
> On 04/06/2026 14:30, Nabige Aala wrote:
>> Enable the ILI7807S 1080x1920 video-mode DSI panel driver as a module,
>> used on the Shikra CQM EVK board.
>
> Does Samsung Shikra CQM EVK have it? I guess no.
>
> Best regards,
> Krzysztof
Hi Krzysztof,

I checked internally and found that there is no Samsung specific Shikra 
board. Shikra (CQS and CQM) boards have this panel and i am upstreaming 
for the same boards.

I hope this clarifies the concern. Please let me know if you have any 
further questions.


Thanks,
Nabige

