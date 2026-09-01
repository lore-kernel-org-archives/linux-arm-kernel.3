Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71FDC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 15:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLXuthiikXhHO9knkRoRDESDV7G87cacEj+L5hg3O0A=; b=ToamKJJNSI7R4Q6FzSxG2ER7Bh
	02Z5JC9AKIHQkQl3BwMukegy3oBqS77rgbNAZL3L3nahOIRRdDjQewTr3AMXaIcTWRbYKPzvq3l9K
	DUF13IMkv0lpEMcTglsKxE7FSgvbud+sEnjIjREYfEuBnHPZE3+nrJwIvCyJ2Hm7tWhnubWu2N6FW
	Trg0WJ5QW+2A7UGN+79I0CiKpmafHJZLTQnzXGt+QhBDhKpm8yWwjofC5clwPO874P00mwpzZ58sE
	Vd54SlhuzKONRe4DQ9eP7wRIiUyaNviRBFU677UxSKp5qZ2R5+HS9gTe5YfzHnlZnN40Zyz9TdAoA
	T6j7Gu/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Qm3-0000000CajM-2QqP;
	Tue, 01 Sep 2026 15:51:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Qm1-0000000Caiw-0vKv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 15:51:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9TWB1638738
	for <linux-arm-kernel@lists.infradead.org>; Tue, 1 Sep 2026 15:51:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FLXuthiikXhHO9knkRoRDESDV7G87cacEj+L5hg3O0A=; b=IBsCKrdyIOT2jJh5
	uttyGrbXTRm0UCmq8i9eD1TKAU1WOeAsHrZscqk5dOqB3fXxquXSeTdKTwKnpo+c
	ICEEqQ5yzwMm4ab3upzVwNDLVLFBcZKO3TnCcDx4KmXpHaJpfBhOU7B14Okwktcr
	JvhD/g17TzXNO+2yj1hMttje604egG4iDsQPC5wnUTOL86oZdnTdpV9RGMxEPou5
	8PTTN2czqg8JbbyW5MnlryTm/FEsCFTARNjvzfEzlTbnBoWz2hHcWd8+J1N7IP8T
	OAgNMbDX/QMvYo6UCWe+6gg6QnpKL6Q8YQMXJh0WEZbL06dhQZ8lcr9j50PmL7dU
	jhzj1Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsjryn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 15:51:39 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73a1cf1638fso3780137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Sep 2026 08:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788277899; x=1788882699; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FLXuthiikXhHO9knkRoRDESDV7G87cacEj+L5hg3O0A=;
        b=Uc/UABHEOHAROxPFzdeoHqkk2pl+V86ug0RxrwZSwU8lqexHMEAbRF/zpY68Kl2piB
         yOo1PvEOLmf3ZKyvfCFtyBNAKKmlPrlXi0/BcAMIoJJDKH+h/9tZTCC6qBlY2j/fc0Gn
         UAN0j9fux6h+5zss9fgT8VsZsFGthEuKsgGuf6Vj7cZ7eUvR7f5t00IQ0al+gmXXKX9i
         K3teKwNVO/QhFSi09Jw8yNZS/83ixkjsNsoJw7m9p2bNIDwPHcR0Ohzk6aZD7C9V52lr
         ebvUoh82200BjbA6YSbxoRlBUQBbSkB3VX2izXWk0c/bq+UBYm5qQSCw9ilOMZm/2hGv
         bVJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788277899; x=1788882699;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FLXuthiikXhHO9knkRoRDESDV7G87cacEj+L5hg3O0A=;
        b=IWOaS9jqcXKGfK4V/us2hFqlA2VD1gE3W9dfmEgTgmKBNDq6kVT7QZpWsnU+f7+J+l
         edmiPpTr1i/71weTy3TUQaidLIVwlNy0Xv41i7hc33AAze4RIPqRX6fNW42vu0rSCwcE
         5W5C7OxWgyJYHJl8iSGZzihDVl/DRb9vIABO1hAPn3qDYsgFM8/hWfzxP/U/sksEaEXN
         KNhjpCrsbAdUIvWPPljhpNCe2QHKQoPbugUUsoyu6vGHySoxlANLosbCOqKN2WBrmd4R
         O8xu7Lr6KqnUJpx99gNWrkgRan8jILg+Tk7Ki6AewxHGIQDkAxtA6baVWRrDsf3W//2M
         UcUA==
X-Forwarded-Encrypted: i=1; AHgh+RpwtsWVgpr+OWctOol0zVbfGvefJQhbnsaZUQ9+s0oMT0qIU4V77DnSdslxIcQtzlyhMlfbsku0V28A0bXO44T7@lists.infradead.org
X-Gm-Message-State: AFuF++kwpSvtd1TInsM8c7dE0BRQ1eNvcYIckm/B1fi1DpvfaQSOffUR
	fLOA5VQ4IXtb8M3v80tDd5eFNpV59wcsJZKBuUfhOl7p7sK2ZlT+cKJGJ53QXDHwQGVLJIgoQEn
	IKicVtQcWRgSSxZpV+1kGuwqEFiClr64QYGjt365lPHxNC/TZvMRLO/VFOUMK+wLBfccTWylxxP
	Vyzg==
X-Gm-Gg: AR+sD11pVea/NPQvFD+JiA83IHXlQR99LLebaWJ91JM1ypPEeMS59SXPNUEv9cHSBZL
	v7IurInHwLhZSFZCOs/Wmh3N04ZdwDtC9CeBrwfdyBOQY9JRn1Ip3ts8UNcj1JDgKdZxlwZLh43
	dcv8O9SuS41tqilFqHTCPXC5z97UikdtldzLXxvc/W1thoLYKhqQe14unS7DdfiFEe0eOwXzInz
	TSbKVhev3LWbV1wGj0LWiTtnFnbXUlXjKqKslPshxE9xgW9fOm5FcBFYfHUWiXAlFlELVInrTRR
	gPepz88jmN6ItmlFCTjM2FFbyvCQ2cNgDeG0JfZWWlxN6hlMtpHh8YgHZIQ17IcTCO/ayZTKFEi
	2n0SdzyZrbyy+4m44KINejA==
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4728009137.0.1788277898951;
        Tue, 01 Sep 2026 08:51:38 -0700 (PDT)
X-Received: by 2002:a05:6102:f84:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-78593425615mr4727991137.0.1788277898479;
        Tue, 01 Sep 2026 08:51:38 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1b1fdasm630555566b.37.2026.09.01.08.51.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 08:51:37 -0700 (PDT)
Message-ID: <e7fd5417-19f9-4bbd-ad65-48230fb81c05@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 17:51:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/15] pinctrl: qcom: Add Kuno pinctrl driver
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-9-6d47636a8f09@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-9-6d47636a8f09@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX6CKSqV/puDqj
 Da/W79FcHZRzLSq6X/hvbFn1lqDmoNtFVFX+veBDGjDjXB6yDzhNEhPU+VbyQhpV2/ttAow2joj
 Dnll7V+CaIA7khnvW4fNLR+PQMtQWYs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDE0MCBTYWx0ZWRfX5R9q9B0Tsegz
 vn5iR4bkqS2RP4UQzeUGX2nwkeaFBOKcGN6iaNzCNIkoDJN9gQwM95uIuaGwUf++09tOFWxHu3b
 LUInTZuLIKvGc0fSsYd3rK1ognGcMsMq5uUjDeLu8kRvJQw3/RmyvUoCYbrj7EsBvLPwZ/B7JWL
 O8u9zqw0gz851erv/RdRTOsqp7ZChybYXeWwqCgWRt7BmuY4+X9UgLjreIGinu3vPtSx+kVaeaY
 IpMg6mGdwCCRqKxf6kcAC/r6LS0OIqs9Dm1VSdq54/tCIeK42v9xJFYMbtx2cB4A3xH+nqCXWjW
 cvrY7KDlJFNoCxNf7il8ShcClv+s4EcdzeQ5qSbXcrWFGW0Z3SN6r+hX2UjtKVFd46Y6nRXwcBt
 xlKSjUmsAp3D0v7OdTg8ZFtGuSE5emFswJYPJZaMIX15i0m9MLvLp7Gn5DOfDEGnX+sNrWCj9k1
 7jVrUWbrA/QUIirYq8A==
X-Proofpoint-GUID: OpBCBn8RVW-rz2hTqOdlw6O013ooM0hs
X-Proofpoint-ORIG-GUID: OpBCBn8RVW-rz2hTqOdlw6O013ooM0hs
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96f48b cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4tAzDn1lkwtfZF03VZIA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_085145_283420_5E5F5866 
X-CRM114-Status: GOOD (  12.03  )
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

On 8/27/26 7:51 PM, Hardeep Sharma wrote:
> Add the TLMM pinctrl driver for the Qualcomm Kuno platform, supporting
> 110 GPIOs and their pin multiplexing, pin configuration and gpiolib
> interface through the common pinctrl-msm driver.
> 
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

