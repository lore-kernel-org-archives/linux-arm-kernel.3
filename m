Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF83C79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 18:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gasKLYXS3OeS8VFFBD54LZHts/X5wHza0ieO8b1vB6M=; b=spxZl/BUw8CKR4qHQuk7CRWRdj
	BCo9KRVbBo1SqR3OVyh+MbnPUIobBNPeR6o5pd6X5yjC9aAw+zvfSxCLHROg5yeZrhppvZ+NHqGrV
	BD1EyHkMpbeObvWUMG+6w5mf+M/yHNJeBam462vJGpAzxjonWW364i/4MZIa2CpSoQ3y0inHmDH3y
	df2LGaGnrU7uqAW01gnHaPis7nnq+3vmINeFJGsIUUm95h3wfR3wo/e3zrq1jYW+IVuiEVVGJBZuu
	v+Qx8VC0rFuVpiS8TUhHejiuEu/b12zJ0jOaA1CgNrP4KiVTHzlJzZFciUq49V9InvhYDQYHkuABZ
	6Is9wmrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoxs-0000000Bty9-35KS;
	Mon, 05 Jan 2026 18:06:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcoxp-0000000BtxR-341t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 18:05:59 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 605FKZbe1751461
	for <linux-arm-kernel@lists.infradead.org>; Mon, 5 Jan 2026 18:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gasKLYXS3OeS8VFFBD54LZHts/X5wHza0ieO8b1vB6M=; b=lHzxZzQ0vAU9E8wS
	wowmKycVWNYP7vj8WDtDjRXfyAZx1OaXWC0eRMqrVSFyPMG46ByiwavisOdSNBAw
	wC/PRWhiT7CBtsqyMBW9Cb0KpSvsRQLBFG2ONRjC5dXYrOGKwkh/OwluYd36cDzd
	aHxLVcoCsNQEjPvggEBnV6wtXLHNeyChn9zTwvugPrEEJocdD7tUbEO5Pu69FjZo
	Nz5O7VOGBkI+boBYPMRiCE+hWCxFHqpY+Q2EQQUuNyjgYRHmMWjjn8QajuI1+PbW
	1OdOCFKiEtY0gzQJ6xJrG/DGu5yfRxC6Z9oZEiLly6WvT3Qqh8+8GTbbRaTiJkBd
	wbj7ag==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bgfv00g35-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 18:05:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0bb1192cbso3078445ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 10:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767636356; x=1768241156; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gasKLYXS3OeS8VFFBD54LZHts/X5wHza0ieO8b1vB6M=;
        b=G96yTcNcFnOpHE+dpEVCo16JqtGD0HX6XYj0f1RZ+L7C14GBnb0TDExqxTrzirMPwo
         iX2Dp4cX9xbMjMs6zmHaIeLLwT2W06H83thk2M12E8fNB7TWkMNGxAOykBaSqaupBhfn
         DqRuvxSJzZoIygKVH2l8xE7e+JHi2vC/UV9vrlSBUHtAFCPVy3vKokxPDDm0MSoE52BU
         oey1CcfsqGnbLKJrj/JX4ArUPRei8dxi+9P4AxgzaB0u6r4khGTvdOKn3KZJddFrW7h4
         3yLmQNgplm9lp2GXfNZL2lEpybkvDI/vdMVdXVHUmSLnuIH7mWmoRlen3zrsv0RYW0Y5
         DzvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767636356; x=1768241156;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gasKLYXS3OeS8VFFBD54LZHts/X5wHza0ieO8b1vB6M=;
        b=exa/yO52q/dV7QLly+L7HMeBDE/6Spbm5pSIJSP8GT4jOKG5qPGu48hTnvo1upsQG9
         Pk5J0GquNvglsrH0SH+BYIgAKPbRWv5HWTmhZ0hxcj1LKf/BzHO2zLQYc6hwhXwvt4zY
         TJfxK2FdoHav4PDchXJuUVK66mLi/epQdQE0YttXIKu00oGfQQze2/lyan/vb9I/Bt0w
         owfcAS+RiqUBU8Ga26sYGfVF9y9+7ifT565BZMEP6RY8bV9JwCh0TBqnbvf9v4mLMyaB
         FL7GvJEXFK2cB/KHt843Y+RqZRhtzWKnm8S/yT8FZj4IstdgXylVcg7jJRINdXW3MrXE
         vVVA==
X-Forwarded-Encrypted: i=1; AJvYcCV18oo3e6R1x8PuGIj0LocWmijDIreeMhEKUUHemgfH9fa8QDCTL2awuv9lfzRJ53hzexZI8pLaVa3Z+pdTfc4l@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2WW2ufN8V7XB6ja38Wj8Wf7Zf4UPtU4IX/Dimy0B7BTuA1gOw
	WZ5BrPDqMlU2hfGxsWR9xwBzCAr7GT1k1ye3bdbVQT9sJhB1r1zp/r6UaLUDxFRNCX3xGiOd5qj
	d3+4cHxcWX2XI3ZHgArUEWR2C5eDpgzeSpibcncYL69Nmxdng5Xz69F7ge5g5rkRmsysvIY7hRk
	pCrA==
X-Gm-Gg: AY/fxX72VvUAAzhcJePld8A4efsQlYO0H8eSv6ciUmBDnin7etQh9K0D+VZKfVMk01f
	Cpchz7tvBR9K9JUit8FFQSxSJOsSFMMmFndqk+3ZlR3OUbzPkLfGMgVxojz5dUhrHpdW2sdHuLH
	HMPMM6Mx6z7I88U8X4Cz98QtjeANbCWllo7NXnIeF92LDHov/srRE+Myjotz58D5ps6EWZ0Ssq2
	/YBmzbyQ090+GMW0Ys+oCddZ4InZ+5vHVhc50n9lauQlX6wORiFhVl24z7Dm3c6GtbZK08lVW45
	9s5ARZHK8OiCT+HDdRvsKP9XcAxIpYs/3wORtQLEOIF0Y7GNtCh+egHt0G3O0/34vS5OjtiHTWw
	nP8T7NWLqQkPKv+XFjhmgGrFOwo1FBb46JIgEgAP4Hgw=
X-Received: by 2002:a17:903:3bad:b0:2a0:9084:3aff with SMTP id d9443c01a7336-2a3e2d52ac5mr3899815ad.61.1767636356122;
        Mon, 05 Jan 2026 10:05:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHpQZwihDfp6inPGKAPgkcClDWOhLlQc6x8Cm9jLA9KjnRbNR5X66E87i7aMn7CjRQ48I+axw==
X-Received: by 2002:a17:903:3bad:b0:2a0:9084:3aff with SMTP id d9443c01a7336-2a3e2d52ac5mr3899525ad.61.1767636355569;
        Mon, 05 Jan 2026 10:05:55 -0800 (PST)
Received: from [10.216.40.68] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e2b809c3sm3905895ad.81.2026.01.05.10.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jan 2026 10:05:55 -0800 (PST)
Message-ID: <87f25d02-2805-9da7-0d7f-05ce8a022d25@oss.qualcomm.com>
Date: Mon, 5 Jan 2026 23:35:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v19 06/10] power: reset: Add psci-reboot-mode driver
Content-Language: en-US
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <20251228-arm-psci-system_reset2-vendor-reboots-v19-6-ebb956053098@oss.qualcomm.com>
 <CAMRc=Me8WQ=aMd-NJ1yzzHzqU8fT1u4eb7as=EjSpZ+Rpv9+rg@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=Me8WQ=aMd-NJ1yzzHzqU8fT1u4eb7as=EjSpZ+Rpv9+rg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=e9YLiKp/ c=1 sm=1 tr=0 ts=695bfd85 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XO6BmJ_ieOJQNt0V76AA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: vuu5dPQBVlnysUdl89rUM5P_ZxSK3uyG
X-Proofpoint-ORIG-GUID: vuu5dPQBVlnysUdl89rUM5P_ZxSK3uyG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDE1NyBTYWx0ZWRfX4k4yjYEupKbt
 JXkqcqn67m5h7KXM6aRXuFhsH4nT0S7ciY/kZDJpkQKUUD3XmGWpnDBW6OMmpKsWjY0N7JmESmT
 EM/irWtUrBe84dvfra2owJ1FLu7nNGyhGJrHIqnjw57pxfOs+1XwujpYEB/SnXCX6WbDv5DJPPu
 oObL2wrXt7QIyXk4IpLuSqnfvJFo3pvn8accl0tS6Em/u2KWXddIH/9R8vKes/WVPKadwYBRHEP
 jKs5NF22paIQ8qUG50KPblAvrPiN+VfjVinOLrHEENIU1cHe1CqdB4CFdI+jH2c5DbSjD3K8fe2
 36TZxOkX8MmhuXig7wkXAEFQCniuaLw8ecrPi2sHanpDnhADqWzi5F60HuunZUNpTmu50NOpM5z
 TWkK0HlGqF4P4JRh8qs0cHdacDHFd/G8zR6EqFsJMIC9kMC27CRqytwyvglpOIueU4CG2fkVhRm
 b1fHu/2YkSz2zkLF6yg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_100557_774553_2CEC678D 
X-CRM114-Status: GOOD (  22.93  )
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



On 1/2/2026 5:27 PM, Bartosz Golaszewski wrote:
> On Sun, Dec 28, 2025 at 6:21 PM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
> 
> [snip]
> 
>> +
>> +static int psci_reboot_mode_probe(struct faux_device *fdev)
>> +{
>> +       struct reboot_mode_driver *reboot;
>> +       struct device_node *psci_np;
>> +       struct device_node *np;
>> +       int ret;
>> +
>> +       psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
>> +       if (!psci_np)
>> +               return -ENODEV;
>> +
>> +       /*
>> +        * Find the psci:reboot-mode node.
>> +        * If NULL, continue to register predefined modes.
>> +        * np refcount to be handled by dev;
>> +        * psci_np refcount is decremented by of_find_node_by_name;
>> +        */
> 
> Can you make this comment into full sentences, I had trouble parsing
> the meaning for a minute.

Ack.

> 
>> +       np = of_find_node_by_name(psci_np, "reboot-mode");
>> +       fdev->dev.of_node = np;
> 
> The logic of the device assigning its own node is a bit sketchy,
> ideally this should be done before the device probes.

Will move it to init. thanks.

> 
>> +
>> +       reboot = devm_kzalloc(&fdev->dev, sizeof(*reboot), GFP_KERNEL);
>> +       if (!reboot)
>> +               return -ENOMEM;
>> +
>> +       psci_reboot_mode_set_predefined_modes(reboot);
>> +       reboot->write = psci_reboot_mode_write;
>> +       reboot->dev = &fdev->dev;
>> +
>> +       ret = devm_reboot_mode_register(&fdev->dev, reboot);
>> +       if (ret) {
>> +               dev_err(&fdev->dev, "devm_reboot_mode_register failed %d\n", ret);
>> +               return ret;
> 
> Use dev_err_probe().

Ack.

> 
>> +       }
>> +
>> +       return 0;
>> +}
>> +
>> +static struct faux_device_ops psci_reboot_mode_ops = {
>> +       .probe = psci_reboot_mode_probe,
>> +};
>> +
>> +static int __init psci_reboot_mode_init(void)
>> +{
>> +       struct faux_device *fdev;
>> +
>> +       fdev = faux_device_create("psci-reboot-mode", NULL, &psci_reboot_mode_ops);
>> +       if (!fdev)
>> +               return -ENODEV;
> 
> This will always create this device for everyone who includes this
> module. Move the of_find_compatible_node(NULL, NULL, "arm,psci-1.0")
> call from probe() here instead and don't create the device if it
> fails.

Ack. 
Will move both calls to init before creating the faux device. 

psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
and 
np = of_find_node_by_name(psci_np, "reboot-mode");
--

thanks,
Shivendra

