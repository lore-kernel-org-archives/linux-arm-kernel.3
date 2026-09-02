Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6161C624D4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 19:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jnSQS+59sAn023ScLufGXF3PEXaKzhF98S+UMstx1lc=; b=HxaZuwIIcWbhafw9443um3JAux
	6kiwm9eJWpWycElD/9sGRszDONhTIZxTOKTaTa1L9Cq7bAC50KB9K76J198bLC4OowDiegTRJDUuN
	QfQ30rMFF+P/T/qMhd4zxNBH5y1Wi4cwfQ/+3qYKLaEevC3n+aQm7rHFaJ3ntaRKj9zE5rOMWWD9p
	I6EcEIvbzaIOO/uFvG4IihGVOrOKGo+KK9s3cFlfopVfc9S3ESXj/AFA8HU1v6GMM+UB8+8cTz0pB
	V1S74UMh08MgxveIvzYLcpSX1YNSlL6Qh8MDnT8JheQhr1J5Y61mJhcaH6MwhTvw6qcppuAlCuX7q
	QMFHwx2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qTA-0000000Fg5n-16i2;
	Wed, 02 Sep 2026 19:18:00 +0000
Received: from fhigh-a3-smtp.messagingengine.com ([103.168.172.154])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1qT7-0000000Fg58-1yZ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 19:17:59 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id D005414001D9;
	Wed,  2 Sep 2026 15:17:53 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 02 Sep 2026 15:17:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1788376673; x=1788463073; bh=jnSQS+59sA
	n023ScLufGXF3PEXaKzhF98S+UMstx1lc=; b=VrVWf6a9UPKdrg305szOCUUDYo
	Sp0iD5ijy1p9nHR8q5c28F7xgGZPuWWbly3iOsoM/dYISVPs0G4Cneyxq6DkqWOi
	C4sjKK69vTbeZDB+eUeynh3EO4vfOGtBIMKJGDV3ZeAaU8ranirvmUem0gjvnX2U
	RGh5e70LsEsRECmSlAIS5vgUselWBsy31xbzRAVQcDxubZ32MB0m8DMjuhYnorcg
	1fY//LsWVW1GKgMZ7EcITa7A6GspPqQCyn6DD/6GsRSBf4Lq5Gv+JM2Xd5OONjw5
	BYSzbqZhc/fHfamNva3LL0PJ7qOT32Xqij0XFokfM81n70MV7xc05lxNt+PA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1788376673; x=1788463073; bh=jnSQS+59sAn023ScLufGXF3PEXaKzhF98S+
	UMstx1lc=; b=Ji6QIxZyg9T1q4N6YJxZA1/nRgjprwJW3SnkSysmK/ARkZfIzII
	gNehXwUXuQGHkam1b1SuarWWK0dE9dGnu9PLRyggQhyJTQXLDoNn5NJji3PTt46/
	2k95VtioVf9qQFwh6BOR5wuTkFDfGvuCtOHBYMNQ+n+HFKGNlEB0ki6MCgA8Gf4S
	LkAxr6YrULhEDQGGw7yIGpM7m9LYhGIoBgblmGcwk2HmqKoc8Xvp6lxt1wv8C26Z
	ZNsY0A8gazNDmrV4bsNv/QnrADGL3TUwewxy9oCDlALTaluSy3iQqqBEVeKEnsh1
	hzeA/ipb7fuNh4A0D4l0lLsR1+pXEfyp9ww==
X-ME-Sender: <xms:YXaYapMnPZt4Y8vNek_hrIIf9eRp1DrcpRJ587AusZaHDXxikXH8hA>
    <xme:YXaYamUAUYdE0rIe52e7hYDXIJ1ZTBXQIO6M954w1r158Feg3dYrZdLEMo0vea-1k
    qmBlq5LUJiEHm_seCFSNzDeJ-9J8aiGUKfDYrD2ykVd0CbnEJwQgIg>
X-ME-Received: <xmr:YXaYauaIugNURUEXjJsBfTQKnknRiTdKTdMI0rhvBfOBXSCW51a6zyJc_1ieDxv5d1uJfEt41vKpJeHBF6mF42KtsqxTorKtDvQ>
X-ME-Proxy-Cause: dmFkZTFNeG9wL1jmByV8JeAcTlmp5YL5U6Y3eBgFsSXHg6DmkaijU0ssHyoyVszpyESsNf
    YVjV9kD9JWyOCkANgDJYzCjki/1IxcsQiWPcKSpJ+EGGcYu7ao775EpIWaJupmDVBfCk93
    55Z1pVyK5puxBzOCtRKrJuNsITOy73F5tgxgoW56k8RxAiGMOGt9WQxfVgyPkVWis/uanl
    Nv/YvOP8Axxd69gE+8ik991GZBU/85+LLaUsE+eR5T4tgiYLtzYFMR1asii8utcD5p5yej
    qjgZTYEDfItUlVKcmTq/0xSMcopqZVwLPpYSwJnJzTIXLe0JpqgqLgPGl1+c/7OXEbtXNp
    Gg2VUsQFzZXhbXNiEko3TkdwV+gx+qbKltEMPjwU0eWpZJ0MJyS4OfLJRu/hLid1jwFHBV
    QU0AULrrRA4DDNSnrMYspfQKcH1d1k7sRM6+d0isySg4Afj5g4X6HlNsByCX3iof68UdO/
    xY8erJNf0U3rZWdqWMfFcLGe6QmnaSOFLcZQXIx4mb6xHp3/hjxECmfNA3EZk3Q0w1sn5e
    XGDFJjpQrwMJgsXNNA4mfF4r9NTidrYjbcrVZhHyNATP45TB07DlEW2MBAZPSBjtPXXsNI
    PqT4FaXkmSRcgNT9Zf0ShwOSjdMIz74p2ZYuUoPXEnk7kuWvLqaVoqzspdwg
X-ME-Proxy: <xmx:YXaYag0S2vDwHu_p7Cxk3DhonJQncY7vZuTgYvLh38ssr83oKrsjTg>
    <xmx:YXaYaqBiOPfPMvjdryrZb8gCFggySriTMaY4TalM17_9nBqU5TPRtA>
    <xmx:YXaYak8xyMpouitYfA5jQMdBILF8r8_BJQ6KWH1nYGC3UMzPSTefaQ>
    <xmx:YXaYatVoQYvtsUHoGJvfU2tGsYMDgdOVJob6r5CD_MSe9ZGqhnZjeg>
    <xmx:YXaYam070VTWFreJM3PZUZ4ZCeChshWewWG4m4XG6oZnwZoZXezGqwV1>
Feedback-ID: i47b949f6:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Sep 2026 15:17:52 -0400 (EDT)
Date: Wed, 2 Sep 2026 21:17:50 +0200
From: Janne Grunau <j@jannau.net>
To: Sven Peter <sven@kernel.org>
Cc: Neal Gompa <neal@gompa.dev>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Hector Martin <marcan@marcan.st>
Subject: Re: [PATCH v2 2/2] iommu: apple-dart: Support specifying the DMA
 aperture in the DT
Message-ID: <20260902191750.GA2760037@robin.jannau.net>
References: <20260831-iommu-apple-dart-aperture-v2-0-d16ce3770299@jannau.net>
 <20260831-iommu-apple-dart-aperture-v2-2-d16ce3770299@jannau.net>
 <2b95fa20-22a5-4ef2-9ea6-c6fb7d1f16ac@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2b95fa20-22a5-4ef2-9ea6-c6fb7d1f16ac@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_121757_774416_C73102F8 
X-CRM114-Status: GOOD (  14.21  )
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

On Tue, Sep 01, 2026 at 10:45:52PM +0200, Sven Peter wrote:
> Hi,
> 
> On 8/31/26 15:46, Janne Grunau wrote:
> > Apple DARTs are often connected directly to devices that expect only a
> > portion of their address space to be used for DMA (for example, because
> > other ranges are mapped directly to something else). Devices can specify
> > the start and end of the aperture via "iommus" args if the DART device
> > node specifies "#iommu-cells = <5>. Aperture start and length are 64-bit
> > values as apertures above and larger than 4GB are used.
> > Limit compile testing to 64-bit architectures to avoid warnings in the
> > calculation of 64-bit dma_addr_t values.
> 
> I don't see any Kconfig hunk below, did you drop it by accident?

yes, I accidentally removed the Kconfig change and then confused myself
with the `b4 prep --compare-to v1` into thinking I added it.

> Otherwise:
> 
> Reviewed-by: Sven Peter <sven@kernel.org>

thanks

Janne

