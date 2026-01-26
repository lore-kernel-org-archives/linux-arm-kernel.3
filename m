Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFDBD19510
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 18:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZKDHgurtFd7YxT86rQlbdG/VJyEjIfL7f4+CcLVwL54=; b=oJM43s39Kzn/pHkxcK4ypf4Diu
	6F+K8X97bsykHNW2HwLab0FXWmY4rLjcRwFBnpYrX84nPfHMnPqnOBoVX8bmzEDqME6u/x6WlxAbP
	88BrCBgDbRpCqq2CKm97O6aOmNpCyc4FGMkIyhceIG7hqYiQZhBq6SFF4tgf2QGkrqu1dmcY0h4vC
	Q23df5qVpDhfRmxpz5PlMp9REQN56+M8yIoYcNe++9RrAzNwZcCxa326EW69TCrI+1B520vDRuWfG
	npgF5Ig0ab9R1z6GoWvOEIjPraKV1EjMaSrFtM+VxSOZJjJxNJVDqoZ/9w22BfO81gM1030XDJ9+O
	qn1diw/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRP5-0000000D5X0-1jGM;
	Mon, 26 Jan 2026 18:33:35 +0000
Received: from sender4-pp-g122.zoho.com ([136.143.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkRP3-0000000D5WP-0Df6;
	Mon, 26 Jan 2026 18:33:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1769452399; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lJL3A9t9hmeTtDajEyOkcB7e2cd5TG4b4Mm+yQFnozAhSMng9SI4XbvIKw6YGI+641gPVWM0kAyHynfK8UgMFjLwfdAhl6WHeKldIyfEmGvhK3EeBj+Grp5ji4pWWOpkRVj1UedI3riZ+YRr1TG6AxBxhhugeeNio8zISiX813M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769452399; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZKDHgurtFd7YxT86rQlbdG/VJyEjIfL7f4+CcLVwL54=; 
	b=lA3avtEDxa/f14kgneIL51tIzq2V6QsJMZrSUk/sooYTYFX/qVYBS35figX7L2ohZldRairwkC4hNi2wZTI+saZOnhX29EkBog0SOiioxsyoNhj8LzQXLvCX8lE7/kPyQH1ANwl6oaE24TihGOgo2jycbzcBE2v7v5dgrVhcPqs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nfraprado@collabora.com;
	dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769452399;
	s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=ZKDHgurtFd7YxT86rQlbdG/VJyEjIfL7f4+CcLVwL54=;
	b=X3X0uLS2FXPBFTY8Uw+CeJHu+Xve6rL0yiIuu4mbKQgR3/xqtAJo948sp0mfeXa1
	6xz5nqTuHBaRxNjZ0o8OyWHbczBaCzLE9LX7t0qtCzUE9ZHwtc6NrMakiIVk5K0WzXX
	/kS/B1nG9NNd7IAInYGbfX9LeIwYhC2AO5wFNjTs=
Received: by mx.zohomail.com with SMTPS id 1769452397997823.5064676659088;
	Mon, 26 Jan 2026 10:33:17 -0800 (PST)
Message-ID: <1b66343c76e5b66c696c1fd8a148df299cce60dd.camel@collabora.com>
Subject: Re: [PATCH v4 1/4] uapi: Provide DIV_ROUND_CLOSEST()
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Maarten Lankhorst
	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sandy Huang	 <hjc@rock-chips.com>, Heiko
 =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,  Andy Yan
 <andy.yan@rock-chips.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed	 <hamohammed.sa@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Date: Mon, 26 Jan 2026 15:33:11 -0300
In-Reply-To: <20251219-rk3588-bgcolor-v4-1-2ff1127ea757@collabora.com>
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
	 <20251219-rk3588-bgcolor-v4-1-2ff1127ea757@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_103333_134033_E8411FA8 
X-CRM114-Status: UNSURE (   7.71  )
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

On Fri, 2025-12-19 at 23:46 +0200, Cristian Ciocaltea wrote:
> Currently DIV_ROUND_CLOSEST() is only available for the kernel via
> include/linux/math.h.
>=20
> Expose it to userland as well by adding __KERNEL_DIV_ROUND_CLOSEST()
> as
> a common definition in uapi.
>=20
> Additionally, ensure it allows building ISO C applications by
> switching
> from the 'typeof' GNU extension to the ISO-friendly __typeof__.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

--=20
Thanks,

N=C3=ADcolas

