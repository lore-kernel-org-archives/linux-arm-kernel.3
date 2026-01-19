Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA02AD29C4C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 16:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mb7EXkVeeyYYPDZluNCIirhlK7FHyduzjPpO6/F/48I=; b=iAKwG7IstS3ElsIi9dUU1s2j1V
	Vq0afxbzxoI9/JG+CdPjGAJXejkvxpo/33u6sNmY7umI81Ug3PycM6r6r4+CdKyfxrZGDWqzRCkaR
	MJpclq5ElHWEYo1tE5M8ImcTtL5Av075cgv7TaiNmKdFF66XBJ6fwe/TQjrE76cfso4Oj67mcHHAD
	kJAt1XcAykTz6k6gwn8CGWltGg8+Tsymj3SyqOff4r3sSwYtw6Uvl8CZPg+TtHkeVQzEEMXjUJ0hV
	QjU4td9wDp3uo4Bi2PDyqJ8uA1Q1s28MpVNKKe9gIjQNkIEDIFeELyeInNaf+Qt0BhwIeSFE6DAFj
	/a52nVlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsPc-00000002Xlo-3f30;
	Mon, 19 Jan 2026 16:47:32 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhsPa-00000002XlS-1upf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 16:47:31 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-29f1bc40b35so45440145ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 08:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1768841249; x=1769446049; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mb7EXkVeeyYYPDZluNCIirhlK7FHyduzjPpO6/F/48I=;
        b=KBoOJarG8wD6cSwJ2B/eS+/jdHHzf0HnW3yQpkxXGsGObUFWhXatmE/wiJPK8lCSSQ
         qMPJrMYD4xev+G3GADjdN1y61pPQyRki4IHFudUhZ8Kib7dhZrEsSv8JBlwydB2CyjLi
         RkBdL/EYaBGHIXr78c9zxH6AuWdgVS9Ia7d32em7ULTV6py0XHMGrIckabl3waqTRXZm
         JgpRdZNmPGMe2E8bcIwYZ12e87/wik44/G9Tyz3KDEY92FnHlYCKyMnAaBFIrGD4o++J
         0g/hMaxNLdMQiAVDxfZvFHauphmO5FIAVMHLS6dgyl8OApxThy6xwMt1/XcTgZnSwWic
         ztPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768841249; x=1769446049;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mb7EXkVeeyYYPDZluNCIirhlK7FHyduzjPpO6/F/48I=;
        b=MgszisdLmr2YQ8ppEUh2jQPu0M8c7NJOqlfe8jJl6W+YF7lGXk51SfT0E3py7mVBCb
         IJbz+mW4tN9m8MK53juRlr1N+sZEF2VhY/qV4UCwZdvjOKg6MyodyJDFFsmbxBHwEtBn
         vkOuATVk2Y71rkvCbTOjsUWZOUSK9GObrX6iU4SF/Kx8ftOYhcGAAxIRRy00FnxNq0PR
         nD+L1umGCVlqwBD15fv/QtrV2W0G1zNaUhoqOb6r0obbDvGe5ZOQ8PMK5LcSchl168qw
         6yzragYFFASpX8iRuCmRW3BAAJ11+2UOVanTYcbVDu7DHFzRncDHR8mtyfEWOzYM5r7S
         55wA==
X-Forwarded-Encrypted: i=1; AJvYcCXWwI+a+z59/B0PfwuMZrtoU164oKcsF13e/XvKpBqT+RYZng/LWc4qzHC1xBEe/eMpuoW/7yDzKO+5UjtZXaOw@lists.infradead.org
X-Gm-Message-State: AOJu0YxUcB0eHGPXlQmzdLVcc0EjdDd9U9Ah7pzJ6ME653DwhLFDpCz2
	vRp9XGroghmm83msmCVYLdjsM3rjwO6p9EXWZg7p1DCOMUryPEFNR2YOjwqgTFlQHu8=
X-Gm-Gg: AZuq6aLUF0+lohIkSMzTq2fdZ3DwEBBDl8j3087NmbIoZLS0RjLC95QxnxE5rzA7elz
	+WRduKrsonr2JTSeO/n4PvHrZwUMadhFpKlrfqdtSkM66DQtUo0yISoPBhJanhh+/Y74ZNmHGLF
	stgArpoS57EP9J3ewL731QdMDEv14vNdk1c7+M+KDM+ox/TDDetmX7nsLXjnd+L5bhoscjuZ0Ox
	AuYcEFeNKpUztnpNTdCnJGLKkU0nx6POzGTIxkmodrnu4GxPcELfAf18GQsLT0CNUo1shhTzLMZ
	HNLBxwcT0ReYGcX5yN4dQ0+kydLzEp7HqjIfLCpgoXSdHY5oRMOsuKUQUOs151dQt3q88iv2+a+
	/6z6Y65jx2hIfvfKwvHdWG105f2NSgnSiyeJheGzkoqNKhl6m0yB55MLfP+ouNmlBfykEvD3Y8V
	wmMBkyk2VAapCI6HhjhgbdNKlfFrR47PH8GWbUtInbId3p+9FM/gpWIf5p3VsMb+4cZg==
X-Received: by 2002:a17:903:138a:b0:29e:fd60:2cf9 with SMTP id d9443c01a7336-2a7177e0b55mr115393845ad.54.1768841249474;
        Mon, 19 Jan 2026 08:47:29 -0800 (PST)
Received: from smtpclient.apple (c-24-16-26-157.hsd1.wa.comcast.net. [24.16.26.157])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7194164dfsm96897605ad.88.2026.01.19.08.47.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Jan 2026 08:47:29 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v3 3/3] spi: xilinx: use device property accessors.
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
In-Reply-To: <8436e914-429f-40b9-8e6f-ec3b02702cad@sirena.org.uk>
Date: Mon, 19 Jan 2026 08:47:17 -0800
Cc: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michal Simek <michal.simek@amd.com>,
 linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <69F83558-4675-4FC2-8656-BC6E3481AD65@nexthop.ai>
References: <20260119-spi-xilinx-v3-0-4566c33bac0d@nexthop.ai>
 <20260119-spi-xilinx-v3-3-4566c33bac0d@nexthop.ai>
 <8436e914-429f-40b9-8e6f-ec3b02702cad@sirena.org.uk>
To: Mark Brown <broonie@kernel.org>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_084730_507404_99B6AD44 
X-CRM114-Status: UNSURE (   9.71  )
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



> On Jan 19, 2026, at 8:32=E2=80=AFAM, Mark Brown <broonie@kernel.org> =
wrote:
>=20
> On Mon, Jan 19, 2026 at 07:06:24AM +0000, Abdurrahman Hussain via B4 =
Relay wrote:
>=20
>> -		of_property_read_u32(pdev->dev.of_node, =
"xlnx,num-ss-bits",
>> -					  &num_cs);
>> -		ret =3D of_property_read_u32(pdev->dev.of_node,
>> -					   "xlnx,num-transfer-bits",
>> -					   &bits_per_word);
>> +		device_property_read_u32(&pdev->dev, "xlnx,num-ss-bits",
>> +					 &num_cs);
>> +		ret =3D device_property_read_u32(&pdev->dev,
>> +					       "xlnx,num-transfer-bits",
>> +					       &bits_per_word);
>=20
> Are these bindings appropraite for ACPI systems?

Yes, the Xilinx IP blocks are memory mapped and work exactly the same on =
ACPI as they do on DT.=

