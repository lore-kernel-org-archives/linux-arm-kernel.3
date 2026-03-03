Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B1CEDEBF1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 20:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OK+IIqPNLkgbz36+VPfXuCiJEyq7012HaDlxd3sHfXY=; b=S5Ti0GIfpLR92Qa1Hssq/x69WC
	RLRsI3pHO0oj4RW81WXgjD+vMaMF9rVQ7Dh80dj5BPJv1KONbsZjVbj/C9MyX6m6lIu2Fm8Z287Jr
	epP03ZvB/QVUgotXqKk3/5IEZSK85rW9tHD0Qe0IfwalUeIpDpejBPTWa9ti9slenw5gvdtXhBcoq
	dBFRORrTRAF7alp9kHAcMCcpM4PmkzmgTgCFMF/02ZEfnjWORDJpcqubEzzOpAVCil6Oc3OwEJRLE
	RQBW23V2qZXDsuWjcxjuJNmcvgDkEURa4cgNtL+LCjYUVeYyqLUxGq72oVXM+or2vYWb2B6Iepaxb
	OfEXcIfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWCf-0000000Ftxn-0zAE;
	Tue, 03 Mar 2026 20:18:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWCc-0000000FtxC-1Lzq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 20:18:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 623H0Cer1256564
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Mar 2026 20:18:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OK+IIqPNLkgbz36+VPfXuCiJ
	Eyq7012HaDlxd3sHfXY=; b=G9ITdeshOZZ5t5O34VTKAFmPzigux6+UB8CdpDYB
	/dSskvXpGRAl/Ovl/kz9QRZhCw4TYkqQdTq+/JnmcRndNyb/RWcOYFeuOkUch8zU
	PFVzYKrWH2XHRaPmQe7Mliqqkb421nMTy38bmDc+GSubVukvRiU3/C4+bvi9QngO
	xcFf9bncm8K5JKMrzo9KJLaAh+78MW6TBhzMMjtp1raLIC49tRwF6oBPgmThRzeY
	LRrsGOhXLoCoivM3MU+7KS1P2yQXqtVuKYosROicOAUqZ3hak6cMpWA0gDaJayKR
	jCfvrtZgHBWeEwdJMfyy4IFQ+DNra4V6mG68p9Jr7Qhx+Q==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp2c9h1dy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 20:18:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8950562d351so594546216d6.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Mar 2026 12:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772569124; x=1773173924; darn=lists.infradead.org;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OK+IIqPNLkgbz36+VPfXuCiJEyq7012HaDlxd3sHfXY=;
        b=CodETPbQU7mA/QYJZ9oc5hImfhvS5RbnBUXDsZ/eaUOo1uU0VMklEJZTze7AtW6KWj
         TSHsVjMQc/aXNnDCD6gsULjlVLXaYITOIdEYQS4IjV6dQqfh3LIKWO9P/7UFcF+dgBRt
         RHj4+q44oiqKcChDnx7V5KsgKjC1bTuowB45CgAvfJBPLuxlAdtP7vZSK/YC9T+KwOf8
         ZAm0c3sLHy4rnbJEptkwtJSy/7uJYlZAcswHI3uVwlvSGCtZYUFEkcMPxFyzknzF99QZ
         kN0zz394MXUC28hmISLO5qFx+ej6SILstkgZTIXY7sv0kNvXRXy5y2FV9EMwgv410n0G
         55qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772569124; x=1773173924;
        h=mime-version:user-agent:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OK+IIqPNLkgbz36+VPfXuCiJEyq7012HaDlxd3sHfXY=;
        b=F+ffrfcQnmr6qjalbdMY/ZOcNht5bxBsOyX8gWBNsEM5rtTDN6osxmP+BCI3r1euxY
         svbI3R4Ozeu6jkWB+RMa+xPAeG4QxyEl+BZi9+OrLRqzX2EF/+LtxH2SeTRA/aLoP3E7
         oxaIQIbrIO/iscHo2MZnRvXb0OEumAmFBSnU/Fn78TKD1Leje6JzdGDpS07QswVhKZE2
         MsYVolNH8z3f29Spktk5pl1BdgV8hypCQqNAk6Woh3oIc6aMdjE96HUspcZ8embhpJIg
         Yv1P1CH/WLsij6garMOe56EQEcltUjVNXRlQlhzbzKJhiXiqhWgt4M6yuk4G/Xj1hpQ/
         nOhA==
X-Forwarded-Encrypted: i=1; AJvYcCWyVBhkGaPLmq/F4WY0WzSD97LOARH1Jmkm46Ry2epsfIsylsRFhZAbhdZgaFIPUi6gwg3aOaS1fKZklc8sOjtD@lists.infradead.org
X-Gm-Message-State: AOJu0Yws+/FBM9xH35ITyLtPw5H+XOZvyqnZxDkkWEXlciuRULnQSo+8
	ePFZyOCLEOSnts1AiOOZJO6KUd8vicxCFA8oTISogXGXeGCYM//JIhyYy4BOJ/xFY1lz5RYOIxc
	aA/hW31sPhreZCwSeC/k9GSKazSfULAsDI0dpZDiv0q4iVD6cVV1PmMS+2GqlqpaOmB8f+1JRNx
	JoQQ==
X-Gm-Gg: ATEYQzx40a3g/++/gl/ueO6tKB3bbDC/tAuH1wVNjS+4G+Vaxx88C1UP96QnBEw1pLw
	VTYCowFb1TnglcQLGI90Q9y9hDXGyIGwx1xUIvKXzNthC199rCwSmf0Di9iYfz5kqshW8mmYqE+
	trfi2Rk3Kkmk3GDQy5QrIMp09UHxnKRRcj0qrinfeTcyK1NeuStZnosp3S3rONXmcms0VAAhmp3
	RWVNGgs1lUN6H6WWjCjLSfC9W6towCB5xF+Kc/958+JscKzZfQT14NC5x/r+7I+d99wHT1GAAG/
	xWK5zU9w0fKYrliyF9wIhlWHjOXeR1vg7uWzRPxtTMPCciX0X4JoFwdspQJRqeAqVjzHBRQxajr
	RktDUCcH7Ri0lusp33fALF2Tu2VJqGvXW8GDw8A==
X-Received: by 2002:a05:620a:471e:b0:8ca:4545:aeee with SMTP id af79cd13be357-8cbc8df0a40mr2321999685a.37.1772569124320;
        Tue, 03 Mar 2026 12:18:44 -0800 (PST)
X-Received: by 2002:a05:620a:471e:b0:8ca:4545:aeee with SMTP id af79cd13be357-8cbc8df0a40mr2321994585a.37.1772569123830;
        Tue, 03 Mar 2026 12:18:43 -0800 (PST)
Received: from localhost ([2a01:4b00:b703:c200:1ac0:4dff:fe39:5426])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485133a933bsm21421905e9.14.2026.03.03.12.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 12:18:43 -0800 (PST)
From: Punit Agrawal <punit.agrawal@oss.qualcomm.com>
To: Ben Horgan <ben.horgan@arm.com>
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
        baolin.wang@linux.alibaba.com, carl@os.amperecomputing.com,
        dave.martin@arm.com, david@kernel.org, dfustini@baylibre.com,
        fenghuay@nvidia.com, gshan@redhat.com, james.morse@arm.com,
        jonathan.cameron@huawei.com, kobak@nvidia.com, lcherian@marvell.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        peternewman@google.com, punit.agrawal@oss.qualcomm.com,
        quic_jiles@quicinc.com, reinette.chatre@intel.com,
        rohit.mathew@arm.com, scott@os.amperecomputing.com,
        sdonthineni@nvidia.com, tan.shaopeng@fujitsu.com,
        xhao@linux.alibaba.com, catalin.marinas@arm.com, will@kernel.org,
        corbet@lwn.net, maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
        suzuki.poulose@arm.com, kvmarm@lists.linux.dev, zengheng4@huawei.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 00/41] arm_mpam: Add KVM/arm64 and resctrl glue code
In-Reply-To: <20260224175720.2663924-1-ben.horgan@arm.com> (Ben Horgan's
	message of "Tue, 24 Feb 2026 17:56:39 +0000")
References: <20260224175720.2663924-1-ben.horgan@arm.com>
Date: Tue, 03 Mar 2026 20:18:42 +0000
Message-ID: <87y0k8r7j1.fsf@stealth>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDE2NSBTYWx0ZWRfX6Yx0KoQCFNgw
 MKgb0/699zqE1PQR+aLFTx4PmhdULlKXicTSCSrvO19u7AeFltKnAZYrvkEYWXCsyWqLZiUpkPG
 BTQbKdKlBcdzq6EpoaKyQgoKz+G6gc7XdQSAvxk05Vakg3RNH+WyxIyWv8oAz8RD238oDbXY9gY
 CFV13ejDBjIH6Pej12EY8jpn7vzG0w1o4R4v3fNi5C8OHXrnijkDPv9gMQNApiuM8IJg25ExNz3
 vWaUfkZBeYtgzEHVnsIKxig5PPOMvq1i9NYG+yG9QOD3DsqyChQVp4J4hlbP2y8vd8WWiVkuKQs
 v5YJkGt93a6CWusZ2DLNtkAsTZGDH21EH4rje8k4ngbk312OCSMB53BrX1WHkYBJzvua8t/zmC4
 yLUqAroc+IGzeGtJUQcUEzEDEdo+kzPshfQPwqrHCE+cMoOM5W9Dfci+d2Z5Rga9KLLnLE7jHuf
 eZ/nIAjJVqNNXMk5b4A==
X-Proofpoint-ORIG-GUID: BqdMe2b71SzS_tJIQRLN9TPI_ZOYYhlB
X-Proofpoint-GUID: BqdMe2b71SzS_tJIQRLN9TPI_ZOYYhlB
X-Authority-Analysis: v=2.4 cv=EefFgfmC c=1 sm=1 tr=0 ts=69a74224 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=kEJNvqoAXZf1GWF-TxsA:9 a=OIgjcC2v60KrkQgK7BGD:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-03_03,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1011 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603030165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_121846_509396_1161DB93 
X-CRM114-Status: GOOD (  32.52  )
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

Ben Horgan <ben.horgan@arm.com> writes:

> The main change in this version of the mpam missing pieces series is to
> update the cdp emulation to match the resctrl interface. L2 and L3
> resources can now enable cdp separately. Cdp can't be hidden correctly for
> memory bandwidth allocation, as max per partid can't be emulated with more
> partids, and so we hide this completely when cdp is enabled. There is a little
> restructuring and a few smaller changes.
>
> Changelogs in patches
>
> It would be great to get this series merged this cycle. For that we'll need
> more testing and reviewing. Thanks!
>
> From James' cover letter:
>
> This is the missing piece to make MPAM usable resctrl in user-space. This has
> shed its debugfs code and the read/write 'event configuration' for the monitors
> to make the series smaller.
>
> This adds the arch code and KVM support first. I anticipate the whole thing
> going via arm64, but if goes via tip instead, the an immutable branch with those
> patches should be easy to do.
>
> Generally the resctrl glue code works by picking what MPAM features it can expose
> from the MPAM drive, then configuring the structs that back the resctrl helpers.
> If your platform is sufficiently Xeon shaped, you should be able to get L2/L3 CPOR
> bitmaps exposed via resctrl. CSU counters work if they are on/after the L3. MBWU
> counters are considerably more hairy, and depend on hueristics around the topology,
> and a bunch of stuff trying to emulate ABMC.
> If it didn't pick what you wanted it to, please share the debug messages produced
> when enabling dynamic debug and booting with:
> | dyndbg="file mpam_resctrl.c +pl"
>
> I've not found a platform that can test all the behaviours around the monitors,
> so this is where I'd expect the most bugs.
>
> The MPAM spec that describes all the system and MMIO registers can be found here:
> https://developer.arm.com/documentation/ddi0598/db/?lang=en
> (Ignored the 'RETIRED' warning - that is just arm moving the documentation around.
>  This document has the best overview)
>
>
> Based on v7.0-rc1
>
> The series can be retrieved from:
> https://gitlab.arm.com/linux-arm/linux-bh.git mpam_resctrl_glue_v5

I booted with the series applied on an MPAM capable platform. The driver
is able to probe the L2 attached MSCs.

In terms of features, bit-mapped based cache portion partitioning works
as expected. The platform also supports additional controls (cache
capacity and priority partitioning) and monitors (memory bandwidth and
cache storage). The ones supported in MPAM driver probe OK but don't
seem to be exposed. E.g.,

    mpam:mpam_resctrl_pick_counters: class 2 is a cache but not the L3
    

It looks like some of it is due to an impedance mismatch with resctrl
expectations but hopefully we can get to it with the basics in-place.

Feel free to add

Tested-by: Punit Agrawal <punit.agrawal@oss.qualcomm.com>

Thanks,
Punit


