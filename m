Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42389E68153
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 09:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mOdJWXBMhIvpFZRvEaBVaTcZ9cCxWbZXw+26UswX3a8=; b=DSJ+XfOBSHPfCOFxM3IzbCri4x
	FQRY8vLUTEVnTKbWErDUmKNKhX+Kb/9u9GPGQk3+Tk/QvF9NdTCvz6ULsRH3sV9sb07LPCWupB66G
	aCYQs9A/6QoRPZV+nfaETFx8MOu2L50V/oFCmHUuhf0R4k8hAgSkfXEzV+6pxU4rcv4tyuoEiS5g4
	O3piVO0ZWrafZx9fqx4r8MzEPTiPr3zuFyF/lANNNsARUD4Smc8Ev3/UUr6204BNdESGpKvg/Xkor
	Waw+ga0z8EXjwiZ9qsvEb0myxDvkfVAopuglDNrCh+p5DeEssGWJqbyIwKaIplC03vns56j8vnX96
	ejUdXLtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHWK-00000007xSZ-2E5y;
	Tue, 17 Feb 2026 09:37:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHWI-00000007xS1-0jh8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 09:37:27 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GL7gQG1613313
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mOdJWXBMhIvpFZRvEaBVaTcZ9cCxWbZXw+26UswX3a8=; b=feXbYHQhsk6KyW0C
	jcPzZ366sWvrGDbdYnV76NaLBOIm4/riC6VmAwtTajiJDBuKy7OJYlhgSLXVQSNL
	jHSQvPxwmOzKcHJUVcXFJGlDGuYUrzhghVraHuDfA6GBOjzDiI7SgiarKjiMtS+y
	cjObx9Hi9RF5rH6jsMxFOTFEe5XvkECBK+GAEUEzqbbXkaZxrLlQVEMD5ohGIp78
	7s5QA1mvtoEGZDHkhZkIDAWBNg6SSGRGuIGWt1mXeUPByvArbtxWukL/OUUHRK4J
	vctRiOxUlXZN5sbKOZRqTl0VHN0Oc78+kIV6bWF+F8rMEfR+696h+hThz5JVjWI8
	/M0f6Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc662sv9c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 09:37:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb456d53a5so308812985a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 01:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771321044; x=1771925844; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mOdJWXBMhIvpFZRvEaBVaTcZ9cCxWbZXw+26UswX3a8=;
        b=TPpLCzVMMEZbBapudl33A1FnzWWRgMp7gy57BoKSaQqkMnur1JXP6DYTRfPOoHIfQw
         ucFlG5Ht835FqNjVWB9WgfDGfuL4g0EY6HkM9sFENegSI+7okTDtgnwILnqOcnIkCA6r
         JYtXr8li0TpxSYZAtU0E3FNECocrd6j7O0gd5tr4c0R97CQXlU8juIAHOapRizfi7gwP
         BZYapAYaSOAvwEvc2DWFHaabeAK/2YPiEMMoisWHtSvXp6Z925/OOVZN0JXqnbsgsQxf
         dyVkDtLzgZUgzr+H+RL6XUZ7WuTDrUVKVCviCNyjGcr7lKL7hjF1pAezQxr6JOGZe508
         YQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771321044; x=1771925844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mOdJWXBMhIvpFZRvEaBVaTcZ9cCxWbZXw+26UswX3a8=;
        b=Oz4p6KR4+Yhf2p+f9jiKOsiWW492BGtAq9sZt7j+iWo326p11SG77hDHkoU4USTtaZ
         V7dsYBatjbM0WJVqJwEbv7khHRTmTJD3CzQMLszNvkrW9RsUG519kPatk4DnaHW8UOro
         DmseoKyU/IBk1WwoIQBZxvlP+klEez4BRjhciwtD4bK7bjLWToLDN0iwd8yjaYLRjAbc
         GvJcKfVXsWC8hPxarQRyV1dnULt9pfZg5msnC4dmi0jmztJZeNpRN0YFmScDlxsY+J3I
         uBRVXgY0if9cUw1MiHcy2862Tlk7iuE/yp6xBxyS+F1WXCQRwIr6+LzEKy85TPDcaSPE
         nDdw==
X-Forwarded-Encrypted: i=1; AJvYcCV6GsUmc9elnOIL+LSZ11v1cS3rb4VZGhAFKBAik7BduxXXHTP27Cy/rhqA8NSlKIZ2dnyqjj6Dp1wtKwgplxfZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzmUqCHGYBMgf5Dzc1xY5D+aVDU6l5Z1eVYrIi7o29ODqPew6Ww
	Qv7sqsjYe0rQCpBbXff4PzQk2Uz8X7NVzgWdgWazZtpDi6mGuuH1wCCEv63tKihgPN8uAjS2y2T
	RRSrJKExSWLx8h8igDKVId3UuKRd64qEUD2AchwhX/o7G70npZqTrwF8fg0Vhqpu2VxnbJat6nm
	LV9g==
X-Gm-Gg: AZuq6aJdkvzmuGwiGjYVlVY41A9vPEQDBDLGB+C9atb/ewueLuBG6TnZczdE6NmlJd5
	BkRXG9sFPBct7XQWhkV0L7cAtugI12fLUH8aABRNF/jJZj2HmRJg0G3iRkNIkP9cByAKGbKmO2c
	0UYxWzJhEqF5Mbg37l6cmuuTRna/4AcQfl4MZ0sMjGjQ3gThMCXv1BsUoF4/o1W1IeoklbOYVQF
	E+mmfYktOPUeIsQ1EOVa//sr3iuE9A7XGYQkMyrv2Re43MWAkkl2ZJ8ZOgjoaw19v3RCfna7dYo
	0P8lNa3OfbSzEVg6wwzUJXAbiV+lL/ahMYSl+ms3rOKnbXRr3yBlOwfVEoX4EG7mSNhvrbao1gm
	+8tQGRMbLfhOP9AGX8fLFsB0TfVNRH/MdIF/hdnuxS+A8XWW/Fdwp2Q8unlSNS4fEi17VfzWXs9
	MNMRE=
X-Received: by 2002:a05:620a:29d1:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cb409141eamr1276350785a.10.1771321044284;
        Tue, 17 Feb 2026 01:37:24 -0800 (PST)
X-Received: by 2002:a05:620a:29d1:b0:8c9:fefa:89d5 with SMTP id af79cd13be357-8cb409141eamr1276347785a.10.1771321043876;
        Tue, 17 Feb 2026 01:37:23 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc7691f0esm337654766b.60.2026.02.17.01.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 01:37:23 -0800 (PST)
Message-ID: <1653cdde-4db3-4473-9007-676a5bb23e16@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 10:37:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: dts: qcom: lemans-ride: Enable mdss1
 display Port
To: Mani Chandana Ballary Kuntumalla <mkuntuma@qti.qualcomm.com>,
        dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com
References: <20260217071420.2240380-1-mkuntuma@qti.qualcomm.com>
 <20260217071420.2240380-3-mkuntuma@qti.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260217071420.2240380-3-mkuntuma@qti.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA3OSBTYWx0ZWRfXyEiNMxVn4ZSM
 sq3aGI1Rr07KnMn4mnLqm/nW2F1UbCTUl8sfzDgjs6hPwavboqESbu/fatJDiw9jP+VSPACuWAT
 HpocUK5O79IesUaLk86ciO5p2z+y6hxe3xbMjeKaZa8llN5oHF8n17n7VdzsvCmr63/6Qh7GB0m
 y/3wy+vRFOQBQ7rQNHstReF6ZVvsZX+rp/EmNjdXPVDO8TP3JZfYhehkw6ba1NTg3zgA6Ns+PS5
 /MhgP3+0XQUjiH+6eVRCRygFyIzIIWOO/BLjfmdk5+c+R1obj0q97WD9wzwUwWFteMkPBEud3Ty
 hcwHlCZqZtnGO4n8SeCfuVaJ82MDIr/opCX9AUIt3EcEfRAypMLe5opP3vn8TU2Rhhazi6DfciJ
 19kCud5DGjwu7IDE576fsRX8Z+G6jvdAlt+b134r7+w5HkIgi9v7Z6IS2ePefEyqaodZkRDo2Vl
 SmsjDWO9tk5VG+3RMvA==
X-Authority-Analysis: v=2.4 cv=Y6b1cxeN c=1 sm=1 tr=0 ts=699436d4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=XQLX8yjaJUNYVVxXu1AA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: soDEK1kCyK8-eP2S7LVU7k1qWwL6RHTO
X-Proofpoint-ORIG-GUID: soDEK1kCyK8-eP2S7LVU7k1qWwL6RHTO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_013726_339349_ADD2094D 
X-CRM114-Status: GOOD (  10.10  )
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

On 2/17/26 8:14 AM, Mani Chandana Ballary Kuntumalla wrote:
> From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> 
> This change enables DP controllers, DPTX0 and DPTX1 alongside
> their corresponding PHYs of mdss1 which corresponds to edp2
> and edp3.
> 
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

