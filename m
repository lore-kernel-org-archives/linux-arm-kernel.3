Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0074E77170
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 02:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=6LT5uy4r9SoucdiBUQ2ux48TSKGEPUDPIQrFKGuIK9Q=; b=CjpFh/ttXKBZS+Ba8mQUw6CoDJ
	Ipbqp3YJmXrUhIypmjCvwMnjtK0pySzlwsoB3SAz8G+VuM040GX/2BjfDfEm/GYeEuIyxFkVfH97j
	ne0HiEbjNWuTswqufPty24nk7jb14lt8H2UvZj0PhcEngWdKuQ80PDddkIfvzEG2vre+NfPSRs4GS
	So2h1nruLKNOU7NrWiiOla1SQLygAzBJL2f3tJz+ztMzBlEnr4Ufk3ASegUObSJavoHkB+cPPL7TI
	CVN4ZYJXBBqrtTpVaRJt3bzHRbUUCYrLU4++aMP6TFtp11lmhIc1bJxRrxsp8gQ+1IXScx6o78PQC
	1la/akuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJOTo-00000000NGe-3rwh;
	Fri, 06 Dec 2024 02:54:08 +0000
Received: from [203.254.224.33] (helo=mailout3.samsung.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJORn-00000000N25-2aSl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 02:52:05 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20241206025157epoutp03470a2a6f5c90b9119a53dbeceadfd4e4~OdspDar6n1171311713epoutp038
	for <linux-arm-kernel@lists.infradead.org>; Fri,  6 Dec 2024 02:51:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20241206025157epoutp03470a2a6f5c90b9119a53dbeceadfd4e4~OdspDar6n1171311713epoutp038
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1733453517;
	bh=6LT5uy4r9SoucdiBUQ2ux48TSKGEPUDPIQrFKGuIK9Q=;
	h=From:To:Cc:Subject:Date:References:From;
	b=MBXuISMurPFrV85B7Lf2ZzBhVrc9tg0gFUbkxnhjsqd8E21TMc7s3ISEWQA8BGFSd
	 +V1EbQe/6m7xMbOFEw84QXCPn0LTgvfyN/tPvoivgdEHXDN+OeNJ0tJ0GvZxQO86Yt
	 9FD8hxXDjzxJ6EXzGIhQNagCUuOjnYnGpCiMjXGM=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
	epcas2p1.samsung.com (KnoxPortal) with ESMTP id
	20241206025157epcas2p1dc6f3dccba7529252f1dac17455db56d~Odsoc8OkE1560915609epcas2p1j;
	Fri,  6 Dec 2024 02:51:57 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.36.98]) by
	epsnrtp3.localdomain (Postfix) with ESMTP id 4Y4G4X4mqzz4x9Q2; Fri,  6 Dec
	2024 02:51:56 +0000 (GMT)
Received: from epcas2p1.samsung.com ( [182.195.41.53]) by
	epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
	8D.63.23368.CC662576; Fri,  6 Dec 2024 11:51:56 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20241206025156epcas2p3e1ce9ff35589d821735a7c038b9ac9da~OdsngzogD0570805708epcas2p3W;
	Fri,  6 Dec 2024 02:51:56 +0000 (GMT)
Received: from epsmgms1p2new.samsung.com (unknown [182.195.42.42]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241206025155epsmtrp1674734df029fff980875d050de3710da~OdsnfDxrZ0384203842epsmtrp13;
	Fri,  6 Dec 2024 02:51:55 +0000 (GMT)
X-AuditID: b6c32a45-db1ed70000005b48-8c-675266ccc57e
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p2new.samsung.com (Symantec Messaging Gateway) with SMTP id
	2B.74.18949.BC662576; Fri,  6 Dec 2024 11:51:55 +0900 (KST)
Received: from localhost.localdomain (unknown [10.229.9.55]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20241206025155epsmtip17fe879512350ced0886742423827a6df~OdsnUlI6s3233732337epsmtip1Q;
	Fri,  6 Dec 2024 02:51:55 +0000 (GMT)
From: Taewan Kim <trunixs.kim@samsung.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alim Akhtar
	<alim.akhtar@samsung.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, Taewan Kim <trunixs.kim@samsung.com>
Subject: [PATCH v4 0/1] support watchdog for exynosautov920 
Date: Fri,  6 Dec 2024 11:51:37 +0900
Message-ID: <20241206025139.2148833-1-trunixs.kim@samsung.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBJsWRmVeSWpSXmKPExsWy7bCmqe6ZtKB0g50XFCwezNvGZrFm7zkm
	i/lHzrFavJx1j81i0+NrrBaXd81hs5hxfh+TxY11+9gtniw8w2Txf88OdotJi88zWTx++Y/Z
	gcdj06pONo+Va9awemxeUu+x83sDu0ffllWMHp83yQWwRWXbZKQmpqQWKaTmJeenZOal2yp5
	B8c7x5uaGRjqGlpamCsp5CXmptoqufgE6Lpl5gDdqKRQlphTChQKSCwuVtK3synKLy1JVcjI
	Ly6xVUotSMkpMC/QK07MLS7NS9fLSy2xMjQwMDIFKkzIzvi8YzF7wWruinVNSg2Mezi7GDk4
	JARMJD69Fe9i5OIQEtjBKLFx5WUmCOcTo8Sr82dZuxg5gZxvjBInbyWD2CAN536sYIMo2sso
	cXrlK3YI5yOjxLqJ35hAqtgEtCS2HX4FNkpE4DWjRFPvO2YQh1ngPKPEoUNNLCBVwgI2EmuW
	/2QEOYRFQFXi8L1sEJNXwE6ia180xDZ5iUlrWplBbF4BQYmTM5+AdTIDxZu3zgYbKSHwl13i
	8dcJzBANLhKLeppZIWxhiVfHt7BD2FISL/vboOx8iZUrTzBB2DUS99p2sUDY9hKLzvxkB7mB
	WUBTYv0ufUgQKUscuQW1lk+i4/Bfdogwr0RHmxCEqSoxfVkAxAxpiYkz1rJB2B4ST19uYoEE
	YazEjJfPmSYwys9C8sssJL/MQli7gJF5FaNYakFxbnpqsVGBITxCk/NzNzGCk6iW6w7GyW8/
	6B1iZOJgPMQowcGsJMJbGRaYLsSbklhZlVqUH19UmpNafIjRFBi2E5mlRJPzgWk8ryTe0MTS
	wMTMzNDcyNTAXEmc917r3BQhgfTEktTs1NSC1CKYPiYOTqkGJl7GX04G0fO3x5uKJCy91XJ9
	T96l4mvp4S7yoSyy/988ZPsiHLJ94Y0F8bzTjnnv4+9jOK8sXtzUtGlGYL1i65nEtzU1x2Rn
	tX5/r+jeIZhU2WypwF+hMJFzym7G1K4ZdQ+zOg7Y9XX13y377MPr0RMl8NbsrbpD5vZbbREm
	0n+kv4YxeWZsCVIoCF/pJ7tBdKvrUqmWvKgdpw+f6ba8IbPziarBdjlG9w29SYWRvQ9fFPQ+
	WPA99m9k5WOn3Kymu2eTl/gnZSW9dwz7aKFxLaAg5dXnbVcWlhhk7Nzd8DNho/GVJ7Nr/+6d
	0/38tXPHHeU7xTO/KWe/+tDbFX0pbI/CoSfzJ96vSJtd961FiaU4I9FQi7moOBEAsFGoeisE
	AAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNLMWRmVeSWpSXmKPExsWy7bCSnO7ptKB0g76dFhYP5m1js1iz9xyT
	xfwj51gtXs66x2ax6fE1VovLu+awWcw4v4/J4sa6fewWTxaeYbL4v2cHu8WkxeeZLB6//Mfs
	wOOxaVUnm8fKNWtYPTYvqffY+b2B3aNvyypGj8+b5ALYorhsUlJzMstSi/TtErgyPu9YzF6w
	mrtiXZNSA+Mezi5GTg4JAROJcz9WsHUxcnEICexmlJjy4iwTREJa4sjvF2wQtrDE/ZYjrBBF
	7xklHs68xAySYBPQkth2+BUTSEIEJHH2yy9GEIdZ4CqjxI9F79hBqoQFbCTWLP8JlODgYBFQ
	lTh8LxvE5BWwk+jaFw2xQF5i0ppWsJm8AoISJ2c+YQGxmYHizVtnM09g5JuFJDULSWoBI9Mq
	RsnUguLc9NxiwwKjvNRyveLE3OLSvHS95PzcTYzg8NbS2sG4Z9UHvUOMTByMhxglOJiVRHgr
	wwLThXhTEiurUovy44tKc1KLDzFKc7AoifN+e92bIiSQnliSmp2aWpBaBJNl4uCUamASv826
	SnXt3rjzG741/pGL3WnxP3zJvjn3XeexWD27HPHgGtvUhy4xnatPXW2xXf6/7+ndzriWjc9/
	6Yq+rS2Nv/B60d3DbUavpZlXpdl+4zjaJSYc2r505YPS7eXLrm/zuThttYggn4XggudRgtEq
	TOtXTet6s7iGmXk+79xjFR7rlkXKzrxz5LpbSZmdYLdDcqbS7F3plevNWC3bvCazH974vCXr
	LldG08+9sX/y5ievcy1XtFFZ53bL52fDnSiL5hcGzjo73qSm6j3M+mRYwGxrEVrVl8Z++PY3
	V6sTGs4CS5wcgj++NPu/0fh7wjGGKYseTX8ooj33tkTSqmNaLv/zi3XFD0t5lpx7bFCqxFKc
	kWioxVxUnAgAIb630N4CAAA=
X-CMS-MailID: 20241206025156epcas2p3e1ce9ff35589d821735a7c038b9ac9da
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20241206025156epcas2p3e1ce9ff35589d821735a7c038b9ac9da
References: <CGME20241206025156epcas2p3e1ce9ff35589d821735a7c038b9ac9da@epcas2p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_185204_120204_2A8EAD86 
X-CRM114-Status: GOOD (  16.11  )
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

Add support for the ExynosAutoV920 SoC. Basically this is almost
similar to ExynosAuto V9 or Exynos850 such as two watchdog instance for
each cluster but some CPU configuration are quite different.
Therefore device tree, compatibles and drvdata should be added.

In v3, the first and second patches were approved by watchdog maintainer and added as next-git.
- Link: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/?qt=grep&q=bt.cho

For the last third dts patch review, the patch was rebased and made v4.

---
Changes in v4:
- The first two patches were approved in v3.(1/3, 2/3)
- v4 contains only one patch that needs to be reviewed. (3/3)
- Rebase to the lastest master branch
- Link to v3: https://lore.kernel.org/all/20241021063903.793166-1-trunixs.kim@samsung.com/
---
Changes in v3:
- Add Acked-by/Reviewed-by tags 
- Link to v2: https://lore.kernel.org/all/20241010111807.3635504-1-trunixs.kim@samsung.com/
---
Changes in v2:
- Add a space before }
- Fix worng variant condition (cl1 -> cl0)
- Move the location declaring watchdog node
  to the correct location that fits the DTS coding rules
- Link to v1: https://lore.kernel.org/all/20240913080325.3676181-1-trunixs.kim@samsung.com/
---

Byoungtae Cho (1):
  arm64: dts: exynosautov920: add watchdog DT node

 .../arm64/boot/dts/exynos/exynosautov920.dtsi | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

-- 
2.47.1


