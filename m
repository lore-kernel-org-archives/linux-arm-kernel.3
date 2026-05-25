Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C9ECD5BBF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWtZANLHzw4I/IUILA+giiDj3hDdk4vM2TOMGAB+8uo=; b=HcjITv0tVaRKOwXgDre8L95Cwn
	RDtLAif/dX0sNrRqAjNEKjIERbk9vKnfBJT4hv6/0g4cPifLjyVKDska+hXA4AwhabIz9Xg41HOYL
	kftcSY6zT63KN1d8C8ZEVP+XTOAoTsPMGjzFMMUN7RiGY8na9RsbNGbDDO/2TmBHPYzfsYOi4Pd1U
	rrBxlU5O3qaEcId4n7N0cI3Z88zZ++4392kZhAhC2mPYlaEDyddioV1gdx8LGOc48SQt9xil863gf
	nv+/knV8hSaQgPxEHEd3W7Wz/VtmpYJ+vtddLBaVAzUqkO2NJKX0TjFrDdriLNXPATjLML346Zdxj
	YEQmTsyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRhj-0000000GpYr-3zgn;
	Mon, 25 May 2026 09:34:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRRhh-0000000GpYF-448y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 May 2026 09:34:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P9EmdT080127
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 09:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NWtZANLHzw4I/IUILA+giiDj3hDdk4vM2TOMGAB+8uo=; b=pecBBg+SsBTrRmQr
	Pg3TUzF8MmHBHR09X/FqARhTkfJBdK/6RDtiEhRtj0mRcmkDgKDSdOyuEqytApXq
	WVyX2QxasQhCfnhMP1AAAa+uO8xVM0J4enEU1Tuw/qqDW08qzaNautouP7MWtx5H
	l0e14uTrUywGuttuq2vndYtaxZOjzhC5eBdrP8HGvsaBvTQj4qNigwBwMGN/mtnk
	gOkeXwzCYrLxwvdLGa9b+AqwunWbx9/zRFTvUn4dW+g53zBJ9Ebx4HKlEOWkPiEl
	2XgYhnhjsZ/MxUS/iGyWahjRobN1Z+WsZDjBbv8HOAphLPS69hhTRPa1uX1Z+41p
	Vxg53A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckma82qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 09:34:32 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-83f7e7f7457so5761805b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 25 May 2026 02:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779701672; x=1780306472; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NWtZANLHzw4I/IUILA+giiDj3hDdk4vM2TOMGAB+8uo=;
        b=C7e/ZxEvlNBEcWJzlpZsWU1nKoDzQKZwIUjnp4CP8tPdinxsJbr2Hdm4e8D9OTEFZA
         8sbxLXT31Gc1MPPWPpLhXcc6tpxRoB5z3TQvbF+eMuLtL0me/7bja+1Dvr28DLuLc7dP
         EVLxUlZVDTMK2wq4sYPavjWMcu2c1kh3NHASIGt12+WwDgddsRH/61ElakXE0xiSsuRf
         QS7uUjGNnQ3iL7R+ye889lw2zwED0LEMt6SMrxmDucVf5kMvN/Fhxp66h+uSGIQoPJ2X
         1YzOmr7n++GnIOXcZ+4U3VhX+QwViKr3uBUzvuPLF39GwBqPxEB3IQTms50PlTgMzK1I
         Rl2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779701672; x=1780306472;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NWtZANLHzw4I/IUILA+giiDj3hDdk4vM2TOMGAB+8uo=;
        b=DIen7bpRNrxJbKqGJskTY860epTnE7RGhJFtwyGGRbKEigZIEeNs0EyCWGFEv1Rw8O
         VkS4RDHraUPT0CQTlM0vJFIKSGqZkS3lZ/S9FoK+uFZekpWT2HXacRAro7npiAH1WKTq
         9oSPn3RbOgQAXEaDOlXjRCtk5fKjrZGpiY+Z55kXiZ+yt11d0S8KYtYhzaawpNBccvP/
         o/Jz7gyffFEYFg+H1WLHI8rKwy77Sxs98SOOFG54nQQ5LmQStDm5sHcbcysQw0RHDRpq
         VSMPtaR6CKeJYiTChT37ZFD2cqEGkDzfEO5KtvuhYkT1RAVe5ITRJ+6qfrqDFW15cEC6
         l6pw==
X-Forwarded-Encrypted: i=1; AFNElJ+FzytNpM+KEXjQEf4rWJnaZREMcm9IpkECGcUc1L5I6dcLWsiIC8ssLRTTovu45UZGIEopRqqZnbjez6LgDEIi@lists.infradead.org
X-Gm-Message-State: AOJu0YwO6l60lzDEbfC8lDJJbjEE6IXaYADdw+30z7wgrQFjVQT9AI4w
	6BcskMCuhB/9Gu9VOKOU26V8E7bZmrPOpK8WYf3y/3dUoAIHZ30fkapCjuB2qH6JHyWwAZhPF4O
	AG/x+bUSINd6HzobM+UM6HAwO7Juar91VUfteKvmYK+3QacOYaBiVRa6chRs1FlI6y/UgvHC9Bx
	oy9w==
X-Gm-Gg: Acq92OE3rEBkIzakauUcItAFlQim1R9kQbtp4NkgQLPMfZBrfz7aRU4WC246+SGSyHs
	SUBUNnL+eelCZwbG72oSRp1in9IUXwnmiSlD5ITiyFbEoIKwzRBYuJKf/eFaSPf4tGAGS+SKaAP
	1HvT2452aoBCLhP/MwOhY1hu/C4BfO6tfGZ3Hs0BWAo5sKNZpKilVjjf7ihjmxnLpKTC6yBCi0j
	7QhdbWcqItLM9u4OPAG9dFP5fBbBbGt0HILdeNbNsJnjYmrVSv+fjZEqKmqka/FwR0R+/lYgdio
	EiopMHAq9rLV3meyqS9Q7TxWldZJGFE3qLC2e4QvBMk+o266N/nHDxcmG/IdxVfl2OH63kGCdo2
	msAx0LxHqkfbpGJDVBoaw5h6tQE9XtGw1Z7FpEIeGK6bEWkfH2z3gFwUK
X-Received: by 2002:a05:6a00:3c6c:b0:841:a0c8:6e9c with SMTP id d2e1a72fcca58-841a0c8731dmr1853824b3a.26.1779701672282;
        Mon, 25 May 2026 02:34:32 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c6c:b0:841:a0c8:6e9c with SMTP id d2e1a72fcca58-841a0c8731dmr1853810b3a.26.1779701671783;
        Mon, 25 May 2026 02:34:31 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fd80cdsm10474835b3a.49.2026.05.25.02.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 02:34:31 -0700 (PDT)
Message-ID: <c034a7c5-7215-4e96-80cf-ef0c51f8291b@oss.qualcomm.com>
Date: Mon, 25 May 2026 15:04:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v22 08/13] mfd: core: Add firmware-node support to MFD
 cells
To: Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Sebastian Reichel <sre@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260514-arm-psci-system_reset2-vendor-reboots-v22-0-28a5bde07483@oss.qualcomm.com>
 <20260514-arm-psci-system_reset2-vendor-reboots-v22-8-28a5bde07483@oss.qualcomm.com>
 <20260521112638.GD2921053@google.com>
 <CAMRc=MfqaCjiALZyVBHQs=Taft1M9xmNTFvQHWPrd5PgcTfJDQ@mail.gmail.com>
 <20260521132419.GA3591266@google.com>
 <CAMRc=Me5QS4xA3PJWXNuRP1N_C+w3sP9ZvqH36GNh2Ebc9hwcw@mail.gmail.com>
 <20260521162705.GH3591266@google.com>
 <CAMRc=MdiwwX_XH7JFW8HuLvYA_ao50fjj0Oip2WMM4QROHRiFA@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdiwwX_XH7JFW8HuLvYA_ao50fjj0Oip2WMM4QROHRiFA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cL3QdFeN c=1 sm=1 tr=0 ts=6a1417a9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=VqCRv7ZaHuqyx2qM4PwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: wrbsEer71g2o3eyF_aGkX4vVZVDNY-Bu
X-Proofpoint-GUID: wrbsEer71g2o3eyF_aGkX4vVZVDNY-Bu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDA5NyBTYWx0ZWRfX3VUiVXoOuC8l
 GXGNzWft25ZsiDs5R1TJde3yrw40hZnTjVmuPc47qr2HtzIc7ezBVfcuT71bg1+KcRCmF5oH7+4
 9wAmERjohtxSpv7MsR84BTVKuD/taNuEE99iBSf6mF6w0CJ4kY+A1wnlOXeFg70yelJIRuTzgxH
 4MIU0UTCLI+aIyD2/fplhC2U2QoIKukPmFX+u4B9K1rqfflpG5D1UmTDy9b27v8A2mqhIQqdgH8
 YCx419ZnYieOUSD5STOQou8FRM7pcpwyLpjZRY4sgSeLSIlIIa/Z3wnjn7voh5z43xq/n0ty4tF
 WrhXjFliINPfxMJO3H73hy2cIHFPciPYnEd4rZNmOKeI+ku7UPn9y5Lqd9YwAe5D3afR8e96eBr
 ETbq5/6JjqQyVZcp2z4j/koMfCscOsb0VqKKPJ+YNlKci4pRk96YO3Wv/5FCt3OqO8PMFe2Zb6A
 UCvYhLzte2YzQbQyhAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250097
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_023434_015970_0235094C 
X-CRM114-Status: GOOD (  21.29  )
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



On 22-05-2026 14:38, Bartosz Golaszewski wrote:
> On Thu, May 21, 2026 at 6:27 PM Lee Jones <lee@kernel.org> wrote:
>>
>> On Thu, 21 May 2026, Bartosz Golaszewski wrote:
>>
>>> On Thu, May 21, 2026 at 3:24 PM Lee Jones <lee@kernel.org> wrote:
>>>>
>>>>>
>>>>> I suggested it because of its flexibility. The alternative I had in
>>>>> mind is something like a new field in mfd_cell:
>>>>>
>>>>>      const char *cell_node_name;
>>>>>
>>>>> Which - if set - would tell MFD to look up an fwnode that's a child of
>>>>> the parent device's node by name - as it may not have a compatible.
>>>>
>>>> Remind me why the chlid device can't look-up its own fwnode?
>>>>
>>>
>>> Oh sure it can, but should it? I'm not sure it's logically sound to
>>> have the child device reach into the parent, look up the fwnode and
>>> then assign it to itself after it's already attached to the driver.
>>> This should be done at the subsystem level before the device is
>>> registered.
>>
>> Leaf drivers reach back into the parent all the time.
>>
> 
> But drivers don't generally assign firmware nodes to devices they are
> already bound to. This is racy as in probe() the device is already
> visible to the system. There's no synchronization of device property
> access - properties are assumed to be read-only for a registered
> device.

thanks Bart/Lee. Any pointers to take this from here?

thanks,
Shivendra

