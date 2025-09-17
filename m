Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E0CCAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 16:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aPbliOpcCjIzayrMLkNw1FIe5VlXIVH9kvQijQYZm20=; b=G9yXqIzc54zwRDLzCz6Sekv8HT
	/0H54dv4lEOYAxBuDmfkOEJ6As71H9WZVuvS0gVno3UPnffg2eCyCjCqi0Mw81DLWvxCqJJX/mmTV
	UdZnu6IUohE+G0TnGtjzPPnv1RL19sSruq1Hbh+NSrZCDnLSN4GI1c2ROmcVjdRa2DuUbyYSoEOUm
	eJbR2vlr3Og6a9pEgLeIMKfK7eNvHoBEnmRo80vf8wb3+Pc1kSaYF6KfKhyf5Ln3PpAowHUdp6uKW
	jFdEhlJHlwDPgq2OUJgyxq3h3TPw126yNH4Duwzf3elAuJO2f1dJiJEc85wMxN5jZF0Wk+TEp2Xpv
	C5cStbrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyv2c-0000000DAsU-483X;
	Wed, 17 Sep 2025 16:29:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyv2a-0000000DAqD-0eTo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 16:29:57 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HGFI8d010955
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 16:29:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aPbliOpcCjIzayrMLkNw1FIe5VlXIVH9kvQijQYZm20=; b=ZiHXr1VSwLPkG2/M
	uN4aJnP3sUlNJHPGAh3ELOm4kQ4P2lX+AdVXRyMYk27T7PcAAhrVYwvHjtwZjgHF
	uhuOh6Vaga2zVy0qbAVoknjr2A8srxFLICJWEY8Az8eL8D26lVz1ipfyB/knPy+c
	Da0bx9l7qK2KqhohTPupv/taCjPhHh+M1NatXt3JMlxX+kA5Jm3XcYilL/PrlDlP
	9BYLM72CjrJBhFMpW4UwRBQNImIzZL4c+7a75wZVGjDypcZu0PitzLFjaTDDo8p/
	hxNDhMB4Xd2wobqCu7aH/QKoK07FdCpEX5kIu1EemxR72AIlYDL0IDdA+8s9lCkr
	CVrLBA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxxu415-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 16:29:55 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-77260b29516so62282b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Sep 2025 09:29:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758126595; x=1758731395;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aPbliOpcCjIzayrMLkNw1FIe5VlXIVH9kvQijQYZm20=;
        b=w3vnTy2V5hBfMxQaWBmANQf49b4FK0RSwKZ9fGs/zY2GC9XhwrHOkTj9cGrdR0hxD7
         bJRO4Yan7nldmxaVaospD6fmH7vOX9t3cYPWLvSLUND5rViGf+7tHOnBc34YZYNUz+iE
         wLfD1HldRqc9T/v9UPpdZMwF26BR+iTdCYqqVusb6b86oC2wKDaMzZvkrqgQJLjoN+ng
         ZH5T2SQaxp30W14uio44OmWn4Z1XjpmHONCNDG4NQaz1lVNzHyFwCeC2nRsOegCK5LLZ
         JvNnyFdIhmDkx/K+K0Xp0DXXJqNee9WYSiCuztJKyhjdMQkT3LwahDfwQNfFEto1FG95
         1yvw==
X-Forwarded-Encrypted: i=1; AJvYcCU8Jor8qF1Ehk6A9q9EAEiJnit6m2XqLS2qOl2PW3hn+JWSiWrYIumBdRgFP0zLyyyyjZZHxfcHa2QO01wRCkIm@lists.infradead.org
X-Gm-Message-State: AOJu0YwDDv4FRWGdNbvY8HSbDz/+wbbm8aK+xGhttwleE29P7J4QoeMP
	xf679G43LrNVSWJpd0fE0r3a9BfJSkjjm9n+KR9jY1pc754z8IanWmJHyluFnkNeguB4ytI5NLz
	cE9PojbgKTKQoR2OWIvSoAwGIROuoBYSRpXaTl16e3o9a3anzqt+l1NqH9yoJhJ+GDqpFY1AmjG
	bbFw==
X-Gm-Gg: ASbGncsXltmhHfo0ofKr5fE3S6kp1WssMwpPm40o7AmYJsvHJacjyaNbbr3/gI84eG4
	Desdd7QASpPuKDiyHz1WXzIVpl7Gf1hnzlzpsc7PgGMP1MUC+zQbjQNo9jOE3qpkFnOgGxkO0mn
	nAsZSgPfCHXOO3egYVoD1g8Cw0fFeCfJhyTnqT6Lo5PfXpOeniylGGj0mlqA/1U/gEt9cd0BJ7w
	OIJmvpBJ7YNttIqQ2SR39rLZPIoNN+DNVG2U9qLKCluC6uDyniS9UHsXigtws+iud+MiIxtpFOe
	BA4ca+21FrGm4r+RXgryXJmXWS9LC6xN6c/VsTjWD38iPMzCxtuy0Txv6SvRHvw=
X-Received: by 2002:a05:6a00:8d0:b0:776:1f45:904f with SMTP id d2e1a72fcca58-77bf9268104mr3162346b3a.28.1758126594823;
        Wed, 17 Sep 2025 09:29:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHSAETCbSP3vIIE9VWiyL8Alz3IwaM2MYDhGvePBLrTzg5i1/2OcH9B9+r9HC87lkyc+hFW4Q==
X-Received: by 2002:a05:6a00:8d0:b0:776:1f45:904f with SMTP id d2e1a72fcca58-77bf9268104mr3162319b3a.28.1758126594363;
        Wed, 17 Sep 2025 09:29:54 -0700 (PDT)
Received: from [10.216.34.136] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607b3603asm18872680b3a.84.2025.09.17.09.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Sep 2025 09:29:54 -0700 (PDT)
Message-ID: <3c56cd00-770f-019a-d93b-5ebaa6b9374d@oss.qualcomm.com>
Date: Wed, 17 Sep 2025 21:59:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v14 02/10] power: reset: reboot-mode: Add device tree
 node-based registration
Content-Language: en-US
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
 <20250815-arm-psci-system_reset2-vendor-reboots-v14-2-37d29f59ac9a@oss.qualcomm.com>
 <in6bqvemnscvuxbumpxogxiiav7odmsc3iazktifninh6iqen7@qwhrhdidcx7y>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <in6bqvemnscvuxbumpxogxiiav7odmsc3iazktifninh6iqen7@qwhrhdidcx7y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX3LHPntiK08ab
 I+lDu4oPDGpgnIzUQc80gZibXW8qRy/4Ee21DkpuZwP6yZ8WwXbeWQfTXoif1QPwza2usMdglEH
 0S8d5vM1vbbxlMXa74wevjONv/9mJP1eI/riICSkHQso0Wq0NnD4FMvHz3gz3KInqtLEs3hWnRN
 s3s5HP0lf9dPvFBIhKq+j8ZmrQ2d3bcIH3U18knqoQa9S1S5QAUk6UMkSRSRuM/BrOsIGxpDf7W
 jtyx6nICI/r2dzjSw8hMd6h+FqDv5pnLY/RuPrT9FrTTFgb1Wvdk63Zjc3BBX1lY5AhC6K35RB5
 Y4JqdacTLajTzUXlTms0WqDU31XKqp/x6RxmE1giOBpn0OVENHzB1Cn0Urnm0HzzyYhosqK2yRO
 QEaFYY7S
X-Proofpoint-ORIG-GUID: L-Qb5W9YuWDVFpcIQK0ULuXpJu30PyNz
X-Authority-Analysis: v=2.4 cv=KJZaDEFo c=1 sm=1 tr=0 ts=68cae203 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=6ImPWgPuv615vBLeUzsA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: L-Qb5W9YuWDVFpcIQK0ULuXpJu30PyNz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_092956_207011_0DF5DC94 
X-CRM114-Status: GOOD (  20.28  )
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



On 9/17/2025 12:18 AM, Sebastian Reichel wrote:
> Hi,
> 
> On Fri, Aug 15, 2025 at 08:05:07PM +0530, Shivendra Pratap wrote:
>> The reboot-mode driver does not have a strict requirement for
>> device-based registration. It primarily uses the device's of_node
>> to read mode-<cmd> properties and the device pointer for logging.
>>
>> Remove the dependency on struct device and introduce support for
>> Device Tree (DT) node-based registration. This enables drivers
>> that are not associated with a struct device to leverage the
>> reboot-mode framework.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
> 
> Please use fwnode instead of device_node, so that the same thing
> can be used with non DT setups, if that becomes necessary. Otherwise
> LGTM.

To be more clear on this, have one question: the current unmodified
design of reboot-mode is dt based:

struct device_node *np = reboot->dev->of_node;
and then parses the node using for_each_property_of_node(np, prop).

We want to refactor reboot-mode to support non-DT setups by adding
support for fwnode-based approach (struct fwnode_handle *fwnode)?

Can you please explain a bit? Some more details would be helpful to
make the change.

thanks,
Shivendra

