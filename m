Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D123C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 10:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2ZZ3jPoCQgZ035xQBboMsxg7LDoIyZLuMyVj0W21Gk=; b=SFjAeRgzVf3cQFm6nhmP9WIzdn
	1WB2MgWyVOgcGW/aT7Iwn1fe5yuGp0KLjzMkotvosxDEyahTBQPgWwYSKjCZqO7edN/qqrO75XEvF
	U6V72NGHCgFfcbEQpbZBaeVr2WqCa4/Qu8hguuDkW2MnqXJs0RWx1BpdegBPsfp/Uw/uLoK9Hs7rl
	+/7BN33TkhCHsJ9iQh0P7ovxrxy/GSA2o8c0khaDq7tN7nIMGEpMZjwIiJt7NMfq7u28UES1Zlp8O
	pcbAPI8qMGkQOMaxukIw421q+KifjkUzB26UIGwcHuJSHamsuQWIa3gpqML/XPye8ED2gn1sfEZ0U
	6dijjJrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xfC-000000052V1-4BSC;
	Tue, 22 Sep 2026 10:23:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8xfB-000000052Ui-2wH4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 10:23:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 22F99431DA;
	Tue, 22 Sep 2026 10:23:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE72F1F000FF;
	Tue, 22 Sep 2026 10:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790072629;
	bh=G2ZZ3jPoCQgZ035xQBboMsxg7LDoIyZLuMyVj0W21Gk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=nV69P6WumOQzOIviEfkVLpeS/fz06hZd48XOj0W//UAILYv9kAYpClfua4Hm9SEza
	 Q7bNkF/PRNGhnfovkHCs3GV5sdnGBfmZvcGJoMMBORkqXWSIHr/zPrnuj4MLMIBiQm
	 rcfct8ZaVROl3f4B5icews0AIIRKQNfPEd8wS2KnKMow+z0Sj4r+UPjk/7utKqlOaG
	 6Wg0SOojMN9dcatWViHhZMMfw0NE6UJHOUc2NVBt68yB1MqUNcR9B07p+34XAndXuQ
	 faYTabLvy09I3dOSvDbcR2fgPQsVW15MB1MULS86SNhCECtcV4e1VbgVi0WvR3gW1p
	 qov4e3CVjkw+w==
Message-ID: <59f78064-0e0d-4e3e-9ca3-f057e70b44eb@kernel.org>
Date: Tue, 22 Sep 2026 12:23:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] soc: fsl: dpio: Use scope-based resource
 management in two functions
To: Markus Elfring <Markus.Elfring@web.de>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org, Dan Carpenter <error27@gmail.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>, Roy Pledge <Roy.Pledge@nxp.com>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
References: <709fefd1-821a-4cd1-8598-b1179a95ce52@web.de>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <709fefd1-821a-4cd1-8598-b1179a95ce52@web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



Le 29/07/2026 à 13:36, Markus Elfring a écrit :
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Wed, 29 Jul 2026 13:28:09 +0200
> 
> Some adjustment opportunities were picked up.

Feedback from sashiko has to be adressed at least, see 
https://sashiko.dev/#/patchset/709fefd1-821a-4cd1-8598-b1179a95ce52@web.de

Christophe

> 
> Markus Elfring (2):
>    Use scope-based resource management in dpaa2_io_store_create()
>    Use scope-based resource management in dpaa2_io_create()
> 
> 
> v3:
> * Dan Carpenter requested to add an #include directive.
>    https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fkernel-janitors%2FamdBqQfIsAjxMsqX%40stanley.mountain%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6bd2db2a294b450f9afe08deed65baaf%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639209218359212161%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=6%2F8aUajE%2B%2FNYTpo%2B09SVBa9lbZez3WYGUhtpdSTYF4w%3D&reserved=0
> 
> * Ioana Ciornei requested to keep variable declarations at the start of
>    function implementations.
>    https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fkernel-janitors%2F6woig227u5snmdsrjfuw7gfcf3vk5iwaap4yf7ow6b6s3pba7z%40yg4vmdoaak3h%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6bd2db2a294b450f9afe08deed65baaf%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639209218359235520%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=icEeNsVtx34DKgqjmsDjR3QUqqmeSh1o7gWr5PJYFKo%3D&reserved=0
> 
> 
> v2:
> Christophe Leroy requested to apply the attribute “__free(kfree)”.
> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Fkernel-janitors%2Fd95d2f4c-f3cf-44eb-b61b-79ba7891674d%40kernel.org%2F&data=05%7C02%7Cchristophe.leroy%40csgroup.eu%7C6bd2db2a294b450f9afe08deed65baaf%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C639209218359253601%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=wx8iGxIWhoBQPzSqd2fsa4eeZV9DTQ9pEBL4AWxLcdY%3D&reserved=0
> 
> 
>   drivers/soc/fsl/dpio/dpio-service.c | 37 ++++++++++-------------------
>   1 file changed, 12 insertions(+), 25 deletions(-)
> 


