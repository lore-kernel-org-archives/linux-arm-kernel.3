Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38E2AC79F9A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 14:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upzBh5Em5NXDGqBT4uo4/M1CBjvadt94CRbC6kwOVJ8=; b=zs4O6Hq4CkMFBSWsI5eN9JAsEd
	anDVp0JAj6RyLSrmNHF1D/u9ZrLUZ2TPjaGMCwJmmWfjpMiBfkTK6NO7LvTr76nmboZE3s9MLIGmm
	IF7RFxY0Bb5LLxlR2q+I1a6ceuGGC/z6aB8+iknhGZT20VVRe9sU7loT5r+qKr3KNnPZtJRwkuM7x
	G6ILWCzyR55fsjTIA0QjAipRWFf/HvcBziECXEv33rLBXsyUnlbA7bnRrpUmXv7pD1BdjhfacO0o9
	Su8R5QpAkij5RolEbF/WxxqvgAfz7mlQPQZkDx6ycBrx5H8mDjbugmQudtJBXc3hcBC+rTBcpMoU2
	E4HG1ZNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclC2-0000000BVzq-0xbB;
	Mon, 05 Jan 2026 14:04:22 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclBy-0000000BVzU-34Wc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 14:04:21 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7CBEBC1E485
	for <linux-arm-kernel@lists.infradead.org>; Mon,  5 Jan 2026 14:03:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 75DF660726;
	Mon,  5 Jan 2026 14:04:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D848D103C8541;
	Mon,  5 Jan 2026 15:04:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767621853; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=upzBh5Em5NXDGqBT4uo4/M1CBjvadt94CRbC6kwOVJ8=;
	b=vpndpMwjksdg561R687A/0n70utGm4SqoKdTISzY10Fw27IGR+zPXnHdBscgYYw2hE/2KB
	i5ydNMiF+GA5EYo4/jNYvR04lC5AxgiodRbNIjmyD1e7Yy0yR6wpBpLYHayM+ajPbTvZ2V
	LI5BZUYBEX9Sxesm5PmcpAW3XBnLhhWRo7XPxiR3TtJrKFgikwMCBqN5qgX09SXILjElnP
	Q/ih9i50JpADhqyJXRpCrkGyWaZsGc18Q5f1ZAAHUl+OHDn6s7vsUPSEiAWTdwxDXRk2FV
	C7dBKSwumswMkzM0I26Z1kq3WkOjGrGR+q11lim54z2NQU/6bOYTknv5U+ExyQ==
From: Gregory CLEMENT <gregory.clement@bootlin.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Andrew Lunn
 <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] soc: dove: pmu: Simplify with scoped for each OF child
 loop
In-Reply-To: <20260102124801.64172-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260102124801.64172-2-krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 15:04:11 +0100
Message-ID: <87ms2sqhpg.fsf@BLaptop.bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_060418_935930_1C420D68 
X-CRM114-Status: GOOD (  14.15  )
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

Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com> writes:

> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied on mvebu/arm

Thanks,

Gregory
> ---
>  drivers/soc/dove/pmu.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/soc/dove/pmu.c b/drivers/soc/dove/pmu.c
> index 7bbd3f940e4d..dd8ade8e9ee8 100644
> --- a/drivers/soc/dove/pmu.c
> +++ b/drivers/soc/dove/pmu.c
> @@ -371,7 +371,7 @@ int __init dove_init_pmu_legacy(const struct dove_pmu=
_initdata *initdata)
>   */
>  int __init dove_init_pmu(void)
>  {
> -	struct device_node *np_pmu, *domains_node, *np;
> +	struct device_node *np_pmu, *domains_node;
>  	struct pmu_data *pmu;
>  	int ret, parent_irq;
>=20=20
> @@ -404,21 +404,18 @@ int __init dove_init_pmu(void)
>=20=20
>  	pmu_reset_init(pmu);
>=20=20
> -	for_each_available_child_of_node(domains_node, np) {
> +	for_each_available_child_of_node_scoped(domains_node, np) {
>  		struct of_phandle_args args;
>  		struct pmu_domain *domain;
>=20=20
>  		domain =3D kzalloc(sizeof(*domain), GFP_KERNEL);
> -		if (!domain) {
> -			of_node_put(np);
> +		if (!domain)
>  			break;
> -		}
>=20=20
>  		domain->pmu =3D pmu;
>  		domain->base.name =3D kasprintf(GFP_KERNEL, "%pOFn", np);
>  		if (!domain->base.name) {
>  			kfree(domain);
> -			of_node_put(np);
>  			break;
>  		}
>=20=20
> --=20
> 2.51.0
>

--=20
Gr=C3=A9gory CLEMENT, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

