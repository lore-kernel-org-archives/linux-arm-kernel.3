Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D73D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Dec 2025 14:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P3Udye7A+1mJEIOEFZOxhVuAe/sJ9GEaxJR6U/sqIe4=; b=xStXJzNkE9DfsxnuRfw0fYg+1B
	3nOZOGYIS/Gtmzd4kQKU1PXTdDjXmSGxCx4FTw5xaw7plm8s7RZXvRCOydsc9hB1FErlRsb3elx82
	Pnw7FU3usoTVFbHv8gqBrZhsrUSgkD80mGoEhNURTCHLE4EYFyB8g9FfvJW8eK+dPQ8t7zk+hd0gc
	W2NHJErIshMq5uJ5SZYGA8tm/w1X6346K998v5M9nIW2fkCUh/nmJ1LkAbSlG42g5WlIov6CjzzD9
	t8sEQj0aJrkyFTLqgNNU6djlKPsWdTfkAyXzWDvZXl4+xxmBti5R/ZTgc6TiO96ez+eh8tg0B7MId
	g7HiaUEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ4wP-000000045P4-1PTE;
	Mon, 01 Dec 2025 14:31:49 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ4wM-000000045Oh-1fCL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Dec 2025 14:31:47 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4779cb0a33fso44183975e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Dec 2025 06:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764599504; x=1765204304; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P3Udye7A+1mJEIOEFZOxhVuAe/sJ9GEaxJR6U/sqIe4=;
        b=CcRY/zdW5yeRB3A/8fYQ+ysL5Oxygn6DPQ1fSuMNqitsMP/KM1xFoEA9zJWknY8Hom
         zQpqV6R63A+DKTBmwck0adzLgBG2kyZcjxttpg4uoVS4lMXPaIb390a2l4ka7e4iCBm1
         SplLd9I6pgUt9zu8A/1H7ztfejXyPtFWHmRSg6WsPE3dmzxIk3HpUqWAE+CGG6ISBEge
         WEuwzUXuU0kTjnnNqQHRZyqow2IBFfiF/iVaZ2dCXuZei7PaaHLp9/tHkGykChmzCwqc
         wnICoTx7xW+goJRehafMeFcmdLLbuaPQ2QSZ551YAqyOQh0x719sFSrqjZlmj9k6dSTX
         jfKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764599504; x=1765204304;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3Udye7A+1mJEIOEFZOxhVuAe/sJ9GEaxJR6U/sqIe4=;
        b=PFRZrQaNQXHnQ4mirdHeq/hP/eMJo6HHLpctI+CkCo5785mZPe0tkPqVMVr6/gqszS
         CedAyq/cWswnJmbEhPOHCF2RcJ4iu1dIDmnVfMZ9WrMLlP6w9CKckY03K4W78uJMVJbi
         FGU4Yowi4zmSRODqYN3GaHZcfG6KNBvWMRhAyKi5sc5TTcdBv9Xv5xC/19AgVbXUAbpb
         Pfeyo0wzDgOWJSqlpWl9wzdPU2PGDZfHntt5x4tamXv6ZCGb5ZqMMzjnD8SIJ7eBboOH
         NXm3grdOGK5w+7T1T+QJFKcKGj9aoN6eQCZFlLM/jGaa9OmT/ybP51iJ4R8f7fUe14Mq
         tOUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXkaYsBXEYwzUtHWGppyc169k1uhyfaFUJdOJyEviIWcF2SKBhqLcrhB5lvGiGZSB4jgLigTSPHm+1tzlNa78N@lists.infradead.org
X-Gm-Message-State: AOJu0YwKZ2AfvrG/mprDq8x/3z5F0deQMPwJ6uRNrRErMStKcDwsJpqy
	C4IyiR1ZnwGqYU2sj2+MF+3p6i07GhMKrFyaoU/UeuXYzGWU/F7HAKvCZ4vxxTNAOj8=
X-Gm-Gg: ASbGncuu29+3SpM76E/W4Y3cvD/vJTWEEUL+/vpMeV8nN/BC1yq9IIe/8ewOSWW0k9U
	lkror3oRRhf9+ABj2RRBH1n4Rpb4jCgziF2Clc4HJjsrZg99z1gv/+8i7kD2ehP5i0rl8u3r1WQ
	iqmZXGEtmQgSm6MhmExXKYs19wWpLh7ST5TrqdQsm/GL5JPOkezJYUB66sQxUChSHAVP51nRxBS
	t+hvsKPu4KGyyQveqUjEBcon7KGPzi6Ea9NZMKWwQPxtoGzgHjEZxZqD2qprY2BBKmFxcdoAAtV
	IJ5Cf5Pe/mrihzA6ZjOvar4OJ2CdiaKvFH8aDkVh9P8r9u+bZJYsICb1RH/u3fZ0TRxvA4f9Qeo
	uqwHXKuVaFxIJItSgzt120VmroDwptiaIPR1gUMJuHW7L/PFk5ripoXSytJWbnbzZ58tmKk4OAe
	pOdRD6bshQxHMOxmm5
X-Google-Smtp-Source: AGHT+IH6A6FJXGfT8Zsjwa2/f7hPiOGak401pIC2WoSIqlHjuQJJxsh60eESxFQX7d8Tr6L3Wxf8Ig==
X-Received: by 2002:a05:600c:1f8f:b0:46e:1fb7:a1b3 with SMTP id 5b1f17b1804b1-477c01ee3camr380965655e9.23.1764599504416;
        Mon, 01 Dec 2025 06:31:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-479052cf8d9sm154964375e9.9.2025.12.01.06.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 06:31:43 -0800 (PST)
Date: Mon, 1 Dec 2025 17:31:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Chester Lin <chester62515@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	"David S. Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthias Brugger <mbrugger@suse.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, linaro-s32@linaro.org
Subject: Re: [PATCH 0/4] s32g: Use a syscon for GPR
Message-ID: <aS2myhp8asABFyLt@stanley.mountain>
References: <cover.1764592300.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1764592300.git.dan.carpenter@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_063146_487550_FA47E78B 
X-CRM114-Status: GOOD (  13.66  )
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

On Mon, Dec 01, 2025 at 04:08:14PM +0300, Dan Carpenter wrote:
> *** BLURB HERE ***
> 

Sorry, I obviously meant to write a message here.

The s32g devices have a GPR register region which could be accessed
via a syscon.  Currently only the stmmac/dwmac-s32.c uses anything
from there and we just add a line to the device tree to access
that GMAC_0_CTRL_STS register:

			reg = <0x4033c000 0x2000>, /* gmac IP */
			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */

But it would be better to have a syscon instead of adding each
register to the device tree like this.

We still have to maintain backwards compatibility to this format,
of course.

regards,
dan carpenter


