Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F180DCFC518
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 03:17:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6m8XnT+e+a12kgO1uCENfrTn9a5Y/h61Rpk0gERo5NI=; b=mEXHh2NyEPy903TE1Q5P3xGgXg
	zEeQM8hWhERaUXUMhxPk8BgA+1Di8iBM36gGnnPm8kROYRUlmQj3xyo7mmIv1fo33B2zLjuZiZuyJ
	eU77TVzgEPpJdG6BGL5Cpk0OUhhpgoVlKTKQ0awF+XB+F63WjH0L84YAQNM/cxMeFJ33wSzPSAQqV
	RoaVxPEgT9c26A25NHXqQZpf+y9OZlwqbe/tTB51myRO10ryGsGCyzcoOnWvuAsKpx9VetwTwVm22
	e2YZlg5PM9PR9HHuL+f6AcYQOQrS8iSuTJhsdFvHL50WMKgd24cM6wUpc9dGhXaqskdCWZO+xSEU/
	FguW3mRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMe8E-00000009DYt-3i4c;
	Sat, 22 Nov 2025 03:17:50 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMe8B-00000009DYP-3VZf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 03:17:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=6m8XnT+e+a12kgO1uCENfrTn9a5Y/h61Rpk0gERo5NI=; 
	b=kP8TCZWIw/ZlW1ubCRhqNLJNKTL5A/sz4uLGjNpTM06cFB96q71XPwT3rejwBn9uB69z72+Hyf4
	28vGTymGO+Ug2V6i5+VGKn8aJ8z3ErpLRqdaWTMbI6Hipvt/F+AT1qjeGNWbyKe4ySn5TBjmc2LKy
	Mc+Y2EM0jtAjbK3436yEvXUDAPiTAi/agXCjfqzpeF3MGSKSpauxXE3N84SxR4BHbf0oi8QuVkFhJ
	nrlzAEPC1LdqBHCBIep2B/xothr+XAeAEFNObvuUW9B2tigB0Ji1vf97XDP6DruzhrdKlUkgNt79k
	IPMGVn1BuZ5nLUY1ccWsjhpQhtYC+Hq9LhHw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vMe7u-0056Vl-0X;
	Sat, 22 Nov 2025 11:17:31 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 22 Nov 2025 11:17:30 +0800
Date: Sat, 22 Nov 2025 11:17:30 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: "Jain, Harsh (AECG-SSW)" <h.jain@amd.com>
Cc: "davem@davemloft.net" <davem@davemloft.net>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"Botcha, Mounika" <Mounika.Botcha@amd.com>,
	"Savitala, Sarat Chand" <sarat.chand.savitala@amd.com>,
	"Simek, Michal" <michal.simek@amd.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"Buddhabhatti, Jay" <jay.buddhabhatti@amd.com>
Subject: Re: [PATCH 09/15] crypto: zynqmp-aes-gcm: Fix setkey operation to
 select HW keys
Message-ID: <aSErShjDlRaTEoL9@gondor.apana.org.au>
References: <20251029102158.3190743-1-h.jain@amd.com>
 <20251029102158.3190743-10-h.jain@amd.com>
 <aQwlEgMlYr8EPrTo@gondor.apana.org.au>
 <DS0PR12MB934525C9192C679D5AE681DD97CFA@DS0PR12MB9345.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS0PR12MB934525C9192C679D5AE681DD97CFA@DS0PR12MB9345.namprd12.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_191747_879231_75B30374 
X-CRM114-Status: UNSURE (   8.74  )
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

On Tue, Nov 11, 2025 at 11:57:33AM +0000, Jain, Harsh (AECG-SSW) wrote:
>
> We have two types of key registers
> 1) Registers to save user supplied keys like ZYNQMP_AES_KUP_KEY
> 2) Register Where H/W internally generates the keys like ZYNQMP_AES_DEV_KEY and ZYNQMP_AES_PUF_KEY
> 
> Fallback is for 1), because driver has saved key in private ctx and can be fallback to S/W.

OK so in our parlance this isn't a hardware key and it should stay
with the plain "aes" driver.  "paes" should be used for hardware
keys with no corresponding software key.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

