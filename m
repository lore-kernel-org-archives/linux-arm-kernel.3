Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863C2D6A25F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 00:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Type:Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:CC:To:From
	:Subject:Mime-Version:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2QTg3uMImeU66RhLX3/5YsxnFUoi2i1VFQyshj8WnNg=; b=2tW1Ete6KL7Ja0M8hjZRdLcUeA
	PaJIIX02f6BXY8v1jJ8PHlBxaNx487Pz86j6Il7Eh3hTpnJJeDSh1fhCX+pfo7pRGyza+Ubw+AMNZ
	AFdiOteJXc2+Bv8ZlJUKrg/Hkti01rZv1YPF0GoSEkd2QRr+j3QtNl/Ip4XyanVbC2Wa6VgYkwYdU
	cGEAd0XCnlIGPLB64Xm6PP+v05VRHrnc2n1gLeEtZAznvr7GijJ9r5LfDm+IaLWFe38ATFrttYMZL
	FhdNtnXq+Fd9mHTJyTx5W18UdSUxsJgNt+MIn/gYn1WCO0vRtnK/O6MdohskZmBweGsqU3IksVG7l
	zaN7rXBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBkMn-00000001EBX-3j1E;
	Fri, 15 Nov 2024 00:39:17 +0000
Received: from [203.254.224.34] (helo=mailout4.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBkLq-00000001E4r-3RGD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 00:38:22 +0000
Received: from epcas1p1.samsung.com (unknown [182.195.41.45])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20241115003812epoutp0448d2b698267cdcf7163c6272ff984889~H-U25xrFh3020530205epoutp04m
	for <linux-arm-kernel@lists.infradead.org>; Fri, 15 Nov 2024 00:38:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20241115003812epoutp0448d2b698267cdcf7163c6272ff984889~H-U25xrFh3020530205epoutp04m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1731631092;
	bh=2QTg3uMImeU66RhLX3/5YsxnFUoi2i1VFQyshj8WnNg=;
	h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
	b=n06gKXqPozK50JkoDvZxhWPYFMHiJ42WNvPnwMZN8BAK263oS3OVs3pVRKW8HHMhd
	 ADQmtmQKRs4YIMW/2Qo6KRB1O3mRqYdTEs800lHJey/7RF4jnfadrFd72zbrtaslUN
	 Ric0aukVmj07r38UNfFhV/UJeh/fysvD+C1nw27s=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
	epcas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241115003811epcas1p2b96da2b129d9027364eef77e96486f1b~H-U2XwYY-2573625736epcas1p2C;
	Fri, 15 Nov 2024 00:38:11 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.36.144]) by
	epsnrtp4.localdomain (Postfix) with ESMTP id 4XqJ5t2gq8z4x9Q2; Fri, 15 Nov
	2024 00:38:10 +0000 (GMT)
X-AuditID: b6c32a35-6c7ff70000023fb3-78-673697f2e2ec
Received: from epcas1p2.samsung.com ( [182.195.41.46]) by
	epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	19.41.16307.2F796376; Fri, 15 Nov 2024 09:38:10 +0900 (KST)
Mime-Version: 1.0
Subject: RE: Re: [PATCH V4 4/5] soc: qcom: Introduce SCMI based Memlat
 (Memory Latency) governor
From: MyungJoo Ham <myungjoo.ham@samsung.com>
To: Sibi Sankar <quic_sibis@quicinc.com>, Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>, Kyungmin Park <Kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>
CC: "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
	"cristian.marussi@arm.com" <cristian.marussi@arm.com>,
	"andersson@kernel.org" <andersson@kernel.org>, "konrad.dybcio@linaro.org"
	<konrad.dybcio@linaro.org>, "robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "quic_rgottimu@quicinc.com"
	<quic_rgottimu@quicinc.com>, "quic_kshivnan@quicinc.com"
	<quic_kshivnan@quicinc.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>, Amir Vajid
	<avajid@quicinc.com>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <ac655bdc-5ccf-c6c6-3203-659f1916c53c@quicinc.com>
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20241115003809epcms1p518df149458f3023d33ec6d87a315e8f6@epcms1p5>
Date: Fri, 15 Nov 2024 09:38:09 +0900
X-CMS-MailID: 20241115003809epcms1p518df149458f3023d33ec6d87a315e8f6
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 101P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrCJsWRmVeSWpSXmKPExsWy7bCmnu6n6WbpBgt/8Fps67CxOHflKrvF
	+Sv9bBZr9p5jsjjY9pPN4vqX56wW84+cY7WYeB7I7Zi8ncWi78VDZouzTW/YLTY9vgaU2H+W
	3eLyrjlsFp83b2G3eHl7G5tF86LfbBate4+wWyw/tYPFYuNXDwcRjzXz1jB6bFrVyeZx59oe
	No/NS+o9Ju6p8+jbsorR4/MmuQD2qGybjNTElNQihdS85PyUzLx0WyXv4HjneFMzA0NdQ0sL
	cyWFvMTcVFslF58AXbfMHKBvlBTKEnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkFpgV6
	xYm5xaV56Xp5qSVWhgYGRqZAhQnZGf8WvmcuaOOoOPdrH3sD41a2LkZODgkBE4mfvz+wdzFy
	cQgJ7GCUuHDkPXMXIwcHr4CgxN8dwiCmsECSRNeuHJByIQEliYab+5hBbGEBfYmOB9sYQWw2
	AV2JrRvusoCMERG4yigxc/pZMIdZ4C6bROe+q6wQy3glZrQ/ZYGwpSW2L98K1s0pYC/xb/5i
	qLioxM3Vb9lh7PfH5jNC2CISrffOMkPYghIPfu6GiktK9N3ZywSyTEJgG6PEjiNz2CCc/YwS
	Ux62QU3Slzgz9yTYy7wCvhI7mw6BXcQioCrR0twNDQoXiZafEHFmAXmJ7W/ngEOCWUBTYv0u
	fYgwn8S7rz1wz+yY94QJwlaTOLR7CdQqGYnT0xdCHeohcfHDRVZI0K1mlti1MW4Co/wsRPjO
	QrJsFsKyBYzMqxjFUguKc9NTiw0LDOFRmpyfu4kRnJy1THcwTnz7Qe8QIxMH4yFGCQ5mJRHe
	U87G6UK8KYmVValF+fFFpTmpxYcYTYHenMgsJZqcD8wPeSXxhiaWBiZmRsYmFoZmhkrivGeu
	lKUKCaQnlqRmp6YWpBbB9DFxcEo1MOl+iFI6bSJ5aZ7T8ou7bZ/+/ym7evZNST7DCXEVc39N
	XNCT5+qwa/MuQc3sO2uPpL1J1K68ru7hcLpa+VH9JOmgb5vjiucaTTt3Nlx2pvdZ3g/TNunM
	2vtHRXrDN8FPPTuenKsJ3cSVOmvBj9pjj36eLtdnb/uzJ8Fm2QYd/tt1vet/RFQ4qk/8avC+
	dV5r39r+aJccvs+1i6J4rlmYTZ8gzOMXvMvC7hJD6Y/n/nHqmmcWd/XP+i38ZO0pxQWNgh33
	rlp56j78POt46gbZyRb8vqXvVmhMna144YHpessbcoHyUaLTjpUsN1S8d/Sn+o0Paumdd/aa
	q/vWX3h+zlJnp/qmwyc23T/XxXTRo0hZiaU4I9FQi7moOBEA2uwez1cEAAA=
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241114041419epcas1p3b52bb9795ffd9efa568bb106ba268e02
References: <ac655bdc-5ccf-c6c6-3203-659f1916c53c@quicinc.com>
	<20241007061023.1978380-1-quic_sibis@quicinc.com>
	<20241007061023.1978380-5-quic_sibis@quicinc.com>
	<2aycrvnvivcrqctqmweadcgenwugafdr6ub3bzkscterpenz32@bzabln2hkral>
	<29eef87e-96f6-5105-6f7a-a8e01efcb4a3@quicinc.com>
	<k4lpzxtrq3x6riyv6etxiobn7nbpczf2bp3m4oc752nhjknlit@uo53kbppzim7>
	<CGME20241114041419epcas1p3b52bb9795ffd9efa568bb106ba268e02@epcms1p5>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_163819_489031_6EB4623B 
X-CRM114-Status: GOOD (  25.09  )
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
Reply-To: myungjoo.ham@samsung.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

>
>Hey Dmitry,
>
>Thanks for taking time to review the series.
>
>+ Devfreq maintainers to comment (I thought you already added
>them by name)
>
>
>Hey MyungJoo/Kyungmin/Chanwoo,
>
>Can you weigh in here? Does it make sense to add a new
>class of devfreq devices that don't have governors
>associated with them just for them to export a few
>essential data to userspace? In this scenario the
>scaling algorithm is in a SCP and we just start
>them from the kernel. We do have ways to get the
>current frequency of various buses but does this
>warrant adding a new class of governor less devices?
>
>-Sibi

If voltage/frequency is controlled by SCP
(it's an SoC's internal hardware IP, right?),
it's good to have a userspace governer
with the driver not accepting updates from userspace.

E.g., Let "target" callback not update the frequency value,
 or let "target" callback always return an error with
 a dev_err message that you don't accept frequency changes
 from userspace.

Cheers,
MyungJoo.

