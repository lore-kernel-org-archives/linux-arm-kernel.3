Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABF9E6BF3C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 31 Jan 2026 02:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Et1LJjq+me05jisNBQoUpKr3ed6Fid9VeSP+iy1Nl3w=; b=AyWofq5hY4w/88xk4+Ayei/6ga
	LveKL/Hl+KWbMQ0QSQc0U2kzltzziDQhy3pwe+ULeis46M8tOw7za/ulwXXwQsA2wc+BHxsG/bD/n
	x470HX2v6/5Qt9nBjwm7i0JAG1BufXThDd9Q0DypMtv2/LyCANflow4Zd1mo5Nj9KZmc1u+2DRFiq
	/TTENY8JQyjuG+EB8zID90rDEGlrTuf332q29wk5MxSQRwPohAZgeyMJklpzkl0Zo/ui3ldmcEa7C
	g3E6DruTrdaB/9jtin5yRdc1cDVo6gW2nPKaqXIr6oII/rrnT8wj3Rq6Qnf1fR9lGQHGgByBKGvXl
	LA3tlx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm0MO-00000002DcU-2cYn;
	Sat, 31 Jan 2026 02:05:16 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vm0ML-00000002Dbo-1Oec
	for linux-arm-kernel@lists.infradead.org;
	Sat, 31 Jan 2026 02:05:14 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7d15b8feca3so2733932a34.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 18:05:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769825112; cv=none;
        d=google.com; s=arc-20240605;
        b=JQWNH/19lyaYBmANfCkT5C/NRp7DmLGYvht4HaOa0ghsrnfGd1/oN1o0fExRk89j7r
         6+iM1BEBnf3gdVSWnO4dUu3VXkFEDfBh3faVsBc+V7q570img1fi/r0V0rdWaUe/X315
         TMEMPOiLbjlGzSd/viRuceS9vWbLU3om8WAhxJ7oMf4GFMcsBG6o/ExAunLSrNxws5pf
         XIYaEyinEWy7r5ZVr38nB1LERnhDWo/GUy/3VqyqDTj05WgF31RD8+6IcHCJ6sGmVgCl
         h5SEjuqh8uNejzfrVqMdCT4Q+8Svb3sLKzmLJ03gPiWaDJUSm3OFXJEYxJLQae1WTwzA
         1RhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Et1LJjq+me05jisNBQoUpKr3ed6Fid9VeSP+iy1Nl3w=;
        fh=hyo/7v1U6JhEKcic0y7axBfG9UVry4epoNwX30sg7Js=;
        b=i9l2Xd7/zxZ/OFDXjnKXHmOrnIjvGMpS6tgKItHlxhh2Zy7+XsB2+slehxXlgj1rWw
         OYAvklyqxOf2PM3xFi98xO5POEjUYUP5yPWsfOpadAH0ZBimg+d6Dt4jFQ4LkS1J9zOC
         YPnmuha2ZnWnOEH6RJAwGAvIM8tlXvDGFHq60CAqOHpj4kWF/i96ACgpBv9Q+wSMc4l1
         98P3jrt8ik7fr/hcWQ2xe6GnIdWltw9R8FaXvRfkLegCnoV2NyxK0rKOO+2d9/f47neG
         B3vHi7t4wG0d/zH+OaseEw3iKZ6xUEUvl+mnUMFZNFvsEILMWEnqiiGomBNEv20Yg7G5
         OYIg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=u-northwestern-edu.20230601.gappssmtp.com; s=20230601; t=1769825112; x=1770429912; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Et1LJjq+me05jisNBQoUpKr3ed6Fid9VeSP+iy1Nl3w=;
        b=nuSsNLsBOzJht9kxbRmwKE5U6WUdeYGzcH70UV8dg8l8szOS0P5dHxGyY7w106X1cZ
         kmIWmLZyU4q3mC1FIiUhNQDA4LFHzotkBm/OkZOt36h9h9Nk9KZJFqglrWdXi/DMaEte
         8Unp2ApWe6+NAbxOmrsvo38okqwXTS3lXNZ1q8mh9K7LL+OnaEVHX+E1/C6iSf2S5UHa
         1DV+H1ECzS96qmknoh4AGfkC1YH9CXoexmKQbz7bKeJPuPhSGTz88dpTUTYFzh1NzZUE
         CUslT9G9RdcxcW/OfvDRTnJB0jq0SnmBH1VRBqOnujYqAu2xlpt992Oolfm7IFwTwP7O
         Pccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769825112; x=1770429912;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Et1LJjq+me05jisNBQoUpKr3ed6Fid9VeSP+iy1Nl3w=;
        b=PMMrysK+5b59P92k8bWWF5DG3oSmn/kmPk3X2pbOeeSQzZmjdrS53Q1fG56LhkqOrT
         4EMvdwcIwphMGhEs03hefzlOPkPPxmtCRgSrvoZsTelF5DiEQYVOM66tVFnONX9W7l+2
         3k2zsX1KAJ+XRNVlt6mmo71tweFuWuWotUNVxtelN+I8OPwtVaLFq8aQrs0hwlblapLI
         GgvA8jW4ZFA3ikOtk63C42ezjhW1/OxlCTcIcdVlKd8Mskj/Tfzzvy3/s5ttSpizaqP9
         mKWO6w3A61M2vrvJVOgNksQ/ZY0mJ+TGM+0kgnyevr0N/ofEMnAXuoUuum/E4lxe06KK
         C9Dg==
X-Forwarded-Encrypted: i=1; AJvYcCWsGMyG+d+0rIyQche9wqzhV+Q9yrpzQNjbna15kPCBad0UXCy6OoiKQnnhHN+E5WQQTQQyRGJ0UGLCcoz/Qdfi@lists.infradead.org
X-Gm-Message-State: AOJu0Yz02hpEP/awPl9w8MsVivOdAEDcltIDZnzO9n66I0u524S4/hzX
	YE9w7ufCRdKtV4tMi9Ddvb63KSrpBfYG2NeGL57HDnF5RMfg59MIr2KDyV5hdptpOhldQ9n0MKq
	U08ZYI8F+9ysZ8geGD8pWwwjqyFHYr9BBtUZ6fqB0Ig==
X-Gm-Gg: AZuq6aJhP/nk3s++rqz4jEMxRKWT3e035NvI8gANe0QuRQ/V43Arf8NccyAnC01ZoY7
	efdPbznG7q2D/h9Zmy/Db1eEB2/f3tE84PlnISHPD3GA3uSNbrHpPGF56ltS3qu2Il1eiev1TWk
	iyqoTD5c8qJ+GYE6zW1l6y6HWpgkNgN1X9Z3cmb/GyhIF7xH3zcCmWBJNppHKNfONjRds5mt6eR
	znWgwzz7+w1tvVMcCYKxX0EbN540adJk0TbZQSBreWYJMcdqseZOMJ82hKpAqij2T0ZMCpDYpaR
	Js+bUDMVoeKv6wIALn5Kk236AVkswX4ozqk7sQej3SnCXlv2Jk7+ntKwulGPYQ==
X-Received: by 2002:a05:6830:3698:b0:7cf:d642:d36c with SMTP id
 46e09a7af769-7d1a52a7495mr2787735a34.2.1769825111961; Fri, 30 Jan 2026
 18:05:11 -0800 (PST)
MIME-Version: 1.0
References: <20260130032517.173590-1-n7l8m4@u.northwestern.edu> <CAGp9LzqQ45LAeeG1Cijs1QmtzBjOmML_qY=9Y5zH8tYmZeQWZQ@mail.gmail.com>
In-Reply-To: <CAGp9LzqQ45LAeeG1Cijs1QmtzBjOmML_qY=9Y5zH8tYmZeQWZQ@mail.gmail.com>
From: Ziyi Guo <n7l8m4@u.northwestern.edu>
Date: Fri, 30 Jan 2026 21:05:01 -0500
X-Gm-Features: AZwV_Qj3ZqdJVfOqPn3A8gLGh5XdNUoxV_dzTMgg-iq3V96ImWZgH2oWndFPTiA
Message-ID: <CAMFT1=YkqTrgVTmnf1YLQ_djk-2sU8VpDDDbw=TFBzoWs+MW9g@mail.gmail.com>
Subject: Re: [PATCH] wifi: mt76: add missing lock protection in mt76_sta_state
 for sta_event callback
To: Sean Wang <sean.wang@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_180513_669657_6672B0E8 
X-CRM114-Status: UNSURE (   9.15  )
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

On Fri, Jan 30, 2026 at 8:37=E2=80=AFPM Sean Wang <sean.wang@kernel.org> wr=
ote:
>
> The mt7921 / mt7925 .sta_event callback already holds the lock; this
> patch would cause a deadlock. Suggest adding the implementation to
> MT7915.
>

Thanks for the review, I'll add to MT7915, and send a v2 patch.

