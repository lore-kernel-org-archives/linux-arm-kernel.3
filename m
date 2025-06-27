Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B467AC7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 12:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVvAK7b3Zpgjze3EOECMmyaomGUOJszYV73LMM3I2ns=; b=ZQMgmC5km72lfiNNqjg9t83W+D
	UK5hoNwW7crJEKBysnTp+5xkEj7FUQ4PFzFqPDDrBz9dWmqyuAnzPXuRucQd3HBBY3awOZ5ByVHmD
	kj8y8616FFEb9rf6/IhTwV5Ffaw94y1mbKaMBDLEUyhI3vWPEpuZ/ak1W/fafVIM7gRxYCi5CnIIU
	OLo2fyMUzwr+4UpJ3WfW7+skEVc2+UIiyRMf+X0TQ9qT59ib9qNYZ3vrzkGT+m+f0GXPfUa54jvoc
	aD47dYmrhn0za+7Z/808soNA88axYNDjxrRELkz/40k8Qhgdo78wDE0KoDG8nl0lsek/7aV1e7SUg
	KmgJDKJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8dl-0000000Ehkb-2LcK;
	Fri, 27 Jun 2025 12:57:13 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV7vQ-0000000EbX6-1z56;
	Fri, 27 Jun 2025 12:11:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1751026271; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cb17DRa+OxjLrwffY5Uj3xYEaiaGmne6sU848NVhVV1eQ3rhc537meq1Vmf6aIAVEs8nNK8x3A1ar3Hw3mvWcMTg25AROWNwkRtKrwkMSTtLzkf0NYz4C4bcsQ6p0iTYFhLxAOOH9LHep9vUB1XeWUPW7zCH9CsvkOEGNlDgUV8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1751026271; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=TVvAK7b3Zpgjze3EOECMmyaomGUOJszYV73LMM3I2ns=; 
	b=WA0HZvOONA5TpwnslXEz/Tkkc9MDxU6c2rMp/t+aX6OQWc9kMV25X+fdRg05rlxhvNGd8BHJ1ootFnV7okW034JUgGXTxOYiyuZLWDTgusN11QiY9FC+5Vtfgao88aS34shPiw5TKTH+blnhk0F3AOoAh4DW7B4dfpBFHtgT3eo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1751026271;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=TVvAK7b3Zpgjze3EOECMmyaomGUOJszYV73LMM3I2ns=;
	b=ctkqGwwlGpULEtLxxvVc8Kv7Mc/irU8SYUzepCakFCtCNMUKyZCUc1/g8YLkXn4j
	R6RXe3YzTCP7wA8OKF1WFVZ2kNzFzNc9pzEPJHBynaIVMNJoiZHxNoGSBPYPx9ZJxb9
	LRiqAZkXcSwurY/h1sJcEwPlW07qbKyZXG6gXr40=
Received: by mx.zohomail.com with SMTPS id 1751026269193941.7172522916828;
	Fri, 27 Jun 2025 05:11:09 -0700 (PDT)
Message-ID: <903b8ec6ab8527e680b43dc7cb8aa7066a555247.camel@collabora.com>
Subject: Re: [PATCH v2] arm64: defconfig: enable further Rockchip platform
 drivers
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Heiko Stuebner
	 <heiko@sntech.de>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
	 <will@kernel.org>
Cc: kernel@collabora.com, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Fri, 27 Jun 2025 08:11:06 -0400
In-Reply-To: <20250626-rk3588-defconfig-v2-1-ae6720964b01@collabora.com>
References: <20250626-rk3588-defconfig-v2-1-ae6720964b01@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_051124_544937_405FDE14 
X-CRM114-Status: UNSURE (   9.40  )
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

On Thu, 2025-06-26 at 22:41 +0200, Nicolas Frattaroli wrote:
> Enable the rockchip-dfi driver as a module, which is used on RK3588
> as
> well as RK3568 and RK3399 to measure memory bandwidth. For this, we
> also
> enable PM_DEVFREQ_EVENT, which is a requirement for this driver.
>=20
> Also enable the rockchip-rga driver as a module, which is used on
> various Rockchip SoCs, including RK3588 and RK3399, to provide 2d
> accelerated image transformations through a V4L2 interface.
>=20
> Suggested-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>


--=20
Thanks,

N=C3=ADcolas

