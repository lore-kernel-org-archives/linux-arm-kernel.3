Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E4E9C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 18:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dyuD9/sJAUbk/RnjGg0DeufQJHAxdMe3Ujkj8v1B1G8=; b=JQqlVUYaLFbZSqQR/MIksJKSdv
	tFUzZjSlh5pIo7fRFoGaWN/EX4c0LQ89LeBhQUDN9CzarUwqpfcNLcIhwH1lco7V4inL3KTpqHf2C
	zkj3aDsLG7rZ2i7A9LESjG55Za4VL2Ri+8I+IcJIHYXr7KkHVPvZpt7OxnQIhI8VtpFVIUUDQiTad
	2LxYW26vP7esDgTQKkXU3snLtsG/JFYP4/eIGRnEQfg/c6Gq508Co7a/8Wxg7WSOH9ciOBy3Bsr7w
	FGnxZwqQeE0lyI4Tpd8xpPzVCXuG13AeTwk71AcxxYJd22gjTdWib8FF6csKkTv34YMefcQhwDowF
	6jvaIPpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7fGf-0000000Bfg0-26Wd;
	Wed, 23 Apr 2025 18:56:21 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7f5W-0000000BcrW-2UH0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 18:44:51 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22435603572so2042315ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 11:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745433890; x=1746038690; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dyuD9/sJAUbk/RnjGg0DeufQJHAxdMe3Ujkj8v1B1G8=;
        b=OJR6uoDZP24olecVnaMRJxyjD7cQSXAWyLWEjokK7EGtzu4c7qqbK35cVy5rBx09tg
         7bQDPLA98CUcOaftCynbIN3SRII4NI0gm4eED75XjvVGTNuV4Y4SiudmzAQvJzk+HYX+
         tKYTNpH9h4aj1gVKFf/DBhWH4YzkIaxG0ixx3Aj8qwrdpcS1DAjPAYeG9MwCaE93rx1y
         PzMh9WHA5tlGuPhvGY5wPGMH9auitt1eXVxG8coVKbT9M3WRcKSVXcV9xStgHQDeTq2d
         Z6QJRpCTd3iHyQSIhkRU3pyJXKSyApPjxWSWaeIp1PReGR3hMcsJCzNb5oYOTvj2pCJQ
         J0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745433890; x=1746038690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dyuD9/sJAUbk/RnjGg0DeufQJHAxdMe3Ujkj8v1B1G8=;
        b=Vt5EEwJo5fGL0MWx0dh0ot2haEBrIvO4qQBn2ivMyiLVuyz9N4LVXNJ55UDfXH39CE
         YfumViQaY77p/n6ki3T16gGNQSHIYYS7nLsMkGl84fN1NFPm2DTiI0TJtZbkiU9IeWMy
         +i1JVpeM6a8g/bRnYdLqzfTaKtOaeZ6ADnOS3+Y/KcmTwpb4ZqQZMJirTFu0weSNhtpp
         gRB8cDfbQqXCcWErqZYiS3d65dIsJvkr67WkE5AuoDPZVFGFMWstHVegsMkiKuZgltxg
         ybDW9XvSPYCnRiZ2iyKLaCy7zhcI/vPCBaMXQzFxla4tzYTXoGBZ8QbD5sIabk0jsg2c
         rNiw==
X-Forwarded-Encrypted: i=1; AJvYcCVp2aO6UtaPoq7PSLthcLpir9e0U+0X9gb76vI7+ZmD3WsAy9UO3uWxcSvaDLb6Wq2TDnP1wPz24nAvMqJC1kv9@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+SVMn6E3Q2AroagvxkMpD7LXBNXFogm2Zs5+mzqOOXXVYLTxF
	1RLH3poMbZIb76GHd8Fw+SpoY/YkaPob+0L/J5qEhnutNHGtilaS
X-Gm-Gg: ASbGnct0SgO+xtpZS7MSfjlc/0/8nKpNLfpg0R27vUyPrIbWU0kp4iO+MywJwOY8e6S
	Dn1N97ImyLb1NrGF5VUQMmr13EDdB28RkhF/6FY4Hm21GBvAkzUHi2aTYm37bchMLx62KOBUrb7
	CrZalQO+vPfcnLuKu9muJkpqJXbbaqAHH2R7n1cFPaPEJd6kz02SimYIMiLGvb+MmfeJ1wtyyQK
	oPWFHLf3x+gD80bmT5efOpLnvJaNXz8l7Z13bmuf6/nBSJU5pKXwe3vkH+1EQfKKp+y+1fdKH1e
	J5+hOn7xFWLvIRzU4jlwZ9ee6YyZnqr5Af2Se/8O1o/FtMyjmM0=
X-Google-Smtp-Source: AGHT+IHehkEM0GpRg5zfuUpHGpY51Oz35KQoy2mf8GVVVNyjw21DRg3BRF5CuxGd2alCupb+hBqELw==
X-Received: by 2002:a17:903:247:b0:220:da88:2009 with SMTP id d9443c01a7336-22c53619eb5mr285278835ad.45.1745433889820;
        Wed, 23 Apr 2025 11:44:49 -0700 (PDT)
Received: from localhost ([216.228.127.130])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db13a3e63sm9433123a12.29.2025.04.23.11.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 11:44:49 -0700 (PDT)
Date: Wed, 23 Apr 2025 14:44:47 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Marc Zyngier <maz@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
	Luo Jie <quic_luoj@quicinc.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>, linux-kernel@vger.kernel.org,
	cocci@inria.fr, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, quic_kkumarcs@quicinc.com,
	quic_linchen@quicinc.com, quic_leiwei@quicinc.com,
	quic_suruchia@quicinc.com, quic_pavir@quicinc.com
Subject: Re: [PATCH v3 0/6] Add FIELD_MODIFY() helper
Message-ID: <aAk1H0Msi3lMKNR9@yury>
References: <20250417-field_modify-v3-0-6f7992aafcb7@quicinc.com>
 <86sem7jb5t.wl-maz@kernel.org>
 <0c97c659-bd28-45e0-8537-d9be2637cb22@lunn.ch>
 <86mscek7h3.wl-maz@kernel.org>
 <aAJq9mGswYsnAOS8@yury>
 <aAkm79R8f5Vf6TLh@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAkm79R8f5Vf6TLh@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_114450_631540_EC8AE981 
X-CRM114-Status: GOOD (  17.48  )
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

On Wed, Apr 23, 2025 at 06:44:15PM +0100, Russell King (Oracle) wrote:
> On Fri, Apr 18, 2025 at 11:08:38AM -0400, Yury Norov wrote:
> > The _replace_bits() functions return fixed-width values, and intended
> > for: "manipulating bitfields both in host- and fixed-endian", as the
> > very first line in the commit message says.
> > 
> > Those using _replace_bits() for something else abuse the API, and
> > should switch to FIELD_MODIFY().
> 
> Sorry, but please explain this statement, because it means nothing to
> me.
> 
> FIELD_MODIFY() replaces bits in host endian. _replace_bits() also
> replaces bits, but has a wider range of which encompass FIELD_MODIFY().
> 
> I see nothing that precludes using using _replace_bits() with
> bitfields.
> 
> I see nothing that would differentiate the behaviour, other than maybe
> religous ideals about C functions vs macros or upper vs lower case.

Interesting, never heard about religious ideals in C.
 
> Please explain why you think there's a difference between the two
> because I really can't see any reason not to use one over the other
> apart from asthetics.

I explained that in subtread for 4/6 in this series. Shortly it's
about compiler's ability to catch various errors, like overflows,
and (not unlikely) generated code quality.

