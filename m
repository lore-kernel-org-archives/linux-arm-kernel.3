Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451CEC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 13:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xz+A4Rhkf0YcwXGNdPC9DjVZzWHVqQf/Hhrp/S7UrBY=; b=f8MG34NoXtHd5JSXI/7RZ9cszL
	LNCYRtDeSzDIVwV0AVX9lzcHL5N9SFSeyDK6hFEE12VMm6tv8w4M93aC6lqyCjiE8GEfsBgGJbn2C
	pKXJs3haaMg14O9l2+pLk/nHSoQsLGaXj7EQAhwZ0Fg+AQpnCkmuv3+I8vQ1idOa8cWev/ILdCgQT
	c6ETjXNiCwz9loTsVnu32zLe6fgf9AVEYSXQIF/owWdhDikbp8B3Lv7d2+e08V2GTpbfJULKN6NEh
	e25YvueOj5JFNAybIwoLV8exKMcKvYrlDKO0uS8IYQ1V04vM3so1rQWo+y0DKNjVv1w5Om4HkEAY8
	KxSJGCVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5dX-0000000DOuh-3Vvr;
	Fri, 25 Sep 2026 13:06:47 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA5dV-0000000DOu4-27Of
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 13:06:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1790341605; x=1821877605;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5LiU7u1Sd8vqr5RRPtFupIejm8J7rPUf9Xtw/ZZXIiA=;
  b=2cmSjwRz1DR4z4m/jWO++YbP3ByImNwQJHktv2CTbQVG/X3zliutkosT
   EEkG1mwj1Oe4QBdp6yUNV0/8vWmdoOqmxkcfhu6qrQY6m4Yu884JS4qGD
   lu+5mvEyk60qbwNKVguDzujNT1R6vSUG31QC0GA2az6fFdrPuSFHUphYV
   90U8HVf3KgfY/5pmpoZLKx2GjzMzj4NbDtJhSFfZ6/Z0cltyHB2UKSGmG
   FYaeMpYhj1ljYpLcKW0hzL0+BKs3DYMuRQDOi9wLR56NhKFHYkH6pPoHc
   GjkwYOr2muTHTw+HsCU0XcJahDoxdEeqjXP7UB1lm5/c526fEZHKjeyNi
   w==;
X-CSE-ConnectionGUID: 0oTG/wW9SWmgreduiR0bWg==
X-CSE-MsgGUID: U+rPuNpRSV2rV5jNhfO0Yg==
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="295561569"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 06:06:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.49; Fri, 25 Sep 2026 06:06:43 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 25 Sep 2026 06:06:41 -0700
Date: Fri, 25 Sep 2026 15:06:41 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
CC: Steen Hegelund <Steen.Hegelund@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, "Jakub
 Kicinski" <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	<linux-arm-kernel@lists.infradead.org>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
	<error27@gmail.com>
Subject: Re: [PATCH] net: microchip: vcap: stop scanning after deleting key
 field
Message-ID: <20260925130641.awviajhuq6mcb22w@DEN-DL-M70577.microsemi.net>
References: <20260925063937.963430-1-harshit.m.mogalapalli@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260925063937.963430-1-harshit.m.mogalapalli@oracle.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_060645_773185_B7935B51 
X-CRM114-Status: GOOD (  19.41  )
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

> The only call outside the KUnit tests is in
> sparx5_tc_add_rule_copy(), which passes a fixed key list with no
> duplicate entries. Therefore, the potential double-free is not
> currently reachable in tree.

Agree. Not reachable today.

> 
> However, vcap_filter_rule_keys() is exported and does not require its
> key list entries to be unique. If a future or external caller supplies
> the same key at another position that the inner loop visits, it calls
> list_del() and kfree() a second time on the freed field, leading to a
> potential double-free.
> 

Also agree.

> Break the inner loop after removing a matching field. The outer safe
> list traversal continues to process the remaining rule fields.
> 
> Fixes: 465a38a269e9 ("net: microchip: sparx5: Support for copying and modifying rules in the API")
> Reported-by: Dan Carpenter <error27@gmail.com>
> Closes: https://lore.kernel.org/all/ahs-lCAXXikkaHky@stanley.mountain/
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
>  drivers/net/ethernet/microchip/vcap/vcap_api.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api.c b/drivers/net/ethernet/microchip/vcap/vcap_api.c
> index 788c0728d763..0f8d98f2094d 100644
> --- a/drivers/net/ethernet/microchip/vcap/vcap_api.c
> +++ b/drivers/net/ethernet/microchip/vcap/vcap_api.c
> @@ -3527,8 +3527,8 @@ int vcap_filter_rule_keys(struct vcap_rule *rule,
>                                 if (key == keylist[idx]) {
>                                         list_del(&ckf->ctrl.list);
>                                         kfree(ckf);
> -                                       idx++;
>                                         err = 0;
> +                                       break;
>                                 }
>                 }
>         }
> --
> 2.52.0
> 

Patch is missing the target tree (net), the fix LGTM.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>

