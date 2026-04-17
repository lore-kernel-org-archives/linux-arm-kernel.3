Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5AEF8DFF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 17:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8m/KTTmnq5PY9ru1DsdH08IpJYZRyWyKs1/HT27WEs=; b=W0KTb38fBnAH9OAz0BEjlz2oeh
	UACl0pXtTyskBQQt9mTpoirzHBmCBAjlo4Ov85k+C34Q+tR43I5cq6NpGpY0d4L6FoJuAVCz7fQsU
	hxpsnrgyjOGEWZP/A9Ix/r2X79vH7MkSRrCiE3kz6681utfexPM+weXlFmHNWfu8esUEEGQq0+84X
	ASWth9jM0dRPkta97wzDfnFTlUPpenO/CU+AYtNGA4vYcPepdfaD5q9Djee99a5ZZhakjLmNJxgcR
	aNNi+aIPNEyVZo8maftaCyt8N/iwADvItbJj3t6TiO4UIGAziykvreNOM6EOE94qMlfD9HFGZcbwS
	7v0DMC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDnHV-00000004KoD-2Jub;
	Fri, 17 Apr 2026 17:47:05 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDnHT-00000004Kne-0pLY;
	Fri, 17 Apr 2026 17:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=k8m/KTTmnq5PY9ru1DsdH08IpJYZRyWyKs1/HT27WEs=; b=G8ioTg1PqKwL/Klcpomt6dE9Xa
	JPpL9IJjXkGPag8r3o9xajKGIy4+9OeXkj2D8YjNECvgQYyIqbGBNLkfK8n0v2zLaNpkkzbUeWsIO
	UdQ7d8v4rw1Tr9oyOhpJcCg2Is/sNrdSW4x9Tl3TeSuoaCOxBHZbd+3k5tlxVQdswdWacHoXN71uh
	uO3smsPJZN8s46HtaAOfNz6/wHDxoox2OaYKSBtgqw3khAoHH6vZ2xn7YAMFylVphR5FxO6N7ya/A
	EgTsq2S/5sPLv3+4mXLX6Jn1Tg0EvE9JbVMvk5LXYzKaqRYWvmB2KYPhd1F1GQxm7Fpa772McW2xo
	klQbWTaQ==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wDnH2-00FY4p-1L;
	Fri, 17 Apr 2026 17:46:36 +0000
Date: Fri, 17 Apr 2026 10:46:29 -0700
From: Breno Leitao <leitao@debian.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Russell King <linux@armlinux.org.uk>, 
	Christian Marangi <ansuelsmth@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Frank Wunderlich <frank-w@public-files.de>, John Crispin <john@phrozen.org>
Subject: Re: [PATCH net] net: dsa: mt7530: fix .get_stats64 sleeping in
 atomic context
Message-ID: <aeJjcoHyezEgUG_Q@gmail.com>
References: <79dc0ec5b6be698b14cb66339d6f63033ca2934a.1776397542.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79dc0ec5b6be698b14cb66339d6f63033ca2934a.1776397542.git.daniel@makrotopia.org>
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_104703_276018_6C53F835 
X-CRM114-Status: UNSURE (   9.34  )
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

On Fri, Apr 17, 2026 at 04:55:57AM +0100, Daniel Golle wrote:
> @@ -3404,6 +3449,9 @@ EXPORT_SYMBOL_GPL(mt7530_probe_common);
>  void
>  mt7530_remove_common(struct mt7530_priv *priv)
>  {
> +	if (priv->bus)
> +		cancel_delayed_work_sync(&priv->stats_work);
> +

Shouldn't you cancel the work later, after dsa_unregister_switch()?

I am wondering if the following race cannot happen:

 mt7530_remove_common()                  someone reading /proc/net/dev
    cancel_delayed_work_sync()
      /* returns: work neither pending
         nor executing - true at this
         instant */
                                          mt7530_get_stats64()
                                            mod_delayed_work(...)
                                            /* work is queued again */
    dsa_unregister_switch()
    return

