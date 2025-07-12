Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AF5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 12 Jul 2025 09:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bs7C3OuDjp8spBtZUebXmMmqp+JNJ8zM38bJKoNTVC8=; b=KP6cnnkFZ03WqvIWGbsV+Dgevl
	V0jvYSM4D6iIBjdGEXBPX9aLkFMRQv7YnqNgzIYObyowXSGoJoOC6uanGIXVien03QyDp+nMIU4R4
	oT2h/3y+uu/7hS+hUaQD3OBI+mIVDNa/X1aCY0bjnOU/A2m2iq98NoIaPTP6PjbnY9fAt7s/aWAes
	hl2QLeN5ZhUdN4N2rCRE2OP+pcYoOVGRWyw7nFAtBp3WcwR4ZhMjpGT7WjVy3Uhel/nKR496WXyt8
	LRmw6TnMPVoSiBZanNtbsW1HEW75y+UOjgnogEnsgHW0UTBkQuyzIhEQaDuLBuFM2A+d7Ap/AudIB
	VQU7pI+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaW7c-0000000GSO6-34YO;
	Sat, 12 Jul 2025 09:02:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaW5F-0000000GS3e-1kaH
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 12 Jul 2025 08:59:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Bs7C3OuDjp8spBtZUebXmMmqp+JNJ8zM38bJKoNTVC8=; b=BuO1koQrZcWKm78W0+ghp4VORs
	wh0EZrPnO9h61744sTLh13jUU8uouXQE9+j+E8YS0MVZy0vg9jnYreGFrxFo8U4TNxiwndcWH9JkE
	f4FSHCIjvzFTt5pC+rXFzvhSHCfNxxUvp5FDLoxkKmKLZlk5GCC5WWp7saTkvTkWkWFJ/JvUAOikz
	6cdBH3SLTQrP4I5/WM+Z5c5tFFETZUKuYnz0Df8CLQrJtNG2aiTDm4iT3oEAbJdAEIzk4jkHRcwg8
	nsdQetk+bWYcB9U7zskDFhIbuIW8ZQh+Wxy2W2se25x+SsfHperaOBur7NkFGpBKG5U3TTmlXSXeF
	zD2zHzFw==;
Received: from mx4.wp.pl ([212.77.101.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaW5B-00000009R7a-1OxD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 12 Jul 2025 08:59:47 +0000
Received: (wp-smtpd smtp.wp.pl 2408 invoked from network); 12 Jul 2025 10:59:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=20241105;
          t=1752310781; bh=Bs7C3OuDjp8spBtZUebXmMmqp+JNJ8zM38bJKoNTVC8=;
          h=From:To:Cc:Subject;
          b=d0rXqUdYYP7ojvHs/CPxFw/4wkiV3jgKjUvitOGmuGyTOVXo3TgNlAvsjIKDj4vJ/
           wLz5GCCHYkDeoi1cDltI232JmOSal/H1F1pkTpv3zc7NJykmyUzNupX24ZVLwVLAyJ
           rDj9EfYv6iExMx3c9U6tBUuXXFZEYLfZbk4L7TrAsE6JtTA2oqQdJUB6g5OjMEDep0
           0+zl5eWAA2YJhSJJbRbtUUSdM+Yu0qZl2DBeAgVbr1HU5Mf/NS7xDvn/cBDg1tqqUR
           EHZGUJYEcMR7zCAxQkGPjUsS6qFvoz9pDJS6sII2cZnwZ60ZttrG/q1dtu7xqTogBF
           XNwtDKxW+fbfg==
Received: from 89-64-3-180.dynamic.play.pl (HELO localhost) (stf_xl@wp.pl@[89.64.3.180])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP
          for <rosenp@gmail.com>; 12 Jul 2025 10:59:41 +0200
Date: Sat, 12 Jul 2025 10:59:40 +0200
From: Stanislaw Gruszka <stf_xl@wp.pl>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"open list:MIPS" <linux-mips@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCHv3 wireless-next 2/7] wifi: rt2x00: remove mod_name from
 platform_driver
Message-ID: <20250712085940.GB9845@wp.pl>
References: <20250710200820.262295-1-rosenp@gmail.com>
 <20250710200820.262295-3-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710200820.262295-3-rosenp@gmail.com>
X-WP-MailID: 78faf179404bc1cccf11415900ca8dfc
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [4eIB]                               
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250712_095945_769767_0D0739C8 
X-CRM114-Status: GOOD (  18.04  )
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

On Thu, Jul 10, 2025 at 01:08:15PM -0700, Rosen Penev wrote:
> mod_name is a legacy debugging feature with no real modern use. An
> analysis of the underlying MIPS setup code reveals it to also be unused.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Acked-by: Stanislaw Gruszka <stf_xl@wp.pl>
> ---
>  drivers/net/wireless/ralink/rt2x00/rt2800soc.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
> index 701ba54bf3e5..e73394cf6ea6 100644
> --- a/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
> +++ b/drivers/net/wireless/ralink/rt2x00/rt2800soc.c
> @@ -246,7 +246,6 @@ static int rt2800soc_probe(struct platform_device *pdev)
>  static struct platform_driver rt2800soc_driver = {
>  	.driver		= {
>  		.name		= "rt2800_wmac",
> -		.mod_name	= KBUILD_MODNAME,
>  	},
>  	.probe		= rt2800soc_probe,
>  	.remove		= rt2x00soc_remove,
> -- 
> 2.50.0
> 

