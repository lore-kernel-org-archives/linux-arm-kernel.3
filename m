Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDDDCD5BAB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 May 2026 22:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kD1NSvIYIbwsptEQaRl9/X9RefT87sq45fvetWKbNsA=; b=V0hSGjGtJhqX9VW5s/drNnTgMu
	46oLU4GnUer/Q046DjE5Jkrw0wSwX1IWW/h7Q3ZE5JyEH2ebO/TcCkMbVYVa1Zi0V1e3Kdm9Xorjj
	vSnexMWGw+wpXz33lV03AIfkTKKmErzJfqYHRESfer8KYGOzwQpk6b4BbMOWJ9k5Qg1smJbtWCrTb
	5ZCT8DziO0j+E6EsVAP1NfuZiPQDhRMDDMmN9VGwkn3Wvc5faJ8ZAm0lLe8memHZM4mLml+UKQ80x
	YCtAdnlqE8cyad3aMjrm9CqtiH2bWTFBSJFGpZrGrr8QzF3pejaBg3D6NsQ5LVNIPmZGkwIq2Twnu
	4nSPJGhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRHH6-0000000FlOL-1pBV;
	Sun, 24 May 2026 22:26:24 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRHH3-0000000FlNG-2iNZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 May 2026 22:26:23 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4905529b933so8325805e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 24 May 2026 15:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779661579; x=1780266379; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kD1NSvIYIbwsptEQaRl9/X9RefT87sq45fvetWKbNsA=;
        b=gW56zxzHaErnNmKlSILeEtmwXBXPjwqJ4EZPuU7WtDEBojL59yaq51Bc8VcZa4cFrk
         d9S9ekJ/OmivVUESuWophHP1zl1aEVsChlhVaGPhluMcYEPZ6aMAte9g44uV+yu5sfZo
         Qo4zz6OGANOgkM9TOBddX4m+/kwp2aJ/NRbrKpC05zN6P/PpK/uTiH+uK1uDJV8xVqfn
         4bOXo8bW9gkk3pA4Ja9RvND2lNZraI25CJz2HdhYpCrl4ux58KW42Y/S71DzRUVfMDhF
         +z7rFAXmKTgs+Eulf0r9K2LXz9My+68cbtZ+QKofYVaTgZkAkb2R+pyBYpRdz5vaXxp+
         CtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779661579; x=1780266379;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kD1NSvIYIbwsptEQaRl9/X9RefT87sq45fvetWKbNsA=;
        b=d3n0NyteyC0i0Z6wdNxXkxCCPacRpHtCKiT1FomXwPkMDwhP2Jtdx+Q795rES+0dOD
         i2xa+XM+FZoZnxd05CjThLQqhco1e6d44g+D26OFGGlnk27/h2MouWLhqV6wzKq7bcO0
         S4xzISEwk2+XN7DLelQRNoixsbvIU0GpoCs+yS63SmZbcW0KpaNBcNR3d5gkN08XgwOL
         h2J2yiDKuc8Ir9GL+n+J8HkvB7C580/2wGKXtD2Hji7FesEqeLmfio91mVXxdnihzuZY
         jeAJH4MTgOljCRfcQx1jtxcIwAahoQxC2ydz/QVT/PbmGbO7br8ss08xkl6JVBWB4wSa
         RQdw==
X-Forwarded-Encrypted: i=1; AFNElJ8lp5UJahplvKlqM5QOONrumkI+13AE8HfG+iO2uk+plvfy37vm9R5VleXi14B4+iTfoi81LJ5QzG3Q07YXu5aH@lists.infradead.org
X-Gm-Message-State: AOJu0YwUInEK1ahXx11inYeQMKgyNM4MW3ybZWZC9ZmiahcQdB/XI4T1
	edCfrvQlz93F/Fon89GDyaphQxS1VDJ26nrIIzuznR5HIgz52DnMyK+K2l2uq1PG1gk=
X-Gm-Gg: Acq92OHcI0+OznT2c/GTZS7wt33+cWhnXB68hWgDOmQLx2PXxHN/eX98wBbcrImVPyy
	6CUTVc7o4FEJl+hqLnd5QaGG/n42CiDHjjZG/1o9523zA9h2XRQJq1WtOyBDT8G9bevbYydk5FL
	l+zWS5cQF376+TVYZRWYny0+9EYXZ19IuG/WILkKPiUEsuPM3McJ3nwTVa6C9U5papMfnI8FYpG
	doIZQg3KNAgs/rPdKNscwAeVPVNnMW4MLVZcey92UX8Nb3L4kb5/H9JrXJbrncnYHe9wuj7xkTU
	GhKB2omEzRfnp//B4YgftyjAf5kYOlnaPToFf8t/s3nqeys8/4b0RKwGPrQ5iMLBXf/RVAP4s5R
	jO8qe1xWDyRzL38jJa6JUjipvfdflqhUfsBXHXnr8MSfaeS/+0zspAPD0BgKf4zAecZ3x2pfWZN
	a+pd71X8hmsezqYP8lfZF31w4KIuJDp95C7NGqoJh8IDnjaYHvJAu5xvzGTu2urf4ytWDUF8DG9
	OhpyO1t6Dz+RA==
X-Received: by 2002:a05:600c:3581:b0:490:482c:4391 with SMTP id 5b1f17b1804b1-490482c4586mr199122155e9.23.1779661579070;
        Sun, 24 May 2026 15:26:19 -0700 (PDT)
Received: from localhost ([94.4.195.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428ec538sm69746305e9.23.2026.05.24.15.26.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 24 May 2026 15:26:18 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 24 May 2026 23:26:16 +0100
Message-Id: <DIR9DLGP2EN5.21HR8BY11G5SF@linaro.org>
Cc: "Alim Akhtar" <alim.akhtar@samsung.com>, "Sylwester Nawrocki"
 <s.nawrocki@samsung.com>, "Chanwoo Choi" <cw00.choi@samsung.com>,
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 <linux-kernel@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <peter.griffin@linaro.org>, <jyescas@google.com>,
 <kernel-team@android.com>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/6] firmware: samsung: acpm: TMU support and
 cleanups
From: "Alexey Klimov" <alexey.klimov@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Lee Jones"
 <lee@kernel.org>, "Tudor Ambarus" <tudor.ambarus@linaro.org>
X-Mailer: aerc 0.21.0
References: <20260515-acpm-tmu-helpers-v2-0-8ca011d5a965@linaro.org>
 <177965159562.32222.17454581524471571236.b4-ty@b4>
In-Reply-To: <177965159562.32222.17454581524471571236.b4-ty@b4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260524_152621_723826_D9549A21 
X-CRM114-Status: GOOD (  12.76  )
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

On Sun May 24, 2026 at 8:40 PM BST, Krzysztof Kozlowski wrote:
>
> On Fri, 15 May 2026 09:32:24 +0000, Tudor Ambarus wrote:
>> This series introduces protocol support for the Exynos
>> Thermal Management Unit (TMU) to the ACPM driver, alongside several
>> cleanups.
>>=20
>> Dependencies
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> Krzysztof, these patches together with the acpm fixes from your `fixes`
>> branch will be needed by the thermal maintainers. I'm going to send the
>> ACPM TMU (thermal) driver for review. In case they'll take it for the
>> next release, we'll need an immutable tag with the acpm fixes, cleanup
>> and thermal helpers. Thanks!
>>=20
>> [...]
>
> Applied, thanks!
>
> [1/6] firmware: samsung: acpm: Consolidate transfer initialization helper
>       https://git.kernel.org/krzk/linux/c/43d3733b7ffd82b2bfeda69befa2a17=
9335dfe6c
> [2/6] firmware: samsung: acpm: Annotate rx_data->cmd with __counted_by_pt=
r
>       https://git.kernel.org/krzk/linux/c/7b20fd06f783c1e901d34305c68df16=
212cdf669
> [3/6] firmware: samsung: acpm: Drop redundant _ops suffix in acpm_ops mem=
bers
>       https://git.kernel.org/krzk/linux/c/ef1109e4b6120a52be1ea66d486d674=
4d0c5ac47
> [4/6] firmware: samsung: acpm: Make acpm_ops const and access via pointer
>       https://git.kernel.org/krzk/linux/c/e694e19bf7db26ee324ff6bb450cc52=
3592f5bee
> [5/6] firmware: samsung: acpm: Add TMU protocol support
>       https://git.kernel.org/krzk/linux/c/f6af402de525d0848fc4a50f25ff01f=
56fc68d98

That commit contained the questionable error conversion which works
only for gs101 -- acpm_tmu_to_linux_err() hides some sensible errors into -=
EIO.
There were on-going discussion on maillist.

Now, it is needed to ignore that or generalise that or split it to have
different SoCs if needed. Some re-work will be needed.

BR,
Alexey.


