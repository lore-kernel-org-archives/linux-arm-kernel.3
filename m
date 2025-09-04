Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD029CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRAIqJuFoUxn0IlxAYdnfU5ZQhjUgE5v1C3tZfihKz8=; b=nQ8nh7/yU+qBdw0g/WJF+8UVAz
	573mnyv6ssh8ZKkoTwxCHglRsUIfGEXjuJw1yWmw+H6iLFS3eQNR3CRxDkCzVjsL66Fi3fYP7RY6r
	EKnJy2K0fFjA6oxJYpGWCCEJSo4D/7MHo1iMUcJBqFY7wqW+SBRl0GPz5CwpN1rh+4rz8T4tncxe3
	A3t0Zy/lOThN3c/o+2n99tPARxBCXEhqA+2wKIcpzY7FAwmYTn8oxI2YO427WpzBxRNJD/E+GiW4+
	iZJSCMiv/+o780b7U1ghAhacdWhTGmi0gu2Pqi1mbRbkxuxv8qlEdxsCezHHgIdsZ5HU8jU7ADcOg
	Hc+do0Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuCmA-0000000Cs7N-43Xz;
	Thu, 04 Sep 2025 16:25:30 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu9eF-0000000BlBj-0mXq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 13:05:08 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 3f1490d57ef6-e9c50598296so901499276.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 04 Sep 2025 06:05:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756991106; x=1757595906; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VRAIqJuFoUxn0IlxAYdnfU5ZQhjUgE5v1C3tZfihKz8=;
        b=eWJupIaWBehdEiNCvF3MNudcqHk5ooQ1DBY3Nd6KhYJzXBAwNxMy1/d0hnp97glmqV
         Vdq/xBBHWOWJGA2QQtrrkEDyiglS1onv7j09/IzPe2q8Q/yFgcVW4Jo1zJI01xEFfGCB
         eVQhdlxYiSH/a1DuN0+W9goN1PP3F547wp12R+7A+N+KnAI6JFQBC0RNUnjt1aTed7iS
         rR5l75bvZ/x/Z+YUsQ2x9Yw/7+p3sF9RZ1FFnT4Z0Cpu5IfaEPFiMP7xyIzCGtPz0li5
         fL5waNgh4PF/Dxyg6CrV4OHneBt7VPbLpedLrTACqvI5K/JC5cr5mtEIIpfvLdueeiH/
         LiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756991106; x=1757595906;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRAIqJuFoUxn0IlxAYdnfU5ZQhjUgE5v1C3tZfihKz8=;
        b=t1R9LusvMX+fobDeu15IfLbripjThB8XwR2p80DYX36/XQ0OTEUoJkVmj27P5xx01s
         dcebCWegcIgNMchar+sxrRAxEoedpAlJZ5jc/+S//xOtlhakjLk3p1nBtA+hq3wxy2/a
         71qGDLMo00kqhzhz0JeFH79ZIxZmfAuNYfOZTpzts9uXxZF+bskpvzEe/QbPSgjBmPEa
         w7vHmbmt5QP5Gs0QZdwDlEgAgSYk2e7B2JnakY2VOI2baRtWYZmjz0zQGGvrR3aRER55
         pInxwHoJZGyv3IwBCIV1bpoNR0ZGWbu0dKSeitWGvqwTH3TWG+voKSCWVz2QxoCW244p
         3OfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjsWPX2UmT/sSLY7BZITBkZVrgbyIxZnqjofgbAzO+vDggUUUHx5Ev9Fe5kR9J6+8W3Sq1grzbODOXi+6RSelT@lists.infradead.org
X-Gm-Message-State: AOJu0YzD6GXgGQc4LewnrM0v8TzzE/8uqkbiFIunavgamzhqZaJFhJsP
	mNicPiWffTErvD5Q3mSNLwRQ6gW/9N+bjzv578Zok1Mt/EvLj1FwRMbp
X-Gm-Gg: ASbGncumnQN/GFBBF7yyA1Gn3tklNuxi2T7Y4IIf1NTPxrNvrUvtfZ2iZgirsQMCGvx
	B/gGbPdh0nldHKhGnMu6P3SwAanWJiTDmxJrb+ugfkfz3doyq2HnnpsbnjFZYa1DXcQfTo65yVQ
	EgNqUc/Jy3dHh+7NKM7r4zvu1JYaSAjg9Uu+4kgjxWQzdMdpKVAoJcY1uuWu7D9tsy6GJU68huZ
	vfDSJ2ebjaBEjuJxFFs2zC0WToddvGCaLwbLVm/Npx2McBJaW1p+ceg8VEDvNMM8ypna7dbBqlF
	WiXWljV6dx8wupi53en1IXh4v7mHt+2AzQZkugaWX0jVc0wGuN1NysqCv5FaBgDv0NxCIqmHbIY
	eNXImhOxHR+/f8uTW2VcsqM7Xe5eCvckr5u9ffjw5ezByf7KmfKXe7Nww5PNvmrM=
X-Google-Smtp-Source: AGHT+IHmWVZV9smFiDb5EAWgukKWH2yUMaPX0VME1uD4yW4vCM5Ef44xf0wr2EDvqQBA5WuTd7GVIQ==
X-Received: by 2002:a05:690e:164b:b0:600:b3e5:d4ff with SMTP id 956f58d0204a3-601782d338bmr2063081d50.31.1756991105967;
        Thu, 04 Sep 2025 06:05:05 -0700 (PDT)
Received: from hoboy.vegasvil.org ([2600:1700:2430:6f6f:e2d5:5eff:fea5:802f])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e9bbdf6d877sm2261100276.15.2025.09.04.06.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 06:05:05 -0700 (PDT)
Date: Thu, 4 Sep 2025 06:05:02 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Wei Fang <wei.fang@nxp.com>
Cc: "andrew+netdev@lunn.ch" <andrew+netdev@lunn.ch>,
	"davem@davemloft.net" <davem@davemloft.net>,
	"edumazet@google.com" <edumazet@google.com>,
	"kuba@kernel.org" <kuba@kernel.org>,
	"pabeni@redhat.com" <pabeni@redhat.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>, Frank Li <frank.li@nxp.com>,
	"Y.B. Lu" <yangbo.lu@nxp.com>,
	"christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: [PATCH net-next 0/3] ptp: add pulse signal loopback support for
 debugging
Message-ID: <aLmOfsgjumBX3ftE@hoboy.vegasvil.org>
References: <20250903083749.1388583-1-wei.fang@nxp.com>
 <aLhFiqHoUnsBAVR7@hoboy.vegasvil.org>
 <PAXPR04MB8510785442793740E5237AFA8800A@PAXPR04MB8510.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8510785442793740E5237AFA8800A@PAXPR04MB8510.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_060507_244916_C107C077 
X-CRM114-Status: UNSURE (   9.63  )
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

On Thu, Sep 04, 2025 at 01:55:43AM +0000, Wei Fang wrote:
> Vladimir helped explain its purpose in the thread, do you still think
> it is pointless?

Vladimir gave practical examples for the use case, so no objection
from my side.  I just wanted to understand how this is useful.

Next time, it would be helpful to have that info in the cover letter.

Thanks,
Richard


