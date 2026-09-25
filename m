Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEEEC98318
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 03:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f3w6EdTSd+zhzF1B+kjGs8/3o2x5L8y3XOkHxN1oQgQ=; b=H/c62LEBIQYpq3ZyqCE5V7U4GE
	L6arppcXEOw7mIfhqbimiyDPwdXFQ7oYfQ87vowAiTXNQY4MdtgrqF3jA09/Yn4vZwvMX73tG+bKt
	PtDKmVzN+iFZMI7UNWWxtsJuWvZAV70bDefnYbVj4T3BuI4UBmlC8nE40M3AyVMz8kcdcSvv5g/57
	4SOIVFTghU/kYSBdNuhrU/i813xWpA0+0puDQ0f1YbZLhho6jpt4fKeLkfJmzzueaUI1wTuHGUEbz
	k4KXFGVXg2KhYqS2p1NpcSQlmIqDXSW41ln93L6uvnrM1wakB+I5oCB5/24zoymdc8upltMBLTXPi
	CfInf+pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9wLw-0000000CZEB-3S6w;
	Fri, 25 Sep 2026 03:12:00 +0000
Received: from mail-pz2-x0d.google.com ([2607:f8b0:4864:3b::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9wLt-0000000CZDq-1oLz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 03:11:58 +0000
Received: by mail-pz2-x0d.google.com with SMTP id d2e1a72fcca58-86b90133ae8so267271b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Sep 2026 20:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790305916; x=1790910716; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=f3w6EdTSd+zhzF1B+kjGs8/3o2x5L8y3XOkHxN1oQgQ=;
        b=P3cOS9LqWD7gkLGZ1JhWawDElPR+K457p+u89uKQ2NaJepzODKG2/nTVyI9K3u/Eae
         wyJ2xZ1hdUmA6DmWH3AB18Nz/foQAZpgP4TIjndhnqJbLzez57SDvKjhNKtjnbOreQ61
         7UT14Ffz7sQiDW2tT/UzR1xAneXVws52XyfmMSg5wTlpT5thTWkGPPsvosqxQ24s4/vC
         zFvwfjvSjTlX4UnRM9IvDNQFIMEzPBZTJizLbeI4giIpkmad0AdK7m8pGUe01vOUMkZr
         VY9MKZzXg205nZcguvpCd4CAa94rD04QRBgqkaG8wJVN+rVRRFWSVE3Nw/HZt8Yra9LN
         JZgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790305916; x=1790910716;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f3w6EdTSd+zhzF1B+kjGs8/3o2x5L8y3XOkHxN1oQgQ=;
        b=KlZHxkKH8wLqGibKNUZzG374kS9XwVs23+NV23hZ5C5h/CHeN3kGeLRXMBpLp9kFr0
         6k8FG9UJzQHKmzMGe0oIIM9xzixcDDYSVGG4w1J6Iq3PCzJ3PzkLW+LhV2oo/J9vZ/Yf
         PUFMzkkq0hW43f23G2jSG2t9oFXDw4epZu3Hha/8yrs3ZgxKhk3fltwJHtnP+7ky9L42
         MCvmnT3/c7KArnqI2H6BDcWCQoyfRte1FcTW/1YJ6o/4w2ltk2IzZKLJTSrJVQcqcfR0
         RzGKWxkJGIu64hzMx9i4ctcR3+UzbKWXyoqd+Htk/ziOHhZip/PB3uvlBE8FU54FiQ1v
         kkJw==
X-Forwarded-Encrypted: i=1; AKwUvBzZJLtnedKYUORhhncVZfN8g6pRYnhUI9pNRgbZXm7GF6MtMxfeBuG5r8j+3BDeStFY0nyUPRIyiIgey603hFXO@lists.infradead.org
X-Gm-Message-State: AFuF++lzV+/FWIDf2U9QTPPKLk6R3gyIRevSPTC93uvvrajGMaudeg5l
	YjnQCjvKFZnxNNnF3bdgJBDmxASK5gr3YPGqrdayJEybGxkWmXIM1ihL
X-Gm-Gg: AYBFou1vxjqgy5dRIIwRP6nmhMlCmLDYSrk7q1EnCCi7sV429R+ALIpZho53ugOvkm3
	67+I1aUsRFpL/Qf5IL55KAtknkwMZDGuWxnG6AmGXQq82yxb5Pv+yGqsWLTYT5xyKzj4md+nCHP
	9IoCSilDpRPKHeWKirIYnmNE1dFN2SRksL0+KZ7inh2K79vImw1BUWnXKuz2r3kTgNRf1vgiu3J
	eKrUP7Yys1e6vv2CzgP+pSNNigBK+cnyY9bw+UOeI63m3gBKfWXExKUEbX6Wjc8DYtwDOSz1rDt
	+F2HtOO4hZVAbLh388K3oLqONy2fH/a6cqR/A4cVNFZBX99hLm7m7h0rDAoess5cTR8rR4jYlz3
	dgJEaOvy2v2B532Nw7C81Y0zD/KHp13TkLiKe6kI/ame7CMnD+41W4DF107IP2aoCD9CAEMFbqm
	hEzw/ycy92TvABLeh8BoSJqC73aDxqD/8k0Jg0GE9kReq9r4C/US9/MwK+dABvEHUqXcL4hWaMn
	iLCoGmkNI/E
X-Received: by 2002:a05:6a00:b4a:b0:857:7384:b5fd with SMTP id d2e1a72fcca58-87e9995cfdamr3809048b3a.25.1790305915932;
        Thu, 24 Sep 2026 20:11:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87fe82eb49asm408300b3a.3.2026.09.24.20.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 20:11:55 -0700 (PDT)
Date: Thu, 24 Sep 2026 20:11:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 5/7] dt-bindings: watchdog: apple,wdt: Add t8140
 compatible
Message-ID: <381005d6-0aca-4d71-a08c-58aa7da7196a@roeck-us.net>
References: <20260924-apple-a18-pro-initial-devicetrees-v3-0-94f7ea52cc64@cyberchaos.dev>
 <20260924-apple-a18-pro-initial-devicetrees-v3-5-94f7ea52cc64@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-apple-a18-pro-initial-devicetrees-v3-5-94f7ea52cc64@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_201157_474559_ED3709CB 
X-CRM114-Status: UNSURE (   9.73  )
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

On Thu, Sep 24, 2026 at 04:17:09PM +0200, Yureka Lilian wrote:
> The watchdog on the Apple t8140 (A18 Pro) SoC is compatible with the
> M1-M4 SoCs. Add "apple,t8140-wdt" as SoC specific compatible.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Applied.

Thanks,
Guenter

