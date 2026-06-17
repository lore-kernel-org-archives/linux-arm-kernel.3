Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F0FCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 09:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0PFZ3dXkaCLzVPbD6H+hniaJto+R8rtLevzujc1O/Q=; b=x1bdbQz1g+lFy44khIebD6N32q
	8MKOtghpoEYfUxN37h+LtPBXoc9Lir010y1zFHkUBte4H8ke8Q1wtb78Kjnm2BWPcuy/YmJ5j4zEg
	e4KEIL2FHvikw4rC2HOgRgH15DqmUWviOPwJC2RhUMXMbshwvCW6f/o1H4EdZRCVYD2NB/ZaoHbmH
	bYUePeh6Ot2rzDdQHK18qfJrUJlK+h7jkEIKS2XM1V+4NjIeyIX78x0T5mRLDnsv5gpRcDEq+Z65a
	BUcVsnmSVcASa6iQjo4w0ezIyToZHrGp6zh4HS2WRLVsAHTpt005SCjUNvmcalZMGxo3CnF7f1jF3
	IfHbUmyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmnb-0000000GxcQ-0N84;
	Wed, 17 Jun 2026 09:43:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZmnX-0000000Gxbw-3A09
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 09:43:05 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8Ulb71655611
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 09:43:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0PFZ3dXkaCLzVPbD6H+hniaJto+R8rtLevzujc1O/Q=; b=GX/i+kn6Y6I3oDWo
	aKZ3q+/3afC6clikdCrc1fjsFR5e2YYq18MqmjNtGJHnszSyPl6hwpd830Ak7uek
	bi25KgGDgRZSeh+nmw4Obz/Njq1fFljmEQOmJtBNmi8wdgg036Ni/adGyzEsrQxp
	WQq6yOWPI3MIHxn0YKWWwQR/Pu6uVowDZSgkjEgP/SBXKHpagFDFUY/5EhtHygzc
	qcH8nqgKzEOoiboJZJkdYWUW7AQiGGJKa8rIpUKjcOJN7ThxhMMziDXPuAgLtjFq
	3e1oxGiP35MSTBItCrgq7JVVvSNUV1k1lKVvIHRuaU32O2ZK+qVLUx5NInTVqnUC
	uGPRhA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueer2e57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 09:43:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5178ac43d27so14282211cf.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 02:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781689381; x=1782294181; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y0PFZ3dXkaCLzVPbD6H+hniaJto+R8rtLevzujc1O/Q=;
        b=KRgGiEDdOEMYYMHUuQ7QAsq3+zHhIUGSmvI7/u4GfIuMgGM40ODHrZwOPQz0wQ6LED
         sfge9UZaIuRKY2Q3wPm+3/UJrLEJAqDdpMESVEqTpwcbbwsv04jiu6Bbazx2Je7Lom70
         X1MweaX1hztERI+LpXZT+xYxjxiH1BNZNGq+ZFUHDrInoDy2hS8NVjNWxKzCVkfG3d8j
         eg+emIeHhL0arPiMZ1dKJYT+LTIpIAmLCbwtrnzNwFFgYfF9cMYGpbOn9GdicY//6+Jn
         AnzvLXJ2tcRCmmH5aZgEhjoxsfa6bvKt7aS1jbyyT+PvRZUDDfnUTo/OLmoF9v5b9fvc
         QHPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781689382; x=1782294182;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0PFZ3dXkaCLzVPbD6H+hniaJto+R8rtLevzujc1O/Q=;
        b=i6hdyGGletOx1Mj+vVe0cDVQD0IUCRATIDAq5uKd9g9RWn7nQifgTDVEhe3PFyx6zN
         pUO8wo38Kn/Rc0VJn8SLrlC8FyQg3WgHDUfBOSzw3h/tXpFS8NSyW7MpqA0O6SZjtQsb
         akQu7j1v9T4xEiU7P7tZujxAjAuAVk+t7RZKEPwYPTsz9xYupQrbm8YqJ88qxzocsuYo
         x1MX2oPYJFVAXF1B18WxrtJerQ4LzMSo64W9aiaixKWMoNACD/S34NPSZAa+xKTmz7M0
         GRJEhcgIMA/Zcu3SszOCIonTeeNJA7tbktlJ5Dftb7uhI3+wG1GHb7jOfuENWSxnoh/J
         5RJA==
X-Forwarded-Encrypted: i=1; AFNElJ9graHxFTxEl+bnV2xp2mFxKXXdXQ1a0O1bRso9Yf3GmJIVDY1CyRP/rVeKF1teGjrCYCkYgurSasOwv9Z6wDXi@lists.infradead.org
X-Gm-Message-State: AOJu0YwwdtQdojUK0OlsKXUnZCz037buTOleLJBQvICw5zn3SP+lXw7I
	BRfxYulV7X1LuKTw6ULjvJxVSeyjI24Nuefen/H+PJHE9JQ0fbDgp1/PUsm9+D3Tq0ieQov1cYm
	xHYXrTnx4ZJjYHTeWDC/z/gwkVtQJ8H8sIu3uFtb2mRY6w/8r/tUiLQRRpkTlm5QVaWwMjPiB5i
	SrSQ==
X-Gm-Gg: Acq92OFpPeERtUx/SVWc32/4gS+eVY+SQPe1RAong/sLKz0iXQXVgZnL9+NWQG4OS49
	3eKY8qhCqxVFUFz5I7JDt2FddcnkoPjUqTJX58/8ipmJCgb7H6TRg6DEtDzprGwC8uZ0pv2sQFz
	xHRTzccuswlw1gQjqC8956zG2XHySJyctAaz88RMWm3inAkrATZcaww814DS+6ZieIjPloe1EIj
	XbMaiSTK+fq+8R26Au8CUBhyPraeeReT6gFLmYyV4i9LrJ0QwSoTJJipTtg4EN8f3j9B2lrklaQ
	RMfwz2b8o42C9VIiD9vPOf6czMY3oR4nU+rIN5sgmDY7D27Tyf+Odr7W6dgcSCV2bmsVHuOvKns
	Kr/erW+KJLTt7IhVOlg21K3jK/gddOnYLZsg=
X-Received: by 2002:a05:620a:1727:b0:915:6433:2599 with SMTP id af79cd13be357-91db94877e5mr256352585a.1.1781689381485;
        Wed, 17 Jun 2026 02:43:01 -0700 (PDT)
X-Received: by 2002:a05:620a:1727:b0:915:6433:2599 with SMTP id af79cd13be357-91db94877e5mr256350885a.1.1781689381048;
        Wed, 17 Jun 2026 02:43:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937919b458sm6374523a12.5.2026.06.17.02.42.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 02:43:00 -0700 (PDT)
Message-ID: <4f3c6bee-3ccb-467e-a466-89fece0e6a7f@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 11:42:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 8/9] arm64: dts: qcom: shikra-cqs-evk: Enable
 ethernet0
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Russell King <linux@armlinux.org.uk>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
References: <20260612-shikra_ethernet-v1-0-f0f4a1d19929@oss.qualcomm.com>
 <20260612-shikra_ethernet-v1-8-f0f4a1d19929@oss.qualcomm.com>
 <2cb658f3-f564-4396-884d-d025eaa674a1@oss.qualcomm.com>
 <ajF+xlipLuZtf4HL@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ajF+xlipLuZtf4HL@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aYnGb7Yh3QRvLCFuO9NCDZjPooYlri9I
X-Authority-Analysis: v=2.4 cv=Mr1iLWae c=1 sm=1 tr=0 ts=6a326c26 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8 a=zlF0UblE2nBlcRgU2acA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: aYnGb7Yh3QRvLCFuO9NCDZjPooYlri9I
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDA5MSBTYWx0ZWRfXyCIbBlVdDokB
 ZH7OkbiuG25z3heu8TzyM8W/t/Ienwi+OL0PuSu/4bqmKA/BKEy7CK4qj2ZK3Suqw5CnUtzjrSa
 FF/lNyTVw/GGDaI1b5zw2GZonMehVDg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDA5MSBTYWx0ZWRfX/Q46TtNKBX8f
 0lKqKd9gcH8fEvE1+oYTFkyTAkwo3CDfiFC6wuperSupIR9udAMH+WjMLz+yQS8bW5YuBAabkbd
 RSRMf3hSxfwF6Zetg/xzAHqhVG2UbsJnPZCPxSbWbB576+8fhXvj3e7Ix+LcjUlT+KKomjA0z4k
 fsaJgRYc073S1ULP7G4a6ps76/vSg3PS2BST+S/lDBxmVVg9IrueyUraM4y+7DRc0+CYwU2EfVM
 VByT972Msz0KMJl1Iyy/0hefr4ui5I3699tDJkIU1KkHWvP/6uQ18TvVMAblUEwD7AMqwOH9dWh
 xGvBSkUm98JnnYliO8FrxdEsx4bPlR3TvxMru/5nJz/ngAuIXnbBX66CvyNWr0A6cLYcm1/3GVf
 p0D4OIFF8buD5UG+DQQgxsVmG5sAV2Hv63Gm86WO1MyY/4YY0kHfuOwWQmoK63xbJcoyC+kVPVy
 UQz8iSDPMlqtPORHJ6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_024303_823226_0012294F 
X-CRM114-Status: GOOD (  17.87  )
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

On 6/16/26 6:50 PM, Mohd Ayaan Anwar wrote:
> On Tue, Jun 16, 2026 at 11:50:26AM +0200, Konrad Dybcio wrote:
>> On 6/11/26 8:37 PM, Mohd Ayaan Anwar wrote:
>>
>>> +&tlmm {
>>> +	ethernet0_defaults: ethernet0-defaults-state {
>>
>> s/defaults/default
>>
>> Please move this definition to shikra.dtsi
>>
> 
> The CQM and CQS variants have identical GPIO mapping but the IQS is
> different. So should I keep this in shikra.dtsi and overwrite for IQS in
> shikra-iqs-evk.dts?
> 
> 
>>> +
>>> +	emac0_phy_en_hog: emac0-phy-en-hog {
>>> +		gpio-hog;
>>> +		gpios = <149 GPIO_ACTIVE_HIGH>;
>>> +		output-high;
>>> +		line-name = "emac0-phy-en";
>>> +	};
>>
>> This looks like a hack - what does this pin actually do?
>>
> 
> The power supply to both PHYs on Shikra is gated by a GPIO pin. I am
> unsure whether they should be modelled as a fixed, enable-on-boot
> regulator or just like this. They need to be powered on early so that
> MDIO can detect them.

If it's a regulator, then it should be described as a regulator. There
was some discussion regarding the power resources of PHYs over here:

https://lore.kernel.org/linux-arm-msm/SN7PR19MB67369F7DD02F702437C0F1919D1B2@SN7PR19MB6736.namprd19.prod.outlook.com/

Konrad

