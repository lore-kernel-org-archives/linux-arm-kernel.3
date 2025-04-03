Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C258BC36014
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 01:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8g+yMJkj7PP7z/x7FfO0A2BRmflOUZusbSFfGg9wIE=; b=aRyBgCMzxBYIf5cbqLiV9Gw3QR
	Emvtpo1uXklxcJNzUEjWDdOILFXHwrGbCjRFQHE2SjJC+OZMapJkPx1aZRTUUIhDCBV9IlaW2K5Pd
	emrGTjzB1rlHkUkmRDR/EnyIv6S25I/RnLWq7cU0wAom9C0Kk/GFI7PCgRUMfEds16yjJfLImmOh5
	1hhSsFbDwwjhxuV8eJn17AuqxHRvKttGIvLkNxM4UHUmK8MR/97u6ShHlq7/YdBuVLIJmQoqmii7B
	L0BvFNllAt+aGMqQJK4Nq4kH//3QhXiyhgCuZdXNf1STZbqlPJ/iQMA+i9WtoangfrF0yHjf8X2Gz
	6fNIm4SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u09Nc-00000007Xvi-0OHs;
	Thu, 03 Apr 2025 01:28:28 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u09Lo-00000007Xo8-3Uxh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 01:26:40 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250403012629epoutp048c9237bc86b90ba2003f888e6b32c5b8~yqpsiL-O62676726767epoutp04k
	for <linux-arm-kernel@lists.infradead.org>; Thu,  3 Apr 2025 01:26:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250403012629epoutp048c9237bc86b90ba2003f888e6b32c5b8~yqpsiL-O62676726767epoutp04k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743643589;
	bh=w8g+yMJkj7PP7z/x7FfO0A2BRmflOUZusbSFfGg9wIE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ls1DG/glQeYF8lEiS3ueGJGNSkHTiNOevk7FcMd92hnIDTqCEVj3Tqw4NPoMotx4p
	 dznLW216sbdVVcrod7XJTohD8l+QRln7fWjS0TBDE5U4qeIH7G2AHFnL9eEzT56CCt
	 75pXK9/tzWzqu049zfbj+ItgLFTqBrP58Atyp2yA=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250403012628epcas2p346ca10ab9239ef00e78eeba378e8fd6f~yqpr7UAem2042220422epcas2p3l;
	Thu,  3 Apr 2025 01:26:28 +0000 (GMT)
Received: from epsmges2p2.samsung.com (unknown [182.195.36.100]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4ZSkbR5gsxz3hhT3; Thu,  3 Apr
	2025 01:26:27 +0000 (GMT)
Received: from epcas2p3.samsung.com ( [182.195.41.55]) by
	epsmges2p2.samsung.com (Symantec Messaging Gateway) with SMTP id
	A0.4F.10159.3C3EDE76; Thu,  3 Apr 2025 10:26:27 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250403012627epcas2p167a40fa02e775d5e6647d469ecc370c1~yqpq772__2437524375epcas2p13;
	Thu,  3 Apr 2025 01:26:27 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250403012627epsmtrp29839841071b9243d760fd01ad1ff5a38~yqpq7EzL_2393023930epsmtrp2F;
	Thu,  3 Apr 2025 01:26:27 +0000 (GMT)
X-AuditID: b6c32a46-9fefd700000027af-ba-67ede3c35dc5
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	9A.88.08805.3C3EDE76; Thu,  3 Apr 2025 10:26:27 +0900 (KST)
Received: from perf (unknown [10.229.95.91]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250403012627epsmtip2d7bbac47a692c1a59afd6665302ec668~yqpqq1Ep10314103141epsmtip2j;
	Thu,  3 Apr 2025 01:26:27 +0000 (GMT)
Date: Thu, 3 Apr 2025 10:30:42 +0900
From: Youngmin Nam <youngmin.nam@samsung.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>, Sudeep Holla <sudeep.holla@arm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>, Vincent Guittot
	<vincent.guittot@linaro.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	hajun.sung@samsung.com, d7271.choe@samsung.com, joonki.min@samsung.com,
	Youngmin Nam <youngmin.nam@samsung.com>, ne.yoo@samsung.com
Subject: Re: [GICv3 ITS]S2IDLE framework does not invoke syscore_ops in
 GICv3 ITS driver
Message-ID: <Z+3kwsesiXyC0hbO@perf>
MIME-Version: 1.0
In-Reply-To: <20250402-messy-wild-squid-7b4da9@sudeepholla>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrAJsWRmVeSWpSXmKPExsWy7bCmue7hx2/TDbpnaFpc2zuR3aJp/yVm
	i6u73zFb7NguYrHp8TVWi8u75rBZ7JxzktVi2fEuVouuQ3/ZLJaf2sFisXnTVGaL42vDLTqO
	fGO2WHzgE7sDn8e23dtYPdbMW8PosWBTqcemVZ1sHneu7WHzeHfuHLvH5iX1Hn1bVjF6fN4k
	F8AZlW2TkZqYklqkkJqXnJ+SmZduq+QdHO8cb2pmYKhraGlhrqSQl5ibaqvk4hOg65aZA3S5
	kkJZYk4pUCggsbhYSd/Opii/tCRVISO/uMRWKbUgJafAvECvODG3uDQvXS8vtcTK0MDAyBSo
	MCE748KK8+wFLcIVfy9OZW9gXM/XxcjJISFgItHwdgtLFyMXh5DADkaJSX+eMkE4nxglfi+d
	yA7hfGOUePrhKgtMy8ats6ESexkltjxYzAzhPGSU+NDcyQ5SxSKgIrG6ewMbiM0moCux7cQ/
	RhBbREBdYsnZLYwgDcwC15glNux9DrSQg0NYIEricXscSA2vgLJEU9ceVghbUOLkzCdgmzkF
	rCVevNgNdqyEwAEOiUfPFrJCnOQi8bfzMZQtLPHq+BZ2CFtK4vO7vWwQdrFEw/1bzBDNLYwS
	p66/YIZIGEvMetYOdh2zQIbEgjevWUEOkgC64sgtFogwn0TH4b/sEGFeiY42IYhONYlfUzYw
	QtgyErsXr4Ca6CHR+rUFGo73GSU2Tv/FOIFRbhaSf2Yh2QZh60gs2P2JbRbQCmYBaYnl/zgg
	TE2J9bv0FzCyrmIUSy0ozk1PLTYqMIJHcXJ+7iZGcFLWctvBOOXtB71DjEwcjIcYJTiYlUR4
	C7XepgvxpiRWVqUW5ccXleakFh9iNAVGzkRmKdHkfGBeyCuJNzSxNDAxMzM0NzI1MFcS5z30
	8Wm6kEB6YklqdmpqQWoRTB8TB6dUA5NWfvpzh5yJL5gCJ6fEPmVZF/7dcqfYp/iWx1u2vr1k
	J6edIeXExRVrdrZY7472pYrXddF8W8W0PqXcCDrtXxedKPPZf6PVltVeh+5n9sQzneJhbdTw
	ymw74P5us9uB3+ESr/69WPfXQPWQaKXiCYFH03/+DFn/uShQdGML56yLTx9cNvZ0StTf9+/P
	vRAPvhQzdo49Rb/VJJT6o5iDHwulPcrKlHD9d5i34Vtx0t1mhzr3P02lFQ+LHD33XfnBf9U+
	VVoy/sJCSd7CHY6hC5ljduWs3WW6dI6ftL5maDh/WWdE60Qh94gDhbsfZsmlvv7tEv9A3zN5
	/ePsqklMRzVbJrK1VV6cHBJw+/Z5JZbijERDLeai4kQAbgV3g1MEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpjkeLIzCtJLcpLzFFi42LZdlhJXvfw47fpBtdfcVhc2zuR3aJp/yVm
	i6u73zFb7NguYrHp8TVWi8u75rBZ7JxzktVi2fEuVouuQ3/ZLJaf2sFisXnTVGaL42vDLTqO
	fGO2WHzgE7sDn8e23dtYPdbMW8PosWBTqcemVZ1sHneu7WHzeHfuHLvH5iX1Hn1bVjF6fN4k
	F8AZxWWTkpqTWZZapG+XwJWx/cEv9oIjAhW3uv8wNjB28HQxcnJICJhIbNw6m72LkYtDSGA3
	o8TeQ++YIBIyErdXXmaFsIUl7rccYYUous8ocfj6I7AEi4CKxOruDWwgNpuArsS2E/8YQWwR
	AXWJJWe3MII0MAvcYpb40nwGrEhYIEpiz9tpYBt4BZQlmrr2QE19zCgxacdXdoiEoMTJmU9Y
	QGxmAS2JG/9eAjVwANnSEsv/cYCEOQWsJV682M0ygVFgFpKOWUg6ZiF0LGBkXsUomVpQnJue
	W2xYYJSXWq5XnJhbXJqXrpecn7uJERxVWlo7GPes+qB3iJGJg/EQowQHs5IIb6HW23Qh3pTE
	yqrUovz4otKc1OJDjNIcLErivN9e96YICaQnlqRmp6YWpBbBZJk4OKUamOp/65p+3XTjCtPj
	3JDqyyEpkZ+eumzhyTjGsi1R/7tP0sILufc2sp2VUQrdWfRrzqE/U1f1H09RYLknXJhnIPNh
	+dlT/CpOKe3m+yKuHXSTXbLYdMs8qUORZTqL1gjdskt8M+tW6kY56XYN65X6b07f/bttz5Gu
	WbKbXL+XKrslF50tLH0Ytok1sYlhZ/eblHshUou2hkbYcXGflJot9OKwqPCfpQrJPn8cf98s
	uLFxqSOTrsI7cbEzsgu/s7SmaPDd/SO8Mkwr+RLXnT2P/r37ErjkXdUVxh+Vn9t159lwvLnr
	EM++c+Z265i6s1qT25k9GbtqrYVPz9q5/9qcLwqHZM110w66fnu59NwOp7dKLMUZiYZazEXF
	iQCIReYLGQMAAA==
X-CMS-MailID: 20250403012627epcas2p167a40fa02e775d5e6647d469ecc370c1
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_802bd_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5
References: <CGME20250326030527epcas2p33aa30e62cc8a00c9e151c35bee71dac5@epcas2p3.samsung.com>
	<Z+Nv8U/4P3taDpUq@perf> <8634f0mall.wl-maz@kernel.org>
	<Z+TEa8CVAYnbD/Tu@perf> <20250402-messy-wild-squid-7b4da9@sudeepholla>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_182637_525626_66F0D766 
X-CRM114-Status: GOOD (  28.04  )
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

------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_802bd_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 02, 2025 at 12:56:53PM +0100, Sudeep Holla wrote:
> (Failed to find the original email, so reply on this instead)
> 
> On Thu, Mar 27, 2025 at 12:22:19PM +0900, Youngmin Nam wrote:
> > 
> > The problem is that syscore_ops is not invoked during the S2IDLE scenario,
> > so we cannot rely on it in that context.
> > We would like to use these suspend/resume functions during S2IDLE as well.
> 
> I have one orthogonal question. The s2idle will just use the deepest
> cpuidle state registered. So if s2idle needs this save/restore of GICv3
> ITS, how does that work when all the CPUs enter that idle state.
> 
> With respect to the PSCI CPU_SUSPEND call, it doesn't change. So I am
> bit confused as how it can work fine in normal cpuidle paths but no in
> s2idle path. What am I missing ? I do psci_enter_domain_idle_state handles
> s2idle little different but nothing to change this GICv3 ITS save/restore
> requirement between cpuidle and s2idle.
> 
> -- 
> Regards,
> Sudeep
> 
Hi Sudeep,

Thanks for asking.
As a SoC vendor, we are using the Android kernel, which includes a vendor hook like the one below.

In this function,
a vendor-specific handler attached to trace_android_vh_cpuidle_psci_enter is called.

54 static __cpuidle int __psci_enter_domain_idle_state(struct cpuidle_device *dev,
55                                                     struct cpuidle_driver *drv, int idx,
56                                                     bool s2idle)
57 {
58         struct psci_cpuidle_data *data = this_cpu_ptr(&psci_cpuidle_data);
59         u32 *states = data->psci_states;
60         struct device *pd_dev = data->dev;
61         u32 state;
62         int ret;
63
64         ret = cpu_pm_enter();
65         if (ret)
66                 return -1;
67
68         /* Do runtime PM to manage a hierarchical CPU toplogy. */
69         trace_android_vh_cpuidle_psci_enter(dev, s2idle);

Within the vendor-specific handler, if the current mode is S2IDLE and the CPU logical number is 0,
the GIC ITS suspend function is executed.

Thanks.
Youngmin

------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_802bd_
Content-Type: text/plain; charset="utf-8"


------BWvmtLGreXPtZv31XE49129YoyRr4_KGUd.k-ILdCyGA2LCZ=_802bd_--

