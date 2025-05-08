Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414ECC3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 09:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06V0SS4xl9NrencCcbDKamANFiU6WEUFYCHR8UmLwS0=; b=JMRYmSm9l/5VhrcqX8Des8HAci
	gNSgZrich6WkhVEJlNptqM75AxdoMOiWW0qFncdF6D0uPC4S3R0zwT4teFg+MKsLmMDHxBlJHSLvw
	t+8dOI719u6joT6zmwulTAP3NDf7Iij0nH//o2lSunphAW8+DPNp/VMiVNflN9rgA/cClSu8FMCk7
	n7GeOP05GKuqUecsW1fg+B4rAypZEZJQlqdy8btYcmvGH3Ba86CiBqJ5iGCiJUnoPHcfCpSuUFD0S
	NN0TAYHUNfJGKU2lVBTx/+eFiIgrQIgeM057i6U5LGHFpcU53tabMcSomF7OY6JvC1yoHRrpGuXcN
	nVcynq4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCxCM-00000000Cms-3Mck;
	Thu, 08 May 2025 09:05:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwor-000000009UN-3hKu
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 May 2025 08:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=06V0SS4xl9NrencCcbDKamANFiU6WEUFYCHR8UmLwS0=; b=Oyvv5+59KsXdY/jP+dJ6hkM031
	u2MElQHmr3tRytSRv5HAMvQylre2b3YbhvlHHGfZ7+1LaDrhzJcpoAOpipn+5QS0rLU53MoonyW6g
	8bUwRVgmrwzn2A6z2KSJIgdwmeQXRkcfiIS/G46dGVWgciC2ALm3CJtKCL30ZT+7cRjknpoNT3qei
	/fPZWZW9+oNHQdAyn17S1tnacoFDaoUuJ3sgjUP0j1YC+pNNdhuu0X5aksMVu7B8Jk7llP/zpKGyN
	biLW46qol2YQpUXseF75EpXINl0pNfwO4gU7aPUcLh+GF04+bW/Va4VX0QVTvvvccOfDKnRydLCOB
	RMXHSuEg==;
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCwon-0000000Fzxx-48DL
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 08:41:27 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-3d9189e9a06so2920275ab.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 01:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746693682; x=1747298482; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=06V0SS4xl9NrencCcbDKamANFiU6WEUFYCHR8UmLwS0=;
        b=Glg1178uHCNsY0F830WR9CGi/HKsC5iZQ0P8/DMmEx8otiQQkAiqOE8riJQrBY8cdS
         UbGzqMD2+ux6UlIHn5i5ycxzhlamEectWu1NnVsRlRvKabW29Z5OBFq8pWRwXWP5g0Bl
         2wgRYmI6x1DX1u4nuRQrHL6BcewHRVPXk8t/u7FQzziUGwx/Ccin2udM0nJpqRaFkfzs
         C5Vb1fnAe+lIxWAr/OcuDdh/NxHdG2H1XFzdjSc8SdziWRejnzF10YTunjgeyDx24ElN
         FkqrblEOooEwGWtR/JIoMTTByUO9Sf28SccCeuAEBre+W/4KRXBHKGO2wHEcKUrSIZh4
         WUfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746693682; x=1747298482;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=06V0SS4xl9NrencCcbDKamANFiU6WEUFYCHR8UmLwS0=;
        b=TF0Bs6gPsEGfiPL+GAERbxPjJ7nj1xlqJx5QoprNC3unsLR0F4JngfoT9oN/P/a13R
         pT0WIPFV60ZoBwlxikNAUDl6KAlwv32oJE4qcn0nUudG2ph+mKojPaNkr916ikv4bhWc
         9PBzyKKQll8nMURbuqRI0hYIR9joo8PdCak4JLjV4jCBgzFuQXRSk1HkBxC850YTa+ec
         3sFYjXK3Y/Xh21NWt8x1kUj4BgQXwF1SdeQFRFn6k5eJzNJI7ff8scnMhnXU92VLchb2
         HPbQKWOgeYKBLlDCjH2B/SZQMIK1cykVF5xFXyiae0uSGcrI/CFurDmImUNOv/QK99Gz
         5XdA==
X-Forwarded-Encrypted: i=1; AJvYcCWcY51QVFl/5isik+Qa/lCG6gdudgLrvNaBcFunvtbMsVRtTth3MY5cBvX5l4BuFZeR0cuPD2ws8A7dTZV+ZtuC@lists.infradead.org
X-Gm-Message-State: AOJu0YzJm/slwnWNNn81OM2Hh8jyWiljcXOxYKxtonUty0m/eobU302v
	4KNi1flmVrPpCK7+2h24rPIw7ovzQyG2IieW2tfkDYgD9q64YrrwPTzCpFe/k2YbPgDgSlWjhOf
	33XUOmBrf+6AgRpJGIADGoWE17Qg=
X-Gm-Gg: ASbGncu2r5yjtwrLNVZhDJatn2Z9KChHO8my4ZAgtYE7zHC2Gt7eCUdbfE84rEG8iYB
	VtcehjS2EEQDCB/rTLp/K/vnBLUnIRwWYB4kSeucyq/BPP01MJaY7pptM7vnxXXkWLX+o6HojvB
	vR4KMn+F3UsZjO9Cok/ya54w==
X-Google-Smtp-Source: AGHT+IEmLMp/D0QNJevDYMLRMp0mBTWELujqPt8xXnR9sEVc1PByWElS1L80M8Da1ScWVQSTQUb1nxbOD2vClVz1m7w=
X-Received: by 2002:a92:cdaf:0:b0:3d8:975:b825 with SMTP id
 e9e14a558f8ab-3da738d5b28mr76314015ab.5.1746693682592; Thu, 08 May 2025
 01:41:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
 <20250508033328.12507-5-kerneljasonxing@gmail.com> <20250508070700.m3bufh2q4v4llbfx@DEN-DL-M31836.microchip.com>
In-Reply-To: <20250508070700.m3bufh2q4v4llbfx@DEN-DL-M31836.microchip.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 8 May 2025 16:40:45 +0800
X-Gm-Features: ATxdqUEcxKj-NjeNAJFeUmwL48LxaGkk92YGikxUXT0m3HVba_HcMEWlVXVCuUY
Message-ID: <CAL+tcoCuvxfQUbzjSfk+7vPWLEqQgVK8muqkOQe+N6jQQwXfUw@mail.gmail.com>
Subject: Re: [PATCH net-next v1 4/4] net: lan966x: generate software timestamp
 just before the doorbell
To: Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: irusskikh@marvell.com, andrew+netdev@lunn.ch, bharat@chelsio.com, 
	ayush.sawal@chelsio.com, UNGLinuxDriver@microchip.com, 
	mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	sgoutham@marvell.com, willemb@google.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org, 
	Jason Xing <kernelxing@tencent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_094126_296551_28B9D172 
X-CRM114-Status: GOOD (  21.09  )
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

Hi Horatiu,

On Thu, May 8, 2025 at 3:08=E2=80=AFPM Horatiu Vultur
<horatiu.vultur@microchip.com> wrote:
>
> The 05/08/2025 11:33, Jason Xing wrote:
> >
> > From: Jason Xing <kernelxing@tencent.com>
> >
> > Make sure the call of skb_tx_timestamp as close to the doorbell.
> >
> > Signed-off-by: Jason Xing <kernelxing@tencent.com>
> > ---
> >  drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c b/dr=
ivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> > index 502670718104..e030f23e5145 100644
> > --- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> > +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> > @@ -730,7 +730,6 @@ int lan966x_fdma_xmit(struct sk_buff *skb, __be32 *=
ifh, struct net_device *dev)
> >                 }
> >         }
> >
> > -       skb_tx_timestamp(skb);
>
> Changing this will break the PHY timestamping because the frame gets
> modified in the next line, meaning that the classify function will
> always return PTP_CLASS_NONE.

Sorry that I'm not that familiar with the details. I will remove it
from this series, but still trying to figure out what cases could be.

Do you mean it can break when bpf prog is loaded because
'skb_push(skb, IFH_LEN_BYTES);' expands the skb->data area?  May I ask
how the modified data of skb breaks the PHY timestamping feature?

Thanks,
Jason

>
> Nacked-by: Horatiu Vultur <horatiu.vultur@microchip.com>
>
> >         skb_push(skb, IFH_LEN_BYTES);
> >         memcpy(skb->data, ifh, IFH_LEN_BYTES);
> >         skb_put(skb, 4);
> > @@ -768,6 +767,7 @@ int lan966x_fdma_xmit(struct sk_buff *skb, __be32 *=
ifh, struct net_device *dev)
> >                 next_dcb_buf->ptp =3D true;
> >
> >         /* Start the transmission */
> > +       skb_tx_timestamp(skb);
> >         lan966x_fdma_tx_start(tx);
> >
> >         return NETDEV_TX_OK;
> > --
> > 2.43.5
> >
>
> --
> /Horatiu

