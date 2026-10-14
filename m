Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86A20CC6B2C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 20:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jUACYbETaqpFqJbZX1FmstlpX60MgJplyW3Gj5blayY=; b=DTbEkXiv/5UQtGPJWK7oCBuayH
	bwSaBSG2rviCO1tsZzzxcVvH3Y1BH4kUgRM+BWBnZ46FHeV5uYvLtpoIVYuV+isIBraCCNp0C7Yil
	h3dupVsdnN7fqMRR/xSjQvHen7mnmA80ppHntY6VDAo9DEmA56xhtpj2YsNDkxgFgTsPLtCqJAAK/
	gYNsLhEfPuWzA5425PdG0KwohLVJagy8L1Wka55OFHtupka5E/p30dvCxUM6Rg1XEJQ/rX4nASzu/
	ZSlLtVWoD4v81WhH+UdbdnmVLBj1JFLJ9b36oRCJyItFBgH5jsaJkimVIdMy+lP47eZ0G912FWc6n
	Y/2EceDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH59m-0000000GEXK-2DA4;
	Wed, 14 Oct 2026 20:00:58 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH59i-0000000GEWy-31Nh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 20:00:56 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-49e73611928so40889545e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Oct 2026 13:00:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792008053; x=1792612853; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jUACYbETaqpFqJbZX1FmstlpX60MgJplyW3Gj5blayY=;
        b=rPfQB+4Em7KM1BaDkugWkdsfmArGqohxZCthGWbesBBnri8jRvJa9TQBs7B9yFrWPm
         m40ectrQSkdjLImpQMVTCYXi7iNmEiD3nuMv89x5h4DXl5JjPuq6neRpZl7a9T9R/dUj
         2RsvcL6fqhChWBtaqaDTuswVeuJyk0e8um9LQBhhoXJ1PFNjdiTFZXRgvdKgq72C6cF1
         8IhYnUeW9VSqr+QZIdmGZbzYUOAeE9/UIyr2aPjjZSUyzM/vZjukg4lPjy/Pg1Cjezsw
         maIQdbN0dpUUaG3MHqJgQdZAQttOgNz37eGY0ou1JMJovxIYa4vr0kM9Eq+JU1ZQskd+
         AqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792008053; x=1792612853;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jUACYbETaqpFqJbZX1FmstlpX60MgJplyW3Gj5blayY=;
        b=r1yyXFMid/axeIpjS3PRtJ7nd/R8xtMqhgaj3GdCL//cjLLwj2zS7AXoaHaUh1LoLN
         LnlQJGJHhAlRtWDwa6mVohMcm+wcx4rVeoT4/04kva9Qvr+h3sSwE6EofhI3uoSXzzGz
         XM2Cn0lyCmpJN2mg18pKvY6OhbBFfnCIwv25gxCSsLn3R/c8H0acNiKYqig4ZwASXH+B
         qepZJJZXbyGI2y/ANLwYIu0R0naZ7PExGZbg9Sngag2CvT4kIVBmjnPrJbfI+ypJ2oP7
         D7S0xpXTK/N/P2jHw10TW8ayEEz3iYGUZXF0B7F6Bp03MSuW5ALE66+KG9BWs7KrkaX4
         FyGg==
X-Gm-Message-State: AFq9FYJbqvXy4+nJmcVjfKPzfq9DA47dzNSM7BNXDiN+1H4/cME1X9Um
	k0xEp3Cc6EVoNnHEVehRb57jZ81ggxUNjhLrYAFhIlnef1Ycs9qnrZMLYs5D8w==
X-Gm-Gg: AYBFou1qasf0v9DTUobR+7pSwZWUC9x/hBGPJ0ozTOmVrX1l2zD9/uU4KzvPu8SbmDA
	xpre7lf9nJqXZxQVK6HisssZdvlwfxxzjkv4C7/SWtd8wiXdDmyIuB+I7qlgOHT1pPZK7JMzjNz
	C/gqIcrHqNeEYAI1KT0KRofgFh+GZ7zhHYHM0eKeQmhSro2403tc8fuNzjiZWEtJxfQqYvbGZqN
	ZlJY2CjIRhNZrctlNM9/IoEVHXSE2bXXP3iMIIyt0LH13l0Q7HD+ng1+QTo3+AyqxAwCIwsBKfd
	Gj/Yp24ZnQWaRUst/yGB8/1cyDPIeQ8syJuB8wUIYvuAHrfcn0jx70/olhDn4YnwbYfh6ucButQ
	TSWg26+s1fcJtx5z4FZUOk43xqWF0mXGudUTCgp8T3i7BO8mIjJbDHmxzpvB2JrXWvyFimdLHZi
	6HIIBlin/V4I95H0x3gd1Kqhi3zuwpzRCENvDHPBJcIjrb+BHHbWMMTfLeBOIFGMhk9RBL5tY/S
	2fodNL4mqoyRv8tomTQpjFGiYt1MEhvXhOroV5TucSp3rbKjEbbWXmXtM42cA==
X-Received: by 2002:a05:600c:3512:b0:49f:c5aa:9ef4 with SMTP id 5b1f17b1804b1-4a18e4913c3mr301016295e9.8.1792008052372;
        Wed, 14 Oct 2026 13:00:52 -0700 (PDT)
Received: from silicon.doe.home (91.141.74.240.wireless.dyn.drei.com. [91.141.74.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bf63567esm7824665e9.10.2026.10.14.13.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:00:50 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: arnd@arndb.de, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH v2 00/24] ARM: zte: Add support for Sanechips ZX279128S and ZTE
 ZXHN H3600
Date: Wed, 14 Oct 2026 22:00:48 +0200
Message-ID: <rum7uPffTpawXUWooWWkfg@gmail.com>
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartKEWPbr7dRzSw0sWJFcmXLQ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_130054_841400_7612BA40 
X-CRM114-Status: GOOD (  11.72  )
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

--nextPartKEWPbr7dRzSw0sWJFcmXLQ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Date: Wed, 14 Oct 2026 22:00:48 +0200
Message-ID: <rum7uPffTpawXUWooWWkfg@gmail.com>
In-Reply-To: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Am Mittwoch, 14. Oktober 2026, 09:20:40 Mitteleurop=C3=A4ische Sommerzeit s=
chrieb=20
Navid Ghahremani:

> Series breakdown:
> - Patch 01: Consolidated MAINTAINERS entry.
> - Patches 02-03: SoC platform integration, SMP CPU hotplug trampoline.
> - Patches 04-06: Split CRM clock bindings, logical reset bindings,
>   CCF/reset driver.

I recommend to focus on the above patches first and wait with the rest unti=
l=20
the basic board description and clock drivers are in. This reduces load on=
=20
reviewers and keeps the patch series focused.

The later patches are still interesting to see though to see where the jour=
ney=20
is going and for myself to see how your zx27 hardware compares to mine.

Out of curiosity, do you have a public git repository with your patches=20
somewhere?

Cheers,
Stefan

--nextPartKEWPbr7dRzSw0sWJFcmXLQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrP33AbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiXLQP/RdR5nOgAIesKOVgadqe
EyFgnmAV14zRgxOGzbO4tWpNf5CBefXWeYBd0XakT1NHOYwwD27gM83K1ZUEEZTk
PybWik5XX2uRomjSfYjk95fUB/qNGYEme2YIKISzwSgcUuoy6yfMNzVIrkg5WngW
PQl7g6lnN7hvUfRW3fZ/LRJOafEdNz2yjVZqOcGSQOhlWyeJH6P9qDMlvznEQDqr
Fs4fB6ms4TIRQHKQ0MfkbDALQVAdz4yT6EKsS9sO6KoFjM2tyj+8qp5TqfjTxsWV
J9tTV7Wr44Gl3AfA8AdOCrE12JRfqGPaJTHhAPMYbM4UY/XyhkihjjNXOYBEH11P
NtiEweIDivghWxYhm7L4vUS4Vdeer9N6BIcEjmsv+Bn1X/Z4WUqoULUsJKo1OQe4
gsY7gKY1As0o55vLZ7ZXQol+EFw2hr4OWKFedPXjjyCbhLnpYpm2qbNrdV53Uv+2
yHNqS7EkceQsKKSjRqfCPbclYdDHWO7E6Rh9g9bb/1oAxpvWAp3rLR0yXSg6JRH2
PRaZcM2lcLFUtfM9Y33yWNJ2Z6cy35wG1QttgeQxjGvab4Su40S+MtPSHejAuFBw
wcRiwrBKWjVbUHbQSC6AZ3jkjMF+5qMtfqPPCUX5ecx634OJDBRQrBKhUEnmIUC2
/U+nEDT49K7qNx6FLf/rv5Y6
=j77C
-----END PGP SIGNATURE-----

--nextPartKEWPbr7dRzSw0sWJFcmXLQ--




