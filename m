Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 051B4C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 15:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jNWI+Nclv93Aye+gTppmcR/l9SWzqbEWpt2nqbIN0p0=; b=2V43KTVjcA8NIpZKTZFQuKogeR
	lxWmZ+nRB/Cymxu2Ybgtfcusam9Qkbja7f84DV3NS1YQqkfCXwthRdzuLjJfE6nt1m+wYbG7S+tEY
	qTXMzlzE8P05sOduZmSxmxYJ/o7yCnIXQIUV6tjcR8kkckET5JTeDe0VJ1sitxQneYLxJrQp7MQEi
	j6C+zVMPHSns1L5KKusqxicVq3scEio2D/4lOXd8As0RL62DR/aNBiHbw2+iiHZErKiabKqkjtXia
	ww3OpbILcqKjMhsKJfUadDu+AFBBMqYjY5/cKhoDYmI2qX4G1z73+7nLr1jq7cxkgivCjZpnSIVan
	yGTOgHqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD2mE-000000012CP-0RcN;
	Thu, 08 May 2025 15:03:10 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uD28Q-00000000tyH-49yX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 May 2025 14:22:05 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-5fc8d611fe6so81637a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 May 2025 07:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746714121; x=1747318921; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jNWI+Nclv93Aye+gTppmcR/l9SWzqbEWpt2nqbIN0p0=;
        b=FjNDfia70oXJKPm6LMJkPTY4azVQfXb9Dk1pJV3dXwnA1h+h+FTUqGQLMq7LUydWNN
         nhopYmFKBgqm5ckhixZ8LOZo9VCZsnVGzEbUyBLV2zL67z7dE3vhHdJnbyKbMghJYK6W
         3sDT0iSRxFcmOVbXBTIGMajYvwSUJvSHnOM8dme6qlLipCK5sOmfN66VOjauifrGWomm
         yperJHyMdYf3mjFnhs0/oM7EX8IrMm8k6d7C1dtZuOMUfDIw71Wour9cbw327Jn44FvT
         w75yhnFzFrX3gqnlbUbkFGIT4jUB/AzT6gEOkoRlS7g5bV1JoGkGH0JXyF5PQF53KWN5
         pplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746714121; x=1747318921;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jNWI+Nclv93Aye+gTppmcR/l9SWzqbEWpt2nqbIN0p0=;
        b=aY53vbdcY+0gVxkVYQwYS1xMz33VoFDgcVe3Ge4bi0Jx/8CKWenqy7NMuEa4T5OmCL
         iYXaoN7QvJFUwMhV+VkEAkPQdq+Eh5MJfJ6AGfc2jPhuV5xSje3k853d9YGKQqkp+1E3
         E0w2+ZDC3a5oBA59m4bFLYNQY8PjQL2M9bStd8/DcC3z10ICKJj9VnmIjx409bxUqZjW
         BDgInqfjEeKAD7L1wpOgg/4XHWxpx+f1WRFhznFr87dHbZvIZpGmFQiPZtwjyZzp9tms
         wk+oE1+qqfogD3U1sUexFHREqXdiIteyisG4xHtPbMjfz/Uili8VuGBS2+F0frsTu4oD
         6IRg==
X-Forwarded-Encrypted: i=1; AJvYcCUsijtMeroUqJpRuVI3O8bsyz1lBXP1l8bEhrIaR7MQASRnw5ZaH1n34Zxh3Da7VJWvY2LSbnrMnVGomHM3+rlv@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4o1dg9VJRgKaUTzMi1/WorTojaW7TZC4ZN9Nkxw4x+ljj3hrc
	GtI3RvkZev25J3fxkJUz46l9144W1zZRn03urv+2uSy94srFQxR0
X-Gm-Gg: ASbGncsPR2d4Y6ZbodVJXAm120yyBruAcAmXsgNeDLZIMP+fOKYB2FSbJmklr+L27Bj
	z5G11BmiTQWhVeHjaJemXBj5RRzkQEMI+MYrA/bj7gQj2J5AEBMvVOkdamDj72y+BkRdG7LhKPh
	hBsWr1Ylvj/Pf+OCOiQa5YxfMsKAMYPq0tPtprx9byc6mNqCtFFS+272iUoblqk+kz6G0tNFIYB
	qt2WLJeZmQvy/bdR8Wtnj9HRib1ZwL8Uuwj+f0ZTNct5N2XGeRuNRS1NLzdHqbHMBuqdCHBLh+8
	HAhadaWpVdOaIXBqG67LKuCJigdH
X-Google-Smtp-Source: AGHT+IFfZ2LnoFTAbLbT59dqIXofCuoLaOmROgL2oU2ZsTZgEECOqFTuOXZEyDYUdQu+N8uFOfThsg==
X-Received: by 2002:a05:6402:524b:b0:5f3:7f49:a396 with SMTP id 4fb4d7f45d1cf-5fbe9f5ad89mr2172801a12.7.1746714120949;
        Thu, 08 May 2025 07:22:00 -0700 (PDT)
Received: from skbuf ([188.25.50.178])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa77b8fe2fsm11502312a12.57.2025.05.08.07.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:22:00 -0700 (PDT)
Date: Thu, 8 May 2025 17:21:57 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Horatiu Vultur <horatiu.vultur@microchip.com>
Cc: Jason Xing <kerneljasonxing@gmail.com>, irusskikh@marvell.com,
	andrew+netdev@lunn.ch, bharat@chelsio.com, ayush.sawal@chelsio.com,
	UNGLinuxDriver@microchip.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	horms@kernel.org, sgoutham@marvell.com, willemb@google.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
	Jason Xing <kernelxing@tencent.com>
Subject: Re: [PATCH net-next v1 4/4] net: lan966x: generate software
 timestamp just before the doorbell
Message-ID: <20250508142157.sk7u37baqsl7yb64@skbuf>
References: <20250508033328.12507-1-kerneljasonxing@gmail.com>
 <20250508033328.12507-5-kerneljasonxing@gmail.com>
 <20250508070700.m3bufh2q4v4llbfx@DEN-DL-M31836.microchip.com>
 <CAL+tcoCuvxfQUbzjSfk+7vPWLEqQgVK8muqkOQe+N6jQQwXfUw@mail.gmail.com>
 <20250508094156.kbegdd5vianotsrr@DEN-DL-M31836.microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508094156.kbegdd5vianotsrr@DEN-DL-M31836.microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_072203_028210_97DD2F8E 
X-CRM114-Status: GOOD (  28.24  )
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

Horatiu,

On Thu, May 08, 2025 at 11:41:56AM +0200, Horatiu Vultur wrote:
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
> 
> > May I ask
> > how the modified data of skb breaks the PHY timestamping feature?
> 
> If it fails to detect that it is a PTP frame, then the frame will not be
> passed to the PHY using the callback txtstamp. So the PHY will timestamp the
> frame but it doesn't have the frame to attach the timestamp.

While I was further discussing this in private with Jason, a thought
popped up in my head.

Shouldn't skb_tx_timestamp(skb); be done _before_ this section?

	/* skb processing */
	needed_headroom = max_t(int, IFH_LEN_BYTES - skb_headroom(skb), 0);
	needed_tailroom = max_t(int, ETH_FCS_LEN - skb_tailroom(skb), 0);
	if (needed_headroom || needed_tailroom || skb_header_cloned(skb)) {
		err = pskb_expand_head(skb, needed_headroom, needed_tailroom,
				       GFP_ATOMIC);
		if (unlikely(err)) {
			dev->stats.tx_dropped++;
			err = NETDEV_TX_OK;
			goto release;
		}
	}

The idea is that skb_tx_timestamp() calls skb_clone_tx_timestamp(), and
that should require skb_unshare() before you make any further
modification like insert an IFH here, so that the IFH is not visible to
clones (and thus to user space, on the socket error queue).

I think pskb_expand_head() serves the role of skb_unshare(), because I
see skb_header_cloned() is one of the conditions on which it is called.

But the problem is that skb_header_cloned() may have been false, then
skb_tx_timestamp() makes skb_header_cloned() true, but pskb_expand_head()
has already run. So the IFH is shared with the clone made for TX
timestamping purposes, I guess.

Am I completely off?

Also, I believe you can set dev->needed_headroom = IFH_LEN_BYTES,
dev->needed_tailroom = ETH_FCS_LEN, and then just call
skb_ensure_writable_head_tail().

