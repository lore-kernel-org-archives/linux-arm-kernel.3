Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B163D12D41
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 11:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHwr2aYkPOpOXz+3A1uAi5MY7m5P4Mot0muCw/X+iyA=; b=qXzZHaqtN4NLNQVxbexnpHELXa
	AzzyG5QU9LxpIz158k4riDp10S0zuuNCePMAXFHQsYpt7yy7KLdyv1COueFlIr/t5fYX9h5RIBOMX
	haPNjN+XcdKdeqZhzyE+FqatSFZha07+VB+bW7G8mmvhybmmVQwqf2ThniFahL8dWEdfnfcBm7P3l
	Y494I91ccdMdzrrBoS54u/3lHUHoUrN2WdMykm0Z1RDezOz3L1sP9XO3zMBYAcjV8q/vRljQZJR1G
	DFqTvGWsrW4dR9VkWh9/iRLXp+dDqX685BZ3LBInTjBJDCLDHfSdbSO/ZZXBn8L0i8wqeabtXWRD8
	liqwsuaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQkvW-00000006UiK-1aFy;
	Wed, 03 Dec 2025 11:21:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQkvT-00000006Uhu-2wIn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 11:21:41 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B39Q3DB1969567
	for <linux-arm-kernel@lists.infradead.org>; Wed, 3 Dec 2025 11:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=qHwr2aYkPOpOXz+3A1uAi5MY
	7m5P4Mot0muCw/X+iyA=; b=WRd/6IjJqKUtkElp1S8rYCIxYrYPs76aUZSaLv2t
	9MFXfxS/1zc7ZeTydAhmgbBWXUBa27P4bkYJ647VgNP4v4TvxPmvt5XDZ7+1rhvM
	NKhH34Mhs/MAvoN/TdEqJ/QcchBvqn3ZVdxM8QHUc22mRiVGWIJtgQsovViqcljw
	DSAXNvEbwAQR1rs/sOIw0aSl4+XYPfcFarO1d2J2smFcaZwW14E8adoo70A62q+N
	lH3bdTD8jBiWrEz8VouVaj8Bh+zz2jVrl1N+RZLtDHWh6ExvfOUuRjYUq1iLjwUL
	o23sg5lizknJGUYIWygRIpVD/D2dWRzbZKhmnXzcrsstEQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atjjs0cth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 11:21:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b26bc4984bso1025635085a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 03:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764760898; x=1765365698; darn=lists.infradead.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qHwr2aYkPOpOXz+3A1uAi5MY7m5P4Mot0muCw/X+iyA=;
        b=T4Rexo/z3+316cTIsBqI71dZp/ojYFIKgIWQwke+CHy5ONBxzMM/Sp1NX7qoTJtl/f
         ejsPWgscVzJGp+I7vUZLHOwzjBr31A0UZ+MNcbn9raGP5O5YT/w81US8tu0C+WQRMzCr
         ShGO5Ev+FdgfRiV8QGXYjqhS7zDaTfZFJxa0dTH+LP7xF0I4zGT8Z84G5cpOmFP02q9O
         at3cC25SOEHcRmb6KzM8N8GeldHv/F1q7F3yTV0iH1yMoo6h/555yzaJvWXkn67SInr1
         LVfY/r3Gy8pZXtpyZNHId7e1fZVNlQb3YUuSpCUT+ZMUQx7OptQRxWeM3mDtazL2vZuV
         ritA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764760898; x=1765365698;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qHwr2aYkPOpOXz+3A1uAi5MY7m5P4Mot0muCw/X+iyA=;
        b=qsdHX04PaGXQNvUDKCiG9IWHw8WByLn3KYpzfNYfenihYcLvifqgWJSBvJE3OKI1Cr
         HLZ9w3fvJhHfxHM8JtTuNNQA2L5ljumkjNsTAADWNdo/TMjrq0SebZ77r38g0BxT06DC
         NvjKmuD77okhhsnbaVN9F/0TZofjNZoDJ+gT40w9KSFUM0Gt5XxtXibsVouvbyFviycY
         Nd4D+1u63EfGTWgLsvWBNrehkqq8Xu2ITBieootgkzKH5UwWbUd6inN0qAQQZzwgXL5B
         tEBA42hrZPl8S4/gJSJ/BdToGiXt29qrfEyxq71QFmVj8E628n4R7TKY/UZahRdFP8Tk
         M+Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUFkOAqAw/MD44wnsEpI6VhFDtzvPuJT3UGmjD2KD0jzGWoHulv2MY/bmZjopZIf0Pc1S4DGnzdur15nX1tH4BN@lists.infradead.org
X-Gm-Message-State: AOJu0Yw63fkPhMv+mziaYc/wLwvx0vOVxEw3NjFvuCcBw2p4QTZE2qpa
	ocJrnWle0MtNsgnNGh/lujsMkhiHEQkMHDFog60+hNlT6LOAaj2JPh6ttwsIHQAh6UNZdzJd/Kn
	FWVdTthhXKf0tC2iy5GNAT8+1vYiOdQK1VCpBFVi4n9Sgl695tBmZ5g9c0mIQBou9LBPaGgO+iG
	F6VA==
X-Gm-Gg: ASbGncugfm3aAlfdlSME1a/6zWp6Nam/BNC9be1dPiJaLh5yNSyywwb+UA/IIVXa3Su
	vCyuU6Sv3WWB7PTZbai47HrMf+O9aMzJ6dCc3v08UkZkCiqh+AjErHyV6LkWpZv80EU8WFiYDP8
	MRUb5GnmbDynG5J5qDWQV0a1YxSHy8Yj0L7pnHcIofbmqAkl85P7PPm1nw9wEUEEdL9+mc0Hasj
	SoF5nCkQVXqax+/xXNUTBR7qUydqqTBw4tDVmJreWetCqH4fEDkcwJL5dEDdFGgi5xiLp8zMIEQ
	Zu9dvyRuDPO8GSHUw3pQLXU86bY/zj/dVZRTs61nJ8DVXSeOrFHqWIg+J9gMi4A2r8sELbDAOFu
	7YVcADkQoOids0K8ZFY5sX5ee
X-Received: by 2002:a05:620a:4012:b0:891:cc30:1018 with SMTP id af79cd13be357-8b5e6f7b158mr221753685a.71.1764760897405;
        Wed, 03 Dec 2025 03:21:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/Y19mgYxD4KaBhwc+HBpSK1pF0dusgLAuMRTn6UAA+2Nf0w2GPbIuNQMeW046bslWwQgiAw==
X-Received: by 2002:a05:620a:4012:b0:891:cc30:1018 with SMTP id af79cd13be357-8b5e6f7b158mr221748485a.71.1764760896850;
        Wed, 03 Dec 2025 03:21:36 -0800 (PST)
Received: from localhost ([2a01:4b00:b703:c200:1ac0:4dff:fe39:5426])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4792a8ccdfbsm43945665e9.14.2025.12.03.03.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 03:21:36 -0800 (PST)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: Punit Agrawal <punit.agrawal@oss.qualcomm.com>, james.morse@arm.com,
        amitsinght@marvell.com, baisheng.gao@unisoc.com,
        baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
        carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
        dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
        fenghuay@nvidia.com, gregkh@linuxfoundation.org, gshan@redhat.com,
        guohanjun@huawei.com, jeremy.linton@arm.com,
        jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
        lenb@kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
        rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
        scott@os.amperecomputing.com, sdonthineni@nvidia.com,
        sudeep.holla@arm.com, tan.shaopeng@fujitsu.com, will@kernel.org,
        xhao@linux.alibaba.com, reinette.chatre@intel.com
Subject: Re: [PATCH v6 00/34] arm_mpam: Add basic mpam driver
In-Reply-To: <a04aa337-a3eb-42a0-855b-500ba549e2d8@arm.com> (Ben Horgan's
	message of "Thu, 27 Nov 2025 14:25:28 +0000")
References: <20251119122305.302149-1-ben.horgan@arm.com>
	<877bvfa23i.fsf@stealth>
	<a04aa337-a3eb-42a0-855b-500ba549e2d8@arm.com>
Date: Wed, 03 Dec 2025 11:21:35 +0000
Message-ID: <87sedrlsjk.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Vb4XcYVwxP1Zs4Bqv7x6HBB6KybOJS3e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA5MCBTYWx0ZWRfX1JcQuPk/4lin
 Wi4eKr9i0u1+X9LOg1ej6gyuW9nufntBxoHyMjKcuY2q+jPkC9GgCZitKnxeLxp2b2QjvyufG7o
 K6kZV9CI9Qqxnfto3pRYc49osu/EFnI6R7jIITUhLB4e8mSQFmSQcqTbsxsg5F8WJbfzasrfUQ8
 8uTTEyInvYMvDBGaYmdzBUWRgbkB7+rtXSq+skbbCUTS0GV08IBg6Ny4AxBJ+JqzUQHoc4O1Rz4
 2iwjvoRfDRUJz5olmV3Md9VuO5uW/oq8NQx8S4zyvm7oNd6iKWKL3FdgRwwf7T07J9MQS6lZ4w9
 TwRY8Yyrx59aCUnefoATCbSHXU3kiWSMcB7krA9VNSxE5mmEpace616bWGMJa3io7g73ArweOeD
 obo5aerGw0UePJHvCPrTtB8E7HGngA==
X-Proofpoint-GUID: Vb4XcYVwxP1Zs4Bqv7x6HBB6KybOJS3e
X-Authority-Analysis: v=2.4 cv=ZqDg6t7G c=1 sm=1 tr=0 ts=69301d42 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8
 a=2TOxWa3ygJBVc2Mkyu0A:9 a=PEH46H7Ffwr30OY-TuGO:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-02_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_032139_863337_12D8CD2D 
X-CRM114-Status: GOOD (  26.66  )
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

Hi Ben,

Thanks for getting back.

Ben Horgan <ben.horgan@arm.com> writes:

> Hi Punit,
>
> On 11/24/25 15:21, Punit Agrawal wrote:
>> Hi Ben, James
>> 
>> Ben Horgan <ben.horgan@arm.com> writes:
>> 
>>>
>>> This series is based on v6.18-rc4, and can be retrieved from: (no v6 version)
>>> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/driver/v5
>>>
>>> The rest of the driver can be found here: (no v6 version)
>>> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.18-rc4-v5
>>>
>>> What is MPAM? Set your time-machine to 2020:
>>> https://lore.kernel.org/lkml/20201030161120.227225-1-james.morse@arm.com/
>> 
>> Although a little late to the party, I've managed to throw together
>> enough firmware to describe the MPAM hardware and take this set (more
>> specifically mpam/snapshot/v6.18-rc4-v5 branch from James' repository)
>> for a spin. Using the branch, the kernel is able to probe the hardware
>> and discover the advertised features. Yay! We are in business.
>
> Thanks for giving it a go. :)
>
>> 
>> Having said that, there are a few quirks of the platform that run into
>> issues with later patches in the branch. The platform has MSCs attached
>> to shared L2 caches which are being skipped during later stages of
>> initialisation. IIUC, the L2 MSCs' limitations stems from the
>> assumptions in the resctrl interface.
>
> What in particualar is being skipped?

The registration of the discovered MSCs with resctrl and subsequent
exposing it to the user.

>> I was wondering if there are any patches available to relax these
>> limitations? I can give them a try. Or do these need to be put together
>> from the ground up? Any pointers greatly appreciated.
>
> There are some extra things added in the extras branch [1] e.g. cache
> maximum usage controls (cmax). However, lots of possible things are
> still missing e.g. any monitors on L2. If it doesn't fit with the
> topology expected by resctrl then it is unlikely to have been considered
> yet.

Thanks for the pointer. I'll give the snapshot+extras branch[1] a try.

The platform does have both controls and monitors attached to L2. If
this isn't being looked at, I can try and put something together. Thanks
for confirming that the limitation is likely due to resctrl.

Looking forward to the next set of MPAM support landing.

> [1] https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/log/?h=mpam/snapshot%2bextras/v6.18-rc1

[...]


