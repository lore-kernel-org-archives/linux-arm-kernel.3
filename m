Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECEDCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 14:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cpT9v3vZsTqou8arP0DXWnWYqvjSdGYFzEcyXBF9plY=; b=dE9TbFOHHwIjO+8MBDGFi7+I1r
	9EAkIN9KUM/ZcHE0Q+/hUR9AkZSptDSzl6bF7yWyj4Dv2jizMYwI+CXdukVkv2J42wxGTdYmlpas/
	wOqiZUjCTk/yZpYa23jr/McrFTwHkirsA9EWj9GNSoZjbl0jHdN+ivUAK/4SpNTfXIIF0hqDrAg4q
	w/tfpOBrfg/Z/XWRbbwiLLEkiP3A7vMoTKdpD0ndxeFpyGUAfYL9A0DSmutc0jAw2pP4XCAvilK7v
	alldZRcWcDCS8AzUrNE1EpxsgMl8/X/wUzCyj6WcJTqA+FrvBYKovjc9WUDJyb3juGecdd2rfcBDg
	Y13NkfPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDl7u-0000000G7p7-0GX7;
	Tue, 28 Oct 2025 14:56:46 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDl7r-0000000G7oW-3zQA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 14:56:45 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7a2852819a8so4244880b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 07:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761663403; x=1762268203; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cpT9v3vZsTqou8arP0DXWnWYqvjSdGYFzEcyXBF9plY=;
        b=nE4TLq1BZVfKWrySfutQprl/0Q+jLAyklJ/wESbPrQQD5vENMxsto/6R/DbjGMO+4j
         zYeaHPX2V/Jv+6mYJHfFKGHNZyWdU+blG7u+TKThxiXeh7sNP2jk2Gx/zjqj9uMN083n
         DkS6f1zEfQ9yZ5Pi7hr6UinCFuiQIZBdWQyC0aiKpv9Tp0v5cqmqRmdsdxCQVs8TMLu6
         8daoEkTgoo965nkYmIIT6ydH2JoV58Rms60/HXA8FPTEybJjQhCKaeRRZZg2gfMxoHKl
         6iMuD5iaJ+6+jcr4KZfHYCbQZUiH2BzjFt+j+y2bwxQysNYuzOGjgH5WqYjNt7JsjRgz
         o4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761663403; x=1762268203;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cpT9v3vZsTqou8arP0DXWnWYqvjSdGYFzEcyXBF9plY=;
        b=RZ5uIcdAOyINQ/IswtwTGjK2n01aRjO9bS1QwWCvz5dEuGDZ3WZWqbeKQpZBGU+lCH
         tEWCSHx1xzzadd0Oa7JbC4jjrtqZ7A0KvDR4QFEFOEJTa9AhneOzKLaeOEVpGTmCaYFb
         P+7VKrOjW4F/S/O2+6ym6CKH2mkLRYdjpdDPxgptX+qWun3nNok2EwqqFcKuBM5bJrCg
         gYVprPEqoqk3lunSOc3JrAisPEm8SMDXvfrLZftiPHCdqmPH4HVor9WFzJuAXlxnrWeF
         nJZQfQcwYWkHW+HGk2Bc0M0fGHMve7qUCnIVHF2+aoXQGeEUYMsDevGImOIRwMcC809l
         f8Cg==
X-Forwarded-Encrypted: i=1; AJvYcCVxZtgzl89jAB48/d3pos0+qUWaZZIc3rVPZL49UbGfvownoRK3Ie7YWiP6OJeDZup3Zml7xP0RcR2qbfh01PBe@lists.infradead.org
X-Gm-Message-State: AOJu0YzyLQCI1JpAjqahnuhsOog7oYqcHHRKUQItuhj6caTATlH/sXek
	GJhqBq4ZXNxgllHpGZ+DNUZ09gBn0u22UxZYWn5iTZWUYqNg8GbYdLxd
X-Gm-Gg: ASbGnctrnFVfBZO8pY/yjL1CeEjegVm1CQW63wJo1Khv8Ei1BGqU+69XzTSchH2S3PS
	/c47ZOlZuvFlHgnEEuhHz4aoTq01UzIcf1uemqeBqXbEPQdO9+SdW6qnNA2CV4/q7NgRnUI0iTy
	ZZdfL6GAMD+jMpiB6vIt5/BcUHnJxoinax9qQJB7nGaCuS9H0ZrfUHt9Tc5QZLAWtRWLKgv/M2y
	1JfbS0tnUzUw2QejRr35xeYzvjqyRtnpe1EaFvbyUA8QLVVLyGsBMSeWcaDE7aQRA123ZIyJTCW
	YySAOks1QsnbQCUmctUwXrbKybM7ccBgnIhhxIqOMie6Xb4a1TVb5VFfhLxO0dwYd6zPurW0hg5
	OhuyZ+XTdMJJBWEPgrOZzc/fmuJhYX1MwpEhHsrySAz3efZ5KY5rNv1lBk4cYDqTZuv0/xP1fSW
	lLJJ5hOZ0DsRGrFWOW7q6dOaQJzcLGDGwPjcDmgqpaiycXRIfKZogX4ZjsUpoIAiWAZTsd6MBMn
	K36/bxhIKDLcw==
X-Google-Smtp-Source: AGHT+IGfeHgVIMC0VHfcmG+idW723Hz2pg/WUGXn0Avn4tmBgDpRwGVIyyi/7yWZfkVRxwppZsPQWw==
X-Received: by 2002:a05:6a20:1582:b0:340:d065:c8b3 with SMTP id adf61e73a8af0-344d375663amr6595914637.36.1761663402796;
        Tue, 28 Oct 2025 07:56:42 -0700 (PDT)
Received: from [192.168.99.24] (i223-218-244-253.s42.a013.ap.plala.or.jp. [223.218.244.253])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7a414069164sm12135669b3a.45.2025.10.28.07.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 07:56:42 -0700 (PDT)
Message-ID: <aacc9c56-bea9-44eb-90fd-726d41b418dd@gmail.com>
Date: Tue, 28 Oct 2025 23:56:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net V2 2/2] veth: more robust handing of race to avoid txq
 getting stuck
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: Eric Dumazet <eric.dumazet@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ihor.solodrai@linux.dev,
 "Michael S. Tsirkin" <mst@redhat.com>, makita.toshiaki@lab.ntt.co.jp,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kernel-team@cloudflare.com,
 netdev@vger.kernel.org, =?UTF-8?Q?Toke_H=C3=B8iland-J=C3=B8rgensen?=
 <toke@toke.dk>
References: <176159549627.5396.15971398227283515867.stgit@firesoul>
 <176159553930.5396.4492315010562655785.stgit@firesoul>
Content-Language: en-US
From: Toshiaki Makita <toshiaki.makita1@gmail.com>
In-Reply-To: <176159553930.5396.4492315010562655785.stgit@firesoul>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_075644_021041_DF0BDA65 
X-CRM114-Status: GOOD (  17.29  )
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

On 2025/10/28 5:05, Jesper Dangaard Brouer wrote:

> (1) In veth_xmit(), the racy conditional wake-up logic and its memory barrier
> are removed. Instead, after stopping the queue, we unconditionally call
> __veth_xdp_flush(rq). This guarantees that the NAPI consumer is scheduled,
> making it solely responsible for re-waking the TXQ.

Maybe another option is to use !ptr_ring_full() instead of ptr_ring_empty()?
I'm not sure which is better. Anyway I'm ok with your approach.

...

> (3) Finally, the NAPI completion check in veth_poll() is updated. If NAPI is
> about to complete (napi_complete_done), it now also checks if the peer TXQ
> is stopped. If the ring is empty but the peer TXQ is stopped, NAPI will
> reschedule itself. This prevents a new race where the producer stops the
> queue just as the consumer is finishing its poll, ensuring the wakeup is not
> missed.
...

> @@ -986,7 +979,8 @@ static int veth_poll(struct napi_struct *napi, int budget)
>   	if (done < budget && napi_complete_done(napi, done)) {
>   		/* Write rx_notify_masked before reading ptr_ring */
>   		smp_store_mb(rq->rx_notify_masked, false);
> -		if (unlikely(!__ptr_ring_empty(&rq->xdp_ring))) {
> +		if (unlikely(!__ptr_ring_empty(&rq->xdp_ring) ||
> +			     (peer_txq && netif_tx_queue_stopped(peer_txq)))) {

Not sure if this is necessary.
 From commitlog, your intention seems to be making sure to wake up the queue,
but you wake up the queue immediately after this hunk in the same function,
so isn't it guaranteed without scheduling another napi?

>   			if (napi_schedule_prep(&rq->xdp_napi)) {
>   				WRITE_ONCE(rq->rx_notify_masked, true);
>   				__napi_schedule(&rq->xdp_napi);
> @@ -998,6 +992,13 @@ static int veth_poll(struct napi_struct *napi, int budget)
>   		veth_xdp_flush(rq, &bq);
>   	xdp_clear_return_frame_no_direct();
>   
> +	/* Release backpressure per NAPI poll */
> +	smp_rmb(); /* Paired with netif_tx_stop_queue set_bit */
> +	if (peer_txq && netif_tx_queue_stopped(peer_txq)) {
> +		txq_trans_cond_update(peer_txq);
> +		netif_tx_wake_queue(peer_txq);
> +	}
> +
>   	return done;
>   }

--
Toshiaki Makita

