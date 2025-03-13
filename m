Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F6FEC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 01:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gmh/yp1T+xa5IJ6SgT9wvfwiGO15xa88j8hcZM3as4I=; b=o4eCvYSV3Hs9ANnXc6z8Zvdil4
	Zq5GJJVu+Mb2KiHBhYxhH0ZHojlFFpeURo2fUubp3mn49JHTC28fDulYp9dyeHc527O53/jrvhnEu
	APlgrq+fbaMoJb4izSDQuH7R+qROPGyxN3G8M4ZtMXmUeCPBc7GuHkigVoeUu0IHG6mgCCGYzJk6M
	acq1Zq3qtLqqoPHCj7OFWRL+c6TGIm9fTLfWTiSXxLJT0LuRXiN+zTT4Nkhjia7fwMOLtuKJX9hUt
	vrHurXtB097isUSDaqxiNDvBHMi6Ph+Av5Zc46C+IIxhogRkxEvW7FvBMAQE0VFF9+Gd+5wCdXFYy
	6C4ehNdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsXeT-00000009t8Z-38DI;
	Thu, 13 Mar 2025 01:46:25 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsXcq-00000009t5O-1Il6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 01:44:45 +0000
Received: from [100.75.64.24] (unknown [40.78.12.246])
	by linux.microsoft.com (Postfix) with ESMTPSA id 278AF210B15B;
	Wed, 12 Mar 2025 18:44:42 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 278AF210B15B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741830282;
	bh=Gmh/yp1T+xa5IJ6SgT9wvfwiGO15xa88j8hcZM3as4I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yjno+ko+xkPcFNUwyDamCfrWXtJZZKlTTchkrEoV22obxTFqrZSQeKxTFXHgYnhWZ
	 EsJ2p4VuhDkZEG6qNHMw19y7VZHtCV2q8um5kLXku/TdnLBZvz0f4ygQ4hK0qOur2Q
	 QzurBYqsB+XD5iJkuVmX25jkM0aKZdCBDnGS42yY=
Message-ID: <ff79f33d-91fd-49e5-9a6f-fa2c32c7021d@linux.microsoft.com>
Date: Wed, 12 Mar 2025 18:43:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/2] Add L1 and L2 error detection for A53 and A57
To: Sascha Hauer <s.hauer@pengutronix.de>, linux-edac@vger.kernel.org
Cc: Borislav Petkov <bp@alien8.de>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Tony Luck <tony.luck@intel.com>,
 James Morse <james.morse@arm.com>, Robert Richter <rrichter@marvell.com>,
 York Sun <york.sun@nxp.com>, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>
References: <20210401110615.15326-1-s.hauer@pengutronix.de>
Content-Language: en-US
From: Vijay Balakrishna <vijayb@linux.microsoft.com>
In-Reply-To: <20210401110615.15326-1-s.hauer@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_184444_380973_8308983B 
X-CRM114-Status: GOOD (  10.12  )
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

On 4/1/2021 4:06 AM, Sascha Hauer wrote:
> Hi,
> 
> Resending this mainly because Marc Zyngier and Mark Rutland raised
> concerns about using implementation defined registers and I forgot to Cc
> them with the last version. This version, like v4 already, should fix
> these concerns. Looking forward to feedback.

We aim to revive and adapt this patch series for A72 and A78.  Is anyone 
actively working on this?  Please share any information on why it wasn't 
pursued and thoughts on adapting it to A72 and A78.

Thanks,
Vijay

