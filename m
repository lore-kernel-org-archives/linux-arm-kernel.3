Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5368C982DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 10:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=er85m/VpcaNBY8p0HNqxGDH04XxFCaQjcVPnP1W36m8=; b=tQztQy8l4h8XIw473U3Y1UpwBs
	cLkhjVNNE3wNTczlcsG6PesWUOrC9IKJTbTzH4FBVDdlg7k5RYk5YKTMcy7gBbUARnTU1ntVmRxI+
	5waiN8NX7EMJ1uoxWMaicSlPTcblzrarWHGcCLZZFVx+sHzVMznXIqUiYtC6cXzhr86SmfKCLJymw
	V9swVie9M80PhCsvVy0tFAL+HxjEPA4Xn2xsGzh+aXc16QodXcLBtL4CsUwYrYzVd4Nr+5mzhpB4A
	SfdLslm6kvi3HcVFp0bTLj40/uwAh5ZpeoPR3HaBhc8CKQb+n1RSSFqK1YiUKNjjXaPxWGWUL0MzW
	LScu5lyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bHK-00000001hal-1lnL;
	Mon, 21 Sep 2026 10:29:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8bHH-00000001ha2-2WQg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 10:29:40 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L79rCr1624326
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 10:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	er85m/VpcaNBY8p0HNqxGDH04XxFCaQjcVPnP1W36m8=; b=LUlzHn8YRnxEXbvJ
	XKG1aPrc4ADfe5ljDpO39tdY8iQBQj3etE36KwnOG7OI33BORLbPEmIHiIhaH/yB
	06UpGp0i0/pCDsykgV8t1r60dbrVjGREQesKRCOiGG5x1MZnkytdgxkf54fN5o/v
	rfZlF8i0nGphho/biw5plN7bUZYGqQiXW/Be+z7/iQrErwC29LTvBziqo3fCoyAc
	RWnwZMBiWo1j6oEX2oS/6g54pUVsXRfu0uNSZv2Prx+ubEwVyiMg+65Yo7trFjp8
	JWCenn1jAWhtKLKbTH36jlcybklQtb7+rtYuME5LZ59WlUHtCEh3aCZd1xXYUxg6
	YDegUg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wsvt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 10:29:36 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so5275401a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 03:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789986576; x=1790591376; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=er85m/VpcaNBY8p0HNqxGDH04XxFCaQjcVPnP1W36m8=;
        b=C7jsQekY/TaqNd+TAEdZtC+/1Px3WfIaMOp//sUPpuEeMCvJ8LuBK/VhbE/MKvCS8e
         LLarQBGb8Qn7O1uV9zogZx0mIuAAUQu3eFSo/8xmpCl+5hPj/WuOUlorYrTnoFUIBUUJ
         qBJb0V+KAzcuIP8k3lbK4BJICfa54hz3WkOrUYZiELIZqgKeXK/YjkNF5OyKpw6wxgfk
         k3N8EsmjLUlm1cu8Vnyr0Co6wiEZuCZqB731q/ETHGmFc7cq5PS2KwYrV8+G6/cJ7/e5
         5lia/k7UzQtgNO2OVGU1cGFyUazSgoF14BrUGYtY1ko+YzSuFt2eSNGGg/wS1iwinORz
         TTRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789986576; x=1790591376;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=er85m/VpcaNBY8p0HNqxGDH04XxFCaQjcVPnP1W36m8=;
        b=jRFRtgRlLq0J1JhB4BmB5sS3HUxBnvGze8AymlGil7GbDw4zoH0wIGeehp7DT9uqzy
         9lsmTj/RfmOuXoQuU/ZWU1N1bwo79IiIB5Z/VUB8OPP80VmdxMzl+KGqGdgf0QtwtCSV
         a/+b29Y7EsT401Ip9y+Sx26eU8gAfr6NASPG009DfQaHKMLOsCBiHMkLN8ah2TNdnXx4
         eRq6yblb8NeZsxT0WbVFX5W3Ql90jRZ/bkMu1CxThwf6oxkglQtEep8wPz86eprMq3Fx
         YzRCoUfDEgq3uQGaAzzvXoS9h819AbjDSOzfSTS7i26CphRu4ZfwgqwFFXfcUzxgFMOx
         hJ8g==
X-Forwarded-Encrypted: i=1; AKwUvByp/jhQ72dcVKRO1uDwhvJm3Sd/IyaR4rbk7riwBND76054RwUw922y82ZoHtNxOzTp/YzgWNMS8S5jKod8Pls+@lists.infradead.org
X-Gm-Message-State: AFuF++nTCuyNT+Rvjzfq3LUYSAgxA1VFtOg4Pq0Z98Kw7mUWne0s5H8h
	GD28XxM31RREtzj0FSQ7Mu+OIXCiMgPlA8C1O7lZoM4GH0itZcHM50gzYxUdLlDHO0UlzLVicgo
	FMX93F6y7pWKl2ajkZx0eXZn0KVdpCl5j+j9FkPlPgRMf27IIu167/KXbsnfJQbtodcEpcXy/Ot
	w5jw==
X-Gm-Gg: AYBFou0Vza3M+jGPE3bllOVffW6wKGrvWQviNCK/nl569grgg3QpIUibRiYwm8SKq+W
	2E7UDzBqz9m6x6vGNmwTBWkLtV0kKOTJp1vo26q6coWP7pneSZx1gaPi778UbP6OQWKfsft0YHK
	czILvJ78WFREnZDNvO5IoZS4/iGuZKeaKNSBNOPTcbkOi9xif9PVA55lFsQ5sHMrqlWMj29g0Ix
	lN+sL/lSF/ZuIC+MyjjcGt5lNtfRkWdXWDi/uvqQfyDBtzsZEw+dnwbI0+gdnJFIzEYifrWIVnY
	HcBZnIkZcXy5eGzkQkWzpGglhUHQYAXOHDDbdG6Z5vlmvmtr1EkW3Mxgg77MB8maAAl6C8yrlHE
	YilXQ7bn9BT7Q3O9sofCWpWc0gzBsRIU=
X-Received: by 2002:a17:90a:d40b:b0:3a0:574f:5854 with SMTP id 98e67ed59e1d1-3a0574f5cf6mr1247963a91.39.1789986575756;
        Mon, 21 Sep 2026 03:29:35 -0700 (PDT)
X-Received: by 2002:a17:90a:d40b:b0:3a0:574f:5854 with SMTP id 98e67ed59e1d1-3a0574f5cf6mr1247934a91.39.1789986575299;
        Mon, 21 Sep 2026 03:29:35 -0700 (PDT)
Received: from [10.218.9.75] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144da432647sm29762133c88.5.2026.09.21.03.29.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 03:29:34 -0700 (PDT)
Message-ID: <0e6877df-0306-474f-bc25-aa7d3fd2f53c@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 15:59:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v25 05/10] dt-bindings: arm: Document reboot mode magic
To: Rob Herring <robh@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Lee Jones <lee@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti
 <pavan.kondeti@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla
 <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>
References: <20260914-arm-psci-system_reset2-vendor-reboots-v25-0-4aaf5c09b5c2@oss.qualcomm.com>
 <20260914-arm-psci-system_reset2-vendor-reboots-v25-5-4aaf5c09b5c2@oss.qualcomm.com>
 <20260918220634.GA2441717-robh@kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <20260918220634.GA2441717-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE1MSBTYWx0ZWRfX+dOlwW7BILFI
 fgBMvr8nuKDTqwzjWyHbhSic4NLIQVNRjDrep9oMu02C7/2oRg1FTfObhjOODLuWFQO6ra7O/zx
 Z1swDB1yfNIQIR1uHvM9gIrIsnLGq5u0WX7tNbitws8yv/m3PRexIMxlChbwr6l7HeNgUGk5qgU
 5OWQV+OQj5Z0PgFKCls+weo/kB/bBkj8wpSlwkO8ZNmqGRKVCRuk5LrtilEsblzePD9Q6kKlKKC
 lXwei0XMiJLtdjbBx72Qysy4uDQ5wFeHYK9d29v0u09hy6bAu78ymMDXRmIfAp0Dlkrw8C+4Cvv
 vqyZybzfa64x/9ZJqj0wMuLY3yzFRzPLvV7FNgfm2Ar3iy96hE5jp/TMvJ0IpD/tFPbh4d108qR
 dSPFfj/kr3HTVpH9UaRy6YHAKa/FCO0fwWXq5nTDkavp/sn0O7aM0GmR4CmE3Pzvc9JFRX53aRv
 +NBZQ18deRxLaUaImHA==
X-Proofpoint-ORIG-GUID: -jibHV0R4bIudeZ257zXGfAZWIZ6Is_q
X-Proofpoint-GUID: -jibHV0R4bIudeZ257zXGfAZWIZ6Is_q
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab10710 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=8elzRJZBfmQ5qZguGEwA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE1MSBTYWx0ZWRfX7llQr6GVpwnF
 snC4c5iSfbTk7Hd4K8avjK2FqNp/XDfrQKOhoCS12KwHFBLIl/z8i5GkbRRIMOtqCbE5HHj19lS
 WNTt971bSgfyo3rOEH4lhKtYCQRyQGQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_032939_679619_1A1B1B04 
X-CRM114-Status: GOOD (  11.66  )
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



On 9/19/2026 3:36 AM, Rob Herring wrote:
>> +            minimum: 0x80000000
>> +          - description:
>> +              arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell form)
>> +            $ref: /schemas/types.yaml#/definitions/uint32
> Drop. Types are per property, not per item.

Ack.

>> +          - description: arg3 (cookie_lo in 3-cell form)
>> +            $ref: /schemas/types.yaml#/definitions/uint32
> Drop.

something like this?

   items:
     - description: arg1 (vendor-specific SYSTEM_RESET2 reset_type)
       minimum: 0x80000000
     - description: arg2 (cookie_lo in 2-cell form, cookie_hi in 3-cell 
form)
     - description: arg3 (cookie_lo in 3-cell form)

   description: |
     Describes a PSCI SYSTEM_RESET2 vendor-specific reset type.


thanks,
Shivendra

