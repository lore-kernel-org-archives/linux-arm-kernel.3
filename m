Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A69D24444
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 17:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDkOUHSKrwDS98ex3XZsDtLzEb2vIwexnNSn7aSF6DQ=; b=p/VaqVke3TQI3WF9/YcC2eAnki
	jzOuocLQTczABY3Ss7/JlmMdTLc1Q7P3Zl9UvNpFasSbtM2QWcmXxWsWd3+pPU6mpdL6W4zXkNcak
	294JvA3xl3zs/c+wefC32jomU7dZzXsa6XTILYwovZTMUE/nppdLkBVNp6XOkmFJF2MyL+tlKdxBi
	h5NLL5uU2PBSZ2GgHMXl94PfQJZWIsOvf5e5N062cX4qs1lQLb4cOT5JWpG/H+bDg588+WcwlPSFn
	VfdrIgBkjhECszgmdLv/X+dcc2+t35M0zFjsu9GkyKWA9rNMedkrukraM7TOQsqAMrNX7KS4Q3AXK
	myCFrtog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCiW-00000008L7I-0sZN;
	Thu, 04 Dec 2025 17:02:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRCiT-00000008L6H-16hY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 17:02:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4C9wh0909535
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Dec 2025 17:02:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UDkOUHSKrwDS98ex3XZsDtLz
	Eb2vIwexnNSn7aSF6DQ=; b=cOi26Uf7y6ox+TgnLUo0DcJ6yxP5nM7uxmP/ajJK
	gthQDAiMoG0rhwsg5Yv04qWVKPuKgd4rE+4WRtEomIxue0frwtC9wecqB69aoCZ7
	BAu7WtGs22fEpeNCzil5/TOy6MUO4Pq3DqwxC+4Loleec7zaYPi4vR7pJXLfJssp
	0o7AwJPHBZAQD4MS/yT7TXy0cg/jwRZTHocNnLrpkZBccZ34TqB/fKRUbaUoW2yR
	pqKonlj1DF2qQblcZ0eItJcL9h/piit5LEfnSYweoYNKq4p2f3Av2C93i3fymNFb
	Qy0TGBS6NR/gwzRNNUBJpVpQ5EwRXZgcc77T9VRjB+38Yw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aua2erw83-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 17:02:04 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso1290271a91.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 09:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764867724; x=1765472524; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UDkOUHSKrwDS98ex3XZsDtLzEb2vIwexnNSn7aSF6DQ=;
        b=kwVrlv2yDFA5ahM7t9XuR7snpJ9RHG06WJtVDqVj3aChUYSllwKTJcEuM6NfA2DS2a
         KT2cexFVMmnQgGgHFsh3ZoHueMmHaEUe0d7RgRzYFAg8s/luK6La8of9jAUoObfwl53E
         4qcdCGr/c2lG4HsyQKgxBoS8aq/Iak662HR4x4wkuqeJw6QhjdMmwcIpYbF+qiWg4Bdq
         FKX1smTfyX2ZemkBwm0lYjmTHym7NuPe3G6cstEsBJzIhl15PE5d4WFsim8qA+0OB4S0
         oOIgJn/cnevk3DAtM0ODxCr6ACAscZvWPF6coEUaBV7O9x/d/Yf2DPXbVsy1wliArfoX
         QGdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764867724; x=1765472524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UDkOUHSKrwDS98ex3XZsDtLzEb2vIwexnNSn7aSF6DQ=;
        b=nkLXeNmQRywYHcaALsUt9T3J5op7s5Q7/EQHPz1WbRY/RQiHEVJp9CaGUpaMjxmysG
         gE9EbzynhoSmO3+yeNRLdk4vlwWU7+RXywjUMjgevqeiPv9oxnNshYEbNoa3sf5ol3Nj
         zz1S13AzW7YnVBFN9MP23NmM9d7Vq2y02tbup8lvzNzT3Ij6RwFJhJ51oZLIw0O0etyy
         4FDAOT4Z3FpNpNXYs634ZA47291y42MNOHvDhPlk7x8zicbyCWI4vDi5GujcAL9xY7cA
         9obnXjm+eXTPFDE0HS2a+9C7gweYefbJjaWfyC3g9KUOuQVsfMhR2ZxsTostmsdzXMrf
         y3iQ==
X-Forwarded-Encrypted: i=1; AJvYcCVn6/Th8v3SpMffA8ZxNC/E6fXB6ZeFV6Bw3UqZcSO0IU5CbgDB4KuiwxMPrdgvd55tJP6HgFNzHj4r1AH0a7SM@lists.infradead.org
X-Gm-Message-State: AOJu0YytVB0P2fIKmf4BFU0W9nTgyD2fzClf8wTVN4auGWS3qLTUDKIQ
	eLBwTr95LIkf5onX7gDFvcBh3p48KTDn8S9gORJztAZlnzNZj3aJszspW1LyZq9MWmSiIHrItDY
	yJ2T8SW2jKI89YP7OtHRcbNDEFr4yefi3CUjK8NmsZW6n5XWSkIpgkOBKZJ/Z0X+YmuiEyMnYSB
	0WoQ==
X-Gm-Gg: ASbGncscVh3ggpzHRKucpIstEHf9ZirpuMFifcqlOf/IRFD+hALNp5hILhCL7HgVkd4
	tfPJ6V+rGWa0j0zRCYQbXXdrUccuVzjwqLvGw9WrRTc7zcEC2EZ1cuOnbq7BbhXDXYuOiSNEO2L
	uUMxWWpldB16QHPJByjZy7zC0A8VMeMBRzZ1gyQD+ijcLsEZajXFnvxCM/6VbfES7N98fxqIYwq
	4H/oVfNcr6ot/vWjtoLWqWHlAxdvJCy7wTtXOX9+GDMzMsYjZHs5Qhv+cCBNrezbRX/En5O3qiU
	mm8FTrQ4BumQ8gFNAZzsKqRUnZcN5UjSL/ZuwxOXk02lsUSZgr3DT3PGxzTiFr5yiFuzpYSroYi
	mXqpDA27bqZP6dKN8RcYdzT11Xs0OuX+2OYQwutZyfYk=
X-Received: by 2002:a17:90b:2e46:b0:349:30b4:6365 with SMTP id 98e67ed59e1d1-34947f1afb6mr3714082a91.27.1764867723521;
        Thu, 04 Dec 2025 09:02:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGj25Sgl7PRn2htoTjoU/kKOMt66L4Ir+ascv5tI1/pZYPKRRpiCYmryN5Ou/eMvOZjrDl3PA==
X-Received: by 2002:a17:90b:2e46:b0:349:30b4:6365 with SMTP id 98e67ed59e1d1-34947f1afb6mr3714013a91.27.1764867722686;
        Thu, 04 Dec 2025 09:02:02 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34912d3a476sm2867949a91.6.2025.12.04.09.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 09:02:02 -0800 (PST)
Date: Thu, 4 Dec 2025 22:31:57 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: Alternative to arm64.nopauth cmdline for disabling Pointer
 Authentication
Message-ID: <ef2d04e5-4687-4d2f-83a7-6cf9a7990ade@quicinc.com>
References: <3fcf6614-ee83-4a06-9024-83573b2e642e@quicinc.com>
 <86ecpappzi.wl-maz@kernel.org>
 <adc22b19-7dcc-4c38-9319-d979f1e3886a@quicinc.com>
 <868qfipfij.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <868qfipfij.wl-maz@kernel.org>
X-Proofpoint-ORIG-GUID: MFRCj9sXbJ8k1e54QK5h_ow7-D2E0ULB
X-Authority-Analysis: v=2.4 cv=Rv/I7SmK c=1 sm=1 tr=0 ts=6931be8c cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-uWyUKA5Yu5Vf0UlR58A:9
 a=CjuIK1q_8ugA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: MFRCj9sXbJ8k1e54QK5h_ow7-D2E0ULB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEzOCBTYWx0ZWRfX8wCE3u4HHoZJ
 ntnuRwVhkMuAnxjzA24aKfVbLXKlBYhPMii91WGcTSVXoSQBHggCxYlbkndW7YfB4Hvow4kais8
 tvgQMImOWqM0duf8AW1C3pql0erwEtnmbl7phmxpB2fveoYikigmUVQvQcfKdRcxZdHKF7eIW5+
 bLdHcIoap3dJdxQjA2D/ULukfinmpzqAke3/2lMyg2IgHaqSbuvGZzw3UZpDO/zB0bWJZM29FZo
 E31OQlGoerVbJF+Hnq/92LlGQ6ZLaZ1oKfzp8zDVdDqG/WiI+N29gnKcGrhkFUc6PC+7hqjHSZs
 MXz12YJvqYcKxqYRYDI25EtW2FI5I5hChklez7kEFkIyJzJ6rq5PS8Ere6Uh6NeXdH/Nzr/tcPr
 l8CjqnUdIZmUjuCdAyJYUxAV9pv2nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_090205_328414_F99BD055 
X-CRM114-Status: GOOD (  61.79  )
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

On Thu, Dec 04, 2025 at 01:01:40PM +0000, Marc Zyngier wrote:
> [dropping Ricardo, as his address bounces]
> 
> On Thu, 04 Dec 2025 10:36:12 +0000,
> Pavan Kondeti <pavan.kondeti@oss.qualcomm.com> wrote:
> > 
> > Hi Marc,
> > 
> > On Thu, Dec 04, 2025 at 09:15:29AM +0000, Marc Zyngier wrote:
> > > On Thu, 04 Dec 2025 04:07:15 +0000,
> > > Pavan Kondeti <pavan.kondeti@oss.qualcomm.com> wrote:
> > > > 
> > > > Hi
> > > > 
> > > > The pointer authentication feature (PAuth) is only supported on
> > > > 0-3 CPUs but it is not supported on 4-7 CPUS on QCS8300.
> > > 
> > > On what grounds? Hardware incompatibility? I seriously doubt it, since
> > > nobody glues pre-8.3 CPUs to anything more modern. Or, as I expect it,
> > > a firmware implemented with little understanding of what is required?
> > 
> > I don't know the answer to this question. I will talk to folks who may
> > know answer to this question and get back.
> > 
> > Can you please elaborate on the firmware part you are talking here? I
> > see that Linux runs at EL2 and AA64ISAR1 register values on CPU#0 (A78)
> > indicates that PAuth is supported but not for CPU#4 (A55). I am told, there
> > are no other controls outside EL2 (trap) to manipulate this feature. So,
> > I am assuming that this is indeed reflecting the HW.
> 
> Neither A78 nor A55 have PAuth. They are both firmly ARMv8.2 CPUs, and
> predate this functionality. So I guess that there are only two possible
> outcomes:
> 
> - either the FW is indeed not at fault, but that you have a *third*
>   type of CPU that is at least 8.3 in the mix
> 
> - or that you misidentified the CPUs that are on your system, they
>   have PAuth, and the firmware is borked
> 
> Which one is it?
> 

As Mark pointed out and MIDR indicates, it is A78C. sorry for the
confusion.

> > 
> > > 
> > > > The ARM64 cpufeature discovery code expects late CPUs to have
> > > > this feature if boot CPU feature has it since PAuth is enabled
> > > > early. When a conflict like this is detected, the late CPUs are
> > > > not allowed to boot. It is expected that system will continue
> > > > to be functional with CPUs with Pauth feature supported and enabled.
> > > > This is not a desired behavior in production.
> > > 
> > > What is even less desirable is to produce this sort of contraption.
> > > 
> > > > We started seeing this problem when Linux is booted in EL2. When Linux
> > > > is running under Gunyah (Type-1 hypervisor), Pointer Authentication
> > > > feature is hidden from EL1 via HCR_EL2.TID3. 
> > > > 
> > > > arm64.nopauth can be passed on kernel cmdline to disable the feature
> > > > in kernel so that all all CPUs can boot on QCS8300. I am told 
> > > > maintaining a custom kernel commandline per SoC in a Generic OS 
> > > > distribution is not recommended and asked to discuss the problem with
> > > > the comunity [1]
> > > 
> > > Well, you get to own the problem you have created for yourself. You
> > > build hardware/firmware that cannot run generic SW, and yet you want
> > > generic SW to run seamlessly on it. Spot the issue?
> > > 
> > > > This patch [2] from Catalin adds a devicetree property under memory {}
> > > > to disable MTE. I believe this work predates the id-reg override
> > > > mechanism. However, this made me think if workarounds like this can be
> > > > detected via devicetree, for example a property under cpu { } node.
> > > 
> > > Not only it predates it, but it also doesn't work in general. For a
> > > start, it is DT specific. How are you going to make that work for
> > > ACPI? I know you don't care, but I do.
> > 
> > Point taken. I understand that this does not fall under errata but is
> > there a possiblity to introduce an Errata targeting CPU#0 MIDR and
> > disabling the Pointer authentication? I understand that if there is
> > another Qualcomm SoC that exists with all CPUs supporting pointer
> > authentication with same MIDR, we may be disabling the feature but this
> > is something I can check internally.
> > 
> > > 
> > > > Given that what we put in `chosen { bootargs="" }` kernel under
> > > > respective SoC devicetree can be overridden by bootloader, should we
> > > > have a **sticky** cmdline to specify critical workarounds like this?
> > > > This would be more generic than introducing any new parameters.
> > > 
> > > You already have a way to have a sticky command-line, by building it
> > > into the kernel. Yes, I understand that this isn't what you want, but:
> > > 
> > > (1) a user should be allowed to pass the kernel command-line *they*
> > >     want, not what someone has decided for them
> > 
> > Agreed. This is what made me to ask the question. Should kernel have a
> > sticky command line which may have critical workarounds like this?
> 
> Absolutely *not*. You are not in charge of defining what is good for
> the user. If the user themselves want that, they have plenty of ways
> to achieve that particular goal already. Put it in the bootargs
> string, in the kernel build, in a grub config file, as a u-boot
> hack... There is an infinite number of choices already, and we don't
> need an extra one to hide how ugly their HW is.
> 
> > > (2) the generic mechanism exists, doesn't rely on additional firmware
> > >     specifications, and is used for a whole lot of other QC platforms
> > >     suffering from the same issue of broken firmware.  What are you
> > >     going to do for these?
> > 
> > The generic mechanism, you mean bootloader passing the kernel cmdline
> > with `arm64.nopauth`? or something else.
> 
> Exactly that. This is the mechanism by which we instruct the kernel
> not to use a particular feature if it can avoid it. It is easy to add,
> doesn't depend on new esoteric firmware interfaces, and is a constant
> reminder that you are dealing with stuff that isn't fit for purpose.
> 

Got it. 

Thanks,
Pavan

