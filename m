Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46747D2F7E7
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 13:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aJNZlqMyVpKqCVauRzrnOtmMcjDznFVaeApZ23rdtJQ=; b=wqGE5TH5Qs277DXF8K9tHo/8Zy
	92BNP/k6DyfNRRRqYa6cHYyfVEQ1c0PIbjgOvQ3TYrYJ2oCRz2I/B0DUYdFIJ2L5kssNOz2sQ+2zQ
	nAFZQD079VUBiwyF8deyE/zOdsiGSd5iGypz7f8tYiKqARyQFPgjuIglsIMowRnSq0XiPodPEdSmV
	9tufMS/Y6YT2YUmc7w3aUZZV2zDAED6D6m2dxQwdXIQ+aBObKzYv+R2WPsrO4QamfnmbSFN/4aQSE
	4nw/27Mu1wAX23ZX/gYINgFgwrwpiTfEE6ElxEqq5lPffy8Ere5G3Uxq1Sj3+1zWCOyVrAi3VEcpi
	Igjr0pTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRVYG-00000009VvH-1HVq;
	Fri, 05 Dec 2025 13:08:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRVYC-00000009Vus-2oYI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 13:08:46 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5CqGYC231531
	for <linux-arm-kernel@lists.infradead.org>; Fri, 5 Dec 2025 13:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aJNZlqMyVpKqCVauRzrnOtmM
	cjDznFVaeApZ23rdtJQ=; b=jdtk4Ma60YUKV/uVdaOGpuNZS0SdVyoAHNOogZnA
	b4m1hBNXgYSzExerCqlvPC49B5Ehr7YfhzMwiNSfQGgfHq99ygdWQvkCjQU4hGkv
	wEoZr0HO4F7efWkhzHWcmdKAVIp0d9DOUx75lH8YDfTD5oYKRvoa6WGlfRGY8ZAD
	j+CwXqCWelgHlSM1D5TLlv+IRTyLrOrJeH+7oyUSAXC/U0dwzfmt4m2nXBnuMFBX
	a0R7Fit8RGqOX/oR3wQD5cfaPT2gN5wyKaWCp9leTYOwQrs5GnsxJa5KjORwhr81
	0QqvhzQPirqFY6hORkSZwm+lnfceTlbwEKjuuGN8jlA+HQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auys7g18p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 13:08:43 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9371a5de34bso3255809241.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 05 Dec 2025 05:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764940123; x=1765544923; darn=lists.infradead.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aJNZlqMyVpKqCVauRzrnOtmMcjDznFVaeApZ23rdtJQ=;
        b=ZefMdCTauYOWvYU181878FKlBmNjagDev5Y6O58Wtt71Cn6cOtcDjchZ7oHOvBk6e2
         AorjxGv1dAv2RAJbgMDKBVyibZVZGouycGkxazsuBBEdeF09rirB1lDoeTt8MAHv4Ze8
         BdNrilL4zY8LQpGWrCxs7NPAG8prmEiDCVFvmT79FP24GX1ghc2yOF35675j9NsAGG9o
         5F6cIW3Q7XpwQpH0SDmJCqlRQePNF0oG/8SRIXbHlSmMgHv4saI5ycYvLHW7AHXg1vXh
         O998fICtYFwdCcF+WtUAlvu0voS1pk/KV9G+ss+paNTsc+ulk2OCZFR6Rj8h377F2ZfQ
         xH5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764940123; x=1765544923;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aJNZlqMyVpKqCVauRzrnOtmMcjDznFVaeApZ23rdtJQ=;
        b=SZU9Bsq1x62DcjFlTu8yXH1cNJTE3SH5qlZi65MZZ0ynoT3Ye+NDTjGx/Ko82GDwFn
         C4Zsabi7GEmnMzRPU2M4Tj3OjyIcbv4645I0JhsglWdHJWARiJpE9XAKFmOgfU2Jx+hw
         TsfI1lZ2eOHvdK3dhfPs8OajI3ouwLfsvGZrEqr+e07xHQ4gLw/wnZ5tzXIKRyYYhTIQ
         vjeqYbGnhjuQHW2Ofn7bh+w8RIpMXmEjNDFdt/LdYsJwZ6lsLrRYb7RX1P1wmYclavHm
         Xb+LiQdzR86wG4Mb8edSNVoGfpYxVQ3HFweLFrh28YBhK4rEFJfm7VCBIAgBt1zf12Fr
         FYkA==
X-Forwarded-Encrypted: i=1; AJvYcCWKBKCIToM3/bD0UrXcBeZy4SnjPfFICbppTbNAVWG2e2FOzS+BCT0KxvSBXsq8cz319/dFsMY9J9kzvt88OOph@lists.infradead.org
X-Gm-Message-State: AOJu0YzknjZHG1shgCBeS0Ov2NrLDt59DqdoHtq5QI0nU+xswEpgEACP
	z4STHtjTPtsJc0xDq57DoQGAhy9LOAfPOyTJMlmCo4YnuWeEVLfl44CXXK2tPKbKS8UcODkQrVO
	Y8e9Bodd2gvepd0NJ4bTVbAhJVVKPdJgNDkSfZI7YB4NtVobp9S7U6I1z5Iy1CD8TNLHpYresnJ
	q8qg==
X-Gm-Gg: ASbGncsG01Ypl3GEuTbwjUv271uIDCa+bjvlarutZvit4uMxOJ2q5Tebma1E103nfAe
	a7K9nOY05UGdt2fXQJRgZNke+D8BAxyEbighcycBrq8uweLfFcdcLW1/Zhvele/FaowSU76Fr52
	89Z+lBmIQSCiapieZPPCe1NE43iFui/Ce0jM2fGKkaQrsL6b8Xf1A/DyQLEs90oEAc1fXcxBlPX
	GN8wcDat6JEGjUpARwcO5lvRoLwtpatkWcxM2c1qIq+HL50dHiuBYiXJWb0Dm8ASJj3Zfrv/lUN
	68s2AIkIA5dfHdl9Lt7jNglpCOTJttb5RIlNCxLtAtkiGHE0gc1SJ9JA9w22b+YagUsQhWeZknS
	14mc72Kk6V99PajtnACJnMKz4
X-Received: by 2002:a05:6102:5818:b0:5e1:866c:4f7c with SMTP id ada2fe7eead31-5e48e3d3c32mr3751093137.39.1764940122637;
        Fri, 05 Dec 2025 05:08:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHoVFLXE/I17RgN98+gHQViOk7KSVZOb5/MXqt1hrIeWuM9v9uKcV9QR6B6Q6gd7CA/qJwGVQ==
X-Received: by 2002:a05:6102:5818:b0:5e1:866c:4f7c with SMTP id ada2fe7eead31-5e48e3d3c32mr3751005137.39.1764940122130;
        Fri, 05 Dec 2025 05:08:42 -0800 (PST)
Received: from localhost ([2a01:4b00:b703:c200:1ac0:4dff:fe39:5426])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-47930c76edcsm82740975e9.11.2025.12.05.05.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 05:08:41 -0800 (PST)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>
Cc: Punit Agrawal <punit.agrawal@oss.qualcomm.com>,
        Ben Horgan
 <ben.horgan@arm.com>, amitsinght@marvell.com,
        baisheng.gao@unisoc.com, baolin.wang@linux.alibaba.com,
        bobo.shaobowang@huawei.com, carl@os.amperecomputing.com,
        catalin.marinas@arm.com, dakr@kernel.org, dave.martin@arm.com,
        david@redhat.com, dfustini@baylibre.com, fenghuay@nvidia.com,
        gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
        jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
        lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
        rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
        scott@os.amperecomputing.com, sdonthineni@nvidia.com,
        sudeep.holla@arm.com, tan.shaopeng@fujitsu.com, will@kernel.org,
        xhao@linux.alibaba.com, reinette.chatre@intel.com
Subject: Re: [PATCH v6 00/34] arm_mpam: Add basic mpam driver
In-Reply-To: <642767c9-f926-490a-83a1-160978c37553@arm.com> (James Morse's
	message of "Wed, 3 Dec 2025 17:34:37 +0000")
References: <20251119122305.302149-1-ben.horgan@arm.com>
	<877bvfa23i.fsf@stealth>
	<a04aa337-a3eb-42a0-855b-500ba549e2d8@arm.com>
	<87sedrlsjk.fsf@stealth>
	<642767c9-f926-490a-83a1-160978c37553@arm.com>
Date: Fri, 05 Dec 2025 13:08:40 +0000
Message-ID: <871pl9krdz.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5MyBTYWx0ZWRfX9qH/RqXVok3F
 QUPUaBIymk2TbyVCTvtax4dAdubVQ392qrizMVfRsfqy1aXS2+uBsMDtLhJYhXP35eU3ScXF62D
 co1IcmKu29Phyf1On7yKGXseyosgn6aEJFl24a3QLZC0J/7CQVX7FeYqK45JH4CbJbibTTVIMQS
 4fRX5ySvCIXhPG4F7Oe7fV4bNQOW/23jxPe6sWM8CO2C/dGn6dyt89oV/kOJVshVyoXyWX0U9bi
 hzu5pdBcrtY7PxkKJxbiWfV0gTaOIKZUXQEEQjtRiNtXwm2u6w+lbB+YRtOmjBEsx9CFIS2azLw
 UkgNt2VoGoVFBIydlS8W7ACQq1k55YkFz7lmlAOrOpLG3nMqM6glnQWAJdmo0BiPY+NjF8adIoG
 DGVbPX0RC5WtzdayMpDwdLtAVwmjrA==
X-Proofpoint-ORIG-GUID: CYxwfhCP3VY--SDbWmtKDzS2FgxbchEe
X-Proofpoint-GUID: CYxwfhCP3VY--SDbWmtKDzS2FgxbchEe
X-Authority-Analysis: v=2.4 cv=GtVPO01C c=1 sm=1 tr=0 ts=6932d95b cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7CQSdrXTAAAA:8
 a=aZ4QdqtX2bFftAu5rtMA:9 a=TD8TdBvy0hsOASGTdmB-:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_050844_735191_82445D42 
X-CRM114-Status: GOOD (  37.34  )
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

James Morse <james.morse@arm.com> writes:

> Hi Punit,
>
> On 03/12/2025 11:21, Punit Agrawal wrote:
>> Ben Horgan <ben.horgan@arm.com> writes:
>>> On 11/24/25 15:21, Punit Agrawal wrote:
>>>> Although a little late to the party,
>
> There was a party?!
>
>
>>>> I've managed to throw together
>>>> enough firmware to describe the MPAM hardware and take this set (more
>>>> specifically mpam/snapshot/v6.18-rc4-v5 branch from James' repository)
>>>> for a spin. Using the branch, the kernel is able to probe the hardware
>>>> and discover the advertised features. Yay! We are in business.
>>>
>>> Thanks for giving it a go. :)
>>>
>>>>
>>>> Having said that, there are a few quirks of the platform that run into
>>>> issues with later patches in the branch.
>
> So something in the resctrl support code is causing this.
> Any idea which patch causes this to happen?
>
> There are a load of pr_debug() in the picking logic, if you enable DYNDEBUG and add:
> | dyndbg="file mpam_resctrl.c +pl"
>
> to the commandline, you should get some snotty messages about what non-Xeon-like property
> your platform has.

Thanks - I've got this enabled.

The platform looks very different to a Xeon. One notable difference
being a shared L2. Hence all the MSCs attached there.

>>>> The platform has MSCs attached
>>>> to shared L2 caches which are being skipped during later stages of
>>>> initialisation. IIUC, the L2 MSCs' limitations stems from the
>>>> assumptions in the resctrl interface.
>>>
>>> What in particualar is being skipped?
>
>> The registration of the discovered MSCs with resctrl and subsequent
>> exposing it to the user.
>
> resctrl's 'L2' support is limited to the CPOR bitmap.
> If you have controls, there is no resctrl 'event' that can exposed them.
> (the problem being they all have 'L3' in the name!)

>>>> I was wondering if there are any patches available to relax these
>>>> limitations?

> Knowing which property it is will help - but some of these things are checked
> to match resctrl's ABI. They can't necessarily be relaxed without breaking
> user-space.

This platform has portion, capacity and priority partitioning, as well
as memory bandwidth and cache storage monitoring. The MPAM code seems to
correctly parse the properties.

But as you point out, the resctrl 'L2' support doesn't have anything
other than CPOR bitmap yet. Have you looked at what's needed to extend
resctrl to support some of the others?

> Others are sanity checks, e.g. all CPUs are represented. This is to avoid tasks
> that run on cpu-9 escaping the resctrl controls. Platforms that did this may as
> well not bother with resctrl at all.
>
>
>>>> I can give them a try. Or do these need to be put together
>>>> from the ground up? Any pointers greatly appreciated.
>>>
>>> There are some extra things added in the extras branch [1] e.g. cache
>>> maximum usage controls (cmax). However, lots of possible things are
>>> still missing e.g. any monitors on L2. If it doesn't fit with the
>>> topology expected by resctrl then it is unlikely to have been considered
>>> yet.
>> 
>> Thanks for the pointer. I'll give the snapshot+extras branch[1] a try.
>> 
>> The platform does have both controls and monitors attached to L2. If
>> this isn't being looked at, I can try and put something together. Thanks
>> for confirming that the limitation is likely due to resctrl.
>
> My view on 'extra' counters is to try and expose them via perf, as this would also
> allow platform specific counters. I worry that if we start adding 'easy' ones like
> l2_mbm_total to resctrl, someone will want
> left_hand_side_of_soc_mbm_total.

I wouldn't club L2 in the same category as 'left_hand_side_of_soc'. You
call it 'easy' for a reason. L2 is pretty well understood and resctrl
already exposes an interface for it. I would avoid creating a new
interface for users.

For some of the other boundaries, things like 'left_hand_side_of_soc' I
wonder if firmware provided topology (e.g., PPTT, SRAT, etc) could be
used to make even this work.

