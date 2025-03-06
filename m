Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DB6C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 08:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l11SkgWqUPrtSyPOaTCEHvWbGMPH1FvVn4OSdWqPLcU=; b=1LVIN7kTkNWAaACs10qp+8cx6S
	q+FST3g3VN5KDCRNW/XTY0iW22eCJJKbwdRMn6qvkmkGqXOrB09LX5wtHfnPlp83x3g71pDmFDCFS
	U8MO8nMXLncERQsFBdyoUrO8n62Obnf/bPoulLfJ+d+qMjTtNTFH+S3Hs1ArdARHFUzWh3pf0ksDT
	EZV8HvdSVaNn8MImraaO9YI7uU4i6jUpiFrxaztMQMmOYNuQKeZUVudISXUycFjtX09vLKw2AKFxP
	4fLy2iM5rWgFgF7pGpsWBDHnnsPDeU5YdHjFtJ8dapqDYFTyrQ22i1YMm1ILrYiQlzIEvZVd5OUvP
	7+kQsAMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6Zs-0000000AL24-0M2x;
	Thu, 06 Mar 2025 08:27:36 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq6Xt-0000000AKiy-2ko9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 08:25:35 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6f6ca9a3425so3838267b3.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Mar 2025 00:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741249532; x=1741854332; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=l11SkgWqUPrtSyPOaTCEHvWbGMPH1FvVn4OSdWqPLcU=;
        b=nHWTJt4yWMU6DcqaW+vZO1hDLGm07g3r0deV8LABRlqRa3nM6tx1UuLnU3OY2USS4F
         qMYSY4CaiWyBsZzykrB43F+665nn3LelDqBiPnnb38rnuoWkrkClmLkeQBfoHJqVTLn8
         /VSTWXrLo1woYmzyI3NYeNLjeoqMVNgKojwjvXr+ahmY6KHpIOLuDHiJda3Ri/QYSnfB
         T1ISATID0cfwDKEOhMfVk7lZ9mZSKjo4Q3Y1MNvcLYkl+uPq+swM2rkkcXfAiKHdjWfP
         So7dnQTMEYJ7PLA/pX4eTEGbi0OiYtjF++kfC3p4thAb57H6rdSvlhVVB6DOl90XBOw6
         NLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741249532; x=1741854332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l11SkgWqUPrtSyPOaTCEHvWbGMPH1FvVn4OSdWqPLcU=;
        b=hQakxCeIWDfmZU3nKYYrpEVAZ86hTjmKOhmsH/aafU9E4PrgPcr1uN95RR04nlf9xm
         HyF+KxVVxFH8FJa+JvtKnCpNSY+6xdFbAjnE8Lc34XMWcW3Pnctp54iWkT5EpWfyXfhm
         t8Kg1HtZH+Rb936/b3l9XnRM+6gwHRkN3KIDtlaUCyaAM2DUMZnFcXtIwCUK7WTlEZjo
         y9z3JDToqG5Mxikm2ZN9WmiBmmvmmxwyWIh5X1JajWyO8oJjo3e7gN3g7eMRrnNk219R
         D+xp+nM3IMvG1zoom1KnM2lBJOSRNdgOPPD4VK5x3elZ5vNbStxARMjBpEGo0p9vRaV1
         gCig==
X-Forwarded-Encrypted: i=1; AJvYcCUg8GMjZL5z2iDrXaob6onDhFrRTZcn0E7pBCgCpriNPGlthHJIbZ0oCoJOxliFBLFnpRSQOW+rU3cDuPz2hXq2@lists.infradead.org
X-Gm-Message-State: AOJu0YyD/cmdW467+P0PR79frlXD+Kw1K823FjVo6zvr8ErpccitY8LM
	sMA9JXla9F5sPwrAz/AIIQE5huB4jsD7OR1mRn6D9RxnKiqH9cIyW2ezndshk5WsbSYDH/mz8hL
	IuXsiGnL5NoVFM+hJlBeTq+0yaYs=
X-Gm-Gg: ASbGncvAsG5887r8wkOcHlSPovFjxgjyKEPAwaqfPkYPxr0xZJ1i4oCQsehIE8X1h8T
	Xtuqlgu0lfDhRJvMt5beLy0/E3NKoXB/lDR/eeXo4c1hb8+a2RAaAAxiFPVg3QsZmSNksZl0Hs+
	pi+IyATYzDlgyrrU3UlD42EjH6zC0=
X-Google-Smtp-Source: AGHT+IFnspkvdpJ+HPHBG/KH8TGaWDZN0+StO/ZWaAuyUTjQwZy69YzKVcuXuloS7kwM1iyp/LGVYtDT6bnacFmZ8Iw=
X-Received: by 2002:a05:690c:4885:b0:6ef:5097:5daa with SMTP id
 00721157ae682-6fda30765e7mr87697697b3.34.1741249532155; Thu, 06 Mar 2025
 00:25:32 -0800 (PST)
MIME-Version: 1.0
References: <20250305-spmi-v1-0-c98f561fa99f@gmail.com> <20250305-spmi-v1-2-c98f561fa99f@gmail.com>
 <f17372963b92074144b07d34f3e91ba7.sboyd@kernel.org>
In-Reply-To: <f17372963b92074144b07d34f3e91ba7.sboyd@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 6 Mar 2025 09:25:21 +0100
X-Gm-Features: AQ5f1JqQuLKh7WecZEc6nmQrvFQ9MPHH5tqpXbx3DWso9KKNvdQNFg8hYDfSVJo
Message-ID: <CAMT+MTREFq2_ABXZF-WsAkw9qP6eXd7gQwgFGm7fw6nBntdbyQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] spmi: add a spmi driver for Apple SoC
To: Stephen Boyd <sboyd@kernel.org>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Conor Dooley <conor+dt@kernel.org>, 
	Janne Grunau <j@jannau.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>, Sven Peter <sven@svenpeter.dev>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Jean-Francois Bortolotti <jeff@borto.fr>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_002533_692815_690CF976 
X-CRM114-Status: GOOD (  13.69  )
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

On Wed, 5 Mar 2025 at 23:11, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Sasha Finkelstein via B4 Relay (2025-03-05 12:26:40)
> > +       while (len_to_read < bc) {
> > +               rsp = read_reg(spmi, SPMI_RSP_REG);
> > +               i = 0;
> > +               while ((len_to_read < bc) && (i < 4)) {
> > +                       __buf[len_to_read++] = ((0xff << (8 * i)) & rsp) >>
> > +                                              (8 * i);
> > +                       i += 1;
> > +               }
>
> Is this ioread32_rep()?
>
[...]
> > +       while (i < bc) {
> > +               j = 0;
> > +               spmi_cmd = 0;
> > +               while ((j < 4) & (i < bc))
> > +                       spmi_cmd |= __buf[i++] << (j++ * 8);
>
> Is this iowrite32_rep()? Perhaps unaligned sizes have to be dealt with,
> but otherwise I suspect it would be more efficient to use
> iowrite32_rep() until the number of bytes is less than 4 and then do the
> one extra pack.

I think it would be better to leave them open-coded, io{read,write}32_rep
casts the buffer to u32 and accesses it that way, probably resulting in
unaligned accesses, and we are on arm64.

