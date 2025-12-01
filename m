Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59F4D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 14:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3d8sQcDwQPK78J27J6mXt8OqnGzf15lwl8xqUrKNYOA=; b=atoTm7K4EB/w39cK67kS6vVLQc
	kNzagKSy7/iMMg+dSRKQc/TUBZu91D1+gSrtCaveJywf8GPbmLfKmAxRSM2srg/aFf3fK0tHb1Ykr
	OPbYSxBYyF7eYdkrSo92UCP3ePffrUP/xv6wo4L8MkZGz+LlKLGg6LnyDWXruhwXU4kD5ST290EW2
	JoNOvyqMM1+ZFI2et+8G6/rMOMArDMwYiLLSFkzDgh3qUy4fA+SL+pejPt/df1DJ8udP90UDpscCk
	3ybs5qJBGoNAIeILrkrG8yZBpzXwUUPI5BwfvyKCdBbKtBf5a/vrknYx0oqDA97A8biFSwkzEtwE3
	EOTTQ/eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ5Me-000000048bS-3bk5;
	Mon, 01 Dec 2025 14:58:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ5Mc-000000048aK-0Hbw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 14:58:55 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B18geg73433322
	for <linux-arm-kernel@lists.infradead.org>; Mon, 1 Dec 2025 14:58:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3d8sQcDwQPK78J27J6mXt8OqnGzf15lwl8xqUrKNYOA=; b=Uy9k/Jssl3Xr4sJ3
	IG3BZYTHlVsi2lV4QyO6Ko9muB0u6Hhr0+Aut0Osei+a3VLkqdMkRPxxo8L+mgWu
	yRf5hWPyv8AIrEOTLvCrfxOjlCzwmcEzYdWXG58f+YZ7jxv/IMrH591zscCqBNWP
	0CXK0iZN3g8qKnTJS30RaZVjW6IaRxIfJry79A88RoKNxr8VBVZ5XDxErimaDhr1
	4F+nvLkwn5xH+FYZI9eEdfvx2CzGlvTJ7q+VdoY4Q6qSXT94j9/kjNWc+rGh4WXG
	DzA0H61ZnqSvfbIOsc+9G4cvLJPZe3no/8nLLwFbc0yOBKOF1Wn7fTghbAt1ggy3
	fwQtxw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4as7re118a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 14:58:53 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2fd6ec16aso64978185a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 06:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764601132; x=1765205932; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3d8sQcDwQPK78J27J6mXt8OqnGzf15lwl8xqUrKNYOA=;
        b=N3fUeWTVIVN/rpqR43OFG9Ztw18sHjLAn+/ls0AzUj3cCWd84WB5OebLqn/HoyZhIP
         581imV6eCcXlCsCsxk1h5xTQOehsHnPlJuXRzHAcDXN4OKzhexX6ZVzgYpmOPS3rs2o1
         BcDM+HAQRUZMXHerh1B2s409wVR24sOIFdURDZ9KyHu00D/Ezdzbi4Ir3XjKJQUVUBpO
         YIVOLv92vg1sISBGRm9G7yeBuj93l1Gx9twmUuwBoCeT30ORJX+0tTIuVQK5V4JMsvAT
         w0sEEKShb6WoA3z3swVg/4sU5D6o/lE9dspkYvj8mzpT2VKTR5/GbH7tK+dfx0uSM6wW
         BinA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764601132; x=1765205932;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3d8sQcDwQPK78J27J6mXt8OqnGzf15lwl8xqUrKNYOA=;
        b=wU+NRr9vbn3AySGI6zmTNahQBxJGNUmDEjaVMcW9S8Nok7Rh/d36Uzrm3iFheSWi4o
         Rnt+leyTeNrsvwLC7BkWvwFvOU/l0SYhgfFM2IZBTUkfSf9I0zMPwrlgqmpMRwmrRtYK
         raiO5bkYJnC6ikmJ7XGzD3Vi9QoywONtVeOzcL3rzuICw9BFU+jf298Gws4TJJSLNaJk
         Py+kOmDNr7XxK1ntJ36fru/XmHHhQX97/FaCo/YlaIpIEZXlF1U4s8oJ/1wugiZyYZBd
         1zR8aUCsX2RxeZVCoNurdHibqjv/NdigK1ZUs3OLUUrtyMCZzU1IkKpcjC3sUYcSoWTM
         EHWQ==
X-Gm-Message-State: AOJu0YxZ9CAeFDBaa/6xq8g7+tBUKqwxLwGWLo5GGyndzZrjJreqF19l
	hfvRFKyJpbWK1zOcIkbzts820kcLd1WrIFcGQU0qf2xKqArx4M1lx0ooaLlhRWxY7CugWQxfPs/
	0WHv+bSk6HNfexQRG2vKTemK1JKoOqUAKMeVdqRQUFupXLv74RCnPUAYuZ5xJ1qez/0sRRtkXyk
	e6Vg==
X-Gm-Gg: ASbGncvAW5mM4iAmhxUSUdY176r3RpCnbOQKxnreq4BDmsectGguMDpDCDEud76v94L
	lBWOkEzj7HK+3CZV5v8uZjPIrLnmT64aO0Q5W7rPSYnAFKNma6/JMXP/Nq/eWjmoDiZixS6piZM
	qWCoJoqg+pkqvLTLMOXeCZQ83+hI9Zd9Du6vKVdqXeaYBa/Xhb2AjeEq+c4AiOB3UhngcUSgNQu
	UXfvGKuLgaeJj1dgl2USg6eHHDcbWpFiOXBpF+jLiOV10OfSBu7yUUmaB1PPRdYJdn3fKhg6+ug
	kZRHGuT3n/HhzFwMGlBRxKWcnae6B82PXnkgs15iMSFsNLP0J/c+smkBhKuHFtTqBHNSDwJmB65
	oouElbyqXfCvCqtHJLnpT+ovQMyLNhDYy3gW/pHtqcfBtqAoPa+pKHCtxzvOPXciksC8=
X-Received: by 2002:a05:620a:4609:b0:8a2:568c:a88b with SMTP id af79cd13be357-8b341d51aeamr3765909585a.11.1764601132253;
        Mon, 01 Dec 2025 06:58:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvdChHYrp4lDEpgkA9p44tKoa6280uvB4pPk0o+kOM6TSHwYl46FaoIgjnk72rNAAZxAzKbg==
X-Received: by 2002:a05:620a:4609:b0:8a2:568c:a88b with SMTP id af79cd13be357-8b341d51aeamr3765905785a.11.1764601131779;
        Mon, 01 Dec 2025 06:58:51 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f519e2f0sm1255891266b.21.2025.12.01.06.58.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 06:58:51 -0800 (PST)
Message-ID: <e65c9149-47c7-49a4-8076-0b8ef161997d@oss.qualcomm.com>
Date: Mon, 1 Dec 2025 15:58:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Vikram Sharma <quic_vikramsa@quicinc.com>, rfoss@kernel.org,
        todor.too@gmail.com, bryan.odonoghue@linaro.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, hverkuil-cisco@xs4all.nl,
        cros-qcom-dts-watchers@chromium.org, catalin.marinas@arm.com,
        will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, nihalkum@qti.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>,
        Suresh Vankadara <quic_svankada@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20251126081057.4191122-1-quic_vikramsa@quicinc.com>
 <20251126081057.4191122-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251126081057.4191122-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: b26leoyu6JMZFODbZpa6PxgST-SPY0jf
X-Proofpoint-ORIG-GUID: b26leoyu6JMZFODbZpa6PxgST-SPY0jf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAxMDEyMiBTYWx0ZWRfXwIBixrXU+z8N
 WnLdqKlr35qlG9DV/zkcYCLOPbHTmL7Tc5zkpXU8DSQeJI3MhUQfxObU5jQ2dhmCPQenfrPoQ1Z
 lEioKIa0y58YRnB0IRVXSwGoKEYMTQ5AiD1+L+H1HkuwX/jD+hPFup0GS0NU+iFjXZ5b9TqiiJD
 lbkilpzzF6OM24suiX1yts1Y417dvKpnSQE2Q7K8bQz1XBfZkwrh/tgjiz8cmIMPYoiOO4B9bhz
 A0IN5E+rA+rWgG/RiLYTQu7C5uMWh12Nw3+U4Wxzqd9ImdY4Tgkrk+obZfGMvfn2UWoPBu76eGH
 8wxnS+QTjQ4iNrzkiEQrfJtJMb5Eu6NKxdm6ISTuJbtkDe6h+aYgVWDVp0Od8wuxuo7hj3tCznf
 ZtVb1SM90VDwWp44y2ErYVA71qWSPQ==
X-Authority-Analysis: v=2.4 cv=BOa+bVQG c=1 sm=1 tr=0 ts=692dad2d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=Q6ag48FyZXsM4XAYfK0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-28_08,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512010122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_065854_372567_F7FA9EE7 
X-CRM114-Status: GOOD (  13.70  )
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

On 11/26/25 9:10 AM, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Qualcomm QCS8300 SoC contains three Camera Control Interface (CCI).
> Compared to Lemans, the key difference is in SDA/SCL GPIO assignments
> and number of CCIs.

[...]

> @@ -5071,6 +5182,240 @@ tlmm: pinctrl@f100000 {
>  			#interrupt-cells = <2>;
>  			wakeup-parent = <&pdc>;
>  
> +			cam0_avdd_2v8_en_default: cam0-avdd-2v8-en-state {
> +				pins = "gpio73";
> +				function = "gpio";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};

I'm not sure whether I was unclear, but my intention was to ask
you to move the MCLK pin definitions to the SoC DTSI, because that
comes from the design of the platform and doesn't vary between end
products.

GPIO_73 being related to a voltage regulator is strictly a property
of the EVK.

Konrad

