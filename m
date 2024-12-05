Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43048E77170
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 20:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSWttBsTE57I0dgkpiUfRdyPs2BFjo5vj9pPO5KQXeQ=; b=48cHhwUntwIBkIAvPQOWUxe9N6
	BmTNdLejGoEkzA2y9wTOedLPuIkH4dT8RU1VYNJTmg4tl/kvcrg5Agh9/B1dAiaaUphd16i91C/aO
	fAgxurhFzrPj7JSnpWWlPvm1HlgNRZV7pNKOR3P+mvb/OGY94gc65Z/kWpEggIyl221qhk1apsrlZ
	vpsR2qDH4J7LVKPbXIht0ikpbbQDzq7pYqBVxfhydlgttzCsY2bE6Bc20HJdHPaVV2C0B/FI6Wiu3
	aQ6EXXDb+ZzCOwCPiqRaHqJ63qbPc49Yi1DCs/JCW4AQv5Yg2cMv7+ciWn8aN2h4Sayq6s5AsiMlc
	9fsKAGAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJIAD-0000000HHii-2ssN;
	Thu, 05 Dec 2024 20:09:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJI9A-0000000HHcP-2VRN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 20:08:26 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5JhfWl018610
	for <linux-arm-kernel@lists.infradead.org>; Thu, 5 Dec 2024 20:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MSWttBsTE57I0dgkpiUfRdyPs2BFjo5vj9pPO5KQXeQ=; b=RL2xSyyyP8YavVOX
	Hsb0OxFlGX4EsgWMPokslN4aQAKToGXTCRDkknbb9XWX5omNa1u5KOvXwG/b8QHv
	GTUZwKV/bMfv088EpKqRgKb6iuVXATLuU/TwScRcGTh7AqC/OgPygJ8FM7atHUfZ
	jJXrDCnv2Y8G6Nv0xentD6wU5ZtRdl7+lh0vwmNXldkPHIHROvKPgnCBK6PfRVcC
	PTdsvQM1nF6uQq4OG64Qn0wFIY3XbgiQ/r39DkxRDb2DsZbflmQxeYlIkTeL2xsB
	8b4VSJi5EK3P1JaUxUYyTIVZ27B3uU+94b0dZCqPXS+hK7xO7PbTZFAOxuzMfkkM
	16uScQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bjk8r1s3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 20:08:22 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4668cee0202so2292681cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Dec 2024 12:08:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733429301; x=1734034101;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSWttBsTE57I0dgkpiUfRdyPs2BFjo5vj9pPO5KQXeQ=;
        b=g9DrQoQdHJir3pjVmNrV3DUFTnp4MJXEO0bso2IcYfnXnp2NCAQHr/LV2oxq4sewYO
         CNmKtNytnJp87cHZaEAzP+BocofCAc9nLRC7P4ywOyx+/KwjVngoqsD1pKe7FLhxxCjv
         OsiiQT0UKPbs7WhJWf4I9Kv0/ue16yrIjZhonJYFjGo25WL2aSf2BYc+iCln1R5hHT9a
         w9bbSQ8Lb56PwqcGwSqVstyjXCj9/lPGlZCKjdX33w+uwuNb2SzVuaK6G1tdKHK3VSEI
         t9kyZtYNO4klBsJ32mV29vm51qACx+ZBBtQpEaU3BdmgzETcwzE5fcMBb98Qc4ZIljqU
         Lhgg==
X-Forwarded-Encrypted: i=1; AJvYcCUYHZYToWSMYkvP83vrEc6YM0vLZAQTjMs/+WlPmyw7cGBgsLkTSKdDA+KLV3jCGz3XGjVLkNAdSCW70GKcw7fw@lists.infradead.org
X-Gm-Message-State: AOJu0YxNqJtKnC9VDYxY6qMi7vE58C0q79ydmz6JdD8j29C+SFKZO0/d
	0PvzsghZDTEIMs+FX+UddxA4/En69xdJT/wX/ZptIeDvKbTFjTs/2lzindQL4aD/+c5H8EnA6R+
	q8tQYfN4Du/TPD8bO3m5oghvtm6gK4lnR2PSj+5VgNSe0T4CfcMVbEQqF1607vj0nMXPnuLJXCA
	==
X-Gm-Gg: ASbGncsKLvniAn3lY2OEwGf+nSYYbp17nLpsAh3LYYS3FugZ4HT0Xqfs9Pmh7Batv2b
	s1k0SHC+jnCIcPiVKF51ItR81HZIIgB3Y6SdRworsH2Xlxlj9ijIO62elp81OYggBCQ3UdPL3Jf
	AvJ9zgbAaKLFqCeD1aB3a5pEVQAF43vuU5eu76E947eykgoTX/rszFoQOpl/rHrCBxj/PsJITY0
	JfOakI9r5HHUo7PSAvsMea3q0dvD2mQYus2PF88pGuMwSWK2Wm+QDHnYi6dwaHJsgpa9hpox3EV
	DLMef4Wh6iYDAhSyx/9y+x21+Gk5jZ8=
X-Received: by 2002:ac8:57c5:0:b0:466:85eb:6115 with SMTP id d75a77b69052e-46734cbcebfmr3521761cf.4.1733429301669;
        Thu, 05 Dec 2024 12:08:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IENWeLRL82VIYrHXYdiNhw9kTjkxnGvdSXgGJfUUH0aLDplqI+DyD9FADUsRMY+ulGRr3TQoA==
X-Received: by 2002:ac8:57c5:0:b0:466:85eb:6115 with SMTP id d75a77b69052e-46734cbcebfmr3521561cf.4.1733429301249;
        Thu, 05 Dec 2024 12:08:21 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d14c798f98sm1180454a12.57.2024.12.05.12.08.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 12:08:20 -0800 (PST)
Message-ID: <3270d558-df65-431d-a347-e40bf3f3923d@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 21:08:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: arm,psci: Allow S2RAM power_state
 parameter description
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20241028-topic-cpu_suspend_s2ram-v1-0-9fdd9a04b75c@oss.qualcomm.com>
 <20241028-topic-cpu_suspend_s2ram-v1-1-9fdd9a04b75c@oss.qualcomm.com>
 <ZzSe4UAyil8KUm85@lpieralisi>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ZzSe4UAyil8KUm85@lpieralisi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qaDQ08zY3Dq7afuAwB-TlF6D1vjxDxXT
X-Proofpoint-GUID: qaDQ08zY3Dq7afuAwB-TlF6D1vjxDxXT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412050150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_120824_790471_38F74358 
X-CRM114-Status: GOOD (  21.04  )
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

On 13.11.2024 1:43 PM, Lorenzo Pieralisi wrote:
> On Mon, Oct 28, 2024 at 03:22:57PM +0100, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Certain firmware implementations (such as the ones found on Qualcomm
>> SoCs between roughly 2015 and 2023) expose an S3-like S2RAM state
>> through the CPU_SUSPEND call, as opposed to exposing PSCIv1.0's
>> optional PSCI_SYSTEM_SUSPEND.
>>
>> This really doesn't work well with the model where we associate all
>> calls to CPU_SUSPEND with cpuidle. Allow specifying a single special
>> CPU_SUSPEND suspend parameter value that is to be treated just like
>> SYSTEM_SUSPEND from the OS's point of view.
> 
> For the records, the info above is not relevant.
> 
> These are generic firmware bindings for PSCI specifications - how CPUidle
> is implemented in Linux must play no role here.

[...]

>> +  arm,psci-s2ram-param:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description:
>> +      power_state parameter denoting the S2RAM/S3-like system suspend state
>> +    maxItems: 1
> 
> NACK
> 
> This is nothing that has ever been specified in the PSCI specifications,
> see above.

Thankfully, neither do dt-bindings have to be limited by any software
specifications, nor is this a Linux specific problem.

This is simply non-discoverable firmware interface description, and
DT is the expected information provider here.

The TZ exposes a way for the platform to enter S3, through a call
that is usually not used to do this nowadays, but well allowed by
the specification, even after PSCI1.x.
This property lets the OS know what to pass to said firmware to
request S2RAM entry.

Section 6.5. of the PSCI design document recommends that within the
StateID magic value, a section is dedicated to system-wide (not cluster
or core) power states of "retention" or "powerdown". It also makes an
appearance in Section 4.2. in a more general fashion.

Konrad

