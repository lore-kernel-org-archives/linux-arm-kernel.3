Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C53BED2FEC6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 17:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syfA3BkKAIe5vn02Wihs7fQFdQwNkyJZbjNriJ6lerQ=; b=ACNPw1IEZGKbzlbfjh0QygoZCS
	Z4j3abMNT56Be8fnjpYtkzC1JcDAt8AV0hFqanmsIDB5grbjblmVmSNYniJ0lUr/iSv6dVaPiueR1
	fT8cfDyfLU29nvt5l5uV+pf5SO88CP1/R5eO7xZlL5ogv4QNEnEE2b3liJt0KnDQUi+0sJpXUZN9T
	WsSw+LhMGYn4xinsc5L/1aPhyNQcXVufX7mtyIV8y9SJcA6rKDH1M4IYx+ruqiQW2CkfH6bsz0519
	KfAK/foCvCEazCCcwyU8d4t+oTo3utljxRd73jk9MHKRL13QCZWfwFSCFm3GI60JPBqVpLf32cgX/
	dzjwlP8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkn2Y-0000000EkKC-434d;
	Tue, 27 Jan 2026 17:39:46 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkn2U-0000000EkJV-3Zbt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 17:39:45 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-4327790c4e9so3887033f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 09:39:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769535581; x=1770140381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=syfA3BkKAIe5vn02Wihs7fQFdQwNkyJZbjNriJ6lerQ=;
        b=I9C2iMDoD5cS+bUcJcqu03/te2JNE/nXjpEdBtI4RlgWJ2lag+xKk4TiOv94m5c7Hf
         5UZsaTQ4YlvxLPPn2EsVGOxUo/xgva7ALbM6ao/YuGT9tj5NX8goe21WYjF4O5MCQBi4
         bJ3s1X8ltgEPsJUCeQlEX2e7IbyCsYwEdo8aejecCuAI1t4SqcmPVYIybGBUJzKbPpX2
         H2SYRohJaP1FhvFfxZWMM9KkLguPX8s9qd7sexrQc+Y2Dxa1zz9vD4YMpWanhGowLFx0
         ac6yVaVM3AfRrmG2D8xXz1It9QWVuuCA7p8iesAY7FBpcdUYV4WTYzaFyOcz20ec8C+a
         KEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769535581; x=1770140381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=syfA3BkKAIe5vn02Wihs7fQFdQwNkyJZbjNriJ6lerQ=;
        b=J3UTuPJwtHUJ4RSmKZp+JyY21RCzUto4V2mXFEeb4TSys1JtN0qgGRB3qvn4g8XNWa
         uS8C/ymUt2SmOIMYKSZb7Bl9vVvQrme2Ux6qNxSk+1I4kkiO+9OagmkuiEt8AJDrbqI7
         EACucQjhYWgQ5nwcBU1gAwEvd3aDdkHE0iPCUkHewvZ0KWcN0K2U6pnSBQAl18YawXzm
         tNUqx5XhSfyFa8C0btVBeYbozXnHg3NDj9m3AyblVuKaur302tRsRbzG212Y76vp4ait
         PwgBpQEi81alpQtvxcukyQXAM26LxXbVW5sImtE12vvJ8LPzs3szwEHt9QbT0Q29P00D
         5sfw==
X-Forwarded-Encrypted: i=1; AJvYcCUZ5+6M1Rl7zIhNtLdZWdBSqno66tPMN7RdftPmF14ZIAODOImNF3XRrMDw7kNyHPu1K9rrLnBw9NJNZ/KxXlYg@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+/A17NGXQMCCpnOwE3GqbSypnltVpyRwRbUZZ41TwTsnoafLH
	YDbmwm5Gba5IyfebO//utbYroEadsbxcwd8OXSgciEj3LnXahVWTyBH3
X-Gm-Gg: AZuq6aL0M+ouVIF8yxzOAE6Rbg0pWwadpVPIZTM6Zw/wuu76bYQJStbx5Hb4In3kY8E
	fJAsCzbxkfndFDcN6vZDwYLr4c72Q3BG5IEkmTt9v7FWthKQfv5QQ9/LG4O0KIuHTku6GcP+mom
	ogOBOtpw+6eQ4gSVu4YIpcqsWei7iks384J688xEIZ2EhHoBo1b96xnZWt1pJNSPlhwOr/UWdx5
	SzCCrvzreYKZfIcnr91wW+SDBhIVkPFF3m3eVEgBbYJe2Xzu3YTpGP1uwi/Wa5f2nMPyYhQgL/+
	Nol4t0MRZ0/jhR6cW+/JMxtOGia80MM9AWrHr2qSebPr6rJj/IYPEE/YbhtCtM1RL4zMK1MWPoU
	lQk0wbNC+lbc6rHdiPdoa6QCnO/3LKWSjqShj9RYoN/cs//7n3M9w0RSCp5hQf4Wq8mqVhlNpVS
	EFwtN65y34BC/sIGaolYm3q4In+S3+XwJ4+6MpaRWBlJOALQYjoxlj
X-Received: by 2002:a5d:5f88:0:b0:435:a647:a3c3 with SMTP id ffacd0b85a97d-435dd073c0fmr3746612f8f.23.1769535580531;
        Tue, 27 Jan 2026 09:39:40 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e132356dsm335609f8f.33.2026.01.27.09.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 09:39:40 -0800 (PST)
Date: Tue, 27 Jan 2026 17:39:38 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, Cristian Ciocaltea
 <cristian.ciocaltea@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sandy Huang <hjc@rock-chips.com>, Heiko
 =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>, Andy Yan
 <andy.yan@rock-chips.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>, Robert Mader <robert.mader@collabora.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, "=?UTF-8?B?TsOtY29sYXM=?= F. R. A.
 Prado" <nfraprado@collabora.com>, Diederik de Haas
 <diederik@cknow-tech.com>
Subject: Re: [PATCH v5 1/4] uapi: Provide DIV_ROUND_CLOSEST()
Message-ID: <20260127173938.314d922c@pumpkin>
In-Reply-To: <aXjNyHaJDHoCPRJO@smile.fi.intel.com>
References: <20260127-rk3588-bgcolor-v5-0-b25aa8613211@collabora.com>
	<20260127-rk3588-bgcolor-v5-1-b25aa8613211@collabora.com>
	<baf075b2370a13cddd597a3d421b5f39290d87a4@intel.com>
	<aXjNyHaJDHoCPRJO@smile.fi.intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_093944_531044_F0AE0370 
X-CRM114-Status: GOOD (  24.93  )
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

On Tue, 27 Jan 2026 16:38:00 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Tue, Jan 27, 2026 at 03:58:13PM +0200, Jani Nikula wrote:
> > On Tue, 27 Jan 2026, Cristian Ciocaltea <cristian.ciocaltea@collabora.com> wrote:  
> > > Currently DIV_ROUND_CLOSEST() is only available for the kernel via
> > > include/linux/math.h.
> > >
> > > Expose it to userland as well by adding __KERNEL_DIV_ROUND_CLOSEST() as
> > > a common definition in uapi.
> > >
> > > Additionally, ensure it allows building ISO C applications by switching
> > > from the 'typeof' GNU extension to the ISO-friendly __typeof__.  
> > 
> > I am not convinced that it's a good idea to make the implementation of
> > kernel DIV_ROUND_CLOSEST() part of the kernel UAPI, which is what this
> > change effectively does.
> > 
> > I'd at least like to get an ack from Andy Shevchenko first (Cc'd).  
> 
> Thanks for Cc'ing me!
> 
> So, the history of the DIV_ROUND_UP() to appear in UAPI is a response to
> the ethtool change that missed the fact that this was a kernel internal macro.
> Giving a precedent there is no technical issues to add DIV_ROUND_CLOSEST()
> to UAPI as proposed. Main question here is: Does DRM headers in question
> (that are going to use it) really need this?

My 2c...

And is it actually going to 'clean compile' in userspace?
The tests for x < 0 are very likely to generate warnings when x
is unsigned.
It is hard to avoid those in the kernel build, never mind some 'random'
userspace build.

I'd have thought that the only reason for any of the kernel defines 'leaking'
into the uapi headers is that they are used in other uapi headers for
constants that programs need to use.

It isn't as though it isn't hard to write something that will 'do the job'
and in a place where the definition will be found while reading the sources.
Even just 'hiding' the definitions the kernel itself uses in the uapi
headers doesn't really help anyone.

	David




