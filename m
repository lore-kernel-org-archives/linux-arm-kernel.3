Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106ADCD5BB3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 07:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ITud2w1YmfwAO2VG3810GZ12MSpFc0lANmn3XqSQLCI=; b=rQTztpIBxV7KrUv3dxFweP0/xI
	2heunGjVa8uR4KROMJQhBZzijmbg6zxT4+sW33BQowuI8amFDivQhpzDTKd/r3WEHIsXO0TON/Cde
	wKiqO5RAdmkf9I24xl79koSP6mF+AOfnCur506VY2Pkx/mrcN6Z+LZ8kd0dl0WxQch3GEmbldQ6Bz
	9A5r+Vbddx+bHTOMPExFJgBQE7S9h922N/dlXv7OzMC3440SHAm/62hRd4FDXbqNRpUUjCRc4RxRt
	1q8JgFDckLnb7GB6A5Nexs0fPDGgzKH+79YcHPh+/WMh9PJ9yRGjvgjBleZHvNlBM0WSOgv7oQKVU
	xKHtZOag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQK0w-0000000A2if-2JLw;
	Fri, 22 May 2026 07:09:46 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQK0u-0000000A2hp-3QlM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 07:09:45 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-45e6a4d0be0so3058684f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 00:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779433783; x=1780038583; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ITud2w1YmfwAO2VG3810GZ12MSpFc0lANmn3XqSQLCI=;
        b=TsG9MetN3QbVJae3m979t6oafulH6u19n7WftcCB0axjXc/IkQlAXO5z6iFalK8hQy
         1/Zc2z7HtgN6Xsp63iyQHATr5wc/oTKVXSO08l6i9qRJ1aVGP8VyAGywGrxYNcR20us5
         4p1Vxon8njcS7hQ4ZESijkTAKwTQL1IE0eOygIc18XSa7T5Xb8hW3yw6qN9cwwJNC0xL
         ktAtIJ+twsfSl6dyUQfuAmoVrfqOO4dDZx1f1hVyVMOxuBoXcKN4ex/ggjSGZr7/NDLg
         qUH7wKyr0l8XrxFIGKfiYYNOS3Pu5evt2EVZpgKHCLm9MtCRh/8FgcwmmDQOSOabiD2J
         upog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779433783; x=1780038583;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ITud2w1YmfwAO2VG3810GZ12MSpFc0lANmn3XqSQLCI=;
        b=cPKk2ljRAc/Z+OoY34m+odZW87LYLcc5BHnnxbyxIkGd+ylYf8oAIOkT2DoILJvpgQ
         YwmFrTZ34LSpDe4ok+d5nzxWFmXddUr6Rg1fupzcTK1cueSB4JTdllcoDV4POZ3pQZz3
         jN8zQWjX4qkoqvBxDEMgfRzcokfZqoOGMed4aTDMaVMxgAh2d2mhNqPap6UK56LDHWXD
         IeHWhWn06yEx50yx6oWmbE9tfS4OsgCVaIzKYnGPuKSnOI3ggJdAwDmb6g3EsDAH/V/c
         Tt0q5sHUnqoW8WCkbUFeFoALwhNnVJ7Ls9tKfUpzv//0Jb36FENwOryKRM1fHnnK82xp
         hAug==
X-Forwarded-Encrypted: i=1; AFNElJ9DDHU6JBL5NvTuj5oR1k/SiJzfqqnIhpORow5IaLmKzFqPwtg91821CsOWEHDOyQ9mqLuxhZxkncy6B/IPuMtM@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7U6Rlg90m0jwl+xM+4dIW1jztQL0Cadcig6RIk7KV5W5rBUQ0
	EcyBTJIjeFKyngtbosPg2fmq3ZBXJ6ho2eklcnkTrKsrPCQL+sj/KrNr
X-Gm-Gg: Acq92OG9RcFNZU8pRwUSuH1QsNlH6ua5hZ+oLVlv1xyb+LAETT2QXTjunDeXBmum0ji
	A7GkVq4ps5OtI8xZeamtoptWNwAgIU2aHBw7rfV0goVbqk9ek39HFYb58CbdBPy8YiX5uwiMXL3
	pHx0D90rEAkUtuFkpTNd9sG129Dpd42issSejFulBgy+DLTsFyfCSFZS1SAWGtOkRhpUGwqr57V
	JmcR7Tu/iFaXMjzbAJghd3hGp2ShbpTMsvvgGotM3CfXWSQUM17p8afhVcx8RHv42OqjB1io8ZH
	qRtwpo25IbC/sGuK42c37L90K7Wf0v3He+Y/pEQFbziWGhpH8172t4yv3XGxjVq0Lk7XIWbURWL
	+qwouasPx9Ukj20uDrP1quG1rKkZPGFypvumyOXo01du+QgQXA4Bx9SIKslfNk9zDLOpzeRknRd
	vDKEPA0vvfZ7AOaUIqUeIKeKQ60A29f58=
X-Received: by 2002:a05:6000:290c:b0:455:d927:1b30 with SMTP id ffacd0b85a97d-45eb38af531mr3150303f8f.28.1779433782717;
        Fri, 22 May 2026 00:09:42 -0700 (PDT)
Received: from strix.localnet ([197.250.51.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6ccd211sm2307866f8f.10.2026.05.22.00.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 00:09:41 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>, Linus Walleij <linusw@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] ARM: zte: clean up zx297520v3 doc. warnings
Date: Fri, 22 May 2026 10:09:31 +0300
Message-ID: <13240501.O9o76ZdvQC@strix>
In-Reply-To: <20260521191458.177046-1-rdunlap@infradead.org>
References: <20260521191458.177046-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart6337413.DvuYhMxLoT";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_000944_874910_B14F09E0 
X-CRM114-Status: UNSURE (   9.19  )
X-CRM114-Notice: Please train this message.
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

--nextPart6337413.DvuYhMxLoT
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] ARM: zte: clean up zx297520v3 doc. warnings
Date: Fri, 22 May 2026 10:09:31 +0300
Message-ID: <13240501.O9o76ZdvQC@strix>
In-Reply-To: <20260521191458.177046-1-rdunlap@infradead.org>
References: <20260521191458.177046-1-rdunlap@infradead.org>
MIME-Version: 1.0

Hi,

Am Donnerstag, 21. Mai 2026, 22:14:57 Ostafrikanische Zeit schrieben Sie:
> Fix multiple documentation build warnings.
> Improve punctuation and formatting of the rendered output.
>=20
> Documentation/arch/arm/zte/zx297520v3.rst:66: WARNING: Title underline too
> short. 3. Building for built-in U-Boot

I am sorry for the mess. I'll look into doc building before I send clock=20
documentation...

Reviewed-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

--nextPart6337413.DvuYhMxLoT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoQASsbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi9S8P/0ouABngGtPJ84cmw4RC
cbqM4oJrW6XF5yNOG46jKfbkPVNxVF38uLq9j1Cs/A3pMEjSVZTw6TaD+Hy9KQyz
aav5x5GvppMQZsKkN450SjSQ7XMPs6oME4/a+EWjxoHkI5U6WqHmCFs2U0c4kDsE
rvAc7fjpHKmhwJDcju8G6vDLM5kROmPTOjUSF6XVlCh7Tv3JkIyTTEmc3nmeuOtO
dN6SQFL7CfIFDjDGD47YCd70ULmdQEO3JA1Dk9+/svi1TzT+ChofOUWiv+MVLLxr
yfPFVwAln76gKjl72l9I5Z+nT66iyAZaKbVEXWHLoIluN9A3HcvTvu038WksdrF9
9pwMl2HGWHmjkKap5gvNliNO9vCLoP6a3PZQ2dKi+StACqwPcr5aSmjZ0Se5jaoP
QBSNuUKuymsgfmMxXm5LpBA2jo5TO69zpzVS1z/q0Qo5f0de+WYlCgORFR/NWgbN
yijb3xgCbQvGdjWneTakUmwJ9YnTXhxo5rHGnSOLOQl8PVDljl19nCF9eKvyWT0o
1YkP1K4zl35l1pM9Bfl03xeCKxGXxv13vXmsUEkpJ+wLjahSB7qgq0o1IT1Sto0b
2GOk33H1rDPuOtaWFm+GGQlIF8ePYD3pj35T0qmibb1emFFg2M+rxgRpo8L+gJJ+
P+clcDXhcoEhSIUTevSmqOiS
=kFBP
-----END PGP SIGNATURE-----

--nextPart6337413.DvuYhMxLoT--




