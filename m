Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43158E73141
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 08:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gsrm17c8fPEfOLtJcs7cB1KMkBd+mtB4o/EnIcCBhE4=; b=0Uvey2eLmLAqz9EZja+eXd/uvJ
	29PR7LFfzDA8vA9Ck5dBCq1NHtWhylG/wtKHPAWEfBuyCAq29s74KpqN3y41P+/VhW0mn05Z+OBx4
	4AWB9A7Wf/KFnJOA4KKN5jYdyYMzFva4l2Wr1sd0WbrxMInEhFnP4VGvu4gOm8ofh+YVCsSGFZOg7
	PctZRQErLYR6RdxkM/Cjn612N9IB5JC4qOtykQGRudFPOx92JgW7nru4nIfw/V86Tey34ARXlGv/1
	0Ll0SP/FXS4iukL/8EHutY9cnm5tLJhDvIR+Xw4t1weYAbQGscO8gGeRcJm4uk3gyHaOzbWaFkoH8
	WNl1lKow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmp2F-00000004dIy-29B8;
	Mon, 02 Feb 2026 08:11:51 +0000
Received: from fout-b4-smtp.messagingengine.com ([202.12.124.147])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmp2D-00000004dIO-2nwj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 08:11:50 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 8F8771D00068;
	Mon,  2 Feb 2026 03:11:47 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Mon, 02 Feb 2026 03:11:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770019907;
	 x=1770106307; bh=Gsrm17c8fPEfOLtJcs7cB1KMkBd+mtB4o/EnIcCBhE4=; b=
	HpDEbFSsQKFqv4e6EfskisNSlsEctkJhAlc4ZCRUh4/gLtrEbh3280hs4t0+ObyU
	YGMK47WQ1j3GjoIUKJ1YwhmkA7pT1TD0W/t7pMUS5BSHY/I/UHXALeXPhdMrIfPx
	SWfCF9Ih+IZbDQP3PJz3v4uOOYl17HB0PQF+GQk5SHx3JS9z6al1DbIlAbfOW60Q
	qSfmb5bmNnY7okTYBWHo0GeZchhBJ2k8pTDOGRG7Ce3UFJvZlI2wenfbMGgvM/mq
	kTD4TOW8BKP3b0JuhJXLbvJ58CX+2nmVCrekP9syeXRifcYp4Ue1BI3OGTPbuez6
	ngrsYRg5So1XWl5fZnp0nQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770019907; x=
	1770106307; bh=Gsrm17c8fPEfOLtJcs7cB1KMkBd+mtB4o/EnIcCBhE4=; b=q
	gM8njLhk+eSW0ciRg/a9v8SLgn8KJ1gvKr+094EeNHiXZYgzU/241BFpIRYafCHW
	sZ8lwyOkgq/X3zZk7xSoXtJvZwZIwZ1vsCcookgwAS5GWnbk2PTgVGPi/9EhzJtC
	h2k49shexjNBv2pfef3W21GUxTREmQZc2TUb+hG54gzsWxBGTRJAFuLIPeusyslN
	LIN/hUwId7JeFNYt3JGoXesDiM/Jqu0FMOtGuNSc1JlgE04mtOI45pvZZsyzq7en
	eNTMm2avo0dI6QgmmVnBnVUl7msKRtB6JfzmHTwuY4cs2jdcceSDsHznUXcaty9a
	yiuK1HLcajYnA6tgNSHUw==
X-ME-Sender: <xms:QlyAaTO9VaKm2YrwD8nxxnMET30y2vdMHg60P-Cj2a8KNhhjgkXSAA>
    <xme:QlyAaYw0EKfSNErjVBiA0nfNIjy-0qrxxbSQma26Y0j93XOGb3vLwjgyxzZ7Oza0u
    UInCcK0JojbJSbvJX5HMFwilTI3q4R_pheXnmz_2PGckcwhA6vuLqc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeejudefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepfeekleevtdfgueeggfdvveevueekveffgfekkefhudektdekjefhveevffffffei
    necuffhomhgrihhnpehprhhotgdrshgsnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthht
    ohepudegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrg
    hrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepuggvvhdrjhgrihhnsegrrhhmrdgt
    ohhmpdhrtghpthhtoheprhihrghnrdhrohgsvghrthhssegrrhhmrdgtohhmpdhrtghpth
    htoheptghlsehgvghnthifohdrohhrghdprhgtphhtthhopegrrhgusgeskhgvrhhnvghl
    rdhorhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    hlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtphhtthhopegrkhhpmheslhhinhhu
    gidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkh
    gvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:QlyAaT9RoYXbVz9I__xu4oC7T1NZNOJu7TuPnxFdoEHPzOCyXJLFrg>
    <xmx:QlyAaaFG9-O0obOBi98-WewrwkCNHaQ1euV90NLr0qtrAJQkIDSnFQ>
    <xmx:QlyAaXJY8KAThzkPWGLPje5TdjTwf7s3LhCf8j3GgUk6d_Lg2R76HA>
    <xmx:QlyAaak4S_YcV1Vef4dUzO-R-g4lWRNPQTrTaNTFcGR8ZwsWWOp5FQ>
    <xmx:Q1yAaUaLZy3OIWSZRR-gtlk8lQyClrfgJxvCDVRu9cq-3GB0gUPqbkpd>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4CC08700065; Mon,  2 Feb 2026 03:11:46 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ASnEhGskTYsw
Date: Mon, 02 Feb 2026 09:11:26 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ard Biesheuvel" <ardb@kernel.org>,
 "Yang Shi" <yang@os.amperecomputing.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Ryan Roberts" <ryan.roberts@arm.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "David Hildenbrand" <david@redhat.com>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Dev Jain" <dev.jain@arm.com>, scott@os.amperecomputing.com,
 "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Message-Id: <625eaac4-6972-4d4e-ac8d-52cc19e4fe33@app.fastmail.com>
In-Reply-To: <bf94fb74-d391-440c-a90e-1346312328c4@app.fastmail.com>
References: <20250917190323.3828347-1-yang@os.amperecomputing.com>
 <20250917190323.3828347-5-yang@os.amperecomputing.com>
 <fd18c462-60ce-4dc1-9877-2a1d162d5879@app.fastmail.com>
 <bf94fb74-d391-440c-a90e-1346312328c4@app.fastmail.com>
Subject: Re: [PATCH v8 4/5] arm64: mm: split linear mapping if BBML2 unsupported on
 secondary CPUs
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_001149_801683_7099F263 
X-CRM114-Status: GOOD (  17.04  )
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

On Mon, Feb 2, 2026, at 08:43, Ard Biesheuvel wrote:
> On Mon, 2 Feb 2026, at 08:18, Arnd Bergmann wrote:
>> On Wed, Sep 17, 2025, at 21:02, Yang Shi wrote:
>> --- a/arch/arm64/mm/proc.S
>> +++ b/arch/arm64/mm/proc.S
>> @@ -439,7 +439,7 @@ SYM_FUNC_END(idmap_kpti_install_ng_mappings)
>>  #endif
>> 
>>         .pushsection ".idmap.text", "a"
>> -SYM_TYPED_FUNC_START(wait_linear_map_split_to_ptes)
>> +SYM_FUNC_START(wait_linear_map_split_to_ptes)
>>         /* Must be same registers as in idmap_kpti_install_ng_mappings */
>>         swapper_ttb     .req    x3
>>         flag_ptr        .req    x4
>>
>
> This is not the right fix: the indirect call from 
> linear_map_split_to_ptes() will be instrumented, and so it requires the 
> CFI annotation to precede the function entry point, which is what 
> SYM_TYPED_FUNC_START() is supposed to emit.
>
> The typeid symbol is injected by the compiler into every object file 
> that takes the address of the function in question, and so the fact 
> that it is missing seems to suggest that linear_map_split_to_ptes() has 
> been optimized away entirely. Could you double check 
> arch/arm64/mm/mmu.o if that is the case?

Ah, thanks for the explanation. This has indeed been optimized out
by a patch in my randconfig tree that makes CONFIG_SMP optional
for arm64. Without SMP, the calling code path is never used because
smp_processor_id() is fixed to 0.

I'll fix up that other patch then.

     Arnd

