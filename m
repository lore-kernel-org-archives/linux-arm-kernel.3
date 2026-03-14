Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA96710706DE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 14:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	References:Subject:To:From:Message-Id:Date:Content-Type:Mime-Version:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+2Tn48ZTy8YJup8oy5qnpSHZErDyfJTbe2tIPOLqQk=; b=gSZDLaXlTWJRD0GtfJ7HCOcnac
	q4Ess5ZAx97wmlIyrjySATxbznpK08owigXGVNSj4PfUwGstcXq8FHmvQBZEU+DSNfm1k3Q3fVSyS
	6Xrl6a9Dbmi2nGI400KhFWd+koQrgafhpBsQjsXB2n659PrkvimRNPCVuvdvj0su3PAuunGCr4haj
	NurJOeTlaa7LnGE0Gh8BwzZw35RORoxHojk9rFuJdDuPiAZtkcCMqP+9vaLy+7+lQQ3vet8kJQEUw
	12jLvwaRq2zlelS+uCBzIFHC/Z1A9oCHkDcm1Rm6m0RUKEvB850MJbJDKo5q+VIeDxYTDjLUoCs5P
	QJ++wfTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Pyr-00000001vEg-18CB;
	Sat, 14 Mar 2026 14:28:41 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Pyn-00000001vDv-3z8m
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Mar 2026 14:28:40 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so27516805e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 14 Mar 2026 07:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773498515; x=1774103315; darn=lists.infradead.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=C+2Tn48ZTy8YJup8oy5qnpSHZErDyfJTbe2tIPOLqQk=;
        b=Kh6Ot53ndnbzWo5PCuFGBY9VSzikYl/UioCsxpO5OiWS5ny/ajSE/su5GWHvJ1us+T
         75EWvhaSCutW4NDtFpBtK5YhQ7H+OYjO37EqSBbshVo083pq3s4wx6lyjF4BIQKYqyEa
         8FaO54heulJxE086JWuWD1qef5MWflPcnO8bDp/XGSa2/C8m/P+FEiIWHeIk6Q1Wm1G3
         NktCCD+VJXRNHNMXAo9jzwkUhcqSSNgGf2Nc5BUCUhCHGSROmSrI49uMkd72av5Fw1OD
         iWV51Zj5Kjeb68/moQvC0kdrzVt1WGFVwoi9jQPu/sc7ECJAQnvZ+Dza54Hlb97xkzOx
         xBtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773498515; x=1774103315;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C+2Tn48ZTy8YJup8oy5qnpSHZErDyfJTbe2tIPOLqQk=;
        b=RXL21p3/pVrnAP2BfW48vEgB4CvFW9tHT5ykbq7A4NdWIvPkSX9pOejC44GHAMDVTY
         +7L5JS5Kb3ZhLQqcygbiH5xK4ntteEXzHjayh/ICa2YfqROyZKfaIZMqaXy3ebIiDkPu
         NsVUK66CJrfQ63ThWNQprkAXhIemP0PhHGJK1xFrteoC4wdypYHmXqFhvrmUpkV7zJ+k
         H5XPNDEyauTVd4WTxutprsVzXpHQxUjEgXs3ujG+tdwlfCz+Kb3fWcHLowbAQg9e2zy3
         GucwRVmuVyjDeBgsmO693SFyDfmEuQhaQkb8UEE7h+q5G+MlScIY3Bo8CUDx5s4tZb76
         +3zQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2nRF/yDFh4paLQV+qGzvO2YnfsCdHD5+bcRD7lpW+Lc/gYcVmTtZey4EX96iWL8Of2VUBpDR6dJMexjuWYb6j@lists.infradead.org
X-Gm-Message-State: AOJu0YxEWWPjH4rOiLIcRDuhLoKz4+wa/+V4WR3rRRo3QsrKY8VJbGAD
	EBBD806QEx7l3xeHMHq+1yY5P9HayFAHopn4MMs2X8Hwl9DACHYW6PvWBLxsxbYfLi8=
X-Gm-Gg: ATEYQzzx+rBXATbxJxNBx2mfAzEQOOYxp87eDOT5XWCA+jGI2LzEst671LTIfI5Od/k
	IFFCfBQy0kdvipqOSeUYlZhoTGCaSlleGqLdwujhrpPjpjVBfeShyL+SfyFFRek74f3DH4Zypxv
	EpMz0QODlHTa2sQNYZBhzXbF3i1Y2xCPYB6ADccKSOfdOBK4V9wyDh+bCqI1dSW2OfCjB7WPJfO
	/0ImXrNtI9m+j845eCHYw2gVA4mgeaQ1M8qWnajyWwEjBLb1j/0ncaNGozBjfVajDUzu97M17PG
	U1u7EDoFm1WMTxzFucaONtKNBEw0N9DiewAFGi9juctrmOaC3yjNr/LdbZ6ue+WcKMWvUuAoyvU
	4351F7SpInMb/etl7ue5HbnM2pxFshMLq51QdwiHsciVjh3om+aRsKuDk09z8cKNJNWqMWCSGfN
	OlUA7C8LyCqNj36Oc=
X-Received: by 2002:a05:600c:3550:b0:485:3983:aba2 with SMTP id 5b1f17b1804b1-4855670b64emr125739085e9.23.1773498515112;
        Sat, 14 Mar 2026 07:28:35 -0700 (PDT)
Received: from localhost ([195.52.25.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854b5e912fsm753413325e9.2.2026.03.14.07.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 07:28:34 -0700 (PDT)
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=2594bdddbece5ae68bc65d0e181a463f516ad51c50de981b59b6999a2bd2;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 14 Mar 2026 15:28:25 +0100
Message-Id: <DH2KR1W7CWZW.35FWVV4MNS0NE@baylibre.com>
From: "Markus Schneider-Pargmann" <msp@baylibre.com>
To: "Conor Dooley" <conor@kernel.org>, "Krzysztof Kozlowski"
 <krzk@kernel.org>
Subject: Re: [PATCH v2 8/8] dt-bindings: remoteproc: k3-r5f: Require
 memory-region-names
X-Mailer: aerc 0.21.0-126-g9e77103592fe
References: <20260312-topic-am62a-ioddr-dt-v6-19-v2-0-37cb7ceec658@baylibre.com> <20260312-topic-am62a-ioddr-dt-v6-19-v2-8-37cb7ceec658@baylibre.com> <20260313-quantum-modest-prawn-896bde@quoll> <DH1P27ZP9QYQ.2IP3X8G218GR8@baylibre.com> <849c07bd-2f8d-4982-b5cf-c336807ab8ed@kernel.org> <20260313-kettle-craftily-aa087e6b74db@spud>
In-Reply-To: <20260313-kettle-craftily-aa087e6b74db@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_072838_268111_8430488E 
X-CRM114-Status: GOOD (  30.90  )
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
Cc: Nishanth Menon <nm@ti.com>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, Dhruva Gole <d-gole@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, Kevin Hilman <khilman@baylibre.com>, Bjorn Andersson <andersson@kernel.org>, linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, Kendall Willis <k-willis@ti.com>, Markus Schneider-Pargmann <msp@baylibre.com>, devicetree@vger.kernel.org, Vishal Mahaveer <vishalm@ti.com>, Sebin Francis <sebin.francis@ti.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Tero Kristo <kristo@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

--2594bdddbece5ae68bc65d0e181a463f516ad51c50de981b59b6999a2bd2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Fri Mar 13, 2026 at 5:18 PM CET, Conor Dooley wrote:
> On Fri, Mar 13, 2026 at 04:49:14PM +0100, Krzysztof Kozlowski wrote:
>> On 13/03/2026 14:38, Markus Schneider-Pargmann wrote:
>> > Hi Krzysztof,
>> >=20
>> > On Fri Mar 13, 2026 at 2:13 PM CET, Krzysztof Kozlowski wrote:
>> >> On Thu, Mar 12, 2026 at 04:49:02PM +0100, Markus Schneider-Pargmann (=
TI) wrote:
>> >>> If memory-region is used, require memory-region-names.
>> >>
>> >> Why?
>> >=20
>> > This was a suggestion/comment from Conor in the last version:
>> >=20
>> >     Is this really optional? Shouldn't it be made mandatory so that it=
 is
>> >     easy to tell the difference between the two configurations?
>>=20
>> Then write it in commit msg. You have entire commit msg to explain why
>> you are doing things, instead of obvious what. We can read the diff.
>>=20
>> >=20
>> > https://lore.kernel.org/all/20260303-hesitate-preoccupy-5e311cbd3e58@s=
pud/
>> >=20
>> >>
>> >> I don't understand also why this is a separate change, but maybe answ=
er
>> >> to "Why are you doing it" would cover it as well.
>> >=20
>> > I made this a separate patch so the git tree never has any
>> > binding/devicectree warnings for memory-region-names even in-between
>> > patches. That's why I created these patches in this order:
>> >=20
>> > 1. Add the memory-region-names as an optional property.
>> > 2. Add memory-region-names to all users of memory-region.
>>=20
>> So what is the point of this if it is optional? IOW, what does this
>> commit achieve? Almost nothing.
>>=20
>> > 3. Make the property required if memory-region exists.
>>=20
>> but only required here? You need to organize your work in logical hunks.
>
> My rationale for my original request was that the meaning of the second
> memory region is modified by this series. Previously it was always
> "firmware image sections", but now it can also be "IPC resources".
> Nothing changed in terms of the number of memory regions (it was 2-8
> before and 2-8 after), so without making memory-region-names mandatory,
> there'd be no way to tell which of the two configurations are being
> used.
>
> This patch should likely be squashed with the patch adding
> memory-region-names, so that it is easily to provide an explanation for
> what's going on.

My goal was to not introduce any warnings in any of the patches.

That is the reason why I only added the requirement for
memory-region-names at the end, after adding memory-region-names to all
users.

The alternative patch order as you suggest is:
1. Introduce required memory-region-names
2. Add memory-region-names to all users

After patch 1 there will be new warnings about memory-region-names
missing for every user of r5f memory-region until patch 2 is applied. I
can happily squash this patch into the patch introducing
memory-region-names. I can also update the commit message to describe
why I split the patches this way.

Let me know what you prefer.

Best
Markus

--2594bdddbece5ae68bc65d0e181a463f516ad51c50de981b59b6999a2bd2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKMEABYKAEsWIQSJYVVm/x+5xmOiprOFwVZpkBVKUwUCabVwiRsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwyLDIRHG1zcEBiYXlsaWJyZS5jb20ACgkQhcFWaZAVSlOB
igD/WvYTEC75LExS0Z+nmXUcqQeFFHaNPYlU8r3MTTmbi7ABAIE3q9wziwZ5bY8H
oyiuJEgonYJvR0yiRjyuJx6FJmUG
=5pep
-----END PGP SIGNATURE-----

--2594bdddbece5ae68bc65d0e181a463f516ad51c50de981b59b6999a2bd2--

