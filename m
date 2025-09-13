Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B24ECAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Sep 2025 21:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iywYQxRz9CS7up3Rb4XVNLQEC9bvPlsrkIVlIPpDzfw=; b=SBaw0+6bu2JEyZK1cK6gTuk/ib
	3niUyBLXgV8McIbwoNlmPIGMX57TXiK7mavlDpESEWdXxD5T4gV6sVqo80MjxNixwO7FMr8wv5G/b
	CBfTIb95XiuNtGarTAHTEvEEiTSWLNwBHDt39noRGf0fkbJZ8CELTCELlyjXgtFZJl1/Yw1mGoLeN
	Pxy4OHtv3AxK6Q386h5YhR/SyWA6oPo0cOriyAdauZsfGj+YjTWT5smX5WvtlX560iM9caYmqMIQw
	Nysc5XGQ1ZFhiN22DRB7CnDJrBTMe1j2gUBfs6ehNYOmZlHVZX6o9jgkQgsbw5vP06tpiDM63NOQ/
	eh7drU2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXi6-0000000GKfj-448A;
	Sat, 13 Sep 2025 21:23:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXi4-0000000GKeX-2uON
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Sep 2025 21:23:05 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-45dd505a1dfso24400655e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Sep 2025 14:23:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757798583; x=1758403383; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iywYQxRz9CS7up3Rb4XVNLQEC9bvPlsrkIVlIPpDzfw=;
        b=cy8bHEwEVd9OAvr4HetfjS8c5kqVkxunI7tIKGCoaBXqy1W/Yi+UfxcbGwomrgPIIQ
         pKrb5Tu4qdsTntKxiS7LJmjXO7xPf1kRPo03lc4j7ddtylZ8YXmBWbGI0OO/bgTx2etl
         4d4HYFWT0iEyJVvHcLWb0mOlDscvTGHF/7TocsTitfupghWrxcWc0keZBYZ2RIFD8YIR
         4eMMmQvZTeNb8Q413lurEzmz8FM1WV+B5Yal2ilNnX5dDSAhawiQOK6oyGZJpZVft37Y
         B6jUGnDbp2B2NVTRvxegEd+PbbAM7lAJ/md5S/E/jYiL6CbQVtvAMl6iE4BFLY5YxFem
         lICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757798583; x=1758403383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iywYQxRz9CS7up3Rb4XVNLQEC9bvPlsrkIVlIPpDzfw=;
        b=HUgx80vH+H/SfFnTJ6KdxX3Tvr1zRqlAWKvjBtvP1T2ZJBhjTKvjSGpODx+jpIeSsn
         9uGpr45WcZBkLwcXGTaKKHbePBDc9uxdJw+Li1DhCAd0fRMMN2XDBR43T0e4xcQn2irc
         gyu+6ih/9qhNBHz1pcU/3vn4G+yAhydDAtLYq3BNu3c2wUTkZawEwE4t4LpOAmZ1WOLk
         cH+sAFiTNrqiPPnhKD6DFCADhO6D2BHlEfKtxSU6IluRB1X67TthMFq8wiqRNPAhJeXd
         GVacSST+Qh/xhH9D5LjoJCcAFeUl5+F2NY8dBBOyDP/pEPfOGR91XN+vV7WSaXDAFYT4
         dbjw==
X-Forwarded-Encrypted: i=1; AJvYcCVUi+MHsr21C5u9ZshamT9pDOMKYByH5sSN8+gNmsXOndVrtb5+jvm2gsZsXN+qxrkWA/Yh+fVfegRz3lzYWpvN@lists.infradead.org
X-Gm-Message-State: AOJu0YwBw0A3V9zcxGZlOUH9ILH81UFp5tW4PfdoAPBbxGAKoowVo41X
	MkQ1ppL3e4DAVG4S1ofODpLRtfRcSmOMnlaW38x5BA7rZ/FtqoDqTIq9
X-Gm-Gg: ASbGncttxqNFEiV8p49Aqu/n3jYFkAhMX56R2otu8wLCrZY8P53vvBI054NN2hRBwzs
	NssMHiY6zNrtP5tUYebwO/YRdAlWvYh4YJvWydAUatqIMU4u+ce2wDtw/oOtH2/qBdJGzLE1Wai
	hoW2tZD8LvLMVAe15IJsbNaxttwtHi9DDAt3rUhf8VSieh7Yr9sOP7Ho9bdB29bg5pKRvxrB0YK
	YrGHAgyyoSpLDpShUV3C1k8ZkbL0g824EGv0In4o2q+vXDpQY3NRjE2/Uly2teobFDJAaPQ86/S
	1+VfMic5VdMMULq/Dhnr7DWppQGF7OeOa7NmEHzlk7iJzGYVVVCz+dYGb6agujGRis8R4t1fkWs
	fNFulWxyQsscKyMc1Hi3pXLIAR5Y67DU3x5yeu4SlLEgfq/3I
X-Google-Smtp-Source: AGHT+IEW20rf2hIhimdxJS1T6kk93raCiCsoiaFO2LWxY/a237S3KFMKKEA8B3zumhUKy7Hqe0S/gA==
X-Received: by 2002:a05:600c:605a:b0:45d:d353:a491 with SMTP id 5b1f17b1804b1-45f211cb5c2mr51983385e9.1.1757798582965;
        Sat, 13 Sep 2025 14:23:02 -0700 (PDT)
Received: from radijator.localnet ([93.140.65.23])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45e016b5c5dsm114475115e9.14.2025.09.13.14.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Sep 2025 14:23:02 -0700 (PDT)
From: Duje =?UTF-8?B?TWloYW5vdmnEhw==?= <dujemihanovic32@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
 Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: Karel Balej <balejk@matfyz.cz>, David Wronek <david@mainlining.org>,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH RESEND 0/9] samsung,coreprimevelte DTS additions
Date: Sat, 13 Sep 2025 23:23:00 +0200
Message-ID: <12753058.O9o76ZdvQC@radijator>
In-Reply-To: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
References: <20250913-pxa1908-dts-v1-0-8120cdc969b8@dujemihanovic.xyz>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_142304_738426_4ED16739 
X-CRM114-Status: UNSURE (   6.77  )
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

Resent due to mail server issues with the initial send.

Regards,
--
Duje



