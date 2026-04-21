Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1C5F89251
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 11:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rrYkcyd6qjki3bZsG+bU43lxWX8WayjtYU1EyQJORUc=; b=LqKTEYnTZig7HMphwVZ5zqZbUK
	alxZFcIDC+/WJFQOFDJEvqx3tZ8kQX7HlG9/TL2xlxG9WAI102GzubeFERqPxy5lQJousRTd5VgJV
	xNIQYYaBpakYuFzh34Nsv0DXqCt/EZ5N70PLSai30MJ3Yy2dTFUfbzdl2Q+dMXjJ4qQdiE11TnqZU
	uGUrrZ7tQHbKpFHBiRHRc9d/1dMnM2x+PWzqQsPVuUnugAFT1FloMVoa47DyvlfqzIIdFjO/CLD0P
	VQnrcsGz8oSk0pi4u6Ea9R0fKZgD6C7Uaa+GqDjYx4gKU2tqwSjcVToZbbU1KQRQg+W6YoQ2icyyW
	FTJW6v4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF99e-00000008VUh-2i5c;
	Tue, 21 Apr 2026 11:20:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF99b-00000008VTu-48fH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 11:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776770429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rrYkcyd6qjki3bZsG+bU43lxWX8WayjtYU1EyQJORUc=;
	b=EeVXawz0keu/wpq7zby9C/d9D2YD8MjMtKz0sCmL6KGMx4a1DgMKW/UYLAEMjSFfaVJ40H
	L5gYMVUWy8oxBL1bGPzXvVX8OlQk0LKsjoWNIvgsMeBYpU9vD2eW0sSatsa7JsjM/4eedw
	L669R9gKrmyDMbWIOLjnS9gJvGJLt74=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-139-WdJ5OaKPOgyyGeS6nPXf-w-1; Tue, 21 Apr 2026 07:20:27 -0400
X-MC-Unique: WdJ5OaKPOgyyGeS6nPXf-w-1
X-Mimecast-MFC-AGG-ID: WdJ5OaKPOgyyGeS6nPXf-w_1776770427
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-43d103e46c3so2899514f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 04:20:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776770426; x=1777375226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rrYkcyd6qjki3bZsG+bU43lxWX8WayjtYU1EyQJORUc=;
        b=QoSz0sFqe3VbhWOi/SiLhn94I1zi1yrJXpCTjESko5Y3ETbZQCKZiKDHHyPlq756Tc
         FAQKt+19TUw+GP49m4mZIjVZc45cUsZfAaEhqMzxEJwg5pqnhJYXG9wPLG/VomzgzGax
         Z0y4XLToWODQ6/qe+yPQLU+Ix44ump6Ch0e/Q7WEO0KcGZ9jIe5GK/51//7qKyJvhH10
         WTuEGJ4aaR6qxRtHrUkMA3vkfTfPGk4IsuYVtvJUWhkY30l4saVKvxvWlE82V5YrKGZ8
         L7LutV14wV58tFcEXj0ZXqWjfk7JIOeUc58Bg80gyoLxWbf6bfiLcbxLTSlHx4j5Fq+C
         l5IA==
X-Gm-Message-State: AOJu0YwbdzP7IzQBbFtZzNVBTk8pSRjk9NfPAYIxK4WAPi3cm9dl661S
	pphIjKBqMV2bj7vCc/tGUP8K47For9CCo3FXiAaRM2NUtZJ0a8v6SDfyNYui7jCbhyquHqTtj6g
	GB7shF+AL3rBHosHc+M+9RO6v+u9mB5pKheAmGhlmO0RbvYMyYEB7wlv9x7kCQitT0UHroVxx6r
	7+
X-Gm-Gg: AeBDieu5g4oEbwiquVZoz7XVMfbbCwkeEPf5yuLUM1mvGv+bacpKBlmZ9pJazCABvMO
	nmVnlipVO/c7OpO2LueBYJ1BgXYHD0UDzIuFltgM3KFu1kTtWcmxvSVxigjrSyqotDgd75Ah9yH
	ybWz7VsdrGmdatTborGWMuKp3ob+wXVW4ZkHh5HvazhH4ZJBLm/sW0jSkhS9f98RQwgi/n/BFX0
	ijWh6Z9x1lOZr0xyQs2RHJCi6mn8ylCrRfrD1MmSXK7TVHmVxVMYigyjlkCGmc+nDtMgXiQaKUI
	mhtdxct+l581Z91xWern6HKi71h35LCV22l6lwgDoE7r/pVoMszCEnxfybyBUXST/v1ankUmqu6
	XdJFQe38vF0tpjDLkSi+0nwcwSgBzfLcyjbnIGgeo5G+hKBUfK5OtAbL+JMDgfdQc87Q=
X-Received: by 2002:a5d:5d02:0:b0:43d:77c6:be6d with SMTP id ffacd0b85a97d-43fe3db39c6mr27082062f8f.7.1776770426441;
        Tue, 21 Apr 2026 04:20:26 -0700 (PDT)
X-Received: by 2002:a5d:5d02:0:b0:43d:77c6:be6d with SMTP id ffacd0b85a97d-43fe3db39c6mr27081982f8f.7.1776770425956;
        Tue, 21 Apr 2026 04:20:25 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.104])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4eec9sm34927627f8f.34.2026.04.21.04.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Apr 2026 04:20:25 -0700 (PDT)
Message-ID: <210f5d0b-6232-4c0f-adff-3a97d54159b3@redhat.com>
Date: Tue, 21 Apr 2026 13:20:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 2/2] net: airoha: Add missing bits in
 airoha_qdma_cleanup_tx_queue()
To: Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
References: <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-0-e04bcc2c9642@kernel.org>
 <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-2-e04bcc2c9642@kernel.org>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260417-airoha_qdma_cleanup_tx_queue-fix-net-v4-2-e04bcc2c9642@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9LquJWHrq2GI8eTu1WtiaUgPeALRVz13xHuIGsFratw_1776770427
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_042032_169876_C819ADE4 
X-CRM114-Status: GOOD (  12.01  )
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

On 4/17/26 8:36 AM, Lorenzo Bianconi wrote:
> @@ -1055,8 +1058,33 @@ static void airoha_qdma_cleanup_tx_queue(struct airoha_queue *q)
>  		e->dma_addr = 0;
>  		e->skb = NULL;
>  		list_add_tail(&e->list, &q->tx_list);
> +
> +		/* Reset DMA descriptor */
> +		WRITE_ONCE(desc->ctrl, 0);
> +		WRITE_ONCE(desc->addr, 0);
> +		WRITE_ONCE(desc->data, 0);
> +		WRITE_ONCE(desc->msg0, 0);
> +		WRITE_ONCE(desc->msg1, 0);
> +		WRITE_ONCE(desc->msg2, 0);

Sashiko has some complains on this patch that look legit to me.

Also the pre-existing issues mentioned WRT patch 1/2 makes such patch
IMHO almost ineffective, I think you should address them in the same series.

Note that you should have commented on sashiko review on the ML, it
would have saved a significant amount of time on us.

/P


