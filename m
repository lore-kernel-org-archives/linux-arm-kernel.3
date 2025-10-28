Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 692E4CCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 09:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a+bxCUsoSeqZHBYDmX8iTmDxKq3AR4DyHJkeXRkgEKU=; b=va2xqssMa4uMbw6AYEx9T8VGzk
	w9H6xJMOiV3TPV8kBiFlk0ZkR97sltTLSr3n9i/Z3oaFFOWYioq/sHDETcCl2FpcCQIMletDeQMHP
	0yBFHBHNt5UffkKs/6rB59i7OOOAywvmPWIB2BqgEplEzk39ieJlPjFIEs43Jir/ALIoKmwn5fX7S
	UyaFTLuiaMb23B5UUza7CoivaAx3bwFOeqZ4EQhune82rTQ/IOdsax66dh5bJKLqOgU6+ZTeu9L7X
	Wee5NS9TmHwDlh57YS4Y1lTWOk1NmEzxXpWwXGutrmlnLp96cYpwIb5buoyRgg0Or77oPj4rRHNTW
	Q8YjxNqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfkO-0000000FcSy-1Uo5;
	Tue, 28 Oct 2025 09:12:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDfkL-0000000FcSF-3m2S
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 09:12:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761642724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a+bxCUsoSeqZHBYDmX8iTmDxKq3AR4DyHJkeXRkgEKU=;
	b=YfhRYV5EJPwMjh3PHIc0uzXo+YbRdxFxyxDsd6N4N0LBIW5TH15BnZtMcWZRTenzKOuTdF
	Rs24j6CTzVlkg4G6bxh+CTc0fJY3yAxaUvnYOvy9xJC+u5ychA56pDs/9mK5oFYZCy1uZ+
	Y8+hOcCtVudhihI/PS/Z36yJzOrSn/Y=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-389-kxySOSR7NzmLtBEPaLOzlQ-1; Tue, 28 Oct 2025 05:10:31 -0400
X-MC-Unique: kxySOSR7NzmLtBEPaLOzlQ-1
X-Mimecast-MFC-AGG-ID: kxySOSR7NzmLtBEPaLOzlQ_1761642631
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-b6d69801188so440500466b.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 02:10:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761642631; x=1762247431;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9fC2VCoLVnfLvc+GVN6vMzms7DTor0VnmsdHYFXK6aw=;
        b=kJJocVd7ZErftpsX+zItJSuPKb7Ac2cQwpnw9I3HI16ecwq6fPA1Xjk/vAe0GxmyuM
         1Ke+N5sa3MwZAQLm1vgdsHjDcs8ITd/u24k1WCUR5QUrL9ORCezOX/8fVKDSdSna9CO7
         7wxAUh7l2+MntK0pU3SWyRPb3+NrzgNzYIZ3FVLu+0kIKEoOqBQNaxF25fh1ECUCpDEM
         0d2C2lNCr4zk+NrPQvkrJK2kgJBNoZf7ZW+mLKvfXeWx9SkRHGdZXLc4Kq1AgcpTQvF3
         Ra8w1HSXs8lesnKJKeBMUGd44mPEGFCE0p/qnHWQkB4Bx1TOZzo3qQ3U5waBj++T1/Q7
         IVSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYJFBBIP8gYC94cFeeEbsWkDBG9XJ4209XzpyWPM5hEwsb50FZ+zGgqK4yim9AjqB1Cq8rm6rBkKfZeHvJf5Bb@lists.infradead.org
X-Gm-Message-State: AOJu0YzZ4i3CWVYTA+VbNPBPGgPh5VWHIU8RU77vhiKV8C98l25AnlUZ
	NWrlvFXwYEoN7xD2XehYk6G4XRo1bdonHTC3H7R2cAufCKlu9UehVfvbaEdGUMGxGblHBsmeVeP
	Az1II3N/2wKtq8fmtK2NaBvETQfNFk+tWtJTGAAknVQpleEViOMFQ+e0i87lVwVztG7a1ZfutqR
	uv
X-Gm-Gg: ASbGncvnrE3JF93aqQ3JItwo5x/leVxme8egyBKy5//l99nJgsMC3ntCbgp5ewYmD1I
	frwoRHMreoQwNcBTe/uHRvQpo7iAErPgfj/tgD9bVec3K3zmFDTpT2ovm9jTbepYroNAs/zur36
	WHAdQWUgz5ffvd2eP2qGONVDNYBugK7A/nlusGrjQfv2b9UJcsM1UZL/lAA8X+1Rx4HQ2kxBs7u
	nmEvY6KWcvwzzW4qPGjc/h3DosVo6TLnMNz6lYE+v86XPTYeSqIl1wCXYshmJYqaqCl4YkyEEnI
	wnW4aH8ZwJEQqtQKIlKqOJ3z8DhS2pq+v3BBDoK213zvapLSULCt7WiMY5xwAK5gJ23z8E4ROUw
	UKznycanetpAyZUcplBlyVwA=
X-Received: by 2002:a17:906:7314:b0:b6d:5f02:51e1 with SMTP id a640c23a62f3a-b6dba48ed89mr308758066b.20.1761642630688;
        Tue, 28 Oct 2025 02:10:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp5fIM3h+FEyqEOS5MHMS5ieohkbVb2Z5rr/lbPP90LvTja8uJXC93IQE7iLbY3k1MDqtHAA==
X-Received: by 2002:a17:906:7314:b0:b6d:5f02:51e1 with SMTP id a640c23a62f3a-b6dba48ed89mr308756366b.20.1761642630332;
        Tue, 28 Oct 2025 02:10:30 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8548ed9asm1045251566b.74.2025.10.28.02.10.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 02:10:29 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id C0E5E2EAC74; Tue, 28 Oct 2025 10:10:28 +0100 (CET)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Jesper Dangaard Brouer <hawk@kernel.org>, netdev@vger.kernel.org
Cc: Jesper Dangaard Brouer <hawk@kernel.org>, Eric Dumazet
 <eric.dumazet@gmail.com>, "David S. Miller" <davem@davemloft.net>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 ihor.solodrai@linux.dev, "Michael S. Tsirkin" <mst@redhat.com>,
 makita.toshiaki@lab.ntt.co.jp, toshiaki.makita1@gmail.com,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-team@cloudflare.com
Subject: Re: [PATCH net V2 1/2] veth: enable dev_watchdog for detecting
 stalled TXQs
In-Reply-To: <176159553266.5396.10834647359497221596.stgit@firesoul>
References: <176159549627.5396.15971398227283515867.stgit@firesoul>
 <176159553266.5396.10834647359497221596.stgit@firesoul>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Tue, 28 Oct 2025 10:10:28 +0100
Message-ID: <87ecqne6ij.fsf@toke.dk>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NTW0KX2hJt288lg3AQpupOAfy_vYigOIG4vUgBlT_ZQ_1761642631
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_021206_008901_E1FD0253 
X-CRM114-Status: GOOD (  14.48  )
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

> The changes introduced in commit dc82a33297fc ("veth: apply qdisc
> backpressure on full ptr_ring to reduce TX drops") have been found to cau=
se
> a race condition in production environments.
>
> Under specific circumstances, observed exclusively on ARM64 (aarch64)
> systems with Ampere Altra Max CPUs, a transmit queue (TXQ) can become
> permanently stalled. This happens when the race condition leads to the TX=
Q
> entering the QUEUE_STATE_DRV_XOFF state without a corresponding queue wak=
e-up,
> preventing the attached qdisc from dequeueing packets and causing the
> network link to halt.
>
> As a first step towards resolving this issue, this patch introduces a
> failsafe mechanism. It enables the net device watchdog by setting a timeo=
ut
> value and implements the .ndo_tx_timeout callback.
>
> If a TXQ stalls, the watchdog will trigger the veth_tx_timeout() function=
,
> which logs a warning and calls netif_tx_wake_queue() to unstall the queue
> and allow traffic to resume.
>
> The log message will look like this:
>
>  veth42: NETDEV WATCHDOG: CPU: 34: transmit queue 0 timed out 5393 ms
>  veth42: veth backpressure stalled(n:1) TXQ(0) re-enable
>
> This provides a necessary recovery mechanism while the underlying race
> condition is investigated further. Subsequent patches will address the ro=
ot
> cause and add more robust state handling.
>
> Fixes: dc82a33297fc ("veth: apply qdisc backpressure on full ptr_ring to =
reduce TX drops")
> Signed-off-by: Jesper Dangaard Brouer <hawk@kernel.org>

Reviewed-by: Toke H=C3=B8iland-J=C3=B8rgensen <toke@redhat.com>


