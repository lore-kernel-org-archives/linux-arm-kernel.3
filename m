Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E756C5DF82
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 11:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZURaZADyFYuCh4n+xDVLpaYHqRawfBxPTS6bs5K8cu0=; b=egytVsqv9a1RFIoHUYIUVNGOsr
	SfPWE1WCGic13iubZdK8u9Uh2OE/p5JdQEK5KzZVwUXaKsLClg8T4t/f8SAUyiiMTC+uJH/p7/Owu
	rC29Gbejuk2qATom7vSfrfa1KDEIuGdg7tZYCtiXRFXsd+YbnP3Ghu0tvulDHYFbnvA8XPGAIUuRI
	qW92pLnR9TTSO8ueO9FX7gMgZCp/wyGb4idGtiMpvyxQv6TedFgMuaSVSrqZoI0P7wQ709CgTIDFJ
	kRT2YyNNlgLc+Jj1OqV2tDQ9+dXBLEEOlCfaoNw4yHvkjbGFzOFSHp9FaQB+FIo79UXeC4rxYpD4h
	3KljUzMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0oL-0000000BR9h-2dby;
	Thu, 20 Aug 2026 11:19:53 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx0oI-0000000BR8q-2cQS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 11:19:51 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-c9e7391839cso1788312a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 04:19:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787224790; cv=none;
        d=google.com; s=arc-20260327;
        b=exaL6Ppfpi7HNqCYrAXJtm8P0NZH80d2hav76GulYGyCRaD42azbtDwIbLmN3md51S
         a/2ag40oiIqpUHdws9sCWzQI0lPViK4Sh+r+ELQwa1+PLfeeRnwOdcLTrT7+PnAJoa59
         QsOES34JKhI5fV2hlLyY95W2bd1MFyBiGLxC+FFG2FB5K2fek8xGiUUti4rdOr+JQ6+i
         +mKzOODgQ7Z1gWDsYigan5c0iVzBNpNKudx6TfDtTSpWjGO3M6fww61zLe8ycG8fOaPk
         A6HZE8v2bjJvMW84IS7tmd6/CyAlQjjjwesPUFef4Hsy/hqb8cmwLdIwTB32r1SrMBBs
         N0pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZURaZADyFYuCh4n+xDVLpaYHqRawfBxPTS6bs5K8cu0=;
        fh=MhSrde3O/5rkm00b45VQSyVoCXdtWBLUpPqpda7j0Ms=;
        b=Z9xVfH0BkIuU1NHqNtG8WpKqTkNLnDRfVZKj2FHy6UC8AL1CrrVNM3s0nv0eGH3xx2
         CUHlDK4OCLyJCrtJhu1XDno0XeWD4d3KGax2ZDCE6TFvOO1ayIbz0cJR0wHJM8mI4mny
         4W/eYf6CvprdOfnibkTwH7Tqgw4lmn1Ig27Bbumpg3obAEYa/6jPk3CsTCcCxYp6fuzr
         vPWaF4BfM0GjOubfRE5ysOf7PJIEcIUVuNGTJPvZoOHO9FB5MhXNY3aPoZS/G44gja+E
         KwPSuDRkOKcjllJqOt7qV+6NDmVrh4vvEY2usEv/egLLsPOoRlmVAonPc6tDq0ecPzR2
         q90Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787224790; x=1787829590; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZURaZADyFYuCh4n+xDVLpaYHqRawfBxPTS6bs5K8cu0=;
        b=eB1CUSye/DHL9ZRRNu3i5R+UeuzNdtlgGfWYUCEezF7wRc3Pol2YppEdImhUzYvbYP
         6I50+hBLBV0tijf9eviMlOrbgXj3lFCE5Xc7N0jH5JuluP4FcGhma42CPmMDkDlU4Sw+
         zbK9lP3R9+N9LqPR3gVIDBuZzt0yanDEEk/1vw6Ah3uOXLZMYBEudLcIzORWFko5OC8H
         xJrX/bS7gXqMlwcSe0CQo3Abu/BM7u9uMbVW5sc6PsP7jkwzBAXRUSwLdyYEeQZKRgHv
         biM4+72Po6VstVwAf4UlOfFfoKTbzNaA46jwF4GogKjv0g2zTJMxvcRcNxnpMhxmZSGc
         hrWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787224790; x=1787829590;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZURaZADyFYuCh4n+xDVLpaYHqRawfBxPTS6bs5K8cu0=;
        b=Lkk4br1JbRrAK4BsyoW9xVeB6PxdUt3sV2cRqLyNkqBbQ0M03+e4o1wMWdrcyxrRy6
         Cubj/TpfR8dL1nFgLX4+ZMcimOGzXSgIyYY+3sx48QgiHQ+pyTsQo0ToOM/AgPwFgRXl
         JenpWC6TCgviu6wd/w2vFmFPnkpDOhLXE0oz6QetQBi9F70cI0R42+0X/dTHnKurbYXr
         PfLiBUjoEi1ek3zJ0hjdDLKivYZZriYyTk8aHpzRF+QSAybXzqeV7AzHBD+zDEOiTws2
         LT6dr6FSARLQqNllFFuShYhGXKsF9VJTuPxT0SUMJp+e1hD5caYrODIcyIVuSx5e6yVq
         ffMA==
X-Forwarded-Encrypted: i=1; AHgh+Rr7SXpQqbDtkmj+b44+WCKTYq/uycv5HF/pd2gZ8t36xF3bIFNDa5/nCyLqEI4PVHSb/72pgklOL6pd4obACyEe@lists.infradead.org
X-Gm-Message-State: AFuF++kTXpzzKxvNtK6d+BqW1xCshA/r2UDieT7pZI/TCE1201rJfUAj
	LRlvIqhXeYjFG8RS1OIbVPmythJa0hHbAsZy5Tbd8JSe/dyZ87gh9Ymzv2IAMrWTM6rjNqfbJus
	s6yPB73ckb0RqgcMZkpOq7pNyi9FAY0I=
X-Gm-Gg: AR+sD12bqIuUIAOKHgk4uR/6Kj+IpfBCQglltQS3XSmrlTt3/fj/Xm2UAxuoabYaQcp
	lhXPMQrLfDqnstgR2Zg37/wjOqbSleLjejgb1/CwAfm0mVeVlQWUeaXA7+axyfTrB40YBkMLHJ1
	OEWZhp0biohJoRhPsfr2pLnaXHexjQIWXk8uBT4dza5Uj/90e6d/Q099QviDIwFSFyhS5AYDGUo
	27dtDfsaOg0G7UPnq00ResSxeJGmh7HE4yL56rFM4qw0qPghjoiFhLPyfcP5HF5jQ+gcLUO771d
	sqxe0NSaJuAZk6UjA8QAKB1kd4NBQ40qWLj2WU0XDtGfJEd9ITOXCzm+jEBnccJJ6X75psdz9jd
	QRpeqtCjfxJE7JudczJjhMiFFVp+GQzXVncsqxkyXoWV2gQqfr7lWgRDV
X-Received: by 2002:a17:90b:2e42:b0:380:fead:448d with SMTP id
 98e67ed59e1d1-3958109a525mr23605663a91.13.1787224789626; Thu, 20 Aug 2026
 04:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20260817105241.63345-1-phucduc.bui@gmail.com> <20260817105241.63345-2-phucduc.bui@gmail.com>
 <38099370-269b-4d3e-a686-5b29d806e6a3@amd.com> <d6770227-a034-48e8-ae36-ff49ef3f83ec@redhat.com>
In-Reply-To: <d6770227-a034-48e8-ae36-ff49ef3f83ec@redhat.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Thu, 20 Aug 2026 18:19:38 +0700
X-Gm-Features: AcwNN1WzHI4syJa-mKxrmkNkTCREoFGUFmrgxJZIoDJhUBI6FkiWfnEalSGXbBs
Message-ID: <CAABR9nEkjBkvhfqED8O+nMWALf9ssjkPHyFbaFFVxnPfidG6=A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] net: xilinx: axienet: Handle optional IRQ return
 value correctly
To: Paolo Abeni <pabeni@redhat.com>
Cc: "Pandey, Radhey Shyam" <radheys@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_041950_666606_A4A9665C 
X-CRM114-Status: GOOD (  11.17  )
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

Hi Paolo,

Thanks for the guidance.

> IMHO even this one is 'net' material deserving a fixes tag.
>
> @bui: please re-submit the whole series targeting the proper tree and
> including the needed tags. Be sure to read and understand the relevant
> documentation including:
>
> Documentation/process/maintainer-netdev.rst
>
> before submitting the next revision.
>

I=E2=80=99ll update the series accordingly in the
next revision.

Best regards,
Phuc

