Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28585C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 13:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ck5xsWo/5MeWEGxVeZ8T87STzgoOYFBEg4ZFVZbwJXs=; b=zamf+nYdFRZ+zr7u4IBrHpwaVZ
	tLKQUbq1rMFb2qe0Xni3MP8emX6HVy5UPMw/ik9L2wEw32HxlUxdA5DP8Xg/JyDlNzL9OghzWlr+W
	J4lbD1AForElxDRRQLXECrmMYcu17higXQUgp6UL4GNd8BOb1skf8OohawKTe4eHjfpSYgLQ/aPaa
	dRLs3/ZGf38kxOINa7aPQaetTKZyy7RB9WqhsHT24k735pRSVtjF/qJ7r6YVeAwxhEzoMAuKbwya1
	BXsKQaIKxF068TSCd5JbA9Rl/aw0UrsjP3j5mMVFchHlih1sMlm5/uiE+UPSGXtMU0KfAnDjn/w7k
	1ztst8XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6EY-0000000BLoe-1bms;
	Fri, 26 Jun 2026 13:04:38 +0000
Received: from fout-b1-smtp.messagingengine.com ([202.12.124.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd6EV-0000000BLo8-29SU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 13:04:37 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 620551D00149;
	Fri, 26 Jun 2026 09:04:34 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 26 Jun 2026 09:04:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782479074;
	 x=1782565474; bh=ck5xsWo/5MeWEGxVeZ8T87STzgoOYFBEg4ZFVZbwJXs=; b=
	aYKmELdfeb0rPqlN8e16bOkUkWCTcLC1/itvp2LZ/WY7n7moMOUqkMHWWtJaKXqZ
	9Gw6zK6vuVrEJ9AAmpqfHLftZ5vuHIb/DambduN+DMQWXulGjS/37TqRfK/ekWbE
	ubUoDzlRRYhQFMUcKPBIUkrFX16y+aD5CrBsAIxQVS3xRdjFuwx73q1eH2j/I7Ea
	UJ88Lajwc0wFBaf9Y/N5Z1AiEjK3LfVoWrUxfw3ttCTJbPdVqCVIev77JkZyFEAn
	/mdVUh8OQdNKGh5zat8SkH4odI0Xp+xWOX3UgGpiCI3AFB4/eqjBB6XlHVRrYxKs
	woA2Np322Y7Ek2LTjpd2Xw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1782479074; x=
	1782565474; bh=ck5xsWo/5MeWEGxVeZ8T87STzgoOYFBEg4ZFVZbwJXs=; b=l
	NT0ZaMgD+GUMq+qzem7hmjUJ1AqCGZz0Di2PutnGB0PMfBDviVRyVk2hTEJZ/Xvr
	oz0Z6ai02QeeYi7QfnSWZg3oQgUrrKrSxzewbuh4qpwJKnz7oZGVlaBHf+IPMCZH
	krW4c0x/GnbsCxAkFeHhyMEUYrS/eyg/O91df5W1bW/OtFXWX111CeF1FjdH8EVk
	Ju4295eY6i5ya/sMSiEpD0/jdATePygnywQzr/1MQ8h1g3sw5QRlJUxfudo/869J
	1TnCPCiVV+pZYl6iUVW7KfTvzlz0vyRaf1SIbxMCWsmQ3r1c5QMfJnMSWr+iLvy/
	D0JocP7YSKM0gZtuh+lHA==
X-ME-Sender: <xms:4Xg-alcHfQcPvFdUTtTsSMf3Jx_3jlYaPcZ3H9sZPfY8UU_6Pa5MDw>
    <xme:4Xg-auAdl5Z633VBpm59SxEsZJ3Tcx_67dQ9fWelCY7fY4CCYmWZtCORi2E66rZNl
    xeNAsJ9iIcQG_HgYEIJtfY3SkhUu0mmlHi3WD7TWLa0ssNQ3pBXu1k>
X-ME-Proxy-Cause: dmFkZTGumcPKcYwUjmZLHZyGSxGucW9r5tCK8vdAwuEMt5W3aGAeR670U78q6k/BQeoGPg
    HHxkD26HPAU6mikhbPmHyDO7TCwYxKrcLT66iE1WTXnJ5LEgQSQdDUu3z/4YgsdlM76HmC
    BMVxETundec920vGBbomfOyfKGb48gt0Un5kOZkqdnqKl8HJVCPxhmoh3zOxnxIf7c+wl6
    UsGglnbGOLpCw3kryKdBHSLKb+hh1kQ6iyXS1V6B1xKaQY0H5ajbxk2kQdc9aQwKj0BhLO
    w4wc/Cb2NlkQh+mQWIIhMPgz9ai0tZkHTZ0Joat8mL1mHuX1vEqoisl3jraJfksOs1gDlN
    C0fBpBfY6De1JJRguCgbLG/RxDnaie0HejkaN8k0X8NqdRGU9v9dCNkyI3VPo+I5NGlzKK
    l3vwJ0fNY7ikWuekmBPr+/glLv9XEE+qED4OPGkXw57r695ar1jf5JGHakIUjssCATkfrD
    oBtjEzb9peCDUQl6eYv70tAeplRdhLyjfGT6ghNHv9clqa+JxYarKHdmlwenjg14j10gfV
    QpNcV0dECfvnxj41K3LkRz7Fw6PyIaW8EJPyP7LRj/9y2dJoKEugVKdfen0KESG1/6HdXj
    dTLMmgrHVVEYKu3gGao5UbwdNZhIjJlxRvL00qONo9BDBD7IvtplF0WhRDVw
X-ME-Proxy: <xmx:4Xg-aoDodgQlAZf9gr9zMsDT9U0SHMiXMikUGH7igB6h1-5e_T8mEA>
    <xmx:4Xg-asAoJZehc9MlVl5gWxTQJsq20ZPd0CWoN_yn7aVb6xIQqk0j4A>
    <xmx:4Xg-arqWhANO3-qCrN9pRu3FD7RuwpGqqKy2sQacBohvpQX0HTtdWg>
    <xmx:4Xg-aumiU-KFcmgiBoQyEQixP6mboDV8A60nIhtTL9jrr0p5fHxbHQ>
    <xmx:4ng-asuttGD_CyH_7nQ26-LslR3dtE_Vh2-3tcVfGa8A7RIsJZc0Ouqn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AFA001820086; Fri, 26 Jun 2026 09:04:33 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A5EVnRCqXlfN
Date: Fri, 26 Jun 2026 15:03:53 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Gary Yang" <gary.yang@cixtech.com>
Cc: "Fugang . duan" <fugang.duan@cixtech.com>,
 linux-arm-kernel@lists.infradead.org, cix-kernel-upstream@cixtech.com,
 "Peter Chen" <peter.chen@kernel.org>
Message-Id: <21f81761-ac02-4771-9dfd-38e653d1f74f@app.fastmail.com>
In-Reply-To: <20260626092015.1709904-1-gary.yang@cixtech.com>
References: <20260626092015.1709904-1-gary.yang@cixtech.com>
Subject: Re: [PATCH] MAINTAINERS: Update maintainer and git tree for CIX SoC
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_060435_913234_CE50BB97 
X-CRM114-Status: GOOD (  14.12  )
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

On Fri, Jun 26, 2026, at 11:20, Gary Yang wrote:
> Peter Chen has left CIX Technology. Take over maintenance of the CIX SoC
> and Update the git tree URL accordingly.
>
> Signed-off-by: Gary Yang <gary.yang@cixtech.com>
> Reviewed-by: Fugang Duan <fugang.duan@cixtech.com>

This obviously needs an Ack from Peter. I assume he's ok with the
change, but you should document that since maintainership
is tied to the person by default rather than their employer.

I've added peter.chen@kernel.org to Cc, hopefully this forwards
to a current address.

      Arnd

> ---
>  MAINTAINERS | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2fb1c75afd16..17b3704bbcde 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2692,12 +2692,12 @@ F:	arch/arm/mach-ep93xx/
>  F:	drivers/iio/adc/ep93xx_adc.c
> 
>  ARM/CIX SOC SUPPORT
> -M:	Peter Chen <peter.chen@cixtech.com>
> +M:	Gary Yang <gary.yang@cixtech.com>
>  M:	Fugang Duan <fugang.duan@cixtech.com>
>  R:	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
> -T:	git git://git.kernel.org/pub/scm/linux/kernel/git/peter.chen/cix.git
> +T:	git https://github.com/cixtech/linux-mainline.git
>  F:	Documentation/devicetree/bindings/arm/cix.yaml
>  F:	Documentation/devicetree/bindings/mailbox/cix,sky1-mbox.yaml
>  F:	arch/arm64/boot/dts/cix/
> -- 
> 2.50.1

