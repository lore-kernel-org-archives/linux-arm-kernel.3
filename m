Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F765F532C3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 00:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzQNKHTkEVAtgYQMHYZVy248jusM+FnEvT6P4WtJR6c=; b=WE/rBEMpuS7jURcp+IMpLwJ5ZJ
	hI8PKrDLLDeGhhq59DDJT95RM59ROya/b5Xtcz7UW3b0xf0B62Lyd2hnRRXh1n7cPvI9Q5sCPOW/Y
	RDf8iv4cw1MM4zxelLSe3DIcKC0VKmQfbQltEBlsRss84QTj2xlUtpOQXtk1QZS28FOvAUltNGNeR
	2zzA4zeUB6uC86T4AR4FCKCOimzrsiQmCpW2YRxjrAOUKSRXq71rhzlFc+Ks5S0uAYZz5dFQvNk96
	an04YO2g2y+Xp4lpaosQrlHsfDeuIAYsoSlUCNNfEeaSZ7i069NOjC3fw5CAjj8lCVrrDYXp0rZUA
	sh/QJ4DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4psZ-00000000Fzg-2Dmh;
	Tue, 24 Mar 2026 00:44:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4psY-00000000FzJ-0cGb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 00:44:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 879B3600AC;
	Tue, 24 Mar 2026 00:44:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FDB1C4CEF7;
	Tue, 24 Mar 2026 00:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774313057;
	bh=zzQNKHTkEVAtgYQMHYZVy248jusM+FnEvT6P4WtJR6c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=BCVLImsvOGIo0CPsj3MmbYWcVwQQHXRJd4BRw3lQWY/EuwPuDZKcgH9u7cdvlNpuq
	 K/M2VZg1bcrX5ieLnQWRnAMMJaB2Bpy7Sja96O/6UXSXv3QE80a94wFxj2EGAOpxO5
	 ZE4KTeCCmZy2IILNK+XkPTVS9Cemq+kWUSXvxEofSMX3Q2Zr5TD6vbpkv3BX0Nyslf
	 qmEc5Fqm3IrVVLeoZkgBJWH8kByl4Vlql+fT/GONQysuBAW1M3ylz4rTsUf2nlQzWL
	 YwAE7ldYXcwzT/tCMU7SXCZdRH1l9cpVFne6qaMMcYuwlK7fs8gDvGPQw75z+V2IID
	 YEndTnRkURoDw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260318110251.2412-1-mohd.abd.6602@gmail.com>
References: <20260318110251.2412-1-mohd.abd.6602@gmail.com>
Subject: Re: [PATCH] clk: uniphier: mux: fix signedness bug in get_parent
From: Stephen Boyd <sboyd@kernel.org>
Cc: hayashi.kunihiko@socionext.com, mhiramat@kernel.org, yamada.masahiro@socionext.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Anas Iqbal <mohd.abd.6602@gmail.com>
To: Anas Iqbal <mohd.abd.6602@gmail.com>, linux-clk@vger.kernel.org, mturquette@baylibre.com
Date: Mon, 23 Mar 2026 17:44:15 -0700
Message-ID: <177431305509.5403.15386021337517970667@lazor>
User-Agent: alot/0.12
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

Quoting Anas Iqbal (2026-03-18 04:02:51)
> The uniphier_clk_mux_get_parent() function returns a u8, but
> propagates negative error codes such as -EINVAL and regmap_read()
> failures. These values are implicitly converted to large unsigned
> integers, resulting in invalid parent indices.
>=20
> The clk_ops.get_parent() callback is expected to return a valid
> parent index and does not support error codes. Fix this by returning
> 0 as a safe fallback in error cases.

A large number will exceed the number of parents possible for the clk
and turn into a failure to find the parent in the parent map. There's
nothing to do here besides implement clk_ops::get_parent_hw()[1] and fix
all the drivers.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/log/?h=3D=
clk-parent-rewrite

