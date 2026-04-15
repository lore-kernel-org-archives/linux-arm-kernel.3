Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F1BF43834
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1VOuNwEfeozQq2kMUhcXYFUYg+uJ+za15jc5bP91H/o=; b=Dnj4Qc3KNf9S6xoIn/+DBOHFDL
	yOhuBSTSGllWJca+NUiN0wGwAeyC6v1cjRzYbkjUgMp/26wzIL1knzEElO3AtYqz9QV+IoXknW1Sg
	PzXY6WrRHE+VPF2//abH1SYzqqfADQj8d9qXXhaauLyEQ/HWVmgwVj5dGzU/qjdg3665Vw42+nj+o
	G88X3WXZd2C7DTJz3P/NDoXRy3RZh7nMHohB2BlAP8ypK6VW8JAoc9Gs0EMwahzpMJvlDd1vhM4yj
	nRIBJBYkTkJlsuRRDBZkloCR8QFhNM+QM4vJ6fm2VA7M47Qk3ARx76qY/nAwfl8Z+lfKTczAAFiFP
	LWnVVVSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD21l-00000001Iyz-3hsQ;
	Wed, 15 Apr 2026 15:19:41 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD21j-00000001IyJ-05kl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Apr 2026 15:19:40 +0000
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-7dbf23885dfso4188144a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Apr 2026 08:19:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776266377; cv=none;
        d=google.com; s=arc-20240605;
        b=Dr8euQnlN/M0cnjWw7sJW18A8MD7Gu+KY49EBbOmJhmacCTzk41UD4yuNBls7LH3O8
         rcUxysiTUC/Cd2R3xFMu7bFm2bMEh+Hjw8hQi1alYV8GjdLzVf00qdysNtZwX2uQFTjT
         glSjeL6+OLLHrIXu2Fl9FTW5Kv7/qSUKRiePUFWxQcJQZ32TBa7OWvU+Rneddrhf40dP
         QTMN59cOcgoaPX5nAePEwQ9ci4EwWEgsFVmKD9vAf8W3jotCRCfks66RYBAFPE6S+7eb
         wAyA8JAiiz6TyPnloT5B6OgiRMKBmfnTFNGoF1wuSMbynDhRst78rxnRRpasrG9Y2Hd/
         ytEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1VOuNwEfeozQq2kMUhcXYFUYg+uJ+za15jc5bP91H/o=;
        fh=M9euRGDY+VMUv4rxUPdfDZDK0BidY+5VPc763zGrn/s=;
        b=dEYvv+uoR9l5WRs/irxmHYsuJMDOl2hTdY0BrNM0+Y1pSR2l3sGn+/K2c16fU3DAxV
         QMkks8VH+2O3oRIE7js6gn3RzD0EJ5SK4sotsxDYKpfUZUIlXtezYXq+mckyNfU3mk2Z
         ppTMxZz86/LtJbbmDg0+zqCQ1u+vbJXOCz619x1R2QF+j+M7qnKMeWyFZRP2IgxNuWJ3
         HY6VzkWBN7yBkpDDUdnWjW6gHn2ewpOHozxZrT2UGz5NErKcAz3jor6JqaPFFrnhp5sk
         UyAoBbI4Q3f0rFJ2q9imddmUXiYIqhdtLS5WoJpuU3F7nHYksa45hYCkFTlRe7qTlZYF
         FHmg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776266377; x=1776871177; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VOuNwEfeozQq2kMUhcXYFUYg+uJ+za15jc5bP91H/o=;
        b=O81gv+Ty5HOn8szg3d+YQM0ayIa5k3ntmGatWJrwTtc0ll5nG+v47OB1YdLE04PUrl
         PdtFpoDT4+EZdIwjdDg6jBRaqRsw6etnAGnVXqITT9FYTpueRIaWFp6gy3vCvrnyDbPf
         AjfnOSagl8I+Iaa1Dpw7pNCs7bgevIE/h51xTtmAwRbJWKZA0rBk4NhXBnr2I+26XkCj
         HG502itNjuO3Vp1W9ffH8sVgd9wy7+HItjV2KSBY1ZEiAxgh8TCdpTH0TsZlmluPl6am
         zWJRmnGySNDGB0pmW5oSpPcArOdjuDHQFrpuudgiPEVwL9G3Ca8eQYs5RyGjl1x7rKR6
         yXsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776266377; x=1776871177;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1VOuNwEfeozQq2kMUhcXYFUYg+uJ+za15jc5bP91H/o=;
        b=TmC6M+hZZTVSi8mLOiwmyWUtBNTZIIc3v4min8TO64fF8qtrLEyORNQZI7hJfHWKJq
         NKV+xKSeO6ZT7jTr9tINljqQYWkCVc+4CjlOLYgWYBJy1J6tlM5ItsdOYVPClZb7yBvn
         Oedg51+QXkDuBvB0FhQGMbIDAAqE0RwDFj2rb5vNRclsQjyNsnpqQbTAWbU4DOoDVfvZ
         tDUI6aSopt+ZxAajNp6lvrhVBew0W1gni12djyLvcc/E87t59yWETamTU5gD5V2jwO9/
         2RWKTKLbVfj7rFk6xgJe2K544FhRo3NUbkk8qFg+8uRoUnrgIw6hLYDtS/hOTTJHWvYz
         rhug==
X-Forwarded-Encrypted: i=1; AFNElJ9Nn+mK83DiryW6klO08o+Km7j/BLefLadlj8kYRW9X8D7gPhidExh9BB/+zrQmaz7fnXs/1kbOS2DTmniuvKl6@lists.infradead.org
X-Gm-Message-State: AOJu0YyxJkMJVzvfJIFbZRRXmhkvWq6TbhFQYmcaDkbz/6qWis3fHVy1
	n37iax4LjyZTXSL/DaNvSYs1gpt/xPilyRJy0a0iwqgPx7yn/zovpgI3XZdgQ3Vyu2lplkXK+4p
	XbGwyLmL7Wn0uVu2ChLmrh7eYnSVj90I=
X-Gm-Gg: AeBDievLBXRLKdnHm67oMBLnuq2VWEPD2gR56/EY4OfQwERWhNCt4MK/c3odGNpuJOX
	XFeo8L470d6cJHlqiE5tlsbVJzHJ9TCGu8ACFEn3vrgqwzwe2/WkIU06tM8W96Zu6JVUCQievz2
	nZLLbcdIFPnM8XiUEQY4VgsReA6EeIPjKRG+9sUEJvnCGsc3QRRJkHTOQEly+cIPgez6QAcgOg2
	xa1xZUgV0n1W2sLkgVsxz4EHEf0MxVEbYmCfB8cYs2481Mb/10Q90bLr/XhAuFFepWC7Z0/2Jv6
	Bsuh6vYcB3nypKxU4xvbiVuq1qLHqMuRyPMvUIvchBeWIyDwvpzrViAh/D6nWhDlsxgJ1GnYEFH
	94A==
X-Received: by 2002:a05:6820:98a:b0:68c:a53c:8ff1 with SMTP id
 006d021491bc7-68ca54bd3eamr11009276eaf.11.1776266377081; Wed, 15 Apr 2026
 08:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <20260407-brcm-prio-v2-1-3f745edf49af@gmail.com>
 <CABBYNZJAEqwfTuVqbFAnx97HBSjcwn3Hb+y+r4r2C=MMPxFoDg@mail.gmail.com> <CAMT+MTQ6orj5tpiGL9hz8m2TGiBjA-9D_0e1iLt=_dXBFHcOgg@mail.gmail.com>
In-Reply-To: <CAMT+MTQ6orj5tpiGL9hz8m2TGiBjA-9D_0e1iLt=_dXBFHcOgg@mail.gmail.com>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 15 Apr 2026 11:19:24 -0400
X-Gm-Features: AQROBzDwk1p0rJ7IlG2lPh_IuUkTifTHO7F9HnsebEPzRDlTsV8TRziiZbRGV7g
Message-ID: <CABBYNZLNR8hYS9jLLKeB=M9XVvtSFtf1wi4DmcJKBbQVvHTPaw@mail.gmail.com>
Subject: Re: [PATCH v2] Bluetooth: Add Broadcom channel priority commands
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Marcel Holtmann <marcel@holtmann.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_081939_066128_BBA0A8AF 
X-CRM114-Status: GOOD (  21.11  )
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

Hi Sasha,

On Wed, Apr 15, 2026 at 8:34=E2=80=AFAM Sasha Finkelstein <fnkl.kernel@gmai=
l.com> wrote:
>
> On Tue, 14 Apr 2026 at 16:00, Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
> > > +       if (sock)
> > > +               set_bit(SOCK_CUSTOM_SOCKOPT, &sock->flags);
> >
> > This is more complicated than it needs to be. I'd just add a new
> > callback, `hdev->set_priority(handle, skb->priority)`, so the driver
> > is called whenever it needs to elevate a connection's priority, that
> > said there could be cases where a connection needs its priority set
> > momentarily to transmit A2DP, followed by OBEX packets that are best
> > effort. Therefore, `hci_conn` will probably need to track the priority
> > so it can detect when it needs changing on a per skb basis.
>
> I have tested per-skb priorities, and unfortunately, this does not work.
> If something tries to send a low-priority packet (for example - a volume
> adjustment), a priority drop causes the same kind of dropout that is
> caused by scans. It appears that the only way to make this hardware work
> is to set the entire hci connection as high priority for as long as it
> is being used to transmit audio.

Ok, then maybe we should decrease the priority, so it can only go up.
That said, in a multiple connection scenario, we cannot really tell
what should be prioritized if we cannot momentarily decrease the
priority.

--=20
Luiz Augusto von Dentz

