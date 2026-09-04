Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76835C79F80
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 08:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cAIBUjFQ+3Ly1pIl7XaJ88bzL4A1FyWiRTzQz4fZMtA=; b=Jb32eIBDjOIAB6vSCe0Hf7WeyB
	Pu0YLNKFfRSRfkXFh+IB9KAIiqlt4Ddir0eYf8D250G7vYzz4n4eNLWF5nC+qHrhagzFEdMlG9CBj
	8EqprVqXZ2lNrCCmZHBbimjbHyAhGDX4dTSJjTRhRhjy7IWlIvr4lI1t+0oogF4enqFIqWdGXV0/o
	N78pBv+jLZaoaSlPAb4PN5pU50oXJTycazhxwXnQUS4wMfZFUB9FdDEtbzM7zmJOv5UtmbPvox1aZ
	JIno4xnh+TmJSEiiy4OlEerPc52QgzWyRwI/ATqDxHdeKN/afBaQhYGU/lj7D4mqzgyDcQZcbhf8N
	AOKRJwGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2PgA-00000001Sub-0Og5;
	Fri, 04 Sep 2026 08:53:46 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Pg7-00000001SuE-2AV6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 08:53:44 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso535882a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Sep 2026 01:53:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788512022; cv=none;
        d=google.com; s=arc-20260327;
        b=kGT+9d5sgudLeI2N+9GLjSLiMwdB4qCz0eX4Oyp/ltxJxArv+ABILrK1QQ7QPs1MnZ
         iMpzfYhtJ9BXyPMUJlQz7K1V1qbEed91IcPQ9MTEGGUFTCodYKqqi31U4rpQdGxpyCOh
         cq9qqnhaDDAgLuotqNo7scLcoud8pyM2pohgxJXpD7pwdtRB5jT45jSUjjGvK/bubPuA
         K94o8LqLZH4GQxMRxjWCvAnzGOos141acHM2bdO0r3HDVN8fJUUCD9YlMizqQUfEW3GJ
         UUJcVKarTgZZfN4YrJp5HCY6ZQbEyGcAK3isBLioNb2jqWpODITX+UzC+4Mqw0UdszTM
         xv+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cAIBUjFQ+3Ly1pIl7XaJ88bzL4A1FyWiRTzQz4fZMtA=;
        fh=toiuC1FKfatqNeCeZKO5nYQVWUXU86yU+yXFpMTUxwo=;
        b=kIgDhYocLWIsvW8tyTZMGfJ9TNQwz5B2G3IGnpo7NqRJDeDwkMAlbh156zPFJGuc6q
         ZOv8mxvHInzsu3cq1hbx3XPgYcXdx09Lbqiwe0xgX0G7628TlNRXZqVJDaFh49Xfkrpd
         iEt7AnFxyWKTnJsOv4oZo+NnIgNWgLmeb2mWfpMn/4zWwnvCdNEmtk8HRIqaFjtGA7wK
         1tjoHCOTfwMgzkg+pbKPB+OON3awZP+Wn/rTOdre7kXSwxdOKaDvhFd9RsaGTXh9jWCd
         +lrOIODILq6xuPwsYwazOSV0GMK1jy+/lDXI27aTFdVKCpsWVs3pmZ5gtmDqU/ynoES0
         43sg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788512022; x=1789116822; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cAIBUjFQ+3Ly1pIl7XaJ88bzL4A1FyWiRTzQz4fZMtA=;
        b=Rzy43asji3rs/RYg3ynX/MK6gpotwaN5iq8cbxRZUH0+icUU+yGjxHktTxaAlbdaEn
         NLjkKR1ajMym8z4uqVaF03FW94F4hDiCch8J7Usle6wreFFh7lu4B1jQDlgpqXvKafr/
         pjkKFZfon0fiYDdJWUAAZdcEqjcLXxTNExKPK9Hm15i53gFyS19kN2P/tb8CXYhm+EET
         +c0zSmq3G5hiFUz3cPO6SBmLZBQHwvBGYgcy4AcImQkA9lVOTY6fCzHgFDpPrsLGWgsz
         piqcpyqaUZTGQhHJvQmaJPfBzM3UVOEgLvQNA482BFQgbs8wMTIptc/yGH/pNuBW1hGw
         QGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788512022; x=1789116822;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cAIBUjFQ+3Ly1pIl7XaJ88bzL4A1FyWiRTzQz4fZMtA=;
        b=psCFrxx/D5uQR3HKXBkTDmEnpQfc1IVMQFPD7Vcj385PedpMWwvvpZRYWdtmeFvKNU
         q6DJ8NLu0hgvT19SjQq0cKXseyOQoLDvwHTi/0A1L0pIhnlUOCEmGfp0xtKGLfmCLRKh
         BVIYKCaGCULMmA3dKX6iabnQIfhbiHNpI/bon1gatrK+v5ExF5lrTgMeXWZ5u+kzgA/M
         EYpE/WnjdL0WS6Kyot00JFLNOwpL89Tni9gkptBIGoCoiswav5tw3aL3V63CH/7OFJfF
         82aorIOr8Yj8XsaMe3KTvVelCyhO1mAPFK7DBTod4iDPmnoqJfqFaIZ+p4AM1Mp2O+kb
         F44w==
X-Forwarded-Encrypted: i=1; AKwUvBwWaA16xudn0/deEAxHmqynwQ5UsKdCtp71B4NMPR0viTFBZx/VRyo9Gn09sjuogfRgLvKDK6PfOgWndoqmL4H5@lists.infradead.org
X-Gm-Message-State: AFuF++mZn+Gcm7RdTgoF7AXaC3l+C5rtloDf0YVMpvvVZccb7TL4dwiO
	oe08o+jpkxMq0v9GLK2dmauneQE/hYtqrCr0X+NsLt7Ni0V8IgKVTdM4it8+5rxPllrFJNiTRc6
	6rQlcomD+wYJH7MHixxQWWyMAvN+X4fY=
X-Gm-Gg: AYBFou0Loc+CFAAS92O+NUVbZVoNK45Pb0oytL7L8T+63xpZS35+odVfd6U+8TBC8Y1
	78q23KxKNHJyI0Q1FC+87/XEvP7ce/7sKYLGAwus+WIA18zOab1EMxgLCxLFoyEKwNoHIUJh/tq
	qxAt+A6/YTzaRis0wptpzlBEl7j6+KqCmwK95vcXU4BpWMu99cPENR6W+LlXYr8yoG9YgeZzbmN
	nn1gq6141OipNyQKD0vnWHuRFf5WuvjSGBEXVH3BSxdtH/MniUHP6Zpjz1k0gIPcHCShR/cVg1m
	OhyNxQG0gZ5SUqhLAcard+iEOr4oefQ2aofvPWVy98iTJgHDNkN3Ujlr7vGERDnQMwcmFSmszHM
	/DvFnFOa9zCKenIUhGHhxoPUAaOLA+Wef0JNRoytz7gAJeamVj5BMCbeD
X-Received: by 2002:a05:6a21:487:b0:3c3:9df0:2d66 with SMTP id
 adf61e73a8af0-3da39b71849mr6947233637.6.1788512022315; Fri, 04 Sep 2026
 01:53:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260810051907.27136-1-phucduc.bui@gmail.com> <fe85bcab-0467-4cab-97e0-8427387358cc@foss.st.com>
In-Reply-To: <fe85bcab-0467-4cab-97e0-8427387358cc@foss.st.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 4 Sep 2026 15:53:29 +0700
X-Gm-Features: AcwNN1WTqdbmh2TSlvmQXAuzUgfnu8PThlxFIUq7F0eBJ6BcdpQVRvfvYmsXbIc
Message-ID: <CAABR9nFsV2dSbw1NSeVwoEPJ9YvNCLD9-D9vin+43LrCaKqWmg@mail.gmail.com>
Subject: Re: [Linux-stm32] [PATCH] remoteproc: stm32_rproc: Propagate errors
 from optional IRQ lookup
To: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-remoteproc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_015343_556812_760DC031 
X-CRM114-Status: UNSURE (   8.83  )
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

Hi Arnaud,

Thank you for the Acked-by tag!

> >
> > Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
>
> Acked-by: Arnaud Pouliquen arnaud.pouliquen@foss.st.com
>

I noticed that the tag is missing the angle brackets around your email address.
I'll fix that and send v2 shortly.

Best regards,
Phuc

