Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB34FE677FC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 13:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:Date:Subject:To:Message-ID:From:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YIqagV1NwTECAGQHhrIvxosUcV32d/Vxh+4ati1x+Gg=; b=KCiroE6HOgFSHdIfnbwEn5ds1p
	Fl4JwKYUVD0hs99Z9ew4p0EhUaAetwOFWHD/fXQi5Fq5oeXhZOutuJIxY3UfXFWMrNAyVxB8O1/sb
	HcwnqZzRv6NqASYeeybIoSE5j8TMfmJdxbh9m4/QJd4dzfHqUiJnWLom9HHyOQCzb7oDepCWDMEUr
	T/CJgnm71tOZovofZMnBof6tJMq/WOpUGoUReVf07t45K8TX22SwKUO4+00t909Xvm8BejOo/Yvxa
	qiZJxaEFFm5BbV5GnBJ5qX4iziMgvU5hUhgzpdASR/G+BTHLbRsGOuIbwgYDyIqLAbOOhFqvh9yk9
	/7UNxVlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7EHp-00000009n9q-2nEw;
	Sat, 02 Nov 2024 13:35:29 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7EG9-00000009mxv-1tVG
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 13:33:47 +0000
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-5cb6704ff6bso3705103a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 06:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730554423; x=1731159223; darn=lists.infradead.org;
        h=mime-version:date:subject:to:reply-to:message-id:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YIqagV1NwTECAGQHhrIvxosUcV32d/Vxh+4ati1x+Gg=;
        b=aATMO2FxMCjd3kZNA5jjPcvRCjtLcGFjSBXEE9eHYO2GHOXRYhVUxtUzdOwDGmwXHy
         T0mdDtc5U37/8oxRP6OzGXVqoCcZXv5af3uOWhr0rvqNwQPFv71tWFWl4nLy8hf+vw5L
         6rBH12HqJqo0CcAyekbVIjf1QCn3YZrocdQkxjNzdbcB8hlbqeezcQeOBdAqNN6EZdui
         Lg9bBZ52Twas0kXDkbhFG1/hY0NfZohD9i0Qv3+dgiBxSTEC8+j1Pl9K+vsWlKSnHIXj
         csq5IpXemT2pteGn5WSm1FJ1ZacZUn2MzhQ5hQjYDEa6zlppewjUw0WzfZgwOGay55EQ
         hLFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730554423; x=1731159223;
        h=mime-version:date:subject:to:reply-to:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YIqagV1NwTECAGQHhrIvxosUcV32d/Vxh+4ati1x+Gg=;
        b=M8lO4oAHzMu9IhVGzoAon3AQ5feusLlyiHWcmgdggtK5ZSzDtlVYH8WBqYEtNvVMjL
         VVwKtfweNJRRbhVPeiklBckFaB6wSfbZ9I80YGORm0U/OAr/uRQCMIKrJRcfVK91uiPP
         1AV5+plz4PcXa7EuGeHHzStxQ2YMw7MDEWgJ4eiwKmur/38bPz78455c7CrQpV5nL8Yt
         nD+WfzripPBwTgNT2mIUKVTwJL6gHLxNzmKsurRLR2Mb/uICML1NQN693bNbdo3XK1sv
         cR0nFquB/ck1cNWwiFCGEnmxu8qhJZRYYDe/Tb3PZCdt5T4LprviTYZiLi/e82MUJjs/
         gUgQ==
X-Gm-Message-State: AOJu0YxGkwoTyyVIyYgpdw3giolmoAPsvFhLmI3WAsRX4fabJviP/jUp
	MabMWQOipPKSXDQIeAt+pQ77lciz2BwG3W/CMDcEaFIQzroSWDCpavA9337B
X-Google-Smtp-Source: AGHT+IFmayDSzrtlVDOfeq3dGFAS1RbDpkxIKbdktG6v+tguBk6ncD+qVvNtFtbkGOl7/YumGSF6kA==
X-Received: by 2002:a05:6402:5244:b0:5c3:cd88:a0a with SMTP id 4fb4d7f45d1cf-5ceb92a77f2mr5366480a12.18.1730554422777;
        Sat, 02 Nov 2024 06:33:42 -0700 (PDT)
Received: from [87.120.84.56] ([87.120.84.56])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ceb13a2398sm2306339a12.29.2024.11.02.06.33.40
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 02 Nov 2024 06:33:41 -0700 (PDT)
From: William Cheung <eshansarma772@gmail.com>
X-Google-Original-From: William Cheung <info@gmail.com>
Message-ID: <8cbd7f3a056e942beba9d476b51e9757d140ea15a7ee97dc5912a383b1473958@mx.google.com>
To: linux-arm-kernel@lists.infradead.org
Subject: Proposal for you!
Date: Sat, 02 Nov 2024 06:39:27 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_063345_498379_FDE48305 
X-CRM114-Status: UNSURE (   2.85  )
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
Reply-To: willchg@hotmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello Dear,

I have a lucratuve proposal for you, reply for more info.

Thank you,
William Cheung

