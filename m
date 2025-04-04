Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5B7FC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 04:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XqYBy4gvdoVQ6qB+lepjnAo86Zkd1rhVn6wJVz03arE=; b=xzeylXVDU3fyVUq6pbYGuVVwp4
	cbg3o/ITgU9izlm0G6g6Um1jmZd30zi2CYzFiuaqYCAmUIKu5wB6I8XHJpIES36zF6OqDn65NpMCO
	4yov2AsvQDkf90G6twDthfKA538FKuCEyvN6GD47S8bCMftUHUB9hpowEFPaqSksuIkNWQ0sCoG/c
	ZSOiSD43QCF9CqP2Xs5ouKpvge09pIQUteF0GUFbryl16+rx2QB0sTghnp4j9JEtGqg/rV3/NRySi
	LkFv3ysY85EkwllgPqcCeMoPRZPJn8BzV03PGrwaEO1Wujcj7gmm1/Sd1uwLwGksWos9OcWs+iqv9
	v4T4rP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0YUJ-0000000AjiC-1HkR;
	Fri, 04 Apr 2025 04:17:03 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0YSU-0000000AjaS-0zgw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 04:15:12 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250404041502epoutp031220dd044d8719a2d6cccb528dec5b9e~zAmKG2THe0408404084epoutp03y
	for <linux-arm-kernel@lists.infradead.org>; Fri,  4 Apr 2025 04:15:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250404041502epoutp031220dd044d8719a2d6cccb528dec5b9e~zAmKG2THe0408404084epoutp03y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743740102;
	bh=XqYBy4gvdoVQ6qB+lepjnAo86Zkd1rhVn6wJVz03arE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=EC32QqUdOjySx7qPVT/rW8CgxiRnowLTfH8bBQnXyL1FzthcOEdHPYg2koIp1MVWC
	 LvTHuXzKA8/3ce85BBwIr/xwO5wLeQT43VrEGHkZgEqNl8T5V+3i9cZz/m5br+Fp1R
	 uFZ2IAvXhxCSoH+TXuPyoQ8F1udaut6ZbQDcu9AY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250404041502epcas2p46fa3bd561f019e66b3ef83c051e00d93~zAmJfBPLY1433714337epcas2p4F;
	Fri,  4 Apr 2025 04:15:02 +0000 (GMT)
Received: from epsmgec2p1-new.samsung.com (unknown [182.195.36.69]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZTQHT40G8z6B9mB; Fri,  4 Apr
	2025 04:15:01 +0000 (GMT)
Received: from epcas2p4.samsung.com ( [182.195.41.56]) by
	epsmgec2p1-new.samsung.com (Symantec Messaging Gateway) with SMTP id
	42.21.37303.5CC5FE76; Fri,  4 Apr 2025 13:15:01 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPA id
	20250404041501epcas2p4b4ac00e225a28bea381f51f84914c4ac~zAmIWQFni0476804768epcas2p4K;
	Fri,  4 Apr 2025 04:15:01 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250404041500epsmtrp2eba09a6459fe7bb5c2f88fbad7ada89e~zAmIRfeZX2757627576epsmtrp2S;
	Fri,  4 Apr 2025 04:15:00 +0000 (GMT)
X-AuditID: b6c32a4d-54ffe700000091b7-f5-67ef5cc510ee
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	A0.33.08766.4CC5FE76; Fri,  4 Apr 2025 13:15:00 +0900 (KST)
Received: from tiffany (unknown [10.229.95.142]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250404041500epsmtip1b2e088aa4de4f87d087f251c220a31e4~zAmIFzYQE1809918099epsmtip1U;
	Fri,  4 Apr 2025 04:15:00 +0000 (GMT)
Date: Fri, 4 Apr 2025 13:13:23 +0900
From: Donghyeok Choe <d7271.choe@samsung.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Youngmin Nam <youngmin.nam@samsung.com>, Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>, Sudeep Holla <sudeep.holla@arm.com>,
	Saravana Kannan <saravanak@google.com>, Ulf Hansson
	<ulf.hansson@linaro.org>, Vincent Guittot <vincent.guittot@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com, hajun.sung@samsung.com, d7271.choe@samsung.com,
	joonki.min@samsung.com, ne.yoo@samsung.com
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in
 GICv3 ITS driver
Message-ID: <20250404041323.GA685160@tiffany>
MIME-Version: 1.0
In-Reply-To: <20250403-rare-wasp-of-management-9bce59@sudeepholla>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrKJsWRmVeSWpSXmKPExsWy7bCmhe7RmPfpBmdOSVlc2zuR3aJp/yVm
	i6u73zFb7NguYrHp8TVWi8u75rBZ7JxzktVi2fEuVouuQ3/ZLJaf2sFisXnTVGaL42vDLTqO
	fGO2WHzgE7sDn8e23dtYPdbMW8PosWBTqcemVZ1sHneu7WHzeHfuHLvH5iX1Hn1bVjF6fN4k
	F8AZlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3S5
	kkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafAvECvODG3uDQvXS8vtcTK0MDAyBSo
	MCE748WpiWwFW8UqTj2/w9LAuF+oi5GTQ0LAROLhwVnsXYxcHEICexglTr9vZYFwPjFK/P65
	iRnC+cYo0bdoARNMy8pn86Fa9jJKvGtohGp5yihx/fE7sCoWARWJ65P+soDYbAK6EpM6t7GB
	2CIC6hJLzm5hBGlgFrjGLPHk7zsgh4NDWCBK4nF7HEgNL1D99MOL2CFsQYmTM5+AzeEUcJJY
	924aE0ivhMAeDok35z5CneQise3RMXYIW1ji1fEtULaUxOd3e9kgGpoZJSbdeA3VPYNR4srk
	z1DdxhKznrUzgtjMAhkSr/f8Zwe5SEJAWeLILRaIMJ9Ex+G/UGFeiY42aOipSJzve8AIs2vD
	3LdQEz0kWr+2MEFCZSOTxPmjN9knMMrNQvLQLCTbIGwdiQW7P7HNAlrBLCAtsfwfB4SpKbF+
	l/4CRtZVjFKpBcW56anJRgWGunmp5fB4Ts7P3cQITs9avjsYX6//q3eIkYmD8RCjBAezkgiv
	rdr7dCHelMTKqtSi/Pii0pzU4kOMpsAYmsgsJZqcD8wQeSXxhiaWBiZmZobmRqYG5krivIc+
	Pk0XEkhPLEnNTk0tSC2C6WPi4JRqYIozt10UwLBvfcPLNDb+ze5P/0SwnnVu23iXj2PZBJ9D
	r7do18xdofvF9PAbO8HbyW4VZ6O6wnKvaoX9td06d5mybtDbXfv45Jx+hXH9z5/CZ13ybJpS
	ldmkX9n5r10mHXC/ZSh2yuTRPrdZRad6Ziypj6ycofL08M/VFvfmzHdXWvLw5u9FEbsePnkb
	U+E/ZTXj1OMtD0t8ehjFBJ9p1gbk9MyTazwhqWf0aW2FjcjcZ7Nmvz4wY4fI/RfnhB+lnL3T
	9dpiytEl9fXro5d8WnhmMtNM2XkZ/7zm6jQHPozomdRWdPAWq5p7/pXHubxeDwTcSuNenJiy
	9mOUjW5IaeATu+V2SlG7kpoZJy5POmylxFKckWioxVxUnAgAjQCCK1gEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmphkeLIzCtJLcpLzFFi42LZdlhJTvdIzPt0g0+rzCyu7Z3IbtG0/xKz
	xdXd75gtdmwXsdj0+BqrxeVdc9gsds45yWqx7HgXq0XXob9sFstP7WCx2LxpKrPF8bXhFh1H
	vjFbLD7wid2Bz2Pb7m2sHmvmrWH0WLCp1GPTqk42jzvX9rB5vDt3jt1j85J6j74tqxg9Pm+S
	C+CM4rJJSc3JLEst0rdL4Mo498Kk4KtwxfmPNxgbGGcIdDFyckgImEisfDafHcQWEtjNKNE3
	MQMiLiXRvmUmE4QtLHG/5QhrFyMXUM1jRokz2+8zgiRYBFQkrk/6ywJiswnoSkzq3MYGYosI
	qEssObuFEaSBWeAWs8SKSY/BioQFoiT2vJ0GNpUXqGH64UXsEFO3Mkms+L6KHSIhKHFy5hOw
	BmYBLYkb/14CNXAA2dISy/9xgIQ5BZwk1r2bxjSBUWAWko5ZSDpmIXQsYGRexSiZWlCcm55b
	bFhgmJdarlecmFtcmpeul5yfu4kRHFFamjsYt6/6oHeIkYmD8RCjBAezkgivrdr7dCHelMTK
	qtSi/Pii0pzU4kOM0hwsSuK84i96U4QE0hNLUrNTUwtSi2CyTBycUg1M6a/M75RVNwV0Xq60
	qlltNHmloYcWZ+2iROl3CR79kzeLcT5TaAs+lLUwUOfmZe0JPzqXccm+nHFmcsPWbuEpi3Yy
	T7v+8KbnRPuM9pQVn8qz37T5RF+rSjxgtp91xeHgh51ef632+UyZnFFmpm724cjL85mf1BPv
	nXmTffAT650QfhvBuKUHMzK+WuTtVCo45Td32Ybr5/yEV687ul/Nif14xOrVyRcehvGx2z/u
	EordNGvyrl2OF+//lNXkllnHOcWjbONas/vHdPPadl4vFX7m/vNKeZ/oy+jFJyIvhcX8vnlE
	NZhp5ZyH7y4fzSuKcphsf4JJ4sxaZfVJF2cU190K43r8zeWsjTeLk/CaXCWW4oxEQy3mouJE
	AJpk7dYXAwAA
X-CMS-MailID: 20250404041501epcas2p4b4ac00e225a28bea381f51f84914c4ac
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_8e84e_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5
References: <CGME20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5@epcas2p3.samsung.com>
	<Z+Nv8U/4P3taDpUq@perf> <8634f0mall.wl-maz@kernel.org>
	<Z+TEa8CVAYnbD/Tu@perf> <20250402-messy-wild-squid-7b4da9@sudeepholla>
	<Z+3kwsesiXyC0hbO@perf>
	<20250403-rare-wasp-of-management-9bce59@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_211510_915593_8CE04131 
X-CRM114-Status: GOOD (  24.21  )
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

------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_8e84e_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Apr 03, 2025 at 10:18:54AM +0100, Sudeep Holla wrote:
> /me more confused.
> 
> Are you saying you have some cpuidle platform specific logic inside
> trace_android_vh_cpuidle_psci_enter(). I would assume it was just to
> trace the entry into the state and nothing more.

Hi, I am a Samsung developer working with Youngmin Nam.

Yes, you are correct. The platform-specific logic runs, and only
the booting core performs the GIC ITS save/restore. I understand that
using trace in this way might have surprised you.
However, this kind of trace usage is actually quite common
within the Android kernel.

The Android kernel aims to ensure that all SoC vendors use
the same kernel code, aiming for the benefits of the GKI project.
Since vendors often want to control kernel behavior, they utilize
traces like this to achieve that flexibility.

> In fact, it was recently added upstream as well.
> Commit 7b7644831e72 ("cpuidle: psci: Add trace for PSCI domain idle")

Then it seems that this will be used instead of the Android kernel specific
vendor hook(trace_android_vh_cpuidle_psci_enter).
We can eliminate the diff between the mainline code and the ACK.

> Further you didn't explicitly answer my question. IIUC are you calling
> GIC ITS suspend function unconditionally if its boot cpu ? Or is it
> done only for s2idle ? If done only for s2idle, how does it work for
> normal cpuidle entry to deepest idle state that matches the one entered
> during s2idle.

In the s2idle situation, only the booting core performs
the GIC ITS suspend/resume. The difference from normal cpuidle
is that in the case of s2idle, the entire system enters suspend
at a level equivalent to kernel suspend.

Through that trace(trace_android_vh_cpuidle_psci_enter),
we don't directly call syscore suspend, but rather mimic
the actions that syscore suspend would perform.

You might be concerned about the following:
While kernel suspend hotplugs out the remaining cores except for
the booting core and performs syscore suspend, in the s2idle scenario,
cores enter cpuidle in parallel when going into suspend.
I understand that you may worry about the synchronization issues
that could arise when cores enter cpuidle in parallel during
the s2idle situation.
There were many exceptional cases, and we resolved them all together
with my colleagues. We paid the price for not using the mainline kernel
code as intended.

If you have any further questions, feel free to reach out.

Best regards,  
Donghyeok Choe

------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_8e84e_
Content-Type: text/plain; charset="utf-8"


------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_8e84e_--

