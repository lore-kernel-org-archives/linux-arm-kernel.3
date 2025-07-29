Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5406C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 03:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+KxXIkqbzjBGr5vRnRk2sdhKE3MD5Ak/KadxWElxQAI=; b=pHMICGxgAJ8Q4RkrujkbK0pU92
	Oro/4NDQKVpp89UvaJor1i2ZefYoQKrAGnNpwHtWJaHW0Z+ZMUvCMZKTu54Rz179MOcewv4fLBs0u
	4RjvVbCXnvuECR6nT0oWhluJc+cOVk1SaRP2YBE/wBRszKpgdereq80UUgomtwU1IeI0Q5xCsNNI/
	5Bx0jUYZNMlk3B+uIAZx2BU7m1EYFpwDcBwPQq4VfD/1RwKKO/c61dPsiM9rKp+JI5mG+yWjFRAUX
	2TIpZhPVpRdDMDjn3U/cdPnSdhwFXVmP3FtS6T4R2lDXPRfG1GEl+/wU44D8Xsw1BNN8B40COreur
	flXj759w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugasd-0000000FplX-3C5P;
	Tue, 29 Jul 2025 03:19:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uganz-0000000FpPD-1LRM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 03:15:08 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SMGkAS012528
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 03:15:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+KxXIkqbzjBGr5vRnRk2sdhKE3MD5Ak/KadxWElxQAI=; b=dPz6W0iBPnAWNh0X
	289xMEPISgZerETop/Q3bva5xdQODTGleBgzGdpB5Y8lIbHh2UbKy4SXYbHCNUfu
	OWXPP3T5OVTuE63q8qsloEyDTydSteFO+nNgYrrdhhwLPTldHk5Kdt5tqzklrQWp
	eou+l1tj1tk3qRfr6lX9we7eftZx8q4SOhRVds+anP4NzNBJhRTldCAvBxMie3Qj
	JFh8ZP89+w/3fHqH306nfecyr2elObnqcPuqtfBtQhTneBsRxQI5yJsBLM0tx60J
	3Zx8uDPSQK0nXktZVMsAfWPaTFhYjLoNDLM/u3wN01DdDkBUDUnyCCWTtEJNCwX1
	KLECBA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484qd9xjnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Jul 2025 03:15:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-23fed1492f6so32779925ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 20:15:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753758904; x=1754363704;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+KxXIkqbzjBGr5vRnRk2sdhKE3MD5Ak/KadxWElxQAI=;
        b=TRx7XNIHftrLzp11XvWM47MDFUZl9Un0lCy/C2tCtMmgS8XZS4yBLJbtCsWwo8FTbB
         Uuz/Za/8GuSayxLuGjqh4OcXjiIfB7s6p+ti9WJxBQNTITRg0R57OHuXqw7s48zCcfSX
         HXPrcHtsmzAGEMnqDT+H9tCHsmvP9CvA28mtaSDbtVniIWPsb3acxDXCStQvUX89LxOR
         f1yTBHIvmhovbL4BWPamdv53xMoN94nK3TkBiDP69szgHenYL2/wgFM6G1Ag8sgoZJPW
         M2cGLox03nmU4Naxc5wfdgyLWkab+JFOUG+LzL0zM0ev19NRQ08lZAOJzKmgoI+c2rBi
         YrgA==
X-Forwarded-Encrypted: i=1; AJvYcCWfXMoPEP54SfhSuivWq8keZQO7nG52erCLEu8066b1JLG/J6iUCQwwDys/O+jCWrXn8JZEFSWrpUWDMweC/bDn@lists.infradead.org
X-Gm-Message-State: AOJu0YxsSxCRvUn/OPADI5L6wq9CAEZOGQJl1uyWZKtgmeBIckjCFRvV
	RTU6uiNKbnPw2QfzxHXJFvhGJGRn/zk3vyvYnUc5KDEZ0nJ9D/OguUFpjiDaxOgj2icw7jqG0Hl
	UmttsJ43ei9XChtIhAPEJKlFNGZSJGgRK2dYCLKGApa0iBM40UGRM65K9EYVLGtAcBELphmYus7
	JUnA==
X-Gm-Gg: ASbGncsENj2jl/gUjqXQQu7c4YU98yWz8pLNxCbRntfEtHzvBmT/U1X8bZAR00/8xd3
	elg6Rox4F+11VCS4we/xiHQdHlhBJPiOUyzZF7zbQ+XG5nZPiY5igQWW5zE0fFE6pHI4jbta4wb
	4eoDP/Fe3mrwpiTtVHIpn9nF6FthSuLM9Pi5TFDluhP7wzJDktfTledX/M6cdtEn3bMlyrfbaWJ
	UsQ9GuXbiCo69ldRfmwZO/F1Ya26MceggEvo9NR3q4da5rbsmbCPiABtS5jyK8J7H2c7rgLxdWF
	Z6YrdscuhMRK3556F+zQlZyJpKA8pXbOQshogEdeJ3weg2gQrB94n91KGidvl3992HMhaq9cPF1
	3sA==
X-Received: by 2002:a17:903:b50:b0:240:1831:eeeb with SMTP id d9443c01a7336-2401831f1f9mr77116935ad.40.1753758903591;
        Mon, 28 Jul 2025 20:15:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3+knxDm31O2rClWjozM3+CecgvNZoNp+cf6nrVr5Lm6XqDELyjYKUNByBB9MayBRtK3ee3Q==
X-Received: by 2002:a17:903:b50:b0:240:1831:eeeb with SMTP id d9443c01a7336-2401831f1f9mr77116615ad.40.1753758903134;
        Mon, 28 Jul 2025 20:15:03 -0700 (PDT)
Received: from [192.168.29.115] ([49.43.228.121])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23ffdea35d1sm44404645ad.28.2025.07.28.20.14.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Jul 2025 20:15:02 -0700 (PDT)
Message-ID: <9b9c4572-9afd-f77e-07ea-ad1673feee47@oss.qualcomm.com>
Date: Tue, 29 Jul 2025 08:44:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v13 07/10] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
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
 <2d672126-ca4d-411e-89cd-f40f8d8a4f5e@oss.qualcomm.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <2d672126-ca4d-411e-89cd-f40f8d8a4f5e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iwhL32NNwore04hFj9z6DozI9R9Q33ND
X-Authority-Analysis: v=2.4 cv=Pfv/hjhd c=1 sm=1 tr=0 ts=68883cb8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=URdbDvd2+uEZUUOZgz/1Vw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=jnCx6B5Jve7-ZDeCMK0A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: iwhL32NNwore04hFj9z6DozI9R9Q33ND
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDAyMSBTYWx0ZWRfX3HUES1Sm9JC8
 UwWU9l8Kzxx9rSxpnGG/x1KkfJJgIPl+IWovKaZhvst0hvYyO7e+JRQGsDKYS91CNmtE4HWmUM7
 /80JZNZct9UPu17+cY0SgN7zSkeCRiOvQNbQUp3EQV1Ep8+CGlv5B0abOeFkydyeLC162wzjiXX
 rdSu6nieRftk6yEteVhHy73jw6iqUlKPyF9Dh9dTTDXziN4RRXE2C+J2pATG8b/OKIAOGZeu4dr
 sQ8YjVFrPRwYHBRpKBjA9uu/c2Hm6fccSlf+gpahg1MmBPjyiXevcla4GrnGYfQLdELYkaNESb0
 M0dwAk8XUR8aLvc4elz/mT0ouSB0mWCzsxBKgkRp8n9mqPI1WLu1UFZp9/c7EPZQ3R4dlMPw/R7
 ZDjXSsCQCu5Fm14QQYLYjHHi9BP+FVDdeDpqp66uCVae8YVMsreOd2w2vt67q/HKmpNg/qcE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_05,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=791 clxscore=1015 adultscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_201507_501989_B44F1607 
X-CRM114-Status: GOOD (  17.58  )
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



On 7/28/2025 11:59 PM, Dmitry Baryshkov wrote:
> On 28/07/2025 18:54, Shivendra Pratap wrote:
>>
>>
>> On 7/28/2025 5:53 PM, Krzysztof Kozlowski wrote:
>>> On 28/07/2025 14:03, Dmitry Baryshkov wrote:
>>>>>
>>>>>> and the reboot-mode is defined in the
>>>>>> previous patch. So, I'd assume, the path is defined.
>>>>>
>>>>> As I said, path is not. only psci/reboot-mode is.
>>>>
>>>> Do we have an _actual_ use case where PSCI node is not at at root node?
>>>
>>> Yes, many cases, because it belongs as well to firmware node.
>>>
>>>> If not, it's obviously a deficiency of the schema. Could you please
>>>> provide suggestions on how to describe that in DT schema?
>>>
>>> I do not see deficiency. There is no ABI that psci must be root node, so
>>> there is no issue to fix there.
>>>
>>> If you want to add such ABI, I will answer: no, don't, because we do not
>>> want paths or node names to be the ABI.
>>>
>>> Compatible is the ABI.
>> Will define a compatible for psci->reboot-mode node and use it to find the
>> node. Hope its fine to define a compatible for reboot-mode which is defined
>> as a property inside psci?
> 
> I think it was more about finding the PSCI node.
can either find for psci node using psci compatible "arm,psci-1.0". And then
look for reboot-mode node inside psci.
or can directly define a compatible for reboot-mode and find it using compatible.
Is there any other suggestion to find this node? 
> 
>>
>> thanks.
>>>
>>> Best regards,
>>> Krzysztof
> 
> 

