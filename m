Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BCF9C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 22:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nxxTE8N1NiBs4G5g2I9AK/16Q2IKP+a3RuAqB4TehIU=; b=yCAIl1gg4yvOXPYXfgKuA8UPgf
	FSkAIixd9FmTvFKvPzOy6Pbf4goHd8Co6H6fzX3ZkkZ6WRHZgOtKUmqunRZZfbuYUtHKgrs/pGtWr
	v+fjGzR6pY6H2oQtiU32pDz8noWfXiDlt9YMZHo19DeIeAVXMe5CHQcW9W3zBirgK8BKtGTaD/2PV
	BfKK1uOWIG6T0BR213IDGu5yBE6KjdrWV7AkAUGBCFqjbhlqn4k1t/S9sSuipLtn/3YcFHQIqtOZf
	K1841I7IwUrVobPicQqcGF3FQrC0vUu2pIAN88ka8EfTQbmGlMefTyhcvPusuGyqphU1SnQsp+OJP
	veNKW+3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK37L-0000000BkFn-2SCO;
	Tue, 27 May 2025 22:49:55 +0000
Received: from mail-vk1-xa34.google.com ([2607:f8b0:4864:20::a34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uK35C-0000000Bk31-2bpt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 22:47:43 +0000
Received: by mail-vk1-xa34.google.com with SMTP id 71dfb90a1353d-5259331b31eso1293374e0c.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 May 2025 15:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748386061; x=1748990861; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nxxTE8N1NiBs4G5g2I9AK/16Q2IKP+a3RuAqB4TehIU=;
        b=axiKKebmRnlxYk6Dq9wJTKYJI8adHQcychChfmmgbBEY1/X7dNf8VR+TXrLSqqQTG1
         Umdg13H0WRCg6sIFC/ziT7H77U7VpJF5U4AfUrYEtvIxHQCpaWIM7cGhAVjxma687lAv
         gWaBxn6JGe+ZghWajtZAeRHIlAYSSLV+26Q0XCACNQdNbYr4FmEYB8uRY7KFAZ4kMCz2
         D4IZ7M89BveJXI3kjPkZIdlO30QdFmWv8PozhBxTkUDlG+4BiCwQXpNlVuG/JXPCvzS9
         7lwEc0x0mwK6hjp4vby4IBKYNwYUZT5lItKoXnj7uWSf73FU76i0A7ImWE40IhT16F/X
         YPlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748386061; x=1748990861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxxTE8N1NiBs4G5g2I9AK/16Q2IKP+a3RuAqB4TehIU=;
        b=hxG59wHIpcia7qYIz8WbIivVYw1y5QslV6gQ+EKxfTzrLbpDuVxayPjC8GNrnJE30R
         B5tBuIbWCkl2tJMnqtqdtqEzP9zfXENl+nFx+Y3XlufWYyXjDsf4HUsgyNDrvQW0Rgcb
         0iDxiRpa/VnNA9bjluEpnxTI66MV1QGSpIsjUUj/fOv4PNM5JNUmKsayIgL19gdtXZ37
         ybQSOrE4Wg53gakCHnDNW/re4DFMwyYO67MEikPG+1S5EwqOgF/9VdVw9LGQSaB7nGks
         kd41ntR4HsoDCI6TsajQmKB/iACtLpftWLynHWvJe2CKGLXhz6jlwh49R6zxBBdaEpUO
         qXAg==
X-Forwarded-Encrypted: i=1; AJvYcCUWm1PvdNfjklGTYsEQLL0dYIK04Fy4emJB7GR5IUiFyV4DZbbnAqrfhxZ2vb0pvVdjd8M6ocodM/WJ+Pwyvxbj@lists.infradead.org
X-Gm-Message-State: AOJu0YwW1uizDIUQaq8M9E9rnob41DtRgz7gSf97iSE50iPWNpvhKXqK
	OuVZ6MPqD4Y5ur/nbCiEW0heJxnoo8AFbB+JLhjdzPa1+nSnjDeRQEw1G7Z8cGySAPnnx2qlzz3
	mHb2+Obj8/+d/Z62IWZ2/IWRltgROAbo=
X-Gm-Gg: ASbGncujLYM0CYMb46vhLVcBfvuL7sfzzgr5N8WdoPMMM25/td+h3TN/v+E7OHu7R70
	FLfkk9HIoAFuI8uaZPlT0jRXIXfNtIO74U14WQQnOKM6eEaZQwHf9PWZNyi+5+VYCHACVL6Lti8
	y4YwpNtOiCqdooYqMQAHStWP56YP/Kzlp5/w==
X-Google-Smtp-Source: AGHT+IEIHMkdlH/en+uXp0oVsAoqX5M/MWpWjcwQtNcI4RUU/vNIUEP2JP+Exp7QavSYY/Cs2DChtfMhjj8/xUWGVBU=
X-Received: by 2002:a05:6122:3087:b0:530:63d9:115a with SMTP id
 71dfb90a1353d-53063d913a6mr831217e0c.4.1748386061291; Tue, 27 May 2025
 15:47:41 -0700 (PDT)
MIME-Version: 1.0
References: <20250527175558.2738342-1-james.hilliard1@gmail.com>
 <631ed4fe-f28a-443b-922b-7f41c20f31f3@lunn.ch> <CADvTj4rGdb_kHV_gjKTJNkzYEPMzqLcHY_1xw7wy5r-ryqDfNQ@mail.gmail.com>
 <fe8fb314-de99-45c2-b71e-5cedffe590b0@lunn.ch> <CADvTj4qRmjUQJnhamkWNpHGNAtvFyOJnbaQ5RZ6NYYqSNhxshA@mail.gmail.com>
 <014d8d63-bfb1-4911-9ea6-6f4cdabc46e5@lunn.ch> <CADvTj4oVj-38ohw7Na9rkXLTGEEFkLv=4S40GPvHM5eZnN7KyA@mail.gmail.com>
 <93bfec74-c679-400f-8ce4-3bc84d6d803f@lunn.ch>
In-Reply-To: <93bfec74-c679-400f-8ce4-3bc84d6d803f@lunn.ch>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 May 2025 16:47:30 -0600
X-Gm-Features: AX0GCFtPGtsaGbTe2C2G-Irv_0PosK6COEhRkyls49G6hbvQpWVi2Nid9Q5gamo
Message-ID: <CADvTj4oF4UOnDUvVUtuaM6U5RR4WF02qmheqg8fEafev2En3eQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] net: stmmac: allow drivers to explicitly select
 PHY device
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Russell King <linux@armlinux.org.uk>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, Furong Xu <0x1207@gmail.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_154742_663762_01132281 
X-CRM114-Status: GOOD (  20.48  )
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

On Tue, May 27, 2025 at 3:48=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wrote:
>
> On Tue, May 27, 2025 at 02:37:03PM -0600, James Hilliard wrote:
> > On Tue, May 27, 2025 at 2:30=E2=80=AFPM Andrew Lunn <andrew@lunn.ch> wr=
ote:
> > >
> > > > Sure, that may make sense to do as well, but I still don't see
> > > > how that impacts the need to runtime select the PHY which
> > > > is configured for the correct MFD.
> > >
> > > If you know what variant you have, you only include the one PHY you
> > > actually have, and phy-handle points to it, just as normal. No runtim=
e
> > > selection.
> >
> > Oh, so here's the issue, we have both PHY variants, older hardware
> > generally has AC200 PHY's while newer ships AC300 PHY's, but
> > when I surveyed our deployed hardware using these boards many
> > systems of similar age would randomly mix AC200 and AC300 PHY's.
>
> Are they pin compatible?

From my understanding they are entirely pin compatible.

> But i assume none of these boards .dts files are actually in mainline?
> So they need to go through review, and are likely to be horribly
> broken and need fixing? So you can fix up the PHY node as part of the
> cleanup.

The specific board I'm working with is not in mainline, however there
are boards in mainline that will have the exact same issue. They simply
do not currently have any hardline ethernet support in mainline at the
moment and have to rely on wifi for internet connectivity unless using
out of tree patches.

