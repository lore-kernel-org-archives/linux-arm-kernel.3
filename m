Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5786DC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 14:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mews4wqirLVd+SJ74CQGKx7psfw9QW6POpNvpoLYPU=; b=2X5iSqncQUqqTJfNCMwhAiJqyj
	r2YWJyLrKHYpKhWmg2xZCNPbJJaOioE5YIWosax7B57QEUxa6gXs5nV7HRu42pCuYqw/SgD2FrHJD
	2Fe5I4Hgb6+gQfITshgluacPdSq3zSQJkaNv+TpgWO6vM/KqsC+9y6XmGEnxuAwIADzohz/85HhB8
	2JTR8tYcI7Z1mXZ/XN+3qedFsoNDAn0SDH64bCGwHUyKDEheWkYFmSKiEZEa31wvkcsU7+1dWx9yy
	CbLmq9M3RZ7eLbX7OeKWku2cErR4BFq9TTk4xlDiwhg/mMnOHofAxaOT0SF7JDmRBq1blJGl1sRKn
	wR2HrSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to1WP-0000000BIP7-3R8R;
	Fri, 28 Feb 2025 14:39:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to1B0-0000000BDtC-2twj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 14:17:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2087661F60
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 14:17:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDFDC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 14:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740752237;
	bh=+mews4wqirLVd+SJ74CQGKx7psfw9QW6POpNvpoLYPU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UW2yj7OLDI5zuEJjYp9kTPkjpNgQ5I+5MZ0ngBbIdzWUT7pqtBF/VMUzWoOBRRxEV
	 l+ZuND44lv/fYfOZSZRdQWPfWdCcatWzjFS1YP17PrO3em6I3ASyQw0V7noEb/HxlW
	 InWuj0scBFOSBOpfIDLEEGEaAYDpBNiUEKjBtcVAplnG1SBZPFrsu3ogya5jJXEYBq
	 Tdhe757RdCnSrQBEfNFSymmt722b0CN0nyXuHQqFJfu+4pLQUHnwZTrJhWpw7+7WV4
	 k45eB0y985+vt5zBOzh1TwBi4Bj7PXS488BKzyxpZzQoJW1exvzdiJmyvqnda4R1rl
	 hw9hLPGt6KJTQ==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-abbdf897503so579557466b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Feb 2025 06:17:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWA6V9oVLECOQHTfSTWZFNFWv5+i32BXA0c6YJySFgF7yoT8v+SCwh6bfq++uqJ2KIwdtBr/ATfvYEQ9gkXCPmq@lists.infradead.org
X-Gm-Message-State: AOJu0YxTN5dU2JZfI8CQaze5nQeYS110hL7BrzBwy5N/dMQjdh47JRdt
	jzuO9fAhjOal7KcWThMUD5z83XdhMRaK5GXV6Jiy9wUprX2DAMtI8Dmu960iqivORqxru6OqYr1
	ASIGAsKAP8rBUtM9yzmpw/loYEQ==
X-Google-Smtp-Source: AGHT+IHjthQkObX46y0x27qvzkeyln9C3sLlHRHU7eP7TpYLalIfwcDLQqE0mQgUy4ECwFqBSo9/JmpROBFMKVh/A3s=
X-Received: by 2002:a17:907:6e92:b0:ab7:b7b5:2a0c with SMTP id
 a640c23a62f3a-abf2620774dmr419749466b.6.1740752236146; Fri, 28 Feb 2025
 06:17:16 -0800 (PST)
MIME-Version: 1.0
References: <20250226094456.2351571-1-peng.fan@oss.nxp.com>
 <20250226160945.GA2505223-robh@kernel.org> <20250227030924.GB11411@nxa18884-linux>
 <CAL_JsqJOqKeDRuASWxCT=EA5LJbONpCX=Re8=XxKUbPToWy2Dg@mail.gmail.com> <Z8HCZQQLofaiGtpG@bogus>
In-Reply-To: <Z8HCZQQLofaiGtpG@bogus>
From: Rob Herring <robh@kernel.org>
Date: Fri, 28 Feb 2025 08:17:03 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLePri5m_dE989poUV4auasAxFvgAiYuXVuZHqLcOBGMg@mail.gmail.com>
X-Gm-Features: AQ5f1JqWAly9mibB4Wnu0iSmsxkTmC_yUXZnPBFIrDHBvIgsef3vgrKT7bmbhac
Message-ID: <CAL_JsqLePri5m_dE989poUV4auasAxFvgAiYuXVuZHqLcOBGMg@mail.gmail.com>
Subject: Re: [RFC] dt-bindings: firmware: scmi: Introduce compatible string
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, saravanak@google.com, cristian.marussi@arm.com, 
	krzk+dt@kernel.org, conor+dt@kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Feb 28, 2025 at 8:04=E2=80=AFAM Sudeep Holla <sudeep.holla@arm.com>=
 wrote:
>
> On Fri, Feb 28, 2025 at 07:34:09AM -0600, Rob Herring wrote:
> >
> > - The parent driver creates child devices. The child devices can
> > either reuse the parent DT node (i.e. set dev.of_node) or just get it
> > from the parent device if needed.
> >
>
> This is exactly what I was thinking to deal with the issue since this
> discussion started. I will give this a go. I believe this must solve
> the issue, but I didn't want to spit it out loud until I tried to hack
> and check.

The issue with fw_devlink is that it only checks the dependency of the
parent which won't be enough. When the parent's probe creates the
child device, that doesn't mean the child has probed. The child driver
might not be loaded and/or probe is async. I don't think there's
anyway for the parent probe to wait for child drivers to be probed and
ready. I think there's similar issues with the DWC3 wrapper and core
driver split.

Rob

