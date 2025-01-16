Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A09C02183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 22:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oue/x3nxo+KXuyCUye4CeghGMmHB2bk2b2leGxAQFZU=; b=O6hIBTu0l5W/46djBeJHeiHGIT
	JlDTD2Tjl/jwjWJ7m+3KKu1v66g50mrZuooOvCq6LKOs6UhrJyweWwuk64zp4VGqyKwixDBM4nR0E
	Uy3rilTlNrQpgJIvmiTmpYCtPQO7zj0rA2J5wcIukjnO+h8tgmzqNQQ093GnrE9XSOzq00Sdxr4aQ
	Z1BBFAblclTnbAz85uYhSvjOskrC/9hjx5lwG61EqSy0QOfjktx6nPogXmVtwOQvCOu81PE3kLf1R
	UrGAxIM8scSAJD/ze8WEwbMQXLexYVLyjrED0s0KoXgX3MR8/017TJwsQnhMdnEgbzZVYeYLsqdnZ
	KgqnJb+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYhd-0000000GFI4-1dua;
	Thu, 16 Jan 2025 22:51:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYYfc-0000000GF1P-0T7I;
	Thu, 16 Jan 2025 22:49:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B80B05C5E76;
	Thu, 16 Jan 2025 22:48:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11E6AC4CED6;
	Thu, 16 Jan 2025 22:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737067739;
	bh=oue/x3nxo+KXuyCUye4CeghGMmHB2bk2b2leGxAQFZU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=MhNLHx6hGWNBa52Q5X84aXJPjmr5SQO0s+Osnr90drfMkE8wsMFAR53xYqkYFRrct
	 fH7FrGY1ie0feqBRNhGtJVQdLyDPzo5NRp7f1hcZWFWwTSliWzMyhNbLphoWoI55Eo
	 YJnEkyoz8YiaSzqI1B/K4SPhs6tM1gVPKQJZ+cvh+rvF4l8qx80kv59QyNG12A0YnJ
	 N+0udJlqT+huBqGCv3cvOakZyIqruwmDJzYuIIxmLiM3dqHlBD5YCQvJzoO6x/w7V8
	 0my8PCnaILwHrPH1DTdufsfV/ke2zbPHgFv8uX7BBcyeGc+M0NNeR0JXzOMHIEAs8B
	 BRga0qy0zpvlQ==
Message-ID: <3933901cddf6c33bbe85e381cae5b3a3.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250116044907.2947218-1-joe@pf.is.s.u-tokyo.ac.jp>
References: <20250116044907.2947218-1-joe@pf.is.s.u-tokyo.ac.jp>
Subject: Re: [PATCH] spmi: hisi-spmi-controller: Drop duplicated OF node assignment in spmi_controller_probe()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, konradybcio@kernel.org, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, marijn.suijten@somainline.org, bjorn.andersson@oss.qualcomm.com, abel.vesa@linaro.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, mchehab+huawei@kernel.org
Date: Thu, 16 Jan 2025 14:48:56 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_144900_187442_06467770 
X-CRM114-Status: UNSURE (   6.90  )
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

Quoting Joe Hattori (2025-01-15 20:49:07)
> spmi_controller_probe() assigns a parent device and an OF node to an
> SPMI controller. However, the operations are not needed as they are
> already assigned in spmi_controller_alloc(). Thus, remove the duplicated
> assignments. An unnecessary OF node reference acquisition is also
> dropped by this patch.
>=20
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> ---

Applied to spmi-next

