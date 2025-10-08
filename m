Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA71FCAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Oct 2025 16:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=maqQv8jukNN7H8+OTGdtneufSwQ7FHqm8dGuYbwSXjQ=; b=GpAhBsUwjVrNxOrgqYEb5HvQX2
	Xj0xWbZF8UhVO/gP6rjUyS/DUvZsWD4VlY58Sz3AP23UJwTqSHwuTXc05H7QYW0sm5HhuIUu+1sCD
	eRBnmf3EYzLfZHOZ8O4w/hqOZX5jaqdtz2H1JqVZwguc6O49msDwTJPzu1cO46OPdXo6/bQmaxjwG
	cGQlFNmHCZfLdr0aKflzHKgsVfrkvJP+87b5VRI3Otr4S2Db47pm2W/jxCbcMHwIu0z356wslk/FJ
	SJYatbHuI9Sy/+2Aa+Icy2wTbHV75DnkYvqFNVp4H50nDCS2UaAjdYKNu+WURFDOiAETSWFnSYLm6
	NFwiYJFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6XNf-00000004L0m-02ah;
	Wed, 08 Oct 2025 16:51:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6XNb-00000004L0R-2jLV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Oct 2025 16:51:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890qXI021479
	for <linux-arm-kernel@lists.infradead.org>; Wed, 8 Oct 2025 16:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=maqQv8jukNN7H8+OTGdtneuf
	SwQ7FHqm8dGuYbwSXjQ=; b=djWFSYF0eLnlQ9aPUPDcClV45ZH/Jd4EUJ8vNfhW
	DSa7Q+Cvl4c80b6XpZsYvWk2qwpQHhPk0kzOdlwxpIncZfBW90/l8+oW/CQRDiQk
	kUb/GyeV/uyyuUnFog5wezNe/HWuZAjhgGwX65djvkQH9G5DFKHfudiTDociN4fx
	aqjaQ7PVD2mtDnhE/l3qz4Xez0+YE38WQlwRIxQHU45GdtGoGnwgVD8LaYJNaKv0
	LGZOfxEPf58YmhVoz+Og+56uaQyBIu9q/E7CCMZx/g6tOWIllC+V73PV3bxJ9XoX
	M/FoOrJjY4I1Qorfz9YCrpqDJTpNLfFoG3GIlVwVVAXnoQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1u8x2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 16:51:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-28973df6a90so213405ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Oct 2025 09:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759942266; x=1760547066;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=maqQv8jukNN7H8+OTGdtneufSwQ7FHqm8dGuYbwSXjQ=;
        b=gomm/34WPcoRR6UwfKFTis0ghNb/5xHjCSx0ooc71nhzD076y7iY5PPWvYr3Eo/+Me
         8d7kqRPMWQZcyh0azvS0hrDJxAG/mbSCygcLWZiLudl9U+k14hl+TfkpdPvmNKaY5ROc
         DCBrxiuh/QNvZgzpvlN7oRuJtJKi04YG+a0lzRyNw12kG1bDZn3iMj9+AVZg+SX25yPw
         jAIDKXISSQhjzGyrk+Z80eZG9SZIuGwsRP/T2UPtrBfuWt186Mnkw1S7ICE8iD3RpeTp
         2SNE5HnO8OgsIvvUf+yZjEsGIzitB0HPqMxibItcliAO9KBC2bKarriyTn5YD+oJ8equ
         hyVA==
X-Forwarded-Encrypted: i=1; AJvYcCVQzJ7AfoIxgnjfQN3PII7V+z0xtpTE/MswHzVcVCnIl3F7EocgnipS3gWRM2/Rgz+39jiwCoyn8VLgF/O0/Kto@lists.infradead.org
X-Gm-Message-State: AOJu0YzPsbbNqplq6mmOfGUVv1gvZab/tKl9dL9BQYgQfxxMgtr2ish7
	jvfQRmK85fgw96maPqN/JbkkqRTiVoHYcENlG6lQOtnU8Re3CofbeKCb6RXBkPdynK6EIrW8tPg
	eAnmR4K/39330ewRVJCiA4Jle1lmyRBzhJbGmvXWIsmgKm813id5zVagD7PeRmVdVF6f8VgfbOO
	FxnA==
X-Gm-Gg: ASbGnctWMSsc1HgzdIOi+xx5CtEl5W4p9yl36uXpUzisVoyeiw4AbD6Q2ZS+9MJMMYV
	+2A1quZGklIcJbY96pNzoRCn1TskbsvZmkD7BvEuY/0ya7+4/2yZJ4dswsfrksOzd/7SmcT1aLK
	Pk+5ZKIvk1WXxNbv4iMMfAlJSJjJyjCW7TeYLFPPGY2hrwPtXDWihqI42jH/fGrv742XPi5hGdi
	buinii74HRKUjVN4TKYSnnhtUa3OABwVez/vfgl0pQeo6W/0F+IrF4sCgHJtTYNdHGWCGmCi4t9
	ELH71g7cJfvViVA9R2Yx8aQz1jOY7U6ANVbQK7ZzURrCPlcEyeaahbrrk78Yx31tzxoEYHMY
X-Received: by 2002:a17:903:910:b0:240:3b9e:dd65 with SMTP id d9443c01a7336-290273eddc4mr57352945ad.38.1759942265852;
        Wed, 08 Oct 2025 09:51:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBnyYw2oUnSj0/vAnQp9qQPbGmtscQ9X7zMVjR7NAsTZxw3H0Mc84Q9Hd7PLjq/ibke+2cdQ==
X-Received: by 2002:a17:903:910:b0:240:3b9e:dd65 with SMTP id d9443c01a7336-290273eddc4mr57352535ad.38.1759942265189;
        Wed, 08 Oct 2025 09:51:05 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36b67sm2086715ad.90.2025.10.08.09.51.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Oct 2025 09:51:04 -0700 (PDT)
Date: Wed, 8 Oct 2025 22:20:58 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Leo Yan <leo.yan@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
        joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
        catalin.marinas@arm.com, will@kernel.org, alexandru.elisei@arm.com,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] KVM: arm64: Check cpu_has_spe() before initializing
 PMSCR_EL1 in VHE
Message-ID: <20251008165058.lcwiapdnar6hvw3b@hu-mojha-hyd.qualcomm.com>
References: <20251007182356.2813920-1-mukesh.ojha@oss.qualcomm.com>
 <aOVckTSJET5ORY1n@linux.dev>
 <861pndzn4w.wl-maz@kernel.org>
 <20251008124040.GC77665@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251008124040.GC77665@e132581.arm.com>
X-Proofpoint-GUID: RsyCP3oYALqJ_KcwnWNyOMCG-2csLDPH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfX8Aqr8c5a1PAi
 bDOpY2Q208IwEWpC9EEtezBOKU8GWmdYYQvjVV11ZioYUtvrNC4yrNG8Y2q0qVO0+qBbE+d2kQP
 nGNMHcezEohm09MEAPQcCCJq6IAXWRXrk+9XMYclo2CJo+T2g0zvvsT2QM7trnFuA5i1wtd+VMV
 CcEu8WBMAAqapjA/iVpNSYkVtF+pIF27tUBIpx9TGgmjFBtPjhimUvMY+clakfO6bPlsQV2e7a+
 ereN+VfmM2giVJGk7a8oML7fEbaI5k2MMh0LrKjOJ78xJyfTwXEq6iGlhLixg4kH0bzV3MoWI97
 DPuN82zUAg2eFLlbxgKoY4pcAvo9R5TPtjoQ9UEvTmN+wLg1/M2Rq7zOr21oLy/KXWbnl0P+9+b
 ydHTQlZrGZyfUmN1Uqpi7LNvrchh6A==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e6967a cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=b45o4kL6AAAA:8 a=Rx5nSmygbvK2v2nqR1AA:9
 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=dhdsR-PFWuPJUldTnwXm:22
X-Proofpoint-ORIG-GUID: RsyCP3oYALqJ_KcwnWNyOMCG-2csLDPH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_095107_717605_D35C2BE7 
X-CRM114-Status: GOOD (  23.11  )
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

On Wed, Oct 08, 2025 at 01:40:40PM +0100, Leo Yan wrote:
> On Wed, Oct 08, 2025 at 11:46:55AM +0100, Marc Zyngier wrote:
> 
> [...]
> 
> > > > Lets guard the change with cpu_has_spe() check so that it only affects
> > > > the cpu which has SPE feature supported.
> > > 
> > > This could benefit from being spelled out a bit more. In both cases we
> > > check for the presence of FEAT_SPE, however I believe the issue you
> > > observe is EL3 hasn't delegated ownership of the Profiling Buffer to
> > > Non-secure nor does it reinject an UNDEF in response to the sysreg trap.
> > > 
> > > I agree that the change is correct but the rationale needs to be clear.
> > 
> > To me, this smells a lot more like some sort of papering over a
> > firmware bug. Why isn't SPE available the first place?
> 
> TF-a grants permission to non-secure world [1], only access from secure
> world or realm will trap to EL3.
> 
> So yes, it would be good to check if any issue in firmware.

We have our own implementation of EL3 and not using TF-A.

I believe, we should check in a similar way as we are doing for nVHE
case.

if (host_data_test_flag(HAS_SPE))
	write_sysreg_el1(0, SYS_PMSCR);

> 
> Thanks,
> Leo
> 
> [1] https://git.trustedfirmware.org/plugins/gitiles/TF-A/trusted-firmware-a.git/+/refs/heads/master/lib/extensions/spe/spe.c#52

-- 
-Mukesh Ojha

