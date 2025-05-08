Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8FE5C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 12:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYX8qqDD4JOYlfuvNPe4ZEMyg6c1lBo9WKWQB/eyoT0=; b=Eqw/1YzhTyH1e8HVkfKkzIInko
	FS0D5ifAJ+Z1N2oE0hGXmnpOV9UgfY85SvD4q7XYBp3X3wdLBtcmHMN3p9mjDAaySBYpGpO7OWQTO
	3/2+dWzgr5u3KVzQiVVuDfEcxxdBOsuz7C1fI5b2LT8FPMnRWIjwEmtKce3JQKKd8p8J8ZPSzlb6W
	bZI7sDfxTtldEfG3BY+4nCgAzGQvTVaTM21nVI6QV9qhuDuRIz1Tewyxl9GX28csO8GbpSMlW6wU/
	tieJYpOpL3p3lS8zlC/lVnF/kPINF/cIiNJJMevsuYVTSHbT4rdkqt1884dzE0YIYA7qcf6R2g9gK
	hgQ9PZdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0LW-00000000ben-3ra2;
	Thu, 08 May 2025 12:27:26 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD0Hf-00000000atH-30mo
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 12:23:28 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-476b89782c3so9996781cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 05:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746707006; x=1747311806; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jYX8qqDD4JOYlfuvNPe4ZEMyg6c1lBo9WKWQB/eyoT0=;
        b=EOKECUrpQp/57D/stBG/ux5BJJKrZFNM+YWYZdKI/xn98gLaCZzLaahc4Ue8czvn+7
         VJ2f3u0SXPMjD1R+V+hgvlCjZOd2LcRwj6LHx3Cfuao59qRc7opwWTAG1BWoS3qdXrLa
         faec4yL+djE7SwWNhCo5GVA0LPq8k2eNoh9X05rqfH7aBCxbOFKrEIXg/ePD1bcgb1E8
         CcQ3i40V067IGCgJefdcJkGg/vc2NvATy+hZal/0SIfA67G9J+EBLbWOE0Me5B0aEKHS
         NLJRRhmhR8lTnH4NzlQ2euHYHdgrMBLgapwkPTXUpdDmWKvBhRc3qpPYJilti75uwyTR
         V34w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746707006; x=1747311806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jYX8qqDD4JOYlfuvNPe4ZEMyg6c1lBo9WKWQB/eyoT0=;
        b=EgVLaebdOEjbK4PXirvoHz6wJgicY9Kxveour8fFMoqjrd+9N5CQ7uZGAxED0v8TwM
         lgRI8hvmw/kbzNmPy2/RcQtHA1GKEiDBpj83Eiee4pE5CkCf6p08hKK7YCGqbicZ42BD
         R+saRVdPB+WjSqjMWC1fqVbtrptw2hj6je9KNkMakNxOy8vEA2pZMfbDKEjTwcb9vxHB
         ArbqPNOqCzAm88+3OgyiGn5YTgMFNGyPpa5e98vZfRMHVLSO85mITebWfC/IsXnE+0HD
         MtJTA1+41JYX7FiQxcdZqr9jZllKR1+CqSw9AS4o8lXMsIv60xjW3+I/frrDMRv7phIo
         u08g==
X-Forwarded-Encrypted: i=1; AJvYcCUmtpVtnwS+Txn7skVHwscE6JC8v2YnlIFrI5u9/EM7fBqDSbB7/TxQa5MODV60arbX6ctKJUD4B9blEfNsIUSH@lists.infradead.org
X-Gm-Message-State: AOJu0YznWH9Ve14C/RmMWsNnqsmSFtgHsdqpvjQcTZ741f9BmqO+1IVI
	aj93VP8He9qaMZdTixN4gNVZ6HkME+FefvlF4Vzd36xL+es21fKlAAXFFlnYlla/vsMXxCIbh1S
	9uXkMu9wjcv90+fbwLKiXV+ZgeOsV7h+QmBQ=
X-Gm-Gg: ASbGncsaBL3OAFLv+87IiRXmY4Ia87chPRe8MjicAScbl6VYOWzb2jP/S9ptW95gZuA
	NKz0pPJhQkfvEHeI089WfPhw9xFbVWPKrkuNXeE0u9yEP0rbWFufsQj7CpBLbx37Y/ABVs+d1Ph
	fVjjJqfeLl5Xolx77OQQV88kNtTG/wcq54
X-Google-Smtp-Source: AGHT+IE+uL01gV6BnaJuogyasEEOBXMdeInFnUaS5xfQn4hQfGn/seeOu61dluwOGAXIkgHX/HPbWChIzJK/4OO/xCI=
X-Received: by 2002:a05:6e02:12ef:b0:3d9:6cb5:3be4 with SMTP id
 e9e14a558f8ab-3da7392c8d3mr79276605ab.15.1746706996046; Thu, 08 May 2025
 05:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
 <20250508033328.12507-5-kerneljasonxing@gmail.com> <20250508070700.m3bufh2q4v4llbfx@DEN-DL-M31836.microchip.com>
 <CAL+tcoCuvxfQUbzjSfk+7vPWLEqQgVK8muqkOQe+N6jQQwXfUw@mail.gmail.com> <20250508094156.kbegdd5vianotsrr@DEN-DL-M31836.microchip.com>
In-Reply-To: <20250508094156.kbegdd5vianotsrr@DEN-DL-M31836.microchip.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Thu, 8 May 2025 20:22:39 +0800
X-Gm-Features: ATxdqUF7fr2w19MfngP-Su9tvfrXMs7O2uRtM2xM9K46rrKLvtXS-sBBlIBE5e0
Message-ID: <CAL+tcoBrB05QSTQjcCS7=W3GRTC5MeGoKv=inxtQHPvmYcmVyA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250508_052327_754286_7DD91645 
X-CRM114-Status: GOOD (  36.99  )
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

On Thu, May 8, 2025 at 5:44=E2=80=AFPM Horatiu Vultur
<horatiu.vultur@microchip.com> wrote:
>
> The 05/08/2025 16:40, Jason Xing wrote:
> > Hi Horatiu,
>
> Hi Jason,
>
> >
> > On Thu, May 8, 2025 at 3:08=E2=80=AFPM Horatiu Vultur
> > <horatiu.vultur@microchip.com> wrote:
> > >
> > > The 05/08/2025 11:33, Jason Xing wrote:
> > > >
> > > > From: Jason Xing <kernelxing@tencent.com>
> > > >
> > > > Make sure the call of skb_tx_timestamp as close to the doorbell.
> > > >
> > > > Signed-off-by: Jason Xing <kernelxing@tencent.com>
> > > > ---
> > > >  drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c =
b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> > > > index 502670718104..e030f23e5145 100644
> > > > --- a/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> > > > +++ b/drivers/net/ethernet/microchip/lan966x/lan966x_fdma.c
> > > > @@ -730,7 +730,6 @@ int lan966x_fdma_xmit(struct sk_buff *skb, __be=
32 *ifh, struct net_device *dev)
> > > >                 }
> > > >         }
> > > >
> > > > -       skb_tx_timestamp(skb);
> > >
> > > Changing this will break the PHY timestamping because the frame gets
> > > modified in the next line, meaning that the classify function will
> > > always return PTP_CLASS_NONE.
> >
> > Sorry that I'm not that familiar with the details. I will remove it
> > from this series, but still trying to figure out what cases could be.
> >
> > Do you mean it can break when bpf prog is loaded because
> > 'skb_push(skb, IFH_LEN_BYTES);' expands the skb->data area?
>
> Well, the bpf program will check if it is a PTP frame that needs to be
> timestamp when it runs ptp_classify_raw, and as we push some data in
> front of the frame, the bpf will run from that point meaning that it
> would failed to detect the PTP frames.

Thanks for the kind reply.

It looks like how to detect depends on how the bpf prog is written?
Mostly depends on how the writer handles this data part. Even though
we don't guarantee on how to ask users/admins to write/adjust their
bpf codes, it's not that convenient for them if this patch is applied,
to be frank. I'm not pushing you to accept this patch, just curious on
"how and why". Now I can guess why you're opposed to it....

Thanks,
Jason

>
> > May I ask
> > how the modified data of skb breaks the PHY timestamping feature?
>
> If it fails to detect that it is a PTP frame, then the frame will not be
> passed to the PHY using the callback txtstamp. So the PHY will timestamp =
the
> frame but it doesn't have the frame to attach the timestamp.
>
> >
> > Thanks,
> > Jason
> >
> > >
> > > Nacked-by: Horatiu Vultur <horatiu.vultur@microchip.com>
> > >
> > > >         skb_push(skb, IFH_LEN_BYTES);
> > > >         memcpy(skb->data, ifh, IFH_LEN_BYTES);
> > > >         skb_put(skb, 4);
> > > > @@ -768,6 +767,7 @@ int lan966x_fdma_xmit(struct sk_buff *skb, __be=
32 *ifh, struct net_device *dev)
> > > >                 next_dcb_buf->ptp =3D true;
> > > >
> > > >         /* Start the transmission */
> > > > +       skb_tx_timestamp(skb);
> > > >         lan966x_fdma_tx_start(tx);
> > > >
> > > >         return NETDEV_TX_OK;
> > > > --
> > > > 2.43.5
> > > >
> > >
> > > --
> > > /Horatiu
>
> --
> /Horatiu

