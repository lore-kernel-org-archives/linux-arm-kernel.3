Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A330210A1E7C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 11:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JL83gbLudZtH8CT7uiZfcAOnl7OPRgnYQKRWmn1MAfI=; b=YI4CtlAFxcEUnNCMC5p0KiV7WT
	9Xy2d5gVtbzrWQttWKpyyqgS/9RwHkxg1Z4yFMBGREZ5MMqeOfxGxwGNvqEdbRNFbgMEzJlKb7b7K
	0QKS6qVOIBeJKCu9mWHutr/Yxe1UngSFl/BWVeASzQEcZKdrHCYwBuT2/lMpIOHC6DkmRT9z8joKk
	P9bPUWBrZvgcMlkBc511/wmn4sO52wgdjGP+AiMck0qceFSOkQKd8DIegugWAg7BqW8gq04Ut0TIG
	tgW+lGWsKpjeIy8mngbrR1ic0ePub1DmhJpdIcBMJGZsMg0qGWF1/P2g6SMCQXXADSq44fh7MXJW+
	Fsk1hqqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5j3j-00000005NEQ-0pn1;
	Thu, 26 Mar 2026 11:39:31 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5j3h-00000005NE4-0cOK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 11:39:30 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5a1307438ddso988234e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 04:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774525167; x=1775129967; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JL83gbLudZtH8CT7uiZfcAOnl7OPRgnYQKRWmn1MAfI=;
        b=ZNwOu0LHqTIjvoQITT9L91F17tg1m2CrqctOwAjV7afkjN1IoKzLRaEHR0yzoVo+O2
         TRYT6eHBXiFCuP6GUvXErPWXnRzpMOndY6vs2gVxdx+UTjctuHFefiKyG/dpuhLMzVA1
         NPpXQvaFEhxEavZtQlvwQaEMxlQ1kIEZL/nA0wkfIuYLMlstKRu2/1JnjiXWq5Jiyf86
         mONH7VmGUMGkKE5rA5t95kcFWKFMF8kZKDm05/eF555AdWSwEN923ry2ZFHb6dPP8ZgG
         TzbN+K8fb+hoFrzscuxa6dcyFmVlYzPB99n1vBUCyiJbigeZj29ETzD9VMI+HhuhRhI1
         q8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774525167; x=1775129967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JL83gbLudZtH8CT7uiZfcAOnl7OPRgnYQKRWmn1MAfI=;
        b=bOjdWSPxbRUt3L61Cr6o/FwZLBzKxMlOMdycciKzaEzsq+7v1KdsY5HBD1cOgYqMuC
         PPu3Rz2+nkbpEPaLpAsHF11uWACvBdQD8pR1AHfY0ClktarebiiVy6cQOFNOnpL84JoT
         S4uIQVEqz4a7jTNGodJz4ioZq7fV6rDQzSZVqaYrBYvu6xLt0rj65z3+JUu6KzZfjNXT
         e0iBSDacGOsxKXFIoK/xNaZdwgINcco3Vks8RwrvGQj3ilWUCSpAOFaZYFzlZBqW6+oL
         wbFMphC1AJgTkskyZhS5PFisghnDKvfQThGcMrcd+sExxghiiQ1jtvw4ZClaqF3jHRij
         YDoA==
X-Forwarded-Encrypted: i=1; AJvYcCXnIPz7bkjhSaEVN94pjtXY/CqlLwIgad0PxOSLgU+wkqtlSlqjKFHptZTr9wKs2r1mZ3zRH63fTpGixKInscMg@lists.infradead.org
X-Gm-Message-State: AOJu0YzzkXT39IBbIWRMSLq1iCcawHMRTTxgofYCanGcRK+2cTlUkd02
	ZdM1YS5dxYqjWz/BWmvytQZ4rKNdx7dsK+Q3jX5AfpNnXjcapVkRPMbAazhxBngM
X-Gm-Gg: ATEYQzy+UdgQNbwQ1lGQbCv+Rk7EMYGq65u2a7NaJqrXsmYNNKH3VXPlIjnvX4y6yFx
	mVeEasR4OftGdwGm96e5cHMT9ZqsFkSgmPaNfut9aQUU5tMII7REJcF16Ce7g0GgtIQQxZ535yC
	fe10m1HTBx40EGoufSgkMFRgD51JXhCzTC76CyFtWrsdo/ABC4jZDMAFIhoss9fvEpTQMrX+y0H
	RO2EexVkWaPJyYFn74jeZf980BH73O+iEcD3k+x3kPS6JfqcR0UOMtnUML9LObhyQJKkBxiTG+A
	GFDM46xXKfrrDV1tolk6bK9xZsJE/eMSyiFpVvWOR/xDld3BOJh++CcAipWRJt1P8AEqxO0rm5x
	8JuRpGmPxpCHD5pF8TIAiGC0MS8yUDupW7N8ALXILKEpuey0LZ2/zdUs7wj0W/E5ohN0MdaW2P2
	jEvzw8G6iFV+1+X1gzPCXJnwi1QAqeSXlpkbp0gNxqIGTz7kS/uRTqCQzXJyOWfwWWsM9jX3I=
X-Received: by 2002:a05:6512:2254:b0:5a2:a5a1:4732 with SMTP id 2adb3069b0e04-5a2a5a147e0mr437733e87.5.1774525166301;
        Thu, 26 Mar 2026 04:39:26 -0700 (PDT)
Received: from gmail.com (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2a063dcc3sm546963e87.7.2026.03.26.04.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 04:39:25 -0700 (PDT)
Date: Thu, 26 Mar 2026 12:39:23 +0100
From: Marcus Folkesson <marcus.folkesson@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Rosin <peda@axentia.se>,
	Michael Hennerich <michael.hennerich@analog.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v9 2/5] i2c: mux: add support for per channel bus
 frequency
Message-ID: <acUa61a_XIuoOobd@gmail.com>
References: <20260324-i2c-mux-v9-0-5292b0608243@gmail.com>
 <20260324-i2c-mux-v9-2-5292b0608243@gmail.com>
 <acKbYhbwZzv2gTnB@ashevche-desk.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <acKbYhbwZzv2gTnB@ashevche-desk.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_043929_195206_2FAED1D5 
X-CRM114-Status: GOOD (  12.92  )
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

On Tue, Mar 24, 2026 at 04:10:42PM +0200, Andy Shevchenko wrote:

[...]
>=20
> ...
>=20
> > +		of_property_read_u32(child, "clock-frequency", &priv->adap.clock_hz);
>=20
> Wondering if we may use existing API to get i2c timings from fw descripti=
on?
> i2c_parse_fw_timings() (it might be that it needs to be split for pure fw=
node
> one and device wrapped).

I like the idea, even if I don't see that many other parts of the
kernel will be using it.

After this patchset, I intend to make all other bus drivers use
i2c_parse_fw_timings() for fetching their clock frequency. I will
investigate the splitup in the scope of that series.

>=20
> --=20
> With Best Regards,
> Andy Shevchenko
>=20

Best regards,
Marcus Folkesson

