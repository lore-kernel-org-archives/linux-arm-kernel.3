Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384D3C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Jun 2025 01:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6UAiWn8Pi1tnpIPR4P9XJoko/ztItX7ideDEdvEYdzk=; b=wPLs/45b74KDOd2JpLHjk/arfO
	gc7WVdLICmkE2AT1YEUBnuHwYmiYwuAsnOS72DOJltaVnqrSLjahLPUiHpz7znmZ6/ItgVPd8JcWl
	Lk48IOIPEh/mGJFOtKjymlHjR5tzSYbm97skCS7KM+tUViUjKVGtPBbmRk9FuY0D1MkeGbd+4BUmV
	SHSPr4/S3Z/VivO/1xij+TsHkFDuOpsbntiFNPD8NBhYTtKSPoT9esaxZi2jy+7JK+tV0zAk3RqTc
	5FLTm+x/QSwEr9PHd5WCJBHUUY9bBAHKFPU0uOr9sWmtb72YwGs5TZKUu4bju24t2VfxxZCyWgfx1
	T2vGxeow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVJxk-0000000G7EW-1FoT;
	Sat, 28 Jun 2025 01:02:36 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVJun-0000000G703-3sr5
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Jun 2025 00:59:35 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-234d3261631so20061905ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Jun 2025 17:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751072373; x=1751677173; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6UAiWn8Pi1tnpIPR4P9XJoko/ztItX7ideDEdvEYdzk=;
        b=Q+yPjea+BCzzLarCfDRvgCc3OB+8RbEk2DkoPjKRQ/xixM3A8moWl0BUbSXoHFXklB
         DJs728boJt+/UXwnYhQIp+xPOMO3y5i4487pRRBXz+8BGfNvA4yDoYTKfC0HdEn3BuRy
         jOZA9vlvWmvgTgkPJNSM+6RsWi0TRwAX4vLXeF8d6TMCY2oReM3T1kOa8Jbc8OmJkqRG
         OiVLuvI9lfRprbubyU1oXF4kM6R5MGoO7V6yoH+N3RJCWZQXJbssMqFf+mNOTyST634Z
         DknUEICjCA3bKcqKJ4/EtsL3P+eSRoW1M1AQ7QC5fR2lXrQq1adx0zIdIUp64IYo3ePp
         5x/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751072373; x=1751677173;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6UAiWn8Pi1tnpIPR4P9XJoko/ztItX7ideDEdvEYdzk=;
        b=IIr0yzHOCd/X/oWxy97Sj+xG7lhxxzohHZgtZfQGDeJjhX3EUJQW8fkZZjTmGcy9K+
         rKEME5N4nmQegHo4LSWd1/DiJQtFxLLGo4FlBANFAplJdwutiSW+lQjr97ghHluB1ibp
         CJ3T3gN/OHGjk7I6FaTzKjyXh4rxAQbHx7+b1hlcYOF9v6phac73mAjQ0qhEzJLoBjxn
         MGO9HNvL3px1HmmFKLocxA7Me2iXoT6hxfviUVUVDB5MsYsbRUwDmREjMqB+rwufCf+j
         F248J1mHN/MwtrkWt/FJWVSlNtFgVxdqwBWtJGXzSZy8JyjFCcSvekGug1O05TAvxE5a
         ub9w==
X-Forwarded-Encrypted: i=1; AJvYcCU0h8e2RUP1tygrzn3tNnh5lCHac53BTITlfjmk6Jv7XJqd447X39pI1ZiLUSEpwlTmuswovutACkc3mUZPrbe+@lists.infradead.org
X-Gm-Message-State: AOJu0YzNVK0C8F/NUhWw9grgNO/zNWIBlQIHrKtqLAJ935y733fpjoR/
	aPyZM/uLVDfjMnWfX81uvg3+n+8QJMtj+UQYAax6/y64gW7fn7b0fR0v
X-Gm-Gg: ASbGncvcUu0wPLggkR4aRjAGGaPBvtXN7eTBYeIiBJs6HwDheGLWFe+xJb9mvuscRVe
	Y3000968NJIZU8dHYf7Ml8WpB0UseaG/UbDX05yRFrVfJKXbpeJHlMv97SKeXUSWQNstecVs9n1
	lApvWflt35gM6kaexWiPN8EnG005fHIuE2XLIA8tgfF4M0o+fxCO2d6PIUbCKaMX95mhZ6yAlfm
	JQ9YMOoKSBs5lU396bc7gyP+8VxPMKYOCZfsiYEmN4jjij+iC4uesEqnzgCmIbd+741Zll4r+0s
	u5OSnPdFXOCiZeBOu81/8+t+od9G92h0p3dOZoneSmpjczJJ5s1567fQsLb6iw==
X-Google-Smtp-Source: AGHT+IER8/+9/mIH4JWCr3PocAX0QsvyiFc1zROda2UNkXjcMckY1zi+itiyjtz9p4IRpOfqlqJ/JA==
X-Received: by 2002:a17:903:32c8:b0:235:2e0:aa9 with SMTP id d9443c01a7336-23ac45d5f4amr79376735ad.14.1751072372489;
        Fri, 27 Jun 2025 17:59:32 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:d0c7:d92:6a17:eb62])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb2e39f7sm25732775ad.49.2025.06.27.17.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 17:59:32 -0700 (PDT)
Date: Fri, 27 Jun 2025 17:59:29 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/LPC32XX SOC SUPPORT" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: input: touchscreen: convert
 lpc32xx-tsc.txt to yaml format
Message-ID: <fw5kqv74vubn5wiarcq767v3aalxnoc7qosg3ao6gchijp7d5w@37vkon4mmnwh>
References: <20250625163431.2543597-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625163431.2543597-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_175933_967600_C83FF1B0 
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

On Wed, Jun 25, 2025 at 12:34:28PM -0400, Frank Li wrote:
> Convert lpc32xx-tsc.txt to yaml format.
> 
> Additional changes:
> - add clocks and put it into required list to match existed lpc32xx.dtsi.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thank you.

-- 
Dmitry

