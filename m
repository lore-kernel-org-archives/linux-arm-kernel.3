Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E88AEE7AD66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Dec 2025 17:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/mLLHQ0NYNnx/EzrQbuQDe5XiynoiftrV7RLmjK4LUY=; b=MHPQhfvmOPuce2OjcP5WXX0Gfn
	I5dlZVqyJnyjDRgjtdN8+jrAL5r0l9h7U3NmWMTuI+iffFQR9m3ulPwYzmWdDp2/CTV1pDWmBrYyi
	nzXQ6F4pRTsI1ZaBhxZ9nnVEM2qqddgITsqgoyVK7fQryBfk/MqDm0XZvxPTWTfT+rgD+AQNZ1FKF
	RNKRehgGhViUSCKNtJF/KaZGFmrUAVcq/98QR4UxToje93bmQwgYtfZszfVbRcs8xz8QhjxM9YRRv
	iWOSnnqU+xB/cZR7+zEfOtfOM+9YJcOb4pkZ9fWD9YnYWvt0NDwGRcH9TJd7jU+Db8Y5vZUhaFEbv
	RRhT33wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYpOP-00000000a9H-0nIK;
	Thu, 25 Dec 2025 17:44:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYpOM-00000000a8w-14yQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Dec 2025 17:44:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766684687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/mLLHQ0NYNnx/EzrQbuQDe5XiynoiftrV7RLmjK4LUY=;
	b=eb10cczFEs6nCsw/kcylV4F6d5HtmfVM8HYzT8RCBwP4ic9l1RTxpieeagE4Bjk/tnFUHM
	OeynoCJ4ViHo8F6N1j7pbhzmGFO4vwpx0nBrY6ZJFDGAqHeCbzjLeucFuRqQGZj419/J+G
	+842thW9FsODUmvJSqVKukfeFDIXlZQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-iB6tilgXNf-XR6e-6FkSdg-1; Thu, 25 Dec 2025 12:44:46 -0500
X-MC-Unique: iB6tilgXNf-XR6e-6FkSdg-1
X-Mimecast-MFC-AGG-ID: iB6tilgXNf-XR6e-6FkSdg_1766684686
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b24383b680so2248856985a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Dec 2025 09:44:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766684686; x=1767289486;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/mLLHQ0NYNnx/EzrQbuQDe5XiynoiftrV7RLmjK4LUY=;
        b=vbxGo4GapglNvy7Z9zE1XVkw/eVb9Q+MkkYSM6hhUSMW8yjjXYKIjDuwshJZoe6U5t
         QwGrPjENgqcZTjWbDfunaWZokNpp5XOVS/xAuECRmyY6vebpikhXZJjmdmCK7VBljHhg
         SaR3752iZAIn8XyeIIB7HjzzoCpXoM22dwZCpkXmTUoTh82xhC+akGDjtw1XW9R7XllY
         jI1wBi096yLLqr8SCjwjH+PMboapWPsKaaAUjhctsEIvHIeg1Kh9VljnDvkpFxO/d401
         KWtrYp66KnfWmnsZJtsrbpKyKKIz49YJ4y4cF7Ftz/Q6wz27A9gEOdUK+PcQ/7WZC6OU
         628Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8nrInXAm0Jp2b68BOtx+oBA/IF5agEnRS7SienONBk/idv8Dc3F7lWLelZCDcSpKcrZJSkH1s73/tTsIxKvde@lists.infradead.org
X-Gm-Message-State: AOJu0YzgR6HyDTxdATvUfTGoZyQRJQV3IfFNGObWIxoaG1WigjVi2xG+
	u0Wo6WrZJf3o1jk5Xc9lpcyJvGrmc3OPGSg29ekcSIwj2EKHFDLbevqR58sTlqpVY5sr2DypqNV
	llJAaoJ2Gd+o+l2vnobV/KJaGt5DRSIUbHIcW1IIU4tYp+sERcm7d9q7JbERvfgS4hsLdjHUS+0
	nf
X-Gm-Gg: AY/fxX50y9/+0Y0Qt2UFw9ot0+LmB3XCEb9JT1o5zMYFzw74TBdn0pF7Ser94ddC28+
	dPLrWCk7/YhppuFQizO6PpULPoh7+Uqk5RE5nQZwsCiVTvKMbZGWRBl2SxtenulsmwoX+HoWP4Q
	dR6xdeP5CctEnBuD+iczMauQnZ2I4KWDJYPzT/cqizeYVwpygvWI9/qiRS37EtJqmhRE3Ai0QFN
	wHkguUpIXeBiok44Ev+W4RJun9y9hi5U2ytX9Oja/hZEI1JWm7F18XTJUiiJV04wULNUOrFcZXs
	NB9Sa6QKUjDmim26k0/BoH6iHOlkrT9ZncXN7B+zD7226g0vKb4SUqc17r0cM5e6uoHzf6X1jeQ
	IKdgnhzpMMEbcZ62GUy9ODeY97AkEX0RwBon/DkbNcyzS
X-Received: by 2002:a05:620a:7004:b0:8b2:a049:4ac4 with SMTP id af79cd13be357-8c08f669593mr3067405985a.27.1766684685773;
        Thu, 25 Dec 2025 09:44:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFG/L5pwoLwpBSCZLzL63JBIDFsHP5Rl5s8WLau2qn2BvQm1lxuhkg/jnhZdcw24cYGOmLPqg==
X-Received: by 2002:a05:620a:7004:b0:8b2:a049:4ac4 with SMTP id af79cd13be357-8c08f669593mr3067404285a.27.1766684685324;
        Thu, 25 Dec 2025 09:44:45 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c096783922sm1560042485a.7.2025.12.25.09.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Dec 2025 09:44:43 -0800 (PST)
Date: Thu, 25 Dec 2025 12:44:41 -0500
From: Brian Masney <bmasney@redhat.com>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v16 1/3] clk: aspeed: Move the existing ASPEED clk
 drivers into aspeed subdirectory.
Message-ID: <aU14CWYXtU6MhmhF@redhat.com>
References: <20251224-upstream_clk-v16-0-8c1318f56c3c@aspeedtech.com>
 <20251224-upstream_clk-v16-1-8c1318f56c3c@aspeedtech.com>
MIME-Version: 1.0
In-Reply-To: <20251224-upstream_clk-v16-1-8c1318f56c3c@aspeedtech.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SexJtiMshy7rAPRbbmqflH9u9OGp2doXxnUmVKTnv28_1766684686
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_094450_372855_CA2955EA 
X-CRM114-Status: UNSURE (   9.66  )
X-CRM114-Notice: Please train this message.
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

On Wed, Dec 24, 2025 at 01:37:22PM +0800, Ryan Chen wrote:
> Prepare for long-term maintenance and future additions by introducing a
> dedicated drivers/clk/aspeed/ subdirectory for ASPEED clock drivers.
> 
> Move the existing ASPEED clock drivers into the new
> drivers/clk/aspeed/ subdirectory.
> 
> No functional change, file move only.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>

Reviewed-by: Brian Masney <bmasney@redhat.com>


