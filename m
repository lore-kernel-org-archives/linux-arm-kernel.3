Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E04DBC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 19:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OvJzrl+/UhBa3hmO88GolGsvDJxBlDvFKg+LbxKyh0I=; b=s1KaT7p67hEQJIV8jachKEOl2U
	c6OU74L+F/YtA+TSIuVxfjTGG3JH5SNtotnTpDDHrHgHJ2k5iBYvO3bqlDH+wQzaMp/P84f+GiVGG
	GpiUtBxDtvJl8wWaXhiGTi1+zyAbxLx9sLRa85IMkN3sc7Ki4FfOl1e2XJBoHhLNCkVzwK6c7yWhB
	iUzznNp5QzPGLD5+z8k6UkbEzxfYxeMzoWUH7/4qRPuakQLggk5KnRW1RkNqVKnmbEmbAsshmsWyn
	CjnJ0rk1r/jboRKzMFrB7w59n/GAzU2VSAkEPCy53zKS8Zy3q26HDQ5bhUXy6gTlMUk+yFbT92FCg
	kkKMJlow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugTiz-0000000FIQq-32db;
	Mon, 28 Jul 2025 19:41:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugSbb-0000000FDJC-2JBp
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 18:29:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlMis012164
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 18:29:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OvJzrl+/UhBa3hmO88GolGsvDJxBlDvFKg+LbxKyh0I=; b=op+JZmYrnrYaiWf9
	IGp3irs3z6UtuOaL1T6sn68k5fQnJKYOdAIy+9hLRn95GzpMzoxWoBJpLaVgL3D2
	HdNtuN2Io4BgLvzgTkem+QbYncYROwAAImE4kfdJLXGuoS5z59ykf4pF9xMf1q+0
	IDsYzA/6AtGblKj3szpW5Z+Jel4+v2WeOrWMqQ/zlilvBRc0qbRz9E+Ka8DRf8ss
	lqCyU0Sc9heQ2h/eWrnGX/CnF6Pq2m4goK17gdFfYGwoLfzmxwdo5SZiPIclM3EQ
	e+g/LprGV4KIl1YHU7d2oZjsac3UF2cc58Z6D5VDvU3kQLU7ik20uZ5Tc0jEsYpO
	K+QD8Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qsk5g3a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 18:29:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5cd0f8961so957221785a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 11:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753727385; x=1754332185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OvJzrl+/UhBa3hmO88GolGsvDJxBlDvFKg+LbxKyh0I=;
        b=azUfuRqO0CHeCLeyFcqApWq8EctCGIE/K3ZSPTekKr97DNUnKcrt98mkDRdDPSyHIr
         Dy9XyYe7C4RfaXn21ovaWcJW6Em5qxVkJsS+wNjAtHzUoABtdz1KLXIpalIjFEZgYYdL
         +rUR7PIFRManA4HvorY7/bUcfBQrInxr+1GriqcUz4ddSHJMLaFku4KzVMm7ASZeZw35
         WA24uo2lXfQyOuYvYagJGnm1vf721LI7d68Lj6ijdOp3FYzL6/VFYxF1HZtOljUw+4uh
         6P0bbNOmD+ha+Nb2VBbZDar3YdWR2kU3+zdTvgoaN06iungfyCWyG8x2LPwCFV6HcsuH
         2mdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW/W+kZRHYyLrIKZ9oW7qPjuNdncgd7IG8+zzthsr2NV3QNIWPB/VW4vPl6hDoNGdQOGgE/Jgwh5LI9FygADx8@lists.infradead.org
X-Gm-Message-State: AOJu0YwgDAT95vQC0lUR5WknK14hx1DuItjbrHI3nZgNpBmSGP6/M5h6
	Ig1hONMBGHnpN17KXEzRdl3AamllB5XrpOTfXF9cyfS7h/VIlplAOgRAPAiFXVNJtFlUu0TgzO3
	xCZKrz8KHRZHeViuhQ7348eA67sd9vGEs48N5gJeMOTdikEeVVCerLL8bqiQIFL8Imj3NIPGuOm
	o2dw==
X-Gm-Gg: ASbGncu/XsvqA1yj8g37HPKzpLPdvq4GsK7JWMtIyG2dw/DKTsU1L6reOZHilJCdddn
	5Za2satXYUuDgqT6FT7eUfyuUN1N/ZojWN3dJIBGgHEQqY+xriJnidn8nepH0hOpf1jp1vh2zu4
	Io6phC6wiOeJxk4DRyJ+15cRQO25BDNfoB8GPsyf0YAd7ahM2bX+xySQqUBtBO9Yq32z2Zj/arr
	e0c9QzbXANQHLNWTDdz4Ela+ydTd92OWipetgK1o1iKamCvXFmqcGHQWm6CQVb1ltr5X8+cgJm7
	VjwxejlsmeXX89hYVYz0yXig3VScJmhgLHexmCwjx44vD6H8YAfV0C0OXSgkcRNzC22y9bCLPaa
	i3bZAHx/cO8OPR39wugtofKizA1gTqoxLxDgM/jKWAbyNzTnyBC3MOAI/S2h955KRueQXyE1kdK
	VNpLJE4NZA6KdocJREbw==
X-Received: by 2002:a05:6214:226e:b0:707:159e:d1c9 with SMTP id 6a1803df08f44-70720658229mr164970496d6.51.1753727385156;
        Mon, 28 Jul 2025 11:29:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSNgPB3zFf6oPz//UBdRYzoglKZ/sN+oF3kbq9PUMHp+iEJ5arlOsVMtajvVAOtS+w9j00QA==
X-Received: by 2002:a05:6214:226e:b0:707:159e:d1c9 with SMTP id 6a1803df08f44-70720658229mr164969656d6.51.1753727384396;
        Mon, 28 Jul 2025 11:29:44 -0700 (PDT)
Received: from ?IPV6:2001:14bb:cc:47df:51b5:3653:9304:7ee7? (2001-14bb-cc-47df-51b5-3653-9304-7ee7.rev.dnainternet.fi. [2001:14bb:cc:47df:51b5:3653:9304:7ee7])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b631a186csm1366470e87.78.2025.07.28.11.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 11:29:43 -0700 (PDT)
Message-ID: <2d672126-ca4d-411e-89cd-f40f8d8a4f5e@oss.qualcomm.com>
Date: Mon, 28 Jul 2025 21:29:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 07/10] firmware: psci: Implement vendor-specific
 resets as reboot-mode
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
 <20250727-arm-psci-system_reset2-vendor-reboots-v13-7-6b8d23315898@oss.qualcomm.com>
 <b81aa592-a66b-457b-9f42-df4505b28508@kernel.org>
 <3gtlf5txxtioa5bvo6o467jupyoam4hjhm2mdiw5izv5vbl3tz@drndgp3tcrgo>
 <bcef34c3-98b4-454c-8138-c73729e17081@kernel.org>
 <5e2caeb7-360a-4590-a36f-ff1ec4c20d31@oss.qualcomm.com>
 <2a39c0ab-edd4-402c-95a0-a6286f03102a@kernel.org>
 <1926e6e0-70a4-67fa-5e91-cd0155af1eac@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <1926e6e0-70a4-67fa-5e91-cd0155af1eac@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KdDSsRYD c=1 sm=1 tr=0 ts=6887c19a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=v3ae4HcI9OlR9PdQa4UA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: o0SnvqzONALtzepfPtniC26lL3Qtj986
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDEzNSBTYWx0ZWRfX6iQuqyFeYWJ0
 +5dXJhPF+1FcDDB4n00P/jiUopA3ApEhdSCqQicvbVuPOePtTIE69Tmlzwc36aGlVjLw5osQgeS
 QBTOOLCFJx51YAXLRXhfmeOEld3+HuZKwfa+6Igzoap3RZU+mMwkhTbsOTtxYFGh/YfAUyFcTCA
 0/ws0ajEsiJ87Gdrr51ZLbAYCT+SW1elFuC6nUXVh1sqjb8lVE8mpE7Ki+j99mA1qPLlgTrrQgZ
 iacLvqiVkLbxWa9Eo725ft5ZPKWmtO3Nrmi95yDrGFFJgBnMa28OikFXheQPhxXVg4s2ir3Fl3C
 Yhp0b/UYWjZOT9dunShgVJ5lVIL2bi0oMk1e79U9BPWDVxz5QkSZy8QbUO2JLjGwskZYLbYTIFM
 3VpgUtClZvn9NV2Yzm8Cd7EHS88Y6LM5iLeCmWhh1G5M1iVUH16d7j3cvbtKFhFa1Suxe+UN
X-Proofpoint-ORIG-GUID: o0SnvqzONALtzepfPtniC26lL3Qtj986
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 mlxscore=0 spamscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=982
 lowpriorityscore=0 phishscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507280135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_112947_611200_903906D2 
X-CRM114-Status: GOOD (  18.98  )
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

On 28/07/2025 18:54, Shivendra Pratap wrote:
> 
> 
> On 7/28/2025 5:53 PM, Krzysztof Kozlowski wrote:
>> On 28/07/2025 14:03, Dmitry Baryshkov wrote:
>>>>
>>>>> and the reboot-mode is defined in the
>>>>> previous patch. So, I'd assume, the path is defined.
>>>>
>>>> As I said, path is not. only psci/reboot-mode is.
>>>
>>> Do we have an _actual_ use case where PSCI node is not at at root node?
>>
>> Yes, many cases, because it belongs as well to firmware node.
>>
>>> If not, it's obviously a deficiency of the schema. Could you please
>>> provide suggestions on how to describe that in DT schema?
>>
>> I do not see deficiency. There is no ABI that psci must be root node, so
>> there is no issue to fix there.
>>
>> If you want to add such ABI, I will answer: no, don't, because we do not
>> want paths or node names to be the ABI.
>>
>> Compatible is the ABI.
> Will define a compatible for psci->reboot-mode node and use it to find the
> node. Hope its fine to define a compatible for reboot-mode which is defined
> as a property inside psci?

I think it was more about finding the PSCI node.

> 
> thanks.
>>
>> Best regards,
>> Krzysztof


-- 
With best wishes
Dmitry

