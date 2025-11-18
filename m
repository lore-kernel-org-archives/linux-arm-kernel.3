Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D62CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 07:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4QiRiDhSqT4fLCQcU+UjOzbWSkk4b4aDS7SspI0AxSc=; b=nW6t1jy/KM9qRKDA6x49gDNFkS
	LfmYNnz6hKRbMC4Z+DTuz7PdU7EmZH6az4kirewEnV8gafQrOe+GyXniQKsX5Oe4v+rlwA5azDNHc
	S91H0FiuVjdGCJKV81u+2bXlfYfnDX+esBEavW/fzl5hqQtUD7i7uOjEStVClheYzFHq6t8f02roO
	DRu1C2ycmwMJ8pnD6PPU9hX/ls1GGLshHEGa4z5SG5kj4v7v+lnEjCxYHncExrybNthW+3jiiAQoB
	NGzEXqxkGk7zCUsIQQyH3kYnr28N/Ewy82GB7jqk0tG2ZhQFJ9uekODrgWLiWrR/zctgwcllZLh86
	tRoWZmwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGHN-0000000HZuW-2dRg;
	Tue, 18 Nov 2025 07:37:33 +0000
Received: from fhigh-b5-smtp.messagingengine.com ([202.12.124.156])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLGHK-0000000HZu3-0LCY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 07:37:31 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0E00F7A014E;
	Tue, 18 Nov 2025 02:37:28 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Tue, 18 Nov 2025 02:37:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1763451447;
	 x=1763537847; bh=4QiRiDhSqT4fLCQcU+UjOzbWSkk4b4aDS7SspI0AxSc=; b=
	XSg4GWDYB9Qc+u3oG85yZVloU4ekvHAIszyIEGREWA9NJLV543yh51rMlIN4eeYr
	ODZP0w80+qPQqtXv1dJdictPjMMXsLpmtD7Hy013qaY5xK/k0Xb/ZBC7okEBGiy3
	IwQrltZZ5picL5oe6HmlLTYcMpXJ0VmxEmRkStkqiyxO4EM87KVKoWKmnp/Q/RGI
	JQTVa23WxrALPM7XcYxG+4f7ANtzULfG/Ps2O6Uz316F54reXtrUgUrt2InHdmV7
	yZg4x6QzXmrWT2xg3KE5+Hc1ZkdnejkoRnrls2dpV03iPkrpOwJujkH/ZGela2Q0
	sKL3xFxVy4U1r4xF05w1fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1763451447; x=
	1763537847; bh=4QiRiDhSqT4fLCQcU+UjOzbWSkk4b4aDS7SspI0AxSc=; b=w
	AOhs6fXp32kzvOJeVWTEwCUEZiDWRgq89k6AX6VszCxGkoAbunAAPK3Gx13K6Y9a
	oCvUBIS/0m8EApXiPVi4A+YhJLivudy7dKl2LYR9DMUIUjGY93KwRCjE8TxUzCOW
	7gL2VaTEmNLKU8pOdpjHUqT+dwcj3QUd2oT8S5tGSwlFR88MC9sVyvvuKcRn/dh1
	+ucX1OExpS0sJyay4r1G2emxGRuMR5pAM5UFEyFLP6b2Lzy8pxhaY9kU0Tcfl8na
	sxoAgthuSsij6jkOUU6fYUZg5TtSQh7O8pUstQwAWr/5PvdinoDOBmPcm36c17ED
	BzsadMqFNjxZDK7yt8zhw==
X-ME-Sender: <xms:NyIcafPkiVxBWIcFP8mNGDVcSmwiKdY3gZVUC0i1Nm1XaSxJOWVRKA>
    <xme:NyIcaUyh---jACwC8JUwEE3Z0E5RW-4aCSOl0XUhZEzSH_1rVZ49ZzUk-LYUeiduW
    2xDb5rNk8PVP60re3uEsnn03l8CJoZKFyqwEdXUyR0E9lx03KHs9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvvddtjeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtg
    hpthhtohepjhhovgihrdhgohhulhihsegrrhhmrdgtohhmpdhrtghpthhtohepshhuiihu
    khhirdhpohhulhhoshgvsegrrhhmrdgtohhmpdhrtghpthhtohephigrnhhghigttggttg
    gtsehgmhgrihhlrdgtohhmpdhrtghpthhtohepphhrihhmvgdriigvnhhgsehhihhsihhl
    ihgtohhnrdgtohhmpdhrtghpthhtohepfigrnhhgiihhohhuudeshhhishhilhhitghonh
    drtghomhdprhgtphhtthhopeiguhifvghiheeshhhurgifvghirdgtohhmpdhrtghpthht
    ohephihuiigvnhhghhhuiheshhhurgifvghirdgtohhmpdhrtghpthhtohepmhgriieskh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:NyIcafAE5K7piy_7UkKxsRmEjUfhifMC-QFmcZRL6tgiwTqew32kAA>
    <xmx:NyIcaSMGcA57DGzU4LL7i4SwQPEL7IqsTR6yaz4sTIYDBknLL2oCSg>
    <xmx:NyIcaefxZ0f0R3TYY_SP5CKdrtrOpjoLx7_7WJDQIWZxPFgDVk3fDw>
    <xmx:NyIcab58UbuA_BO8MqQFM9tEdVFDyLGqf_EuKblPqofMFrlM7_Fr-Q>
    <xmx:NyIcaVhjDqK7MTDlEnhSrpcM3onA7hiYDDY1g48yS6oDOIA3ZghxIPJH>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 09734700054; Tue, 18 Nov 2025 02:37:27 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: ALjut8WcExBk
Date: Tue, 18 Nov 2025 08:36:56 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhou Wang" <wangzhou1@hisilicon.com>, "Marc Zyngier" <maz@kernel.org>
Cc: "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Oliver Upton" <oliver.upton@linux.dev>,
 "Joey Gouly" <joey.gouly@arm.com>,
 "Suzuki K Poulose" <suzuki.poulose@arm.com>,
 "Zenghui Yu" <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, "Yicong Yang" <yangyccccc@gmail.com>,
 prime.zeng@hisilicon.com, xuwei5@huawei.com
Message-Id: <f641d3f2-dac9-4a9e-92a4-0805e6561418@app.fastmail.com>
In-Reply-To: <6d6fad8d-e4e4-b973-6431-34a37003d363@hisilicon.com>
References: <20251107072127.448953-1-wangzhou1@hisilicon.com>
 <20251107072127.448953-6-wangzhou1@hisilicon.com>
 <861pm4vn02.wl-maz@kernel.org>
 <b1407660-9b69-7e21-328a-0f969fffa554@hisilicon.com>
 <c72411f9-a77e-4a72-a401-5110b919a2df@app.fastmail.com>
 <1ed610f5-3f0b-614d-5e7f-2c643238bec3@hisilicon.com>
 <113db0fb-d879-49d7-a5f2-7755558f29dd@app.fastmail.com>
 <6d6fad8d-e4e4-b973-6431-34a37003d363@hisilicon.com>
Subject: Re: [PATCH v7 5/7] arm64: Add support for FEAT_{LS64, LS64_V}
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_233730_588518_8486CF14 
X-CRM114-Status: GOOD (  25.59  )
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

On Tue, Nov 18, 2025, at 03:31, Zhou Wang wrote:
> On 2025/11/14 17:37, Arnd Bergmann wrote:
>> On Fri, Nov 14, 2025, at 10:25, Zhou Wang wrote:
>>> On 2025/11/14 0:26, Arnd Bergmann wrote:
>>>>
>>>> Are you using a particular device, or are you trying to enable
>>>> the support in general? If you have a specific device you are
>>>> working on, does it use the PASID data or not?
>>>
>>> Many thanks for your careful explanation! I got the pointer here.
>>>
>>> We have a real device in our SoC, which supports LS64B/ST64B/ST64BV.
>>> For ST64BV, Our device just receives 64B data atomically, not interpret
>>> it with PASID data.
>> 
>> Ok, I see. So I assume this is either a kind of dedicated work queue
>> where the IOMMU PASID is set up in advance for the user MMIO area,
>
> Yeah, it is something like you mentioned above. MMIO area is binded with
> a work queue, a PASID is set up in advance for this work queue.

Ok, thanks for confirming.

>> or it is a device that does not do any DMA at all, correct?
>> 
>> In this case, would the device also work correctly with ST64BV0 if
>> the ACCDATA register is fixed to a value of zero and you can only
>> use the upper 480 bits? Would it also work if there is an
>> unpredictable value in ACCDATA that may match the PASID of another
>> device used by the same process?
>
> We do not support ST64BV0, so above case will not happen. I think ST64BV0
> will trigger a illegal instruction exception in our system.

At least this does make it easier because on your system you would
never run into a situation where you want to support both your
internal device with st64bv and another device with st64bv0.

The easiest setup I can think of that still supports your machine
would look something like:

- have the kernel choose between st64bv and st64bv0 at early boot,
  based on platform configuration, use st64bv0 by default if
  available in hardware and not disabled in EL3, EL2 or kernel
  command line.
- Change pasid handling in iommu_sva_bind_device() so drivers
  have to explicitly request one of the modes before establishing
  a pasid, refuse this on incompatible systems, update the
  three existing callers (idxd, amdxdna, uacce) accordingly.
- on systems with st64bv but no st64bv0, enable st64bv for
  all CPUs at boot time to avoid context switch overhead, but
  forbid mapping shared hardware workqueues into userspace.
- postpone full support for st64bv0 until we have a device that
  actually uses this and can be tested. I think most of it is
  already there in the iommu code, but the ACCDATA setup needs
  to be integrated into the switch_mm()/__switch_to() code
  and possibly a trap handler like on x86.

In the current architecture, both FEAT_LS64_V and
FEAT_LS64_ACCDATA are optional, so you can continue to
produce CPUs that have the former but not the latter, and
the logic above will keep that working. However this breaks
if you ever want to support FEAT_LS64_ACCDATA in a later
CPU but keep the existing driver working with st64bv.

       Arnd

