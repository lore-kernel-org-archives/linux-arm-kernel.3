Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B23C3ABD3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 20:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TqIGxRNcE17sBdZAJDFnb01+U1SAEShOq+/byms6Ps=; b=AuRuLgf6OOqoVFp142Sy40eRb8
	A/wAzwb6t2KMNDSFs1eGiO03+YvaQM64X+67wIJtSHB481ji4xcj7AF1ygABNfk0DEmRGcSf9MxER
	HDAVZninDtJ8EbsBd8T8O4Rt0UXVpBkLF2j4Co5XWoEdbdF7w7Yrgiz1Q8N2GfM2H+EAiuZR5wB/o
	9+KX3AmDp1tCoPyhoirr8PfxqDWWeLRawXVZ6jjIkhsemjB/yhh6aKRJkzFu4bZ1Ctnf7PdYrb5q0
	y0qkwywuL9raerVRdwyYxzyhlRG1VIhsSSlvYTbK1Q09iqLJ26ZQGgcj6GBr5jKjQVNePrlPtqAgJ
	l4eSI2xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDUJh-00000004oZS-3mY6;
	Fri, 09 May 2025 20:27:34 +0000
Received: from mx0a-00823401.pphosted.com ([148.163.148.104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDS4r-00000004WA0-2UVe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 18:04:07 +0000
Received: from pps.filterd (m0355087.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5498qK61031439;
	Fri, 9 May 2025 18:03:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM202306; bh=8TqIGxRNcE17sBdZAJDFnb0
	1+U1SAEShOq+/byms6Ps=; b=Ujty/sTBUEug2fI3PuqWzJFvut+cRB5KIczHX9O
	3PGajOVOIsW/0p5ce9qncsbK9TfUbw0N9lw27SR0N0FsGMLnHjSjOSKCDXx4cuxt
	bv6G7/OtdgfhpykPRtXYNlbwydtYltNMKvvWLsPjYWy8CN9eF8fgcgZP70xdHfvf
	mhpX1KyUaV5Rbd+vC2kb8dzJg/qsF7JcIdp8kMV78pmPRhgN9hq5iRyw+I+63R4K
	hcEXkH5EtnoedTQyaYq9LNoIS7gWbubrYDfH/xaLjgOcimJLnK0TiQig7ToNlGTz
	jDD+ObWgb83Nv32gKpFpuaOwCxnwX5ZMBPRqjaAUwWUlx3A==
Received: from va32lpfpp02.lenovo.com ([104.232.228.22])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 46gn1y5ax0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 May 2025 18:03:39 +0000 (GMT)
Received: from va32lmmrp01.lenovo.com (unknown [10.62.177.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by va32lpfpp02.lenovo.com (Postfix) with ESMTPS id 4ZvH1Q46Bmzxd6r9;
	Fri,  9 May 2025 18:03:38 +0000 (UTC)
Received: from ilclasset02 (ilclasset02.mot.com [100.64.11.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by va32lmmrp01.lenovo.com (Postfix) with ESMTPSA id 4ZvH1Q1zp1z2VZ18;
	Fri,  9 May 2025 18:03:38 +0000 (UTC)
Date: Fri, 9 May 2025 13:03:36 -0500
From: Maxwell Bland <mbland@motorola.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: bpf@vger.kernel.org, Puranjay Mohan <puranjay@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Sami Tolvanen <samitolvanen@google.com>
Subject: Re: [PATCH bpf-next v9 0/2] Support kCFI + BPF on arm64
Message-ID: <bxmdpg6frmhdw23ktemguglrdwweyibn2vuauc7gs7txt5jvkv@47en4a643bb3>
References: <20250505223437.3722164-4-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250505223437.3722164-4-samitolvanen@google.com>
X-Proofpoint-GUID: 1xkmKuqKs1BUOucwNZPrkA4H-1kBsQRa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA5MDE4MCBTYWx0ZWRfXwKeEPUGvNJ4j
 z8vD2PD/auKSZS/8nudNn8hS66ir8bE9q5lDa80VfAH4uv4jovG61yxcMf60KjrG501r263Ota5
 TGDAd2WX0n1UdQab9hwHprOCGa1DdIJQKJLzyBSXwhnPmWnQ2g4su6QaG08npfYd8VpD6XZYzeV
 7ojjM4vxgWgFj0vL+NDzbPi61+RIpFMxlgXukkZH6+wZw3VZ1Y6FeLjODOzK7fLtRPCI8VRLi7Y
 qUNRIlJQe1q4iQzQgBGUU/WWb8iwMwowXCWqucq7l0bAR8kIatWPH5dxq7uhOJnMlS+LV6XyVsa
 I7IKBS6Qm4xRHCvN7FJr3A4dO+hHbcOLz0DpD0DOGeK3k4/GAu5q7+L5jQKDVHPm2zfY/iiCjlC
 opfSrxrqPsTAqgETd0KsVYUc8+bqSDpwjEJ/h4My3/9+0B97O38dkbuyf/HL4sT52S3Nm1/Q
X-Proofpoint-ORIG-GUID: 1xkmKuqKs1BUOucwNZPrkA4H-1kBsQRa
X-Authority-Analysis: v=2.4 cv=EMoG00ZC c=1 sm=1 tr=0 ts=681e437b cx=c_pps
 a=7qI18unSaIz3cJfMvNS4Ww==:117 a=7qI18unSaIz3cJfMvNS4Ww==:17
 a=kj9zAlcOel0A:10 a=dt9VzEwgFbYA:10 a=Id0hMdnY8LVrUxL_22cA:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-09_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 clxscore=1011 adultscore=0 mlxlogscore=950 suspectscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505090180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_110405_750227_2DA4B924 
X-CRM114-Status: GOOD (  15.78  )
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

On Mon, May 05, 2025 at 10:34:38PM +0000, Sami Tolvanen wrote:
> Hi folks,
> 
> These patches add KCFI types to arm64 BPF JIT output. Puranjay and
> Maxwell have been working on this for some time now, but I haven't
> seen any progress since June 2024, so I decided to pick up the latest
> version[1] posted by Maxwell and fix the few remaining issues I
> noticed. I confirmed that with these patches applied, I no longer see
> CFI failures when running BPF self-tests on arm64.

Bump! Thank you Sami for following up on this, hopefully the maintainers
will have time to take a look!

Regards,
Maxwell

