Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2678C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 22:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/cPLBpNaY7IG7s+uxYBLEgAEukvVZ/Jx8w1LcX6TNY=; b=4YpcmxGztwI9JzgFNb3OysR8h6
	TSxzyOOiwaEslY4k69vXtFh8DVcYQIUs+m8wRmAtvNiIdfQCj+d9WVzFD5zKGG5INgxd0GV12uj4p
	oY56KCnvPB4KMhpfNcS6XhmFXT9hJ72fVeMc6wH0drrQKMu3PYQLqsMcuFHs/VY6eFAbNhQrzb4Li
	AdN0gTvhWD1gSurkznxIgRvW5zvl6cssl0Kj/DRjnJUbCMxbV+N1ZI/86kzhGnmftiiaOjhr6aNra
	sRQaisbm79byg23NaKfpArlakrReCe/Vp04JpPSe+HwADVKxwYVebbd0OlchbQm/A36FtIDn3lztn
	7lD4sxKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4SZX-00000003kyG-2tpT;
	Mon, 14 Apr 2025 22:46:35 +0000
Received: from mx0b-00823401.pphosted.com ([148.163.152.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4SXi-00000003knj-2ehw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 22:44:43 +0000
Received: from pps.filterd (m0355090.ppops.net [127.0.0.1])
	by m0355090.ppops.net (8.18.1.2/8.18.1.2) with ESMTP id 53EFjn3t019360;
	Mon, 14 Apr 2025 22:43:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=DKIM202306; bh=D/cPLBpNaY7IG7s+uxYBLEg
	AEukvVZ/Jx8w1LcX6TNY=; b=37MtPe2+ewGYz44vyX13gc57Ay5RFeM2siTG2Oz
	F2Hvw0Gfjeq8J3ufftdGtpkdI0rRVDHcDtej8L25TtUqxX0WGd+1h+soQqpzWk7E
	4Uf8CJ7+3TLVYtdJM5JThfDxEj79+CDg7KYxkYfOVuomYq4LcKP8FZL736i7xfua
	AuyK2Zflm9vXippfTyTxJewid7eqwg2GT87POBS0S10Hyu+SSxacsTdNs2A16uBP
	IBvA4m3FP+3a3J/65oTwVN4OedwlI2CmPJhxGGNwRBe7TIZME4i1XDNFylbvZuiD
	cLivrO9O1RoPm7cP0k6XPx/sD20tu2TxTCldCy4wMcqbj0Q==
Received: from iadlppfpol2.lenovo.com ([104.232.228.81])
	by m0355090.ppops.net (PPS) with ESMTPS id 4603gukden-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 22:43:24 +0000 (GMT)
Received: from ilclmmrp02.lenovo.com (unknown [100.65.83.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by iadlppfpol2.lenovo.com (Postfix) with ESMTPS id 4Zc2Pb3CLkzYkjct;
	Mon, 14 Apr 2025 22:43:15 +0000 (UTC)
Received: from ilclasset02 (ilclasset02.mot.com [100.64.11.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by ilclmmrp02.lenovo.com (Postfix) with ESMTPSA id 4Zc2Pm0bBkz3p6l2;
	Mon, 14 Apr 2025 22:43:24 +0000 (UTC)
Date: Mon, 14 Apr 2025 17:43:20 -0500
From: Maxwell Bland <mbland@motorola.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
        Mark Brown <broonie@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
        Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Lutomirski <luto@kernel.org>, Marc Zyngier <maz@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Pierre Langlois <pierre.langlois@arm.com>,
        Quentin Perret <qperret@google.com>,
        "Mike Rapoport (IBM)" <rppt@kernel.org>,
        Ryan Roberts <ryan.roberts@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
        x86@kernel.org
Subject: Re: [RFC PATCH v3 00/15] pkeys-based page table hardening
Message-ID: <fv3ijx6vcha2hfn5m2py4h73ympmgbur6wruwoej5pbz2lhjfc@t5j7gfa5j674>
References: <20250203101839.1223008-1-kevin.brodsky@arm.com>
 <a32cjyekuecoowzbitc2xykilvpu6l3jjtityp7x5hw7xbiysp@5l2lptwmqiug>
 <802963a0-32bd-49e8-82b1-34443acdd5ae@arm.com>
 <epnxrdkidbrjyjzapms7dfsvjcc7ewewjue7khbuxhresy5x5n@hyhokacdi2yg>
 <bcaa98c0-4218-470d-981d-9ab0894d3b1b@arm.com>
 <rzmxyxnufxrti7nxw3i25dil4bcqjzwqty4alwikm7bgbpjbju@dx5leafgss5l>
 <107650bf-a8c1-4a71-a302-2e80abd5d062@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <107650bf-a8c1-4a71-a302-2e80abd5d062@arm.com>
X-Proofpoint-ORIG-GUID: u5D-UadS7v89dy-zw2UEWuH7V_j9ffAh
X-Proofpoint-GUID: u5D-UadS7v89dy-zw2UEWuH7V_j9ffAh
X-Authority-Analysis: v=2.4 cv=EvPSrTcA c=1 sm=1 tr=0 ts=67fd8f8c cx=c_pps a=Bzw+04pMMuzJwu0RtP1G/Q==:117 a=Bzw+04pMMuzJwu0RtP1G/Q==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=Pj3cbH4x630mQXpL76YA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_08,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 adultscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140163
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_154442_848320_720FD32A 
X-CRM114-Status: GOOD (  21.73  )
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

On Fri, Apr 04, 2025 at 09:57:02AM +0200, Kevin Brodsky wrote:
> On 28/03/2025 17:15, Maxwell Bland wrote:
> Overall this seems worth investigating. I wonder, have you considered
> how accessors would find the shadow memory? It could of course be linked
> directly from task_struct, but then nothing prevents that pointer from
> being corrupted. I can't think of another cheap way to link $p$ though.
> This is not a full-blown shadow memory approach, so I'm not sure we can
> reserve a whole chunk of the address space for that purpose.

Hi, apologies for the delay again, I had much fire to put out last week.

I saw you posted a V4 for this, so I'll close out this chain.

W.r.t. the above, it may be possible to segment the RB tree in vmalloc.c
and designate an allocation region for this purpose. I did something
similar to enforce PXNTable-across-vmalloc a year or so ago which ended
up successful on a production device.

I plan to experiment a bit with different approaches and will probably
send the code to the mailing list once/if I get something together (also
if it isn't pre-empted by someone smarter and faster doing something
better).  (-:

> Indeed. For experimenting a Coccinelle script to convert direct access
> to certain members to a function call is probably easier :)

This does keep it in-kernel, which is nice, and I will keep this in mind
as I write.

Thank you for the discussion and patch, as well as the newest one!

- Maxwell Bland

