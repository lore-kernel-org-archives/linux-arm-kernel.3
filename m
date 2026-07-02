Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36A1C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 10:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LfUu6pC7EJB8qiPkqY3N8+Svxs7+7n13Ik8Ta0Guoyw=; b=0Vv6SBXOBx8N3gxhXkic46Y/KS
	IIQYbQuc95CB+4rgATq3EuGvtXuoTPuVcDKOnJOw4ujsRtAzskQqtaVOIOsP/nM1rwU8lfs2iNFFx
	VjvJxnUfDB/rbj4ROcLLEnW7HoRGfxAOEuHLvvGe9uCrZG/8sDh+SE3ss88Gnw8KL+4to6fsAqv40
	XOtlKu1N9OAbl4u7HRQe38kbt3HGnVXWZPaYWXe25zeedb8UyoGGvmq3dt+j3bgTbYdn6IUDZfmjI
	kMxz0rm2vsOn9qQWutFrBgmRxh28u2Q8bJLABtayKxnxR8fOkLvdm30PvfiWn1khHmOtNwLXtdvjM
	ASojsLAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEFR-000000047jk-1b2K;
	Thu, 02 Jul 2026 10:02:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfEFO-000000047iT-3rF3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 10:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782986536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LfUu6pC7EJB8qiPkqY3N8+Svxs7+7n13Ik8Ta0Guoyw=;
	b=bbYSEosOy8AjqMocITXesieDvAiWM1eA9XF11XRWdBMg3U3Xypz9x+N/4U+4bLlcK7FQzj
	vmsYI7+CrDIc6lNvJrM7hAZPRvGs3dEaCncdUWSVd7djyXbjnSzNkwS0gAbnRKte2QovBk
	XYZc4dRyUgXfF55CeS3/H5/dAWYPrrI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-324-_XYDgUgpOKKv0MFdexM_qQ-1; Thu, 02 Jul 2026 06:02:15 -0400
X-MC-Unique: _XYDgUgpOKKv0MFdexM_qQ-1
X-Mimecast-MFC-AGG-ID: _XYDgUgpOKKv0MFdexM_qQ_1782986534
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4926596eebcso14390905e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 03:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782986534; x=1783591334;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LfUu6pC7EJB8qiPkqY3N8+Svxs7+7n13Ik8Ta0Guoyw=;
        b=kZ+EYGu3+mJ0V0n6ijcwotzSMM1MXVlm1r1F+pVXLUHL8Gs9nHhBYZnDv2Mr6sJQgm
         F5wDxI5L8ujrJdd4m42PyXfHCOBb+O7VvN3Jy+AQxG18u8ug4q01e0QivtATgGJLIxfk
         x6JMFxilgn++ejCi9ISXfFIUkEctPd8xF9Cl53+tMxEFgnH5EE81pjinq6jmhx1Jcat6
         m3npQPGEg67psvbpi2YAxDzCLUVLyxwEjgZIrgc0L7i/EP3bUehnrqNeAmwZ6TL+d4gs
         Hslky2mv/sUbgAQpfdheMzi+9hy3dTmfm6tqJ2oYvrivkqy+BMiYdoc/Lh37cvSn89yb
         khsg==
X-Forwarded-Encrypted: i=1; AFNElJ/YrRFyv6ysfVE4a9l/9rsY+QwVeidY33ySUCGYyNlqfeaao4gCFRYyCb4mYagMe2dviQ0KDGiUdH+ZZvvEGqAM@lists.infradead.org
X-Gm-Message-State: AOJu0YwiqsStLfldQdkyrftuGM3bVPwCHkduDi50VnDamzvb9939jXUi
	DCo6pb0Y5j8H15l730xXAxj/bm3Z8IRRrLBDvFrj/1wJ+TeHjqFQpw9jrATfm7q/fme6vz87lDC
	XHbM5zwBa/EEtLA4PtBsptgxu4VaGEHFjtxCzsDdo0CXoJKmFhrv+WVx5qfQeeXbkuaIy3grz2U
	e+
X-Gm-Gg: AfdE7cmuk/PXpSbLsd3I3baZSCiztECkHSJk/hjWQv77sHl8gnPrrqP5L2aglN3SCPe
	9OMlhQ7cxAhtFEcJVEy/+xTEH9O+0LJee1bLweRdfRDZkDko2CvEhiwvhXkI/JL7WmxET+JZPaY
	ja6UaIga+yi7SP7ebC+bAq0q+8gBWQJTHhklVO3xRulkYupAs2KmXQ8AVcGEk8OlvScJmGro9rW
	jlDRonKKIIODwPxKUUJcyJscf7xGrASi8nk41B3mNJaMrTqSNODxDbX77hBfJvHkE1wuBGYoWn/
	SOvB0cLLMJAPo5FFyxZOJFRX5WKZ+uIML/Tw1QpWtBjne+/YNZL0NBmBvzeaZTG0ZXc0UjGJ2Cv
	rN000q6mWV1PZP6OJI52aee6UMmvtY+nY5x/9CEiRT+eVvgfB3RYTtdN1BPxgPqdc3UUSj/ugUr
	PeQKyJOKpCrA==
X-Received: by 2002:a05:600c:1547:b0:493:b729:3a9 with SMTP id 5b1f17b1804b1-493c3cfb04fmr58962515e9.27.1782986533644;
        Thu, 02 Jul 2026 03:02:13 -0700 (PDT)
X-Received: by 2002:a05:600c:1547:b0:493:b729:3a9 with SMTP id 5b1f17b1804b1-493c3cfb04fmr58961865e9.27.1782986533117;
        Thu, 02 Jul 2026 03:02:13 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:5521:6b10:2eb7:f61a:75:4534? ([2a0d:3344:5521:6b10:2eb7:f61a:75:4534])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bef17c82sm80193455e9.1.2026.07.02.03.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 03:02:11 -0700 (PDT)
Message-ID: <3f540a8a-4167-4727-9516-6fb91335333f@redhat.com>
Date: Thu, 2 Jul 2026 12:02:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] Subject: [PATCH] net: gro: fix double aggregation of
 flush-marked skbs
To: Shiming Cheng <shiming.cheng@mediatek.com>, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, horms@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 willemb@google.com, daniel.zahka@gmail.com, alice@isovalent.com,
 sd@queasysnail.net, eilaimemedsnaimel@gmail.com, imv4bel@gmail.com,
 nbd@nbd.name, dsahern@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org, lena.wang@mediatek.com
References: <20260630023512.26927-1-shiming.cheng@mediatek.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260630023512.26927-1-shiming.cheng@mediatek.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pDO9Ruc9PkDzMZt9MgyA5s-BTtnWAvDvP81OVKsOKNQ_1782986534
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_030219_033898_71101F33 
X-CRM114-Status: GOOD (  13.88  )
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

Note: the patch subject is quite uncorrected

On 6/30/26 4:35 AM, Shiming Cheng wrote:
> The new skb_gro_receive_list() function is missing a critical safety check
> present in the legacy skb_gro_receive() path. Specifically, it does not
> validate NAPI_GRO_CB(skb)->flush before allowing packet aggregation.

skb_gro_receive_list() is not very "new" and definitely
skb_gro_receive() is not legacy.

> This allows already-GRO'd packets with existing frag_list to be
> re-aggregated into a new GRO session, corrupting the frag_list chain
> structure. When skb_segment() attempts to unpack these malformed packets,
> it encounters invalid state and triggers a kernel panic.
> 
> Scenario (Tethering/Device forwarding):
>   1. Driver: Generated aggregated packet P1 via LRO with frag_list
>   2. Dev A: Receives aggregated fraglist packet and flush flag set
>   3. Dev A: Re-enters GRO, skb_gro_receive_list() is called
>   4. Missing flush check allows re-aggregation despite flush flag
>   5. Frag_list chain becomes corrupted (loops or dangling refs)
>   6. Dev B: TX path calls skb_segment(), crashes on corrupted frag_list

I can't parse the above. Is this something that can happen with in-tree
drivers or do you need OoT module to trigger it? In any case please
clarify the actual order and the involved driver. Possibly a stack
strace leading to the critical aggregation could help.

> Fix: Add NAPI_GRO_CB(skb)->flush validation to the early-return check in
> skb_gro_receive_list(), matching the defensive programming pattern of
> skb_gro_receive().
> 
> Fixes: 8928756d53d5 ("net: add fraglist GRO/GSO support")

The fix tag is wrong, should be:

Fixes: 3a1296a38d0c ('net: Support GRO/GSO fraglist chaining.')

/P


