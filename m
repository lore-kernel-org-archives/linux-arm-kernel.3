Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D06D1F9AE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Dec 2025 10:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBx8fuoiAYJMR5sq4+aOTUoJ0r3bpXD6Lyf4Yfe38PY=; b=ANvGupSRCjI3I2gTZP7xr9J3z4
	ZAh2ixMcyKm95Zq+1nM9QWtNN86c0FhYEzgtAYkOjsyrjinNxTSjAcX+Xbq11hLEi1r9WBXqeHGu6
	0e5AG885pgDDdkBJZVjamWZ+m6fKnlBENKXOr8Qkvy3aq9E31TafIzoHhw1Jdw7ByIsE5wbTRCNN6
	iwk6R2vnYH3xm5hOB8mNTgWfc040gqiwZUudy3F1RrmrqmU3OCo0CFZEtcAnz3Zmr8PwQkhATQgP3
	eAqkWWQIjSai2365OCynIJLs9a0WlVuODudqpCUD3HxlYMxM2jenzqYF/xuRn9s83zMYFGXOwGHPb
	nRm5FHaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6hC-00000007qf6-3g1q;
	Thu, 04 Dec 2025 10:36:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vR6hA-00000007qej-2hzT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Dec 2025 10:36:22 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AExVY1275778
	for <linux-arm-kernel@lists.infradead.org>; Thu, 4 Dec 2025 10:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oBx8fuoiAYJMR5sq4+aOTUoJ
	0r3bpXD6Lyf4Yfe38PY=; b=aLfgUTrZ62R/awyYhBboRPzhcx/EZFiSk3a/0e0C
	zLGZSWYCsPmUIaRVpvnNd/+EG1Mmm0xf8fSvi/cLOTEJon4Z/yu7Kv0WoaEwojOu
	r7YDTHujgsYM9fE7v/umddMG73oH6b5/mBI2SE6+LhKxqf8SO8q+A6n4PfsW9DXY
	1N71ITkH66t8s7NY5/HtXAQuz+60mpjqkCqy5REelNIqTNno+G64d5pb2utP/cbA
	zvk6/CYSq0GVGxqIsdXcBXCwnObyN8QoRPcKBpvc328eTQV1t0kwu9L8tB+xPtET
	VTJzR2uIPNS4Sk4sQ7qv+yj7+JRkWqWWxp+SgwJ94QWHjQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au6uvrf8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 10:36:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-342701608e2so825566a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Dec 2025 02:36:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764844578; x=1765449378; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oBx8fuoiAYJMR5sq4+aOTUoJ0r3bpXD6Lyf4Yfe38PY=;
        b=hpXWr4jyS07hmWrTLnUoJoZ14ktISrudu6Se5wKXZPioyCRBOEAyF+LjxHq5Ux2w1T
         GdDIWiO1YCSWN/Nz8jHlxNETP4cCvr4D/e5quu8T/40iiaSXyFxHJqDOzWul7RUPNJcE
         hlOtFLMXWpmbbcaPMHLvUzeJzOpwOW9GCr81GC5n7FehOm1uacbZ8if8mQnMb9/QXDu9
         XkhsGVAWmOJaFeblIMLLj8BYroB2sp2hdGp9yFODojF7n56CA7CQA4W0OJ2ZwcIYGro7
         APEUAshGryAv+7EacnYcuficWKn+z6Ag29vWdxJyNyAEbXTukp8P24uoX1kAnphHTpdj
         V4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764844578; x=1765449378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oBx8fuoiAYJMR5sq4+aOTUoJ0r3bpXD6Lyf4Yfe38PY=;
        b=PQUVjn3mEtcQtLP6HDsRtTxIzSgxWF7WiI7X7AjYfaFWXW/n3QTphE+0+9qTZMDzaZ
         xqkd5sQbjON61TP1JoIHH1dRBmRU33w7n2rXpRQCd7dViSdCYx8VNBvgWp9oXCqPg3pT
         4p6YmnubVAbKL4fgwOD9looF0KxxNmqnjaRcjAlCb3zlW6wmY3REuSTi0ACLTChakn/v
         LoPnDsG8XOeSXF5kBKtkc27lIraJtrrfunluo9NbLsaO0HmG/wp5RZVVlVPU3FcdoHvP
         S7VAnt6KwNpMIZGnRU5AbRTWeuUnvsapuu8izuG2UD5yJ1oia3CFzBYKEVc6Sjr3+xz1
         1SZA==
X-Forwarded-Encrypted: i=1; AJvYcCULaBdWdUNobjFMgk3Bj4FG70lGeRR3F13BmMt2s8ghodhzjbqbS9Km9jvBnIc37kp1hssK13mvUsX+fsQ1Tzm/@lists.infradead.org
X-Gm-Message-State: AOJu0YwNcgmIFDty2VqYDJbYDSM+IOq+EgkjzBs47iB9jwGgVFWPQpgL
	llzHtCDyEtdkTs4CdU78HCPF0pcayrjp4dBYzZwfLqI2jPavhYDKdzvExAtds0BemGmouGpQ2gA
	06vb3wsGI6KXPzMr9WUSpj5y2JtmMyDu765aYENdSwdF+g1W6+i40fGj38UWWItIHDSbl4I9SUG
	GKNGIM0y1zJw==
X-Gm-Gg: ASbGncsy+i+5VeVN4w+PFOZVtCTzTUlHvMPgC2VojiUGpAD96qZ02N+MkB7eVm4x5qv
	/QRqsNfaSdeBg0ABenQs3jg4CEeRp2jZHZJJQlRylpTodFBPOhBv6WM7tTzTXcEt2fSSrTygm6Q
	ivcWMfUNWrX8kGyI/RcYvKBbtYnKgZd3AHXHTiu7XTiN3DXVRrX7qLewfwMf44ECGM/nyxfn/dd
	hcCmbb/wIA+5t5unPKYrpJSyVYnodpk0tucTJOxpcV2CsTTJQPh4nITcUXxIT2/92k78qGXpuGh
	wK5dHFdxdX0i9mTeOrO5vDZoSjGONJ1TWnjVWwNCgfaL823RVw3iF3JSe7J4RapHzVrMks5LpBK
	84094MoebKS2m7r09bED75AfOcIIBRYa20aK4rfdD4nQ=
X-Received: by 2002:a17:90b:4a01:b0:32e:e18a:3691 with SMTP id 98e67ed59e1d1-34947f36d65mr2313959a91.35.1764844578262;
        Thu, 04 Dec 2025 02:36:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGL/yxp7XI1jdUvDb/hzCVAzovNCH+yUsfptI3a7mjQGZteEMWB6AcZfVAJ9K0+M9khaFoOBA==
X-Received: by 2002:a17:90b:4a01:b0:32e:e18a:3691 with SMTP id 98e67ed59e1d1-34947f36d65mr2313931a91.35.1764844577741;
        Thu, 04 Dec 2025 02:36:17 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34912897600sm2451156a91.0.2025.12.04.02.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 02:36:17 -0800 (PST)
Date: Thu, 4 Dec 2025 16:06:12 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        rsalveti@oss.qualcomm.com
Subject: Re: Alternative to arm64.nopauth cmdline for disabling Pointer
 Authentication
Message-ID: <adc22b19-7dcc-4c38-9319-d979f1e3886a@quicinc.com>
References: <3fcf6614-ee83-4a06-9024-83573b2e642e@quicinc.com>
 <86ecpappzi.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86ecpappzi.wl-maz@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDA4NiBTYWx0ZWRfX1rlC+NrrXSRN
 7lt+Mu0+wVWnSZe3/sJqT+xEmYw/c/426uGgmUJ1bXY+N0+LP7O7Lg5LO89Jz4+k2unF5wRASVv
 3oHqdD9IU8kSpb9wC85G/P3+AVPU/63PuHSHpUohPHXUqdA80FqgX21m0hnLIxDOmhRKP3DMskH
 gPEO5uQugeGQpOp1Zf8WEQihfll+Xhz6qW7zlqeyHyQ6o0BeEtEq1NMkRHo1wYcE9MMj9okWZ0v
 Fbd8D02C2I9zevP+fXedva4kBET4A6MT7MPMJfR75jYcmrdcFExOi0u7hfg2QdvH0CcnTs/yX9H
 wV6HEOzLU0hIJD+zq7idhTbxVgPAkAn8pfJy4iqWkCLg4w4ZpwmDCb11uy6EcFIeTGxUxb+O3l8
 PBQME+wnwf8YngInZWqNwislUiMtkg==
X-Authority-Analysis: v=2.4 cv=d7n4CBjE c=1 sm=1 tr=0 ts=69316423 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hN0DXoGWr_mGFEF8OEoA:9
 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: WV0GurhLANv8Eu7IU9bKxgrr4JFbcSh7
X-Proofpoint-GUID: WV0GurhLANv8Eu7IU9bKxgrr4JFbcSh7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_02,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040086
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_023620_828853_B058D4F5 
X-CRM114-Status: GOOD (  48.12  )
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

Hi Marc,

On Thu, Dec 04, 2025 at 09:15:29AM +0000, Marc Zyngier wrote:
> On Thu, 04 Dec 2025 04:07:15 +0000,
> Pavan Kondeti <pavan.kondeti@oss.qualcomm.com> wrote:
> > 
> > Hi
> > 
> > The pointer authentication feature (PAuth) is only supported on
> > 0-3 CPUs but it is not supported on 4-7 CPUS on QCS8300.
> 
> On what grounds? Hardware incompatibility? I seriously doubt it, since
> nobody glues pre-8.3 CPUs to anything more modern. Or, as I expect it,
> a firmware implemented with little understanding of what is required?

I don't know the answer to this question. I will talk to folks who may
know answer to this question and get back.

Can you please elaborate on the firmware part you are talking here? I
see that Linux runs at EL2 and AA64ISAR1 register values on CPU#0 (A78)
indicates that PAuth is supported but not for CPU#4 (A55). I am told, there
are no other controls outside EL2 (trap) to manipulate this feature. So,
I am assuming that this is indeed reflecting the HW.

> 
> > The ARM64 cpufeature discovery code expects late CPUs to have
> > this feature if boot CPU feature has it since PAuth is enabled
> > early. When a conflict like this is detected, the late CPUs are
> > not allowed to boot. It is expected that system will continue
> > to be functional with CPUs with Pauth feature supported and enabled.
> > This is not a desired behavior in production.
> 
> What is even less desirable is to produce this sort of contraption.
> 
> > We started seeing this problem when Linux is booted in EL2. When Linux
> > is running under Gunyah (Type-1 hypervisor), Pointer Authentication
> > feature is hidden from EL1 via HCR_EL2.TID3. 
> > 
> > arm64.nopauth can be passed on kernel cmdline to disable the feature
> > in kernel so that all all CPUs can boot on QCS8300. I am told 
> > maintaining a custom kernel commandline per SoC in a Generic OS 
> > distribution is not recommended and asked to discuss the problem with
> > the comunity [1]
> 
> Well, you get to own the problem you have created for yourself. You
> build hardware/firmware that cannot run generic SW, and yet you want
> generic SW to run seamlessly on it. Spot the issue?
> 
> > This patch [2] from Catalin adds a devicetree property under memory {}
> > to disable MTE. I believe this work predates the id-reg override
> > mechanism. However, this made me think if workarounds like this can be
> > detected via devicetree, for example a property under cpu { } node.
> 
> Not only it predates it, but it also doesn't work in general. For a
> start, it is DT specific. How are you going to make that work for
> ACPI? I know you don't care, but I do.

Point taken. I understand that this does not fall under errata but is
there a possiblity to introduce an Errata targeting CPU#0 MIDR and
disabling the Pointer authentication? I understand that if there is
another Qualcomm SoC that exists with all CPUs supporting pointer
authentication with same MIDR, we may be disabling the feature but this
is something I can check internally.

> 
> > Given that what we put in `chosen { bootargs="" }` kernel under
> > respective SoC devicetree can be overridden by bootloader, should we
> > have a **sticky** cmdline to specify critical workarounds like this?
> > This would be more generic than introducing any new parameters.
> 
> You already have a way to have a sticky command-line, by building it
> into the kernel. Yes, I understand that this isn't what you want, but:
> 
> (1) a user should be allowed to pass the kernel command-line *they*
>     want, not what someone has decided for them

Agreed. This is what made me to ask the question. Should kernel have a
sticky command line which may have critical workarounds like this?

> 
> (2) the generic mechanism exists, doesn't rely on additional firmware
>     specifications, and is used for a whole lot of other QC platforms
>     suffering from the same issue of broken firmware.  What are you
>     going to do for these?

The generic mechanism, you mean bootloader passing the kernel cmdline
with `arm64.nopauth`? or something else.

> 
> (3) what if you, by miracle, happened to *fix* the firmware?

As I have asked above, the firmware part is not clear. 

Thanks Marc for your time and guidance.

Thanks,
Pavan

