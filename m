Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9436DCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=72EH5m1JIiQ8HjYUz65OXp9Zw63/fhkgRyPRxQjDTxo=; b=G1rfHB9bA1IblxChGQt9hh1DgD
	GK8ytA9roEjablGoUUzPeXwB9uATb+cxNke0P0FTpDZVjiPAsEceLbLHmTBx1/0JlfA9KtKNIkcc7
	7/lII8FxTZmpNRWF/garItHgFEeffAlneAupXqHr/xGtlAdVv9GBA1Cqp8Zx+d4AN3SE6Xp04S1SS
	xlIWOarOavA+TP7T/ZbayzrEWsbJCo9/FPKl/8l2Rugpf40Zf9F5VgK3HrcsVce4wIHYxXGWk7rFa
	Tmk71mZxYm5Txuhq5aqT2/IkbGzrZ9nuXNdjxaMGeVSJRgz7GVTwnJctYq6kCcDsjRCMxwaKBl0Hh
	atBaQMhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0kl-0000000Ffwb-1xJm;
	Thu, 06 Nov 2025 14:14:19 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0kj-0000000FfvI-1lVg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 14:14:18 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7810289cd4bso938277b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Nov 2025 06:14:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762438456; x=1763043256; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=72EH5m1JIiQ8HjYUz65OXp9Zw63/fhkgRyPRxQjDTxo=;
        b=RVumk+Mr/aLUmGAp6lzdFmzdW7lwQZBatchVC8fNFGfaXOnmgsTei5C+IAzLU6Y7B8
         g2STvlvMhf3EdIbeiDtDJ0uN9JD5lGTBBvajs5Uwk/PcLqfQ9WLQcVKwR3wNtd40Udfr
         ZQd/5c3yFpfyi4kNiG2FzMkcTkwl6ZbSHO6G293bydMo+jdQhfQt19uiwrJxIiVA9H2w
         1SGZww4Q7J6TJUNdKlQMNuPPcNEcnid4jkHHolbw8slP4ccDkcGTrnTBSaCO5nbjFztC
         oPx5sMKE8qo1mHuUqkAHTNfpY0nPKb6is1oNnD4u6jmt2Jm6sCte8+5aLfaH/uJ2QYt0
         hqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762438456; x=1763043256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=72EH5m1JIiQ8HjYUz65OXp9Zw63/fhkgRyPRxQjDTxo=;
        b=PMoaGpBEo4gftBHbI4GemuOtMRrAKks3Je9+7FdiFHJAVsRIZwVkuHNh8gXSuTr8c/
         qG6JKJweOvkqtUJbUWHyQUinsrXNmS2IfqvUPpdscGR7gFq9CCuF6llUTOLO5kzhb3jC
         qh0BJoebsS2DgEbVKJjV4vyo0PHPIG5G/Mvg5SLGxLgTx/xaZI+xSppHBl3v7U2SIPDH
         lTgDTv7wVI89JoudS0xUZrmZDX/FOJKTjCbfvb1bNvolzbriWXoCzUTE+ZZxGCP1Nj8o
         Kj2uwGsRG42EP9dUS1vhXedj1Rsfi7PrI+paUW21+h5oQeCMk6ndr4TrrDOvmT+dTIqx
         8e4w==
X-Forwarded-Encrypted: i=1; AJvYcCVsYOtZlYpUxOikD9VlOf14eJ+GI/mG4Tvr+RE/UQ5PQb1llH0VZnKhX5NQoIUP4sixCK+VdUK7T9CCDBkXS+/t@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt8NKHzj6Au7elJYL3h35BDxofOmRk9NU1vZ9w2yZZqPzLlIiO
	EX1Dg3uHnFaogb6XucgALjaXubUnBALV3G4jeHp/hNhxJH2vSg4RopSe
X-Gm-Gg: ASbGncsJRTFMlv5WqgEZnP+kBMFvb2QebPv0OWYpe417zkFXUiPcWGsYj0Tmr1+K8vQ
	s24kuc1Ijktoje1pRymjEuYtB8jItNPbTjSqqAEvDwBCbGFtheZYjIREe2PtupkJ+nyTTLWo5w6
	AQWbupa2GjoeDHr5AyWJEuFBtE9+GNewDvYDxt8TN0y7hpcyYaKCM/uyFp3BBN/yPJhJ0f8qczI
	+yZKru5gOVYpnK8+VLhxFFd9bNDCI60cm74pksnABq6aEOW0FevvSdldw9PO3HDASjNf7pbZkuV
	bWcy1Z5wjM3V3eZTgwIqqhgMWN3bjoh8kPwWKdHofmlnkshI6J4DVHWUEeCYDGCRMZg4DDuRoc6
	V4/Yn2sGVIKvMioyfjnfVN1YZ0nlE0LCMdtqUKyITxu4UP2b1Q2AdVotD6W+0EkDlG3GdIYf7LA
	DBOUrWkP1tJOrhjZqNgIKZPhBCBxBURxrrRDvsQhz7hzoJm8lZOK45bOS+OpJ2oMzeQ4mDxOpI
X-Google-Smtp-Source: AGHT+IEo3lyx4SSF6ocI62uHYt7YAX7f4+Hxtin616U9H0IjwoISSx5SOupuX9cHRYryvyjl4G9V4w==
X-Received: by 2002:a05:6a20:9186:b0:341:c4e5:f626 with SMTP id adf61e73a8af0-34f838e271dmr8901776637.7.1762438456066;
        Thu, 06 Nov 2025 06:14:16 -0800 (PST)
Received: from [192.168.99.24] (i218-47-167-230.s42.a013.ap.plala.or.jp. [218.47.167.230])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7af82208befsm2890508b3a.39.2025.11.06.06.14.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 06:14:15 -0800 (PST)
Message-ID: <4abd5327-ccb7-4dbc-9b09-e98069312e2f@gmail.com>
Date: Thu, 6 Nov 2025 23:14:11 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net V3 2/2] veth: more robust handing of race to avoid txq
 getting stuck
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: Eric Dumazet <eric.dumazet@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ihor.solodrai@linux.dev,
 "Michael S. Tsirkin" <mst@redhat.com>, makita.toshiaki@lab.ntt.co.jp,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-team@cloudflare.com,
 =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?= <toke@toke.dk>,
 netdev@vger.kernel.org
References: <176236363962.30034.10275956147958212569.stgit@firesoul>
 <176236369968.30034.1538535221816777531.stgit@firesoul>
Content-Language: en-US
From: Toshiaki Makita <toshiaki.makita1@gmail.com>
In-Reply-To: <176236369968.30034.1538535221816777531.stgit@firesoul>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_061417_475499_6C2F62E4 
X-CRM114-Status: GOOD (  17.86  )
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

On 2025/11/06 2:28, Jesper Dangaard Brouer wrote:
> Commit dc82a33297fc ("veth: apply qdisc backpressure on full ptr_ring to
> reduce TX drops") introduced a race condition that can lead to a permanently
> stalled TXQ. This was observed in production on ARM64 systems (Ampere Altra
> Max).
> 
> The race occurs in veth_xmit(). The producer observes a full ptr_ring and
> stops the queue (netif_tx_stop_queue()). The subsequent conditional logic,
> intended to re-wake the queue if the consumer had just emptied it (if
> (__ptr_ring_empty(...)) netif_tx_wake_queue()), can fail. This leads to a
> "lost wakeup" where the TXQ remains stopped (QUEUE_STATE_DRV_XOFF) and
> traffic halts.
> 
> This failure is caused by an incorrect use of the __ptr_ring_empty() API
> from the producer side. As noted in kernel comments, this check is not
> guaranteed to be correct if a consumer is operating on another CPU. The
> empty test is based on ptr_ring->consumer_head, making it reliable only for
> the consumer. Using this check from the producer side is fundamentally racy.
> 
> This patch fixes the race by adopting the more robust logic from an earlier
> version V4 of the patchset, which always flushed the peer:
> 
> (1) In veth_xmit(), the racy conditional wake-up logic and its memory barrier
> are removed. Instead, after stopping the queue, we unconditionally call
> __veth_xdp_flush(rq). This guarantees that the NAPI consumer is scheduled,
> making it solely responsible for re-waking the TXQ.
>    This handles the race where veth_poll() consumes all packets and completes
> NAPI *before* veth_xmit() on the producer side has called netif_tx_stop_queue.
> The __veth_xdp_flush(rq) will observe rx_notify_masked is false and schedule
> NAPI.
> 
> (2) On the consumer side, the logic for waking the peer TXQ is moved out of
> veth_xdp_rcv() and placed at the end of the veth_poll() function. This
> placement is part of fixing the race, as the netif_tx_queue_stopped() check
> must occur after rx_notify_masked is potentially set to false during NAPI
> completion.
>    This handles the race where veth_poll() consumes all packets, but haven't
> finished (rx_notify_masked is still true). The producer veth_xmit() stops the
> TXQ and __veth_xdp_flush(rq) will observe rx_notify_masked is true, meaning
> not starting NAPI.  Then veth_poll() change rx_notify_masked to false and
> stops NAPI.  Before exiting veth_poll() will observe TXQ is stopped and wake
> it up.
> 
> Fixes: dc82a33297fc ("veth: apply qdisc backpressure on full ptr_ring to reduce TX drops")
> Signed-off-by: Jesper Dangaard Brouer <hawk@kernel.org>

Reviewed-by: Toshiaki Makita <toshiaki.makita1@gmail.com>


