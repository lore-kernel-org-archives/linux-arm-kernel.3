Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E14A7D743ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Nov 2024 23:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xs+SrsC9IUbgaKcIlQpBc93FEGDcRI3usKuzpnz5nwQ=; b=ZuLe9Xbfrwdxj+PLe8QNHk0pMt
	IntN1nqAJsb34bC7AWRy61xW83NrVxkEfGeqJNlj71tmuIUNdGrcpZXGiH5wFWW81hr2KjkC3Fn2q
	n3vyRChSo55xyCS1p88xE5wPk9+dX6/OIkJsZS1lxxBnT1kXKaJYYBZ2SIYmqgG3+2WtfifaWthv7
	FVxXDd/CWPadzwulPq/H92+NTnl85R/C68yi0bs3n2qkjy9Z4a/ZihZ/57yotuAuTE9JJ+rsjjcGe
	tnGVKlmD6UGht6mKrIfJ4WAAcCxiLayP7zdf18TciLFJiuAWHyXLiU0y0cNUqb+mDijHmxSmKeIOM
	WkQAGj5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDtzS-0000000GPK7-45Ad;
	Wed, 20 Nov 2024 23:20:06 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDtyW-0000000GPCk-3OhG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Nov 2024 23:19:09 +0000
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-a9a68480164so41733166b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 15:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1732144746; x=1732749546; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xs+SrsC9IUbgaKcIlQpBc93FEGDcRI3usKuzpnz5nwQ=;
        b=Tj/fh0TPNyBbiRm3Nlkoaz30yG2Q9EsiwezPeitTjpncuiEnaNYjV0dSrbZiyBJQCn
         o3tjiIK4cjOxUJrYpb8Vj4BMOYrLt8bBXd69DFB9ibqG0t7yeUG9aeBv3fsazn59s6KW
         RtRCLx6bB41Rcjc78erQYCE3x0/yF7wgWqm5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732144746; x=1732749546;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xs+SrsC9IUbgaKcIlQpBc93FEGDcRI3usKuzpnz5nwQ=;
        b=vy1RKH1jd5/kQH9804QOOp6s8JOmNGF7Q5sy0exxth1tTFwKxEuV8CjwWXmy/4g9fr
         9AcY8bjp2F0YEs0Qtogojf1r0QnBfpzZlrUVZ2pkq/XA+Qr08Rf773bkxG4Qyb0TpLiT
         apS5tJvWy5v8Iro3B0eQ1sKrE1LVG9MSWvdX3tE6P1S6zctk48/nu99E2qrD5DYqvhqU
         w28TdwSlkdDpz4vQ2nm/9I3lCHbfEAOvQr/8IsweqI1h1P11Cji53RzEL9PLnQDQBgFJ
         VevH35q+MvO19hArmsY0BaJypzwzHXs6cbWjRmJMF+NdZQRFuIblWfNb/jGHoyACve6+
         NPiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3wwkfiPulwffqUkA7CGB1Mc01crMfFi68N04ENncfx30BcqG1QOFtxyggLnE5w0R6PYOXNZbgsx8KfxWHpiEO@lists.infradead.org
X-Gm-Message-State: AOJu0YzpOuBpDefnK0Ymn6cqtD1wJV30iluAm/0SrUoymX+fCyLI6N73
	5ccHzYbC6mFfvEhEzNq9yrJLHCLV0BMWlr/1hWQaOGxpzMEGUqx5CeTSQtpZwpdd3cAJafUfiRr
	AVEb6/Q==
X-Gm-Gg: ASbGnctuJT/HJPZw5yxyjbKGQeK3yqgs1r/bzi1kRpHi5A4hnbLLDJYKs9qxq0ZbDAk
	IS/vBHPO4GGXEC+YkL0DKPa+BNpDpatDiaEF2mMn8m6S2PVA8eLeBMD74/4Zwv+wigsmvMI2RFZ
	zTB0yc00H8WchcnGNjC6/qG8+3hiB41h7Uyl9mkxWuvAuzKl9dqjtuUwwCyDKX5mk13AkAkJIxn
	zHaqpG7ltbR7eFvR0wzippYN2JGxspDKpZmN+OizEmPAbIQRxrJCHIVxJlMeqgXq3lDsqysYZPc
	2k5ajff2w7hQslo0udvW9+tX
X-Google-Smtp-Source: AGHT+IE+KFFgQApcvijMX4MhOMkvHItFufyXEc1Q5huu5P5taw6T+yanHF1jhst2bwmbXpc0+beDTw==
X-Received: by 2002:a17:907:1ca8:b0:aa1:94bb:c475 with SMTP id a640c23a62f3a-aa4dd5522demr463688366b.24.1732144746100;
        Wed, 20 Nov 2024 15:19:06 -0800 (PST)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa4f431b3b6sm10553566b.171.2024.11.20.15.19.05
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 15:19:05 -0800 (PST)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5cfaa02c716so323513a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 Nov 2024 15:19:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHBUd5tx1+NAEHaRAK3frTHrvcFZexblNRMFYKZz7B6SQEvoWQRuU7hxt7W304A+lj+Q5MBgAigQwcJJLZijMt@lists.infradead.org
X-Received: by 2002:a17:907:2d08:b0:a99:ecaf:4543 with SMTP id
 a640c23a62f3a-aa4dd57a0c5mr426803466b.25.1732144744981; Wed, 20 Nov 2024
 15:19:04 -0800 (PST)
MIME-Version: 1.0
References: <d58cbbc9-e5b0-49c3-8cf7-d0726e796e92@app.fastmail.com>
In-Reply-To: <d58cbbc9-e5b0-49c3-8cf7-d0726e796e92@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 20 Nov 2024 15:18:48 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi=GZ7766ZBoT11aAp=Nqw6Uf8eVvuyQAycXJ1TR=5e2Q@mail.gmail.com>
Message-ID: <CAHk-=wi=GZ7766ZBoT11aAp=Nqw6Uf8eVvuyQAycXJ1TR=5e2Q@mail.gmail.com>
Subject: Re: [GIT PULL 0/4] soc updates for 6.13
To: Arnd Bergmann <arnd@arndb.de>
Cc: soc@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_151908_864774_D1195E32 
X-CRM114-Status: UNSURE (   7.51  )
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

On Wed, 20 Nov 2024 at 14:58, Arnd Bergmann <arnd@arndb.de> wrote:
>
>      12 Jo=EF=BF=BD=EF=BF=BDo Paulo Gon=EF=BF=BD=EF=BF=BDalves

The name "Jo=C3=A3o Paulo Gon=C3=A7alves" seems to be correct in your actua=
l
pull requests and in the git tree, but you have something seriously
wrong with your summary generation locale.

              Linus

