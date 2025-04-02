Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C66C36018
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 04:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	In-Reply-To:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YaSBtJTzWwLtALPXgANET9zJimuDj0lthSCemMiv7pU=; b=fqp+PBJp8CmFp6hZwXpYMB+Khv
	8EPLhStRRn5cIEAXrNywz2mjdBacRQupCCfzl+e3dwxXLBaBgNOn+RMuatf7jNqA7X0DVPABqmbdh
	ga381pJbrpugVJ9vo6jmJbb2YjtBRzw8DxlOQZnvqJLOkI1h90kniLRckcqDbBLXKXrjXTMbYUz9M
	5snrhcHCHze/2CdgCRIrE2IqTKqYiYPwPFoyaRcotHpDJjglhQvkhBjVNZyRORDnuALILhOaWfkn4
	yayAjWdauTYYu4Brc/JAiParEMCVLQvPRfX5o22O8XBLrKLQu+7DWuC6iRvtK5WtfLoPlYtY5pyO8
	aMTf8L6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzpQI-0000000551D-2UbG;
	Wed, 02 Apr 2025 04:09:54 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzpNI-000000054lw-1mIg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 04:06:50 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250402040639epoutp019cb96396d885c46667470a761694b25b~yZMQuuD002201922019epoutp01g
	for <linux-arm-kernel@lists.infradead.org>; Wed,  2 Apr 2025 04:06:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250402040639epoutp019cb96396d885c46667470a761694b25b~yZMQuuD002201922019epoutp01g
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1743566799;
	bh=YaSBtJTzWwLtALPXgANET9zJimuDj0lthSCemMiv7pU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=apCZjUF8xhhdvKd8NB9f0zqX7LfL5xBTmUUulEWlb+fzVXWEKHSxhebYlxcl6sV75
	 y5T3mw3sV20DwA5KyTFNEoUnYHZgD7VTsjL1TQXd6nZ0cPgyi3L3CUGtSDQeopz75Y
	 gEq9FacBxZPTduhgZWRPG2z7L7AKlZVvnUNngbdk=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
	epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
	20250402040638epcas2p28056a7638c65f03f27448e5b5a6c20a3~yZMQJvFAz2037220372epcas2p2w;
	Wed,  2 Apr 2025 04:06:38 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.92]) by
	epsnrtp02.localdomain (Postfix) with ESMTP id 4ZSBBk1mGNz2SSKd; Wed,  2 Apr
	2025 04:06:38 +0000 (GMT)
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	13.8A.09787.EC7BCE76; Wed,  2 Apr 2025 13:06:38 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTPA id
	20250402040637epcas2p155f746289534646acd447e6615820f96~yZMPLKO292618426184epcas2p1K;
	Wed,  2 Apr 2025 04:06:37 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250402040637epsmtrp11998c655ca28d45573c740ac5a3f5bcc~yZMPKKLoc0152701527epsmtrp1N;
	Wed,  2 Apr 2025 04:06:37 +0000 (GMT)
X-AuditID: b6c32a45-9d3ff7000000263b-16-67ecb7ce9675
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	3E.7F.08805.DC7BCE76; Wed,  2 Apr 2025 13:06:37 +0900 (KST)
Received: from perf (unknown [10.229.95.91]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250402040637epsmtip1a34f85905b1205aca88825950159722c~yZMO756km1079510795epsmtip1k;
	Wed,  2 Apr 2025 04:06:37 +0000 (GMT)
Date: Wed, 2 Apr 2025 13:10:55 +0900
From: Youngmin Nam <youngmin.nam@samsung.com>
To: Will McVicker <willmcvicker@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	<will@kernel.org>, Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>, Tudor Ambarus
	<tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Saravana
	Kannan <saravanak@google.com>, Will McVicker <willmcvicker@google.com>,
	kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, Will Deacon <willdeacon@google.com>
Subject: Re: [PATCH v1 4/6] arm64: dts: exynos: gs101: Add
 'local-timer-stop' to cpuidle nodes
Message-ID: <Z+y4zxfifkQqLxKF@perf>
MIME-Version: 1.0
In-Reply-To: <20250331230034.806124-5-willmcvicker@google.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUxTVxjHPX25vaCMa2HspIpjV8WBAi2j5UKAEWWkui3pdIvOD+INvWkJ
	pa297SZm2RCRtxiGuEWtDlHGXpqC2LJLEWSuOtgGq2EMZAgyNzS8SbEwF2DAWm63+O33PM/5
	n+f8n3MOyhX2IyI0R2ukDFpSgyOBPOZWlCzG1TylEruqAonfqxmEaJqw8wj3F6cAYb3h4hDV
	s+HEpdsuPuFoDiXGzfcRwvZnP5/ovX4RIc7daecQjeeWecRKm0NAlDuXEMJu+5RLeAYPEUVD
	UqJkfpJHWDwrID1EzrQyfLm12grkNTaT3GYpQ+RD/W2IfNrlEsjtn38kr2iyAPmsbZMi4GBu
	ipoilZQhgtJm65Q5WlUq/vq+rF1ZUplYEiNJIhLxCC2ZR6XiGW8oYjJzNF5DeMR7pMbkTSlI
	msbj0lIMOpORilDraGMqTumVGn2iPpYm82iTVhWrpYzJErE4XupdeDhXfWfFiei/Ex5t/3kS
	FIDPgstBAAqxBOi5WiooB4GoEHMA2D1UDNjAA6CbmfdXngJobxn1Buiq5GnXO2z+BoBFvdN8
	NngA4BVP5eoiHrYFzl3b5muBYDGQ+WEZ+DgU2w7H2hpXN+Vi43x43DtgXyEEOwx72if4Pg7C
	NsML9cscltfDH8+P8nwcgKXBs301XJ8YYqMoHFq8yWNNZED7QgOH5RA40dkkYFkExz8u9jMN
	C0YG/eIiAH+6O8ZlC69A86OS1eNxMTWsbOhGWJub4e1BHpt+DpbeWvK7D4KlxUJWGQkXPmkE
	LG+ErbVf+XeUw29WGIQdyvcAdjJVnEqwyfyMH/Mz3VjeAWtaPV5GvbwBfrmMshgFr16PqwF8
	Cwij9HSeiqLj9ZL/bzhbl2cDqw88+jUHOPN4JtYJOChwAohy8dCgA3+Nq4RBSjL/GGXQZRlM
	Gop2Aqn3ck5zRc9n67w/RGvMkiQkiRNkMklivFSciL8Q5HzyUCXEVKSRyqUoPWX4T8dBA0QF
	nMjjR81fd7/f4R4Y7nZEzw5bI7dF7T1xpWLq8eARNDypqU4A12U/7D3pVj76Y89NmeuJw1I1
	tfOX5q5DJy4Iova+lZh5LGxa0DxfgL17pDNYGr52fdnMYtc9S0vDhyOCPOXOArwjax/v8nDK
	5KWa+hddqbmi1IyBkw2h+cwMDCtVJAc0Pug5GNeVX5vcXhepf9X4rXBD6PxLzMuDhSUe5u7i
	1jOnaXd64dzGrtpTb26xrqwtj005UEbiv6b31I3J7sW7387cYW3JLFxTLFoz3dHNGR+RXJtb
	d3+OOruoQAfqtX0Tu3efl20vWaL6Pgg0ByN/70/b88/CRVPLbxXUfmpr2WWcR6tJSTTXQJP/
	AiUla01pBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRmVeSWpSXmKPExsWy7bCSnO7Z7W/SDbrf6Vg8mLeNzWLLq80s
	Fu+X9TBarNl7jsli3mdZi/lHzrFa7NguYvFy1j02i02Pr7FaXN41h81ixvl9TBYbZvxjsfi/
	Zwe7Rdehv2wWmzdNZbb4dCvOouWOqUX7z9csFqs+/Wd0EPbYtnsbq8eaeWsYPRZsKvXYtKqT
	zePOtT1sHu/OnWP32Lyk3qNvyypGj8+b5AI4o7hsUlJzMstSi/TtErgyXnR2MBY0ClRsfzWR
	rYHxG08XIweHhICJxLfToV2MnBxCArsZJQ6tUwOxJQRkJG6vvMwKYQtL3G85AmRzAdXcZ5TY
	+H4RK0gvi4CKxJeN6iA1bAK6EttO/GMEsUUEtCVe7NnADlLPLPCZVeLN4kNsIAlhgQSJSx23
	mUBsXgFlidlr/zFBDD3KKNFwZyELREJQ4uTMJ2A2s4CWxI1/L5lAljELSEss/8cBEuYUsJOY
	fnUB8wRGgVlIOmYh6ZiF0LGAkXkVo2RqQXFuem6xYYFRXmq5XnFibnFpXrpecn7uJkZw9Glp
	7WDcs+qD3iFGJg7GQ4wSHMxKIrwRX1+mC/GmJFZWpRblxxeV5qQWH2KU5mBREuf99ro3RUgg
	PbEkNTs1tSC1CCbLxMEp1cDEnexy9Vj/lH+y0qUNPxacEIvUOLB3sTTb09S6O6Wn03/EaGnL
	2k5a+FRRy7xcTjx6UmJKQkbodNPkPwV1WfcPTV+7z/Lm/+AXjmFP4qqEM+8Zvm8JeR2T5iJx
	t9381KdaWVYJ9bcyM3n3hJ7407jw88MLzNzPgzrvi/KtWCO73jVdpPjlrjl+q37J9B3+nCrZ
	4XkqVV3xWtJvq0mPPURX8EfyzFyi0FC2p92v3OjEwxNnPl7Tez7xiNANllI7GcuGMItzLtMX
	3nQO379ectPly4G3GZ+GrjnaEHpKrXfngyVVby61q/V9Odzpnq5cqVaQG1F0i7XYfNe21AVT
	n7R9na2zJlWidk7uIy3PyAolluKMREMt5qLiRADGWvwELQMAAA==
X-CMS-MailID: 20250402040637epcas2p155f746289534646acd447e6615820f96
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_74ef6_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250331230151epcas2p486a7c6d7153737f4168cfef74249742f
References: <20250331230034.806124-1-willmcvicker@google.com>
	<CGME20250331230151epcas2p486a7c6d7153737f4168cfef74249742f@epcas2p4.samsung.com>
	<20250331230034.806124-5-willmcvicker@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_210649_095456_58BE6644 
X-CRM114-Status: GOOD (  24.43  )
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

------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_74ef6_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Mar 31, 2025 at 04:00:26PM -0700, Will McVicker wrote:
> From: Will Deacon <willdeacon@google.com>
> 
> In preparation for switching to the architected timer as the primary
> clockevents device, mark the cpuidle nodes with the 'local-timer-stop'
> property to indicate that an alternative clockevents device must be
> used for waking up from the "c2" idle state.
> 
> Signed-off-by: Will Deacon <willdeacon@google.com>
> [Original commit from https://android.googlesource.com/kernel/gs/+/a896fd98638047989513d05556faebd28a62b27c]
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  arch/arm64/boot/dts/exynos/google/gs101.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> index 3de3a758f113..fd0badf24e6f 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -155,6 +155,7 @@ ananke_cpu_sleep: cpu-ananke-sleep {
>  				idle-state-name = "c2";
>  				compatible = "arm,idle-state";
>  				arm,psci-suspend-param = <0x0010000>;
> +				local-timer-stop;
>  				entry-latency-us = <70>;
>  				exit-latency-us = <160>;
>  				min-residency-us = <2000>;
> @@ -164,6 +165,7 @@ enyo_cpu_sleep: cpu-enyo-sleep {
>  				idle-state-name = "c2";
>  				compatible = "arm,idle-state";
>  				arm,psci-suspend-param = <0x0010000>;
> +				local-timer-stop;
>  				entry-latency-us = <150>;
>  				exit-latency-us = <190>;
>  				min-residency-us = <2500>;
> @@ -173,6 +175,7 @@ hera_cpu_sleep: cpu-hera-sleep {
>  				idle-state-name = "c2";
>  				compatible = "arm,idle-state";
>  				arm,psci-suspend-param = <0x0010000>;
> +				local-timer-stop;
>  				entry-latency-us = <235>;
>  				exit-latency-us = <220>;
>  				min-residency-us = <3500>;
> -- 
> 2.49.0.472.ge94155a9ec-goog
> 
Hi Will.

Are you using this property in production?
If so, have you noticed any performance improvements?

Thanks.
Youngmin

------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_74ef6_
Content-Type: text/plain; charset="utf-8"


------caUwc_dC5aEw_I.xGS0GMYyTEPKysFRHRKa1IoFNAgiy-i3F=_74ef6_--

