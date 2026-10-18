Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A6ECCF2C4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 02:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuVxX/jLPtohDOq387cSqeqHjD2U6i5S+xDw1QtsGiQ=; b=kp4YONZwGhITannBfcxUCQcDwV
	qVIGwjCtvLhULrAfj22PvO46Ou7JmCN5/Dw2JH5bF/s1nFN7ivsbwTdBS6AsW+X4sucnBqZ9tHikd
	4CpOZHNM9jUWWRDSh2Nm5igdYK+bM54H2f0ICMUq+J7FhyLMIEo+f87H2iop9oCzSZiorCWwNR1jJ
	jR/DiPKoIJMIfn6bitwtDkjUoa6xGU3BRDVb7beoDYQs9q6Ym0k5GN+jey3/yt8cgCDGAopYbc31O
	UZKUJzzS8n7IXMMla4M0luVIHxZdgaGGSsHbdlVNO6/NLg0iXvj5o8A5DzaSsB/d8mdQ4YZOSjmvl
	NttR4kJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIGmx-00000005SUb-117i;
	Sun, 18 Oct 2026 02:38:19 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIGmu-00000005STf-1yYx
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 02:38:17 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso1151622a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 19:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792291094; x=1792895894; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uuVxX/jLPtohDOq387cSqeqHjD2U6i5S+xDw1QtsGiQ=;
        b=yd4el5cCeHaqT5ZMYS7j4sjS7UxwEh/Mc2ZQSfvTLmrdPurtRpIXoB0+EDGWd/tI4k
         z5z3PfP04Tb48xgDTV4u6IqLxSJjuP+xzGKMWwZNKYu7XqRkAiRZjdkW2N1haWzvnsSu
         A0jOf11yr55pEuok1Ig/GbOaBjbu5kKn/9gIj4AxH6xRgeqxGpWas2bKrbgxXW6gtlyE
         RvtDtQPMRAb6TKBAEIIJLIqddQBLKZ+wcZojTDTugrS0dcpv+qFs+iUKdLisgbG5Rxkn
         x/uc7Dn4SqoAqM9xFkOVIwib8QWCJWzEt4qGL5+SyFDmjw5ZeDWFikOYpW/ioXPqXTDL
         m5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792291094; x=1792895894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uuVxX/jLPtohDOq387cSqeqHjD2U6i5S+xDw1QtsGiQ=;
        b=PTxnGqcSnZgYUJWGVNf5f580pjy09L4YqL7hPHtkSbYsNNr4vVQ/5pKBW9CjCgtoM8
         dSTx9PRjz9c4machey17S/f4R1Z0d7US1hr4bVi0s2B9YaratkuRD5iFryxm6ORY5L6R
         t0EibFlvXlQkqJ0KDEFEijBk/6N06RjxAhgEVS+pqX3QKVyEj2G+mD4/+VZFP6d698ia
         a0ej3Ikt2p0COsCmj1ogj0hNC+ncZX5y5TbB9eoOEaqcBDmIzysVwSuSG0o05EoBYe0O
         aGEJ5PmUbNDzjfLF6BCNs2Mbgnvn9f7BbQ6JDpFeSPqs/lAx5L1HYGmT0Nt+CBvXcqDl
         0sWA==
X-Forwarded-Encrypted: i=1; AKwUvBwNxC+igo8ht4ylxfY8tLCgKFPZcaZfuBtp6R7J7EPK+kIselzlu6cW5ZulDEKSbYipTdbSR0sxuF0obVlDhDFP@lists.infradead.org
X-Gm-Message-State: AFq9FYKEWFhFr0ApQStacqZ5odLP8MTHtHTL6I1b5Ycd4ETHPOnyKQz+
	I0Djk3CLOLvx+p4vHVRyJ2qAqAXa0LRNmBfJ6koW0a0S6aLsgaSyPAgjxTrKvEqWoA==
X-Gm-Gg: AYBFou0Vo2aumz89PNV3SMWfp2SQQw1DxNiL0jrXj+ZMxDOTMjqhI2zPOIpdAAXyhIH
	9fc2nGrBOMHAzL814CqQ+xScxNErDcw4xyC6OXX3nsU8drxjpK76LlJn7ZmHqLvz9Y9viUUnKrJ
	RFWdffq2o9Fl9KOWKXE3ViO7c+7a0a9C2j/pbaM2JkN2hw9UMrVCA5AG8hxjQ/rCb0QAzNjqquW
	qLrZpfF0w4Nbp+/lEddQ3MbdqrmqwpyYN2EvX/cqwlRqI37HXlcHrRWjyrR3xv56YPXnFAEk6fQ
	Ep2dC7Jn7J+1R8nwLWKwFdJ/ki9jffxUpRYobHoA7DETwVLXvVxwVWZMWMd9hw/hrKLO8VCGHBz
	9qbMTqtvr07URcdkQ851gtW5Agzrq5B2U+m8iNsctuLQyBL6f7nY3oTG5yZaSZPNWIT8nUWXl4D
	VzCDb1SwGI8PiQf9/NI/XCWHku0KxY6vsCl38ySzSABi4yWI4sdFocbB/05RdycMjcnvrQ+yexM
	3nNgR4f1YZ0LY7n8XwhE0czffls4GW+7AL6mWdVbYNnnCMFE0V3N7veq2wADWQmi2uIu6d48klV
	vmhlsG7z0QSF/Hrk3dFBCnR7BlwhZjm/7ol0vbHcEXwY2zNz9SDTNut3JoAwXvLqcHKsEYtAU0G
	XEBWtnIXglrtdPxgUfXheBMa5Kcwz0MBZMKfKakCEZ1BbwpepcMrphcay9Kl+lnLE9slh7WgLR6
	Gu2gjw8kfVoWoY0BYQaV8=
X-Received: by 2002:a05:6402:2489:b0:6a9:850d:bb38 with SMTP id 4fb4d7f45d1cf-6b3a81766camr2392870a12.10.1792291094015;
        Sat, 17 Oct 2026 19:38:14 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c80desm2356771a12.20.2026.10.17.19.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:38:12 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org
Cc: fw@strlen.de,
	phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf-next v3 0/3] netfilter: flowtable: carry a priority into the offload
Date: Sun, 18 Oct 2026 04:38:04 +0200
Message-ID: <20261018023804.562323-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atQk1d8Tv03iPN7d@chamomile>
References: <atQk1d8Tv03iPN7d@chamomile>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_193816_537847_083325EA 
X-CRM114-Status: UNSURE (   8.43  )
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

On Sun, Oct 18, 2026 at 03:45:57AM +0200, Pablo Neira Ayuso wrote:
> I don't understand the "one flowtable per class".

If the priority is a flowtable attribute, every flow in that flowtable
gets the same one. To give sip 1:3 and https 1:5, you need two
flowtables with the same devices. nf_tables rejects a device in two
flowtables of one table (nft_register_flowtable_net_hooks() returns
-EEXIST), so you also need two tables.

With the per-flow priority it is one flowtable and the rules that set
the priority today:

  udp dport 5060 meta priority set 1:3 flow add @ft
  tcp dport 443 meta priority set 1:5 flow add @ft

v4 waits until the fdb series is done.

Julius

