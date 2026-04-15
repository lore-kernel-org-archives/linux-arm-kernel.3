Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B83CFF428F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 20:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A7UDYGzKJJe/bdquUBaYKdQJ1gprhVLDRlL+WM3sRcQ=; b=qaMBPtJ271BsovDsa4jimrojNi
	WkjLa6v2CZkXGGou4oqw98PfR8uT4/aUTR6tPv8/ZxyBRethhSHnIhe04mHy/AyMNYDDT8HaxmesS
	lLbHrHroMowYHRgh50G6meJLVEByZJpLrSzaSMP0qdcB0o9DkhP9xR6u/mZ8d2ClKdrjIngLosaLC
	y+jM1wwl5JnAddZ9yz6PM5GS9XtFROAzG0gHCr043KOYaD56vJCTCGi6B+xn9fWav64kaPFbJNH0J
	LQbbGyBqoqEDnuDIjur5gzmle/MxE+vweUmt0ZHKBIBquSvwh6yxDleX6bGKECPT0bNYu0RCfvik1
	rV3hIymA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD7CY-00000001bWh-2W9A;
	Wed, 15 Apr 2026 20:51:11 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD7CV-00000001bWG-3LdW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 20:51:09 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-43cfe71e5d3so5619060f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 13:51:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776286265; cv=none;
        d=google.com; s=arc-20240605;
        b=X599ei8aYZvL2hHDAe1dLtOwpVX2pxDRTK+vqUuDysHpNEyERzGRFyoGC2wlCSKYyM
         i7DGG7rwxiiiTtg3/4l+tijSr30pbX1KTG4Fr99GvxhgbfMzvl4r0GkoOPLiK+NyC4rX
         PFK3Mv0Q1eRhw2P8igA8fj6GHq2DrxG3SHAUr6g0ebhG516mMwnMtyrxIQnLtOOOno/q
         jQ5Np2DtlNG0sry5vtFlysWUEPD1fTkB0AoyUu4hLhM0SGj0qrJCYFhVOhUFC3w4W7xb
         1BeR6xRZp3+BsunLgvL4qcA59jqRge/rfVr1yQKLAnvE8KM/ywO22noI+UCOhgLDPAEN
         PjFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A7UDYGzKJJe/bdquUBaYKdQJ1gprhVLDRlL+WM3sRcQ=;
        fh=ui7KEHwlDtnl1mECNsdbjIpqofwvdMfsCTxXbhHXk7w=;
        b=SdQNnEG6sBrSojRvTWr9QMXJ6YZ6y2S+OP6v5Gr6TFPZT5iZHD3k2PLNnykQYjgITw
         QUSyHGc3tSmBmAl6n06Be4a7P4VAHAq7fpEN3nliXG3u47+dsnUFqLgrVT/esxGI4bId
         uqvXdNeKOy7hu3tXbwPVqhYJw8HDu3I4x14X7hBDEU/wy02VkgdY5/zAAMdt9YpqJ2X6
         8aQZRyRNJ7bSPypqetxFZzjGxu1LItPiBOhpWip24d6chRevkXYAXU3lh5g36lCsRJef
         dTgoVUbVVu8leb0CnojtKFwwHN1+R/GFQLJMJonIde/8WOrv/pOnnnFsTHHoo/kOnc4U
         HBWw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776286265; x=1776891065; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7UDYGzKJJe/bdquUBaYKdQJ1gprhVLDRlL+WM3sRcQ=;
        b=Ji6W9rwQOlSF6D/rYeS3lkCC1rADtXdRFZkRx4rFPgsYVi12/Drm3Mgb26NzB9Edxv
         M+UIKqs3r1pfkYm9Q4YlxQmFtZa2tlgwp1NGAV/fia1pbJqSiZf8yRxfP6cGEZ4HFKKK
         Jaf3mAC710Cht2227r7WtZ68rSuUVt2+WxNnj9aSxxllqLd+hs2bhzDNRFu+0tgnBpFd
         G8DQHPjg4ITKYvk+vEDmB6kseHxjM8gMrh2k6zM1UTBPOF60RA0TXNZ19k2D0Ui44pZ6
         XBRKTy/ZwbSxShI0BzvIUqeEhqQQFq5w0WFuPddoPdnNARLSzXy7GSlt7DiMJp/FeZQF
         o/VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776286265; x=1776891065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A7UDYGzKJJe/bdquUBaYKdQJ1gprhVLDRlL+WM3sRcQ=;
        b=CEGoH5bUYpXCI1H58gtNTA+gX/jvMk6Qlo1+i3lcAEBNwD38x8jCjCxiqORjSivvMy
         C1Oy1dZuCAFImMp60t+d2PZluwvyUXmzJkCa0wBhmjcy+KVIPCEevFWQQmyBHupMjaLY
         R/ksoKZKKEcD+BXtSpApJhN+GbfamIloZQgJUFCA/O8oJwqjrj9gw2BeJYOcS8I4t6/U
         2QuEeVjVTpq5+MjNNjlPyQnhCTdM6SWFK40QpeDvmaQgRg4ovmN/DJaq1zxt37vyWJBS
         /e2hGtCAeo0NvHf4enrefIjAsFcyDIcjcoIOh+k1ZXX6NwadbvmaQ3mVKkvgF0X0+Z4F
         euFw==
X-Forwarded-Encrypted: i=1; AFNElJ9TyhpRDjv/ltH8MXhdRw2zZXbF22eoKyMaCfNj/JSyTuTe3S8vkDYiwK7DsJP5p5YpddT72YASdVkb3dqwtq8B@lists.infradead.org
X-Gm-Message-State: AOJu0YxnzQCkoq4A6IQBXXh7rpV3UkoNFX+szV/8Y39OeCUWzGBLPk2I
	WFIrx5DYpId8hqFFahhy8JMicXiyU5Sv7o1MSvBD66jOvrVZy5Z4jd1WkTw91q1q2kJuD1d8nvo
	SvRxy81qDgfEChsSKJ5hRwrwBHdb+JKY=
X-Gm-Gg: AeBDiesDEkFKeybNikPY/lj5jy2Ud9ZKC7NDXM2Mdw1Y41XnvF9Gg9gvddng3fTf8gL
	lpy0be0zmBuP8Wy2OPTTaHZ3FxHTyhLHD57ZiCrl+zp22Mi/b0voiDLk/vZqZIfqJ5EP3NA5StM
	ABc8WbJXEXkPwik3Ji+255pXlaQXEdkMw92EtetXtPHj83k4zNVxP3ozGiRYLzjKqI6YivYsVT+
	J2pASCr5o8ShyEqacWESv1FWNcaMe2RaEFHVHedjHMT1lYoYIgBVVxBcAJon8ADn1fP5V6j8D9L
	6acY7z4L271niDYCOVYhcJeB5ejjrEvIq4xvM9qNWF0cLxud5jc=
X-Received: by 2002:a05:6000:220b:b0:43d:30b4:1859 with SMTP id
 ffacd0b85a97d-43d64235cf5mr34620475f8f.7.1776286265230; Wed, 15 Apr 2026
 13:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <E1wBBaR-0000000GZHR-1dbM@rmk-PC.armlinux.org.uk>
 <20260413110222.49fc3759@kernel.org> <ad06yiZZbLC9k3jY@shell.armlinux.org.uk>
 <CAH5Ym4i7VV53hQGY3AjAUW3B8g_ffgmw69kPhPrk2CmcRbguuQ@mail.gmail.com>
 <ad5LlXzeQ8j14Mjg@shell.armlinux.org.uk> <ad7nsUQvksJF7JFK@shell.armlinux.org.uk>
 <CAH5Ym4jA8w9=UxMT4vKJpnXkuDHtkFtMcg4u2sy_0S+8wgy-9w@mail.gmail.com>
 <ad-ID2WaPgPJqdsa@shell.armlinux.org.uk> <CAH5Ym4jKdzDeYwCfkMLmUz0FsiD2vFwfuAvqFE=uvMtPmakeMQ@mail.gmail.com>
 <ad_o4aDP0UBY_8i4@shell.armlinux.org.uk>
In-Reply-To: <ad_o4aDP0UBY_8i4@shell.armlinux.org.uk>
From: Sam Edwards <cfsworks@gmail.com>
Date: Wed, 15 Apr 2026 13:50:53 -0700
X-Gm-Features: AQROBzD5XBS99VCDwyzmkg2_ABsUHqZK9kvqTm38xxMES7dhJirfHEs2edhZQVs
Message-ID: <CAH5Ym4j3GePEMEMmg1Z27gYfQ0N8Sc1BMW1rnvNZ4aLQ+cfFyQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: enable RPS and RBU interrupts
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Linux Network Development Mailing List <netdev@vger.kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_135108_157493_D686AB8C 
X-CRM114-Status: GOOD (  44.23  )
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

On Wed, Apr 15, 2026 at 12:37=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> It's not a question about how I define RBU - this is defined by Synopsys
> and I'm using it *exactly* that way as stated in the documentation.
>
> "This bit indicates that the host owns the Next Descriptor in the
> Receive List and the DMA cannot acquire it. The Receive Process is
> suspended. ... This bit is set only when the previous Receive
> Descriptor is owned by the DMA."
>
> In other words, DMA has processed the previous receive descriptor which
> _was_ owned by the hardware, written back to clear the OWN bit, and
> then fetches the next descriptor and finds that the OWN bit is also
> clear.

I'm only trying to leave open the possibility that the Synopsys
technical writer and the hardware implementation team weren't
communicating clearly. We already have a situation where RPS isn't
behaving as documented (even if that's likely just hardware
misconfiguration), so while I'm currently pretty sure RBU carries no
other (actual) meaning than "DMA caught up to OWN=3D0," I'm only about
75% confident.

> > It would seem* that the kernel isn't really failing to keep up with
> > the packet rate. If RBU is firing with a ring that's not even close to
> > empty, that tells me there's another way for it to fire. So I suspect
> > the hardware designers implemented it to mean:
> > "We couldn't read the next descriptor, _or_ it wasn't owned by hardware=
."
> >
> > (* However, if bit 31 is clear everywhere, wouldn't that mean the ring
> > is actually completely depleted, not full? If count=3D=3Dbudget, wouldn=
't
> > that mean the whole ring hasn't been visited, so we only refilled 64
> > entries and not necessarily the entire ring? Maybe the kernel isn't
> > keeping up after all.)
>
> Ah, I think that's where our terminology differs.
>
> You seem to define full as "populated with empty buffers". I define
> full to mean "the hardware has filled every buffer with a packet that
> it has received and handed it over to software to process." Note even
> the terminology there - filling buffers with data. That ultimately
> ends up filling the ring, and when completely filled, it is full.
>
> I think of buffers like buckets. If a buffer contains no data, it
> is empty. If a buffer contains data, it has been filled or is full.
> Apply that to a list of buffers and you get the same thing. Many
> ethernet driver documentation uses this same terminology, so I
> thought it would be widely understood.

Ah okay, I was beginning to suspect the same. In my defense: though I
also think of buffers in the same way, this driver calls the process
of supplying empty buffers "refilling," which is also the terminology
we've both been using throughout this exchange, and when something is
"completely refilled" I generally call it "full." But I'm realizing
now that the bidirectional (submissions+completions) nature of this
ring means that "full" and "empty" aren't really well-defined
concepts. I'll try to read more carefully (and switch to saying
"completely dirty" and "completely clean") going forward.

So the kernel is able to supply clean buffers without issue, but it
somehow falls behind the incoming packet rate and the DMA is left with
a completely dirty ring. I agree that stmmac_rx() is therefore just
not running fast enough: either it's got really bad scheduler jitter
for the ~6.3ms minimum it takes for 512x full-sized Ethernet frames to
arrive from the PHY (your scenario 1), or -- more likely -- the NAPI
budgets gradually fall behind the hardware (your scenario 2).

> Right, 40KiB. Sorry, I'm getting interrupted almost constantly while
> trying to do anything.
>
> However, I've tested with 0x7f in both fields, and it still falls flat
> on its face. I've also tried other values, but because I had to unplug
> the laptop from the nvidia board to use the laptop portably due to the
> medical emergency situation, that caused screen to quit, so I've lost
> all that. Chaos reigns supreme here :/

I'm sorry to hear about that, please prioritize you/yours and don't
feel like you owe me speedy replies.

> So, I'm not sure we understand what's going on - I don't think it's that
> the FIFOs are smaller than specified. I suspect that the 9KiB vs 36KiB
> results in some kind of throttling that prevents the condition which
> hangs the hardware.

I'll try playing with the FIFO configuration on my end to learn:
a) If a suitably-configured FIFO size makes the RPS status arrive as docume=
nted
b) If I can safely fill the FIFO slowly (by manually stalling the
driver and adding frames one at a time) and have it drain on resume
c) Whether the TQS value can be adjusted independently of this
problem's prevalence
d) The maximum RQS value that allows the problem to happen

> I'm not getting as much time as I'd like to really test out scenarios
> due to everything that is going on, and honestly I feel like just
> writing this week off now and giving up.

I have the same hardware, observe the same issue, and find this
interesting enough to keep plugging away at it. I would have no hard
feelings if you left me alone with this problem for a bit. :)

Be well,
Sam

