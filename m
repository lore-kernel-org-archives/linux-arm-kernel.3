Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEE05E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 14:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vu6zYvRhveH1aQ5tqrWnMeH/DKiFK4P29CLhabZGtgI=; b=mTUZw4pinG4q08M8+H/U3wOmiG
	bopWJBjAeOX589iqrLCGDftNukVMwGRVt/AvP4S2YyaW+3tA8LTrVOYFRRpbynaDAd2AioJZclARZ
	vhEvT5AQYyKaWSZDl9j0VxZhZKrfNG9C6GPnYLOOcirLZaYsWKVbXTH0/QcqLC3DJR47u43TMpa56
	fqZhO6Gt91JhKSO97oJaD03ALSYYxOmylewJuFbpmZjjgVeQgqLnlgYgwvefUS5Vo6UTAv8OfZvF4
	vEjrOv5T9qUEEOcZR4Qsn3Z5kxRDZR9zy4NYXmwesDuhXr3enDwpt5F8WkOLeagEros4o8CImkF7+
	ZVNbRgFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOduD-000000058Ms-36La;
	Fri, 20 Dec 2024 14:23:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOdt2-0000000586E-1NHf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 14:21:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKCeV52008155
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 14:21:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Vu6zYvRhveH1aQ5tqrWnMeH/DKiFK4P29CLhabZGtgI=; b=iaWSZsD8KoOMnYJD
	5+5lpE1Z8adJZdTnNKXpjNePmUBnh/uUCQo+UdwASToOluAKa72T4mE4ZP+HKdYo
	w7NiWxSSmQx+y6xpW6ubVsTiZmiOONplLruAeeDdeF5H9yaYYluS03AdNa6NOkm1
	wKvLxRbsqt/ymSsItjfIQOhoE0YFD+Jay3PHqB6T1SxEET54bDY3Regt1WdvHvfa
	RPv4wJfUmMxwnVXfKZgnOlZac8VMnTx52d9o01liFKY+diFUKirfWy4WYpG891kB
	AnN4hD/qzaTkC65qC3vHsPPfppeJmvbKKPqHtUtFnVz3YepDUr7ltOv2sU1moMnu
	xo4kKg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n8sgg7h5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 14:21:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-467a437e5feso4600161cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 06:21:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734704510; x=1735309310;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vu6zYvRhveH1aQ5tqrWnMeH/DKiFK4P29CLhabZGtgI=;
        b=HpFJGiovwKEodQhYAN5RoKhwluIg04WUEsWi708Tytzk3mYZkQ4rHHVywgnpNJhRMS
         6gUbAoZrZP+YUOx18GuNZm9A77wgpaw5+HDslT6IB5nRUAk7/s5dUX27IZtL43u3ouja
         FYFdESFbzcWyTrRIpl5iopMxD75bIuCsSBkvnyrqT0/59/0lVCZLpXToJL1Yo1t5q8TU
         PsxP3xiZ15MS/aMjb9hQVstGJPCAXMQferHteWuk1eezjgKGYcuoqgBfIzQWVxTfuRd6
         DaZyNyLmLWdj3Xhho6OeLVM66rdwbWFoH9nCmEz5EV0hTFUMkO2gWxbwdn2wPHoIZim5
         ePnA==
X-Forwarded-Encrypted: i=1; AJvYcCWpITf7l2bbcrNqVoja3gK3m0+bCZrPl6tnhpYmxJLC9bSnB0BehKGXs0PZq6zxQeFG1HReIyKNyCb+GtFVaEcz@lists.infradead.org
X-Gm-Message-State: AOJu0Yz70MO0G242t/bak73N2aVqmCwiA4ABIn4oPXRhdr76oClTECkt
	b6D71my+TzJJ9ziKl3mGgdxQvhJ3sqVSDQpJ3qhnG7+zkgcyiOZqlIhSHtDKFRgeVXb2wmsCiDr
	Y7KqUyTIPWTt8FO1cN7HK4DJfjUnXPua3EFFulk2hRF1dP4vUjF5xpVrr0UtryN3FlYeSEM+UHg
	==
X-Gm-Gg: ASbGncu/SsmpLvhuuypdMw+24wOVBS67qvzaCa8XEawiInA9RIyq4ONpbBVKo/Tq2yP
	aZqpsLZv3usgHMvjyx7XRY10PLru4wThNl1Erl1nufKkoejDGFRYaup3QYkiJJiycwYUk6z3Z7E
	lxqF/sVWNa/fYSqisxDym3SqLbBfdgH9QaNVGi18uRnJ3xCW34HE1zK0fzRgYHmg85OnM4vIyLV
	bN++vCS7goGo7LWfQqET5wC5ZdNa59zKm8VHk8fV7GaOFXMNC50GHgmmuDP15aLc3hkrmrPpp3j
	N6Q0yZj0dHIhTsNjWMW/+B2zd9bE/LNpLpw=
X-Received: by 2002:ac8:5dce:0:b0:466:8e17:cd1f with SMTP id d75a77b69052e-46a4a8bd2f0mr20728731cf.3.1734704510496;
        Fri, 20 Dec 2024 06:21:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/huOKz3oK3ncU1RlSH6JPb5PAB/jklXXog8HcSxMtduI2FodLBdwfml/OQZAz6MVvpKX+1A==
X-Received: by 2002:ac8:5dce:0:b0:466:8e17:cd1f with SMTP id d75a77b69052e-46a4a8bd2f0mr20728491cf.3.1734704509990;
        Fri, 20 Dec 2024 06:21:49 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701b148sm1767714a12.73.2024.12.20.06.21.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 06:21:48 -0800 (PST)
Message-ID: <b533ab3e-41e8-4078-99c9-1a9d80470279@oss.qualcomm.com>
Date: Fri, 20 Dec 2024 15:21:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm,psci: Allow S2RAM power_state
 parameter description
To: Sudeep Holla <sudeep.holla@arm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241028-topic-cpu_suspend_s2ram-v1-1-9fdd9a04b75c@oss.qualcomm.com>
 <Z1LQOmEfFy640PjG@bogus>
 <54cc4221-ba5f-4741-9033-20874265ca01@oss.qualcomm.com>
 <Z2VUiHWHgbWowdal@bogus>
 <349bac70-87e0-4870-a3f0-9f6a3b3e6824@oss.qualcomm.com>
 <Z2V3amqWYDUWA2uM@bogus>
 <c80c4cdb-48e1-4b6f-8ab8-fad6e100af00@oss.qualcomm.com>
 <Z2V5WMN5aHQwQlNH@bogus>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z2V5WMN5aHQwQlNH@bogus>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 7ICCux_mA7zBrSKKMSNMcyP-3NJRHZLH
X-Proofpoint-ORIG-GUID: 7ICCux_mA7zBrSKKMSNMcyP-3NJRHZLH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 bulkscore=0 mlxscore=0 impostorscore=0 mlxlogscore=726
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_062152_384510_678DC25C 
X-CRM114-Status: GOOD (  13.67  )
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

On 20.12.2024 3:04 PM, Sudeep Holla wrote:
> On Fri, Dec 20, 2024 at 02:57:34PM +0100, Konrad Dybcio wrote:
>> On 20.12.2024 2:55 PM, Sudeep Holla wrote:
>>>
>>> Please take a look at the preconditions for both the calls. They are
>>> different.
>>
>> Which is *precisely* why I want to tell the OS that it's a S2RAM state,
>> so that different actions can be taken in peripheral device drivers.
> 
> Yes we do that for SYSTEM_SUSPEND. And CPU_SUSPEND is not SYSTEM_SUSPEND
> hence 2 different APIs. My NACK still stands.

I'll just paste it here one more time to reassure you they are indeed
the same under the hood

https://github.com/ARM-software/arm-trusted-firmware/blob/master/lib/psci/psci_main.c#L179-L221

Konrad

