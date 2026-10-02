Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90B99CA5FD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 08:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNyEsDdUIjj9QdYmMndkCdcHkWuCIiwfefFpnISO5Vg=; b=DsN91jwuk1ewWS1QiEL8ZMjM2Z
	HQEJLx+vqGGv5081MHaKgaUR3lm4V/VPmFLAsmW88ZlgM4JpUsWROPVD9A1R9REeEWfa6SPvfoTU2
	v8FwmS8WRtbW4hDEn163CqgCZ+sjlz+9PLuZxpXOEwUg9lLbrjHwi7tMXl3CpDXBSeDZ9oYpC1s7r
	wvrFkrNzQjpnsxXmVU9WHQN64VzGx7xLtMjksnu4tocZ4SNGgmntTWfXQX/Osi6emR15P9jM4Ywky
	cQER4Vze1FRUWDnNMnK1j3600qRjRgZYxvZzRN7rGR5ixtaGjzwbQHTXbBz7Iy3rzwm1dh7MHdg63
	iiPNuEKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYgi-0000000Aznt-0Ml5;
	Fri, 02 Oct 2026 08:32:16 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCYgf-0000000Azmu-2q5O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 08:32:15 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d822dso54761715e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 Oct 2026 01:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790929931; x=1791534731; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sNyEsDdUIjj9QdYmMndkCdcHkWuCIiwfefFpnISO5Vg=;
        b=hxg10KLGG1AQCpWghbY7JB7AoOViuri4hSKoyjq7roKCYHydkpQkin50ZlgA1li5iI
         co9bDNwATvJME7sjQO4VwE1upYbbrBTQD6fd/ymf1mSjjczUwz2lBSASKKIZmU1N/rVx
         Hn8KvUaRf9vrvLaAvKrWz3tKckavdzXKCLhUKvT3Xa+DnHnx14c8W6Scfzb3r5flF9oC
         H9Zos/lsRzWyQKybBxzKy37W19F8pKaisLBqzD4xrIfSNiDFv0k8QCxxvlUj3gQf6++U
         GOucg+Y/yb4yZDwpTWwzlhn9vNlfo7oTVAwSF6sah3CHaUZd4p4zPwB6cpBoWEV45nWR
         w9Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790929931; x=1791534731;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNyEsDdUIjj9QdYmMndkCdcHkWuCIiwfefFpnISO5Vg=;
        b=FaazopUMwpmW8VvLFBkaE3eh2yxs/nZzSffe+cS0yeYP9Vst9c69bfvzWpNsP1TUhu
         afAANX4ZOn6FkdWB80CYAUBkEm2PS++PMotBONYVwtsGJT+va0EarYfgRFEnUWijfD+y
         gSw/kdhV+FG2GTwnwWU7PxFNEB/Q9KOaoFj/tZlbrU3Fj3h3hewSQH7DS3HL7tvffeUj
         n/0ZzQl+NGzjbT3fPxx0UDkm/KW+qOoZBtHdTe3lSbHRsHGjIOKFwief7v7HyPrR3OpM
         rbX88XwThxNU3uknZKB4x67r7ja3fldaCKgUXBr2inLuGYkEDNaa38/JKjb67pLOt4Nk
         Eh4g==
X-Forwarded-Encrypted: i=1; AKwUvBxK64VH6S0IzaWC6vtReDZ59uLPk8wW/gagdMMyP4GDkLzyn+FvnTbESjn6rnGUudfJO13MchonlAcjO3pImSSj@lists.infradead.org
X-Gm-Message-State: AFuF++kx/HDEbqCibezlYbx+3Cw4Ena9efx5XchfMykkAARldrg+vfxM
	tcDdi4LueVJ8cn1oApP52UAathlqHjSm44nR+4KMKdgGQBq4cQQsN4Bn
X-Gm-Gg: AYBFou2svUu8bgrBNooXcSke6CZPhksaZmXz6sjJsi+c9Vd8j6neXjWsE3i0BWVJITo
	uPZv/FW/aP4LP5Z3YFIdsajJtP/2oDuKzSTpJt2pRKV/B5d66Prvs782pvQgOZ0IGKubr3YI6bT
	OzcP1GaeZxD6Wz1QqE2pzeziCmr7QT37x+4j/pOXamTiFKlmkVYebwM+rPA7ZSt14fP6JN0LcBk
	H26wFnwcpNW8bBu7V1vzCh9YcvQBwTVY+feT/61ar5Yu27FrehaHRohODhDH5mQwYPxufHrI9Yz
	6yR8g4yVhWSrMw15kPc/8d5fT2gE9pwKFt2XVfRpdEMwaWr9rGrw0igR0kUYZfIoPC2Sa0zncfJ
	os6jrZckTFsdt580BJ3VPoQNNe8K95WYJrJDWzKaYiPlRxqNbVchzHYtGmmcs//h+lescZAvJPd
	/eoH64LsKZdsHdqY8HtKihLAiel2wWSEZODbmbbT0VU/XJrtTQSN7frCf/Xu1QKpV7RNEfPfDEE
	HdUw89uEfZYc3wbWTlMmTJxIMLkVfL4lQoLONvwm45MaS92KnBvJ0C9jdjbMJQLhF5us31D+g==
X-Received: by 2002:a05:600c:2391:b0:4a0:21b9:a55c with SMTP id 5b1f17b1804b1-4a0276a0f7cmr24840835e9.29.1790929930373;
        Fri, 02 Oct 2026 01:32:10 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027da120bsm67567425e9.0.2026.10.02.01.32.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 01:32:09 -0700 (PDT)
Date: Fri, 2 Oct 2026 10:32:08 +0200
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Subject: Re: [PATCH v2 1/6] arm64: dts: freescale: imx8mp-verdin: Add
 Cortex-M7 remoteproc
Message-ID: <ew2g6ra2f7l35e56a3cslv53edmljlxm6d6rflakf2meftmjnz@ig6q45jlf6ms>
References: <20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com>
 <20261001-verdin-imx8mp-hmp-camera-ready-v2-1-7d1343ecd3ec@toradex.com>
 <ar5sBB5VvZPJVrmt@SMW015318>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ar5sBB5VvZPJVrmt@SMW015318>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261002_013213_727291_D28D8D39 
X-CRM114-Status: GOOD (  12.83  )
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

On Thu, Oct 01, 2026 at 09:19:48AM -0500, Frank Li wrote:
> On Thu, Oct 01, 2026 at 01:44:09PM +0200, Ernest Van Hoecke wrote:
> > From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> >
> > Describe the Cortex-M7 remote processor available on the Verdin iMX8M
> > Plus SoM.
> >
> > Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
> > ---
> 
> This indepedent part. suggest send as sperated patch. This time, I can pick
> this one firstly.
> 
> Frank
> 

Hi Frank,

Okay, I will send a separate series for this part with the needed edits.

Ernest


