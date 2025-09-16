Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64527CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 11:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OIclFIP+LOqTqDxbmvs6AySAEMGiS2FOLi7+K6YMV/0=; b=zto5rB4ooLg1mx0wSWpRhdZqHL
	TIy4Oo1g2M6TnPSX2iflR4QO24Rq0nC8fOVgu3zx51+1GH2STMOBY24fC8JkMr2wEYov3Wni46h7j
	7wWzxg16htsVu1IAh6ShZWFOMwrMunzeiUKbtFleqxe7lTDDuahVmBnt1LzBQnclyba532CDfyZKK
	j+83sE1mrdg6HUutj0yVNHk4TxvofpnD5WQrcdPkXC4bciSVxJVk1aTniPGD4ii8Dk4hVV+nd0U0e
	pMiO2aZGtWlB/Ug4xxOgiSH7DYoJeUZ0N2PMzHuBKrQTkr41mpwRgJyknU2A4h5RJqOslL/8yOmjP
	ObIDmphA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyTb6-00000007dTZ-1Vlf;
	Tue, 16 Sep 2025 11:11:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyTb4-00000007dRm-0S4u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 11:11:43 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA6Z9X020776
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 11:11:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OIclFIP+LOqTqDxbmvs6AySAEMGiS2FOLi7+K6YMV/0=; b=ERQxo6t2OMvGWd2C
	Np11Rzcvp7p8epeQb2kAN3KDNiQcU+WtMF0pYiEIoeUJQWR4eZDHsqLroLzKitqy
	8Jtu7m3399Fq6HXoUXvQi4SiaeFTVVedoI2BpFn0tjCKlwOePfX0LUmAqDdx5knp
	k03qlq+oClSrMoogIUnKYu7ElFtG3C342E7xw2vGbdKKB3OQ3MU9AZBR1Xtev5eB
	v7Nfg1Nf6WPlYxrtNGr5cWETshzlMsM8yHDcVQLJzQWjbqiecuXVUPiBuqlg4SPG
	0A0Vw/ls/BkS4I15igj39/q9rXLNxBNOcqNHMOdsp8avn2vB6hVHIIHAY6gB+32G
	e429/A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4951chgjr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 11:11:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b604c02383so20953771cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 04:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758021098; x=1758625898;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OIclFIP+LOqTqDxbmvs6AySAEMGiS2FOLi7+K6YMV/0=;
        b=KhvGjhlDV9rQfS6t8Kv/uaeEMExZzw3RZpdmCQfEFhHtUJeiZ1rDpyteQGmqcaHm+e
         gopCpcPDB0DafRiVQguxLVJufXnNuR3sf8fE3VlnvCDJbnDXZuV2PdNoFjduWo4r55Rb
         vDMn3ftrLiXTXIImC4fixC3jkKr2DbO9Y4ITqq1zMAjTWArUVjhNJN7K3Zg4P8kvlPG/
         rPWrA5rEgXRcIfJQwmKorL5/M+UEx+x5C1faetxWD6ZA09MeLyNRAmc8BohUnEhyMO9U
         QyHB7nkQPEVZRSI2Qhthn50VVURuDWZGcDh0ko7Wio5EU5YRgGzxvrZUMAQI0kfXILeJ
         JkOA==
X-Forwarded-Encrypted: i=1; AJvYcCUQakjOQDWxyeX3PwgJvhjxtVsn6MTTGhgS7JZey4DtLLCGUOxSu6676uRIMCWDAI5PMz1/HnX9yNP6bQCKP77a@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1G6jxWBVdUNX76yU18g+3M4RGJA9D7jKSBYX6XF0gNyMiuLrK
	99uvZ7HgYOjSp/XmnEbUpgyoe6FvuQmMV7IfDatKS8eue1Q6+z7C1k/eYNmxVG0bxGpKSSD1FMB
	rDUHMdPfJK3Q4BdjhKKBCnR4sRqb6vTxUoQDRAkINby0c2PMR500y/e5CxIZhaftUtTxxJgMOC3
	ygYw==
X-Gm-Gg: ASbGncvrrBUQfr+sBWHYk/a8ADVAJswO3TfLSkQqKK1D+DZLfehoLQvyCvKX5TxivyX
	jQppM8Ue8AN7rDKlPn+ro3o56eI8vy5TIfuj6C3CSGtyHqjuVuo6qmaBjExGqioe4/pV/bkELCa
	8QhoxrpjhQ192LBXE0Kt7HxTTR8oqOlUWq/QbcVw6crl7qIiqgqBfS3njrZKDQL4vpg1HVotuSk
	Hx7VyqgW78w6iwZQydhzGLv8t83HNofFF2XTA2Lr42ju1DUh07hIhZWN1nxW+5rF9W/Wx85Mtam
	lStPftEK2eUNlfMyyjewnIkO/wltDmBwSMZfZ9WvqlX4axlIWhKl+crCCv0oIndD28oDFR1eHqd
	OpZ8fw7jwKQEzAq/lXR49oQ==
X-Received: by 2002:ac8:5902:0:b0:4a9:9695:64c0 with SMTP id d75a77b69052e-4b77d1158c7mr127005541cf.8.1758021097875;
        Tue, 16 Sep 2025 04:11:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnXuilj96k6BuqcLnJZYaYn30Rx4rGcsXCSnzBEldqk8rQYINLpEqXJPXep1f3KK1X9KhUTw==
X-Received: by 2002:ac8:5902:0:b0:4a9:9695:64c0 with SMTP id d75a77b69052e-4b77d1158c7mr127005221cf.8.1758021097349;
        Tue, 16 Sep 2025 04:11:37 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62f416db508sm3834982a12.32.2025.09.16.04.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 04:11:36 -0700 (PDT)
Message-ID: <49d6c554-e6ed-4c86-8946-be2cdba659d0@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 13:11:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: qcom-cci: Document qcs8300
 compatible
To: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>,
        Rob Herring <robh@kernel.org>,
        Vikram Sharma <quic_vikramsa@quicinc.com>
Cc: vladimir.zapolskiy@linaro.org, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_svankada@quicinc.com, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ravi Shankar <quic_rshankar@quicinc.com>
References: <20250912141134.2799078-1-quic_vikramsa@quicinc.com>
 <20250912141134.2799078-2-quic_vikramsa@quicinc.com>
 <20250916024858.GA3574831-robh@kernel.org>
 <373bbb78-2b0c-446c-be97-53b82edeed64@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <373bbb78-2b0c-446c-be97-53b82edeed64@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eeo9f6EH c=1 sm=1 tr=0 ts=68c945eb cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=-IwCPt7gIHNx5Q8nY1kA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ZWjTzFLrkv65iRiJb2NM8vV9gDKqFhA0
X-Proofpoint-GUID: ZWjTzFLrkv65iRiJb2NM8vV9gDKqFhA0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzNiBTYWx0ZWRfX3wrxokOZDDo6
 lbJh+8nPzmmopVEqFfWF0pKwqrsztCkMXHpCzagDG9xX9+r2jIQz6fImhJEx620h7FhFCQH5TT7
 Ks6z5cYowVv1jv5ikRtnpWszghAyFTJ/JZCG7sp/ZyDnkFwpozvEmhwYqzWT2k+/jpkTBwWEsgx
 ouWHFzc+6lieMyLJieDTm6lq4yY6s1kOfPSEL8GZ1UGe6M11VidcFvRV/e2lAsixbzzBtzsng3q
 4vmVcWO8ihhBm8Rv9mg13nWNF23G+a0z7whMzVLbvvIL3awdmvE+YxVYHHuTfWmmlec/9XuwwAx
 wpnlmeiBTDAuV98XhcGKejPctk7yDEubI7dkSCrvS/eBIV2zf+kRLYxB9mDCIbiiPG7okzgQALD
 GkNnNYOe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509130036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_041142_169004_55ABE777 
X-CRM114-Status: GOOD (  18.45  )
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

On 9/16/25 1:07 PM, Nihal Kumar Gupta wrote:
> 
> 
> On 16-09-2025 08:18, Rob Herring wrote:
>> On Fri, Sep 12, 2025 at 07:41:32PM +0530, Vikram Sharma wrote:
>>> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
>>>
>>> Add device tree bindings for the CCI controller on the
>>> Qualcomm QCS8300 SoC.
>>> Introduce the "qcom,qcs8300-cci" compatible string.
>> Wrap commit messages at 72 chars. And explain how it's the same or 
>> different from existing SoCs in the commit message. Don't explain the 
>> diff. We can read that ourselves.
>>
> 
> SA8775P(Lemans) has 4 CCIs, while QCS8300 (Monaco) has 3 CCI, with the 
> only difference being the GPIOs used for SDA/SCL pins.
> 
> Currently, the CCI driver probe happens through the "qcom,msm8996-cci" 
> compatible string. Could we use the existing SA8775P compatible string
> "qcom,sa8775p-cci" or we should remove it? 
> 
> Please advise on the preferred approach for upstream compliance.

Try:

"""
The three instances of CCI found on the QCS8300 are functionally
the same as on a number of existing Qualcomm SoCs.

Introduce a new SoC-specific compatible, with a common fallback.
"""

Konrad

