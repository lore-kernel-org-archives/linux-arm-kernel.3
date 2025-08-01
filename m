Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43A6C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 15:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lt+kQ7McH5sRGmghXsbUCMvK4L4oynntQ2TamYlNhnI=; b=QopCE+ptFSsePXAyUDsEsfbMTY
	sOLZgHhz+5OoeEaIWXxue8HCIfIZrjWb0v0RNfyU9Pq6F4EZo0ipTlTW8ZGeJsBCxdMduqNbrhol6
	FL/maQG2FiJJELMLVlD8glfPdWh6XRQnqKutiU3tAu1uryHNMEzYD7nzx7C8CUl881YJcs+qooG35
	GvH2+97VreXKi1G9/hBVkIbmqs7CTyVP0q+xrUdVu/KgeGz0WKbSF/qB7qMvawpjEjM/gvrGICILe
	eszLcjgvXC6EiNr3HCWWYJEDWvexVfyKoGAL4oehHZRdgRwu5k/UbnYZM4mQ2Lfz3JZsgxPh8omKd
	YvvbvMmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhrOs-00000006Jrh-40he;
	Fri, 01 Aug 2025 15:10:26 +0000
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhrGf-00000006IXh-2DWE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Aug 2025 15:01:58 +0000
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571DLPfx022211;
	Fri, 1 Aug 2025 15:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lt+kQ7
	McH5sRGmghXsbUCMvK4L4oynntQ2TamYlNhnI=; b=PytfLmJRG6ekqjeyPXYA4V
	/t3dNoKpzCPSPVeEvUn0hZiWm10qNH0V2GqJ7FM5tcN6vXFq5vEep4nGTlml3cZa
	P6ThZ3yqjacIG0MR+ISQRu9ZMhiIqhPf4zFjGw3J1Nj0kJ20WSiIFAkHoThiiAuQ
	822ZmX1UxgFYbRllE9QxyEKn2dUCeO8e50JY+VbG4EKRVuASv2zY+sb+3TJWjWSc
	T+MBL7brMN+wr3tIW1Dlkrq7DHvcLsXhJYECUjeOzW2NFpuXjPIQAsrj0Xi0z4IQ
	J1fDmitrb3ZfbxI0J0o3d5wWUENKjWzFY0cEQzIrZEjjKZOkQMwabPR6tqjLh/dg
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 484qen9dq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 15:01:41 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 571BP5rM028745;
	Fri, 1 Aug 2025 15:01:40 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 485c231hte-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Aug 2025 15:01:40 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 571F1dSk28115698
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Aug 2025 15:01:39 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C6835805F;
	Fri,  1 Aug 2025 15:01:39 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B9B6258051;
	Fri,  1 Aug 2025 15:01:38 +0000 (GMT)
Received: from [9.61.163.64] (unknown [9.61.163.64])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  1 Aug 2025 15:01:38 +0000 (GMT)
Message-ID: <95c99ebb-10e5-4207-bd1d-24e36394fd81@linux.ibm.com>
Date: Fri, 1 Aug 2025 10:01:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] dt-bindings: fsi: Convert fsi-master-gpio to DT
 schema
To: "Rob Herring (Arm)" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Ninad Palsule <ninad@linux.ibm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-fsi@lists.ozlabs.org
References: <20250731-dt-fsi-cleanups-v1-0-e7b695a29fc3@kernel.org>
 <20250731-dt-fsi-cleanups-v1-5-e7b695a29fc3@kernel.org>
Content-Language: en-US
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <20250731-dt-fsi-cleanups-v1-5-e7b695a29fc3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: aPLBHWDjHFEYa4L9irlg7eXC3WVEpdQ2
X-Proofpoint-GUID: aPLBHWDjHFEYa4L9irlg7eXC3WVEpdQ2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDExMyBTYWx0ZWRfX50HWHe6O/NhW
 NG/+0m/sno1RZznzW9dW1u3hoC4eQ9yO4InDY1lSQxd469mHKhvHHmxd851o9UPsiBt1LPTw6nP
 65Z3TkoIY3qCmIQuwNshk5EdFDy5TDUjsLt6QFGLj1s+aRcFSyl0hYtMLPiFmIPtVyCqvin3dAT
 /bVBVu50Cr8MVo9JWKSAxx0Fu4lfjuLiUDsMlEG3M4y6i62bYJ0pD+pKYYKf9XQBfHRSy0S8BP4
 4nFcVS46gKR0XgDvzYyftPbYhXCU9oQwzCLaruV44220YbseDpLTrldLoV9qoLZddM348IU3Bhc
 rVLiWKhWMVDQiNutgzAVJmOuKvJY+eER/ORREfCkBlXlFBCGYlhw+eB0k9eQTdb7oEjEQ7TeQQw
 /uoOWjRQr0l2T2L30KyundAwTn3+ChI/u1vcDrMfm60tVO7LTFnrfz8Y4xlfNcksX+Z23pwq
X-Authority-Analysis: v=2.4 cv=BJOzrEQG c=1 sm=1 tr=0 ts=688cd6d5 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=gEfo2CItAAAA:8 a=VnNF1IyMAAAA:8
 a=VwQbUJbxAAAA:8 a=nKviLkHTvBW1IRR_sG8A:9 a=QEXdDO2ut3YA:10
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_04,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 mlxscore=0 bulkscore=0
 adultscore=0 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508010113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_080157_578865_9A74FA22 
X-CRM114-Status: GOOD (  21.19  )
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


On 7/31/25 17:12, Rob Herring (Arm) wrote:
> Convert the GPIO-based FSI master binding to DT schema format.
>
> Drop the "fsi-master" compatible as it has not be used consistently and
> doesn't represent anything.


Acked-by: Eddie James <eajames@linux.ibm.com>


>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   .../devicetree/bindings/fsi/fsi-master-gpio.txt    | 28 ----------
>   .../devicetree/bindings/fsi/fsi-master-gpio.yaml   | 63 ++++++++++++++++++++++
>   2 files changed, 63 insertions(+), 28 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
> deleted file mode 100644
> index 1e442450747f..000000000000
> --- a/Documentation/devicetree/bindings/fsi/fsi-master-gpio.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Device-tree bindings for gpio-based FSI master driver
> ------------------------------------------------------
> -
> -Required properties:
> - - compatible = "fsi-master-gpio";
> - - clock-gpios = <gpio-descriptor>;	: GPIO for FSI clock
> - - data-gpios = <gpio-descriptor>;	: GPIO for FSI data signal
> -
> -Optional properties:
> - - enable-gpios = <gpio-descriptor>;	: GPIO for enable signal
> - - trans-gpios = <gpio-descriptor>;	: GPIO for voltage translator enable
> - - mux-gpios = <gpio-descriptor>;	: GPIO for pin multiplexing with other
> -                                          functions (eg, external FSI masters)
> - - no-gpio-delays;			: Don't add extra delays between GPIO
> -                                          accesses. This is useful when the HW
> -					  GPIO block is running at a low enough
> -					  frequency.
> -
> -Examples:
> -
> -    fsi-master {
> -        compatible = "fsi-master-gpio", "fsi-master";
> -        clock-gpios = <&gpio 0>;
> -        data-gpios = <&gpio 1>;
> -        enable-gpios = <&gpio 2>;
> -        trans-gpios = <&gpio 3>;
> -        mux-gpios = <&gpio 4>;
> -    }
> diff --git a/Documentation/devicetree/bindings/fsi/fsi-master-gpio.yaml b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.yaml
> new file mode 100644
> index 000000000000..21bfbad595b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/fsi/fsi-master-gpio.yaml
> @@ -0,0 +1,63 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/fsi/fsi-master-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: fsi-master-gpio
> +
> +maintainers:
> +  - Eddie James <eajames@linux.ibm.com>
> +
> +allOf:
> +  - $ref: /schemas/fsi/fsi-controller.yaml
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: fsi-master-gpio
> +
> +  clock-gpios:
> +    description: GPIO for FSI clock
> +    maxItems: 1
> +
> +  data-gpios:
> +    description: GPIO for FSI data signal
> +    maxItems: 1
> +
> +  enable-gpios:
> +    description: GPIO for enable signal
> +    maxItems: 1
> +
> +  trans-gpios:
> +    description: GPIO for voltage translator enable
> +    maxItems: 1
> +
> +  mux-gpios:
> +    description: GPIO for pin multiplexing with other functions (eg, external
> +      FSI masters)
> +    maxItems: 1
> +
> +  no-gpio-delays:
> +    description:
> +      Don't add extra delays between GPIO accesses. This is useful when the HW
> +      GPIO block is running at a low enough frequency.
> +    type: boolean
> +
> +required:
> +  - compatible
> +  - clock-gpios
> +  - data-gpios
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    fsi-master {
> +        compatible = "fsi-master-gpio";
> +        clock-gpios = <&gpio 0>;
> +        data-gpios = <&gpio 1>;
> +        enable-gpios = <&gpio 2>;
> +        trans-gpios = <&gpio 3>;
> +        mux-gpios = <&gpio 4>;
> +    };
>

