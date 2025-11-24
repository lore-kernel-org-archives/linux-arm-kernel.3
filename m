Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC33ECFA466
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 15:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Xp5hyyL92DGXPcsi62gt/ZCnMgydkx2tDNxw9WvsLg=; b=hkR/umaGMdsTwWK9gWjSlgg43s
	i+y9VZnEwlGLaKoNiSIga2MupPTSGF8vDaXkPzslKT8mYk6Dyzo35P0JKQ9U7Xipq0GaZmdWzYIVn
	oKRH9SCF89RblAKiH8mNNDBIMqkEFpzvUbRAP2A8DrnMoLBo4bTCzWhxkLyJt3d/NIhjiaCJf99+B
	qeqdTdB/N7CF7AOS48wPB5GLd6p1dMGP9HVOQk834M3CxFTwMk6KYY4kiZG4p8qwPxIIAwfR4KMxJ
	ldkhUol91KhtEArv37XtDknl/+7nDwtQ7ebYy9QSVfavevhgF8YwfvtcsHiCMBUGxuq5OarQpeCLE
	KLReb3QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYNL-0000000BuUH-1rGn;
	Mon, 24 Nov 2025 15:21:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNYNJ-0000000BuTd-16tw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 15:21:10 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOB5pp54003298
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 15:21:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7Xp5hyyL92DGXPcsi62gt/ZC
	nMgydkx2tDNxw9WvsLg=; b=cyiy0pY5tq3c1wYdYzJOePxX6Pn4Do4Xu7ovIMjm
	y+ERWtY5iZXG1Q74vA+LYw/vWGbs7nXq1Rl8exwK/TdGFVac1l+lWNcPsHCdVw8Q
	jqiWbzO124WbyPLndoNDD6zBVy8YkTX+scynTB9HzSaq4IH0/x0v6eOEpTNQ7OWp
	peThRHbSGlYGzn3vIGa54OfkhZ/v39Vnpo8R6KtzIDRmG8qkhoS7dE3hRItaCtxs
	VpOYVrw0w2SM/nrA7sv12svu7/2AYABD2HUGeuvsgMysAAs7TTdP2dlkqrjSXpVn
	PSLpiWU5uj0CVOFc53Z5Hy5Agm+2cwxucOe9NAQEFMy8KQ==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amp6h0pxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 15:21:08 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9371a5de34bso9011021241.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Nov 2025 07:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763997667; x=1764602467; darn=lists.infradead.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7Xp5hyyL92DGXPcsi62gt/ZCnMgydkx2tDNxw9WvsLg=;
        b=HWEVjL3qh0TGLEA33gDoTWy7unLzbrK9DHnhcfwHtj3mtaIdnd7OOioOlIUSL1ZtOY
         o6bpiFDdfiFjbC6tO8nGrbdbLgBQR9pzBgyMEiUt+0OFrk5nZNfLRDmD3bQ7mnRrRFtv
         HTKq7ohyP/YeewqlYSSr8pdVNHpePoxNIxAIyp/e2n6Y6aLh8WypWGebGYqNVl5gerjk
         NMGONi8VltZtXSrmW4UI3HzMnR2NxouNeC8wmFgwKFxwH/pdtlMOfhwgxtBtbXhA/qRM
         q0JfG5cDnfPbZjCW0cR7rGQuREDQLjhxGTtT/9JkfiPv3S5YIlQyv8418K+sUXB7UESh
         sOKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763997667; x=1764602467;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7Xp5hyyL92DGXPcsi62gt/ZCnMgydkx2tDNxw9WvsLg=;
        b=hpLXQMHN2jh/hdrMCQAh5BCxlpzu0snwP+mAz4OGhOTvi/TIyVBEuOm2thj0tRro5Q
         6mQTx6NCNF9E9ZGz0xpZ/UinQTCdfCaXp2hfQRBE7ymtYztssCW8L30VSxw9UiQmbYPB
         xQdh2VsA7y3jKAGZx4o53EcHYImU78S0xXPMN+ZcI3sgCpwlcwixPwI+x7tB3TokcWev
         9oCqE/snD6Bdq505+j95HYaATLTMJD0SAybA/eqP17UEZtWIQgzZLLa3QBtVZA5qRCAr
         k0bsmoN2rlCRR60vPLAdMkMK8uZctedayUt3FBwRPP0bZyPu8EUwd6SJWt9B69MG6ssU
         mrfA==
X-Forwarded-Encrypted: i=1; AJvYcCXXZtEMolnzhOt/7Gv+MtRRr6KSPUQgU+SisFMr4hf0wXney0Y6P/KvOfUYSf4CcYUaxZDsLw3yxsxGCpSNESnw@lists.infradead.org
X-Gm-Message-State: AOJu0YwlEN8U8CwVxpw2/TFQZxupAicnBYvfzm2a4PQtzejVBBO68w+3
	QubzY0ZkseWV96t73YncX6TYNYoVJ3Qcn6+jdc3HzfI+puKkbafxYHf+BldNpPYVBFTiVSFncuj
	RaT5F1uSPeYLzBNMSo7Z9M7XepK3G2r635iH0x5YWCc3qiPeVWQnt5ztuSm88EV4ue2doablGp3
	5LHQ==
X-Gm-Gg: ASbGnctzsZEM7kao/HgD/7vOlVguQiEGl7TCWdWdPI/Brzz5iR8ICQT4cn50OPxnszg
	n3i0zCgnZeeH+GbzNEi41aC9QbvaLBifmND/ZUpFeKiCXeW80RCkMo1QYObiHxHrfhHqCEzcKVx
	l1IZuKSSUTQHQ4q00dDxkpXbqeE2AS9caOnDIGJ/v2rdn36cGQ8gRNhqN8uX1AB8AAszxerbqCW
	hcIvphZsTaQBgWLS7oQMVFZgXnVAuTkRvIaH1poil8+aCqQ0UaXN4NDLxiyGM6VzWg0oUbgtEgz
	Z1GeZXfPB3YfSjBV2pM2xR3fUGgRCnBCB/agjjgiWH6TX8ZnlJqO5LQ5GE30dFpz+Ks2PSo1ee5
	jXMH1040ZrnFkFL7Bk3Z9nw2m
X-Received: by 2002:a67:e7ca:0:b0:5db:db1d:e1cc with SMTP id ada2fe7eead31-5e1de3add6bmr3993511137.23.1763997667252;
        Mon, 24 Nov 2025 07:21:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEwLbgq+f0syhYUIH8yRhYl+rqLz6oua3c3D1yhqylImpHoqxcKHLhjT0WLSt++6fQeJ9uiEQ==
X-Received: by 2002:a67:e7ca:0:b0:5db:db1d:e1cc with SMTP id ada2fe7eead31-5e1de3add6bmr3993454137.23.1763997666665;
        Mon, 24 Nov 2025 07:21:06 -0800 (PST)
Received: from localhost ([2a01:4b00:b703:c200:1ac0:4dff:fe39:5426])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-477bf226c2asm199781335e9.10.2025.11.24.07.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 07:21:06 -0800 (PST)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: Ben Horgan <ben.horgan@arm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
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
In-Reply-To: <20251119122305.302149-1-ben.horgan@arm.com> (Ben Horgan's
	message of "Wed, 19 Nov 2025 12:22:30 +0000")
References: <20251119122305.302149-1-ben.horgan@arm.com>
Date: Mon, 24 Nov 2025 15:21:05 +0000
Message-ID: <877bvfa23i.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDEzNCBTYWx0ZWRfXwTRNe9uXIyPS
 eA/RYzg0L7SNVxWxNwVsnxDCs4Y7+DcSDN8auAyDBA7hlgFTHHhKraJj39AawPvb5NQ6TNadhNW
 fBR/3oOZlu52vbJNHi67sovtjg2H0mEVM/ezC9qpnbD0Al8cKrSIilCBavUqA4gsRPScXSUwrKJ
 Qv2uj2DWyVnNZewcjKuwwImtvvfJnySArgJ8f6At5MNUsK2ilAVTibPsNw/Msm6UUHpxZshWibd
 ncYFxBFME4raVOneF5LDIjVMWBocYRBdkC5x90Dqr5XF2WcOijwEbgnkuOV7prJcmP2PvRWaIoG
 EURFpF/67PAaOuMl/bdzL5lczdkztYHyGPyfpjDkA0xkerVnK2wW+k0xiP6z/8Au8CFQvAEfM7j
 Y9hbs+Vp6hp3ghmRH/BzxH0xNJIXgw==
X-Proofpoint-GUID: CpueqFBXkqA5eqfn6w-2Fo1y8VB_xUUG
X-Proofpoint-ORIG-GUID: CpueqFBXkqA5eqfn6w-2Fo1y8VB_xUUG
X-Authority-Analysis: v=2.4 cv=GoFPO01C c=1 sm=1 tr=0 ts=692477e4 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7CQSdrXTAAAA:8 a=VwQbUJbxAAAA:8
 a=kNSAGAUgJmWAU3osOT0A:9 a=TD8TdBvy0hsOASGTdmB-:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_06,2025-11-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_072109_308771_06E2B1FE 
X-CRM114-Status: GOOD (  32.44  )
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

Hi Ben, James

Ben Horgan <ben.horgan@arm.com> writes:

> Hi all,
>
> Just a handful of minor changes based on v5 review comments. See individual
> patches for change lgos. I haven't asked James to host any branches for this
> revision but please let me know if this would be helpful to anyone. Thanks for
> all the help with reviews and testing.
>
> Previous cover letter from James:
>
> This is just enough MPAM driver for ACPI. DT got ripped out. If you need DT
> support - please share your DTS so the DT folk know the binding is what is
> needed.
> This doesn't contain any of the resctrl code, meaning you can't actually drive it
> from user-space yet. Because of that, its hidden behind CONFIG_EXPERT.
> This will change once the user interface is connected up.
>
> This is the initial group of patches that allows the resctrl code to be built
> on top. Including that will increase the number of trees that may need to
> coordinate, so breaking it up make sense.
>
> The locking got simplified, but is still strange - this is because of the 'mpam-fb'
> firmware interface specification that is still alpha. That thing needs to wait for
> an interrupt after every system register write, which significantly impacts the
> driver. Some features just won't work, e.g. reading the monitor registers via
> perf.
>
> I've not found a platform that can test all the behaviours around the monitors,
> so this is where I'd expect the most bugs.
>
> The MPAM spec that describes all the system and MMIO registers can be found here:
> https://developer.arm.com/documentation/ddi0598/db/?lang=en
> (Ignored the 'RETIRED' warning - that is just arm moving the documentation around.
>  This document has the best overview)
>
> The expectation is this will go via the arm64 tree.
>
> This series is based on v6.18-rc4, and can be retrieved from: (no v6 version)
> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/driver/v5
>
> The rest of the driver can be found here: (no v6 version)
> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.18-rc4-v5
>
> What is MPAM? Set your time-machine to 2020:
> https://lore.kernel.org/lkml/20201030161120.227225-1-james.morse@arm.com/

Although a little late to the party, I've managed to throw together
enough firmware to describe the MPAM hardware and take this set (more
specifically mpam/snapshot/v6.18-rc4-v5 branch from James' repository)
for a spin. Using the branch, the kernel is able to probe the hardware
and discover the advertised features. Yay! We are in business.

Having said that, there are a few quirks of the platform that run into
issues with later patches in the branch. The platform has MSCs attached
to shared L2 caches which are being skipped during later stages of
initialisation. IIUC, the L2 MSCs' limitations stems from the
assumptions in the resctrl interface.

I was wondering if there are any patches available to relax these
limitations? I can give them a try. Or do these need to be put together
from the ground up? Any pointers greatly appreciated.

Thanks,
Punit

[...]


