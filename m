Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A0ACC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 12:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3MtQ5idC4oHoXTcpqKWeJSzAGrhCwaVTOUqmUG9xiY=; b=SdsNTWbzAxAl0oKya9CzH7XS8r
	hmPVolZiAI2S1gPU6qybhqDKMQOae7KG0CdJXqoum7aiMgJY6qO5HwxICOr0vXeNQgO8QSf6V/n4b
	jSBQtdXYgLyyibVBQ1MQUpSpoPu5GQm0qjUw4Bk+VEQpjCPqeF6SI61j5GHdBc95jUNZWWVvpMPZ/
	xHL95ErgAVDpWuafPOthaMckrCEeK6qi+hk4wE6YbH0UZfGrXSAwQMhDgYAJAftLjM+GfOUbWo2Q6
	Zw86rqgLzstwf9gxPX6AJ0QgtizAyJjluN1pjQoZHlyEBTM1iqsXqqM10D4oSIKd7sXpV4ALTijKz
	GQS0Em/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thT3Z-0000000HQdp-2y7W;
	Mon, 10 Feb 2025 12:38:33 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thT2B-0000000HQNI-1lxy;
	Mon, 10 Feb 2025 12:37:08 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-434f398a171so3928975e9.2;
        Mon, 10 Feb 2025 04:37:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739191025; x=1739795825; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=K3MtQ5idC4oHoXTcpqKWeJSzAGrhCwaVTOUqmUG9xiY=;
        b=VtoVS4cO7naNzv5ghM2dlDD0Uv4a8qWduD+IFRfu3RlvhZIi6en3dtPJT0CYczwCjI
         86xKbbRcTz9FW8rvhsoLwgC4RKo4xLaq0rgUeJMCj41MDX6sXHYfANzCOjjVJg3QbeFb
         KWxu7BohGSz/hWiSXeA9Nxe1f1/nBqj32X/XbgoJBuI5GPXAZlXPd4qjP8PfgAGZpKLd
         BYoazhCoWJrZ5DIkJhHTFz2CuM5aIryyyFULb96SVE/J82ZFHmuQuDo+a1n8xo4DJ/Aj
         gLfbv2Azf2+f/jglb95hSHJtPcPuObe+rkJ0ZV/X6Vak9E9x5qeSwCf6VcD8iL7WHPLX
         M4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739191025; x=1739795825;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3MtQ5idC4oHoXTcpqKWeJSzAGrhCwaVTOUqmUG9xiY=;
        b=M4Lf2mnswvROFMR75nzOKZAqv/OBVu+9jbQwGEG4DP6g0xcEw/WC+UPlMSPGyYvgyh
         VsXLz0DLp3thGWcVijYrH3ePTp3EDujasWoZIK3Ix8LF+djRl52Bz/ixSA44FMn0idzA
         UyDdnCAfKIAxp6cUv3vUoA+0HrGGrtqHYa8zKjQ2WOBqRqfAAS2CBqB8cxGT9JM58Ga9
         p0VQ/Sfp0Dan9HCJC+e8BXwueNmNyzm8o7zNOv8/OmBBsoeqa/szKmfVa4Q/BQTur6xS
         liZrzZD/I/3uwTeO/4HZ/X43jGJjS2uPFcPWnFpjVsJCdsHlVFsJ59ksnedazZR13lXp
         xM9w==
X-Forwarded-Encrypted: i=1; AJvYcCW5lcNtHcWoct9SAmISdxmsvTodn34Qh05sWN9ENAyWWUeJ14ZEDCSHLPFiXcGiTflDlZxy/ZMD0pLgApRCtgQ=@lists.infradead.org, AJvYcCXuOMKucdDm+AU2B1/sMsVIp60sX49te3rE5IyW9mPvyo3p0c+K5axTdvCwcmlO0nEQhFIKwgQevqHnQyL3HhDA@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa4xDYXGFuHKf83hPGI8JPEGVz4cVof4qG1ghzwPa2CjTuoKS9
	SdOyRns8DItSwWlpz9a6SdjnpYY4A4oGfhqxhqivnjCj8QJbTHPG
X-Gm-Gg: ASbGnctVOAYu1YulYd+jn7QblBHz+ZGRJgJ27R7R7PiN8zE7gvdS8jd9csc0IwUMtew
	LXq/FfCSvA8nW4Wi5s0iE2Asz22N7bMfcwoY5W/qHIsKY+EaepY8g438uu1z+BzQJc/avRNr7rE
	AxRJBOBs7aS5BGo8LUpX6M6BeVZcvGrP0lOlzPAX/hH1a34n0a/MBI5CYcAf7uyrNvpXUef6l4T
	4d2EN0f7R3AMo3WvCXW3f6+KsnHyMkz2pREjk288/AuLvFVSZmWBFI20mRCqtm+4Y5c2EEZX0Fo
	ETk=
X-Google-Smtp-Source: AGHT+IFp/qrMqpF0QewcGTK19D8rZ6WhmzABzEYZiO2aWnKT/+1DEN2GE0Y0xC2bvfjR6EFR1vJt5w==
X-Received: by 2002:a05:600c:3b24:b0:434:a0fd:95d0 with SMTP id 5b1f17b1804b1-439249af823mr44302995e9.4.1739191025313;
        Mon, 10 Feb 2025 04:37:05 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dd34f2af5sm7073731f8f.78.2025.02.10.04.37.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:37:04 -0800 (PST)
Date: Mon, 10 Feb 2025 14:37:01 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"Chester A. Unal" <chester.a.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Sean Wang <sean.wang@mediatek.com>,
	Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v2 2/3] net: dsa: allow use of phylink managed
 EEE support
Message-ID: <20250210123701.7gdt56l5m6t5c6ge@skbuf>
References: <Z6YF4o0ED0KLqYS9@shell.armlinux.org.uk>
 <E1tgO70-003ilF-1x@rmk-PC.armlinux.org.uk>
 <20250207151959.jab2c36oejmdhf3k@skbuf>
 <Z6Yn2jTVmbEmhPf9@shell.armlinux.org.uk>
 <20250207213823.2uofelxulqxpdtka@skbuf>
 <Z6aIGzHWdzF5Rlci@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z6aIGzHWdzF5Rlci@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_043707_460717_C40AE3AA 
X-CRM114-Status: GOOD (  16.27  )
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

On Fri, Feb 07, 2025 at 10:24:27PM +0000, Russell King (Oracle) wrote:
> You may have noticed that I'm no longer putting as much effort into
> cover messages - and this is precisely why. I honestly don't see
> that there's any point in spending much time on cover messages anymore.

I have things to do and places to be, and I'm sure you do too, so
I won't drag this out more than I need to. I'll just give you one
self-contained example of what bothers me, from this very thread.
I'm not even expecting you to change all of a sudden, I know it's hard
and takes time and a deeper understanding of what is happening.

First of all, if "I tend not to read cover messages" isn't sarcastic
when you've make it pretty obvious so many times that this is important
to you, then I don't know what sarcasm is. So, your message starts off
from the very beginning by not acknowledging the way in which your
reaction is perceived.

Then, your message goes off to justify your reaction by essentially
reiterating what you've publicly said elsewhere about not being noticed,
making things sew with no Singer sewing machines required, and what not.
Apart from the fact that you seem to build certain expectations of others'
reactions in your mind and behave bizarrely when they react differently
to how you expect (or not at all), my personal problem is that you've
responded to a complaint which was really hard for me to verbalize by
talking about you, again. Everything I've said in the previous email,
about you expecting more respect and attention than you are willing to
give, still stands.

You are an important and valued member of the community, but you don't
have to be so hard on people when they don't rise to your expectations.
Your inflexibility makes it difficult at least for me to find a place
around you.

