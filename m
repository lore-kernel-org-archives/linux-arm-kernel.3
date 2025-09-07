Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15256CA1017
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 17:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HI7cBrf/VB0tvEUFj8M36AcWOsz9VdohrYv1q3umpTQ=; b=uhmO4TnNd76bzFMIq418Qh8of/
	MfPNeum89357Helven9JFpTHJ5xf67H4ErSSD+erGUlSRg0xOYcLlbuumWqOkQI12kx0zyeyhBZf3
	BtFjSEyH/PISrtdUZcyER8/eINHGTA1KuM0Ydre4DgXQM8Wc7CFfmqt6bTcmjtIablbyC8EQvtIQO
	hAGUfsqWEioMXD12yQRtPUCZO9wt4/yJXabo4jSYyr66H7YlzYV6C7owa89e7HQmaZ+A1PbhQeyb5
	p0RxhGyMcOzS9fLD2ygOh6Ru+ff4/eQRCLKYOhstcr8F/rSIZURR6HSNLOTZxNv8uoPO3Ze8GptRx
	BEcBIn3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvJF8-0000000C6bK-0G0k;
	Sun, 07 Sep 2025 17:31:58 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvJCI-0000000C5xf-0G6H;
	Sun, 07 Sep 2025 17:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=HI7cBrf/VB0tvEUFj8M36AcWOsz9VdohrYv1q3umpTQ=; b=LDvPL+9w8nffgf51qfs60Ztwj/
	SjwY2Qk0KC/THjpsUX/8//wPP9CySwk7/KOAX7S4J2UTGyX2Zst3xjpsekLLhMutltVyAIxGHEd4S
	aJ3z466Q5+VdG8h/Car/C3QCy88WoX6yYqwH5o7o65ByqutRcOhuz/1UEq7UDuHveqwpseOaba8z3
	2ozi1TpRxZ9F7IBFM/HVKBpPwFWK1u3MTZdHhEJPUMy9T0minU5+KWCd4o1Krw6rR7fjdawfT35mr
	fnpkUKJ3ZrHdLM5CguuRxplZnjkpVpI6faWfKmCM3fBCSs9u7zFdB8B3KUWf8Ax5XhRWNDQdwfy9r
	vBYKsJaw==;
Received: from [61.8.147.163] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uvJC8-0004IN-3o; Sun, 07 Sep 2025 19:28:52 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH] pinctrl: rockchip: fix NULL ptr deref in
 rockchip_pinctrl_parse_groups()
Date: Sun, 07 Sep 2025 19:28:50 +0200
Message-ID: <6789547.RUnXabflUD@phil>
In-Reply-To: <179c9e8c-8760-41e6-aad7-7a128df60984@omp.ru>
References: <179c9e8c-8760-41e6-aad7-7a128df60984@omp.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_102902_105391_27271D19 
X-CRM114-Status: GOOD (  23.83  )
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

Am Mittwoch, 3. September 2025, 21:48:54 Mitteleurop=C3=A4ische Sommerzeit =
schrieb Sergey Shtylyov:
> In the Rockchip driver, rockchip_pinctrl_parse_groups() assumes that the
> "rockchip,pins" property will always be present in the DT node it parses
> and so doesn't check the result of of_get_property() for NULL. If the DT
> passed to the kernel happens to have such property missing, then we will
> get a kernel oops when the pointer is dereferenced in the *for* loop just
> a few lines after the call.  I think it's better to play safe by checking
> the list variable for NULL (and reporting error if so), like we check the
> size variable for validity further down...
>=20
> Found by Linux Verification Center (linuxtesting.org) with the Svace stat=
ic
> analysis tool.
>=20
> Fixes: d3e5116119bd ("pinctrl: add pinctrl driver for Rockchip SoCs")
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

Assuming that the DT is our friend, really is a bad assumption :-) .

While I can't imagine what 12-year-ago-me was thinking then, simply
checking the return value really is the better way

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


>=20
> ---
> The patch is against the master branch of Linus Torvalds' linux.git repo.
>=20
>  drivers/pinctrl/pinctrl-rockchip.c |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> Index: linux/drivers/pinctrl/pinctrl-rockchip.c
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> --- linux.orig/drivers/pinctrl/pinctrl-rockchip.c
> +++ linux/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3488,7 +3488,9 @@ static int rockchip_pinctrl_parse_groups
>  	 * do sanity check and calculate pins number
>  	 */
>  	list =3D of_get_property(np, "rockchip,pins", &size);
> -	/* we do not check return since it's safe node passed down */
> +	if (!list)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "%pOF: no rockchip,pins property\n", np);
>  	size /=3D sizeof(*list);
>  	if (!size || size % 4)
>  		return dev_err_probe(dev, -EINVAL,
>=20





