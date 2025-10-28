Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8433CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fmSiJochkIHxmmPnWIdCnfE69r0nouu5mCKBjNvnml0=; b=nYxcR/y1Y41M0OCRgmetQyxVLn
	8AAqN7gIhGBlzehqZ5wfzV0Jq3YffcBeR2K6R7C1FsDlEzb18YzBNUtBFTzj6brhkvIVrzReiC1CO
	HPTQmMhM9MTKuLBa+JcyBfezlN5mmFU56kuEs8j4iMKu9oQ2zM2ke8nEZh1pOte4M+TGFyxFZyH0O
	kErfw+4WITn0A/j6p+4OIIDQ8MEWENARLjHmv6vWwrh0WnrQq6kheCPno2H2vPVlFuzDweMMMUfUz
	sRu9Ufj6sPlBvUSAnEbcMYFB5SrKK4CtwXls8qaTHBXOGVAmjSPOY49REKNyIL5JuBY9AdUsA1E7B
	AnmPjeCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfkY-0000000FcVa-2qTS;
	Tue, 28 Oct 2025 09:12:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfkW-0000000FcUn-1gYE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 09:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761642735;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fmSiJochkIHxmmPnWIdCnfE69r0nouu5mCKBjNvnml0=;
	b=R8aYLF5AVAOhF0UNJGY23UERWExOgOw8VrtB3uN7xq02jHYRVsZfP73oMiH1bI6Fe6zzpL
	FLk5ASTAraCUlKv2vZWErTlvXAdMrPxJPNtVeMrSK8wqD8uNYlUNJNGvXOMHm8EZsFWOh4
	EI6tMPua7w8jLUnZSCoh/o174KVXqf0=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-HRTbh0GYN6K3LeHZOgFo2Q-1; Tue, 28 Oct 2025 05:10:43 -0400
X-MC-Unique: HRTbh0GYN6K3LeHZOgFo2Q-1
X-Mimecast-MFC-AGG-ID: HRTbh0GYN6K3LeHZOgFo2Q_1761642642
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-634cdb5d528so7703644a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 02:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761642642; x=1762247442;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2jISGdCb1GJlrcq0k79tPP36lvaZ1ZSwf/Nio4tsSv8=;
        b=P/xh6e/8KnWASu5rNn9wIqf+/PjSsJ1LjyE155y+nxY0len9GSZfBWEFSlM/psRB3s
         GX1WY6AUf48j5zskyeZC7on+a0x2SsldfEe4FiYftIzYyjsyPje427JWJ3wa8likiPoY
         Pd1cbW9l4OeXraJEtbfQLZQ6xsgnU/0xXfICCaM8KRDO/wsVfHsS1aRBrmkPvVsWU+i2
         3gF3qwFOgHNpys4CJ5DjTTee+913QI4rUG24LhbDty4rJQAlORsJdigiUaIWY85US3ii
         VvVHtsU2Nslu9zkJaMWEStFhPDca9GZwirgsardLjacC8NxERnomg8Xyopjz68AjQvxH
         g1vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWGLi9mbCJvNHFvfrQW2KhFze0MnOCcrMVhlJ4prn1/1nJSYPQWzMgk9tt5xjGMSmhXevMjaEWlipkyN6ciSzVg@lists.infradead.org
X-Gm-Message-State: AOJu0YwYMIVGCTF1IrenmWaBuMcLw2AqWNFvCDLvLBIverGevcMG6nQG
	dskHDr8EFvLMwaf2K9MdOT7dBbJPgLGf3hFx3FbD/aoJUq6OAvoXVYfoQjRPk5tdLK9jPiucaX6
	XGVAgDpwCko9FATSIQkc1t9QI8vsGrunoGYEe9fRcQot6XSMWoBi8ySh1DYxbSSLoBZVLn8e2qW
	ql
X-Gm-Gg: ASbGncsgkGEHwpU72ITQI/yOdZceaNTrx/iyQIjlm2zCaBT5fBr7b6BJbIuMsQTkn/Y
	4HH9kZgausRwcQguS3JzxzLEvuCzXC+s/l2f9jtFOctRlz4GBbjmsWXSmkhW6/IfTDVUciSaOqO
	9M4aXm+3efTjqsnZVNItB95+LjdnphpXx7lt/MqQd0Z1VkpISy1FXVKuIpE15ddfAifsWDz2jGk
	O2pzq2KpyVklz8K4LonGF2DZtokAZzWqiFkDKe/vtqud66sRh/pvoeBXut8iThEYvK9g/9AiJnI
	4luTyvGfuLiI0o6qwsMy2K4DhXCu6SDDi9EcURLdNWasmB3piJpEky41Aqv3AJhv99M4nCv3iGI
	XNs71ctmnevaEt0Kys06Y8IA=
X-Received: by 2002:a05:6402:3551:b0:63b:f48d:cf46 with SMTP id 4fb4d7f45d1cf-63f4bcb889dmr2198781a12.8.1761642642409;
        Tue, 28 Oct 2025 02:10:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYL1I7iYELO1BGl1eN/tsiGHTTVmgI6PfKI6Bfdq9lP4t6LQVqj/exevSCIOYmz6JDfKXGcg==
X-Received: by 2002:a05:6402:3551:b0:63b:f48d:cf46 with SMTP id 4fb4d7f45d1cf-63f4bcb889dmr2198759a12.8.1761642641927;
        Tue, 28 Oct 2025 02:10:41 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6402a6be2eesm1007717a12.16.2025.10.28.02.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 02:10:41 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id 9DF882EAC76; Tue, 28 Oct 2025 10:10:40 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>, netdev@vger.kernel.org
Cc: Jesper Dangaard Brouer <hawk@kernel.org>, Eric Dumazet
 <eric.dumazet@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 ihor.solodrai@linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
 makita.toshiaki@lab.ntt.co.jp, toshiaki.makita1@gmail.com,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-team@cloudflare.com
Subject: Re: [PATCH net V2 2/2] veth: more robust handing of race to avoid
 txq getting stuck
In-Reply-To: <176159553930.5396.4492315010562655785.stgit@firesoul>
References: <176159549627.5396.15971398227283515867.stgit@firesoul>
 <176159553930.5396.4492315010562655785.stgit@firesoul>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 28 Oct 2025 10:10:40 +0100
Message-ID: <87bjlre6i7.fsf@toke.dk>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R0KFr0voLpVeoVhpHNQtUd8HILoSSqEcbB5aQbnXHJY_1761642642
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_021216_517157_EADF2FEF 
X-CRM114-Status: GOOD (  21.49  )
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

Jesper Dangaard Brouer <hawk@kernel.org> writes:

> Commit dc82a33297fc ("veth: apply qdisc backpressure on full ptr_ring to
> reduce TX drops") introduced a race condition that can lead to a permanen=
tly
> stalled TXQ. This was observed in production on ARM64 systems (Ampere Alt=
ra
> Max).
>
> The race occurs in veth_xmit(). The producer observes a full ptr_ring and
> stops the queue (netif_tx_stop_queue()). The subsequent conditional logic=
,
> intended to re-wake the queue if the consumer had just emptied it (if
> (__ptr_ring_empty(...)) netif_tx_wake_queue()), can fail. This leads to a
> "lost wakeup" where the TXQ remains stopped (QUEUE_STATE_DRV_XOFF) and
> traffic halts.
>
> This failure is caused by an incorrect use of the __ptr_ring_empty() API
> from the producer side. As noted in kernel comments, this check is not
> guaranteed to be correct if a consumer is operating on another CPU. The
> empty test is based on ptr_ring->consumer_head, making it reliable only f=
or
> the consumer. Using this check from the producer side is fundamentally ra=
cy.
>
> This patch fixes the race by adopting the more robust logic from an earli=
er
> version V4 of the patchset, which always flushed the peer:
>
> (1) In veth_xmit(), the racy conditional wake-up logic and its memory bar=
rier
> are removed. Instead, after stopping the queue, we unconditionally call
> __veth_xdp_flush(rq). This guarantees that the NAPI consumer is scheduled=
,
> making it solely responsible for re-waking the TXQ.
>
> (2) On the consumer side, the logic for waking the peer TXQ is moved out =
of
> veth_xdp_rcv() and placed at the end of the veth_poll() function. This
> placement is part of fixing the race, as the netif_tx_queue_stopped() che=
ck
> must occur after rx_notify_masked is potentially set to false during NAPI
> completion.
>  This handles the race where veth_poll() consumes all packets and complet=
es
> NAPI before veth_xmit() on the producer side has called netif_tx_stop_que=
ue().
> In this state, the producer's __veth_xdp_flush(rq) call will see
> rx_notify_masked is false and reschedule NAPI. This new NAPI poll, even i=
f it
> processes no packets, is now guaranteed to run the netif_tx_queue_stopped=
()
> check, see the stopped queue, and wake it up, allowing veth_xmit() to pro=
ceed.
>
> (3) Finally, the NAPI completion check in veth_poll() is updated. If NAPI=
 is
> about to complete (napi_complete_done), it now also checks if the peer TX=
Q
> is stopped. If the ring is empty but the peer TXQ is stopped, NAPI will
> reschedule itself. This prevents a new race where the producer stops the
> queue just as the consumer is finishing its poll, ensuring the wakeup is =
not
> missed.
>
> Fixes: dc82a33297fc ("veth: apply qdisc backpressure on full ptr_ring to =
reduce TX drops")
> Signed-off-by: Jesper Dangaard Brouer <hawk@kernel.org>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>


