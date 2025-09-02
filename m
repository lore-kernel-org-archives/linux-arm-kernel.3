Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D4ECA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 21:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cFH5cDNds5B5T/pje3FPEuPlO2hxs24Eot+U2AM5tl8=; b=ur2ncqoKqIKVNvz+rdDzGQRoV0
	8/sxJRKS6fJxuWrxYaYdWnydJazSTbdN5ZhsimKKpDHgcIXF8iqvLG83LE3KjqF0HFnAtMcLxmyx7
	2Q2HYqS3uqTzqaZZbShOwjBhBxgDj7dmjoi2Sr1w59lsAaQCVovom6k7ogID0n1LysLz+fg0GDJHg
	uKUZn/Wy+XPXrcuBDCAK1ryfOl52tBSlPqpTI/cKZk1aC+vgiAY2uOJruRlcCYQGJNUwea5F91+Jd
	77jt+jHXfYk+l9bt/4a0MYSUikGi1ID7Setiiz1MQ0xRn7nCqdAG6qeSljo0YWsSZNgNQ+wC5as7y
	6bp01/ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utYm7-00000002AcP-2weD;
	Tue, 02 Sep 2025 21:42:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utRsl-00000000K8k-3RPg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Sep 2025 14:21:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582B3B8C025567
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Sep 2025 14:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cFH5cDNds5B5T/pje3FPEuPlO2hxs24Eot+U2AM5tl8=; b=SWE+h9baJZPg0zr+
	h1VZBwnEPUP82cZ9ImIy24Jh4zgzo/2qILVaNrT21iAph2NMju2XB3jE5iQxS7uG
	Iwl1soq01wpYlpscMNpjn3haYm3gzIyvm6XWOYT7tfCemR+a7OkbNsCEwJBsCYVj
	gOdLUGnVpCtqtLB/Q4Z5j9NgLmA3R8J/wshkDR2wcPJ2EEMN+7WDwr6ta/UvVMJa
	+4z1oo9rg4lSxeIwSBHqFAk5fJMlsDGwRd5BuNxcy77ZMn4TxnhUw22EDCyS3UvR
	hTdD+MpQOgivxSlhDw6JFyTADU0xanIEsPOSM5PBMWUz02c0xzvKuM3oT7InLn3Z
	1fs5Ng==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv04mn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 14:21:10 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7724bca103dso2310743b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Sep 2025 07:21:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756822869; x=1757427669;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cFH5cDNds5B5T/pje3FPEuPlO2hxs24Eot+U2AM5tl8=;
        b=JLNEZPQonAysfCj8mu18tVgxi3314hqfM0svOwD8+r+jlnHqHcxiCvvpFt4iIL397Q
         tVj9U0kkchEF8ZACqDH2oZKbPt35ZTfhCxkV+97SmQselk2K1cvGylmkzQhpiyh66Zls
         znOAwQps+VUkuaHh4+4YOcb9gzPe1Yx60TSjN7ZhvwsqJVnirmbkIsAPgoawIy8XIGiL
         m4C99rsrhywx6t2vlq9jzB/ADgmgn5lg8VG5FkkXyqHjJl4WjyUw+TJcPaQ4Mpxo2YaN
         eSyuuf6Gyd8b5cLhIt5mRAwPIpfvlYpVndODj2PHzI9rioj0I2xdAOq6Db3/RIz+Ckkb
         I8XA==
X-Forwarded-Encrypted: i=1; AJvYcCXRc2vI434lox2vU8UKhLWdfeXXXLfoWfcXZK+V25tpRwKkcxWp3cF+xzX7fVERk2MKQb9sX5o7lPZR1s32EYKD@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/cGiW0WVQMc1iGnxwY5pQKOC62qRoQcPYFIwbpsNz15A7MaMk
	nE7usXD0bQ3nEJGWEqNq4NmcAHPc4F0lI6wtSs/d7kANuh4UbPN0/paK3HeAwsTLPi13crHZq0Z
	/DGy3ae0AFZLo6bGOt4SFPorLdZDePo+M48gjP9zmeqJMmYMyxdrr12f78X8BmWqWEkypzihR5s
	XEog==
X-Gm-Gg: ASbGncs8XJT08IGNt3/fVwZrrVwUjWV7iAr/ciJqzQzCqXcjXSF1YSnEPRz6UzV0N10
	MBn5p4tiqMc+3IZyF6WbBlbUVdKg31m7H+Ab/WanfACJbIFTBs1P3/buKeAv9WNvBNt+151RMmf
	Md2jvdo0yn9RY0nu/K+6h5kIH2EMbY64aA759lTZC7rzzjklN4JpaBK3506OY9kyPXK0o3eN3XB
	zpfEjrZ7UJ7wnnQM3Gl+h1bXNJrHITxdMRzdRVnQr8Gphf+iR4jF63O73tp5lmpua/ElWe76y0W
	+n4F3CmLE9un54PElgo79KbR6g6RIkF0lFAuKv+5xgE4Xyj09TeADyLOuGvWRUeXyvXoV13e
X-Received: by 2002:a05:6a20:3949:b0:243:25b0:2321 with SMTP id adf61e73a8af0-243d6f7e6d2mr17559817637.52.1756822869350;
        Tue, 02 Sep 2025 07:21:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqXouN6x5NC3Ff1ESu4awUlD3wgjdZZfk9g/KwRyDmJBn/xJVqTV3xHk+1W13vbBTuHhuaMw==
X-Received: by 2002:a05:6a20:3949:b0:243:25b0:2321 with SMTP id adf61e73a8af0-243d6f7e6d2mr17559757637.52.1756822868877;
        Tue, 02 Sep 2025 07:21:08 -0700 (PDT)
Received: from [10.216.7.97] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-772396d2dbcsm11499176b3a.50.2025.09.02.07.20.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 07:21:08 -0700 (PDT)
Message-ID: <f7394b06-d51a-cdbc-7990-13209b478398@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 19:50:58 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v14 03/10] power: reset: reboot-mode: Add support for 64
 bit magic
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
References: <20250815-arm-psci-system_reset2-vendor-reboots-v14-0-37d29f59ac9a@oss.qualcomm.com>
 <20250815-arm-psci-system_reset2-vendor-reboots-v14-3-37d29f59ac9a@oss.qualcomm.com>
 <88ee0a26-8d64-4060-b703-40156cd011a7@linaro.org>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <88ee0a26-8d64-4060-b703-40156cd011a7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX8FS6uYVf4387
 rGPojWfU39CnaIHD2CJ+nzZ5cqHIfXkGoMH9YdkWOsGN7bi1ISXlniQM8D5TQDyCxpCdqP6I7jd
 v28h4rVIjreCox9ELCFUs2JToq95yk7c87mZFNNWxfxmNJ4iwA3A422YKDVhtD6PYBYQAu/7gaG
 8lxKesQcmUCiR07AmIPGoWhrW5vIVAZriaRSmuqoxmgdgMo5VkuLCnL0WJ2wxBE8OD63PYZqyvK
 kfFUKaOeifqX25dPv/GyfCT0wilL7BWh5rnTbRE7DOOxel7gdbGrz0fnI3Rqra53oxHlmzeKdGI
 +iXcpWKMWTpgqRBqhOP8CCe/8N9WzlKbcCMniX/NdNfTMrqW68i6wsyLseuLeQfwyYh6eqf8Fzz
 Dtx5cSSL
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b6fd56 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=FBzynz1gJkPyhc2EhIcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: 2qkEhCFGwSwXAZ6EDM88TRdk2fGOdque
X-Proofpoint-GUID: 2qkEhCFGwSwXAZ6EDM88TRdk2fGOdque
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_072111_984686_5386DA58 
X-CRM114-Status: GOOD (  18.58  )
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



On 8/28/2025 6:52 PM, Casey Connolly wrote:
> Hi Shivendra,
> 
> On 15/08/2025 16:35, Shivendra Pratap wrote:
>> Current reboot-mode supports a single 32-bit argument for any
>> supported mode. Some reboot-mode based drivers may require
>> passing two independent 32-bit arguments during a reboot
>> sequence, for uses-cases, where a mode requires an additional
>> argument. Such drivers may not be able to use the reboot-mode
>> driver. For example, ARM PSCI vendor-specific resets, need two
>> arguments for its operation – reset_type and cookie, to complete
>> the reset operation. If a driver wants to implement this
>> firmware-based reset, it cannot use reboot-mode framework.
>>
>> Introduce 64-bit magic values in reboot-mode driver to
>> accommodate dual 32-bit arguments when specified via device tree.
>> In cases, where no second argument is passed from device tree,
>> keep the upper 32-bit of magic un-changed(0) to maintain backward
>> compatibility.
> 
> How about adding a n_magic_args property to struct reboot_mode_driver?
> Then in struct mode_info change magic to be a u32 array of a fixed
> length (currently two in-keeping with the DT bindings).

Arnd/Rob,

As per previous discussion on patch v10, magic and cookie were implemented
as a 64 bit number (64 bit magic).

Need you thoughts that if we should change the magic to 32bit array, as being
suggested in the above comments.

thanks,
Shivendra

