Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D99A1CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 12:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmwG2u+A6lb0Y98jTWbQ8dh86e4JAc3PFQPA4/aVVM4=; b=HmN0D2xqARgwF2hf2yRys8lsBz
	9ey7o9R619MasNaEzIH9IAobc/U8m9sQBzIZpao+DA1Hu9I1asOnUTe3oiHqAjs7ymABH+0thY/wG
	IRoQsKKE90Qgr/p9PvQLdr3eofMKTMqJNT6KEN/GXaozL6P9jDZFd/+JeBXoLJ98zshfmpiMKqqLG
	/O9MkxzKwq2pdrntP8aa+hWyfuaSTfQy/Rcb/5iqG/nIArRYQkKmE5mt4uBxEB+tW5rl/7iCa2fwE
	tL2HOYCBA0DKzNwzI2eJ6WqZVZKDMub6dZGZfuMZIKEnw2JrB6FkFbDqg9fixuEgnsLh2nICGL/TV
	TIqzaCVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDr1-0000000HPrq-3Uxk;
	Thu, 18 Sep 2025 12:35:15 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzDqz-0000000HPrT-1ud7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 12:35:14 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b5241e51764so635627a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Sep 2025 05:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758198913; x=1758803713; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WmwG2u+A6lb0Y98jTWbQ8dh86e4JAc3PFQPA4/aVVM4=;
        b=Na7/zePp/6pIlpm1RPEvQCRSGUB/op9VWXyl+b7li8cGQnx3drFJWyy0nfNrh42Hgr
         Z7jYS7a36z7Hcf4YhHC757Gr65fK0xghrJyfSfRNPJMq07C+AHki/Gavm2APpseVa0IO
         o1rB6qlc17q7864+2QEa4jUrKSZCyPeqtg9mLC3hl4kfCoisspmZRwIkBJJ7FdwWJMYu
         YPZxW0wDdaJ8WZefiOhJGC4alxsCTYF1H73FntRiSQoL6BtEPHqDTOC6X7dkoEiBT9e9
         8C10ru+iAtObXAeEqU0IJM0lb2mvMzWhiQcwkWfeAqEM2ZKQeC7myjU0yr2Adn1YI1La
         cAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758198913; x=1758803713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WmwG2u+A6lb0Y98jTWbQ8dh86e4JAc3PFQPA4/aVVM4=;
        b=QqikX4p6uYWDeitXQSv3Bw8y1DNQ6/E+ZtoL3efii8NRxV0DWpRebT73+J+DeRVKpi
         Q5xhzgOOOUVubqyIitWnAQGxji1rspxN9CLZDJX4VzuoAnbJK7C6GnJhmfmHZLncBWQT
         NCcX5ZPDqKUvsw57IyOqfe9atsqDSIJ4+wwfG6nw5fDOYvgRbrOR6nnd2j9UE23MouIp
         WNOGu3tFMtUT5L3+srDeqmt9DrZH7ywchZOykSggLYu7L4PFWjnCwV6sc7ZBJWk51iWJ
         xdothMqbA2P/Cik0yccDhedXoFzDk/Izfc9qjYdL7lwqZzHaNNhAGOzFvQL5TnKiaiUw
         KT5A==
X-Forwarded-Encrypted: i=1; AJvYcCUESUiWywJp5apVnVbeAIqqeXHfJ/8GmfxT4h2WzD+ZkUgypK1ooVEiaMdxVPyiodgHtuAZEXKYKQ3u/Jzzw5wF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2rVJe0TbL1BhqjwpPe1wUQ/xwwi5h+MeOhMRGHvBLFDRoKjW5
	888MmHym6m7MSlkD5nV+D5nn5Gwpa3CLVuoOtgR8OGgU4dwP9W7g4vLGfQvV69WCWtjMfKe6j7w
	Fjp6ApDkm/tYQ4CYfHA0KgrLUmvZVzAs=
X-Gm-Gg: ASbGncsd5qQ/gveEKk2mtYaEt3ZoQDp2R8uc0d7tbdwvYltVXxkTJAOIzF9YLhvRFg5
	qOvjXO/0c6hOYtn8D9IPDa1gG7xIqubdy5g6eWlwgM4mHVchOxAE8X00GJOjhQRqIraec2camx3
	9WcFpZg0Be+yK5HULUcloVfYubB7fLDEMEgjLB0sGyIPDrIGUpHSiXAjVgTtaEeNh8afQMvTXf0
	XlA/0smtXECb1jVgzm7PpfLpCzYp/AqGG7vmkOE8XlUMRylj9Jklbo=
X-Google-Smtp-Source: AGHT+IF5CLHJIp92USkA4+4XS9SnflXRFNFA4KNQ8mQvZFJgKz7NDJudA8HZO2hgaQ+oWxgXz4tBfw4gYVeBO4KbAgs=
X-Received: by 2002:a17:902:ce91:b0:24b:182b:7144 with SMTP id
 d9443c01a7336-268118b4708mr79285865ad.7.1758198912690; Thu, 18 Sep 2025
 05:35:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250918-imx_rproc_c2-v1-0-deec8183185f@nxp.com> <20250918-imx_rproc_c2-v1-3-deec8183185f@nxp.com>
In-Reply-To: <20250918-imx_rproc_c2-v1-3-deec8183185f@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 18 Sep 2025 15:37:31 +0300
X-Gm-Features: AS18NWAc8U_p2z0I7kb8DWdQ86uq1YFFMY1dQTrBWLLBGeNxnk_fylcKHlj3yqM
Message-ID: <CAEnQRZDZ+unzySHbvMZaAfjecxWYCicCKbiW+Oth8JL-tZpeCQ@mail.gmail.com>
Subject: Re: [PATCH 3/5] remoteproc: imx_rproc: Enable PM runtime support unconditionally
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_053513_497891_803DAE5D 
X-CRM114-Status: UNSURE (   9.77  )
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

On Thu, Sep 18, 2025 at 2:52=E2=80=AFPM Peng Fan <peng.fan@nxp.com> wrote:
>
> PM runtime support is safe and applicable across all i.MX platforms, not
> just those using the SCU API. Remove the conditional check and enable PM
> runtime unconditionally to simplify the code and ensure consistent power
> management behavior.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

