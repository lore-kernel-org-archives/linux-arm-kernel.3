Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38413C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 09:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=in60ugGemjVltqB0vsq8GkvN3HfzICH3JQbCmYrTXHA=; b=cttUIApaydSi+w6EEaKC+pIihu
	ZdcmvfBVzRIUQ7jD0OieoGr4woNfFxskXMchdG8WvgPGBbCKBswCE6lMX5XHCZ+xEq/yNEKsm/vQH
	bN0UKsT0ic4bGoPqtxZ++amOKJ1XJEpIcqE6nejyPfmD7QZT2qKIfFprICV2+n+u/GRbCALd6NMBv
	sBMSAnpdP0CKzZfVBSkA7gUIbAMvuNDzjArMrVNMcT+qEbxlLjYhmHmPu41vPkOQLFYkVivUvAIJx
	NMPurCzZZ7RPi9MaLAH/82YK8mw8wl85sVgvqxaDEk2VHAWObMsXJf3uAZ8wsFI/4S/DjsE1tuIfe
	v3l14cxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqzc-00000002wUP-01LO;
	Fri, 16 May 2025 09:04:36 +0000
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFqxa-00000002wEG-1MUL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 09:02:31 +0000
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-4767e969b94so31594081cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 May 2025 02:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747386148; x=1747990948; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=in60ugGemjVltqB0vsq8GkvN3HfzICH3JQbCmYrTXHA=;
        b=26SlBhtWLgLnwK1je/3VrD5idc0ih9d6yacbiZ+noiMaPv8f93FwCrj2GFeJ2ls8/E
         Z2ahfiho5pjNRu2GdlUOlJRdv5C5yWtFq+8s/n2KT7y4aXH5m797cDjQ4W0DqbHlaMMr
         g//whL2fgEbdkVnkFAtC2dX4SEQ4qmfcmK2L0t8ZOAW2youxBSbPH6GTXFGDO49jefOs
         B6WSbpk2MeOUidMX+YbrnhbHVQuUV6VaTIJA96lWr/MSH9lVm5h/6Fyl7HPF3iLJffzc
         ng+gqaqCDw2ln9NY4pQQhj3VaHjWgWbtmUegFzzO9cZ7iIbVlfXuHAj5482MqKmT6aG+
         l0mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747386148; x=1747990948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=in60ugGemjVltqB0vsq8GkvN3HfzICH3JQbCmYrTXHA=;
        b=Uc2+JTRrWoGzOznoKsbefDEIesaXMRpRHrwOSjryrBd0GXCK2ayOcwbKUGBz/gsIkr
         uarzvpfOjhhbL9fsEZBXigHSLX9NrrXECxFGgZ9kIh6j2eHEhlmTP2x6vLsYIUIuHFui
         M8XretOAMexveg8pym7kU/o7J6vo4rGQ9r8QvTJHt1Jo1PPdalWkiJd/fHSAo4SyQWKP
         YHQTwXqucpKXY34ubqXxF0bfPThptHveqWZrxrVP5P8hBkE+WRlARt4qv97jw7/j6/nU
         fZcrIE5IHKcYyAM7h78EOJ39/U6c2DKhPwlXN4UzHqlu0f9rcg5wiJrvOkNGAnYy5kZ2
         LSQg==
X-Forwarded-Encrypted: i=1; AJvYcCU5daF2EHSdcfQL2dz7ivmHxvUhp1K5GggAgus9OFC/GZmgbto56IFlEXgbLdlt23glqCd0kQAJLtoVctodZhgs@lists.infradead.org
X-Gm-Message-State: AOJu0YydEQSeXfBpjQ759cd7tiO+RkPFwlmdk4SZepQ6K9R2pz08MTaY
	65r98NBPopsz+gjswIgn2ooT7ek8/UFgpFXr6VtyfTRHLS5OfztQ55YHc/XmOHpr/VpCGHOAqki
	vMDL4pzKqfXUk82SoCDowQUB/rnaQITU3jZJRrNb7
X-Gm-Gg: ASbGnct1Cp2c7GFQrDOMfMUFP40t1Yig2rGIG1BKZl7VuOATBb35p6TZC2vhVkx28F2
	N3EO05Tlgc8kq5D7SSi48P/97Bj4hOr8/I04Lff1a5s1zVD19mZatQlXcquNxQ2Xo7q/rHLSdEP
	QlxlMEm9BE/11A6AunkH4HTRDSioHOj51yABuWhmdm1Q==
X-Google-Smtp-Source: AGHT+IFKFpZ4mx7Ab6FBiCu2VumXKtdpAlGDqqg8Aj8q1gzbtDvdx2Ql++WSEromWm41RhpIINOkMLSPD9lHuaS6/qU=
X-Received: by 2002:a05:622a:986:b0:48d:7c95:4878 with SMTP id
 d75a77b69052e-494b07f782bmr30946581cf.29.1747386147888; Fri, 16 May 2025
 02:02:27 -0700 (PDT)
MIME-Version: 1.0
References: <20250509104755.46464-1-ayberkdemir@gmail.com> <20250516084334.2463-1-ayberkdemir@gmail.com>
In-Reply-To: <20250516084334.2463-1-ayberkdemir@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 16 May 2025 02:02:16 -0700
X-Gm-Features: AX0GCFvBaGcVFtA7dJExvGgGKSE3KqWHsolC66wfst2hICjQRgoMunWZPUzYXDk
Message-ID: <CANn89iJ9iAP0GXk_qmzu+2MjWHi_NDOjG1QdLAiY1YSj+RjZQw@mail.gmail.com>
Subject: Re: [PATCH net v4] net: axienet: safely drop oversized RX frames
To: Can Ayberk Demir <ayberkdemir@gmail.com>
Cc: netdev@vger.kernel.org, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Michal Simek <michal.simek@amd.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Suraj Gupta <suraj.gupta2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_020230_379321_FBCB8DC0 
X-CRM114-Status: GOOD (  20.97  )
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

On Fri, May 16, 2025 at 1:44=E2=80=AFAM Can Ayberk Demir <ayberkdemir@gmail=
.com> wrote:
>
> From: Can Ayberk DEMIR <ayberkdemir@gmail.com>
>
> In AXI Ethernet (axienet) driver, receiving an Ethernet frame larger
> than the allocated skb buffer may cause memory corruption or kernel panic=
,
> especially when the interface MTU is small and a jumbo frame is received.
>
> This bug was discovered during testing on a Kria K26 platform. When an
> oversized frame is received and `skb_put()` is called without checking
> the tailroom, the following kernel panic occurs:
>
>   skb_panic+0x58/0x5c
>   skb_put+0x90/0xb0
>   axienet_rx_poll+0x130/0x4ec
>   ...
>   Kernel panic - not syncing: Oops - BUG: Fatal exception in interrupt
>
> Fixes: 8a3b7a252dca ("drivers/net/ethernet/xilinx: added Xilinx AXI Ether=
net driver")
>
> Signed-off-by: Can Ayberk DEMIR <ayberkdemir@gmail.com>
> Tested-by: Suraj Gupta <suraj.gupta2@amd.com>
> ---
> Changes in v4:
> - Moved Fixes: tag before SOB as requested
> - Added Tested-by tag from Suraj Gupta
>
> Changes in v3:
> - Fixed 'ndev' undeclared error =E2=86=92 replaced with 'lp->ndev'
> - Added rx_dropped++ for statistics
> - Added Fixes: tag
>
> Changes in v2:
> - This patch addresses style issues pointed out in v1.
> ---
>  .../net/ethernet/xilinx/xilinx_axienet_main.c | 47 +++++++++++--------
>  1 file changed, 28 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/=
net/ethernet/xilinx/xilinx_axienet_main.c
> index 1b7a653c1f4e..7a12132e2b7c 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -1223,28 +1223,37 @@ static int axienet_rx_poll(struct napi_struct *na=
pi, int budget)
>                         dma_unmap_single(lp->dev, phys, lp->max_frm_size,
>                                          DMA_FROM_DEVICE);
>
> -                       skb_put(skb, length);
> -                       skb->protocol =3D eth_type_trans(skb, lp->ndev);
> -                       /*skb_checksum_none_assert(skb);*/
> -                       skb->ip_summed =3D CHECKSUM_NONE;
> -
> -                       /* if we're doing Rx csum offload, set it up */
> -                       if (lp->features & XAE_FEATURE_FULL_RX_CSUM) {
> -                               csumstatus =3D (cur_p->app2 &
> -                                             XAE_FULL_CSUM_STATUS_MASK) =
>> 3;
> -                               if (csumstatus =3D=3D XAE_IP_TCP_CSUM_VAL=
IDATED ||
> -                                   csumstatus =3D=3D XAE_IP_UDP_CSUM_VAL=
IDATED) {
> -                                       skb->ip_summed =3D CHECKSUM_UNNEC=
ESSARY;
> +                       if (unlikely(length > skb_tailroom(skb))) {

If really the NIC copied more data than allowed, we already have
corruption of kernel memory.

Dropping the packet here has undetermined behavior.

If the NIC only reports the big length but has not performed any DMA,
then the skb can be recycled.
No point freeing it, and re-allocate a new one.

