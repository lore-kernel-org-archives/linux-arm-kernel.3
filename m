Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3299DC55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 08:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3RyuYiWkIsIF0bnbFXnZIsZlBEwacFAb74eytrnFkrg=; b=Z+nR4j+skm2TsO8bws6RKW9aPP
	psDAOp30LKrDCsY4lTu7G8O05F4OtlptwDEoNSK4o7emm2xKIMAoU2uuW7S5LX4/ubUG55veCFTiA
	YL6qHeRkQ5YVkURt0kqVnd/CInD/eids2XPnY418yTJkjp+Bw5JkQbkTtmRc7OqsSLt2T6Zt0Zzeq
	bQo2U2e4owW91ntDMwOa63TGsn2PCMQoQ81O0BAH2QoBLM4leknUv5Ufg5e6dbe2gELCjLuWSr8Ik
	Xl7Q4h9XWYYQsK2XUoomuf7I/d9eUCSczPV/gfUjRj2+18d1w5pP5gqfqX/Zk4pKLh8YPZNhoVVB5
	idawJzmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLuE-00000009pP1-089H;
	Thu, 30 Jul 2026 08:14:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpLuC-00000009pOh-3riW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 08:14:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 13546600B0;
	Thu, 30 Jul 2026 08:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BC651F000E9;
	Thu, 30 Jul 2026 08:14:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785399255;
	bh=3RyuYiWkIsIF0bnbFXnZIsZlBEwacFAb74eytrnFkrg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BD5GWOyQjPssy98jae4bLRoyAJ20Bs0VG8QulCZUq/ZcBjS1vOtC83sv0ROFEBJB2
	 5qMmX2P4GqYz/Nv7+WpJyyQ3s/Dhim+t5UpufxsvaZ3WodxjF1b8BP3UVlM1kqnJg8
	 MAXK2dqwEjZuqfTW5ZFmB3qxahgQkH+rbBJjvvB6QK70Va0rEfVF/nNEntpg9HQiMD
	 pYnfwINAWUg71whVrzTPbo3wZGb7LVcxiU8qwv14igcfBEX/5FWHnXhLW/ziNtfKDN
	 4iLwmM7dNm9nMHYGIG/eyC4ZCoQ06sNI9+lvm8i0d9zptN759MPrCzbmZsR41rWKCo
	 VFNIKLeTVUKKg==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Paul Louvel <paul.louvel@bootlin.com>
Subject: Re: [PATCH] soc: fsl: qe: properly scan GPIO nodes at startup
Date: Thu, 30 Jul 2026 10:14:03 +0200
Message-ID: <178539922190.574381.1359588018451529893.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <04dc047f8958a78a920f0a88ca3bd8bf70c56187.1785333986.git.chleroy@kernel.org>
References: <04dc047f8958a78a920f0a88ca3bd8bf70c56187.1785333986.git.chleroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=666; i=chleroy@kernel.org; h=from:subject:message-id; bh=afjedPbY+ONakwbpJQf2IsSZEO+cCH0rwLmfP4Qd6mw=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWRls5/5EOHyML93C3Ob6yNlge9rg7LW2ltcmmAhZxKly XV9TR1rRykLgxgXg6yYIsvx/9y7ZnR9Sc2fuksfZg4rE8gQBi5OAZiIzBJGhtbPk7asWSxQbn/8 rtvX3+sSN7drGoZt5u2aPeOvzMTG3LkM/4NE7zaqijrrdju9eB1zPtJG5M3p8oIOzvr47MdHpcw ZuAE=
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
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


On Wed, 29 Jul 2026 16:10:36 +0200, Christophe Leroy (CS GROUP) wrote:
> Before commit 156460811def ("soc: fsl: qe: Change GPIO driver to a
> proper platform driver") qe_add_gpiochips() was walking the device
> tree to find all nodes with compatible "fsl,mpc8323-qe-pario-bank".
> 
> After that commit the discovery is handled by the platform core,
> therefore it is necessary to call of_platform_default_populate() on
> the par_io node.
> 
> [...]

Applied, thanks!

[1/1] soc: fsl: qe: properly scan GPIO nodes at startup
      commit: cf91e5909e620b77164b53c9b316a5c1f11f9ea7

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

