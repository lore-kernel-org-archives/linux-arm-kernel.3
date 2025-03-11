Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9EDC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 20:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sLQ0KfkPCjPMLHw7BAltp915xh5O2lt5LV3V2oD6d0M=; b=rUExXpHeI4uoHXNVU1E5qiuX8b
	OK3yQKrZA7ppL0bhfc0SYtzCyzHMe9gwSe44Vod4kBmcWEHsbJuiuL3wgZ9SdRbPqul3jM4/7/NIz
	NnfnmOeeLRaSZuuowmSZBejNCTY6zYJ1wFPZ6g2NW7t5czn8r9pGpSplQS9OAk1F7ZiCcArGBD0hh
	HuNnHnHJxCONgT+5euI0apBNXCLAO4Vy3ODr9zuxpW1kRi+13n+LRln7yc0eJE0IAE7BIs/Zyt8nL
	UuzLkWDnqYxKY7twM5SRkeAM8WZ10htNgtf9OWzKXZObbDVeSQStXlZptMRWvhf3Xq6VlbXUf5aMf
	EXBz7YQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts6RO-00000006x6z-0PVM;
	Tue, 11 Mar 2025 20:43:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts6Pi-00000006x0O-3xFy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 20:41:24 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BJ8Tgj007883
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 20:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sLQ0KfkPCjPMLHw7BAltp915xh5O2lt5LV3V2oD6d0M=; b=cC2SurdNVwUQoYPo
	XNVWb7PcK08yQ1KGspkyZOFlwCHI9Q3KPQgKnnG80HuIlAOHDP1N9AgkY6ffD+NU
	ZUTZSgKMci/LHohJ14A4M/rms8CiwOCB7oBZ3FSreIzRLTmUnP7ZngkBeXhvC8ce
	6IjP5+WW2/xfMV1t4e67sRMLKmw/IGjXkq5AENHB+LBffdL3Y1nDzz/dJzHZkV9K
	jHlkmrfcDE2LNvb7cSQ+HpakGSoflGKyhWlQGX4NKgyPnysQkMl1GwqHBWpt0+p1
	Kc3BxiYxFoWO4vsOht4JYGTZA0VbTxTFqnNOm6/+1a6k95J4Zkb7Dzf559Knhgdo
	ZcSwJg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2r86k7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 20:41:21 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8ff8c9dcfso15519046d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 11 Mar 2025 13:41:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741725680; x=1742330480;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sLQ0KfkPCjPMLHw7BAltp915xh5O2lt5LV3V2oD6d0M=;
        b=USBzfqbb0iOa2ZfuU6dDLejPUEKI40kULL9CgVJ20TvE23MAgSD8J8D6Sq16pERtuU
         mvAB9JnJXwq3JwNeDuq0VRBKLnQX6NlUJnSLN8ohLCVZCrfMqCAmqSQf+02g1XZIkaoy
         ucGLRcfVwzN/2U3/Vj44X5w6gaNberT9CaTo3IVzYn4QUmvGZlFQdBhmPVdencFTlrDT
         ReS5pPvEISBitIP+wnypESAx3BLH2rYzeyG8HTGIScaO27uTgTzdlhn4gen4UpQwVt2b
         2I8cPiVJchJNrKlM2/bYvZOYFzSWjSr8oyMIKID/yEXtrBay1JaJNO1cv+PsZO8au3Lw
         iClA==
X-Forwarded-Encrypted: i=1; AJvYcCVDUyVQjOP3MtCj4D8hLm1P3BcVXnm863R9TWJgU19o1Qph8QbPqaE/TQbVzOW2xpMErnIS6NkIeYzJ5MD6q7iF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2fMHWT8RDVM/m1TyI1sxVa6w7cEGQJ15ZxTuelRRb8yVRrZom
	dcVBluQqT9JVP4hGMXkM5j28TaYMmdiqq3inPLe/nOhCBvRe+LHcEk3jlSezOqJo8Pf3X4GlyzX
	1ZT+i28Eq77wRLe09j90tLqY3XOvij0bPMsxD/CmaLpttwFG1AO6FRVAdiVn41FZ0nzGCV6il/g
	==
X-Gm-Gg: ASbGnctHcVTRxxXLkqInQhwUlD5wWprGj2TT9Gwe95hbQIK8FIfGIwsix/AYKPp4P70
	h4/XAo0MaT9UapvnSPb6fsAZYolzRTNlgtbpB5GxRCmtSb+5G+DJPPkeo+HpQ8JjCp5nUl+YeBa
	BxHOVm8UCE6TeiIzM+7qnvu+8D17hTHyQfEZzyUOYvIRAGWoMhaxme7C0OHpUKV0sxG+C0EdIeA
	jtbpFhIXRhZW+hfPxVxur/0h7UVNXl0Oa6Qw7r0LOwzaTEX/P7pzXWwdiEiRsq3/gBupOLMFiKD
	koHqiJfmqBGFx24XQi8asqaJuxWxcilpDFL7I6lMPrAaQnQPwf9MZsubHALmJdAcxeoB7w==
X-Received: by 2002:ac8:5744:0:b0:471:f08e:d65d with SMTP id d75a77b69052e-476994ee814mr19232991cf.6.1741725680682;
        Tue, 11 Mar 2025 13:41:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLjlOtUEUcX0M4fUSeDJ1nrMjWHMrBRLf1b3J3Ujb+qGO/6L9yMLIkc4n/AftEhJfu3e6x2A==
X-Received: by 2002:ac8:5744:0:b0:471:f08e:d65d with SMTP id d75a77b69052e-476994ee814mr19232841cf.6.1741725680327;
        Tue, 11 Mar 2025 13:41:20 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac27af7fcf5sm609665966b.180.2025.03.11.13.41.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 13:41:19 -0700 (PDT)
Message-ID: <827ca00b-a895-4aab-bd1e-7866df730fef@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 21:41:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: defconfig: Enable Qualcomm interconnects as
 built-in
To: Dmitry Baryshkov <lumag@kernel.org>,
        Christopher Obbard <christopher.obbard@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20250311-wip-obbardc-qcom-defconfig-interconnects-builtin-v1-1-675b6bc57176@linaro.org>
 <vjkdwjudqsgcq2leabscnb2r5dbtztgfq3jlkfowcauslaymkp@qsxnpis3ksp6>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <vjkdwjudqsgcq2leabscnb2r5dbtztgfq3jlkfowcauslaymkp@qsxnpis3ksp6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D6NHKuRj c=1 sm=1 tr=0 ts=67d09ff1 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=R3joX-Mc2FtLiZgaDpIA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: nzu4ekY_7IPLEviF_o5lrpmvcLDbfOju
X-Proofpoint-ORIG-GUID: nzu4ekY_7IPLEviF_o5lrpmvcLDbfOju
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015 impostorscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503110134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_134123_104411_9281987B 
X-CRM114-Status: GOOD (  16.68  )
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

On 3/11/25 7:52 PM, Dmitry Baryshkov wrote:
> On Tue, Mar 11, 2025 at 07:02:56PM +0100, Christopher Obbard wrote:
>> Currently some Qualcomm interconnect drivers are enabled
>> as modules which isn't overly useful since the interconnects
>> are required to be loaded during early boot.
>>
>> Loading the interconnects late (e.g. in initrd or as module)
>> can cause boot issues, such as slowdown or even not booting
>> at all (since the interconnect would be required for storage
>> devices).
> 
> This is not a good justification. It should be perfectly fine to load
> block drivers (including their dependencies) from the initramfs.
> 
> Up to now we have been enabling only those interconnect (and pinctrl,
> btw) drivers, which are required to be able to open the consoe (thanks,
> systemd).

(non-earlycon) console is a better argument here, though

Konrad

