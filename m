Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC41C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 07:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XxVWLkjTDZhg2ZpXoG0uLB6wK5WtCztBheSr28w2OfY=; b=ioud18kTXjka6dKZcQZRh50vJz
	RQuH6XefIckV4O6m/CZUjWlOth1oeWcEhtspskXtKqLzJg9DmAYzeUmP/xKAHMyui2CGIOqvTMhGU
	90a8UIjKJW1PEjkBee7x4I/h1Lv4pfX22lkeq4p8WOMMcarj6kWW70ZoRezbYP53akMywzFs7+PcM
	uJLZEyLpgPRSwRtSz+nw50BlrZR22cjSNqNCBa7ZQREEuz5mgLxdF74SZyM4mtMeKs+b9yyLptgky
	6W3q4mzElbfBx9qJQ3yzS/EPLAbd+FFfllIPdNxDiG2hD/lHR0WpvqRUzP1nZULhYRr4Gdoc1JW4t
	yZCGChGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi62e-00000004Nh1-0YbZ;
	Fri, 10 Jul 2026 07:53:00 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi62W-00000004NaS-1Sy2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 07:52:53 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2caed617615so5673535ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 00:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783669971; x=1784274771; darn=lists.infradead.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XxVWLkjTDZhg2ZpXoG0uLB6wK5WtCztBheSr28w2OfY=;
        b=mBBanWPge7PAqDJoqrd4pvr18m1iD8ncwbahvVLWxgpsx6FJYLl3CkR8DqxsFkPh1C
         R2COHJQGcQ3gMoMzCyi8Y+cv5+1FfMIJgZpwkgMNdRjcFEpphhjdoovzMQAsWpSqqfkD
         eL2Pk2wa/5BseTjIMwSpvhmrFf0YHdqWHeJb6xVE/aBgVlNBQnO3PI5zX3+JsFoFZrKO
         Qeopd+r1lIx3V6xSt3g9bgHShRvB27UbRveTgySld0628Kl8yPBg4HZjJQzvRuTL+WP0
         k0NAl69U7w7tTJo0bWzLHWo7f8bFyBLIF29qGjZXUCCSExZG0MYlcS+UlZ7SCgchMkgS
         7tLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783669971; x=1784274771;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxVWLkjTDZhg2ZpXoG0uLB6wK5WtCztBheSr28w2OfY=;
        b=LhQzLgooMndwPD9r42Xi3n96IWRi6dIEAHU8lTCUHI7GHZ6yx+7NrO7ZVlASHqGUm6
         RNER0byk0jD7Ytj4jcJabdclh8JQq90xoonI2H60M16tDNefZuKygUlG0gew0Y9cV+vQ
         UZKO5wr4NAgaR9hsA4icXT6tJdG1iXaR5w/pqs9UZ0tnoJ50+ee565HROEhphYniBtOn
         DTQFSVJvf+jo4IqsczLcNTnVkO7/qxEAADz0Zuo2YoxnGdVkAGLE7K0EK4Ad5wZyxW/v
         476HPNKqpqZODKmoMH5l9A9+Mou9Y9HgtQ+kZ3o3n/9xHXMz0QOJMkanDhb0XZh0LTxs
         m36w==
X-Forwarded-Encrypted: i=1; AHgh+RoIbRILxLsNSX2Xhj3tlPTq7Fy2Lll8YFEjT1B5594+liUkaIvjYwVgfwjNfFi0dnEi2oC4YFKpfKfHSzPKmgip@lists.infradead.org
X-Gm-Message-State: AOJu0YyfOE5YxWNSQN5VWsDA3QWN7ydzU3U7c7raiqKxGC/I2Tt6+YcN
	xh5M/M9+CVN/XrrSnLqjeKeLNhSWHMzNeugSp/ojIjktd3hraqIvXzWf
X-Gm-Gg: AfdE7ck62iGOzBK1GaWuYGN3IESqLfGqii/3wUeMeA9DAwKIW+4QjGdyLa5aUrPOs/z
	c+6CcpjyiqtNU03ViFJUUMHjFFzqB5l0qwzUJQIR2rZ/WM/TQcaLuLu3Y8OAOyGeaDStqwylS1P
	5udZrf2lEgPL7RyWqnZRl/KxstSOvJCBux5dKnfmpYZGNnOWsIUfNagYn5pCuwKNPuOx3aOWPiu
	bpo918q4GOBp3tDy8cS30Yle3CzJfsMARwv36Ixhq08ujb2tbwiMR1bsMdpI/I9JKtdbS79tO2L
	U5vTkCENqgUI81a97oQLbEHvq1WCoptTtpdMuBVIKggQ7Lfoc2Q0LPFtPUtK+2fEfoysmw3kYfz
	86oGkvbhGRe68cnOWwy/6LsQfqprnGRs9jLZ+nMLHpLvZgEbZOr1jr1jSlhT2s1AO9ZxWHeLQ+p
	jFXrd8Pwuf8NxzdusEcKkIiRze8DM2C2pU2KWTLkfT
X-Received: by 2002:a05:6a20:d045:b0:3b3:1b38:d9c3 with SMTP id adf61e73a8af0-3c0bce1ec2amr13936533637.4.1783669971391;
        Fri, 10 Jul 2026 00:52:51 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174839f89sm38555369eec.10.2026.07.10.00.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 00:52:50 -0700 (PDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v5 7/8] asm-generic/runtime-const: Add dummy
 runtime_const_mask_32()
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>, 
 =?utf-8?q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
 linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org
In-Reply-To: <20260630045531.3939-8-kprateek.nayak@amd.com>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-8-kprateek.nayak@amd.com>
Date: Fri, 10 Jul 2026 00:52:39 -0700
Message-Id: <178366995931.1208691.16267083905782992990.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783669964; l=326;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=339QwCmoNdOUhoq07+p5mhlOUQoPA8Y4kjfe9Kj1h/4=;
 b=+du2Hkd0RyMKi/EB9cZncyqJjA+YBHOqCVom2yvmO99t8UG/3SEUftV+TbybYm/IXhHQS2fGb
 d+Eveyk5xyHAx1lucH8A8KAbw7r8Wb+AaVQqOSex2YBgPMjHQHcvXwN
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_005252_413788_DD85B37D 
X-CRM114-Status: UNSURE (   7.49  )
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

On Tue, 30 Jun 2026 04:55:30 +0000, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
> Add a dummy runtime_const_mask_32() for all the architectures that do
> not support runtime-const.

Reviewed-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
Tested-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

-- 
- Charlie


