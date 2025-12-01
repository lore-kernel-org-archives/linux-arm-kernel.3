Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67EF3D116F1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 12:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lHSqneXWA/+e/VX0oEH2ml6TjosRQ2kB8OsriSGB1x0=; b=b2jznoDL0KI9CZi3TJVSbpKxWK
	19gfFZXCcK8O/0cxuPmiWRRUH+QQIEsLGtwIOLRNH6FssAFyn8GA7Ut5RPaxwbOotEfwCtQ2Qqxxv
	yvg9UV0vy5zaF4EixNQnm2AKyVh6BhgjY/SIBcgjz/xi82FaNzT9xySwGWbL+NbGuiueRwCXcIcv8
	ve1n1xdVT8u9gceUht6KrYQnveerdr37sLD+1+RXkhvNxvCikCM+4PXUzCSr/18a/X09wt6JA4qvm
	EB4KAOqPSOlOxyqFo0Wq0TOf8/N0JICHVfQD6dr15U2tjoOPQXld6py6yyhNi50uZAfl5SgaT7hin
	6dWId2Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2uF-00000003Y23-3F7b;
	Mon, 01 Dec 2025 12:21:27 +0000
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ2uD-00000003Y1c-0vWo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 12:21:26 +0000
Received: by mail-qt1-x82d.google.com with SMTP id d75a77b69052e-4ee2014c228so32554641cf.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 04:21:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764591683; x=1765196483; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHSqneXWA/+e/VX0oEH2ml6TjosRQ2kB8OsriSGB1x0=;
        b=N7Eh1qZD1w4iBvYuM03OqdN6gyZfQnKMmyWIMPJsWZYdRNX5adPvCiLcl/qRGGYAHQ
         Es+nFdn4vt4TxqPNrY5lKX50SJaRP/S5CNzWKRZmy3C4CE+tV0PLaLFdwgjy7gJV8Wvz
         02aFhLytwk804YWmRuvkQsOlubpg20dWvu84pvvoGjik2pbNva5EPHqCFDY9bujNF80o
         PcJimxQzqs5s0fA4/HCpFfxkRhCBBKh9tVf1DupSaIi1JagxPqr/Sf31jLk+JNFZ0gzU
         hY8ULnSVXdNUSb1X0WKInRuuf5/b01M6Awx2iFjrJmkWw9QV4+Ct/eriIB4i255f9Ncc
         YSrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764591683; x=1765196483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lHSqneXWA/+e/VX0oEH2ml6TjosRQ2kB8OsriSGB1x0=;
        b=B4bsXMByAItQhP+egxk7SsuoRQ0HxvGb9bGi7fEe0YOjtx/COiVLx/Q1liOfT/pBlV
         oot+EjRN7/N43sEcWhnzvuvBSqyDi/NGibIvkpHnR3Dh7daGBFZdMhMoQjG6QvfjT1yj
         FSBz9I61fTYV5ktN8r2Fa85t5TQC6yIwOqkTO6QSW0pdvt7csxoBMa2locxqN8nQwXV4
         YWcdQnVcrkCNlU0qZkajw6XNNEAhIzAUDG66+Q4QnihCKR9Vy3RgcZMEG202zvR8AiWa
         XgKOxDAlkduuyD9rM7Lg7st34vyrcVCwr8yLhOUhyQ1WiiECCH+61l44cN4oOL9RwwlE
         CjEA==
X-Forwarded-Encrypted: i=1; AJvYcCUgEZd0k0uB8ckmWWGpp3KWj/pJFrJK/HPuAAviv1DyrVsPWqUYHqIKyBqobbKSbb6eeRmSvOTd90hXE/d2OuSM@lists.infradead.org
X-Gm-Message-State: AOJu0YxabvzYZsHeAu6lTtQb7wME7uRLQgQ3lw6CQ4j4Gzay8YNTOICS
	mQ/lV0hpSCT6+4Fk3G+4VRQTeo4+yY6n1I1ajnaRpRQq8HbsdZSEi1l6cGDYglpX+EbGcPblefV
	Bu9rWoC3NJBJvZzRJ/21t/zBWqrRrv2tFfWdDfMlm
X-Gm-Gg: ASbGnctwQ2TJf0ytAOjdlXM1EHyeEdvTt6B7eA8rWXC2Y0uhxx9ggPyr5RBJSludUj8
	vvYPDtVcGiBfiHO3nA5NBN8Ov0HGbyyampdQspzlMt1wVH6DxnlEBh0McXtKuXBqEXgRGVGv6G/
	d5Anhv7GAHoPz2qNay1X1ErqWtOuOm7mf9SQzzgahT/CVS+ITtZADp2xEQtKDgdragFDYgxYWd0
	YMJ1nbnduLmoLExlNpL/eUUCTuCbbKK+bSEwOD4Wm1C/AiMJ/TBRU5SdmAe5RjQRfNb2Po=
X-Google-Smtp-Source: AGHT+IH9eYypkeN98zOYpGsp9E+99suemEUInG07xexLsbvPVRpjPCVn1S17NsmjJ+JrurGEFPKeljMRG5rPSCN7HsE=
X-Received: by 2002:ac8:5f93:0:b0:4ee:12e0:f071 with SMTP id
 d75a77b69052e-4efbda335afmr343293061cf.20.1764591682796; Mon, 01 Dec 2025
 04:21:22 -0800 (PST)
MIME-Version: 1.0
References: <tencent_22959DC8315158E23D77C14B9B33C97EA60A@qq.com>
In-Reply-To: <tencent_22959DC8315158E23D77C14B9B33C97EA60A@qq.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 1 Dec 2025 04:21:11 -0800
X-Gm-Features: AWmQ_blG6Z6aHaozr9InEEx8bN5Cx9HWRtVXhn_CY4qP5mLQlVGzSHj8vESPhx0
Message-ID: <CANn89iLW+68YE9s9dChEcQYbmwXSBzWRPzFH50+--Kw3XNZXEQ@mail.gmail.com>
Subject: Re: [PATCH] net: stmmac: Modify the judgment condition of "tx_avail"
 from 1 to 2
To: 2694439648@qq.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, 
	hailong.fan@siengine.com, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, inux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_042125_306895_CBAE5EC3 
X-CRM114-Status: GOOD (  17.64  )
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

On Sun, Nov 30, 2025 at 6:57=E2=80=AFPM <2694439648@qq.com> wrote:
>
> From: "hailong.fan" <hailong.fan@siengine.com>
>
>     Under certain conditions, a WARN_ON will be triggered
>     if avail equals 1.
>
>     For example, when a VLAN packet is to send,
>     stmmac_vlan_insert consumes one unit of space,
>     and the data itself consumes another.
>     actually requiring 2 units of space in total.
>
> Signed-off-by: hailong.fan <hailong.fan@siengine.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/=
net/ethernet/stmicro/stmmac/stmmac_main.c
> index 7b90ecd3a..b575384cd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -4529,7 +4529,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb,=
 struct net_device *dev)
>                 }
>         }
>
> -       if (unlikely(stmmac_tx_avail(priv, queue) < nfrags + 1)) {
> +       if (unlikely(stmmac_tx_avail(priv, queue) < nfrags + 2)) {
>                 if (!netif_tx_queue_stopped(netdev_get_tx_queue(dev, queu=
e))) {
>                         netif_tx_stop_queue(netdev_get_tx_queue(priv->dev=
,
>                                                                 queue));

Drivers should stop their queues earlier.

NETDEV_TX_BUSY is almost always wrong.

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 7b90ecd3a55e600458b0c87d6125831626f4683d..6dcc7b84a8759763b6471a48a6c=
80b1f17cd937c
100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -4675,7 +4675,7 @@ static netdev_tx_t stmmac_xmit(struct sk_buff
*skb, struct net_device *dev)
                print_pkt(skb->data, skb->len);
        }

-       if (unlikely(stmmac_tx_avail(priv, queue) <=3D (MAX_SKB_FRAGS + 1))=
) {
+       if (unlikely(stmmac_tx_avail(priv, queue) <=3D (MAX_SKB_FRAGS + 2))=
) {
                netif_dbg(priv, hw, priv->dev, "%s: stop transmitted packet=
s\n",
                          __func__);
                netif_tx_stop_queue(netdev_get_tx_queue(priv->dev, queue));

