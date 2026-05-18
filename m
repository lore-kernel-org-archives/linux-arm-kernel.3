Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BDCCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 21:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fy1HBFVuO0GJ4o0p11RLty2yKXcghAkaNBsukWq8870=; b=sP7p712lN1ZmjIrRpwzDI/dsVN
	jeY8Iv7hkzhn616gZgXLVaQf4oyPbuVNcqhzpyIRWeuSRNIbmWNb8gQrhm7wdwx81VBCr+rDaKcrt
	OSPivFJQ5uYEAfphCgWt/iLEsKQzw7wfyGlRYb2ed2MY9PrOzK0zqB1AXxYIUO3ijN3JsYZpztqQd
	n7aqTVzUnuXt0xKtfBlhafzcBPQDkjza7jKfrnVm6qGlbt+trxRknbb/e1jwUdf15CzYhodwtyXCm
	AZu6rFlp8ASpspC5O9p0rC3RyIgvW8s48baLeJUx1imJ91QEvNGS6xqt8jYjrBfiQb7vl25lyaZ4J
	/zQVXaaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5qs-0000000H2KU-1yZw;
	Mon, 18 May 2026 21:50:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5qr-0000000H2K9-34Vy;
	Mon, 18 May 2026 21:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=fy1HBFVuO0GJ4o0p11RLty2yKXcghAkaNBsukWq8870=; b=pOS83YWVtXk7JjEx5UQDv2tmhN
	uUtw4kBpiwQBAIH1ENn5cy0zMz3ksAIO+IYMXP8o94X1/6A9wh/oRBXvSErRuEye2Yk5IQd/Hxl2x
	HAvYzxGaxfPIMaOpOkDFVMEPBB/ToXEGCQbQVXyuD86ePU78dQBTnynzuHnMiLTgEXvZTB9EFuRF+
	QqeKiGf3O2OVZ61bCcAm69/8MoXATh39NSN2y+gp1tMRY4ZX0jroOU54I/PEZLBPeRMTcXEdQ5IA1
	jvguieBHlA7I99EFDZOD7W/Uq2h4PT+GoIoyoVnaflNu0iPCC17GCpAd85ziHC6zP3e0BPE5cLhxf
	sekawg9Q==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5qX-0000000CQ3N-3Rxb;
	Mon, 18 May 2026 21:50:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 958E242A9D;
	Mon, 18 May 2026 21:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72344C2BCB7;
	Mon, 18 May 2026 21:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779140993;
	bh=BCGSqu4+tudCgoGPI93aYjf9oZVk8EXFJax6d4C+gqU=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=jVKkLixeYzQCESMmdpBM9gDq8wylpSSYAhoz/4BwiMZAb+st0HmL67KfdXstWd8CD
	 2yxdvNaCnWIYCq1s5KKlt6IQQWo7HgQGjGiImraJJsCh4TAUlFLsIOeo0ijNv3+jX8
	 JXbydklE6vPhGyZqGnjXnOs6RSgqxv4XAwlWimH2MxbU+LeycUTGdzyYKgciYkHPjB
	 o2QJk940DzsKMmJWidNYaZ3hET/LUpq7wk1LQhpDtMTPNB1OHwXe3GDNmVypt8E+Wl
	 LrIAYUaAA56cHch+H8gYT2S9bUCsv/O4XSfIlc3hSKcQDvqXGBUIzf8w4mch4UGXJV
	 P11EUBVuvYcrA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 19AF23930CB1;
	Mon, 18 May 2026 21:50:06 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] Bluetooth: btmtk: fix urb->setup_packet leak in error
 paths
From: patchwork-bot+bluetooth@kernel.org
Message-Id: <177914100464.1984363.3049951945476473554.git-patchwork-notify@kernel.org>
Date: Mon, 18 May 2026 21:50:04 +0000
References: <20260518022402.20398-1-liujiajia@kylinos.cn>
In-Reply-To: <20260518022402.20398-1-liujiajia@kylinos.cn>
To: Jiajia Liu <liujiajia@kylinos.cn>
Cc: marcel@holtmann.org, luiz.dentz@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sean.wang@mediatek.com,
 linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_224958_848866_52DD9043 
X-CRM114-Status: GOOD (  10.23  )
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

Hello:

This patch was applied to bluetooth/bluetooth-next.git (master)
by Luiz Augusto von Dentz <luiz.von.dentz@intel.com>:

On Mon, 18 May 2026 10:24:02 +0800 you wrote:
> The setup_packet of control urb is not freed if usb_submit_urb fails or
> the submitted urb is killed. Add free in these two paths.
> 
> Fixes: a1c49c434e150 ("Bluetooth: btusb: Add protocol support for MediaTek MT7668U USB devices")
> Signed-off-by: Jiajia Liu <liujiajia@kylinos.cn>
> ---
>  drivers/bluetooth/btmtk.c | 2 ++
>  1 file changed, 2 insertions(+)

Here is the summary with links:
  - Bluetooth: btmtk: fix urb->setup_packet leak in error paths
    https://git.kernel.org/bluetooth/bluetooth-next/c/5daf96ab8398

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



