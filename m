Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8314EE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 11:20:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s/TQKENLvmprGOW1/Wu3SkBKRJf47l5oWgnMdRrCuEI=; b=QkpOe+89OianHWzaPRn9/ESzek
	wU03H6z7Ps5X7vBN8IdlDL6A1hdbPSzOmSxgFMGE/qzGqGc0RePwh8wtCVVwGi+pB9Z/1I6sN7ABO
	3x7022TkeTaWzIZ1bXt3u/Lj7xXMR7vf7/7cxWUIBaJT+BdNo+0g5SLoXJToudLYhkEK+GNOS4YXN
	HrF1xVPcJ+QSjmKZItLqsUqQ9lhz3puE5eoNTrJ/vW6MGOu7QmVCQZ810Q9vo5DQVTjCrCVVjAUOF
	6qlb6nuqsTV1fkdvwZVSSNu2E7xPuuPLy3T+djJ1azYso8RBWzJXdpDTLRIqtbX4GD8JYPf419exv
	8OMJVqNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3iE-00000003XMk-2BhD;
	Fri, 13 Dec 2024 11:20:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3h9-00000003X9S-3pFd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 11:18:57 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BD81uDR022379
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 11:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s/TQKENLvmprGOW1/Wu3SkBKRJf47l5oWgnMdRrCuEI=; b=FHRzpVjjz7wcMkwZ
	W27T6yxjzvmsYuiPzmedpeP4fEPqXr6E8enQCfNUhY4r6nSV2kcTJr7RhBt/QpOf
	XPwzkq1E4DQzdNH68VWyfT66rjvG1ns0/bS729Gca1mYJ6TcrmovRQcUkCTYrhkp
	WYvZEWlTuDym7+K19apfTZoHxejNVlDKG2s7sZWJbE20KWTknV6R1NhoTVHmVDI6
	lQg1xzYmwvGlx9r8oM/b79Tb7ehQkCej9xGeeswx5NtAg1NCsf1uXTc+6yXJXqA0
	9uXJiWzyZCJSmtlzm6ChMHl7RP6S4M5ZHMT098GGtDJG855QmqCAcUjTM5sh0qsd
	TV6weQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43gh270jx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 11:18:55 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6d881a3e466so4102966d6.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Dec 2024 03:18:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734088734; x=1734693534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s/TQKENLvmprGOW1/Wu3SkBKRJf47l5oWgnMdRrCuEI=;
        b=pKO/IEqVlFtOy/u2gU3kud8HjURMDr64AM3t7tZrDMLiZzw8jJXM0O+xpn6X6oKmDb
         PMbEbtvbMH5exDKm361rrC+f/ebHctglOL0Thk/wz/hsNARWkVtusAa8n6gCCEkpiJSf
         eUjvFO/uqEyhd/kTya/RcLwmBeBLMtAJS4vxR6iy6W76Io9NLM3Rk5dIcoWtQfXWAyIN
         aJaldiDLllnPuYjVOQ4/3dXFVu8zwX3/fd2NNGSjtMipH+OVNSZnwWsY16JQmCBfkVqz
         1Vd7EvSOnxC7nI4YiFzcOOoMTYBNsOfHgWmbtphQ0ie101EI+89VwWCo+uHo0nKn4K8H
         iS0A==
X-Gm-Message-State: AOJu0YyiABrNOAwWMauWCzBkXlNVdddyiESBLgigy1rWg9SXzLcoK0O8
	3TgQrKbG8ml3xMwa8qXt4+07TvPGA2TSaDdLnkYbMFfeO4eExcMG0f9bPq6deRKfbhwPI30GtT+
	2rigfgp/etLYkLk0Agb1+CInWoAKdhdijp7Ehema21T9iuG7gh2sA+gSwwMH4Vw8jaHYmrt2Uuw
	==
X-Gm-Gg: ASbGncsaj1GWAquZjZwpdFe4Krxc28PdDM2Cw6E6YxwaRgNY4NrHOmObCze66CakLPg
	KBsW5eh6QC7RDoHiEwK9yIQ2aOvS8+MR+iocYRKhZUNWM2Qhl14H7c2hPYByYpfZkLKYSGlcdTT
	iNlr8knuK+P2NcK58t3nHRJogOQqlQo8GqfIDGYeBVJdGchzJBWidt/bFCR7sAUtACThTEDrYck
	ww/AInwPtXEc5rdkf0HTv75/iN38cM6Cfk1WRyool5fqyxTfx2Fk17CvP3Gb9kWc0Qg4Fe9Tspu
	qB59skE9ghJ+j+O5JtbmwwgxFXoT8YIH7ifP
X-Received: by 2002:a05:620a:19a1:b0:7b6:c6f8:1d28 with SMTP id af79cd13be357-7b6fbce2263mr128316685a.0.1734088734263;
        Fri, 13 Dec 2024 03:18:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBR+cUBdvb74XuOejNI9mYSykpjh49aeXCJst5j85GNfPlE4TY4ja3JXn/U1G43w2NwwSbUA==
X-Received: by 2002:a05:620a:19a1:b0:7b6:c6f8:1d28 with SMTP id af79cd13be357-7b6fbce2263mr128313785a.0.1734088733880;
        Fri, 13 Dec 2024 03:18:53 -0800 (PST)
Received: from [192.168.58.241] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a48ab4sm11339660a12.27.2024.12.13.03.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 03:18:52 -0800 (PST)
Message-ID: <d397065d-80fb-467e-bf41-0f5aad882a15@oss.qualcomm.com>
Date: Fri, 13 Dec 2024 12:18:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom:
 qcs6490-rb3gen2-vision-mezzanine: Add vision mezzanine
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        akapatra@quicinc.com, hariramp@quicinc.com, andersson@kernel.org,
        konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@quicinc.com
References: <20241206191900.2545069-1-quic_vikramsa@quicinc.com>
 <20241206191900.2545069-6-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241206191900.2545069-6-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZUJXakd497tJ55c6TBOkrtFgeX0LId6F
X-Proofpoint-GUID: ZUJXakd497tJ55c6TBOkrtFgeX0LId6F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxlogscore=864 impostorscore=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412130078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_031856_074730_FE00F310 
X-CRM114-Status: GOOD (  11.11  )
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

On 6.12.2024 8:19 PM, Vikram Sharma wrote:
> The Vision Mezzanine for the RB3 ships with an imx577 camera sensor.
> Enable the IMX577 on the vision mezzanine.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -v -V '"imx577 '19-001a'":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy3":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy3":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> 
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video0
> 
> Signed-off-by: Hariram Purushothaman <quic_hariramp@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Signed-off-by: Trishansh Bhardwaj <quic_tbhardwa@quicinc.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

