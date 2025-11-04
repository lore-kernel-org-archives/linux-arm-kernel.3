Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AFABCCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 23:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7z8AC+yiHAIwmarbixp3f4qrcLuRr1Vhyqm82NW6W2M=; b=FAU68aGiI3l3Fxtit2sKJwW+dR
	CNtbYwoK141TKR55d1BNiWyuAGxketcJj6/I5uZgxHAHwhHgFKM7kqDpxTsF/3aFSD1rSUGki8+rC
	OUuwEmUewQMQ71UL+JyrkL6mjBMHgKHP8EJFooNkhXIZWv8ajwfTU8E3C+yIKY+MBBfg/VookazHA
	MA+J2QdAleqRJvjCFSOYoafIZ5Littof6tjGDn+dOoRslxSKCTXTgzDUAlMshY2F//hZWVp2c44a5
	xJMJTx/9t2C/hUHgZFjYkJYBQi8kTG/q9HzpxXf/acig9Up6NvCxxFwvyJZLA7crpCeI9igNJwNVn
	BMEVXmlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGQ7H-0000000CjDj-1L50;
	Tue, 04 Nov 2025 23:07:07 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGQ7D-0000000CjCX-1jgv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 23:07:04 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-79af647cef2so5668810b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Nov 2025 15:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1762297622; x=1762902422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7z8AC+yiHAIwmarbixp3f4qrcLuRr1Vhyqm82NW6W2M=;
        b=08XmNY1Sk3N+E9lpXo+kPpgv3LENLHcv6y3m0BGf3MyMK6aSrDZR5Niwysqv4lxMF+
         CDDCKb2Vbe4OBYMc+zTFmnHe4udLTAYS9BZWOmNshw3iT2200OANS7OUZcYb1is77qPc
         z3s5krkPp/vqBrB/a6np6x/58p1W+DDmEvitOGpCSYCx1K2xcBhEwr8Qx7u7Y5e6W2QF
         sXnV70+IxR0pX9WhBLg94wqZjwg9VomcJknmrCpNPQlnDNAU0K0l9Ve8+jy8HxyVyAfS
         4aPxLwQghmtumSkyVNbSihmvGi1E6rUwHVFjJJMWdkj2pcdgx191RAa1GdUyXsRR44FC
         0dMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762297622; x=1762902422;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7z8AC+yiHAIwmarbixp3f4qrcLuRr1Vhyqm82NW6W2M=;
        b=P9PRWFh463kTDZFjQsd7ejZ9fhSc17TecSUGstiso/ycnPzDTjPZma3BP569U5pkx8
         40A5cubTHErK9fqrdz+Ap43ABRRQLzCJlfzu6zym3ZKzEx7lwCZZRuXEZF3sOB5Un5EF
         sCapkUwH9nXqi/+1cIrgMX7YGYcNgY/rsMAAYrh6v2WXPmiZ8s/KccOuyM58BOhIO40h
         qs5pE8cO1b9U3kqffYiniYsdG5MLn2WRFTEHoZteIwdam/D/x9YIIUyuD1Wn7ckWEcOa
         fMYMINzKnpprptvRsgomKCLFj5dheT92lFu+12nhRpMz/UpvOVU4/ct9sJU6DHPTMpzz
         N4Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWGUModNOUL/YdTBL1GvdymtkkdirFUudjF0uV0q2ojlSvHOC4Whbj3CfsrFSpvjmjj8BXFoGbVI32vS6Rmufrj@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8NKdWptOTvfb53PuU3FxoITUL1Tu+1rKFzLyRCloCbhw5gAgt
	BLrnnLiheDufotpC6h/+mx6EDbO3TqVgcbcawIuFfCvPZKk185ViWDAkOfsHeyslH9E=
X-Gm-Gg: ASbGncvclFnhNfALxsoX/xLJJJXLrTn0jyLgvv1fmDTW7nNmwEbwSA/Tp8iafwyH+qE
	Z8zDtgFcGE88IsB7ALRlGogLICxlvvctU866UqY7u+OVY23MzwGdXXKPXEDywYoZijY+A4A9Tcx
	Mm1gte4gYcCyGqUtFAWiSogii+ePYAY+uzc5XDmM/UIe7de6KXB1CAD6K13qRfow8Gy+ySDDIqd
	VRSRGYliAbTwXuJfHFt+100CJzuKDrnPjepmbeqDU3LaYI9cPTKJ+EZqUKwSHbhl6FGPsh8sxFc
	6Oj5/AKwZLy8ow/vB9FFgnBGx2LD7aQX7ozmx/D2lLE7yFpBN5uLE8TOaBsI8X/B7fRFnFfxZRQ
	EsOyCDpiMIaBdAGaxowtNBqwqGOJHLPxNCwf6lRnJjprKHOXEWO34CZ6U3No9tzvACGr4qlk3/w
	==
X-Google-Smtp-Source: AGHT+IEmNKJYP343ceTj40sn2ysBbxZxF2rHm3xoHDdRm81PPZZipomUwb5FT4ZE7dqDQV5SPUTNhQ==
X-Received: by 2002:a05:6a21:32a2:b0:2ff:3752:8375 with SMTP id adf61e73a8af0-34f85f23b25mr1132220637.45.1762297622638;
        Tue, 04 Nov 2025 15:07:02 -0800 (PST)
Received: from localhost ([71.212.208.158])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd633bf6bsm4132570b3a.56.2025.11.04.15.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 15:07:02 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: nm@ti.com, vigneshr@ti.com, aaro.koskinen@iki.fi, andreas@kemnade.info, 
 rogerq@kernel.org, tony@atomide.com, Parvathi Pudi <parvathi@couthit.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, danishanwar@ti.com, pratheesh@ti.com, 
 j-rameshbabu@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com, 
 krishna@couthit.com, mohan@couthit.com, pmohan@couthit.com, 
 basharath@couthit.com
In-Reply-To: <20251103125451.1679404-1-parvathi@couthit.com>
References: <20251103125451.1679404-1-parvathi@couthit.com>
Subject: Re: [RESEND PATCH] ARM: multi_v7_defconfig: Enable TI PRU Ethernet
 driver
Message-Id: <176229762178.2840692.4781785513910576373.b4-ty@baylibre.com>
Date: Tue, 04 Nov 2025 15:07:01 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-56183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_150703_479774_7700EC9A 
X-CRM114-Status: UNSURE (   7.90  )
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


On Mon, 03 Nov 2025 18:24:51 +0530, Parvathi Pudi wrote:
> The Programmable Real-time Unit and Industrial Communication Subsystem
> Megabit (ICSSM) is a microcontroller subsystem in TI SoCs such as
> AM57x, AM437x, and AM335x. It provides real-time processing
> capabilities for industrial communication and custom peripheral interfaces.
> 
> Currently, EVMs based on AM57x, AM437x, and AM335x use the ICSSM driver
> for PRU-based Ethernet functionality.
> 
> [...]

Applied, thanks!

[1/1] ARM: multi_v7_defconfig: Enable TI PRU Ethernet driver
      commit: 7d9ebbffc545033897aeb30f2a0a45ead1668bf1

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>


