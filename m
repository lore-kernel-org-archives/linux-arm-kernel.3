Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8858CE9D42
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 14:45:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZNziTKXq6hMou1yZMEV+qqX8ioqkSFVAbA4CKr8vH74=; b=DAeWDW9CB9nJUrNMmJzWBSj8N3
	Rcw0qrEmfaI0ZpK1RbOVD7MwHj5i32hch2HY16R7CLdH3SbbyMuYC/0n+5AdXEwILF0NhBEJBrx3B
	KL6rRrjnYCmfyRa3M2p1A933rlh4Y+Z/vj9cmhLOFB9JF8+KSEP0I5S4sGVDab0+fDTHqaZ7Yd8YB
	c8Ql/crvR4mm3cHP3SPLYHxdg+S7x+h0JgqDlEwxPht3s2qUs93jOW7RAViAkDAoNxHMB7Wd2OxD3
	j7Si8JooHrI8BEj2OIPflexvU7mxVvKD2pcU8w2w+ZUiP51ovQkoqK4exQZ+/HHv1UVPp5XJkdc58
	zoxLc4XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8Jb-0000000DJpk-24ud;
	Tue, 06 Jan 2026 14:45:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd8JW-0000000DJny-3FIx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 14:45:42 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606Eflsq322882
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Jan 2026 14:45:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZNziTKXq6hMou1yZMEV+qqX8ioqkSFVAbA4CKr8vH74=; b=audbgGpRpDXwSWqb
	mpAeUqvDjLRcZ8AmY+JGq683g8RaoXdSi9AG1Wewbp0deReUU4SFHePOD3dDRK+g
	+HlCQR6e1sWti4woU8UIM2nOlVjNFg6V7LQOzIvbmxqvxhb5fJqqB1EhXrxD5vo3
	cyO9nkjZ1a+i0vrw1nHPbsIfgXrk3JHq28ZgbHQ8Pl+rp1hCF6HnfAi1jv1kN8wV
	sFSRh+EUy0RnrbW2FFqM3MCCQB6R1SLM6xzLQGn5dUYkoCdtXAqagVvYOUQ0q4Nj
	PY3NTaHA9QZYPvdglh0r6QKebjZT6fHBuJ/DAeo/vmxw1F25bV+3rugiQtc73urA
	nPfy3g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh4crg0a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 14:45:38 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7ba9c366057so2542722b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 06:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767710737; x=1768315537; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZNziTKXq6hMou1yZMEV+qqX8ioqkSFVAbA4CKr8vH74=;
        b=bi6U57lvkPileubB6NtyzYfqg44h5nxBSANn0OL87L8+h3MLH+dwiZbbl0MGMaOlc0
         6aO3bYxHSISFjGVOwpMHepozlV88HWl4PwVNs6JYf9+3zvu6ogRr7URUCw3Dc5tr2dbs
         vde205Dpd4H60wBFvItow9kpOHvmgYVyn8auwsU0lLmkfBwYL7EZXcxTtDN3ZASuI398
         lduQET+3X0LbCIx8t0ozWn/CLkjYQ5X1EJX82av/xNTxoq3m7UOF0YGhuaDEzArNq0yW
         fFdm3xpUO+FbKtXTvWEvlYc6U6YCLyfEtGRvRt8RgHGPL6SKdFokoFZQNGjbmpOhfYt0
         tBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767710737; x=1768315537;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNziTKXq6hMou1yZMEV+qqX8ioqkSFVAbA4CKr8vH74=;
        b=a4z57nP69GKiXYnleWO87VVfuT5n3zzQBtA7daGfe325Gyte4lYMh0HDSv43ArXW5S
         uzVoRzVNec8NL9flMSJZc0t29INaW8xB2XXUwSKa5AW7enZJQwhBbt0nmk5pCGnMZEAJ
         gS6JLcaQTPzOanalxO03C+CB6IhdrmqrM6z0p7jpho4451/qMyUWmilU4XZrOk4Iufxv
         COSZTk/STsy92NS0SJrTWQ6iz4DvQGexpKn91WWUqurDGw4SkDUyPBDJQywRlkNmAMdG
         xzVUKCUsKWVUsrp4bCqfiJ1SvAHj8ZUsUl6abQZAhzEXoQfRFB1AU22uHdScxgLfcwjD
         5IDw==
X-Forwarded-Encrypted: i=1; AJvYcCXl68SC7hHTQtFxLbofSJMirRmzFGWbnneLtYkUXuxavd6RVfOJVUOQmREDag2CCSxd4HTI5ZKEdM5NYRJUZCSG@lists.infradead.org
X-Gm-Message-State: AOJu0YwtH992602ZcrE9Zb/dsrHtDr7PVUCS2THo2FLHOkfaztai2NIi
	CK43Kpyn6r9GZqESTjU9xSajh30Yr3npM2PMa0pV5lSj1wjl8owwCXVpoZnMKXbO4NEYlYbfz/d
	XFB4Bs+3cTaxpxmHuLLb47FxtxCM5B5g1JhjWOzoF3Pjozb33OOz/5Jika36EYKpHQdl1cnNaT1
	5SDw==
X-Gm-Gg: AY/fxX6qayDuiTv78yMh1VRVxVcdCNYIIxO7ZNgG42XAeAXYihBBUNyx63MHwdTRgVz
	iS154uv+3jHbCIoQIMMH/u95SSiHbv9KoSLPGo9f7YlQ/z6SBTR/rhWzHeUAiUYUqvnJEiWJ6u2
	3gjpjIsCEK+G63hc9vP7TiznMepKnhzFMJBwOks/9ULbjmRUA1vdieiORPKKNPYMcbdI/g4/UXZ
	jTj0wnTuSGu+s+zvBM3DVUWxzn6iBaeoZccbIf0qCEMlBKGIDNCxSiGhPbwc0xcP6Pqv0RxKBkB
	YXzqb8h9XV2SwoguPjJbQUq2r3cMIa7wS+VIPsIRWSUr7F2+IOLBE1vIVo6DO2K9A451c64dZRm
	IjOXbgT6hdvyZ1BeiaF2fOSn2wJfgjRTihi2Im+fnfng=
X-Received: by 2002:aa7:9a87:0:b0:800:902d:9fdb with SMTP id d2e1a72fcca58-8188115dd33mr2788993b3a.5.1767710737560;
        Tue, 06 Jan 2026 06:45:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFDkO1MPs6jk9DhiTL0y1oFq1kAN13vdOai6+rAL4mB8VzpMFwz2vdGbIXz2c0/G92FT+f9A==
X-Received: by 2002:aa7:9a87:0:b0:800:902d:9fdb with SMTP id d2e1a72fcca58-8188115dd33mr2788972b3a.5.1767710737035;
        Tue, 06 Jan 2026 06:45:37 -0800 (PST)
Received: from [10.216.40.68] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c5de6405sm2450578b3a.61.2026.01.06.06.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jan 2026 06:45:36 -0800 (PST)
Message-ID: <466fac7a-e16d-9c49-80bc-c07ba5a5f334@oss.qualcomm.com>
Date: Tue, 6 Jan 2026 20:15:26 +0530
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
 <87f25d02-2805-9da7-0d7f-05ce8a022d25@oss.qualcomm.com>
 <CAMRc=McH6jsaKROyMGAhH_gGSiQtqvuVmrUODgtSp0hX8g06=A@mail.gmail.com>
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=McH6jsaKROyMGAhH_gGSiQtqvuVmrUODgtSp0hX8g06=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V9FwEOni c=1 sm=1 tr=0 ts=695d2012 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=jnZpEnBlv3Rj3AlvUe4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: RrVpQjkfDpTgyMUWziseBHTcjuWkcF94
X-Proofpoint-GUID: RrVpQjkfDpTgyMUWziseBHTcjuWkcF94
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDEyOCBTYWx0ZWRfXx8gR1je8rtAv
 Vecpn6cLYk8aoYepCrQ6ON97uA80e6fl18JURQz/f7DgPJ3svaapGdw1SIh5aORU8jJ1QFr+fUb
 fHEE2deNV1m1yGFQFUsBsHSk1oYMsnrAYF1yoxf6m3pT+W6PRRIgbRarK+fb/yvRm7/ZH+le+uS
 +7TbHWRMRpyRkQjAw7MkRZyk5PokfLf0FMtPX9rIEUvTd/nIzkn6yQIe1fkwmyfPpqUg8H0vIHz
 XpHjJmrVR6DYbUpG+vgEDKvDKBllqZSj78XCJPko2f3UIn54WjsrPXmJi0qX8bTD5wufykHMnM1
 r0efyPwU3bFAS7Rrau49kzf0wdaEHa5EhxHPLUtaq68QP3X65G5OA01QOBXLdah9nv0QVBpxHQ9
 tf7k8OFsxq7pnmaIYE7s8u8qBg7AJfxz3o+c/1sBo06NXjg8csSvobayKNC/ywp3nm3ZARgcIbY
 0hZpmicS1vbGjjUrMlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060128
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_064541_022930_A1A27E65 
X-CRM114-Status: GOOD (  16.83  )
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



On 1/6/2026 6:04 PM, Bartosz Golaszewski wrote:
> On Mon, Jan 5, 2026 at 7:06 PM Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> wrote:
>>
>>>> +static int __init psci_reboot_mode_init(void)
>>>> +{
>>>> +       struct faux_device *fdev;
>>>> +
>>>> +       fdev = faux_device_create("psci-reboot-mode", NULL, &psci_reboot_mode_ops);
>>>> +       if (!fdev)
>>>> +               return -ENODEV;
>>>
>>> This will always create this device for everyone who includes this
>>> module. Move the of_find_compatible_node(NULL, NULL, "arm,psci-1.0")
>>> call from probe() here instead and don't create the device if it
>>> fails.
>>
>> Ack.
>> Will move both calls to init before creating the faux device.
>>
>> psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
>> and
>> np = of_find_node_by_name(psci_np, "reboot-mode");
>> --
>>
> 
> On a second glance - and I may be totally wrong - would it be possible
> to switch to using the auxiliary bus and create this device from
> drivers/firmware/psci/psci.c? That would be even cleaner.

Till v17, device was being created in psci.c. Lorenzo wanted to move it
outside psci similar to design of cpuidle-psci.
 
https://lore.kernel.org/all/aRIfc9iuC2b9DqI+@lpieralisi/

thanks,
Shivendra

