Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E3CC88E41
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 02:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:In-Reply-To:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nobdwUh78N0lwa7Juyg7zXqI0l6ZQkrO6PqvD0/2jM8=; b=Q1jI486E1qxV1v7FHA+w82vWQm
	ZrDvRBdMtwg25Ik0cu9w1Dww+cuF/cNqgXCV9Ozg3C7dYRqudv4CQAWiTJjXwuBoKNEJrUM59cec9
	l504XITSrwFTVIgQ6Ex84qxqqib+yQWM86Z162P1iE5skYAa4xVgXc869zqxJI5fTkO4rf6dHG+PG
	1m8EkRpNUuoPGtzI1YlMkuWgAXLkxcQJfmT8ocP3kRuIf4EAd7go+mAziFjXlpWs8xmHL0OFg3Uhn
	QSzmNGwN7keLnp1komUaFjsExcUV9C20najcDGwh3ocYBagouNVXfaAt1VXDoUgnokceZZFzsbEQK
	soHH1h0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qqP-0000000FhKD-2F2Z;
	Fri, 11 Sep 2026 02:18:25 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qqF-0000000FhI5-1GZs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 02:18:22 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260911021803epoutp049180afd4f10c1e1de9817f94d5350eed~UIq4isGbB1571815718epoutp04j
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 02:18:03 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260911021803epoutp049180afd4f10c1e1de9817f94d5350eed~UIq4isGbB1571815718epoutp04j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789093083;
	bh=nobdwUh78N0lwa7Juyg7zXqI0l6ZQkrO6PqvD0/2jM8=;
	h=From:To:Cc:In-Reply-To:Subject:Date:References:From;
	b=CVrpVLtGhMCJ1RbcegGK/DVMTSMHzCuCRYKOtLJttwxNKCQvk82pz9MdRZI2P6DOa
	 BoUKrXNnPbCjJbnEYpjf/jhaU7k1+arZLETiP6XGnckOFU0Z5nx6LWt2NBxMOKUbr9
	 OTWKd2gkx7vNJw3LCnRo2X5vIGCnEAhpooV1b2qE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20260911021802epcas5p28c0adc2bde933b8a6b454c74852291bf~UIq4Jv8fu1335513355epcas5p2M;
	Fri, 11 Sep 2026 02:18:02 +0000 (GMT)
Received: from epcpadp2new (unknown [182.195.40.142]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4hgyrB5plgz6B9mJ; Fri, 11 Sep
	2026 02:18:02 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260910151926epcas5p2b0279e476b522f7638315e16eae61ab2~T-r2HCKJJ2363923639epcas5p2g;
	Thu, 10 Sep 2026 15:19:26 +0000 (GMT)
Received: from INBRO002756 (unknown [107.122.3.168]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20260910151925epsmtip27b81f9a7a604224d26f992bcf2acea8a~T-r0veMv51938519385epsmtip25;
	Thu, 10 Sep 2026 15:19:25 +0000 (GMT)
From: "Alim Akhtar" <alim.akhtar@samsung.com>
To: "'Krzysztof Kozlowski'" <krzysztof.kozlowski@oss.qualcomm.com>,
	<linux-fsd@tesla.com>, "'Krzysztof	Kozlowski'" <krzk@kernel.org>, "'Peter
 Griffin'" <peter.griffin@linaro.org>, "'Rob	Herring'" <robh@kernel.org>,
	"'Conor Dooley'" <conor+dt@kernel.org>
Cc: <linux-arm-kernel@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
In-Reply-To: <20260909-dts-samsung-cleanup-strict-v1-1-1b755a446b22@oss.qualcomm.com>
Subject: RE: [PATCH 1/5] arm64: dts: fsd: Fix indentation of CPU nodes
Date: Thu, 10 Sep 2026 20:49:24 +0530
Message-ID: <339099861.21789093082802.JavaMail.epsvc@epcpadp2new>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQI+vGmeAYQ1M8KGwzLNRALcGC0DngHz7T+SAZgkCOq16JXm4A==
Content-Language: en-us
X-CMS-MailID: 20260910151926epcas5p2b0279e476b522f7638315e16eae61ab2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
X-CPGSPASS: Y
X-Hop-Count: 3
X-CMS-RootMailID: 20260909141809epcas5p3e4294752e988d2eed9ec132e5b40f1c0
References: <20260909-dts-samsung-cleanup-strict-v1-0-1b755a446b22@oss.qualcomm.com>
	<CGME20260909141809epcas5p3e4294752e988d2eed9ec132e5b40f1c0@epcas5p3.samsung.com>
	<20260909-dts-samsung-cleanup-strict-v1-1-1b755a446b22@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_191818_264349_F9484256 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Sent: Wednesday, September 9, 2026 7:48 PM
> To: Alim Akhtar <alim.akhtar@samsung.com>; linux-fsd@tesla.com;
> Krzysztof Kozlowski <krzk@kernel.org>; Peter Griffin
> <peter.griffin@linaro.org>; Rob Herring <robh@kernel.org>; Conor Dooley
> <conor+dt@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org; linux-samsung-
> soc@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
> Subject: [PATCH 1/5] arm64: dts: fsd: Fix indentation of CPU nodes
>=20
> Drop one tab too much to fix dt-check-style warning:
>=20
>   fsd.dtsi:198: [indent-consistent] indent mismatch (expected depth 3 * '=
\t')
>=20
> Signed-off-by: Krzysztof Kozlowski
> <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Alim Akhtar <alim.akhtar@samsung.com>



