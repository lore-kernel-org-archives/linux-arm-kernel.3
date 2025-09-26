Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9BCECAC5AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 08:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QJH3H/0kmdW6w7MgCtEBO34/S0w4O3IKZVUmNKMzmxs=; b=HXGk3TOSaI7lMTdws3gcYTAXo2
	+DJi9LTE0AFvwsEzYYM7/FL+qDbksmer51bbr0imGp7ExqXXylIgyh4bYvc+G/zQo57Wgo+zjHIn6
	qLz+SSbjBsGqCE5gxUNz2lks6UjGzMeI1EUc5vSojtpIIsUFDiReSZWdkQfsLmJvTFiqc87MjxMHf
	HUsxBXop0PDodEQVm0GoZjmSgHLPZ2JikY1+qI2fC98kZh/aS46Nu8SPzT6ANkL6vCKXAoRxRQFIW
	VYJRyIX2cGQo9F5dQsDuQpxoNkOoskIQbLTrPbOlMvaEV9wIWnc258zVFPxRC5dltVK3umeaLKDIO
	Zhtgn2Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v240T-0000000HEVr-2lT0;
	Fri, 26 Sep 2025 08:40:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v240Q-0000000HEUT-3Ze6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 08:40:44 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q70T1J025396
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 08:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QJH3H/0kmdW6w7MgCtEBO34/S0w4O3IKZVUmNKMzmxs=; b=TW6ltXRzQyf5A7om
	E18NnxeB03KQyW2HIqMhNtSSpsj8daU4M3DoSJiF+CN8Ob3AOMMvzlM4mN2ls++K
	lrOthPpxhzyxOQbPvBVEBVA0rzWNe2lUaLCuItVXgdQ0/nGr/H9nWkPMR7rmrckJ
	rU+AvuwfmzVhlD/iI39A6TtD2ZIepde1jdDt74ujELry+hgSe/qOnh00kayYDXTb
	prbcPCRSvg8qYjZiAZdnt/stB8QpyxDTHB45bEICq106dailIXO/si7EGsO0SwQa
	r2r70ePAFVD08PQVJW7G6ZCaDH5QvaSakNtEFVKtydxUDFyql70//cVqyXW0NM13
	8PL0pw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0u24g4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 08:40:41 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-269880a7bd9so22399615ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Sep 2025 01:40:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758876040; x=1759480840;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QJH3H/0kmdW6w7MgCtEBO34/S0w4O3IKZVUmNKMzmxs=;
        b=pp91+jXxmk4EBXsnih4K5fpPLV+0Avpw6SvwOFElSeEe8LjKvqvGsfjGU29BLleuK7
         NGeaZfD+/mdzTJXQRQcPUfm64gxShByJbmccG1WvjnptTN2BHYNk52onBoGQvrwi3rwp
         gRjQ5MkQzS+TzOV5id2ldAwldxBhAOy5umDuVteL0SRr86Yp6hhukErYmEhn0Ju0we3f
         P1lFc/GPpYlm6C/xG044HUMLjZM8e2VFvwS3WW+a5REoVyXKgl23bk58f1qFOEx42P7g
         ST7qrzW2Rr3pK2amVUQkKowJxNPjyNRr5DqwsZdVp86zu1HVpTdOAN1rN5gdImxScYJn
         6xPA==
X-Forwarded-Encrypted: i=1; AJvYcCXvevhQQPdvACWcmkVlK2cDd7qao5aLFssFnwn3+ts5XURL4dMJCIk2k7V2oJ/ldBMrDzIfFum5eWWDkfHZwHuQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzELgQKGF1zv84FwDXNYYD4RaugdV5ePLy+JOr3npJgCpFouWzl
	6vuoBlrOaLzYjnRHpmLvb+csgj42lbAPgwPnNEQ7vqLD1EvRX/YPGAM1AbHrIoWl6s7AkDV0gsB
	JUOrhFtQTS0V6zzE+IuybLgO5K9RbL6bBRPs0ca2Vo9EBq8i0+Mwrrm9xOia03uBuoAm9u+JvPU
	bmag==
X-Gm-Gg: ASbGncuPLnwz3K05+F12akUuRszpjNE7qO0gKVwxxaiTvRQDsfjCY62tmpVX7PuTPwt
	YMD35x0StxC/G26AK8kfQEuWP2UR/ECoMXahpJaw3AeBsZblDKY+SAdBB/Hf2iqsdHR+mrUI3yV
	L/Najzd0ZwBeit+RvWWpbyn8bmE82KKogEATjjqTiqmbfhNvBHSBkn/61pSi6FBnPpNHiELK2fM
	AQf8mZ/G2OCVpcM5AXG1VNvfGd8enf2vM3iIKzkLljjtLORCcYflhG61RUPVy/uH4dcPsR258+e
	PlIDS9m1U8R6A7kEye0Petg6jKk0EV7Vh7OonscY4wDMJUm6gVqfmSeYdbHwOK8YxPGD
X-Received: by 2002:a17:902:e787:b0:266:e8c3:4731 with SMTP id d9443c01a7336-27ed4a4e69fmr57199505ad.23.1758876040423;
        Fri, 26 Sep 2025 01:40:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSYjbgxz3ZpRa0D00ZVNPgHg9O0ctAAj1epWv0U96tMdUGtuWmJ8IJY2bgSO3VYP/MfK11Rw==
X-Received: by 2002:a17:902:e787:b0:266:e8c3:4731 with SMTP id d9443c01a7336-27ed4a4e69fmr57199205ad.23.1758876039860;
        Fri, 26 Sep 2025 01:40:39 -0700 (PDT)
Received: from [10.217.216.188] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6733a63sm47601845ad.64.2025.09.26.01.40.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 01:40:39 -0700 (PDT)
Message-ID: <d55b42b6-1b2b-4a52-8eaf-78c4ed78958c@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 14:10:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] clk: qcom: camcc: Add support for camera clock
 controller for Kaanapali
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com
References: <20250924-knp-mmclk-v1-0-d7ea96b4784a@oss.qualcomm.com>
 <20250924-knp-mmclk-v1-7-d7ea96b4784a@oss.qualcomm.com>
 <d18c5196-dd8e-47d6-87bd-de0ac94fbf3b@linaro.org>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <d18c5196-dd8e-47d6-87bd-de0ac94fbf3b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Au74ZuvkjKWWMv0XgzcnPu7OksBS5yTv
X-Proofpoint-GUID: Au74ZuvkjKWWMv0XgzcnPu7OksBS5yTv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX6mB4jbJ+SWw7
 SAKC2/uQmHTALgOSazbZOPVkEFi+al3/KMjUI7F2oqPptCct0q73brIUKgk1FOozb/5RplcKejW
 G2VxSkK3D+PAzZh1+uk36ypBa/TF6uPFN7vS1ktUy4oyPf5jijIBd0KgFFNleklT3B8caj3geqZ
 oiZnUXnIZr54GlrM9joh0CxJKeP7i06IUPTgASeg7psn8ACFmOXjvmUf2U5Hai2GkqlFf2JvO54
 l5fYNxdZFGXFzu+niUh2PwVWbYG69pmT/uSJWd1ai3WR1OHBxlM8X+5AU/GHS/Yut8ZLxv01EzX
 Tyw6evJP+QGAdHqqZh+v09KrdTFfgYY5DMAPEHneO8L6bHQ+m56jacjCAcZgUVhq4xuYRAqQzON
 BdzpwU9LxPMUJBEVLSCW8oOYh9FisA==
X-Authority-Analysis: v=2.4 cv=ZsHg6t7G c=1 sm=1 tr=0 ts=68d65189 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=txcd_wJ1IAhHlW4x_IwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_02,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_014043_012260_BD0F392B 
X-CRM114-Status: GOOD (  13.11  )
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



On 9/25/2025 2:40 PM, Bryan O'Donoghue wrote:
> On 25/09/2025 00:56, Jingyi Wang wrote:
>> +static u32 cam_cc_kaanapali_critical_cbcrs[] = {
>> +    0x21398, /* CAM_CC_DRV_AHB_CLK */
>> +    0x21390, /* CAM_CC_DRV_XO_CLK */
>> +    0x21364, /* CAM_CC_GDSC_CLK */
>> +    0x21368, /* CAM_CC_SLEEP_CLK */
>> +};
> 
> How is this critical list decided ?
> 

Bryan, these are list based on design recommendations.

> For example why is the AHB clock critical but the CAMNOC and AXI clocks
> not critical ?
> 

AHB clock is required for access and NOC & AXI needs to be managed by
the client SW driver.

> ---
> bod

-- 
Thanks,
Taniya Das


