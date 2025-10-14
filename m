Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A4CCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 22:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ZtqCDOZscLqB8RaEJpnchm/C2TI80sLGGpkj07xncY=; b=BjOvmNcbtAQ0rwHvXR8Wv7mHMx
	QOHxQuF6b7YN40Be2a8POjr9IZRcO1RrPUuZaozoQRP04ICnnlL1ltfsibQ7UGgzVyBp6AwSsM8Be
	byqF4cZmlJ+JUubWR/3mtH6hSBVwLnjOnDQeZQ0rmiBOL+LvJvcQTqibHe5VlsAgO5RZyjVs5wMJY
	uW3dGQrJZ/GUAiatU2xEzt198rmmeOli8N/0gRjbksNDJCbKHvPjvLkSimPaKwSLeChUWMXi2jQ7j
	j6Yo1U/2xfADYBqwVW76215tehlaLpzqVTcaadHoOlN/F6NuK1zkPAHvUOGe6wB5dVDWCT598xzk0
	JZ+NkCOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ngC-0000000HYvR-2dXg;
	Tue, 14 Oct 2025 22:39:40 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ngA-0000000HYv7-2L0H
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 22:39:39 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7841da939deso5285487b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 15:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760481578; x=1761086378; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3ZtqCDOZscLqB8RaEJpnchm/C2TI80sLGGpkj07xncY=;
        b=RMj/LnCOl4mI+KbQheDWnurryuNXixS75MkRevK0+YZNbvjkgiBB4N8AqeWz53xc3+
         GLHRVLwvhb/akiiudXy9/BvsaX1Oio/cNyjcbHoC5L5ByRasfxnmp+ildoupEBmxNng2
         431NbroVVJYUyZ4v9bCA1wFfUtA8vB5V6bZj6qMMwgwLG2XqQqlhnd7Ua5y3CZcCcafe
         aW1A73pLKQdieJaBU3TbxALZMsRQ1ITfqEifNtH+KK+tD5cebx50VTRhgN25ae5HjrgQ
         37ekjDYXhrKinq8RnoC6nLEPoau/+hQ8l3mQT5mQju7rZfTH84fgrHdIJdCA+tPXtHDr
         REgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760481578; x=1761086378;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ZtqCDOZscLqB8RaEJpnchm/C2TI80sLGGpkj07xncY=;
        b=R7Saro/75oo+uUvIaCfrk0cx9Be3LPBbMEwRpF+NgPMCE7XTmtvEfl2RlYVjEaJ5A8
         7DHk+hoT5RBgzt8a9W12y3XY92Hmrs2rODLPRYpDxcVruNbZYzZSMrxyHIwNCdvDifcO
         ZZpgsEEWzdevN5pM9Z1RFV8ga89GG6ZvFDEWI9ZuhFtWQeGW/F9cOlLGqcsQfGE/RTlW
         gGc7DJ+4quNaLlAW0z3hoefQrEh/O5GTJbtmczrrlRWK+YeuMrbPEah3/fDUYmUwUyzW
         o1MkYYMjIe1tI1fNb64dt7qkHByZsx0F6urvAeE6al9BNvRXq7n20PB2a5/kZKiwBv/B
         KwPg==
X-Forwarded-Encrypted: i=1; AJvYcCWSwAU/82NMURYgphXv/52kg5LoSTrgFUJX73uBIBcRWdVpS7TlFdZ/QfhTHo5TXPhXW860viLiNwU2/C/3elSe@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkj0x3+xaVs+QPlhcWE9QjdtHrLQL8BnJ0DeePiLUqNVK2Dy0e
	/47ty0P6gfqaRT8syMnzdtd/RwWD3QpLPZ3ceo1v1WNaC+bsqVgERtMf
X-Gm-Gg: ASbGncuJHiEFzrWN3WzDE5kXXq02+JhPuF3q82T66KWW86neUqpQYTEjVLhwKn5tbcj
	O7lj9xuYm+URWWQFZGqNVaMK3xduD+/Av5aIdYvkQxdn2oxhG8/5EQPkPgY4p5mOGOnTwilnVw8
	OihKGeMvlXOiZUGAhEyHDcDu5z0SJEY6NS1Sl1h3Fzyxgmhc9AKaKLN613xxwDFQsyT4iWQjqP+
	Fb7q6qpNry/WoKlYM60nwsFvGsDWDdaJAwhULC+JJ480YAifQhf0ja9yASF5jn4O1duYfzxAI2u
	bswyZjFdifmUOcdK3aFvfNCgpDdtKgB+mj+eyfJ4fcqWBs7UQIbveGWtIotv5tKlnk4U/yh3fmv
	k9eR1/+yi5zeFqvuuBbA6ECceFJx9DTh/RopzBD0+eg==
X-Google-Smtp-Source: AGHT+IEi+B24saT9H9rxfelGvAFHN/l9cEixm6BxrzttyGvKpYxkywr6o9MKjbLEkqIAa3+5HpvU8A==
X-Received: by 2002:a05:6a20:3955:b0:2bb:b5b0:b3a with SMTP id adf61e73a8af0-32da7e7bd47mr32647446637.0.1760481577555;
        Tue, 14 Oct 2025 15:39:37 -0700 (PDT)
Received: from localhost.localdomain ([2620:10d:c090:600::1:891f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060b59sm16672205b3a.2.2025.10.14.15.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 15:39:36 -0700 (PDT)
Date: Tue, 14 Oct 2025 15:39:34 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v4 11/13] ARM: dts: aspeed: facebook-fuji: Include
 facebook-fuji-data64.dts
Message-ID: <aO7RJs8ceO3mwjn4@localhost.localdomain>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
 <20250728055618.61616-12-rentao.bupt@gmail.com>
 <79ddc7b9-ef26-4959-9a16-aa4e006eb145@roeck-us.net>
 <aO2kLyxGlGt12sKD@fedora>
 <ea64d3c1-e517-4bd8-9a2e-56432f286347@lunn.ch>
 <4e099ead-e6df-4489-a775-1730bc852dcf@roeck-us.net>
 <f801a4cb-3d27-439c-82f2-d5ee5aa0d810@lunn.ch>
 <7197bfc7-fef6-40b2-b3f3-182e9428dc12@roeck-us.net>
 <33b9d6d4-bb2f-47e6-8d3d-94a2ca2b8474@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33b9d6d4-bb2f-47e6-8d3d-94a2ca2b8474@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_153938_611623_CDB38EE5 
X-CRM114-Status: GOOD (  34.46  )
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

On Tue, Oct 14, 2025 at 09:14:21PM +0200, Andrew Lunn wrote:
> On Tue, Oct 14, 2025 at 09:39:02AM -0700, Guenter Roeck wrote:
> > On 10/14/25 08:11, Andrew Lunn wrote:
> > > > > If it is already in mainline, i don't care too much if it is wrong. We
> > > > > don't want to cause regressions.
> > > > > 
> > > > > I only object when adding new nodes which are wrong. If we keep adding
> > > > > broken nodes, there is no incentive to fix the broken driver to do the
> > > > 
> > > > This wasn't adding an allegedly (sorry, it worked for me) broken node,
> > > > it was removing one that worked for me all along. Obviously I do not know
> > > > if it worked (or if it is even used) on real hardware, but it worked for
> > > > the fuji-bmc qemu emulation.
> > > 
> > > It probably does work on real hardware, because it is one of those
> > > "two wrongs makes a right" cases. So i see this as a regression. The
> > > node should not be removed. It should hopefully get corrected sometime
> > > in the future when somebody actually fixes the aspeed driver, and
> > > fixes both wrongs.
> > 
> > So you are trying to force the issue by disabling the Ethernet interface
> > on fuji-bmc until the problem in the driver (whatever it is) has been fixed ?
> > That just seems odd.
> 
> No, i see this as a regression, it probably used to work, so it should
> still work.
> 
> I'm just pushing back on adding new nodes which are broken. If it is a
> new node, it should not cause a regression.
> 
> 	Andrew

The fuji-data64.dts was copied from fuji.dts mainly for larger
persistent data partition (64MB), and the latest fuji.dts includes
fuji-data64.dts (instead of vice versa) because we wish to deprecate
fuji.dts in the long term.

So it is a regression for fuji, but fuji-data64.dts is a new node..

My original plan is to add mac3 back to fuji-data64.dts (which will fix
fuji.dts) when the rgmii fix is ready in aspeed mac driver, but I can
add it back now if we need to fix the fuji regression asap. Please
suggest.

BTW, the current mac3 settings work in real fuji hardware because rgmii
delay is configured in u-boot.


Thanks,

Tao

