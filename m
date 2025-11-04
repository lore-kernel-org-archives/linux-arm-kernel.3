Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22EACCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 12:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=btCLUFG2JW2R6lSb/zI9bygKazt32LU1QnP6IaOo4lg=; b=RK2J8ESzti0Rl9VjTF39MEbOfs
	pb7R+PpYgFxXhZYu6TJmqxODatmaOe6heYh6b32yOuMahuPRh/vfluDJpUNogsKMvqmgb40z/Hvt9
	R630K9tlFEUZQx7MR6dnfmgpMakNhYigyPbhcV/FFJoZVpD3kwkwXGtQqrL6OG5ikVOJGYJ3OlwqL
	CMiBXjF/88O5udHJNZiA/ptiTHSaIXav20x8bSjIw0F1x5oeFOAtN2BBsWm+yV09PiH4gA/oY6VpI
	2ZSn4osbjfSYgpRDdifBNl1BjrXjYLp60ylERz2LSc3IX2kBAzs/Yuzx+zBi1TtsSOjKTFkQm6apb
	3JqiCX1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGRn-0000000BoCf-1Noy;
	Tue, 04 Nov 2025 12:47:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGGRk-0000000BoCK-2XgW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 12:47:37 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4CfWm52042590
	for <linux-arm-kernel@lists.infradead.org>; Tue, 4 Nov 2025 12:47:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	btCLUFG2JW2R6lSb/zI9bygKazt32LU1QnP6IaOo4lg=; b=M/4+2Buukf5mYu89
	WA05TNN2VSx7YL7TBTGKfpPHBA0dSJvcQ7YRGmm3HbkjYf0hWUxdeGH7ZXKMqZPN
	ml+wEwweBqeex3ao8Cq5D5Kebss6kBgv3Ydde9gOdNITp82yk2FepnmughxKUkLA
	L8C5GZNdJIYbKe9zCR/IzPPm+vhHErPMlW4+sFANg4Rec4n1vnR3//njyNDMB2Yq
	rAScset5mlmSSq3UK9yIbikkIP1xUioHby48GoXB0oGH14847f8zPc3KZtv0G1ja
	7cIZkv3IOMekJ6QMAYTU/YkDJtyMbNBUTemE/5bSmrSgfz6iQV95mF+3WtONIJKU
	c0cAgQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7fgrgbrj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 12:47:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b1f633955cso7436585a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 04:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762260454; x=1762865254; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=btCLUFG2JW2R6lSb/zI9bygKazt32LU1QnP6IaOo4lg=;
        b=W4vdSrvcv0IMTEkRiQzdq+WQMTZHaF/apZwvvA5FNVHtmG3iVo8Dcn0TmUCRYoLpz7
         u+02r3IYdpTKxK3mK97MvbwuSEHq4SBJcJ4Im22dHiDLdyGwqDXS0F5FtLiCVik1ZKJO
         J0OW+1MuTD9m+w+nf5Y5qbit5PYO5HGsECXR6voGzbVyZ74svdUFQkzXsAtVNQZBZr+I
         FrUkhlJhZPO51eCbCjAB6uEjr/K2ug1kPwQ48cyV58GZlTVjgP210r8YCOc0qH7K0yvD
         EYZiEPwZ3QWwrucZ7RdlCl6X9/lFfgTQjFgXdxCJWO/K9kmafMEoGhcXunHSewYE5Q40
         ELrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762260454; x=1762865254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=btCLUFG2JW2R6lSb/zI9bygKazt32LU1QnP6IaOo4lg=;
        b=u/iSEJT6OzDrQLWJx0kRnKDHD8YHiWiJ15pPw4iiyvWLF5aKX/PXDHByybHq94DUmS
         RABtwgfRlVxq3lVQCdLzt7+8bUWUw5GrELclGEwh2DhtwFahkUqtn02x40T5RGVgsOZu
         roY5YkTNMaLIuOXp97RwczD+8Ka7lFxv9AM659l/J/jXpD4GleaHDU7oE0PpKyiMLOw1
         D33RYB6HzQSWfOIIu06WxwDAspEOHV3lz8+/oy30QSV4FgX8LEoWlkx4fTsqDa2wE6k6
         TzXeWhJd8MbQUFUdh7BsseZhkF09+z07C8hqFQ0wDcyE1fQU+FPWIoXvTdpgKLl3e+c+
         APSg==
X-Forwarded-Encrypted: i=1; AJvYcCUKS8YEid7/28/7znifv8Jbjs6TTdiQrqi3eGtc9XpDgIxUYHdPTz7ufctasrbr9nkZ5odoNSv05870buhKkyz2@lists.infradead.org
X-Gm-Message-State: AOJu0YzI1zgntlGSaJ8NzdiGfJVEw6A0rlA1mV52ZyW1cKskVd93H2a8
	58fQdDJXW67pQQvt61p3eGlWCAaKLKONpPbp8TITtXGLw8BmSDf+rhfIum24HwFIZdJRRWsENte
	MOOodxoPUAQhEO1/Aulbe0IOaZ8hqaKJxNO4VvYmMciQDMhV6RH50VkfwGeJ6zJrJPha0131SJQ
	AHYOShqck7JQ==
X-Gm-Gg: ASbGncsPveKRyptnuh07ibNYFxRxRJLZSa8tcio5XtgfRuO8AaiACmSAIYTOt2CYesW
	bttbEEuWbBtCSY4Tu1CakNtPGxCX//xA92h8FaWoMu7cBM6c6rzgoM9HEHZLhJ0chX18pHSTlxg
	77m8xjXrxLaRe01G3z+P10nWZBewD+HAIMJv9TazAcbVVl6rs8NqhjzE+xVpU15bJfEa4bgsRD9
	MFfXODlLNbDmEIG6AjM3XGsUpeHNqR7Bp4W3TsNDL4W64OPOk90B3SM3FWHsmyMjHCpmXw63Q30
	hQm6d8WlaaVVo0HiWvAIgYY9+GkZv0MBm2YVLdsjgOVKlSH8Y+M0/5UF5yo6ArNm33nGd0QfN/p
	8Z8UowP9q2Vq9l1CrnFPhWO0DQcIEL1dlFSntUoZXmQ6jKu9jqlpNypa8
X-Received: by 2002:a05:622a:1889:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ed30d4af53mr132226941cf.2.1762260453983;
        Tue, 04 Nov 2025 04:47:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHAViUaNmyoIrrrtJRAsJFTDtaonsJt68AYLkIMFNWARiJlxrMxIPqTiGU7C28cF/+f/XRsAw==
X-Received: by 2002:a05:622a:1889:b0:4e0:b24a:6577 with SMTP id d75a77b69052e-4ed30d4af53mr132226561cf.2.1762260453333;
        Tue, 04 Nov 2025 04:47:33 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b723f6e26e7sm203838566b.41.2025.11.04.04.47.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 04:47:32 -0800 (PST)
Message-ID: <25b7abfe-1881-41e5-914b-ee16ce63ed3e@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 13:47:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: hamoa: enable ETR and CTCU devices
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
 <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251104-enable-etr-and-ctcu-for-hamoa-v1-0-af552cfb902c@oss.qualcomm.com>
 <20251104-enable-etr-and-ctcu-for-hamoa-v1-2-af552cfb902c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251104-enable-etr-and-ctcu-for-hamoa-v1-2-af552cfb902c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5-nrpnMBCPUs7AhSX5UErOgZTl4wpcew
X-Proofpoint-GUID: 5-nrpnMBCPUs7AhSX5UErOgZTl4wpcew
X-Authority-Analysis: v=2.4 cv=b7O/I9Gx c=1 sm=1 tr=0 ts=6909f5e6 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GSohi4rL9rV8qtWeFt4A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDEwNiBTYWx0ZWRfX6Zg86E8iFTDP
 k2Q8qMm1pngu3ua/wGNs4AcJFvRSoRAdnF5JZFXS27a1grrIjxJcLVTrbMnksxNavWsB+oBvnMb
 tBNqHyfh4fht5n5Tsmq8krBD5AYdzAiJZOB+KzRV2CzSIakQJCNf2d2cdAQaSjrMrh/7ttqOpAT
 Ug6RvxdGB1eNHOtUJHYDcpKglSTHx2QrLfk8zBg28X6cRMD6bvzt2LE/2F9zakA3WadEPiZ3v1L
 wJgCbLmY8xK387FcNUOGVPQnwMMIDaTOKU7RdZv3hmCBzsZIX8NZqWgmhzYjQBRYc1XzZdvtL6a
 PK0x7Euy33qwOdBxxgKl/TeIfycA/3nGFrMHKM4It0/DI69Xib3v87FUsu0BLU6efx/Vyq3xE4A
 WoEqQIAHtAM52wxTndSSd1lp3sI7Xw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_044736_805454_DD9B332B 
X-CRM114-Status: GOOD (  17.77  )
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

On 11/4/25 9:10 AM, Jie Gan wrote:
> Embedded Trace Router(ETR) is working as a DDR memory sink to collect
> tracing data from source device.
> 
> The CTCU serves as the control unit for the ETR device, managing its
> behavior to determine how trace data is collected.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 160 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 159 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> index a17900eacb20..ca4a473614ee 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -6713,6 +6713,35 @@ data-pins {
>  			};
>  		};
>  
> +		ctcu@10001000 {
> +			compatible = "qcom,hamoa-ctcu","qcom,sa8775p-ctcu";

Missing space between after the comma

no issues otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

