Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A02BC36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uz7X0saZ07cJoMgjZepVgox7FPN1JF4+WKasDO8EH1c=; b=fI6inAxbQFQrMk/I0ITAGHKEXi
	8vGQjBJUjUD211tGIiIBXKZr9qUfjUtxgw/BUMsNHTr/+/TcVmSjgqX8tU2RK0N0LhNmet/PG4MM3
	RArqe6yZwwiCnvYeyUQT4KA+Vv0UmvuJsdpQZoEUDlxpBlVgC6bKLdrzmU4cGfsvxm45oIEAEQKLf
	n8bM+oBYMqmOy1Wm/5H9dxDvlC8OusoT9ZF5ui/WKVDwCQUyjq/J58hACb1933cehodUBpV/mydTV
	iYC83QfToSyQatzWX/H7qug7NYVglhywN7f5bVKSkKkvesIZohwhpEc8l/bTypWCuyswrO/tDWQfS
	/apcpmhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYea-00000002bIP-3lt0;
	Tue, 01 Apr 2025 10:15:32 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYH4-00000002WwZ-1WAD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 09:51:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743501072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uz7X0saZ07cJoMgjZepVgox7FPN1JF4+WKasDO8EH1c=;
	b=cC02/npY3r3Rp0e8vz3bUlzIE3jIQVWjjxZpj19sOJgGocJlJPbYuvqMmSJNha4Q6ymTKF
	vjnfo2lfolUEM56KPHaQYQ3oMW98zFMGh5SICB8rRiIug7Znz8+EkFHVfQb4eIXODEl7Yi
	r5xOzrMBjZuGMbzQUIJvmGpgj5r3BrY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-NNTn7ZiLO6KfjXqBzMXJWQ-1; Tue, 01 Apr 2025 05:49:41 -0400
X-MC-Unique: NNTn7ZiLO6KfjXqBzMXJWQ-1
X-Mimecast-MFC-AGG-ID: NNTn7ZiLO6KfjXqBzMXJWQ_1743500981
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so27866625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 01 Apr 2025 02:49:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743500980; x=1744105780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uz7X0saZ07cJoMgjZepVgox7FPN1JF4+WKasDO8EH1c=;
        b=HEdGtWW2DP9MOpHDEnIgqbdl+gtOmK+yl5pUJprF+We07uPkmjDOlFKwZxQZoPY6b4
         K2nxT+Q3j4uXCmK58edTt/gZoiq+zUICUZutFVm1D8s8/HQ5vkkzuKkbBAFcsv0+v5nV
         Db0zAndLNslGfinHnhvYarEghjX35D8ob85KiSVX2Oo+vSuh1qxYgQNHKsdk7TC0klpd
         Edwy5gZkIfuMbLJRzTv0Kgl6aizNvqA08SROIiuZH6s9WN8OpK1JtTsUnd2naQ8qtoxl
         bzDFtnOBUpsbh7H8Ji1dlw8VQckbHLZMM8LQEir/ryCV6Z7SsHL8gKlX7j9WXg+2409t
         oWMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgk2QKhLTDF6bSsUtQKDSevbpg+NeT8iwaospjIhpFEMR5ZyncWj8QOkgjjAHUa0TN8+vEbeyeKpYBPUYUKG9e@lists.infradead.org
X-Gm-Message-State: AOJu0YxPQHR6mVAXup+u+Bsgs6y0UinLmuCxPyMiUezlJTLXRl8xdn62
	7r5wDk1mrgTWuv86TSLWhfTu1W8O1Wl1TPPDk3NzrmFltZh9urdO7g12KCriV3wmNiSAmAvFd23
	Qq3U5+T2kT38wHxwetgd/KWze0E+NFVxbWMlF5RFAxxm6PDhZd4BXgTR+Avo6aZ2JwlTUqeKw2K
	HrDg6boiQ=
X-Gm-Gg: ASbGncsSb2xdIGQv+jx0Dy4qqYxjJ+MzZsXJFzaYBpWXlg332+v9m+LBgtrzUqEzhaS
	M2oHvYe63HU0yVOQhy6GbC696mcIl83NCvuWVMxGbrJg7Zo1RZ/r9TY+zwu3QTu1MFvn6Pd/yre
	NJWZR0/QStiYrdFfQDtpbDvEnJPciDC2dCvT8KLYfOBTZrnrWuLQWbjXKYKLMWKwI83KuchA7zp
	YyDHX45I1Z6WyKWd8DH+WArGnuIPd6uY2TGdmSE0tLmcj9mXuss8TOD9vmMo/4iooUe/9noece0
	EG7uSlXArVFeog==
X-Received: by 2002:a05:600c:310c:b0:43b:c7f0:6173 with SMTP id 5b1f17b1804b1-43db6224034mr86356875e9.4.1743500980217;
        Tue, 01 Apr 2025 02:49:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq6P/LONQIdq2pleoYEuzzxgyj99hAud3WvWbJHB5zZUAUKpRXcJTP2ISiVIGMBWKtclaTMA==
X-Received: by 2002:a05:600c:310c:b0:43b:c7f0:6173 with SMTP id 5b1f17b1804b1-43db6224034mr86356785e9.4.1743500979880;
        Tue, 01 Apr 2025 02:49:39 -0700 (PDT)
Received: from localhost ([2a01:e11:1007:ea0:8374:5c74:dd98:a7b2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82efe389sm192609015e9.19.2025.04.01.02.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 02:49:39 -0700 (PDT)
Date: Tue, 1 Apr 2025 11:49:38 +0200
From: Davide Caratti <dcaratti@redhat.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Fix ETS priomap validation
Message-ID: <Z-u2svZqo4NC0JGm@dcaratti.users.ipa.redhat.com>
References: <20250331-airoha-ets-validate-priomap-v1-1-60a524488672@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250331-airoha-ets-validate-priomap-v1-1-60a524488672@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZsO7zgP58pcYKRJSJ4oTA7upgvok1tJ8NVrQVxphCFY_1743500981
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_025114_532027_A545037D 
X-CRM114-Status: GOOD (  10.06  )
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

On Mon, Mar 31, 2025 at 06:17:31PM +0200, Lorenzo Bianconi wrote:
> ETS Qdisc schedules SP bands in a priority order assigning band-0 the
> highest priority (band-0 > band-1 > .. > band-n) while EN7581 arranges
> SP bands in a priority order assigning band-7 the highest priority
> (band-7 > band-6, .. > band-n).
> Fix priomap check in airoha_qdma_set_tx_ets_sched routine in order to
> align ETS Qdisc and airoha_eth driver SP priority ordering.
> 
> Fixes: b56e4d660a96 ("net: airoha: Enforce ETS Qdisc priomap")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

LGTM!

Reviewed-by: Davide Caratti <dcaratti@redhat.com>


