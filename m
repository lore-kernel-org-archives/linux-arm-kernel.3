Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED06106F30F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=si1WQGu7D98ZY9SBeUQTBSa4sqGBk6dnIALYoyrzyqg=; b=K0jZG1q6q6TDWXG/wrY0AFzbvu
	/2iYKkvrN4djVHiFwMO79392oGw2aSmwyxlYSDlDISFptbDWT1mmyaYCICi3hAB5OqFTFdjFXq5Z5
	4I9FK3HvLlOiQ7xq24NEKDNkWb6ec9aBbprz5OjQnO+oln3zl5PUzPFsyZz2QTfLPpU7fpcAxOtDE
	itsIsmKn5UNmAd24biDvT1Gklkq57HMa5Bq1cuYNYS8niIItRUTxGsccr3AHZu/1Xm+scgsJDmJ/y
	yTZyWx9mduw8MP9a55LZD4J7CvZKIA8u9kSFV2pJMNZbgl+Tv8+W6ggMBsOrG1v8kz9KnE3nKmVR0
	YjfTX30w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5h9G-00000005AEJ-2eMs;
	Thu, 26 Mar 2026 09:37:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5h9D-00000005ADw-1iPw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:37:05 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q6w3CK1060910;
	Thu, 26 Mar 2026 09:37:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	si1WQGu7D98ZY9SBeUQTBSa4sqGBk6dnIALYoyrzyqg=; b=QdvmmrZTFLcBkGdj
	Z0Cairh9lfQ44JgQSL0m74ZRef8YjjNUWmAfMfim/c8LZTZyNoi+2uZbbwUNjp97
	fEx3HFOd05zgv2Z2jbvfOirREskoaPyox3Dl934po8+/ViIHWNluUBeGkaTkCV8Q
	0dXBHzIUGH2ryDVoYjkW5h1fwy0PDtBz147iqdMGC4sn3FExNftfnQk9sblIqW1G
	RN+6OmaiDoa0QUIo1JGWiY9BERGoAzREK6Cab7N0HpMCkjwTtt+BjTMifyPuoU45
	FKHLP/vKDA3kSP0bMYN3rfLd5aUwqAZTmY5G9cB1Aqb35x+HSVHSvt3fdNoiQ6rY
	Co4mhA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qkst2rd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 09:36:59 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 62Q9awhE005195
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 09:36:58 GMT
Received: from [10.204.79.33] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 26 Mar
 2026 02:36:55 -0700
Message-ID: <ccb11c2a-4cf1-4486-be71-d4bcc983cee6@quicinc.com>
Date: Thu, 26 Mar 2026 15:06:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for
 panel nt37801
To: Bjorn Andersson <andersson@kernel.org>
CC: <konrad.dybcio@linaro.org>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_rajeevny@quicinc.com>,
        <quic_vproddut@quicinc.com>
References: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
 <acHwvzjcvqNxUjm3@baldur>
Content-Language: en-US
From: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <acHwvzjcvqNxUjm3@baldur>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfX4wn0AcuQ7rg7
 5BROEAxqbXQcSB8YCfB7emHawKdH+b7rV/aeddlRPzPvsTM6Aqftat1PFqarxlg4u8agOTpo0M7
 BljeIiUWXshHUL7RUF4QT2dEVIEGV0ttaO8H1dqRj3YtXKc6nnZ1ljLfe0JR/sNDhhdl4J/LMpE
 lYJzT0sAVaBGqKXAjolkJDUi20kN7LM2cPuGsxoTBT9RzaGUYxiTeaFfM1th98dxH5jMWg7IkCS
 UAjQDYT/Hz8+qUMeBUnzQ6uFdRr1FpUk0fUR38/cJFmEV9MgXB+Skbmij1Zz0+cdedJH9rw5K5B
 DOVbZ6ddPmX+t1tJDg42XRRjUIuuk5tWh2hyaqLYIaJe/LmgFJeSKAWJaM3iQufZmtE9lG6s5vE
 +MBfMkk2TEiHPjonaObKf4E4kZ3KOHY5nx44WixBlvxouo2Dn6XzWEw2WBcEsBJ09AFAHeP+hgz
 uk39MiJlyuNmPZCC4fw==
X-Proofpoint-ORIG-GUID: V78TK3gKM0R4oU_XDdcJIlyprYxnUQac
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c4fe3c cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=3Rd_ledAG8Ua1yCYJBgA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: V78TK3gKM0R4oU_XDdcJIlyprYxnUQac
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_023703_898624_CC4E3254 
X-CRM114-Status: GOOD (  16.73  )
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

On 3/24/2026 7:34 AM, Bjorn Andersson wrote:
> On Mon, Mar 23, 2026 at 03:52:29PM +0530, Ayushi Makhija wrote:
>> The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
>> VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.
>>
> 
> Please add Fixes: tag.
> 

Hi Bjorn,

Sure, will add in new patchset.

>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> 
> Please start using your oss.qualcomm.com address.
> 
>> ---
>>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> index 3837f6785320..6ba4e69bf377 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>> @@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
>>  
>>  		vreg_l12b_1p8: ldo12 {
>>  			regulator-name = "vreg_l12b_1p8";
>> -			regulator-min-microvolt = <1200000>;
>> +			regulator-min-microvolt = <1650000>;
> 
> Are you sure it's not supposed to be 1.8V, given the name of the rail?
> 
> Regards,
> Bjorn

There was already discussion regarding the minimum voltage for this regulator on sm8550 target
on other upstream patch. 

Link: https://lore.kernel.org/all/aQQdQoCLeKhYtY7W@yuanjiey.ap.qualcomm.com/

This values is according to the NT37801 panel sec
"The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states 
VDDI=1.65V~1.95V."

Thanks,
Ayushi

>>  			regulator-max-microvolt = <1800000>;
>>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>  			regulator-allow-set-load;
>> -- 
>> 2.34.1
>>


