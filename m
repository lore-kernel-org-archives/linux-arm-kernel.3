Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512E6E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 20:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IS4Wxdv2z85JzVf37y1D36qgWJoPNxZK2y7SNaI2jos=; b=lsEoZbxZj1dsXNyglMvsX3XlwT
	k0FC1NbuQnAP5DrAmuAMpifE9dP5VathXWEzlI4GZhRYUEbD1vwsQ6Bo4KnNYV8RmE/W9FIO18hOj
	R3pZuoFyWZmgM4nsn2Vv8GFb6Dbf/r4oJKcFNf6iKkCxoCiI9XBKdoXFVxfbanf47N6V31BtOjuZ7
	Mf9QwSBZgY0rjvuTFEvZ3FXK53NrDQPID8BHW4k8sZ0JUu0Zjnc8yXYrk0zdag2WGaooHY59WQZzk
	/+5WO70llzTIKs+LIvfY1pa8mzf01Un+nrRoMJSGnt3/mQa5FJC4EJiR4qkuZufp/nfrMMJ4RvH07
	JfFyAmiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnbI-00000009gSk-2vPc;
	Tue, 14 Jan 2025 20:33:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnZx-00000009gAE-0Sxr
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 20:32:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=IS4Wxdv2z85JzVf37y1D36qgWJoPNxZK2y7SNaI2jos=; b=BIDsNoqPvIIpk2Uwe253MOJpdo
	vZY4Ham2wrfTLn1JZWjHVM2Yzt9nGbzhn6S1frzmvwPHXhBVHExSMqLkq2t1AGridEavVki0OAw3Q
	bQIOf5C0reXwoYP1Kcu5wVK+CoJMDBb8uRwM5j8ZBEuFu5IruW2nR8LlNNqm8wNAqQZkon1eR/9hv
	v6bIRYeAsYu6GQ2UxBZy2nsHZbE9iLL5Wkf2McgXi6nJj3Q4fAnQBHqvMhClQM4ZMLBbxJJwfS29l
	UHaMSDUPJMhlJi5jxAFdHkJkKC5PLOjCitMTnFAkLTA81+eCudvE9vfNCw00rBLcqTB+cqjozstpK
	zVSkSf6w==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXnWs-0000000Abxq-1l1a
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 20:31:59 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43620a5f81bso6455885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 12:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736886525; x=1737491325; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IS4Wxdv2z85JzVf37y1D36qgWJoPNxZK2y7SNaI2jos=;
        b=cuDYmMNMuiPngmK6NNJ78WsnznLTd04/crTU7d0bAtmgwZMiABcpOdBx1C/Oukayx8
         GFgOU2hdUs/HGa//bVYVyx8ONcAUsXVqlce+pGLVGc9sSVuqwwA80BWOeLbyAdtN6tNF
         n+Bos0Npll8pFAOvgjm8d43VpaoZ9jIjr1jp2GhBhlVfWCtQjquK1nhZGAPwaKAb+lVI
         x4lEGPVG2hS1bCQBF5AzHG5AwRwCjEh1xvB6aERt1c5JsXIWzd35ms726Q3uzhNIZB/U
         e0wrUy9kKcmfQ/h5feWA1N1jKPHko9Vvhk5/Rzzq/jWZFAhJklyTx6+lKF8p6MhZm9fC
         lZxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736886525; x=1737491325;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IS4Wxdv2z85JzVf37y1D36qgWJoPNxZK2y7SNaI2jos=;
        b=v9n02RYxVeyf5zb/zSrBTmlxKziHt+ihyxgQ8hBd4eVbhYac7Pvj9cu1WibrPejjUp
         ODdZuhyMAILenhnA55TmDuq3gjlJkZ3XAYc8TQDLkX0ym5Drz0PjVQHhiWi3HZn8kn11
         f03X6Ta31UAVdxgb/nMaxCCCspOU2/p7fr9EsbhzE6UnqHC5emKthBCvJL/36s1QgzF2
         3Zp9iuRhbvYeMvdL/kGk3BJm0MLD5vrFDM9qSQ2MEtmhTFDmRzkBEP2t5NM2nA8GPTv3
         W+W+vTa/bqL5pYhqGu77lyg/7L9BxZaH31k25QI4CnSnOi+ZOvrk56Yvhu96pgls2iOA
         sC/w==
X-Forwarded-Encrypted: i=1; AJvYcCUKXMd3LvNRGr6qHJ0qhMD9dnve8HyefiD+Qa50+odzlTmHsP8MLUzThQfDibRNXxqfuKOdZjUUXtftzHBoEjX6@lists.infradead.org
X-Gm-Message-State: AOJu0YzgXiHNIIhNO7OSjIzuI7gvPjy2bYAVI20x5CiKxRaoS56alEg8
	PEMswb3K+d7o6sFoCOT62C7pdL0qkTBzU+Gz6hgaIbTG12qMbOfF
X-Gm-Gg: ASbGncu4eD9NNBKA2/R7Sf4Q0wvMSdmyG4KFd5gKn6Pi1ld9Yg0WnCIntnLiMsgbgWu
	Km1rt6cbcfDKt/ElzjOxpv9mHtq+YmzN+foM7gITJVzaB6jA2yvcBzZAS8cEBNX3qzyvqMi/gbq
	YqTOMz8v1iVE4aF5FdO2huE0n3FVcUvIsoV/G9bzYe2wT7DpyP/Sw+gRvZBoSII8waAPqcO28l2
	1XuzHmjpOGfEtgi7gD7ElLYY31eX5ORahdj01mNjUVG
X-Google-Smtp-Source: AGHT+IEU33fIHNbn/okRr8JUsVv3C++gKoC0+f27tclkArtV3nUfl1Wc1JVN9bZrD1YIOmFn/4buBw==
X-Received: by 2002:a05:600c:4fd6:b0:434:f5f8:22cd with SMTP id 5b1f17b1804b1-436e25603fdmr82902975e9.0.1736886525263;
        Tue, 14 Jan 2025 12:28:45 -0800 (PST)
Received: from skbuf ([86.127.124.81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e2e92f7bsm222377555e9.38.2025.01.14.12.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 12:28:44 -0800 (PST)
Date: Tue, 14 Jan 2025 22:28:42 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Bryan Whitehead <bryan.whitehead@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Marcin Wojtas <marcin.s.wojtas@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	UNGLinuxDriver@microchip.com
Subject: Re: [PATCH RFC net-next 10/10] net: dsa: allow use of phylink
 managed EEE support
Message-ID: <20250114202842.yeevjylh6566wiwm@skbuf>
References: <Z4ZtoeeHIXPucjUv@shell.armlinux.org.uk>
 <E1tXhVK-000n18-3C@rmk-PC.armlinux.org.uk>
 <20250114192656.l5xlipbe4fkirkq4@skbuf>
 <Z4bC77mwoeypDAdH@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4bC77mwoeypDAdH@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_203000_236634_9237506E 
X-CRM114-Status: GOOD (  29.42  )
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

On Tue, Jan 14, 2025 at 08:02:55PM +0000, Russell King (Oracle) wrote:
> > What is the reason for including this patch with this set, where
> > it is of no use until at least one DSA driver provides the new API
> > implementations?
> 
> No criticism against you, but I guess you didn't read the cover
> message? I tend not to read cover messages. I've been wondering for a
> while now whether anyone actually does and thus whether they are worth
> the effort of writing anything beyond providing a message ID to tie a
> series together and a diffstat for the series.
> 
> Here's the relevant bit:
> 
> "The remainder of the patches convert mvneta, lan743x and stmmac, add
> support for mvneta, and add the basics that will be necessary into the
> DSA code for DSA drivers to make use of this.
> 
> "I would like to get patches 1 through 9 into net-next before the
> merge window, but we're running out of time for that."
> 
> So, it's included in this RFC series not because I'm intending it to
> be merged, but so that people can see what DSA requires to make it
> functional there, and provide review comments if they see fit - which
> you have done, thanks.
> 
> I'm sure if I'd said "I have patches for DSA" you'd have responded
> asking to see them!
> 
> Of course, I do have changes that will require this - mt753x - but
> that patch is not quite ready because this series I've posted has seen
> a few changes recently to remove stuff that was never settled (the
> LPI timer questions, whether it should be validated, clamped, should
> phylink provide a software timer if the LPI timer is out of range,
> etc.) That's more proof that text in cover messages is utterly
> useless!

Ok, for your information, I had read the cover letter in its entirety,
including the paragraph which you are highlighting here again.

I still find it of limited usefulness for me to see and not be able to
leave meaningful feedback on a DSA conversion broken down into sets
which offer an incomplete image, especially when the API itself is still
subject to change. I wanted to leave an Acked-by but I didn't fully
understand where the conversion is going, so I asked the question instead.
I wonder what you would have done in my position.

I wish you a beautiful evening.

