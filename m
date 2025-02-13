Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA72C02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 01:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nF+3d9YE5wll/jDVUEdSENnWO/Lio/88ULs9I5MUpd8=; b=AzyrQsJ76IyQWHND8vzRy77maF
	0yA9GuoAIU0zOiDy0lpIPe9YAfeqI26Bu/kTYX6y38g6+CN4wwN/vHt7Qib5auWu7c7L38T9UvdIO
	1TDFFpy5+skZ7vORFcVQw3joAdTeLXGzJtP9nLbsiOu6snPLrdEV5u0LD47pZgeyd8AVzy/jZNgyH
	GZpABDYwK/9u3F29lx0rfw1LKdpO2008tFBzI05wNZ+ocm8IogkUUoRpTJNA+OMgJqUJVlQ1u8hp8
	v0OxZ/VvOZC1WBFL/Fy6I2DfSFT9BC/mDUOyXhZGGwKV23ct/BdRFdNlU6qrzMV3z/L+6SeTHHWX+
	0fpizhHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiOP1-00000009REc-08ix;
	Thu, 13 Feb 2025 01:52:31 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiONZ-00000009R30-3KZm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 01:51:02 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-220c3e25658so734685ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 17:51:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739411461; x=1740016261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nF+3d9YE5wll/jDVUEdSENnWO/Lio/88ULs9I5MUpd8=;
        b=HmvW2DC1fkGMlEJiO4KNDkLIU36Fmq71SFNeOYMcZ7SIwM8WzvleMc8wXoZrCWiHiu
         U+RTs8G972NTPalV6T34sSIcbXgHlNNYcDhPdoy6vc2YpYT1S4sr9yBuzzfeTjeJsMgr
         rTGBPDY5wgNnS03Daq9Q1bvvh/R+qSWL6Ale2awUzf88kyCTs4c32E0HPHEOe9bsIrmH
         xmYrBwQcdhaX4/0iGxqtbFY4eoJilTJtpfJcoOesdfFR1oJQ7wAFI/u95pt3qoffZXNu
         3stlRR4pXSDkdSo8L2vb4BFIxSoUP1N8LHrndBUHOFNzOboTZ/zOoNNHpUkc1PxhgYxP
         fXpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739411461; x=1740016261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nF+3d9YE5wll/jDVUEdSENnWO/Lio/88ULs9I5MUpd8=;
        b=hhdJLQRXk2OXhC1ZEg/DtLABBC0SvcCmnaKWIT/tKZdHzfUCnx/4wqzijfofOaexs1
         Pjq4E/Ci7dIueqf+m5i5KhjMQ/ilgEesNcVeIaZb145izDQ2tGdBx32zMD0E3r9yUWAG
         ukbmeixhlS97qLGSghT8CSrdNXafZrTeHvAuRiK5xexi2QX2IUPVickilxwp8h7+MC/o
         RWQU44XkaHOczGMQdTKBlqeYe9M37AIRNILbu4GhIjQtOdjG4pK1RFvy8+r/6qxpqKgQ
         676w8idpCw4QDVQ9WnNyW3xSPnJ3S1oj1zqTGjqsEAl47+mu9T3h0JC3C5Kz0ucYr4YS
         VSkg==
X-Forwarded-Encrypted: i=1; AJvYcCW+rxX622bn7B0JSMHWfi3FDx3l/mF8EA/bM6yC6wMS8SnriazjOt7eryFgNfJ6RKu+W447znfL90WT7KTyAw8e@lists.infradead.org
X-Gm-Message-State: AOJu0YyKlYByRQzjbmVqMpvaVuF/0f7tRH7/TQ9bAloG8YDcEA9KIIY2
	pKClqIs7qDzmCJ0YWTjVz6AMHWn+wL3dLGimz7gjf3cVM3Ag063WTyTFuxEjpljoeX6h6xstJEc
	8NBPaOWFj7BTA7BZJhkJSVmWCqg==
X-Gm-Gg: ASbGncv/vxZuENW2lU8j7oIGU6H0nbJUJd+w9FCzh7esd8ic/tM3YoFBLjyxD8HJvNa
	P36HHdY0T+SFT9Z55C/9rZGPImJC3PWqG1ypstIX06HlNhB+on7k7ltIqKRwUkYbvrxqd3dANYg
	==
X-Google-Smtp-Source: AGHT+IFMzUNH4nx8Yt+NdViQ9eOLs4WezIKfW1Xnu9XXaeSGgUXoUd6cnTuTro+aX0pUCtSkVo5z0Ezs9Q5zdCPaPVI=
X-Received: by 2002:a17:902:ea02:b0:215:3862:603a with SMTP id
 d9443c01a7336-220bbb465f2mr34801125ad.10.1739411460841; Wed, 12 Feb 2025
 17:51:00 -0800 (PST)
MIME-Version: 1.0
References: <20250212212556.2667-1-chenyuan0y@gmail.com> <f649fc0f8491ab666b3c10f74e3dc18da6c20f0a.camel@codeconstruct.com.au>
 <CALGdzuoeYesmdRBG_QPW_rkFcX7v=0hsDr0iX3u5extEL5qYag@mail.gmail.com> <8e6c7913fda39baa50309886f9f945864301660f.camel@codeconstruct.com.au>
In-Reply-To: <8e6c7913fda39baa50309886f9f945864301660f.camel@codeconstruct.com.au>
From: Chenyuan Yang <chenyuan0y@gmail.com>
Date: Wed, 12 Feb 2025 19:50:49 -0600
X-Gm-Features: AWEUYZkVYD9t8ecpGjfaGqr6TdWOTef7hnfeghSVidusmxHZlhnX0dA023zCsj4
Message-ID: <CALGdzurifZaqatjGRZGxA4FyNBHOYJdVXpKHSM4hQdA3qZtYvQ@mail.gmail.com>
Subject: Re: [PATCH] soc: aspeed: Add NULL pointer check in aspeed_lpc_enable_snoop()
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: joel@jms.id.au, richardcochran@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_175101_858109_CA389A61 
X-CRM114-Status: GOOD (  35.71  )
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

Hi Andrew,

I've drafted the following patch to address the resource cleanup issue:

```
 drivers/soc/aspeed/aspeed-lpc-snoop.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c
b/drivers/soc/aspeed/aspeed-lpc-snoop.c
index 9ab5ba9cf1d6..4988144aba88 100644
--- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
+++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
@@ -200,11 +200,15 @@ static int aspeed_lpc_enable_snoop(struct
aspeed_lpc_snoop *lpc_snoop,
  lpc_snoop->chan[channel].miscdev.minor =3D MISC_DYNAMIC_MINOR;
  lpc_snoop->chan[channel].miscdev.name =3D
  devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME, channel);
+ if (!lpc_snoop->chan[channel].miscdev.name) {
+ rc =3D -ENOMEM;
+ goto free_fifo;
+ }
  lpc_snoop->chan[channel].miscdev.fops =3D &snoop_fops;
  lpc_snoop->chan[channel].miscdev.parent =3D dev;
  rc =3D misc_register(&lpc_snoop->chan[channel].miscdev);
  if (rc)
- return rc;
+ goto free_name;

  /* Enable LPC snoop channel at requested port */
  switch (channel) {
@@ -221,7 +225,8 @@ static int aspeed_lpc_enable_snoop(struct
aspeed_lpc_snoop *lpc_snoop,
  hicrb_en =3D HICRB_ENSNP1D;
  break;
  default:
- return -EINVAL;
+ rc =3D -EINVAL;
+ goto free_misc;
  }

  regmap_update_bits(lpc_snoop->regmap, HICR5, hicr5_en, hicr5_en);
@@ -232,6 +237,14 @@ static int aspeed_lpc_enable_snoop(struct
aspeed_lpc_snoop *lpc_snoop,
  hicrb_en, hicrb_en);

  return rc;
+
+free_misc:
+ misc_deregister(&lpc_snoop->chan[channel].miscdev);
+free_name:
+ kfree(lpc_snoop->chan[channel].miscdev.name);
+free_fifo:
+ kfifo_free(&lpc_snoop->chan[channel].fifo);
+ return rc;
 }
```

I have a couple of questions regarding the cleanup order:

1. Do we need to call misc_deregister() in this case, considering that
the registration happens before return -EINVAL?
2. If misc_deregister() is required, is there a specific order we
should follow when calling misc_deregister() and
kfree(lpc_snoop->chan[channel].miscdev.name);?

-Chenyuan

On Wed, Feb 12, 2025 at 7:39=E2=80=AFPM Andrew Jeffery
<andrew@codeconstruct.com.au> wrote:
>
> On Wed, 2025-02-12 at 19:37 -0600, Chenyuan Yang wrote:
> > Hi Andrew,
> >
> > Thanks for your prompt reply!
> >
> > On Wed, Feb 12, 2025 at 6:21=E2=80=AFPM Andrew Jeffery
> > <andrew@codeconstruct.com.au> wrote:
> > >
> > > Hi Chenyuan,
> > >
> > > On Wed, 2025-02-12 at 15:25 -0600, Chenyuan Yang wrote:
> > > > lpc_snoop->chan[channel].miscdev.name could be NULL, thus,
> > > > a pointer check is added to prevent potential NULL pointer
> > > > dereference.
> > > > This is similar to the fix in commit 3027e7b15b02
> > > > ("ice: FiI am cx some null pointer dereference issues in ice_ptp.c"=
).
> > > >
> > > > This issue is found by our static analysis tool.
> > > >
> > > > Signed-off-by: Chenyuan Yang <chenyuan0y@gmail.com>
> > > > ---
> > > >  drivers/soc/aspeed/aspeed-lpc-snoop.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > > > b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > > > index 9ab5ba9cf1d6..376b3a910797 100644
> > > > --- a/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > > > +++ b/drivers/soc/aspeed/aspeed-lpc-snoop.c
> > > > @@ -200,6 +200,8 @@ static int aspeed_lpc_enable_snoop(struct
> > > > aspeed_lpc_snoop *lpc_snoop,
> > > >         lpc_snoop->chan[channel].miscdev.minor =3D MISC_DYNAMIC_MIN=
OR;
> > > >         lpc_snoop->chan[channel].miscdev.name =3D
> > > >                 devm_kasprintf(dev, GFP_KERNEL, "%s%d", DEVICE_NAME=
,
> > > > channel);
> > > > +       if (!lpc_snoop->chan[channel].miscdev.name)
> > > > +               return -ENOMEM;
> > >
> > > This introduces yet another place where the driver leaks resources in
> > > an error path (in this case, the channel kfifo). The misc device also
> > > gets leaked later on. It would be nice to address those first so that
> > > handling this error can take the appropriate cleanup path.
> > >
> > > Andrew
> >
> > It seems that the `aspeed_lpc_enable_snoop()` function originally does
> > not have a cleanup path. For example, if `misc_register` fails, the
> > function directly returns rc without performing any cleanup.
> > Similarly, when the `channel` has its default value, the function
> > simply returns -EINVAL.
> >
> > Given this, I am wondering whether it would be a good idea to
> > introduce a cleanup path. If so, should we ensure cleanup for all
> > possible exit points?
>
> Yes please!
>
> Thanks,
>
> Andrew
>

