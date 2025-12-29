Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1BCBD3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 13:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1U2KevJnmKY84jN42Ic3+RugWNFdMyVeLE8MTpZ9s20=; b=L2zANHY32iC/Lj7DD2GG2C83BC
	fR1XvcCokN35d4mPxYgoyozKCwPbCYi3/CIEi+KP2khDF2sYS2LWrogaoUSkzdikgveBejCblDhvv
	7t9Q9fYdSDo5hZ684u0onUm0WeGokN1qWPYrdrRetjuNqFmwcBDSKrMU1UT/cpJ7CjYVf58VcdxkV
	eQ0lsUt8bGkAA1Ejd6X2ob/P7kDp3G4C6Aw54xqQtoN6NSwjv/55mzGWZncPL25Y8ZR+HRtntOXcc
	HMmIxuOo4sG66wstHDIkk0f7dc8O7TQR8Sby+OfMBov51m4ARaNdaseEmMCOasDAsOE4iaSQLYp5a
	Plsz06eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaD0e-00000003jJC-0R2X;
	Mon, 29 Dec 2025 13:10:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaD0b-00000003jIP-1izF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 13:10:02 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BTANdIv4190465
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 13:09:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1U2KevJnmKY84jN42Ic3+RugWNFdMyVeLE8MTpZ9s20=; b=ArypPUYPJymm+FeX
	ot84me93MTAVg0bKv0v3vYkVHfj1gkXhfUKwsWvlQq5eSRNrhxjjcoDKX0d4uYv6
	0XgmH6kvZ5R6VvWD77hqN1upOfmXBd0BjkvdOH1b9zA1x+GEqgiC9FLLIfuZ+sn3
	gf8dE+cduWrd6TiEKIWoyiY0yjYWKnV9ge2t4HG4Eu3MFF/lcgsh7Cgx4LeF4408
	OcrqSh2kvP0G7xNiPnrJnKwGUYfxuJ8DBzSa31qQqtQhtmwaUElEJX+ARk3xF3wy
	Y2bekP7sy1WNziNqamVG2WAfoWyuD7NeQlMtdBX9kYduQnOhsdc9jAJCyY9Lc7EM
	B6a74Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba7hscddc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 13:09:59 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1e17aa706so53379951cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 05:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767013799; x=1767618599; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1U2KevJnmKY84jN42Ic3+RugWNFdMyVeLE8MTpZ9s20=;
        b=RpnLieZDqAy0dgM025cjqN9lbsXmHARZDchB3r18jY61vMAHedqhFMe9F+cWIiTgs2
         qSUX9D74yy/bBBS03SeCTAAPLYO5QcuPIfcuyHjCbuVI+nPvpSAiclXPHT3G2IJ4ifx/
         1uVTBU5KPp65n86yqKEGWES32KDXICMOV+osJMRniil4CwOt9/xFOnhutmBQkHxHCxK3
         669MsuLt5eSu9igQ1+xj9D9WO6lHZdvaJCbLf78FrgtBM72OOhEZYmzdOxJK34QW+zQj
         7nZbiDxgF5ELiP4g5DdJxYO5G3n6SbkvZ6ZD77F7frEFM9djvj94WANMQNWzZQrxeIAR
         lRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767013799; x=1767618599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1U2KevJnmKY84jN42Ic3+RugWNFdMyVeLE8MTpZ9s20=;
        b=M8iLdFsIf3mgD5fEZlUPHLCU3e+iElelJ3dXZylSybQ/X+f0LRl979nIu7mWAtRTND
         zRLzqjKueUHg4JcZ0A7ez4RQdLf1uocTdqzg2OuTxmzBpg4oDSCmUS6oGQw1vkCyud6f
         4i84Gxt71H11BCbiYKAGPD8ksSR02BsmJ7aFVw0Axwwv5KR8iG9DoMhM3slAXF/+kyuI
         FWAEP3MuF9vCeozDRceFo9caqEHN3IUsTI8V8EjDF/MpUzvgqtARGS8g7HVY9UYx+nWt
         M5Z8J28InVjkhPuynpY937gTS7nzCsH6qSfy2AYPd9cgF7p8WoZinGCGLagG2xhA1Dg1
         uSXw==
X-Gm-Message-State: AOJu0YxqyO6drs4R4LnHOqzeDT8Xh4MWw4HMEF4RxBKl8zEZBWR6E63p
	X3x9BUM3zGLGFpuzwuGhHhGYN2w9sqpnh46wB2Ic6Kmkmlz5LYpHM2Nr6jRBZXFxec5myczB63j
	suMji5afds7V4Zy784bfWFGqomhIY2rQFgTvQgnktm5cJ6qUscFllpdM/96i899fLyK/esOqTnP
	Ka/w==
X-Gm-Gg: AY/fxX5W1DJz7tdqHnGEsqJHdGKsfc6X84KhaeUftyB6YJrLNvEQfDmC+KaacVuwbKe
	1LyW8alU2eUOXnUwVOeSyYXftL5nd8DNVtDFTm5/z8OO7v4fu0IBg+S0vxSsJEAJ/ZyUu9FDbaF
	MY62mgw71BA4OsKiIkrf9IKGY6Fxin6aDfS4+FDhzk54/MfdlaVdHV1Wcb2HhnhTScHV+T65iLL
	i1SAynGvtSampo/E65d1d9tJ7cyuYA4A9U03ysTfdjI9BCpVI2mplP/eiI3dh/qGLaa0ez2Sm3Z
	gyk/oW5H4kMwKdKFtwEAsCOyGv6y8etAXJe5r8I3MZgrXeKL4+LIR9iTsRowBDPGBKsVSJijEXH
	4aDfhwegjAZAYFCU1Zarx4DvDBVZNLnCYHB8+ViC96VYykkaCAJ6tSZ92Qsg+he6mZA==
X-Received: by 2002:ac8:5891:0:b0:4f1:840a:c90f with SMTP id d75a77b69052e-4f4abccd72amr343273751cf.2.1767013799167;
        Mon, 29 Dec 2025 05:09:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeFn+ULom0MaqOFCpJdzSzf47AT9NbQIchSG4rj+Gfty0bp0BAWaFjA8ywPw14vBH4HYDXuQ==
X-Received: by 2002:ac8:5891:0:b0:4f1:840a:c90f with SMTP id d75a77b69052e-4f4abccd72amr343273221cf.2.1767013798757;
        Mon, 29 Dec 2025 05:09:58 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b91494c0esm31675297a12.20.2025.12.29.05.09.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 05:09:57 -0800 (PST)
Message-ID: <47cfbdbe-1b73-4fbb-aa55-fd1b29ddbb18@oss.qualcomm.com>
Date: Mon, 29 Dec 2025 14:09:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 5/5] arm64: dts: qcom: monaco-evk-camera: Add DT
 overlay
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20251222095914.1995041-1-quic_nihalkum@quicinc.com>
 <20251222095914.1995041-6-quic_nihalkum@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251222095914.1995041-6-quic_nihalkum@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tMoOSidYTiI5ul9jFSWnl-NYjBTGPmAQ
X-Authority-Analysis: v=2.4 cv=O4o0fR9W c=1 sm=1 tr=0 ts=69527da7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=dh2O1nY2NKEWDLYW15gA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: tMoOSidYTiI5ul9jFSWnl-NYjBTGPmAQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDEyMiBTYWx0ZWRfX5h4lJ3K+T0bN
 xT8TWRLlPK8ubdP2Ahtqn7yQWuW1EUKe1OvQzg66QoL4sGnTuJJ+kN2ckr4bgGRwvHr/QKMvjOi
 YZ7HnbvHNWOyf1cZKGCQQ3Z1zVmYUclZ6UaFnRxqVjSx4uRluqLpAmOYjuQUDyZIS2BCrlAG269
 P14U8vPcFHDTQu1ZmB4RDbQpf2HUAIRIcUTgL9yHH4R0sV1BYatQfkdfa8cyv1smzgZf3csrowP
 6t0a6th7QwHyJbM2kFu3nr6axueH8wdusyxf417LowZ8IRIBue7o8DBv3bqgtGcAyF4E+FcohJ4
 UMbGkMU1X9zqMiaBLwWrUxgW5FMOPHNltwcFWkzSyZRB9GRBf5Vs+hrm4hpPtvK1lj62JY5PT8D
 vvLAHXPpvvmtd4Hd42xR0BAPCPEGy+72xCFZyKgns5UI9l3bAizfsqj1JcuD8tF10133zG/JL7f
 FogIlBfIl2K0Z4NP47A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_04,2025-12-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512290122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_051001_582193_F0EB8EEF 
X-CRM114-Status: GOOD (  11.15  )
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

On 12/22/25 10:59 AM, Nihal Kumar Gupta wrote:
> Monaco EVK board does not include a camera sensor in its default hardware
> configuration. Introducing a device tree overlay to support optional
> integration of the IMX577 sensor via CSIPHY1.
> 
> Camera reset is handled through an I2C expander, and power is enabled
> via TLMM GPIO74.
> 
> An example media-ctl pipeline for the imx577 is:
> 
> media-ctl --reset
> media-ctl -V '"imx577 3-001a":0[fmt:SRGGB10/4056x3040 field:none]'
> media-ctl -V '"msm_csiphy1":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_csid0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/4056x3040]'
> media-ctl -l '"msm_csiphy1":1->"msm_csid0":0[1]'
> media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
> yavta -B capture-mplane -c -I -n 5 -f SRGGB10P -s 4056x3040 -F /dev/video1
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

