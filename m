Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51918FCE091
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uA5Zk/FAFPoXM9HYbQGs/07GbIQjoWnoGZNlTmfaEUw=; b=p0luH52g9J22BA
	jUGufTRSa+Mun8+xJXomQINO2jy73pYZA8wpIt+imdaqMg5mkGQ1F0Oj6/P7xmbBzZxdTlUVV60gD
	Ik45qG3jQKx5J9dbCVA49Fzoqs5ZM+5xaHwkQU+0dI9nGuSzNsqRWW7dYpKmMPiPb2SOkTis/enZ2
	xzGA+DtpPlKsNAt0kTeAGiCz5Udw7HPnbKhoItJITSkSbDM/Vn8O2ToTs8T7ab4y7sFYoPHnb1R7a
	e0V3v1r02JPqWe1Gjr0+bDzi3yCyhAgB71Nc6KqygEH+0E9XvUDnOD+BqWdkbvgtuLCOtpm9MOm10
	M17GJXDKy+VcIj1gsP9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcLK-00000006LWy-0Xbx;
	Thu, 26 Feb 2026 14:27:54 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcLI-00000006LWa-04SQ;
	Thu, 26 Feb 2026 14:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=uA5Zk/FAFPoXM9HYbQGs/07GbIQjoWnoGZNlTmfaEUw=; b=ezQqxS/GvAZg6tPm+7TafBbDIA
	pl4J89bFjjbp5ASbnepvf3lTkfXt8GqigtkK4gKRRizwff3F/bLZbBjwST4xBQHZIau3R0rs2GfaB
	IKg2vTguXgq668x6g3qQPAg3uGb3Ko7/WP9RJSynJu/dTPSkliFirSoj37TiK9sL6EY0=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:33022 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vvcKx-00089B-NR; Thu, 26 Feb 2026 09:27:32 -0500
Date: Thu, 26 Feb 2026 09:27:30 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: robin@protonic.nl, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dmitry.torokhov@gmail.com, hvilleneuve@dimonoff.com,
 mkorpershoek@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, lee@kernel.org,
 alexander.sverdlin@gmail.com, marek.vasut@gmail.com, akurz@blala.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Message-Id: <20260226092730.3dd39a4e55e8756e2fbbe927@hugovil.com>
In-Reply-To: <CAMuHMdVd0Ds5vHQa+MG2E+E36qAu5HQE3b+Vzpbv84MM=2DFWw@mail.gmail.com>
References: <20260225155409.612478-1-hugo@hugovil.com>
	<CAMuHMdVd0Ds5vHQa+MG2E+E36qAu5HQE3b+Vzpbv84MM=2DFWw@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: Re: [PATCH v3 0/4] input: add GPIO-based charlieplex keypad
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_062752_143386_D4429F5B 
X-CRM114-Status: GOOD (  27.85  )
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

Hi Geert,

On Thu, 26 Feb 2026 10:20:33 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Hugo,
> 
> Thanks for your series!
> 
> On Wed, 25 Feb 2026 at 16:54, Hugo Villeneuve <hugo@hugovil.com> wrote:
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >
> > Hello,
> > this patch series add a new GPIO charlieplex keypad driver.
> >
> > The first two patches simply commonize two properties that are present in
> > a few bindings, so that the actual patches for the charlieplex keypad driver
> > can reuse them instead of also redefining them.
> >
> > I have tested the driver on a custom board with a Solidrun RZ/G2LC SOM
> > with three charlieplex keyboards, all connected thru a single PCA9416 I2C GPIO
> 
> PCA9416? The closest I could find is TCA9416, which is something
> different.

Its a typo, it is PCA6416, thanks for catching that!

Hugo.


> 
> > expander.
> >
> > Link: [v1] https://lore.kernel.org/all/20260203155023.536103-1-hugo@hugovil.com/
> > Link: [v2] https://lore.kernel.org/all/20260213171431.2228814-1-hugo@hugovil.com/
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 


-- 
Hugo Villeneuve

