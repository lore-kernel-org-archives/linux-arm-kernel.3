Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24925C5DF93
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z0jAerVsIkiT6YlaXFFru4y/SIxkzTdGGLcE7o9Qax8=; b=PpaPQ5oz+n55Hc5nVErpdVpzLQ
	tDl0aREah412vCXP29yF9BQGBXOT3Lkqvw9bmKQd2JC4dIRAIMVTYrKEnEj9LiA0e44uCas02Ww6M
	iR66GhW1IoYRXzFluptjtRCAU8g2romSrcvl3FonVkpGiGk/mh/Y/YimIRLQ/Zs2rtPIyxWb5zDjX
	V0NI+WPHd19coQJRfv6mO/MqOzqHTRzX4MPaMXV++gtZafmHhDlKAUsNxEyeuPYdxzV+pj57kgAXp
	ltZ47OM/UfMjWlsSLOhB5PYRJArahD6CJQwEAqnXY3Qq9iWeisDB7+8KOHRmkNOtY6+vc8wLr6b2j
	7Tj07Aig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRoY-0000000Dl2F-3k7K;
	Fri, 21 Aug 2026 16:09:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRoX-0000000Dl0D-05jk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:09:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFmJO22322958
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:09:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z0jAerVsIkiT6YlaXFFru4y/
	SIxkzTdGGLcE7o9Qax8=; b=L9RMF+SwhFrS2/a5618T9I6t4SaQogM58LQxIUQX
	wIoX+7ANRywdDnkPw6mk0IYQuKEpHaaS0W7lxcyu4dPNUxGXpqIW7BqT0braJ2iK
	x1ebSNWfn+bA6QDkR2RW51FyU87yMO85Gtic6cC0hOJHSdOxIN5J3gcYLAN6pWHV
	cCYnREeMCi0/IUqRwxXa3u4MVgeiPKzGogSFXQ9y8LbKu9bkXCKRIz04RXlx4R7V
	ykFlZgfyVy5CB4/C44FgiPLLfclCR7DDM6fyxl20nCeCBxU5rLOkGBouPp86sqIJ
	+pCqugl+mG1xNZXF1YFAxDTySbFHTEfCHiKgb/LitzaQWQ==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fbwajsv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:09:51 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-837aaa9a3f6so44745127b3.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 09:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328591; x=1787933391; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z0jAerVsIkiT6YlaXFFru4y/SIxkzTdGGLcE7o9Qax8=;
        b=IoA6X8D+KgHjnyC+/K3aW8/J0LKiGfSDNORQjsvFMshu+HY7cuqWJAJofYZDBiFEVv
         a1OPPfo0OJUlKnAXSmQe0F55v/jl8Mk/JaDuxbsuc9nLlJVPgBEMK+ThvFDaK8wpazzY
         UzEqWImzCsKeIGabBQnH3oRgswtSAYXJHIKxlH72fCz4WfGunUD93L4lPnlK8qjmAmSR
         SOuh9RVAdnW3ZK9Nd3iWP9HniHBiekUbg3bA9UIxf6+8kdgdMEnwlZwV8c+/dUZ7Xldc
         PVEf4NxW+IIvkHn8Fi0HtJ7e8kU+6zk+jEk6IYSIDmpbAkPH7dC9uHXb7mU4AhfCO20/
         +kmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328591; x=1787933391;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z0jAerVsIkiT6YlaXFFru4y/SIxkzTdGGLcE7o9Qax8=;
        b=Eb/iMeP1Xdm9MdDq4VKY/S1CeAseIxPpYaXHrW7BjL+oZ56mZemm0QNG0JHUC9a99H
         9G+uz6PNMFXISIDhSqSP9RnrT9I8DJOgzSHrmIF20g03O5qwEJyWtTNA5U1hn8+xVIcK
         4c+J/DBfpHBgAHvdClvKvnDCGYHgFdTk/AK3rX4+le78N275iVuK6hCEfBXDbXncNYiH
         7S7VXKfYIkNGggC7zCwEdfATjf2nhzhmGknpgyXjvycxVkkkohfw/EimQsoQFHoMgAAK
         pTqIeRHDh8Mz6jbYCHBJUI4OwZrxofi2qOUlO/vN7vNa41TV2GbTGyJPmvF48BCfmOjL
         e28w==
X-Forwarded-Encrypted: i=1; AHgh+RpmfSNhHitKKHY4rFn3UOvXuo/qXdrVwR6ErBX5IlNw+PD0fT1qTzefu+05Pz8TEup4ByfewcQFUxjRqXEGZ3OU@lists.infradead.org
X-Gm-Message-State: AFuF++mIYLlfVofgzDUGNxI0VOucLrvMW/AK8EBKcS9Azi/dLNeH/bbK
	6xWki9HXOBapBx2KiIM6bqSgMsW4bCOf1CHnih1/jidhE6LWUbzVqQlD4fH832YH0tOkpFezxOY
	7rgJch0SUC7+7QaPK+PKoutHgqB28A9Sn0M5odgZU8R9DolKrZkduVlr7pvKqMILmovsycxSZOW
	YY7w==
X-Gm-Gg: AR+sD12N7KZUspS7pBwlzmKrqyIMjs22j39m/ePkcbmNhqPDNyx4AC5mUkJI1BpenDj
	B4VaObB4SHEcfnEp2MG/18Wkbp+Pd1117Zbeo6/aAitvLMwI+fjPYyjcfxqeLiDMEYNhKsR5a0C
	ZqYE4kJCxHrR3P8QriFOStHWMN9jho6JchqEKmURQHP9CG/R6bwxiduEmXRMEOdO34H201K3Ko4
	dTF9/ifL+rXsRusS94Ffee8o37/JMaLIfeYCXXPCPlvByR7svOphAGrhVKMuUmhgWcw+jCFZLNu
	trFKGFNG5SvYFjIet80XPSgqcOj+EqC2P2rU5Ajr4n1+SwvU5bvVHHOV0Bd0ZmikvK5SZo/EkLe
	djPo6TKrJvs25RXpawhQ5kH8PTdATlQzrDSRqnsyB/a8IVsEUDg==
X-Received: by 2002:a05:690c:e0d0:10b0:80c:16ad:2f16 with SMTP id 00721157ae682-84a16f25227mr19204307b3.8.1787328590876;
        Fri, 21 Aug 2026 09:09:50 -0700 (PDT)
X-Received: by 2002:a05:690c:e0d0:10b0:80c:16ad:2f16 with SMTP id 00721157ae682-84a16f25227mr19204017b3.8.1787328590376;
        Fri, 21 Aug 2026 09:09:50 -0700 (PDT)
Received: from hu-ashoraj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-845119c6c36sm43432287b3.8.2026.08.21.09.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:09:49 -0700 (PDT)
Date: Fri, 21 Aug 2026 09:09:47 -0700
From: Ashok Raj <ashok.raj@oss.qualcomm.com>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Cc: Jinjie Ruan <ruanjinjie@huawei.com>, linux-arm-kernel@lists.infradead.org,
        mark.rutland@arm.com, maz@kernel.org, will@kernel.org,
        catalin.marinas@arm.com, liaochang1@huawei.com,
        Ashok Raj <ashok.raj@oss.qualcomm.com>
Subject: Re: [RFC PATCH v2 00/45] arm64: Add support for FEAT_NMI
Message-ID: <aoh4S4TE8-NTZFPV@hu-ashoraj-lv.qualcomm.com>
References: <20260727163453.7969-1-vladimir.murzin@arm.com>
 <d594b97c-747d-41df-8f7c-563ea11974df@huawei.com>
 <18338c14-c7c0-433c-8a88-ba5624313c48@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <18338c14-c7c0-433c-8a88-ba5624313c48@arm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXwyZPe0Pk8ZHf
 nk/QY/WEGAiLk1fpLlLeZyNb11BVjZ0wwbtoo4SWhK84VlhOw/K3SZaCkREb30gSi+ar5+JXl/q
 5A0Wso+WlnYAWU4uqzRJnyO3u2+ijPI=
X-Proofpoint-ORIG-GUID: 4P4ZilNzEuxElt9ZKq3TfSwlXGCKPTUg
X-Authority-Analysis: v=2.4 cv=L9AtheT8 c=1 sm=1 tr=0 ts=6a88784f cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=RzPCWjcIU7U2lKNcB90A:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX3gVXVSruyO55
 7imq35uUjKqBE7xEDiz+dX50uM39lgX0dgVQ8N339cy7CeCDcmF3+vUI3syllVv6XFzfKYAEY5A
 ycZbgHNB1aJDzmT+MrH+jt240270KVdivkaO8ySAe4QkM2dugueErRQakc5s9znMaF3SF7cnrcc
 +Rq9PQlcgww66yYE/s5+7aNvIDBTvK4r5rbMzufBNlcgIrnaN3mXULlBNUztCFx+jKmQgPrLfKU
 rdXujT0ipuY/zV7D5AVJBeWp6Nid0Lne/NRkkqT5NsY3yrusLA4sbGCBe/Z+1pcUOh9Aoginu6a
 fIzy+8BXmD0PNKBX1o2dpycRigtI6vqJngl3ZN8qHYbWFY/Kvmvb4kM59N8SeuSpPPqZU/do26H
 WiRIfKsSsu3QBUFWDze0qyNpMAq5/mRelh9XSAvzndkP+nyVSpObEGHHeQpG9WhJFZEczjkKNoJ
 oq1H1Atpn45dtIyszMg==
X-Proofpoint-GUID: 4P4ZilNzEuxElt9ZKq3TfSwlXGCKPTUg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_090953_096000_15524DDC 
X-CRM114-Status: GOOD (  21.53  )
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

On Fri, Aug 21, 2026 at 02:03:07PM +0100, Vladimir Murzin wrote:
> On 8/14/26 02:52, Jinjie Ruan wrote:
> > 
> >> With this restructuring in place, wiring FEAT_NMI into the new
> >> framework becomes much more manageable.
> >>
> >> This work would not have been possible without the contributions of
> >> Ada Couprie Diaz, Mark Brown, and Lorenzo Pieralisi - please credit
> >> them for everything that works well. Any remaining bugs or issues are
> >> entirely my own.

Spoken like a true leader :-)

> >>
> >> I'd especially appreciate feedback on the overall approach. Please
> >> don't hesitate to bikeshed the naming or other details - improving
> >> clarity is one of the main goals of this series. Of course, technical
> >> review is more than welcome as well.

I started reviewing the series as well, and apart from some minor things
nothing major stands out at this time. But I'll do more with my testing
and if anything pops up you will hear.

> >>
> >> The series would also benefit from extensive testing on real hardware
> >> (without NMI, with pseudo-NMI, and with FEAT_NMI), as most of the
> >> testing so far has been done on QEMU and Fast Model.
> 

I'm also starting with QEMU!. just doing virt I suppose, do we have
sbsa-ref model as well working? just wanted to check, I was thinking
about it for another use case.


-- 
/ashok.raj
ashok.raj@oss.qualcomm.com
Qualcomm Inc

