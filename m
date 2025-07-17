Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB68FC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 20:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TmpfxjkNhdt9dhUb9Z4sklqbRlDt+2S3rq7vCoARvZI=; b=qyn4/2ClzwSb1nLNKM1+2yOR6o
	on+it1M0YdQ2V+XvE2hAm5hQWSb9Dct0+1iyqrYxYwhf8F5KxXPHFqOoO392C2mcX6bsyP65+BzAn
	zwjMK4Sec56k18jA0GpWELW4xw3NTtJV/ghg0gg387jHmr9MZ3ovjDP5r/65xqfnKE8MfQ2hD9rQN
	ZMbZ8zapTmD3R2Y4mobqy+ui8nv01Dz73M1XzXPYd9Q6xgvc6fbJJEMbrjXKDaG5mSDPNHT8pi6Fw
	bzVzfFgAYL/8BeugJEM8Thq2B73qlzR3tk+cIbIuwICc+bG+fEj/QJkWwsSUS+oPWWSL3E0XokUVx
	F2LALIhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucVWP-0000000B7Kj-0lwj;
	Thu, 17 Jul 2025 20:48:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucVQe-0000000B6mO-0KZJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 20:42:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCAGJs020661
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 20:42:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TmpfxjkNhdt9dhUb9Z4sklqbRlDt+2S3rq7vCoARvZI=; b=FhQhQ2ETqrCc2+y4
	HFVwT1131Db7D+9s4XwC3oIlNrsScBTDWs9VTASF3EX4t8uZ/yISjsuRGBcRa6zs
	qy+oi3CA1Zwn23UH1vLa5d05L56n8CaVyfCMD3kLvjnVJErJSBm5RiislTStFI8M
	7Vph2rnsQTY8rU1WGJ6uY4zUNnBFZqf/brojlUeokI7DuPmEi9S+xR5ETye+2F/D
	ZbvqLezI2i+Yfld1A5Qwh45Osx5U3+wKekfrnR3kgA7L8UbvYxTirWo19hrWXIAB
	ZW0Uf2kPXZck9qz4j/rdpS+s2XL/alH5pw2VDRAU82BsZcE2mBR+VawUaxsvhbrW
	8VRfRQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5dpm6ne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 20:42:07 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ab61b91608so3974621cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Jul 2025 13:42:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752784926; x=1753389726;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TmpfxjkNhdt9dhUb9Z4sklqbRlDt+2S3rq7vCoARvZI=;
        b=GXL4gdOFj74ku+KIJ4qt4GQv/iWKLfLadDoHhMsRrTKutS+46d3H0KL5prsL0+dZTa
         oUlg0ILxYZa2MWdfGuBwE5OPq+TYgEzCwk7nvQa9G1mAsuvnemTVGFL29+L5mshAlqDl
         oHPsnxg8jKZYgKZb+uOlHRjdCSlMmxddlt3Oc3kY6pIx54waADT0Zpe+YBRN8U87jz8V
         V+8yuSojJ7t7w7FQSLC8a/7EMkpbSqnbimDRjyyOVic2hWU0UoMZWzVYnEJm4QyB8B+E
         s/zcs0oppfyb5hygemijaEZWJBBZF96D4Uq9nc5IyvnW8xsBcVWos+2i022HcpUx+lDA
         C9IQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyVjut27rMHnWcpdYgzGITCMK/xiYrhykr7VWF3l6Iu24msLnaEF3VxZ2tVBNAbMmr45OVcW4O73YM4eBNkPVk@lists.infradead.org
X-Gm-Message-State: AOJu0YwjCXc289wUgtRkmqVhlnAXrmFeLd/8wg/GCoiRO2W7Ok/E8AOL
	2VWfzeZ6IudBjdWewYKtHrvfKvQA+SD4yNl8zz6A7ar0jL5lZTRPDws4UctEUdoxDqEz/bfzNPL
	08EajNpnccdUJiWJky+shq47NMqYCkMfcWR8V6qCbvYkZdzIJ1Lp5pcHsPsbSCjVuBniXi08t9h
	hVKw==
X-Gm-Gg: ASbGncsW6rOgp7lmQVRVUeAMIP2JhXyCc2fgpNjWUCv2T6vq8he6MeZZydLlpL2LfIy
	Tua/d8ahcUxAGPv/D0/VtvQzLaZMAXcuMnPKPz9WR1qHjjFupPheLJPIoeUBXoQD3Tx60ykDNev
	AFJRoBV2InB/oKV5Ekd+30MIF58BXDSZ7MxFdqQPocMQYbPNtW7gSPj1mlMluwI8L+tPqZquVqz
	K46N3Wkh/Ni2fGgPqoe5+38hRNPD2PgHtXUgYyxhvMMH2xWH9RTXCfvttukRlAvx5maIyudb9Q7
	/qeY9GtFE3tMKRAC0fkHmVSVU83ePUgn6LuckqndTSKJ7V14jiO3Pn763Vi6PJcAET5xeiboSVC
	Ih2zLB6sCKckEpwLgLFJ3
X-Received: by 2002:a05:622a:1a98:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4ab90a82a28mr55030251cf.7.1752784926058;
        Thu, 17 Jul 2025 13:42:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGRWAhwxvL0YQ5lOLx3J9S62rBalvJHOr8MWbHqXNprUdHSqk24MYX4tdyqOdn3P7ha6yUnvQ==
X-Received: by 2002:a05:622a:1a98:b0:47a:e6e1:c071 with SMTP id d75a77b69052e-4ab90a82a28mr55029901cf.7.1752784925586;
        Thu, 17 Jul 2025 13:42:05 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611d04d8347sm10357916a12.42.2025.07.17.13.42.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 13:42:04 -0700 (PDT)
Message-ID: <193de865-980d-4fd7-9c43-39ae387a5d0b@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 22:41:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/10] clock: qcom: gcc-ipq5424: Add gpll0_out_aux
 clock
To: Luo Jie <quic_luoj@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Anusha Rao <quic_anusha@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_kkumarcs@quicinc.com,
        quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
        quic_pavir@quicinc.com, quic_suruchia@quicinc.com
References: <20250710-qcom_ipq5424_nsscc-v3-0-f149dc461212@quicinc.com>
 <20250710-qcom_ipq5424_nsscc-v3-4-f149dc461212@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-qcom_ipq5424_nsscc-v3-4-f149dc461212@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE4MyBTYWx0ZWRfX0R2Yojpr/pMP
 brFq6rDK77SBwspf4bra0vtoWT0+V/+roETSWUkh26tbSphPxFf95lw6ABzGPnQIDUZLqF0eeLR
 49Ze8WU+Yse915/MxcIYqHZGyP0rID53ZimHtk+FV+e84azDD5Cy/SDAOZH5GAwPMjQQpiE+rfw
 /8KMNY4FJpEvDIHU7vrNEXQ38ZJll9uW6EBhp5GJ4+SIDSAaesBl5t7xOaPFHhZPbxWMciOayxE
 Zr8j/gkyxs6PtQTpp7X/152n+lvWCIsmY3OSQ8yjTDksm4zGffL5ZNO+e73b7TRzChHR18c/fTI
 eZ/f1xiA/Q6Ko4uSWElKq6Ln9JtTXLv49rvTzSQFLFO6RbjbtX67pgRu6jbVvSnT0ZN2gxePg5Y
 Aen6OKItoNpW/2GjnEI3fvkPP3VKeXCVJwNnFoIVN3E9qXdCpRG8Sgjss4BG+4UO4vN1xBXr
X-Proofpoint-GUID: ivLSffn2gcnYxoaa9mDoyrj3S9LeH2xp
X-Proofpoint-ORIG-GUID: ivLSffn2gcnYxoaa9mDoyrj3S9LeH2xp
X-Authority-Analysis: v=2.4 cv=Y+r4sgeN c=1 sm=1 tr=0 ts=6879601f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=qx8TOUd7-QwhcYYS848A:9
 a=QEXdDO2ut3YA:10 a=jh1YyD438LUA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=992 phishscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507170183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_134208_123935_9629E232 
X-CRM114-Status: GOOD (  10.07  )
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

On 7/10/25 2:28 PM, Luo Jie wrote:
> The clock gpll0_out_aux acts as the parent clock for some of the NSS
> (Network Subsystem) clocks.
> 
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

nit: subject: "clock:" -> "clk:" to match the other commits to this
subsystem

Konrad

